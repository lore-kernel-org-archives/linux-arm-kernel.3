Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8201ECD8CA6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=; b=2DS8E40qrGX1et/24d9PIxQ4Gq
	cGGUJQMKwU7sbX3u+DRXQy3z5k1107/RraZ6ZTCbqu5AqzFg7hqSgIrFnIZ2Cx0gzlIaqTmNUNC49
	e9/bOr5576QUF10YY8I1p00AqpeLTTqIduq9VeTC4byMbMIIHu6pNSz8rqhcQtaVJ6WLgEjgr5pbp
	ckM2NOdWMdjjSgvmZ8iXtyd4bOJdWqdDwCFEbU4HDQKpG5lyJJDRdZb9C+zxn+Pr34rwuL4ehMiCg
	y49W0wG4HczkRlVs9NrZPCRMoKjIdlaKLCGC5eOlrzHSi40kNfyZq3EpO+2AVp5PfnKEnQK3Xm7sP
	VnM6Guug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvm-00000003I8X-0Id5;
	Mon, 08 Jun 2026 10:10:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvc-00000003Hr2-1VZ3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4600ddc4017so2985844f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913394; x=1781518194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=;
        b=nEWTFVIt6fj9T9jBQ9n3IrIUgLN1MkbwI5XRDuycqLDvM6VC+RyH66V72NmUM91Kh7
         hDAkgHYJ7whoAQ0dnNewlTF55KOEkspN7ZZG/XqHayAIQQ7f9u7z0ww7MmB3KKtGx1+T
         5DOz+/S1yUCl5usy+DoGoOz5XOCRPRjcaR8JFuAZs5VUQAGItsPS2LcoCFyj+Q9Sl4YF
         RZtzRyS4jmWoSrV9GGJjqg5rZyJjkivPzSlI8uqToAsXkYWrW9a9W/fipFebUaGvYbs+
         gQOuZMoivcMeihJshejubDhuYPrjM5JnOJKENx6GfyeZDzK3kYfyoVt+5B6m3I24fa1I
         HmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913394; x=1781518194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROhWAzt0nmjg7jEU5/oWSczs/XecwX3hU3s4az+MIks=;
        b=FUys4ohJWNg3B5DsCOfevW7DTOf/jSYhi0WTaarKSiTmWnUU8oVgYxFY7J+YGhes0i
         tkKCpQ8lcc7kr3zYU90+jX1s29VsnTcbRTeNBykAiSfEKs+df7OrvJ9B2YCsC2ami6uY
         kqdeNfSeYRInXnCNKnpk7q0CbcOYU5xHDL52NSk3f/SwhzgneMWIKj0yx/iMEXzpusxu
         TSRvfz0hCdSgM5GaG5Xo1JRp7Nkth0ROV27czQ+hAgid+iYTcilmGXAYl1c1SVw8I3Oy
         DLPpYuxCgRINb/oKHZ3IF7AP5p77xM/GePs5kmRKL62LlXEQ+4dkkpqeHBEDlpuaBSJW
         X99A==
X-Forwarded-Encrypted: i=1; AFNElJ+eDudZOdQD6dWzYVIigREwTMBA8jbvaTt3wM3LwaR8vfieOL+bk7zWQSuuTN7GkDT0DXEOcsqEkBAZKCK5I9Vs@lists.infradead.org
X-Gm-Message-State: AOJu0YxaTJ3bGX3/5/zx+EcKgtW81O+9LmrySmQB1iTP4PkSV9CjjkCJ
	fpX3fnXbihwtvzicBaF1RMoxoW4nkJOdLY7u4yfJvsg4HhYwv7ErN4w7
X-Gm-Gg: Acq92OEPrrbhRskZtfnOmmJwWSqG3OHRBXA+JXCTZH7ggXDpmM11lv4GHPSKETBCKsN
	NF5wWVCz+nntRz/8J5I+UACx+8xGGFFz3Nrmt/8VM4cN82qoHjmQ9egHLYNwdmFJaaKwvxTJZbc
	w/h7BR6pB+cRIaKG3xgps1mP9OpX38kLV4Vw3PsyIntBbmFMLiKOhYflhsfKBRym5EyNWiRVnjK
	j6vLhJXVqtQRKV2oSHTP/1VD1y7CXBNTkOCD1NYGCKDgkxmrVBEw2SEc+dxxkgmAxAGCzL1tBKH
	aAtewtLZrNJEuFNC18MNiwhTQujg7hOXx9OsX4M4UguujYDgb/nriuuTnlmo1/9KwexczEHLJXj
	e9TLcrJrygLxzUzfLH5Sz949H8cEzkPU1JzdzfFClryFgqEd7O9IDO8c6uCiQdmDuNxnxzuLuMm
	2OPjjcg9cHVf5N5mAKMknYfVWEgs+OeunlhYeuzIxKChLiJUqjmoYAOmlOqid8QCqoAhDJGtI/A
	bRZ2JET+SCdvIvFUf6kPNJzIaXoWU8/J1HPMJ9Vmo7hoGJf
X-Received: by 2002:adf:fa89:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46030501f74mr15797982f8f.25.1780913392055;
        Mon, 08 Jun 2026 03:09:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:51 -0700 (PDT)
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
Subject: [PATCH v4 13/14] arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
Date: Mon,  8 Jun 2026 12:09:31 +0200
Message-ID: <302638ba16d4684c5b0bf8660a42615dad67f3eb.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030956_436661_26810CEC 
X-CRM114-Status: GOOD (  12.88  )
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

Add support for the second Ethernet interface available on the Symphony
carrier board.

Enable the FEC controller, add the MaxLinear MXL86110 Gigabit Ethernet
PHY on the MDIO bus, describe its reset and power configuration, and add
the required RGMII pinctrl settings.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Fixed eth regulator

v2->v3:
 - Add FEC controller and MaxLinear MXL86110 PHY support

 .../dts/freescale/imx8mp-var-som-symphony.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7ad57caa0f1c..c5a38018d494 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -66,6 +66,24 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_fec_phy: regulator-fec-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "fec-phy";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-enable-ramp-delay = <20000>;
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -106,6 +124,33 @@ &ecspi2 {
 	status = "okay";
 };
 
+&eqos {
+	mdio {
+		ethphy1: ethernet-phy@5 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <5>;
+			reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy1>;
+	phy-supply = <&reg_fec_phy>;
+	status = "okay";
+};
+
 &flexcan2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan2>;
@@ -363,6 +408,23 @@ MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
 		>;
 	};
 
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0				0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1				0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2				0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3				0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC				0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0				0x00
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1				0x00
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2				0x00
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3				0x00
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL			0x00
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC				0x00
+		>;
+	};
+
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART3_RXD__CAN2_TX					0x154
-- 
2.47.3


