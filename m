Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEADCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZKda9N5dijKxgcEWmfEVaFBabk39V5bB1Cg5EO94mA=; b=pdSMe9xwI186wAHu9d0knS5sel
	bs6qHpSsTKwwjqsBsAdOsXBuXhkqpr9Vn5aVpmMIDt3x+edYRtLmMTRJ+zMRjI8v24JAHiHxhTZKA
	6PuyVSqy9a8xkqcPVW/i+zWOMcjp3oQhCfZp37PZh/XApzmLdfR6cPWwYH/1ZAySyRy/zGZ6oLR37
	da/eXO/xq8xI/uw4y7ImUxLbRgu+fyj9G3ouKRoJ9LEvu2BBCWxDHatwAvr53OkAreQJNtzExVW+F
	TrYkQMR8DvfbbOr/iCt3YdInvAgQ0Avgo5AUxacLfhl48n+WVoReNktfoopQFqCeeaMVMrbjG3ufY
	X+dY/qXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wh0-00000000sRV-3MPj;
	Wed, 15 Oct 2025 08:17:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wgx-00000000sQq-3V7l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 08:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760516221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZKda9N5dijKxgcEWmfEVaFBabk39V5bB1Cg5EO94mA=;
	b=Abud/wI7ZhpRtmu0PEfduIzMIjvtFGBzdOPo+TY5Lb1HNTkrhVcls5k4AuQjBjWxph3OB4
	AW44sO6UMqB9gbsIuIBYyIcAwyB9avb5G1Nas3KIiBhhjlBK6zteBgxLlzHrdTrhJ+HJcM
	4Dw7ejy+W3amPvhMz4wWZgj+9nLFiHg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-6txYRSvLMfmF7Ruj4N4tHA-1; Wed, 15 Oct 2025 04:15:15 -0400
X-MC-Unique: 6txYRSvLMfmF7Ruj4N4tHA-1
X-Mimecast-MFC-AGG-ID: 6txYRSvLMfmF7Ruj4N4tHA_1760516114
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-793565df4a9so3126922a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 01:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516114; x=1761120914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZKda9N5dijKxgcEWmfEVaFBabk39V5bB1Cg5EO94mA=;
        b=Dbjk2chrdVkQSJJzpDYIel5s3qnqpr5dxWWhl8492FulGmkuVQMofdLExiitlDnSKi
         gp3jJFV9dVvz28LqXGLCNYiP1hwvcfoJT6oSKY0gumChnWC1pQ1iq9GcITuJtIIp+3lZ
         klVgrPFr+fVLX5xe3noKRSupp4uvbl5wqUe7EQrhgiGIpMUsv2fhFs4FHBluyOmGvAdA
         hwCrh0YybtjuXPtv/ZYzD2DtCr+NrWZdZtCYnGn6f/oQGzNpYkrz9K0UjPriIi6ZMDW7
         mu+d2WB6THNeaWHYYns7/8gVCZQAJvuguLnPEEJTkz8Vbg+HjqXG2UqavvjT2Ho5EWkV
         +/yg==
X-Forwarded-Encrypted: i=1; AJvYcCXYAgR6w9qvvaBdlASfpzXJ4Oht1Xjq/83kAXC7QdvwYNd4t7Z1m8XN3YTj0H1WQWLxZhZ37owMg1/mspezdTme@lists.infradead.org
X-Gm-Message-State: AOJu0YzR6saaPpXwqm5AsaaPHIo4cJY0Du8TgG8FsKn6qpq1H7WkKar/
	Rl13SThH+6TSXmL2Ny7efYsfuS9ClOKXnJ/cNxdv3aFbsBlxeHLDEMeNzgY/ES3H2lqgUiwgtEA
	2214ihmOG6/PbylQ/3StOm740vV683kgeGkJML1uiizSuNhFGtrkJ9WSZOs/QZkTf98GZ/YfDOT
	cTB8tmh7mQLQipEGx/SneHdNvalr/6C/puqkC38XQPDH/DiNNcB20=
X-Gm-Gg: ASbGnctQKd9ZAspN80jGYaLDUQBqebOEN7Q17NnlOf0Y8Zc1CJtYGxoVY3wUJXcVvae
	FmFXLASLoCQIE/qGairEyMMyt4W1PqvNK2KFMfY0utNpbdGs93Z6e3L2lB+L9ao3DT4OgHC1EQh
	M0O8MdSF2A4IAOMY8svw==
X-Received: by 2002:a4a:a5cb:0:b0:650:11d8:238b with SMTP id 006d021491bc7-65011d82737mr3501933eaf.3.1760516114048;
        Wed, 15 Oct 2025 01:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmaU0mA5ZgI30BHsNRVowCM5aNsY26oF2v2JdjYxUuHKGZZFoMEDYsj2ZYBfGCAjm2CUzHY53+s7Zb3V4S4Qk=
