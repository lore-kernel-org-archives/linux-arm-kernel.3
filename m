Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F411CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=; b=Khlzei9mDi5hKAqOLAQKlxZLLu
	Spabt0YwnEG292mndAEm3LL7M65SVIvcUH5J/gMoFVXA1nDEP6o9G38hKmxMfA2olRV/wImLKEMq3
	NO8mjOytdkO2JYpKt0hMzSTx9Nw7iiWPx/L/rKASCkgMjD7pXSVGFB3dmQD2xmVAh4Fa9nZDdaOc/
	cYp6ucoq2CkySBqlcnvMs6It4pms5+RzPQQumYVsqEOmnBxxHQEhvkdSiv8mwuMpDAGPAVp9oFORI
	hozg362AnCx7kkai5pzLqTgKIXfHs263ewy3xtdLm6tUgvhQE0lyKi8xCEHa4jsnf7B+r14ctY9kF
	HtwXVCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeui-0000000CwBr-3ljs;
	Thu, 12 Jun 2025 10:12:04 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdvD-0000000Clmo-250R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:08:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-acb5ec407b1so129956666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719310; x=1750324110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=;
        b=THlrSZjGmdmmVxwyHGP0Rs9ir8Cd756oyr/dsi7++UlbLDiq29B2HxoU6ze8E1dWmA
         XJ8TRcmaoZ686LzLUP7DVHLWZsLkQw+4mBU0bS+gPuCtpxLzb7Kc+4jXScGD0M0Ml1zS
         zIep7/KtyhGyP+kc+q4XumDz0R2nCZ8xK0eps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719310; x=1750324110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOp2CZidLhOmD2AW6kGHp67OREEo6XfroyPiU2YyVaI=;
        b=osFxGxJCU+lsi4JybqANV04GqxECLtEQuxP3EsdxjIbzUitp9DLPwsD0RGVpOyserk
         PmeUc6FW/ZsOvH+FI2PwXJgzvO0hSAZ5al6sFg/yO6VXfaiZ/Fw25/ZkyLsqiiq9a/9m
         nHPpAiB/i1tnKvUsUivWnUT2cDZRXseVs6/oQsShSAd9FnQQL3N1ZKT7rCPeyct3OMZv
         XELi9xJE0pI0uoAPIlJhfvrlf2GGhlsxZiFooGgtdv9MbrJyP6FrMRXaSsvS8fnsMUMr
         /71SrxA3/zAyKUNF3hNOUjhOgDg0UbPSx8nUv3mggrzHhKp8JQKsQkvBnsc/+X6XyM1o
         F4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQbKPL5go6YXkL4e0YJfAE7nVTYkIBfVSTyMx7hiYK0W1NJ21FX69KIZgh2y12GFFOQy0AmuShlM6uqBCqakfE@lists.infradead.org
X-Gm-Message-State: AOJu0YzbbXApvnRYYj/MbemKBBiXksjrj85BslOvffUnBAill04+dh2P
	7bwQ5J4Nq8DoYrU0IaoEa8CyKBilE9a0kuNJhbHLDujQe+/IBSqnntKAdxsoEdaRzlA=
X-Gm-Gg: ASbGncu5R/vfIDmzqsfwxD9X9QIjlyAfHFfQkbd2UV4x+t8+LD6pUzxxZrnleeqqNug
	gQlcKUzioPMfTYF8EXHAOF0PDsnRs+7KNVfQI2oCI22ZEVO/0G2tUtnlMpNCf6V+UuK0ErTBy7X
	AYkktijSi94qjAEml+mvOqZCnFqO34eh6wFO/hDf/biTdn2Xb/xw1jhGccPQ9/PI46Yoz5yGDOe
	qXx3seGdl1kqpPeclSt8R7XWW1mblvKXuRehL6xo2oibM4gkcV1uN1vvXoJUeiiU0LWSDKEM6zY
	8Wlgyej8g5xMxKkdEpTFBae1JsLdTyH3mqqNroeBQyLHrHHeoRZuCV03Ir8mVzkjOqM//NK7PiT
	jGwNV/A6oOBu5P9djft7DAr5uFg==
X-Google-Smtp-Source: AGHT+IGFdYyZwICEn5pUqccNAy05uHrtK7vypSlXvflXDY0Q2wzkFTnD0yY8JVc3QiFTMxGE2CiQwA==
X-Received: by 2002:a17:907:9706:b0:ad2:2fa8:c0a7 with SMTP id a640c23a62f3a-adea25df1b4mr275919366b.21.1749719309960;
        Thu, 12 Jun 2025 02:08:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Thu, 12 Jun 2025 11:07:47 +0200
Message-ID: <20250612090823.2519183-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_020831_530642_BA52487B 
X-CRM114-Status: GOOD (  14.16  )
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

Support Engicam MicroGEA-MX6UL SoM with:

 - 256 Mbytes NAND Flash
 - 512 Mbytes DRAM DDR2
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v4:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..43518bf07602
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+ #include "imx6ull.dtsi"
+
+/ {
+	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	local-mac-address = [00 00 00 00 00 00];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+/* NAND */
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+		>;
+	};
+
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_phy_reset: phy-resetgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
+		>;
+	};
+};
-- 
2.43.0


