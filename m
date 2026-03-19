Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F01091910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+83XzgDieAPhEX5V9IN75u6fjFMd/nb+xECP6VLNnI=; b=D1h6ZYh/j87rMqaMQCuIjwE0nO
	Lhi3GkPc5Etpo7yeucfo8lhLY6BgkUKwgrCx0iWDUhsK++JIMUcKnvvkPeA6sFoUJvgdvERWaJpZc
	bKpfO/jm3xBCvwKndcVvx3fwqFVzIcyV53ipf83JSpt6rVIp5bXKyAp1eOp3Ri1sUImdPfwUgtkBB
	+nGq4ujAmo1HM/aHUiVoQFVofrj3meuDUOZXrG50IgAUVZIUWfqYiDOzPyyE/sSa9LtjPyFnWnZVV
	thapJzNj0a/ocHjUTmg778MAmJ/7i4HpslGpEXMasCCESzNk6wpZWnfEbc1CnQH1iKwV7rYrq3lJe
	Y8EzbXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJv-0000000BNWb-2S0c;
	Thu, 19 Mar 2026 18:42:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJi-0000000BNKM-24Cy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=G+83XzgDieAPhEX5V9IN75u6fjFMd/nb+xECP6VLNnI=; b=b2RWS93tuyJYplhe54mqlCyWKN
	92VVW80aYB9aXZAFR4IAp3QHZcj6C6swWhz6gqZlDo7IGopSkhy888YpSceMnbZb6Bu7l/9uoBvbG
	qCWAD5m3Vg0R6wur2LWdvoU5GYwbgs7SvtXbcPpW2lbzZRYpnouTUNfqg7Bi9Glb7sOSLpAJTitQn
	0HxeaXdsW5AkSDcpLYg+8Gxx/CeQjCE8eyH7LlxSVjzPIyfnAAYSgKA2bsykhysu2dS2pF8CrBqUD
	aI73PRKxyPcPz+voeL8WXNm1kjetEmtZ11CoYVVZwHKIMwFkFfWH/oNU+aROIndo30BFevIaTR/QI
	gXge5B3g==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJe-0000000EH5R-0yU3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-486507134e4so15315695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945712; x=1774550512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+83XzgDieAPhEX5V9IN75u6fjFMd/nb+xECP6VLNnI=;
        b=i6sbB4gAwDPRSjdEHFhMdLSxilrVs/JuLQ3PiCvgQSbqkkhfO6u1kfD2eJgFeTJ+50
         7zMLyaEdD7frUE7c2js8eqIyJaB5BxEXceWIziTIgo2JUbHDTExTFOhPeO7oZOe+AWGi
         ZHcIbpn6Ffy4MoZ0tpnNjq/gvDtW95unxPBXhU9u5m7vyerFYefURyjhtUrOpjyGfJ9h
         rFLxYVz+ecrIQjTdb9KpEhqw4WhwRBh704qiJxM4h5lqLmif8Uxg/xbihwRVTakFf9NC
         s5YratBW9Vl5X856TdGloQq9hk4e2sic9LQeEmKyqAp6M6ImeeAG3ujUOFqId8PXsd2D
         e8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945712; x=1774550512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+83XzgDieAPhEX5V9IN75u6fjFMd/nb+xECP6VLNnI=;
        b=rplekNIDywj6cYTaJIoNIJkADCnaP1kvwMoBZOi5LTc0Np724Y936+XPo9l6ArMlQs
         kPNn9JgOmuvYYM5/TOElw9duI7XDeEq7/mZ0Th0KIAEurvdNr0q2blsGOvboZ/EzWU/G
         IZwvhrhC5r+6VerGi6/4pQ5RTqpR7CGMrkke/thMey9Q2uCU7Ok4Pr0UDl2/9CYxUrvG
         ugCTinNDZT+lW1USp8+nEjSsU4xyCUd1qLKeD4nElu7C/UQDiglILGXboI1Xcmkdjmzx
         wENoEBMCoNxB0I3reqLea0kOJcsJhnBUya78YbhOkP8Vh0MINWD3ztKa369F2LLsIQlA
         Ls4g==
