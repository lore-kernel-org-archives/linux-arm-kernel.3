Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C248D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jeFjKObZIxjQI8MDJOLbnA26JxWBQgkzlQdkKPNBfE=; b=I5M/+BWzGOOC9PWUh2IGgXFwVM
	TXoAEl7/xkEmU0sPmZ57IaSKsAcilQpX9yTShUuuSvQui2lTbgDplisTikoluhIoALSCfK+fgjkVT
	HY5oQfIg74c1LkrBjf1W6eH0Y2grbPiGmbvwlpnk19wyCXVEderojQ3aNmjr3bPVeKG+7i6wAFkMJ
	6tZKT8ngXwQ4Mc1FV67tl52ZN1mqwjfk24jp6wcZpFHxE3spCKcE1xWn3zH7PlZirC/Nhyy/aqNp5
	ecME44eFVBv0fm8Gu6BjCdBMisHk3p586VZNbvsP1ef3ZU9vc+b/J36U0wc8VCqgWQlM4p1bSZJnj
	oHpQsK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsHK-0000000HaSt-17Sm;
	Thu, 08 Jan 2026 15:50:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdsHE-0000000HaOU-0dJ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:50:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7672D44447
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 15:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C135C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Jan 2026 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767887419;
	bh=KGaO4EypoOGLhlEAtkWsb6d+AORWtthHeHFesJA4a2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=usb4MmHJvMLPE8uELsbbUngRbBgpdUECKMmpwddwY189gnOVhVBEvsoZsN2ANAdRb
	 t7YJmkUsI9dpY6rq3gm5zN+eWtCpnRWzMnswxbZt/3shCn1wvzBb6oYQm2AxSMd8L2
	 aCjReJjs2BJSzqIfnDjwdIh0H+pIVeALv4Qb2w9gNm6PwbE6R8fAcA/k6cuBuzoyj2
	 NhNfiv4Ogfl7hnnK2f4+nk9nB3DplTx6QoLshFLps02T775YICN3NhywEhdZfnZKkX
	 vbjmlj1v8ZjzZvhG86NGzW0fQaG98pdSVWRSeYI9YPWE3FowX1Y01DeD7yYI2lNiZ5
	 Cbw/z69BwcSyg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so3177138e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 07:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDju8RByxpJa/EnejeZ3fI6df3DHD/KtjkiaSxzuh0XCdGHbapDDGcJ4Jr8Y00VYAAYmVotICE72iPfWcd8HU5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr1XyiajuSyrwFoAeruEZ/aTX0nZb0zU5BN3obXRFIimRJqPma
	Y2TT8dMxoxp4dyG6H3YAlx9mtmbOAtYwLmU5veAFKHF976j1amjL/ecQFJtdeOnASd5jhDnmXkq
	T7z0MBWnDV52Og4UhJO3UvgrWimiEPWkTAGFTPKHncQ==
X-Google-Smtp-Source: AGHT+IG2+2F01A/KIFuHK5i46mt9KUdYZatvNxavAnjoIfZZaIpd0eF4zkN5fLaXr4bY1KSJ4MsEy0n1PYP8LkHGkdo=
X-Received: by 2002:a05:6512:6d0:b0:598:f031:dc2e with SMTP id
 2adb3069b0e04-59b6ef02957mr2037319e87.1.1767887416901; Thu, 08 Jan 2026
 07:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org> <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
In-Reply-To: <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 8 Jan 2026 16:50:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
X-Gm-Features: AQt7F2obhuvUlvgUZPHF2Ox96e1T1TX-fbUl1bOPtAWt-u2PKGO9E-yuFxHItZY
Message-ID: <CAMRc=MeQ_zr047PxFFGhfZ43TuHoKG-9VLLefxVyScpO5ZxjzQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Michael Walle <mwalle@kernel.org>
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
X-CRM114-CacheID: sfid-20260108_075021_188337_4AC19D19 
X-CRM114-Status: GOOD (  37.73  )
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

On Thu, Jan 8, 2026 at 3:46=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> >
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
>
> The problem here is that the aarch64 defconfig has ARCH_QCOM enabled
> and thus it will get enabled for any platforms, right?
>

On arm64 with defconfig, yes. I want to make it transparent for
platforms that don't have shared GPIOs though. I'm aware of issues and
am actively fixing all that are reported to me. Another set of fixes
will be in tomorrow's linux-next.

> I haven't grokked everything, but does GPIO_SHARED=3Dy makes any sense
> without GPIO_SHARED_PROXY? It seems to me that the probing of shared
> pins will be deferred indefinitely.
>

Do you have a use-case where there are shared GPIOs that are needed at
boot time when there are no modules? I am aware of the issue where
false-positive shared GPIOs are detected, I posted a fix for that too.
Without logs, I can't really tell if that's the case for you though.
:(

> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
> >
> > I'm Cc'ing some people that may help with reviewing/be interested in
> > this: OF maintainers (because the main target are OF systems initially)=
,
> > Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> > in audio or regulator drivers and one of the goals of this series is
> > dropping the hand-crafted GPIO enable counting via struct
> > regulator_enable_gpio in regulator core), Andy and Mika because I'd lik=
e
> > to also cover ACPI (even though I don't know about any ACPI platform th=
at
> > would need this at the moment, I think it makes sense to make the
> > solution complete), Dmitry (same thing but for software nodes), Mani
> > (because you have a somewhat related use-case for the PERST# signal and
> > I'd like to hear your input on whether this is something you can use or
> > maybe it needs a separate, implicit gpio-perst driver similar to what
> > Krzysztof did for reset-gpios) and Greg (because I mentioned this to yo=
u
> > last week in person and I also use the auxiliary bus for the proxy
> > devices).
>
> This broke my board (using the arm64 defconfig, works without
> GPIO_SHARED of course). I'm seeing two issues here with my board
> (arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):
>
>  (1) It's GPIO controller (gpio-davinci) doesn't support
>      .get_direction so I'm getting ENOTSUPP during probing of the
>      (some?) shared GPIOs.
>

Unless this board really shares GPIOs, it may be due to the
false-positives that will be fixed by this patch[1]. If you enable
CONFIG_DEBUG_GPIO and post the kernel log, I'll be able to tell for
sure.

Though thanks for bringing this to my attention as I now see there is
indeed an issue when the proxied chip doesn't support .get_direction()
as well as a duplicated check in GPIO core. I'll fix it too.

>  (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
>      pins for the root filesystem medium, i.e. the SD card regulators.
>

I'll take care of this is you confirm, the issue persists even with patch[1=
].

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20260108-gpio-shared-false-positive-v1-1-5d=
bf8d1b2f7d@oss.qualcomm.com/

