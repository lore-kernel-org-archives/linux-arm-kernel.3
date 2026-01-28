Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01ABD35690
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=; b=AUo+tsSE9CG0znESObUTZHTnBF
	Fj8qA2sVi80TI6WkjVj0wddFnYZkZli7Z7Tt4z825txbzRH7vCyJzkMFtLu7gZsmjBYfJGu8fwJCm
	KwQ/yFhhjTk9opSGEQlHpDMHT2Eg7FCbsu7MUKYBvfkR5O/LcWiZCcjIFFoA9kBkmMm0dQSZYwB4B
	KQpweqjbbjP39KQ5yd/Hh/GebKcKoNFofy+S2dGnjYIvkgwujYnl8Yl/ngN5ijabKU+Phe0cfieUN
	7QE2eWru8fJyt+Ha5vPmFK+GkObhqk/gVTRS5WXALEDI0kdhl7n9m5BojipujwCJ5jcudNDNzN2kP
	md2gBKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl15N-0000000Fg5c-17SQ;
	Wed, 28 Jan 2026 08:39:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl15K-0000000Fg5D-2bRI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:39:35 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-432da746749so3637306f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 00:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769589573; cv=none;
        d=google.com; s=arc-20240605;
        b=FmKvSgkN5AMQwqZ1pOglt+Qst93KAgrqwa/YUtsv7BXpxhWphvBs4MnqQe2YakNOqv
         k+qsM9mooxxoKD+XzOhluGX0ad/L7d5DqTerI9X3SOcMxjvaIPjCMTSwoV+uLawYlSuj
         5tYRaEy9+84kGS5EOAj+/PV5desKsWsp58UJ36tXj86t/jEH8KPmbsVTMMIKRC6dW7uG
         VA0pwRZ7V4RSdULkUrlxH1cIIJ+/bEZQvrFgVV+zuKy/SXoGSpfSJC5+gnX6xFiimM0H
         +LzTaH1vHJrVPdiixzGPwgcZx+XZYixemUiBqO/h+6EKMunTMc8vlTEXnwQ+JPECEDa7
         YyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=;
        fh=n8Gqa1WfLdQtWFUr6DCG/eQoqOvwG8hlQ5SM0Z7WUts=;
        b=JOZxP8SWuFIoZHtfcR4OPQSwFPiiqDYWD71HL9fb/xMpv/Kb4JBDl0MWZPx1GiOPxg
         pnoFMHi42xk3kP4qijxncjcrbeXtNkvmoNyoK0tiufeBcctObDWz2PhS3yNSRIyd5xSp
         lYOz3D5WwU2gKKwuLngH1D12oDj0flQ+vCqnm8gyaDgd2IQrb+ooZLzYyOWciN+XOUoR
         myMIFvlhYvTJ9U30rRLWSOW+F3Yr4VccmTgOZmWbJhqRM82oxIkfb5qBAdv0iKY4LQ+m
         uJDI578jiaTh2OyklB9RLALIi3BF8YnsOOTpnWDApcjf4iVOJW7z5KXCBvWWjlk7qAez
         8q+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769589573; x=1770194373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=;
        b=RQYn23D/cGG00ojVTcNRdDwrFxQr3CgKEubqMtxPFbW8UwffcEKcUwOtxprMid1Oqn
         fSFBWckTAQuQkaZUqXLPp3NtI6RrhXdTS3zMduXQZTC1hiDAd1VCNPcGhaon549VikSV
         E97XHRdTH6ks2gF8itvVepy8lgKTcK3449lCkrSE3atY+XciKSg2VSso0HMHnk+wBgGu
         Atu3inbRz2megy3eZro4D39IyKF3XDo8Fo1OF/VNpg79khUXOf8oMoXXvgjtGriyTf9Q
         tr+ciGER3cjzZ9m5bZkN5pSY2csf91TfCjLkAK6PPpinF3HAnG1nXNNapmJHpLZBBLtK
         /xIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769589573; x=1770194373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B66d3ujh7h0A/WS6d2XbPk4tiEtVkdJvMPjnQVBm9iU=;
        b=sPnAY/jGDy2N2TsSx9XFwmxLqNoEhwn4R1IM04zgHoIKWu1QPu8R8aV+YLLooKGtEi
         Ilg5w+DHTR81rVDMiY0TkGKewTP8XAOPVRxXOdCI2S2yLoiTyC/SnmCLDQjbLVJBFjEQ
         0VWjyIcyWdSrm63x3lZdkyZ7/fQamIYtkoCNCmgdhyjGBIocVL8pMgmhmwkmeLK0KF2I
         ol07KtAfKbjBjxFlvsuUE125Xsc0ApAiMHIBXABe8hjiWO9b0i5341PfQA50RV6kgxRw
         yYZcYiuiSJS5blSFx5ja4u6hmoErbUxc96siYDUB4439768i8C1KSKUN+ijlam6fOsjr
         CsBg==
