Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E7EE9A038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRFukmCvY+OSDRn1l1USalwiw2coOXo29afycHynqcQ=; b=JkhLtogBHL/KFAGSb5KglF9JgF
	QLSSNywXlEaK3CIkycS5bhssQfi7b5KCh8RsgM6i/I71TfKS89VcrvpdIqlLsBay/29o3hjPbPt8y
	zX6QOWbOOIvCq2yJsY2LFhl48jhmvcJN+dqg7x404TsB3s2Za6mr6IcqiaWErAvoiPMHdi+8Opr2c
	jDlBHKPmIkPKnQgJOAA4881Pyc+yz89tkV/O0CyAc5zZ1VOA59iYMybi0BlllKoYFq930SauURPfk
	uHPEjbnJ3GuAa1ncwsaxsZ2GXuMcVaMXJXHUcjFDD8Xa6rt08/pvOP53yTPtlQtrBtl66q/GKCSVv
	WlsYIe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ32-00000008kU1-3SoV;
	Tue, 17 Feb 2026 18:43:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2t-00000008kLR-2V9b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso36833525e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353818; x=1771958618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRFukmCvY+OSDRn1l1USalwiw2coOXo29afycHynqcQ=;
        b=nekZBG9PBaa1vMAyDhszoh3B0EaZPljeM84gvUf1037yhJVvCQ5IfGuUoKTt4BwjEj
         idVwMWLsvRsx/VvzDZyiMpsreh0qL5uiFeRQYIKy6Zv8Q340Qv+kTF7pA3hCygwW0iGW
         7afYGNMWdBMACCRwzC3hEW8zeL8nSjitvcxXnisv9u6ftiVK1soCnqItFH2xmh/U6l2r
         nRJOQ2eyEvZja5cWZWVrTk3sf/1/yvT5lT01cvI9c12YcAA/TIomtM9gETdtgt7/bJRA
         fF+KmauJ+AIX7jYrZbX5aIa4VfCOFon8TQ6UYDkqrtGytzcisugu+/62xg7NMSWaqZk5
         psXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353818; x=1771958618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xRFukmCvY+OSDRn1l1USalwiw2coOXo29afycHynqcQ=;
        b=REeCU4dSRIoOzKZY9mxLDLFVtvPyn8X8UlPo9mu4K/nf7MPsVDXn6AIICI5YrSkVrO
         AJ93qfkxDIPTcWlBS+Am8KeM4oK3EbUmkJAt7+rc90V4WiMZbbUCrFRXeYlcYsq/rt18
         8iWV3DSDYGgaK7KqKpbm4DQ+fqJa1LX12zZr14gvAPn9suc2wGJrQIoCzbbLduVKQ45C
         3KHOD77ECnTfJmumhX4uXAqdaehQWzd7HcS1Vtfi1XdH4Z8+1+cQCJmmZARP1OmBPjkt
         phEndjp+qG20DP7mfYWM4rY6qGk4qC/8OCLJwoydt7+g2RKYf14xPkomMvI7I366Y2LE
         p9+A==
X-Forwarded-Encrypted: i=1; AJvYcCWM4ff4XXfvEKilDfPCpW3+VRdlOIWrdWyLmavQE9rvCG3J6e+cKQJycH/12w8A7ZNjmmCQ2GHwOSC8oqnaahZE@lists.infradead.org
X-Gm-Message-State: AOJu0YywxX4VsFXoL07s1hjZbJDtdShO69knlBEU6glaF+HlUngTL7/R
	LeFTGn4e4taF2zsUbjds0qiGWPXAh1PnuqGhR0GCMLlyo73u1OQvAEGj
X-Gm-Gg: AZuq6aIdc0z5sJLQDX1QKgbq9tKkghmksdPJGsw0BW2kk1Wa1ATGToyvvWh91X9q0Pl
	EMvTKhNtnk18r+KaOquJ9/8V5dKkj197N5D0ovgYFpK+g1Q4QBWBADYPhnUiUG6qtygLNiKbDAG
	tw7+04DcTMxw/E/ZLoyH5If4cEtzDm28Cfhs09K8X3yZA0Zenn+R2+8Dy2w3yBpTWz602MWJoln
	jHpFKuvfDGfyk9VMWr40H+0E9Pi4Qm0Z03SySCZI9kGT5frAhP+06pKrQ+1fnmDmF+n75SuweHp
	cmC3bkFE3mX3quCtlXyJfZsSu2FGLmf5tUY6zdH+L0ZuL30qo1m32fAKQoF/5GVImtj0+NpTD9f
	wXRpqOHVHQyTII3apa6CBvyrXx03xtovNsFWS4/2uTI/nnlVtTJgC2uQL7oPIWZQMPSTuw3g2BT
	VxzM5zY9jr54iXK+JaTwSlS95W/hl+HEj0+XO3juiigMaMm2LxDcKxLdEE1KV+zWpLN+mImBCnX
	MOFaKmAf3PpFd6DlLZFlkt5LEd3Q6zvy+9f0fy4
X-Received: by 2002:a05:600c:34c3:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-48373a7b7bcmr244814115e9.37.1771353817903;
        Tue, 17 Feb 2026 10:43:37 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:37 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Tue, 17 Feb 2026 19:42:45 +0100
Message-ID: <70bac0277cdbf455e2a7a83bf6da81e93b99e720.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104341_070910_5E2AF79B 
X-CRM114-Status: GOOD (  11.68  )
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

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 3d9658edd58c..8c1e2c77ba7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 
 / {
@@ -15,6 +16,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -182,6 +189,27 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3


