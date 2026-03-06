Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EBDFCC06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNK1v/PEn41q4OPJG8Vn10SgkMQvYdWa3Iwstjk7m/s=; b=v7cL+aVgfpkWK8XK0A475KKkAS
	buf6z4BC2uj6lX7GrZWx5rdkBbsNH5SgZF0t13oX2guRdnNLOAR0X9gOPQ5QiqTUIDGJzE5TL1N33
	ctHRsO1ndld8xmPJCuuPpDbYODX7eHpbvuDw85ZjLxU5mPVaoK7YTgaly4Rzi1MO+ZHob+EcbCLfI
	uh6ECxHa2oaN0PsELK1je1EXg/VWmynPTD2J6zmG2Vd6BPlOwbcZX5IrfcvtmhTvpwaxLahDXghfa
	kzFMjv2Gkl/J6JvKy7CKZz4F3fS2b8XjCl3a/vb0U5lj3hIyCTHW0m4s4eaacXU06roUn3EhcniRp
	F5fnheJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK6-00000004QnH-3kW2;
	Fri, 06 Mar 2026 19:58:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJx-00000004Qdr-48tq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso3918495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827128; x=1773431928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNK1v/PEn41q4OPJG8Vn10SgkMQvYdWa3Iwstjk7m/s=;
        b=GvLDwaz1SGTZjyVhOpvJpdxCx/q1UTPYVkmxvV/BfP3pYuTyZoHiyasXMPezgPWv2+
         n7lfHZuZ5DObjtGx7CRxnyHScaDL+rKFhwXLwMhnmdDsrrLzGcIQ+zp6St/XTGQVNIbK
         qw62tfApvmo5Neml3r83DD41kGCDmbYJWWW2thJpufGSv877gVoYryL6fmJARC/1UWJI
         CRHYuk0RyrdeWWVZddbR7amozKi9vHfX3qrDN2Pr8zr7mPYRVAt9GeTkzn0w9/gCsGEP
         0Ffbp7FclgwHSrXeM3mfKqjZqfPYZcPKzMB20zlO1DhxsS51+DIPPi01hvPm3Soh/Ezi
         L3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827128; x=1773431928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNK1v/PEn41q4OPJG8Vn10SgkMQvYdWa3Iwstjk7m/s=;
        b=I3tDwKvGb13mQRJLO1+udNikTcJ0a8ZaDiHrYHm2llSiwPc6Q3bE+DaRsTSuzNARzI
         kcMcyOqRvNCwgoMN7yMuZjY+2PKfERKLhmwvQyycQgy0/1hPcQSbAJSZZ2t5ZBlwhYms
         P+UF8zjC/iPbOeVMIf2JGzi3mSgpW/1K6BObqOOtvucwPo4KvaiiRQgegkEDNlPXc/v6
         3wEPenPiJLfDTzjsYK5GDubkYzHYvmd4LOL+h6FmfBlPNYVIUZ6XLHzkKidX1hj8i/h0
         3AAwB9PofMNygiIQgrlcNthd+1h6CSYnUCVU0whgnBxMWHyozwKJu8McQMqi6Nv+fIfQ
         qPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2vLttsYdRyzo0ekywm0qYLriumnuxA5Fh87b233P+lwo4pEGcoySoQIazfPNXkkhenwDM/SNlFz9Foh1HmsJd@lists.infradead.org
X-Gm-Message-State: AOJu0Yz77TiTY11B4RjfHJTHXcPk+tcn6UDvseC2h5WeQSId/5U3Q060
	QHzSE/iIFr57Y4iQNSh02SS66BdUG8FjtDM9fdGGQpF6oiisSSMLMBrO
X-Gm-Gg: ATEYQzw4qPRLx46SD2eHhxV0DfpHy0NMnp13yRP0O2jdFwVQDTKEOE+ajP0ziNmLcnt
	uXOecwNTfG35NeWKMpIosv24eU63uRlF0p20rdg+pSmj3b35H3mRPTxM7Xz8X9dIIkZ/5yV4gWL
	uiijN/vZLSpraUYhUpZeJjqo0K5wY0E7W+T4/or77/PAkJ+T0jXppBx8c3gmyWXht5oA2dYPo8G
	YBfDwLCpH9aVGPFb8CW4W50TI7vGfZ1SWx2gi/4dUh4WMf6qJwALyU10MTHdbDJdW2AQJvhcbjg
	90Hps2bMKlrgUjjvgLm9x3OWojYAUQUhDlCEGnFi+LhZifklWV7IgMakKlYHHnuAMrjbHAEX5Ng
	5uDmM4Xhp2HWI2S8DRYGxplIEVhQ0BE96JTVHhHd1HZPmMrgIT2FHw53Q52FHggx0S6XgOU8hS3
	oVyy9Bql/yZCxjLHc/3TtDKI2K89AtY77BZX+T10mfWTiyDwBepfdAUxAkW7BmDvdzEDgxkkKJX
	hDClOF+hCxOBntTKlMmwOL7Qp/K72Mxh6wMNAk=
X-Received: by 2002:a05:600c:c10d:b0:485:2af3:3f8d with SMTP id 5b1f17b1804b1-4852af34027mr19015335e9.14.1772827128159;
        Fri, 06 Mar 2026 11:58:48 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:47 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Fri,  6 Mar 2026 20:58:27 +0100
Message-ID: <852dfa2a90430b3f43dca70d3fae18c6df953250.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115850_926177_CAE7D93A 
X-CRM114-Status: GOOD (  11.83  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the microSD slot on the VAR-SOM Symphony carrier board.

Configure USDHC2 with card-detect GPIO, pinctrl states for the supported
bus speeds and the required VMMC supply.

Update the VMMC regulator to match the latest carrier revision by moving
the enable GPIO to GPIO4_IO22 and adding the required off-on delay.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 86246de8f36f..66c306f755af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -24,7 +24,8 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <20000>;
 		enable-active-high;
 	};
 
@@ -227,6 +228,18 @@ &usbotg2 {
 	status = "okay";
 };
 
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &pinctrl_fec1 {
 	fsl,pins = <
 		MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -287,7 +300,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -311,4 +324,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0xc1
+		>;
+	};
 };
-- 
2.47.3