X-Received: by 2002:a4a:a5cb:0:b0:650:11d8:238b with SMTP id
 006d021491bc7-65011d82737mr3501913eaf.3.1760516113614; Wed, 15 Oct 2025
 01:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-nxp-s32g-boards-v1-1-f70a57b8087f@oss.nxp.com>
In-Reply-To: <20251006-nxp-s32g-boards-v1-1-f70a57b8087f@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 15 Oct 2025 10:12:55 +0200
X-Gm-Features: AS18NWBquLznSadLgXrWHTjQr4NrQxZIv7gXTzpb0atLEJ2_g3uy-0qxXqM2JHs
Message-ID: <CALE0LRusjwiozUPgncUx=iy8O2jbDkm_ktUNXdA3Ludyp02dEg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add GMAC Ethernet for S32G2 EVB
 and RDB2 and S32G3 RDB3
To: jan.petrous@oss.nxp.com
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ylL7ekK0Agl9g198sJuJqYOSUlJI2-Fa9cQKg71KybA_1760516114
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_011704_018397_0FF5CC79 
X-CRM114-Status: GOOD (  21.91  )
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

Hi Jan

Thank you for your patch.


On Mon, Oct 6, 2025 at 6:32=E2=80=AFPM Jan Petrous via B4 Relay
<devnull+jan.petrous.oss.nxp.com@kernel.org> wrote:
>
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
>
> Add support for the Ethernet connection over GMAC controller connected to
> the Micrel KSZ9031 Ethernet RGMII PHY located on the boards.
>
> The mentioned GMAC controller is one of two network controllers
> embedded on the NXP Automotive SoCs S32G2 and S32G3.
>
> The supported boards:
>  * EVB:  S32G-VNP-EVB with S32G2 SoC
>  * RDB2: S32G-VNP-RDB2
>  * RDB3: S32G-VNP-RDB3

I got ethernet detected and working with this patch on S32G-VNP-RDB3

[   43.473918] s32-dwmac 4033c000.ethernet end0: PHY [stmmac-0:01]
driver [Micrel KSZ9031 Gigabit PHY] (irq=3DPOLL)
[   43.477547] s32-dwmac 4033c000.ethernet end0: Enabling Safety Features
[   43.489972] s32-dwmac 4033c000.ethernet end0: Invalid PTP clock rate
[   43.496479] s32-dwmac 4033c000.ethernet end0: PTP init failed
[   43.496491] s32-dwmac 4033c000.ethernet end0: configuring for
phy/rgmii-id link mode
[   46.599752] s32-dwmac 4033c000.ethernet end0: Link is Up -
1Gbps/Full - flow control rx/tx

So,

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>


