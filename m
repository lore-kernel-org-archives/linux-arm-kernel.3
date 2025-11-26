Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3877D10F5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=; b=499VfpN1EeHp+bRUzZh6cCgBEu
	nclRknoWf8lZeBMZ+Ot0Ai5bekFO6+Dc6P7id5nHlPF1Ph3wGWVrld1fyJHIsG8sGZBBf8jgVd8tf
	HLOTq37Ks9yOBlEzuR8IxA5+HpgBbfP+0MplHLL+7U9U9yFaw7g7yFZmVTwVAXBJkO3lJt9Mw9d1o
	wMWTGGvcnfve7RBFv9N93LO9Wl2L8k/CheBRy17t9eZC6sPFEnExqARSkSNy/nILNI6i8N5+sMazu
	LDLfzVWBglRa7EKbwDhvvLrVAdDp8w5qyQpvg140j68ICUasLiC1eIit4ziC4j6gPoHDpphDKuzZK
	Jj/LmZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHkY-0000000FCpY-1not;
	Wed, 26 Nov 2025 15:48:10 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHkW-0000000FCnz-0srD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:48:09 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-37b999d0c81so49303751fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 07:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764172086; x=1764776886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=;
        b=u27ZGP3W5BtKTMtYJhH6gifajuRboz/LL7BKdRkSTxwtiJ4EGJ3WZT70YqZAbtjGAh
         XCmY5Fd9ANv4/A3M0eElLO1Fvupr9E+0PL4kiECQq0fa0bixnXn+tz3eurflR6X4p0n4
         UI5D/DZlBY+fClTsCXcI4scTgpHdXm2kcbTPNqunGGDLuzbiwSH4OTNryS3m0KX1M0Dx
         oLwQZZPsvgKxJZ19rAhbPFKkaVLehsvgfmcHgoeOG0FjgPygKklEXIMW1+LBatklYCsm
         fZruc2ZXpr+EGVriSbxMEozAfn24gTGEvHbAq+o1E4ctkRClaTDm8/FiOWuFsxRRqInh
         fRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172086; x=1764776886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFuVp5mjywP+NMccfEdA1smMO0SeI/6ihvGyik/4sgc=;
        b=bIEbr2tIfixwmPPhf9vY2ma3OEarsigBYgbivRLEw4y3GXEY6ocUEwg9G/KSC9/ykA
         1wjfuotlKXjAVkBzKK97tkdDVzRSokbbfHM+dgT6Q4WTEKiBaxtvN9ER5hP5o5hWtOio
         Z5Zcqa8HNH1vz43tbO4lq9RwjK5hk1/Vj4oqCz0DpLkMTn/23lXbcxPQasmEB3up9Rfg
         KTmQna5zN06Q4TVLUTlHmSv1FZPegEqQ/JeWeFKUlcBuOj4fL8rmjlOvod2+hjYUV+ZZ
         d/tjAyJrtcXEbB0o7rS2JakujFPgUqwY3ax1jlUZkaP9OZMHXQ9WnuoRNw4sYDaOpKZ7
         R48Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7egPIzXVsulj4OOwFyaRqGTvMdMsKN5MGxxLBZCSiGzqZYTSuMihD5uKGPSMjg6SPTqwJBdQtrS8E7UkaHO00@lists.infradead.org
X-Gm-Message-State: AOJu0YyHIAYLcPSM2aI46QdAiYJKjDZ8utCh6iK1HLlTMJ1O2f/eHPl6
	rg5xkV3v+fdcmXNF4UWZzXvr7eElKCSEU32etlJjbOkjNYIM6Wr10dNF4bF3fOsrJVv5PgvQyzf
	xDUHS9p4xEWypzj0XYuJRFGxyNd3LW/2IjP0QzqoLdg==
X-Gm-Gg: ASbGncua3zFL8YxlnOUCRNvHHeudQg/rRUs615xqEi1ZbxMKtZHCgBVWrgnWJdQhDV5
	mub+++6zPp41o4SVTbNqR1g8yUCz4ACZgYK4eVt9Ca94nUv6dnZTriysH6co4Y+t2geBAFt6FFQ
	sMjzYsZUYk48sgAvtI/6RBRT6nb27pUeREE2TV5H585yex5DJMDp/IrH2vNXiTOTcSO2yy/7I0A
	gr1TbwsE1pZ8b93CUJL3Spx+VIohzzUiakeYXE5+EhC/ZHZ5+3wGXKvHn+jUWgQ5j/ueSLtNuG8
	4jgXNJ70u0bNolukSIrL+GeHK+I=
X-Google-Smtp-Source: AGHT+IEhUl1jNda9/yp2GCLrKXBikNNwXFAiy8yPxeZdtimGdt9zzATr5ITlVaihFGQ0IjBdRUtALikJOU6Bmen20go=
X-Received: by 2002:a05:6512:10c2:b0:594:51ac:148 with SMTP id
 2adb3069b0e04-596b4e5618fmr2340043e87.15.1764172085977; Wed, 26 Nov 2025
 07:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org> <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
In-Reply-To: <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 16:47:54 +0100
X-Gm-Features: AWmQ_bnK-S4TlEVeOIf3ITE7TZsWB2TJ1MXZpLcLB_4C4obVKenyvukRrMrvtB4
Message-ID: <CAMRc=Mexa9eSe+qy9dm_q=+gBKtc-EZ7M0RXsgSe6fhWj1FV4A@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO support
To: Cosmin Tanislav <demonsingur@gmail.com>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_074808_271580_105FD879 
X-CRM114-Status: GOOD (  20.46  )
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

On Wed, Nov 26, 2025 at 4:34=E2=80=AFPM Cosmin Tanislav <demonsingur@gmail.=
com> wrote:
>
> > +
> > +             count =3D of_count_phandle_with_args(curr, prop->name,
> > +                                                "#gpio-cells");
>
> This call causes error messages to be printed for gpio-hog entries, like
> this one from arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:
>

Thanks for the report.

Please trim your responses to just the relevant context though, you
included the entire huge patch.

>         sdhi0-emmc-iovs-hog {
>                 gpio-hog;
>                 gpios =3D <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
>                 output-high;
>                 line-name =3D "SD0_IOVS";
>         };
>
> For gpio-hog entries, the first element is not a phandle (gpio-hog is
> already under its parent).
>
> of_count_phandle_with_args() will however try to interpret it as a
> parent either way, causing the following error to be printed.
>
> OF: /soc/pinctrl@802c0000/sdhi0-emmc-iovs-hog: could not get #gpio-cells
> for /soc/ethernet@92010000/mdio/ethernet-phy@2
>
> RZT2H_GPIO(2, 6) expands to 22, or 0x16.
>
> Coincidentally, in the decompiled dts file we have:
>
> ethernet-phy@2 {
>         ...
>         phandle =3D <0x16>;
> };
>

Yes, because behind the scenes, a phandle really is nothing more than
an integer.

> Maybe a check for gpio-hogs should be added?
>
> Something like the following before the call to
> of_count_phandle_with_args().
>
> if (strcmp(prop->name, "gpios") =3D=3D 0 &&
>      of_property_present(curr, "gpio-hog"))
>         continue;
>

Yes, that's a good idea, thanks. Let me cook up a patch.

Bart

