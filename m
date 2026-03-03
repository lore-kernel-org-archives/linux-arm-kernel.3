Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18645EDEBE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWbdBUMEXH4g8LJKj8OiXeXSCrn4OD1jl9QXgu59+fk=; b=aoVpO69lBO97iS1xmRuBq9K4Rf
	/dYDJ6aL+xfjij4cr0cJJLlxYDlIl7AkKvLl+WPKI3JzvpAanDIMvhOLjcNmpDifWQP7f4ih5Ndb6
	N7mZ6nydqxYEqoURoCXk2Gj6QAiICKAM2vV81FldjgAbp2ZKDYeVpUUEXJmdxXiH3qlvYxvw0n3V5
	R+PXLaVKMH9lJXP7tO3ESTq+QtZoGf/Nu9wcc0AXsi6nu7IrknGxsGRMF5QHZI8vmXcL13DJ2PYNd
	Tu0bcD0ApmXcsm4jeMtt3vazDTSMTCksA/nRfd6T5VIS1VPEZ452ZAfd6oSxYDGPD61g12taPUDMn
	4u8cUsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUdc-0000000FibQ-3K0M;
	Tue, 03 Mar 2026 18:38:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUda-0000000Fiaz-08YE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:38:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso64086355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 10:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772563108; x=1773167908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWbdBUMEXH4g8LJKj8OiXeXSCrn4OD1jl9QXgu59+fk=;
        b=VOxwRhHo6lgB1CsKc04n5aWTCOob/iqXryeFia8257Td8PATbufj8vRsH67G6gQEkh
         oRBqA80tVF4YRI1qzo5xRgYUWYoWXmjUladDGqWT9DL+AWN03HVHoRrJKhTUu25HRxgg
         7i3yhMsNQDh5XFTElk0UunjSuwdlBX0h03CrBZsyBwS/MW/kly+LAZwXuN1uhGXZunbf
         21/U547TZvTt/IHdqFWpCelpxjuQ81SXbRKLQiMqgu4i8P6blGoTAqnnbR4l1Un2uhc8
         OForDJl8R0Nx3QqHfsol2EkNZgr5l+FA7dTTzJZFcyAfDUfvtvPLtoCm+FY+YZLciP4W
         u8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772563108; x=1773167908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zWbdBUMEXH4g8LJKj8OiXeXSCrn4OD1jl9QXgu59+fk=;
        b=bcPPRbAohSejZOwgPzJi+AdR/fJGacm4vIBPML8MsHz30FCB+JyvjP/Bn+uCBSvVw7
         RPvn6g8GHP19QmHZI/3L7pb/kSl/t7nlcU7VdPg+382w16mS+Tv4WoGpkNhl2XtpDucm
         Y9qafX2Aj6lTiyYektljOpfBMdx4/PKRYehqZDQw21ZHkkaQGhtdaPW1h+phitBNT0hr
         kGifUKvcUtgWMf9o/npiVE83sE5po1lsOyHvx9bkL0RU6P3nFW5OWh5psgZK3UwQU+VQ
         E0iFMRfZAX18qODaZKBVOeonEIfZwWSBw6Hvty4PEvtuY0FFjp3uIZWj3Ts7UVvsSQDE
         rvpw==
X-Forwarded-Encrypted: i=1; AJvYcCUCEjJkE+v/vHpo7G0Rw3fZ5vt+4Avyjtrc4R1pozEtOhgLlGdd31YpJimcnJCZIra+nY1Rua+rehAV7An9XT28@lists.infradead.org
X-Gm-Message-State: AOJu0YxcVYWx7AnYrQyq3iulvRMzHYQFYMo9XjYgx8WfeBbaIBvnjIK4
	mcjaY0X3AB6DNwa4h8YX8Kw1pXFMbgAOxnL9pn8thlEEUZC443gpzFLe
X-Gm-Gg: ATEYQzz6ivfZxDPEP1lcNvWv+ln3tOY1hXQk8Hetx9bez84T0KaBX1Se4/2n9SxAu+I
	PqSNAsjnigpnT+fchrO+VfXm+Mvv0+X8H8xPYuAhfESeXCIQQh89+Rq8WyK6U26uL9HGCve/dVK
	BgUIWAbmefG14c4cQOUv4G/XopgtsT8b/eCJJc8udQEXbISM2bwYZR0N+SqfPf+d/mAe+pyEBmg
	X7sdjb9hpdL3VAA1NHcnd3pFW18di3KTlPJ7zDLq71pmNB2vCy3yRAarbd2mhwVlFfRXM0hXR3c
	4mrtqz8HideKj86RlTxlbUSFUItFBfY7EIcadE3Dodt/gSwEKh4lhVPRxfYn5jg2p2/D5WjR19x
	RrQWzYi1cb5ms7AbkwaikHpv+TWS2D0LsQR3lxucr7D3ADaBQKlEof1+aRBxmVrrFYBH/ewf+bQ
	RfmecpOZPbMX1silGrYlw1p3EuyqSkcG3ZOaPTmZWA/wuTJq2cP15KlD+LJsGmeOkf9ZvuZT6Te
	uzvao94YPIsvpyUajY=
X-Received: by 2002:a05:600c:1e85:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483c9bbbe23mr300242825e9.21.1772563107874;
        Tue, 03 Mar 2026 10:38:27 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b841absm409737345e9.13.2026.03.03.10.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 10:38:27 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, andre.przywara@arm.com,
 Jun Yan <jerrysteve1101@gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Tue, 03 Mar 2026 19:38:26 +0100
Message-ID: <5969847.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260302020956.96424-4-jerrysteve1101@gmail.com>
References: <20260302020956.96424-1-jerrysteve1101@gmail.com>
 <20260302020956.96424-4-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_103830_112265_99F41B00 
X-CRM114-Status: GOOD (  20.09  )
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

Dne ponedeljek, 2. marec 2026 ob 03:09:56 Srednjeevropski standardni =C4=8D=
as je Jun Yan napisal(a):
> TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
> equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
> WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
> one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
> infrared input.
>=20
> It was released by Ultrapower(UQSoft) as a blockchain-based terminal and =
is
> now discontinued and no longer supported.
>=20
>   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn=
/product.html
>=20
> Hardware schematics are not available at this time; however, the
> dts from the vendor firmware is provided for reference [1].
>=20
> Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
> can be confirmed as AZW, and the overall hardware circuit design
> is highly similar to the Beelink GS1.
>=20
> Tested, works:
> - debug UART
> - status LED
> - USB 3.0 Type-A port
> - USB 2.0 Type-A port
> - Micro USB port (Host)
> - MicroSD
> - eMMC
> - WiFi/Bluetooth
> - HDMI video output
>=20
> Does not work:
> - Ethernet (requires AC200 MFD/EPHY driver)
> - HDMI audio
>=20
> Untested:
> - SPDIF
> - IR receiver
>=20
> [1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
>  2 files changed, 362 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.=
dts
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts=
/allwinner/Makefile
> index 2edfa7bf4ab3..d116864b6c2b 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.=
dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-taiqicat-a01.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> new file mode 100644
> index 000000000000..3138292abb45
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
> +
> +/dts-v1/;
> +
> +#include "sun50i-h6.dtsi"
> +#include "sun50i-h6-cpu-opp.dtsi"
> +#include "sun50i-h6-gpu-opp.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model =3D "TaiqiCat (TQC) A01";
> +	compatible =3D "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
> +
> +	aliases {
> +		ethernet0 =3D &sdio_wifi;

Wifi has alias ethernet1 on H6.

Other that that, it looks good. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



