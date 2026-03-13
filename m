Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D48C105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+AwSNKsqP9uyMoi7wCDO5D3Vl7M45gc8Ac0Z6peUks=; b=tbWbsycINXfZZXWt27PYJVtw1H
	n1AB490oSFUGSafGFH8on7F5YA7QyG+uLqnuV2be0VUl9hlVd3wbbvHyZadP6NUxozgSPJTrRw2Rd
	7uGbgr2qa+5lBW2oUbtQuF1ijY89zxqpuAs+6uNk66vELA4P7VcuEe+9Qp3gEgwLwEJBTRkhcOnKt
	excx3Z3Ypq3N8Lufv/QvZIFmIzC+od3g9yj2IDULkPi/ifAqI03ccEFO4Y/z/1ZGrga6kDTVb34i+
	FTK8LKFZupays7JFsOCNo1Vl4FCF163RFnsG5eJedB6LyYAI8h5fRvRofe4HkW8KGeptg2s9uQvA8
	A8Mi8Oaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Ln-00000000MJ2-40oU;
	Fri, 13 Mar 2026 14:18:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13Ll-00000000MIP-2BCi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99F8E4428C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 14:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46846C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773411528;
	bh=fvTckkhnbMq7uwwzCGXCJrHYXs6JuZFgC85Jq5N7fRc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iddmFkQSvfDZ5tAUcQPT7ytL++/j+bt2pfQq6lR0Dr5BypBlOdttcfzqiR7LGccYs
	 ky+pNiZdDRvggvpMDrGrTPwK2lcMznUD/C99Ev2PwFxoU3oTIfCWTpo3XVRUbXPDcn
	 2pz6+dngu+lLbi0lptawYJrBGgKii+fMwwPoCK6DOw4aIvtJBrs6MZDQujb7o7e1M0
	 7fghieu/t+TkvLUPk6Te4rONoodESQT9v+zTG5ZC3E/wD1Y3jEXD+MuMpwQh1y1izl
	 NYW2a/MR3RY4Tyrlu6Hz5XUT/EQ6itr3vOoJ2E4/SaFBosL9Ry/ca653O67cirHcVB
	 sZJY6H4HaYHXA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e4989dacdso2583642e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 07:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfq8jSyDDs31L7XiZSMt65qGjzVoh8b0eoKjFS0uWN8N7d+C5isI8gQYo46j+GCWYg4SAJ4D0oy38P2nj20ix+@lists.infradead.org
X-Gm-Message-State: AOJu0YzrFFV+bHC62ADyURiBCtIqKAE7YsSE2S9uq4NFB1ALPdefi/Gt
	WhNFuBxOzb0hCabJ1jdpm+WvJC/ohIHlMjBTXcRcHVNcm6H1tkK5HNJi3ndFGxPs1XTIBic1VWV
	SEM1DmQPcYUo9k0ior6OOZ/dJLllJzbUY0WNCzLYjmQ==
X-Received: by 2002:a05:6512:6190:b0:5a1:444b:bcd1 with SMTP id
 2adb3069b0e04-5a162b0c218mr1375016e87.31.1773411526639; Fri, 13 Mar 2026
 07:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <921ba8ce-b18e-4a99-966d-c763d22081e2@nvidia.com>
 <CAHp75VevThmDMm6VoVB9P0YbUGGGsmgnzr2gn9=1xtJZt-kuQw@mail.gmail.com>
 <64f6e02d-c7cb-40cb-b1fb-2d3523433c66@nvidia.com> <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