X-Forwarded-Encrypted: i=1; AJvYcCVRW6GncUMqXmvGzHDXfuNUHyLV68rzHA0d0cGYYOv162Tw6OfbvAuNJUIJUbgrNsAKY0XGgh2a23CiU9WD24gO@lists.infradead.org
X-Gm-Message-State: AOJu0YyILQQWduhJUSSOBd3apjLeB98REWEUaSIQtHLpYKjl2n4rQG13
	NsWRNOwq3w5g6+LX1u3tp2QdfcVaECbzXsGzDNHBN4kjDIZSQiJh5wdvnj39Yny0kICEZrAlNov
	hCQD9/HZzNLUP9ab85MEDG/ejx4a4rNA=
X-Gm-Gg: AZuq6aJ8jP9NutP0Mv0gY5ltTGkuWMgtMaNuD/jr/38SUCjAA99f+BIVDsYdrsVtQxh
	Om7uy9XNvK2+YVKSgflUkqizm716ZX3G28G9QtMx7uyWl2zvrGQiavD487ci4Q78EvESDmtLICP
	WbQYiQnFLgE+LFDB5LFjdZZf+XbeNAMv+AuZlNFZWrv8mwmK0TPWQmINIld9G/59GAk+6RXAdkX
	izL4KhJQIVBDJDZ0N8y2GgB3ebEyS1gTVtqhz2Um3FKExZnoWHM+9l1OrlMRQsFkKRoMKhDexnO
	OJ665jU=
X-Received: by 2002:a05:6000:2906:b0:432:857d:e425 with SMTP id
 ffacd0b85a97d-435dd0a40a4mr6149417f8f.30.1769589572469; Wed, 28 Jan 2026
 00:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20260127025740.2601841-1-onlywig@gmail.com> <20260128050549.3337279-1-onlywig@gmail.com>
 <20260128050549.3337279-2-onlywig@gmail.com> <aXmsbbt9T5ZRGtES@shlinux89>
In-Reply-To: <aXmsbbt9T5ZRGtES@shlinux89>
From: Wig Cheng <onlywig@gmail.com>
Date: Wed, 28 Jan 2026 16:39:19 +0800
X-Gm-Features: AZwV_QisDOJPdzB7hBtncbVdr6RMWIjbixaTB16D-guHWsWAMozPqEa1RjRA1NY
Message-ID: <CAPStFe7-1++d79LEnh0=ozkZrU7n8_FWx_cx8_YUc7UhOt48hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_003934_717344_14098881 
X-CRM114-Status: GOOD (  17.32  )
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

