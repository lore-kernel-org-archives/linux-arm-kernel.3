Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E0AEDEC12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Xjt8bJH/L3RjqSPLVXpTgggvkPMU8B0IuZLjfddvGU=; b=0+EYbnRqMuJI2/OM7N+kLP76Mr
	nWP8LdMDNWpaNn5A5A57AkH65ygWGW44NAzfzj8ykL+BcOBWT5syQi1/UZ8Eggo/P07xG+vqSin0I
	rfblPWlcjFeEWtkPRew6xrWYUusG57gL69ZId5Uo2obiTidtGFfr+lh4pUJdMh9mO+K96DJuYiE3D
	mMhXhuyc75j1+rsel/dby6eZWY82y1xtXbCBzK8Z7Eg7UeTsDVxjcmOSHJGsyNPsylSUnuYjeRC7X
	Kzjx27EKJG8EltzuvC582K5UrLGdodZtJdVSGXaWPr/2Xj9/JdyUpMHhx6N0fEu4Z1+U23RROlJ4M
	vkfGY+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgcG-0000000GasH-0SJO;
	Wed, 04 Mar 2026 07:25:56 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgcC-0000000Garx-0eAR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:25:54 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1270adc5121so8230687c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 23:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609151; x=1773213951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Xjt8bJH/L3RjqSPLVXpTgggvkPMU8B0IuZLjfddvGU=;
        b=gD+FIuM/Fk7MLth2FtZCziqmEnPFiPJx2rPV3+XcqoxGRHZrVJu2sRJ+s7FE2pHinD
         7iq2JHD8WMtiwulUrx11hOomneRxORve8o6OzaVpGakFF+4DwFGxNva8AV15jc3WlFgO
         3dnZ5m05Ka0c98uXU+hZGGoIidoJLdLsz+jVcmZFutZjp3q2e+GNnbpIu8cKY3tX+PFX
         rItiG0y3LU4Lddc3ld4Gd345SQx4sUGBMZe79CA2L+RpL9VbsNmTNNCGMyVWslUW7EIr
         KsQLLX3wM9AbpSA2RX0MVqsM9LHYdONGhYvgNhzmjZE6scIkKMgxEIYV1IMhuqy/oB7T
         BYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609151; x=1773213951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Xjt8bJH/L3RjqSPLVXpTgggvkPMU8B0IuZLjfddvGU=;
        b=V1tzQVMRUSXrEhl7lWrshGzfxOXpXHdW3GCQv3+EG8/6nZ3mgzxs9e1NRsXaf57E74
         hdUfN89ltqC2wnJHe8jFJ2XsfVF9NYldKrNqbl0FvEw5e/corL6SvmuH1siALHUJLD6c
         Y+9FMMi8GEy+49/HGRdaCiVyQ/bfDhSAIBWk5JE7V2b9hT6jG5tuLNe5s6v5Hx+8VCpC
         ZFX9vwM4AtCZNG9LcaxvULp6kfIl5Yvja0J3k8kKSA2XwN3U+WQHoSgSWONM0cAphKow
         1wR9PCuo9TV2jLZsBksclfACl33KiyMFReIwBb/yZO1s1IbrmatZGpNljEXpdOCCXBOq
         WsaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhwfT/VeLgb342rGDMrBMxHL1Ig2yiTJvYlOeguKjfxMKYvylng4dwLNK1rM1+xnUfboxR0u/vRWv3jjvuJygZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzyHyjlVv5mI3g/zqqrSsROvcMxFkxH1atGwxqUa5HhrCcrPaNX
	LukM856++1zME5YUZ7Luqoxy7z2Rk98kmiekftiwlKaViaYEbiIGRxG4
X-Gm-Gg: ATEYQzyUMOEiLzyooDZYU6X2mO3KLCY/LqLqI05E99FaN+Wx8BPNO+/4Aia6MYzvAMd
	3l4X1dkJtkEfZn4xQwtVjLRwubZ16mu36JpI6HL448MgMQsE/+IG8KRWP0FQufW3UY97JsEKWJ/
	qLBmN0eD14p0vpuWpC8WYN+uoeuOtOd3GnqVum64sXPXWAst1XrFO/Hjhl7akvRnODjXZaWk/dE
	KRSuhA2fwsVMn4Oa/tZjUJEQ5BEDstRZUZluy9BoLxbbc+wm9VIylOFw6JmoeBitcDR5zwW+YFj
	fEglrhXqdfy7Hz8BWCK/X70dQynmoTLjSq4BYyJf26lhzb5nW5HGSwGzSjUK9QJvATZCur57JJG
	6NlzfoM3W/ZuGU8w3p9GYDQkcyMuBfe4jrbkvxYS3ZbsFTDJ7g97benxv7IAJeqKL/hmK4u720k
	oLjFnFjrP7hX5Rka6s7r4GaJ6hlDR+BkA=
X-Received: by 2002:a05:7300:72d1:b0:2ae:5e93:b69 with SMTP id 5a478bee46e88-2be310904acmr459054eec.29.1772609150602;
        Tue, 03 Mar 2026 23:25:50 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be249ed6a4sm2548374eec.11.2026.03.03.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:25:50 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: andre.przywara@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Wed,  4 Mar 2026 15:25:43 +0800
Message-ID: <20260304072543.436707-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <5969847.DvuYhMxLoT@jernej-laptop>
References: <5969847.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_232552_196515_7DCB92C7 
X-CRM114-Status: GOOD (  25.20  )
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

> Dne ponedeljek, 2. marec 2026 ob 03:09:56 Srednjeevropski standardni =C4=8D=
> as je Jun Yan napisal(a):
> > TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> > equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> > WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> > one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> > infrared input.
> >=20
> > It was released by Ultrapower(UQSoft) as a blockchain-based terminal and =
> is
> > now discontinued and no longer supported.
> >=20
> >   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn=
> /product.html
> >=20
> > Hardware schematics are not available at this time; however, the
> > dts from the vendor firmware is provided for reference [1].
> >=20
> > Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
> > can be confirmed as AZW, and the overall hardware circuit design
> > is highly similar to the Beelink GS1.
> >=20
> > Tested, works:
> > - debug UART
> > - status LED
> > - USB 3.0 Type-A port
> > - USB 2.0 Type-A port
> > - Micro USB port (Host)
> > - MicroSD
> > - eMMC
> > - WiFi/Bluetooth
> > - HDMI video output
> >=20
> > Does not work:
> > - Ethernet (requires AC200 MFD/EPHY driver)
> > - HDMI audio
> >=20
> > Untested:
> > - SPDIF
> > - IR receiver
> >=20
> > [1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts
> >=20
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
> >  2 files changed, 362 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.=
> dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
> /allwinner/Makefile
> > index 2edfa7bf4ab3..d116864b6c2b 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.=
> dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-taiqicat-a01.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
> rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > new file mode 100644
> > index 000000000000..3138292abb45
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> > @@ -0,0 +1,361 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model =3D "TaiqiCat (TQC) A01";
> > +	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> > +
> > +	aliases {
> > +		ethernet0 =3D &sdio_wifi;
> 
> Wifi has alias ethernet1 on H6.

Acknowledged. This will be fixed in PATCH V4.

> 
> Other that that, it looks good. With that fixed:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Best regards,
> Jernej




