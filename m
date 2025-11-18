Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B96CED624
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAcO7q7zqxgeS0imixs883Z4+k4vz8bf0wnP3745THQ=; b=0UulZ99lMbXb+W2+/mmbfV6Kxh
	IUw6p4eeSh6gk4IgUxrop6fKdU7lyfaZuk1qQS5ijmE+xAryf/c0oJ1cqHFoMNSUyPeERbmKG2Ak4
	hh89C8hqLb1Aa2A3Tj+waHQ8Sl6Gno7z9qjFpMGhiINOo4dXpl8vkxh+sY5rWf5Q9ANdSNW243Qwe
	YDr53Esi6djpatxu87OFUsvhWqJx8CTL2GlXVxLERVNuHGG2L49iOvgdC9b6Uk6VkI+9TJ1IJlO6D
	dK4+0IzlzZ71K0sEau3RehwvgrQ9dA904xlK6Iwl82vLE45Nz6a6TBPc2mykLb1M5MlHrihz7tYMr
	LlbfGivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKJ0-00000000Mzy-3HM7;
	Tue, 18 Nov 2025 11:55:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKIy-00000000MzQ-3rm4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 11:55:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-59583505988so6025370e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 03:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763466927; x=1764071727; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAcO7q7zqxgeS0imixs883Z4+k4vz8bf0wnP3745THQ=;
        b=n7BYxjbNBDh4XE8vtXyKvl3nA6M4J9CBc7fe79wngUuCH+fI6RmSsTC5ylROCLxOEK
         YV8LITnE5xD2L5F3ELrWxBrrbqSU1KI8ZAslOJ53cpUY7syiNIVTvQKXFRZPGuv5tkVG
         owqvATQ14UPoMleemWs4v1R9lFqY6BNaVOc00gneBwrKelJ0qupVkZ6MaGDg9qAPtKyg
         XjhXmimukcqpZdq5wKC+SyxbVUGzWoR6vrpzC3EoGcGTjuI62Ea2EaTkx2vAZwktwmc/
         nWvDLabiTni8Sw01rGM2Y52Yugg79pAzkoAMDI49w6EVv8NX9g5zDS1P6B5LEw2anjgK
         Xi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466927; x=1764071727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VAcO7q7zqxgeS0imixs883Z4+k4vz8bf0wnP3745THQ=;
        b=s+i0b0hjX0lTCzep5WePOO/6lfffmAeR/iHMYSD0gweAflqLICPSMChehmF1Mqvq7/
         XER9GyNndY2rwYhRT1D8L+JiZrF+KJ1mQYK+K2yfHQv1TWvz2WHO68FaYT9Jy6asYp4H
         bvaMME8c1uufbvQR152EVIQPnLSsU2GfAH+v+JRMreBUk8wVR/TgZN+eA8QVOZe6l/vE
         3h/DNr2sGp6BNbNXVjjnBAgzP/DLAaMYHcgmEgXDaocIlYDndCgYPIOvVOtdG+dScquF
         wzAQl0tgTxu7qQRmwkHe+dxSjkpF3t0w2lfNlccpSHk/8OXUynhE55/CyEO0vWtw4xu0
         G0jg==
X-Forwarded-Encrypted: i=1; AJvYcCXq9u6r8Z7HBH2HyW1nF7yrn1OlILQikdcQNB0zLwYZYytCvIXhQou0VI0X/lAMceNqyoNFUfrFsuWyqGF6JwIb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Waunrd3YcepPfTeDLLIpi39dS+G0LG/g0wU64fMXyNNig6h7
	MFsh5oChW06gt2bu8uU3cHWtiihW6qXWW9Kf30H+8XJmq5h4ZRlzvHdkYkieXyikb+Ikaq3ILWs
	sVgbLuBC9oZ6l1Df01rW3TdTR3KXbv/j2jVXpH1Yjbg==
X-Gm-Gg: ASbGncsNO/SD8pGAZrEjzDXRJaW2gIpLboE0LTQm6bRwAUd2cCyI9mYtXQfqw/twQuw
	RJkHt/viVcCfCXAud0PmuBZiDpyX9N3qkp15dETJWBs+f1+CvK+t/sQR2Qi2yhpFKtqOdZhf4UC
	Ma7oyIqa7/GKA4tCaZ2xiNWBJ0UXVHFPYx//snUDOw2kQ5oYPFRuQF5YTzyurdbspL1CauPJVFb
	8aqWbakj+cy/0vaBM6WyNTMwyqDpY2uif+fazMquoZiRQHTvTIyCFWRvCGXPuzsb4eL/yrc8zMS
	p/D8oXGMoX3tAeSdF33HkQtnwof9aMW0YD2FpadEYLLklIM=
X-Google-Smtp-Source: AGHT+IGDj1fu8TGEfRae1dCaea+bpUY0Apdk1ZxozSAuzubtr5iVRx8MiJ8vS3jXjFPu3bh5BDU2zV53DZhLtQaNGVE=
X-Received: by 2002:a05:6512:b86:b0:594:2cf5:22be with SMTP id
 2adb3069b0e04-5959874bce8mr962524e87.8.1763466926615; Tue, 18 Nov 2025
 03:55:26 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 12:55:13 +0100
X-Gm-Features: AWmQ_bl_VSi2dixCvr3uCiITk7ZJGEZEI2dpEDQt1kKit_562qgby4AFxFkY8D0
Message-ID: <CAMRc=Mdo__Yzigqoy4xKt0LWSvES5Jse1HeXkePfhiWyiz6tBQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_035529_226151_2E3D64D2 
X-CRM114-Status: GOOD (  36.71  )
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

On Tue, Nov 18, 2025 at 12:16=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Bartosz,
>
> On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> > came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> > this series however impacts Qualcomm platforms. It's a runtime dependen=
cy
> > of patches 8 and 9. Would you mind Acking it so that I can take it into
> > an immutable branch that I'll make available to Mark Brown for him to
> > take patches 8-10 through the ASoC and regulator trees for v6.19?
> >
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
> >
> > The proposed solution is composed of three major parts: the high-level,
> > shared GPIO proxy driver that arbitrates access to the shared pin and
> > exposes a regular GPIO chip interface to consumers, a low-level shared
> > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > that attach to the proxy driver and finally a set of core GPIOLIB
> > changes that plug the former into the GPIO lookup path.
> >
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
> >
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
>
> Thanks for your series, part of which is now present linux-next.
> IIUIC, this requires the direction of the GPIO to be fixed?
>
> We have a long-standing use-case on various Renesas R-Car Gen3 boards
> (e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
> key switches.  Basically, the GPIO is connected to:
>   1. A key switch connecting to GND when closed, with pull-up.
>   2. The gate of an N-channel MOSFET, turning on an LED when driven
>      high.
>
> Hence:
>   - In output mode, the LED can be controlled freely,
>   - In input mode, the LED is on, unless the key is pressed,
>   - Hence the switch state can only be read when the LED is turned on.
> If you have any idea how to handle this, feel free to reply ;-)
>
> Thanks!
>

How is this done currently? Even without this series and using the
GPIOD_FLAGS_BIT_NONEXCLUSIVE, the descriptor has a well-defined
direction so it's not possible for two drivers to request it as input
and output simultaneously. The second requester will override the
previous settings.

Bart