Peng Fan <peng.fan@oss.nxp.com> =E6=96=BC 2026=E5=B9=B41=E6=9C=8828=E6=97=
=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Jan 28, 2026 at 01:05:49PM +0800, Wig Cheng wrote:
> >Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
> >
> >Signed-off-by: Wig Cheng <onlywig@gmail.com>
> >---
> > arch/arm64/boot/dts/freescale/Makefile        |  4 ++
> > .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
> > 2 files changed, 55 insertions(+)
> > create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpa=
per.dtso
> >
> >diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dt=
s/freescale/Makefile
> >index ce8f937c2315..c2727f8061e2 100644
> >--- a/arch/arm64/boot/dts/freescale/Makefile
> >+++ b/arch/arm64/boot/dts/freescale/Makefile
> >@@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb-i3c.dtb
> >
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk.dtb
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm.dtb
> >+
> >+imx93-11x11-frdm-pixpaper-dtbs +=3D imx93-11x11-frdm.dtb imx93-11x11-fr=
dm-pixpaper.dtbo
> >+dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm-pixpaper.dtb
> >+
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk.dtb
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-kontron-bl-osm-s.dtb
> > dtb-$(CONFIG_ARCH_MXC) +=3D imx93-phyboard-nash.dtb
> >diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dts=
o b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> >new file mode 100644
> >index 000000000000..1111503b08af
> >--- /dev/null
> >+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> >@@ -0,0 +1,51 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+/*
> >+ * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper displa=
y
> >+ * support on NXP FRDM i.MX 93 Development Board
> >+ *
> >+ * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> >+ */
> >+
> >+#include <dt-bindings/gpio/gpio.h>
> >+#include "imx93-pinfunc.h"
> >+
> >+/dts-v1/;
> >+/plugin/;
> >+
> >+&iomuxc {
> >+      pinctrl_lpspi3: lpspi3grp {
> >+              fsl,pins =3D <
> >+                      MX93_PAD_GPIO_IO08__GPIO2_IO08          0x3fe /* =
SPI3 CE0 */
> >+                      MX93_PAD_GPIO_IO09__LPSPI3_SIN          0x3fe /* =
SPI3 MISO */
> >+                      MX93_PAD_GPIO_IO10__LPSPI3_SOUT         0x3fe /* =
SPI3 MOSI */
> >+                      MX93_PAD_GPIO_IO11__LPSPI3_SCK          0x3fe /* =
SPI3 CLK */
> >+              >;
> >+      };
> >+
> >+      pinctrl_epd_ctrl: epdctrlgrp {
> >+              fsl,pins =3D <
> >+                      MX93_PAD_GPIO_IO05__GPIO2_IO05          0x31e /* =
DC pin */
> >+                      MX93_PAD_GPIO_IO06__GPIO2_IO06          0x31e /* =
RESET pin */
> >+                      MX93_PAD_GPIO_IO26__GPIO2_IO26          0x31e /* =
BUSY pin */
> >+              >;
> >+      };
> >+};
> >+
> >+&lpspi3 {
> >+      #address-cells =3D <1>;
> >+      #size-cells =3D <0>;
>
> The above two properties are in imx93_91_common.dtsi lpspi3 node, no need=
 to
> duplicate them.
>
> Regards
> Peng
>
> >+      pinctrl-names =3D "default";
> >+      pinctrl-0 =3D <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> >+      cs-gpios =3D <&gpio2 8 GPIO_ACTIVE_LOW>;
> >+      fsl,spi-num-chipselects =3D <1>;
> >+      status =3D "okay";
> >+
> >+      display@0 {
> >+              compatible =3D "mayqueen,pixpaper";
> >+              reg =3D <0>;
> >+              spi-max-frequency =3D <5000000>;
> >+              reset-gpios =3D <&gpio2 6 GPIO_ACTIVE_HIGH>;
> >+              dc-gpios =3D <&gpio2 5 GPIO_ACTIVE_HIGH>;
> >+              busy-gpios =3D <&gpio2 26 GPIO_ACTIVE_HIGH>;
> >+      };
> >+};
> >--
> >2.43.0
> >

Hi Peng,

Thank you for the review. I understand that #address-cells and #size-cells
are already defined in imx91_93_common.dtsi for the lpspi3 node.

However, these properties need to be present in the overlay file for proper
DTC compilation. When compiling a device tree overlay (.dtbo), the DTC
compiler cannot see the properties defined in the base DTB. Without these
properties in the overlay, the build generates warnings:

    Warning (reg_format): /fragment@1/__overlay__/display@0:reg: property h=
as
    invalid length (4 bytes) (#address-cells =3D=3D 2, #size-cells =3D=3D 1=
)

    Warning (avoid_default_addr_size): /fragment@1/__overlay__/display@0:
    Relying on default #address-cells value

This is a known limitation of overlay compilation, and other overlay files
in the kernel tree follow the same pattern. For example:
  - arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-lte.dtso (line 78-79)
  - arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtso (line 22-23)

These properties in the overlay don't conflict with the base dtb, they are
merged correctly at runtime. The duplication is necessary only for clean
compilation of the overlay, thanks a lot!

Regards,
Wig

