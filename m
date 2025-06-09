Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF9FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYB+Q6YC9SGFtqV+6exS/xy0HUzKtpPCAP8LxcrZFik=; b=syJE8CuyUciXiZouj9TM7o2+Pp
	gMlOBIDXMhQU2kfBQSqecIpB6Z76fS9MrvoFVs/8iKhpHQLgOENLFRCRajE+35BVFNkJtdvUmjyyh
	ULAUzGHwaTgB/R+35CBWZjIA7Kicceu5U84yM8eCCze5JiiHam+gbGbSyrX2EQsFGiSY7yaH49/as
	kZz3Yrb2P3z0ycsBReucODZ0i3pHfAqDpYaD8RPCNe7ve9Lm4DOxij3jMyZFhdvutgVi8kwBSudlk
	+xaBETWKDTTl6c8JOyKGwr0HdSr2easTivL2bGwBp6vcO8J0jpWjGuGgTRbzjaJQD4sEBq2QBquc8
	oVQ3U1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZcu-00000003tIn-03Hy;
	Mon, 09 Jun 2025 10:21:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZYe-00000003sRc-04q8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:16:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ade58ef47c0so167742466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464206; x=1750069006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYB+Q6YC9SGFtqV+6exS/xy0HUzKtpPCAP8LxcrZFik=;
        b=ZqVNHA23LuaNjEt/Ho/r/kmMLI7hqZ1SvGplNDTnFHWO62q1spTy1BjK9Jb+K30EY5
         R+FLcsKaFWnxGYB+S7O/zRdzBbVhRDpOB/dlhE/TCsgN5jH7VrZJk2fHXJqlNXkR6Caa
         r3812sNY/QZ00fWadlXYYwmIt+wjOuvjexBQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464206; x=1750069006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYB+Q6YC9SGFtqV+6exS/xy0HUzKtpPCAP8LxcrZFik=;
        b=lyMdljCYf8zk7O4eORjXV6PjBTAw8t5E3ksA4xMcofD512oN1RzWo9/M3VKIkRaoW9
         z2HFxAnVElJqpZNEiokWVprv8mxSI21ZSqN35eqf3dXLptAN7Fz5pnVI3DHZDQRa6/ct
         rJB+NCWXYa2Q6PRku3cQcXWAJkPzDnO+sL9xWXVeATZV9x/GQp3qv40u47JwXWn5hkKC
         SsvEFU/j0OrMpXZhq+rWj7AcCxyMJHxZdJfCZml+nKcDCIED39TdYc6je9QoJQZKkIjU
         vNmfkBym5MLzFaJqWRFkOMsJdf+Cg4hKiYEhgpr0T9ncCILTYKmacjgMiMheyOvznUoU
         BwYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3bWg82y35w0szlP6hU4lfPkJpchIccsEGtAaQFU8D3Hir6R6nZSg5uTqdJR3Pjy32Il4IuNRB8SaPThxQwvNk@lists.infradead.org
X-Gm-Message-State: AOJu0YwZxyl8JLn2Bz9XsYptne4uHKucp2k0RZs4w0Ico+OwXFPuQba2
	QDcKcZt0RB469lsdBdOY6jWz0GuBY6Gpoj6etf3i9JOEvlKshi6XX7eCOb9pzbS0vRY=
X-Gm-Gg: ASbGncuIxAgdHFhSlBTWU+T+meM1io6ou/+7TeX61DEGA6NWzcBqSFMRoa2cLuLOfY+
	nyhYP3hRv2CyqXSoJcqRWQC0K6oodWtx680SAmDQufjahM73Jsgut91s2vxET/LxfnchdMo7Je9
	9SWMX5JdTfgo6XYnUT0M48LPI9OGDaUZb6lpL1Z7s2lWJHP6AzrdjSiQKsFuwO3ngpVUdtneLLA
	Tn4tsMcLpIyo0Ih/PKc7SgBnVlq9qZVe++OyIsV7XapJxfCIY2lJeoeUa2XnT8SS3HnfPQL9MKe
	L0GHtXIIpXa/mnLEyzjRfRGn+DSOqXbOZ8MJS/NYHz2ugP0gYStnHisixjpXD4UPf3kLQ4e6L2Y
	EQm+Tbm65ECXHyx9amPIjubthboCVkZpx4D5WHVc7
X-Google-Smtp-Source: AGHT+IEzCt2lpQuk8YPidZB58M7MjCM7unNRh1I+YNBu+qMokeZXCrvTuyac3gx58Za4jW4DRVeD4A==
X-Received: by 2002:a17:907:7f14:b0:ad8:adf3:7d6d with SMTP id a640c23a62f3a-ade1aa7dad1mr1032683966b.21.1749464206474;
        Mon, 09 Jun 2025 03:16:46 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
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
Subject: [PATCH v2 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Mon,  9 Jun 2025 12:15:35 +0200
Message-ID: <20250609101637.2322809-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_031648_056709_0D1F49A8 
X-CRM114-Status: GOOD (  14.11  )
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

---

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..38971f6512a2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,96 @@
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
+
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