X-Forwarded-Encrypted: i=1; AJvYcCUwwodvkOCQB60+jAE5JL3IK+3RlZ8/NUfpVwQh/dhY9cxZWFN0CE/cgR541i5fxdnbibkfnB7rGHjj6A68PlnM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw37Xmk+cpjelx1WwdJYbFi2VRaQeKnTaaBPM2DPYTztWgfKq/t
	mT4JzRr1675vAEHTCXrw8sbJAq/n4XtNH8wJLvdtIkO6G1So5DxRWFld
X-Gm-Gg: ATEYQzw5T48Nnf7is2J4lGTkfJ7sF9G8k/BrWlL6fOU9Cx0he9w6vtxWe94idb4Nn+n
	sVBpSWTSOzV6oBjyPsb3ZXtRYndrqKOLwHn+HDw4/ft84cEwtQZW8VuLKNktogLPHh7Ff/kss0m
	q1Ofa0x6UzIyXnrVg5q6pl1mKptjoH/4qJMLM8c6ORHG+kk9aB+qEI17v/1Mh9fgWeReBiOA9fe
	2NoKJ9ra7l5B7974ZLur7znStXkyWfPfQnkOV11POjLBeq/a4TOuMx0mwcEY/vXapYPLGThYVpp
	T8d7BDnZxFMA4r7+tt6Vv93lzTvOrrqU97YrseKnlE7FSELj1BfGeasiX3kzpy5LSNijaYnhOsB
	PNiB5bBInCdKm501eBQXpg/XyoOuuxrQZ/L7gbFnhk1EhCwpffRlTw7VJmaD34OIlwb42OtSrpk
	nDbvm153o3LdljMdIrf2OMo5ChBq/FPN90roLJf93byg8fxqgcrfE0co2i1qG1/a7khwpudJXpU
	JdZ6NZlpCFhUWzJbOSs1PQyBp/I1RJyIXsLh74=
X-Received: by 2002:a05:600c:8215:b0:485:4388:348b with SMTP id 5b1f17b1804b1-486feb5a3camr3504685e9.0.1773945712072;
        Thu, 19 Mar 2026 11:41:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:51 -0700 (PDT)
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
Subject: [PATCH v4 02/11] arm64: dts: freescale: imx8mm-var-som: Align fsl,pins tables
Date: Thu, 19 Mar 2026 19:40:22 +0100
Message-ID: <1bca84b1aea73bb7f542d48e1db9acf7d6cffaa4.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_184154_401970_82C6A5CD 
X-CRM114-Status: GOOD (  10.48  )
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

Reformat the fsl,pins tables in the i.MX8MM VAR-SOM device tree to use
consistent column alignment across all pinctrl groups.

Align the entries to match the formatting already used in the
pinctrl_fec1 group, which contains the longest pin definitions,
for improved readability and consistency.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 170 +++++++++---------
 1 file changed, 85 insertions(+), 85 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index b6560c03639e..da3c7332ec34 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -368,171 +368,171 @@ MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
-			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x141
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
 		>;
 	};
 
 	pinctrl_reg_eth_phy: regethphygrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9	0x41
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41
 		>;
 	};
 
 	pinctrl_restouch: restouchgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x1c0
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX	0x140
-			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX	0x140
-			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B	0x140
-			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
+			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x140
+			MX8MM_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x140
+			MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x140
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d4
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d4
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d4
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d4
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
-			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
-			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d6
-			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d6
-			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d6
-			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0xc1
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10		0xc1
 		>;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
-			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
-			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
-			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
-			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
-			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK			0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD			0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0		0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
-			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
-			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
-			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
-			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
-			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
-			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
-			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
-			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
-			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
-			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
 		>;
 	};
 
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
 };
-- 
2.47.3


