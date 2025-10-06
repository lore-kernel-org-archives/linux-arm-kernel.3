Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E97CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o88ha/e4gk/j47+reFyIn+VgsrMXI5uaxH81XcB5pnY=; b=cVM980d4XSR0lFUKY0vc+je1ab
	XVHyx0CDo3a64ycpjT7CT5Wnl5PiyiXeNgSWF6sIeavdphVCSQkcm3JvgOpa8bgHjS/n8TXz8f2e1
	ZMmQO7u7AjDhFD01JyzqKgBIqImm/yMBOs/HNyA01f4e/Q4cCQwtckIU+Yz2yEkedpM0OUH5iiYb6
	bFBUEhr/IZvpFR8rgiutP0N28xPCR+lEEAeuQkLIMnmICG9EujzH/nbPRHcvQxz32bDwdM6YglsY8
	iN8v3i8rm+Ml+k8mzd1uLNlxLeVm0nSb0Qs/Qh1DhM8FEO++up6kAdClgVCd9L6KBeUHtrnzkxCsx
	zDjuiwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5joE-0000000HWv1-0Q6J;
	Mon, 06 Oct 2025 11:55:18 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5joB-0000000HWu1-2Iif
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:55:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-36bf096b092so40582301fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 04:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759751713; x=1760356513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o88ha/e4gk/j47+reFyIn+VgsrMXI5uaxH81XcB5pnY=;
        b=0c1pXE5xH3Dj8nDmWZLmPUQjbssHy+llvdEgPjoeu6te6dJDs/tnmtzG+gp5dl16Tz
         Mu/Z2iOKf3aLAixssLPkPV2Hcfm3VSRxIhkJcEA7T+5NnzrlJTW7Z6BAk2nJiY2Xm5TR
         5iG9cNf/+OTiaaV7s/7JAVZ1cWPWp1FZkoJXk4b3c8JN5F2N63g1eCrJ9rbi1NZLscie
         HFqhUUQJHRHYIhWMaElTUwefse+BMay8GjFzXqeI4y/mrbDh6VohUbyKdB81yNGvSxxy
         71ltm39sxcvT94kam4Eo+GbCCaOa36fpQ7iBinkwFjm+KKDA2HboSyzGaEHJGjTRRD+w
         yhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751713; x=1760356513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o88ha/e4gk/j47+reFyIn+VgsrMXI5uaxH81XcB5pnY=;
        b=cxJuTG6Se9JJOXwl54c2o10Nhlop/c98D00lW+qlZQezfNYtmeB/7tBkoPhIypaDcy
         GncpM+hf7w/JWthtgSqu5xwgEwmzX/fsib4dblm3GUQx5bGkpS+1DRekVP52/Kwl28qL
         kLOEJqPpRJHfU8OjTpc9Kwg20REg+uv7UaB3ppQywXvaPkCPFp0iLvpWK9I8Peu4/vvW
         nB5l05Cp/zhuYLue7i3XlMpNQzOKGzcjHfUE03Qq9eaJ7pp/jAdzbLO8zgYeZ1QO9jSj
         EK41DeiRclNor/ivLSCnppHIVNEX0X3Rf1Tgc9OUz2hs937PaZeRY4RFf+0LS/lcf8VW
         55bA==
X-Forwarded-Encrypted: i=1; AJvYcCX3tpDj6OIqfj1vjkLRQirmB0Hf/8nCl4s6G9zkHWVCchypZSRw+/CR5ylHilEmfo0Kjak6Ftyn0Y704f4wVERA@lists.infradead.org
X-Gm-Message-State: AOJu0YzCzFS3Og3V1np3buTUF8pwuc5SSPMox48XqCRmLY7Ecbdx2943
	FI+pk+Yk5IEwyQWwpkRO2Qz8oOvoX0+4bkuRvXZw5Q0A/mEtKAuVRSqdAIfUA/hkjcZ+U5DiahK
	60dIKnpzgqnUp0CJcsj7sb+9as/ryNUj+n2omrOe3Yw==
X-Gm-Gg: ASbGncuiGKoZwZWzdT1zzk+1NGccP9C3wNQXgCMDTupkFERneifk6ki4bQa5pHWWwHc
	rYzVyAV7j8NaffXaKjJ6LQPICBKeEawIC/MX4WLw4RwSA+G6bG24O32eU64WqYw+40v5ySLhUZr
	b0lB6o78Pn70VRrkHozfFuMejxid+10y0izOrbQK03RrXncm8N1j2uqP7x7rUs7C/xBpIthWedi
	ojS0fi2OmbS+Wf7cClOsuvFoXwHcDl0Ge9lMckGVA5kp6k2+czF7mCICZ9ZHsmvQXheZrA1Xw==
X-Google-Smtp-Source: AGHT+IFimUYcDrg2G1TEWgg30XOxFQcNPZ7in8UOx4Uq0QD6a7uE0edrd5tvO1JATw877D2GtEmmVeOuzKJjG1mqPQE=
X-Received: by 2002:a05:651c:1b0f:b0:36f:4c94:b585 with SMTP id
 38308e7fff4ca-374c3727355mr34984151fa.17.1759751712890; Mon, 06 Oct 2025
 04:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org> <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
In-Reply-To: <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Oct 2025 13:55:00 +0200
X-Gm-Features: AS18NWCcgxeUyOPczJhdeT-2OxosYn-Q0vbiWg2Io_Y9VuYPbgrPQiw2FGc9xs8
Message-ID: <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_045515_857014_8E223186 
X-CRM114-Status: GOOD (  23.50  )
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

On Sat, Oct 4, 2025 at 3:32=E2=80=AFPM Srinivas Kandagatla <srini@kernel.or=
g> wrote:
> On 9/24/25 3:51 PM, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> >
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
>
> Isn't the main issue here is about not using a correct framework around
> to the gpios that driver uses. ex: the codec usecase that you are
> refering in this is using gpio to reset the line, instead of using a
> proper gpio-reset control. same with some of the gpio-muxes. the problem
> is fixed once such direct users of gpio are move their correct frameworks=
.
>

If they were called "reset-gpios" then we could (and should) use
Krzysztof's reset-gpio driver here, but we have many cases where
that's not the case and the names (and implied functions) are
arbitrary. In the case addressed in this series, the GPIOs are called
"powerdown". The second big user of nonexclusive GPIOs are fixed
regulators where the line isn't called "reset" either. There are also
various other uses sprinkled all over the kernel for which no good
abstraction exists or can even be designed in a generic way.

> Am not sure adding a abstraction with-in gpio framework is right
> solution, But I do agree that NONEXCLUSIVE flags should disappear and
> users that are using this should be moved to correct frameworks where
> they belong.
>

I'm open to suggestions but DT maintainers have not been particularly
fond of creating "virtual" devices to accommodate driver
implementations.

Bartosz