>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi        | 50 +++++++++++++++++++=
+++++-
>  arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 21 ++++++++++-
>  arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 19 ++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi        | 50 +++++++++++++++++++=
+++++-
>  arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 21 ++++++++++-
>  5 files changed, 157 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index d167624d1f0c..d06103e9564e 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024 NXP
> + * Copyright 2017-2021, 2024-2025 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -738,5 +738,53 @@ gic: interrupt-controller@50800000 {
>                         interrupt-controller;
>                         #interrupt-cells =3D <3>;
>                 };
> +
> +               gmac0: ethernet@4033c000 {
> +                       compatible =3D "nxp,s32g2-dwmac";
> +                       reg =3D <0x4033c000 0x2000>, /* gmac IP */
> +                             <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "macirq";
> +                       snps,mtl-rx-config =3D <&mtl_rx_setup>;
> +                       snps,mtl-tx-config =3D <&mtl_tx_setup>;
> +                       status =3D "disabled";
> +
> +                       mtl_rx_setup: rx-queues-config {
> +                               snps,rx-queues-to-use =3D <5>;
> +
> +                               queue0 {
> +                               };
> +                               queue1 {
> +                               };
> +                               queue2 {
> +                               };
> +                               queue3 {
> +                               };
> +                               queue4 {
> +                               };
> +                       };
> +
> +                       mtl_tx_setup: tx-queues-config {
> +                               snps,tx-queues-to-use =3D <5>;
> +
> +                               queue0 {
> +                               };
> +                               queue1 {
> +                               };
> +                               queue2 {
> +                               };
> +                               queue3 {
> +                               };
> +                               queue4 {
> +                               };
> +                       };
> +
> +                       gmac0mdio: mdio {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               compatible =3D "snps,dwmac-mdio";
> +                       };
> +               };
>         };
>  };
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/=
boot/dts/freescale/s32g274a-evb.dts
> index c4a195dd67bf..f020da03979a 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>  /*
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2019-2021, 2024 NXP
> + * Copyright 2019-2021, 2024-2025 NXP
>   */
>
>  /dts-v1/;
> @@ -15,6 +15,7 @@ / {
>
>         aliases {
>                 serial0 =3D &uart0;
> +               ethernet0 =3D &gmac0;
>         };
>
>         chosen {
> @@ -43,3 +44,21 @@ &usdhc0 {
>         no-1-8-v;
>         status =3D "okay";
>  };
> +
> +&gmac0 {
> +       clocks =3D <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
> +       clock-names =3D "stmmaceth", "tx", "rx", "ptp_ref";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&rgmiiaphy4>;
> +       status =3D "okay";
> +};
> +
> +&gmac0mdio {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       /* KSZ 9031 on RGMII */
> +       rgmiiaphy4: ethernet-phy@4 {
> +               reg =3D <4>;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64=
/boot/dts/freescale/s32g274a-rdb2.dts
> index 4f58be68c818..b9c2f964b3f7 100644
> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
> @@ -16,6 +16,7 @@ / {
>         aliases {
>                 serial0 =3D &uart0;
>                 serial1 =3D &uart1;
> +               ethernet0 =3D &gmac0;
>         };
>
>         chosen {
> @@ -77,3 +78,21 @@ &usdhc0 {
>         no-1-8-v;
>         status =3D "okay";
>  };
> +
> +&gmac0 {
> +       clocks =3D <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
> +       clock-names =3D "stmmaceth", "tx", "rx", "ptp_ref";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&rgmiiaphy1>;
> +       status =3D "okay";
> +};
> +
> +&gmac0mdio {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       /* KSZ 9031 on RGMII */
> +       rgmiiaphy1: ethernet-phy@1 {
> +               reg =3D <1>;
> +       };
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index be3a582ebc1b..e31184847371 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2024 NXP
> + * Copyright 2021-2025 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -883,6 +883,54 @@ gic: interrupt-controller@50800000 {
>                               <0x50420000 0x2000>;
>                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>                 };
> +
> +               gmac0: ethernet@4033c000 {
> +                       compatible =3D "nxp,s32g2-dwmac";
> +                       reg =3D <0x4033c000 0x2000>, /* gmac IP */
> +                             <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "macirq";
> +                       snps,mtl-rx-config =3D <&mtl_rx_setup>;
> +                       snps,mtl-tx-config =3D <&mtl_tx_setup>;
> +                       status =3D "disabled";
> +
> +                       mtl_rx_setup: rx-queues-config {
> +                               snps,rx-queues-to-use =3D <5>;
> +
> +                               queue0 {
> +                               };
> +                               queue1 {
> +                               };
> +                               queue2 {
> +                               };
> +                               queue3 {
> +                               };
> +                               queue4 {
> +                               };
> +                       };
> +
> +                       mtl_tx_setup: tx-queues-config {
> +                               snps,tx-queues-to-use =3D <5>;
> +
> +                               queue0 {
> +                               };
> +                               queue1 {
> +                               };
> +                               queue2 {
> +                               };
> +                               queue3 {
> +                               };
> +                               queue4 {
> +                               };
> +                       };
> +
> +                       gmac0mdio: mdio {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               compatible =3D "snps,dwmac-mdio";
> +                       };
> +               };
>         };
>
>         timer {
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64=
/boot/dts/freescale/s32g399a-rdb3.dts
> index e94f70ad82d9..4a74923789ae 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2024 NXP
> + * Copyright 2021-2025 NXP
>   *
>   * NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)
>   */
> @@ -18,6 +18,7 @@ aliases {
>                 mmc0 =3D &usdhc0;
>                 serial0 =3D &uart0;
>                 serial1 =3D &uart1;
> +               ethernet0 =3D &gmac0;
>         };
>
>         chosen {
> @@ -93,3 +94,21 @@ &usdhc0 {
>         disable-wp;
>         status =3D "okay";
>  };
> +
> +&gmac0 {
> +       clocks =3D <&clks 24>, <&clks 19>, <&clks 18>, <&clks 15>;
> +       clock-names =3D "stmmaceth", "tx", "rx", "ptp_ref";
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&rgmiiaphy1>;
> +       status =3D "okay";
> +};
> +
> +&gmac0mdio {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       /* KSZ 9031 on RGMII */
> +       rgmiiaphy1: ethernet-phy@1 {
> +               reg =3D <1>;
> +       };
> +};
>
> ---
> base-commit: fd94619c43360eb44d28bd3ef326a4f85c600a07
> change-id: 20251006-nxp-s32g-boards-2d156255b592
>
> Best regards,
> --
> Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
>
>
>


