Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B26C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8F9qiRLZL79jukVGQvDFnHMsBH+07ucBndobdY7s6jE=; b=f72hiJcYCwa033NEb1FzcCj92k
	KlEYiJEmy1bf+j5Fu7Hqnj0ceyPbuaEPJFV66SkiRL7OAwI+G/08Qr6CP/XF1gzCAHAjwFhKi6YLR
	ZyeLl03B7MnRbBUQLMCUl5lNiYo2cS7PjnsPpdZlzif+SOf3lR88bU/LEHg50FD19kuUC4DJN+yYy
	ZItWMlDo0AhfoOu9ApL929dCxGqbU67zqiRDI5LKua64X9J9wbygt4u52g50C2oxfJd/dY/5N9+wS
	AXP2pCUL2fEeBp72TF8SpxdQ+Nh+6Nyrcw/Qrypj51dRATiASQmU+1DSF82Bc8MN1AtV3454Jsren
	QNwPkHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXM-00000006O9B-2Qf8;
	Fri, 03 Jul 2026 08:46:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXJ-00000006O5m-0QPP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b691cb44so2032105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068371; x=1783673171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8F9qiRLZL79jukVGQvDFnHMsBH+07ucBndobdY7s6jE=;
        b=qdt5g0gUTovM+EX989sbTgMBhqvTvBZrekjkz0On+sfCHSS2Cder7UgglFF+Fa4fts
         scBAPjbscY4TfVMcDkAmToTkrWSOi++pzfIVWKMjyNYUPddke+R8kLmdUxuvcqKTPb29
         7gQ9iL7l0Rfwos8Cxn9ckAMpWlirU//BIXf7PZocL5T4AFh0rlRbA0vgrDethC1I66Dc
         uG488f56J26UmxS3WODX7t9fYeAPnCy03PGXacFFGa6i4nihG+4GHoHdkVA5ouBEGe/V
         9aN/0YxErL6flQET+FlBp6LSpln3NpprC087Wuj6kF07VpM2cWIIgiOT28jltvvj7amL
         naBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068371; x=1783673171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8F9qiRLZL79jukVGQvDFnHMsBH+07ucBndobdY7s6jE=;
        b=G2QHAwkE2fwwo0snTmrYjxlm1C3MK+3R2B8/7dUtSLUV8LrYTQSLhktr/KrSwEQ5Gg
         r9Ulx/2GgU87hKfMIzK9ANA8iL0OoGhc/GDOEs4qW/20p+HWYopGsd7lunU0J6DxrGM0
         TjeSlPkW5XXklb43E1/Rj6pg3hZI4f+I97F2SMzCIP2YjLkUhbp2fjQ0lBNbugMibSQJ
         LIXYWlWv/gJxvO4S8SrrrV73hUkzTKruu1qaLzxBCIroM6rDvtrxiQZtw7jZrOBVQetT
         qUjAXew9n+Ln7u76WqJxqGGlTqyNJt8Q2JsTEaS7Aqj2/Yfj2ep0/9L0rhibV7bC3rex
         PePg==
X-Forwarded-Encrypted: i=1; AFNElJ+yfTZuoOMSHPBAOmjWMeplBiUldR/XikGmS9QOOVE5sXRm9vPBri+9+OTm7PJzWv7Skmjrpxa3IXzH3Ze5n5En@lists.infradead.org
X-Gm-Message-State: AOJu0YwoSFYwWSlcnLu2e0H8bIsXB7RFQw3XNZ+s7186EZgUx2ITNC1t
	6hjbhOdALcat4zeC1tmAxi4H5moIMOxPsN7g2aAQd+dyi4IvBzN4+kUZ
X-Gm-Gg: AfdE7cltA2B6I7bIsdmAKkh7xuWBJ2jse76KzkD/Ow1aRMFycuj+5+b8Eu2x1Ppfr1T
	GFCSFPjib3uvmkEF6nixbVwGCRJoPr7bhvujnNl2IYdlH5Y49DHwraIxzxVe2BNxWyUiKxpBRxG
	mkj+CMBDm9ze2LaIDgVR76H2njwbp6UgNp/hZoA38l4PSWfo0NtsNyMwuHrBxTAq2M2dBgHOhFY
	wnwiDsHkunroEXR7sry3aqh71OCZNJn6mviSMwmsNkR2Saek9x25RSEYRIiJFrkkzQWxjU6ai6U
	oKlkXNw5sKv7J+weEEeSaXYW41ciVDPQ2BuZKShEx9qRGaybxlc68lxWou30HCnJZX+WNNC9dn6
	ZntPynwB76yFpkoc5xMr3SFa2icU1wf7U1J+Fo4uxkSmCX7z3eVQNdX0p5mfdOt6z/QUbpLFSUB
	Q7sDEJRugV/22cRRalHp0EI8FXUkQefyUuMDZtf17za+1Yk8IjN72c2eKFJqMu+J2XQLQJYI4Gq
	IYa4/dDnsK3xVubSqizdbzoh9RWrqTNtVLU
X-Received: by 2002:a05:600c:6986:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-493c2baca0cmr125928495e9.34.1783068370735;
        Fri, 03 Jul 2026 01:46:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 03/15] arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
Date: Fri,  3 Jul 2026 10:45:50 +0200
Message-ID: <4e401b619fa0a88ab89b5d1685b61c43a1802b1a.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014613_205150_F16E5F8C 
X-CRM114-Status: GOOD (  10.05  )
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

Reformat the fsl,pins tables in the i.MX8MN VAR-SOM device tree to use
consistent column alignment across all pinctrl groups.

Align the entries to match the formatting already used in the
pinctrl_fec1 group, which contains the longest pin definitions,
for improved readability and consistency.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 126 +++++++++---------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e1d2e2a72e1f..71a2f0866822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -368,129 +368,129 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x141
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
 		>;
 	};
 
 	pinctrl_reg_eth_phy: regethphygrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x41
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41
 		>;
 	};
 
 	pinctrl_restouch: restouchgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x1c0
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX	0x140
-			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX	0x140
-			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B	0x140
-			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
+			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
+			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x140
+			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x140
+			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x140
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d4
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d4
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d4
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d4
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d6
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d6
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d6
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
 		>;
 	};
 
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
 };
-- 
2.47.3


