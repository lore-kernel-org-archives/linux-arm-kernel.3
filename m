Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233D3FED2DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhmSSqyTZsLH4FxWnn6ZWKyXUPFT4I9kTVvZ5e/WxLo=; b=Wtymvpr+MFDZ4x
	0O9qBdxqt0zYRwj49KzpMcklDe5/Y3go0dE/oe9v0LH4Hhr2erR7I0CWlfccfvTfO6l3URgP/gAH/
	dYo0T+55TgEiLzuTKT4y41bfN6JWNw2ndZeA9LnLro3JhhfEfPUknEALNEhYRMPNTif7Zgv4j/Lq7
	HqLYIlQbvfQRXT//ksmbT0L6p/bmQR4PSZ1L1LsmqK9NcYb2nkX4NVW0vmWKCGXPdH8MZUK3HvBCL
	ZjeGY9Mb6i/AEHGVCqGbpEl813ikvLQGixOkb4Wurzb5BlwW1wT0QafpdxnrXjx96AMou/PtnxTQe
	mB+RfpqyQ1/kw1kX0qnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0anw-0000000DYha-3PU1;
	Thu, 12 Mar 2026 07:50:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0anu-0000000DYh6-1Jmb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 07:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6805544503
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 07:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C138C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773301797;
	bh=6IYFfwHT7GC11o3ixg81r2Tdimt3C3w5aJTuLQpk1u0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=C8L1Z5yyU7/3y6XMu4xoChtq8wlWQ+GGJKdFVfCKAmgzyOSNShiGjTjTpAzy8Dt0j
	 V/hZ9b8ZZFYIqtGDk7TpRgHXoo3u7+OFbXxjwACz3KUmb1Wiz3/CbQV3ow/dB/3JKR
	 4G2YIWU3BfWch60GFrR6WH7lIckK6FB7Nx33gEYMjHeQqfHa7vKYTFAUL8gaQEowlV
	 24lHqTfQXZYnpgs2kmVBoIIh2d/Pnmbl7vCJ0IZUhLvFxAeHToFpxn2wv0tS4YnO7Q
	 KMrlxXaCiqbPA90E3sct3jb2+q8ZHffzeQZJtg0CN0aJkZHL+S8Oe0deeIeeVbwbhm
	 ixeSjd43RwkZA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a12c19affeso1316195e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 00:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU22RC0ugtt9CGebXiZ46smmtTYJJIUy77dt85RhG4rMT/fBCLNvvkiavBEhbnJkYS9fNETen1HjI/IVvHXyJ6k@lists.infradead.org
X-Gm-Message-State: AOJu0YzHpp94+/i0KXGUhNvD+0ZE1aAB1T18koVLdAroN/SjLN4Jl6ta
	TQIAuvLtaM9qKg1MmB4R2hux5wrCHJX53rG4wb1MbS6APc8Q7NB1/SdC7BZH5RaghpcyK8JZx/A
	8PmO4rJXq/Yk9kWS9CzpIA8zS57zQGaY=
X-Received: by 2002:ac2:5687:0:b0:5a1:355d:674e with SMTP id
 2adb3069b0e04-5a15a2a0165mr773684e87.9.1773301795178; Thu, 12 Mar 2026
 00:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com> <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
In-Reply-To: <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Mar 2026 15:49:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
X-Gm-Features: AaiRm522PQSxl3c04smbSK8wNkblw48lRTJo1ov5ZP7oM8loD83ShDCNMBGhZgc
Message-ID: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Jon Hunter <jonathanh@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_004958_426684_2E7CA705 
X-CRM114-Status: GOOD (  27.18  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2026 at 3:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 11/03/2026 20:14, Andy Shevchenko wrote:
> > On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> >
> > ...
> >
> >> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> >> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> >> are assigned a index by the kernel from 0-163, but these GPIOs are
> >> not contiguous with respect to the device-tree specifier.
> >
> > If I may ask...
> >
> > Why? Is it sparse because there are pads that can't be used as GPIOs?
>
> It is purely how the different port for the GPIO controller are
> configured in h/w ...
>
> static const struct tegra_gpio_port tegra234_main_ports[] =3D {
>          TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( B, 0, 3, 1),
>          TEGRA234_MAIN_GPIO_PORT( C, 5, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( D, 5, 2, 4),
>          TEGRA234_MAIN_GPIO_PORT( E, 5, 3, 8),
>          TEGRA234_MAIN_GPIO_PORT( F, 5, 4, 6),
>          TEGRA234_MAIN_GPIO_PORT( G, 4, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( H, 4, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( I, 4, 2, 7),
>          TEGRA234_MAIN_GPIO_PORT( J, 5, 0, 6),
>          TEGRA234_MAIN_GPIO_PORT( K, 3, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( L, 3, 1, 4),
>          TEGRA234_MAIN_GPIO_PORT( M, 2, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( N, 2, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( P, 2, 2, 8),
>          TEGRA234_MAIN_GPIO_PORT( Q, 2, 3, 8),
>          TEGRA234_MAIN_GPIO_PORT( R, 2, 4, 6),
>          TEGRA234_MAIN_GPIO_PORT( X, 1, 0, 8),
>          TEGRA234_MAIN_GPIO_PORT( Y, 1, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT( Z, 1, 2, 8),
>          TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
>          TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
>          TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
>          TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
>          TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8),
> };
>
> Each port can have upto 8 pins, but some don't. Note the last number in
> the column indicates the number of pins for a port.
>
> >> For example, in device-tree, if I have a shared-gpio with the
> >> following specifier ...
> >>
> >>    gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
> >>
> >> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 185.
> >
> > To me it sounds like a bad design of the driver for this SoC/platform.
>
> I am not sure why you think that. Assuming a 1:1 mapping of the kernel's
> GPIO index to the GPIO controller + h/w port + 1 GPIO number seems fragil=
e.

If the hardware has uneven number of actual pins for each bank, either
you end up using the deprecated static GPIO number allocation and
have holes in the GPIO range (sunxi currently does this), or you use
dynamic allocation, which gives you no holes in the GPIO range, but
not directly calculable mapping between DT and GPIO numbers.

The driver handles the mapping by providing an .xlate callback. A
consumer shouldn't assume anything. The shared GPIO library probably
shouldn't be try parsing the property itself and use the result to
grab the GPIO descriptor, but just rely on the gpiochip's .xlate
callback in some way.


ChenYu