In-Reply-To: <CAGb2v67mmt=X8rbsUo+Gwe6uHXTNpBFGzBbrXZYEGsftHL4Ejg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 15:18:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfVUYm2KJPE0qr1++RU4tATSxEJu-Wz45AKf==OW0feoQ@mail.gmail.com>
X-Gm-Features: AaiRm5020hW7M7HXyH4EUOwtitIyz-fbkO8QSv1lOH4QtHUGeqFlIE81Bq7dwyM
Message-ID: <CAMRc=MfVUYm2KJPE0qr1++RU4tATSxEJu-Wz45AKf==OW0feoQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: wens@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260313_071850_399024_2CAC9F1D 
X-CRM114-Status: GOOD (  31.94  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2026 at 8:49=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Thu, Mar 12, 2026 at 3:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com>=
 wrote:
> >
> >
> > On 11/03/2026 20:14, Andy Shevchenko wrote:
> > > On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Jon Hunter <jonathanh@nvidia.=
com> wrote:
> > >> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > >> On Tegra234, the main gpio controller has a total of 164 GPIOs (see
> > >> the tegra234_main_ports in drivers/gpio/gpio-tegra186.c). The GPIOs
> > >> are assigned a index by the kernel from 0-163, but these GPIOs are
> > >> not contiguous with respect to the device-tree specifier.
> > >
> > > If I may ask...
> > >
> > > Why? Is it sparse because there are pads that can't be used as GPIOs?
> >
> > It is purely how the different port for the GPIO controller are
> > configured in h/w ...
> >
> > static const struct tegra_gpio_port tegra234_main_ports[] =3D {
> >          TEGRA234_MAIN_GPIO_PORT( A, 0, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( B, 0, 3, 1),
> >          TEGRA234_MAIN_GPIO_PORT( C, 5, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( D, 5, 2, 4),
> >          TEGRA234_MAIN_GPIO_PORT( E, 5, 3, 8),
> >          TEGRA234_MAIN_GPIO_PORT( F, 5, 4, 6),
> >          TEGRA234_MAIN_GPIO_PORT( G, 4, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( H, 4, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( I, 4, 2, 7),
> >          TEGRA234_MAIN_GPIO_PORT( J, 5, 0, 6),
> >          TEGRA234_MAIN_GPIO_PORT( K, 3, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( L, 3, 1, 4),
> >          TEGRA234_MAIN_GPIO_PORT( M, 2, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( N, 2, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( P, 2, 2, 8),
> >          TEGRA234_MAIN_GPIO_PORT( Q, 2, 3, 8),
> >          TEGRA234_MAIN_GPIO_PORT( R, 2, 4, 6),
> >          TEGRA234_MAIN_GPIO_PORT( X, 1, 0, 8),
> >          TEGRA234_MAIN_GPIO_PORT( Y, 1, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT( Z, 1, 2, 8),
> >          TEGRA234_MAIN_GPIO_PORT(AC, 0, 1, 8),
> >          TEGRA234_MAIN_GPIO_PORT(AD, 0, 2, 4),
> >          TEGRA234_MAIN_GPIO_PORT(AE, 3, 3, 2),
> >          TEGRA234_MAIN_GPIO_PORT(AF, 3, 4, 4),
> >          TEGRA234_MAIN_GPIO_PORT(AG, 3, 2, 8),
> > };
> >
> > Each port can have upto 8 pins, but some don't. Note the last number in
> > the column indicates the number of pins for a port.
> >
> > >> For example, in device-tree, if I have a shared-gpio with the
> > >> following specifier ...
> > >>
> > >>    gpios =3D <&gpio TEGRA234_MAIN_GPIO(AF, 1) GPIO_ACTIVE_LOW>;
> > >>
> > >> The macro TEGRA234_MAIN_GPIO(AF, 1) evaluates to (23 * 8) + 1 =3D 18=
5.
> > >
> > > To me it sounds like a bad design of the driver for this SoC/platform=
.
> >
> > I am not sure why you think that. Assuming a 1:1 mapping of the kernel'=
s
> > GPIO index to the GPIO controller + h/w port + 1 GPIO number seems frag=
ile.
>
> If the hardware has uneven number of actual pins for each bank, either
> you end up using the deprecated static GPIO number allocation and
> have holes in the GPIO range (sunxi currently does this), or you use
> dynamic allocation, which gives you no holes in the GPIO range, but
> not directly calculable mapping between DT and GPIO numbers.
>
> The driver handles the mapping by providing an .xlate callback. A
> consumer shouldn't assume anything. The shared GPIO library probably
> shouldn't be try parsing the property itself and use the result to
> grab the GPIO descriptor, but just rely on the gpiochip's .xlate
> callback in some way.
>

Yes, it's a bug. I will fix it. Thanks for the report Jon.

Bart

