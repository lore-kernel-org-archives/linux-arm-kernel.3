Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB81CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=; b=it/7x8TJOUmFJOYiAoOXmJGYVT
	XrKJVrHixNBGwdSN/HsSlwmwNj1vCA94nVxHZEMWfwFkCAYKRfPFVvxEUZK83RCdKFRcUtJ53Sb8s
	hmQrGxYSAXkCcC9fu4ePljhR7ilOMfvgv7BvjnbWCRLWbkMlfVBZ1wgP/ZpWDMuaItCszmnanJNJl
	CVkUPMfuwWykZK5ldQEIh+Dy8dqJLwODrB73ASgz62uP4LWyAKaWAYAysPt2tumBI+h9PYjr+QZ09
	ciwZXCMeOs1DVFTsM0YGd0juPWXbxXVRH/ooLcqb+fl0H90BxZmDqMxoTGjtsqltWpzfGZndjkV2A
	L9GJmFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOQb-0000000CKJi-3EJu;
	Sat, 13 Jun 2026 13:29:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYOQZ-0000000CKJN-1gFB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 13:29:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bf125989f2so14365515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 06:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781357374; cv=none;
        d=google.com; s=arc-20240605;
        b=VvA7Tr0iqiFe3kvIE53YkB3qiKfqNiWcsMN3/KHqXswm8/in/ea9m5huBeoLUjYhg3
         VGK1Of8B8jN9YfaYECarpvdtMFPwQzlqJ9WNLEHFTdQKsHgM0RJQjDACKgr1Aaa+ZJ0F
         DAzOMl7cMwnpDSvpC4Enbax2ewACkfiyIGrEJRvBZcBE8RGa8u6AgKpwD3Z5jwme8ScR
         +qpILpxzxXcd1FUScqsonCBfCV+0h1XiDhS6enVzioPz/lu7XTActYW8tfCHptWFWMUQ
         KvdjOe1szXgDrPJpaGvbxMKE8P4PxrmPhAjdsp/lCr09Zfroty/NcEqqN8A0n9Gvz/UX
         UtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        fh=Fxjmkht5sqKS3nJfVdTo/df5qyUFiWtLLvn13+5h+wQ=;
        b=HC8pC/YF3ESUk4Mxw2O8238USg8i6P7FN/FlVaur37o/46z8FlaK8FCpbwb9FKJcKJ
         ylu5A4E1FuBk6kye4T8EqnX6mzfM50yejY7fdv42HU2/rm0YYFCrrh1nawlrRMybmlzu
         lRJLT2Xbl1F7DBgLhe59U9pDUbVb0p8sagupr6jPxKfwYLcUlQfSdc5Sx7G0Htd3p/5v
         iIjqu8bJ8Qq+8EdZDHVqQS7E0KAiuAqANyed3yP0xAuC5somt1A0dG/BpjN243t9RnvE
         MjcfUXu1Tsrtf00ODm2YL+BFivJTEdEWrSXpWFwrF2mUjEnxjTbDVLPE0oEbMAdq7r3L
         oxwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781357374; x=1781962174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        b=gIWOsEv8/0FRmS2rozIDAr03wrGjDIfxm84jiT/v6JKpcPZCt1fQAq38vBdME4BX/m
         qVirvvMJToTXcvpA+zb0MyBjxzXAcobvmUqkuBJhaw0ozwRFIj6UiJ/L4Fyl453SVNnu
         jw0po4y/403CcbbPjn+kaTD3GDWwsU9Q2JsUp3Qdt/MAMI/aGatH+fE0MXVcmkiSvHuJ
         jSHeS40Gaog0vVgAO8fu5PndXYbfN+BAUUApk8hGi4QNkuGtcVNql4vaNwu03AIw1ZRe
         OZq22if/usyLJaJoPnVTv3+tTp99plUJEbVcP7KD4GnUPBZpXqlzTJu7udo6Jeh0J5HN
         OcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781357374; x=1781962174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        b=HME5sBeeLAE9y9NgLmHARPsjCgv0So8bpRKwc/LhDo34YMt01gSMe29YdE2bNJ26uW
         wjgZSzvgtV2qkjU8SCqdlQGn9wgfkFk/tUdqTy16VExk3Qh1XU3fAGajsbVuHX/WMd5x
         Hk/SSlg58Wf0hW09wAKru3YqAKL/VEMPb3BqZJ+4qzLGMUv6Z5//mHZA5aoNNV5hjZCb
         caGhWuhzm5hBnOm5C8D683+lkJCeMRXBp7ESEf7oTlePXzJ01Apf6CJVXA78w2W6EreS
         r/rdY6tgTLCzX42AD1Lr+z1DHpNupG73lH6xrL0iumrm36OcEjE9TJex1pLoe+1kxM65
         StFw==
