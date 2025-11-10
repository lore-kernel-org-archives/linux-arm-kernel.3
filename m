Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A81ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1wGfyaVdsxk2Z9k/75oWbkAnuDI8szZ8sPaIPGsbg4=; b=BzmuVXYOx8CVw48zjJHNLwVlGM
	uP9cmZgMlbX7YwFucEJ7BfdOZdap9ntY5nGkjQXck2MeRY0r/kzFRdbxVgmox/lHdOEW0WSn2ez2S
	JRJO5atsNWihyiPIderCMuq6mGhO44ueufKupuKsb/53AyH+2gPbiLo3v6/n+1LVtlR6ZpjFrqcO5
	EEpcmxA5bJ5MruiyiwGBRR6lyjUNWqaDiyhY8lhc8toue/LviSYPZTeTvUzUcZbwf99+K3EIcRG10
	60RBMFTY9H2Ahe/5dXRiMy/CssUS7I3Eerjn1AzkJ6zbwAkGJandTakDaN6fhPYJHwU1JM8lVTrvN
	jtyfNHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOTS-000000057MX-1cBc;
	Mon, 10 Nov 2025 09:46:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOTP-000000057LQ-08v3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 09:46:09 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5942bac322dso2376739e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 01:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762767964; x=1763372764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1wGfyaVdsxk2Z9k/75oWbkAnuDI8szZ8sPaIPGsbg4=;
        b=rHI2rLXs06LZE5to/2YXXOSh2ZPBHdjjagR3uo5JR5kQHYCWGE6ttgc1GdWlX25+EH
         ggG9/K3Xj5VcjEUYPzcCe2TDzRmtMkO4Iy4aRBG9hxhbiWk50FOmYRVJOUASUw9Z+a2z
         oXzDvLQ/zFxtS6LM2LaLLSt9lyQLrN7fMsPFvPZBia7ulP8L0lXejJwcFwaUwQ/SznSs
         jnn5i9Y9tutKPivxLtjwgamvHpylX1czeDrpJDE9HnrWudRdSQqay8hf4rHnuSJAdXg9
         3G8d0hlpDbAdNG2KL4lOQhkZStWA3q1Bziu7DWq87TzqVPSfEtyZBf4S1FtWX1nM0YOQ
         PKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767964; x=1763372764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1wGfyaVdsxk2Z9k/75oWbkAnuDI8szZ8sPaIPGsbg4=;
        b=u7L61NY3vXzNINCR+Tur3VcvpXl6RSM5nnkTgN5DA9lsisPc8ZWgczG36Vut3/61By
         knbGV3+Vin1eSI9TnkOp4+0UQ9wgQxxqeokzSo9ptdtrdTEqLmCR9WulDpG5IONMkgs4
         BlshCa0nSm6+sfiDLawM/ZIaueb4PR3SBEH3OBnAUFrlAW5WonV6AuCpzxb4u0Kofq7n
         JdxKy22/oCoo4tHgU2O0mWhohO+Av8vTaLCMNlLRyHbEc/ICWBNvZxqI9mIS6k98xVBs
         NsJkVSHE0P3l94Um3F6EaBtINEkJ0l/wy++fNfuZUu3vWbk6zgnLVgPHaGvHk5zLFdby
         4kHw==
X-Forwarded-Encrypted: i=1; AJvYcCXVZ95Ji548njQQAXV5P1aGrm4S0+zgml0TD90ydrTqpZ8A/xMamLZOSfPSbngxVmFUztCPaSwUu0h32wQsZL8v@lists.infradead.org
X-Gm-Message-State: AOJu0YwCuYQBOafk5QhUcvFoIGzgdKUoSViWB47nvmr+fisbsWFCLws3
	HZKXhgNHxgR2tHWMKUcMC5uXsWYsiW7zn95d/RTQnRxOWA3gU/y7RTRX4wptfdXZMIIcERHM0Ud
	mz0R6I7LC94F734Gohb6lUmSpWQGyF/DM/CjW2ILecw==
X-Gm-Gg: ASbGncuCoUvP75EE0R0y0yNKUhujDOIzUDxb24GlD15M2EtK3S/4iY5f1Nbw+y9eYeM
	mtdP8/PKohaS/G4x3uQfSnlYtz5Y4NU+Uimx6PhPEWxiwGFgBD4S8qwxrdWm3EZCuM9J6oLb9BE
	/B9QJJ5L9JRmOhodQ+vCCxpFmQdfcr6SaTX9j+y80i9W++4Gy5+VJp6UKui1WKjYkl1TRy2w0M0
	oIPN9irpjAnAW0fkkFSBsuFl2bbaM1VIparLgbsg1RQ13UK7ztmZ1cWm/fAwvii61VJ5R1M5H5m
	PX7ZU6CLluPfBZF3iBkSQz3ancg=
X-Google-Smtp-Source: AGHT+IEapDIVTd3K1bAU32YeDgJ+hfEUFZ75bdtJQQ2tm2wsLYYaIB9HdEFBH57etQ4VQO2ruXk7jNm7rMa1KIXieBs=
X-Received: by 2002:a05:6512:108a:b0:594:4b3e:2815 with SMTP id
 2adb3069b0e04-5945f1867a2mr1922781e87.2.1762767964507; Mon, 10 Nov 2025
 01:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Nov 2025 10:45:53 +0100
X-Gm-Features: AWmQ_bmNaGfRXrBGj05YeySBEfqaBzH8jnH775-U4Qey4HBlXtV5VLim7kMBPJg
Message-ID: <CAMRc=Md4X-GWpeRgun6zv6dddKFqqrjUSveq3fNOe5AboLAcXg@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpio: improve support for shared GPIOs
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_014607_331626_F2CD9A3A 
X-CRM114-Status: GOOD (  31.04  )
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

On Wed, Oct 29, 2025 at 12:20=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
>
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).
>
> Merging strategy: patches 1-6 should go through the GPIO tree and then
> ARM-SoC, ASoC and regulator trees can pull these changes from an
> immutable branch and apply the remaining patches.
>

Can I get some Reviewed-bys under the GPIO patches if there are no
other open issues? I would like for this to start making its way
upstream if there are no strong objections to the concept. After a
release or two, I'd like to start enabling it on more platforms.

Bart