X-Forwarded-Encrypted: i=1; AFNElJ9nNRHGCcUyPbUYIm5e7xcwSgBWiNnEygTiFNmwTxhuy8dKMJn1VQWM31oKDpqh27HSFcSmRuCJquUCsvP2Z8Cg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1t4ndVZxMChHPtXULjAvGxFMOcneWgzi34VSDCfASCuZAioe/
	zcMQQ3OZMCIvsk9PaU7y64Wj8RBoInbwnH1IDyfUpi++6Zo/1xsHVpuq2cA6IuIeDPLKll6MPyb
	Tc39RVwO7g8Ih65Av9+Ph2PpUxxwl3JU=
X-Gm-Gg: Acq92OGElv9URv41AQSeNu6tPEN00dSXQaGSHBfeb6ZCxGZRSr+xc0T1Ulc4RzQcv/k
	mboEIyYoC7kfMPYj0SE+ON/g9MyasS2UFvsONXpYWzT3sAqPAFbq8mJEai7rIfAtvNg4znkv1X7
	/xNBnpyaxnBB723OsvEIsMuVKzO2xFpHqE3621GlCFm5/5Qafw3cANK4O9xp4vFopPv3ZaESGvC
	Pk6kHuDcxfvz7J9E+OgP1/wGjoKko6NtLCPfoWmrnga2RrXOz75jOrzaVTdDFgWlVyh3Kh5Ay70
	QFG+
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id
 d9443c01a7336-2c413eb775cmr83686445ad.34.1781357373928; Sat, 13 Jun 2026
 06:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com> <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
In-Reply-To: <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
From: Enzo <enzo.adriano.code@gmail.com>
Date: Sat, 13 Jun 2026 09:29:22 -0400
X-Gm-Features: AVVi8CdCVOnyKliNLOkMVxlnWD8AwCxre4GYBDVtf8SuvuvseqhhiKAPW8eLEzc
Message-ID: <CAHWUu5HKy6g5aFbrriBz1cC7dQkss7x5pTBQ1qXe2NA=H2aejw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_062935_466964_5FD6C4F3 
X-CRM114-Status: GOOD (  19.90  )
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

Hi Jernej,

Thanks for taking a look.

> Besides sashiko bot comments, these pins should go to main A733 DTSI,
> like it's done for other SoCs.
>
> In any case, it's a bit early for DT. At least clocks should land before.

Agreed on both points. I'll move the UART0 pin definition into the main
A733 DTSI for the next revision, following the other Allwinner SoCs.

I will also hold off on sending a v2 until the A733 clock prerequisites
are in a better state, unless maintainers prefer a different ordering.
For now I'll keep this series as a checkpoint and continue tracking/testing
the RTC, clock and pinctrl prerequisite work.

Best regards,
Enzo

On Sat, Jun 13, 2026 at 7:37=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 13. junij 2026 ob 11:42:16 Srednjeevropski poletni =C4=8Das j=
e Enzo Adriano via B4 Relay napisal(a):
> > From: Enzo Adriano <enzo.adriano.code@gmail.com>
> >
> > Add the Radxa Cubie A7S board description with serial console and SD ca=
rd
> > boot support.
> >
> > Ethernet remains disabled until the GMAC210 wrapper, clocks, resets,
> > MDIO, PHY reset, PHY power, and link behavior are proven.
> >
> > Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
> >  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts   | 48 ++++++++++++++=
++++++++
> >  2 files changed, 49 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index d116864b6c2b..824cc35152db 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg=
35xx-2024.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/=
arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> > new file mode 100644
> > index 000000000000..453761a96323
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "sun60i-a733.dtsi"
> > +
> > +/ {
> > +     model =3D "Radxa Cubie A7S";
> > +     compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +             mmc0 =3D &mmc0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc3v3: vcc3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_vcc3v3>;
> > +     bus-width =3D <4>;
> > +     no-mmc;
> > +     no-sdio;
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
> > +             pins =3D "PB9", "PB10";
> > +             function =3D "uart0";
> > +     };
>
> Besides sashiko bot comments, these pins should go to main A733 DTSI,
> like it's done for other SoCs.
>
> In any case, it's a bit early for DT. At least clocks should land before.
>
> Best regards,
> Jernej
>
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_pb9_pb10_pins>;
> > +     status =3D "okay";
> > +};
> >
> >
>
>
>
>

