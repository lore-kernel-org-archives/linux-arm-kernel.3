Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FE6FCB602
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUQBvmWHHGMJHsZAlltCWCeup7blkd+CdmrZNVv2zNU=; b=0vaLcyoPhmtwTA2mL0rg6v6R32
	l8MMSIE6XQd0vbV6l+aDq6zaRd/hryKuYW9khcvFVgfJ0KErqWqhgm/KL26E0OohvyxNd3zdHZfvz
	boHARwYaAW1VDTc/PRaOmUpS17aSUKc0uaYWsqEGY4npapsLRkakDkKwGhxRq3GSYj4FZZruD3u04
	iiRx6CXsq5bBP1kjdNqfOc7ljOGLndorPvv6Tm0nbeAruFiuMGqV7QUoqV4So7pge8JH5DI6PlAy0
	pwlZbVsVQbeReaJwoT6rIffer9cTVnezR2OQnWPGq+eqXKoW/6lxRon1MdRbIsBBq8VZrQEjpYhIu
	P48TpbtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu0A-00000005KGY-0VG5;
	Sat, 07 Mar 2026 15:55:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzx-00000005K3f-0J1w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-483487335c2so85649885e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898923; x=1773503723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUQBvmWHHGMJHsZAlltCWCeup7blkd+CdmrZNVv2zNU=;
        b=b6N0MGyhJCe0zGCCCRoew6S94SCPQphrPYvlzs/NRUMHQgK6/o6+HXX1dHdEl+qAx+
         9UhB+dB8n3GnMWlDsBxciDvrb7By8iSLPMFJqZliLQQUgkMU+JSAxcndX76edf300cU5
         SymHAqyeR8hHP9m+D5+8ZLBFqm3SR6n0f8i4uG/hfhI/cr7MdkdJJyIed9+63tLO/1bm
         JPWYgXLFmHLXlXvbpN+eILa0olER9Qczzflof12Wqbaz1s15S7r3S23cNYkC7GG7n3UC
         HWWkhPsyg/PM580Ju8JFUit8DkLR39x/arH8KxQGKVMCxNL406X5oamVMNIuenWey8Us
         Xvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898923; x=1773503723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VUQBvmWHHGMJHsZAlltCWCeup7blkd+CdmrZNVv2zNU=;
        b=NsmBmM5CUZ/DJwrKprR8QQsEfvrpksBQtHfC3fMfZquMF9+r1M78Ih06ACXSTBWnkq
         C4tv5lNm1mtKmBI8o8lQe25EUc47w2g1pcWjge3YsIzl6x0JGKsdVVMzx+lADrfPTdBb
         d8BQfCPaxsjH3TlmIO2BYe9YPvdXb8VhLJj5BSNKWBfvvjoNZQ1YmxBHNKbOolUom+PZ
         zXQfo8UfjjhUuUZQ+avZBSXrhJOBXiT0Kd7OGIL7tKNRrYZG8yhhwrZ7Z9P3x8UwmUgy
         b93ws0S9NScIK5uO30qV1gMPYZLSa3vM6ax3Ti3ayQ0doF5tyDZDIobdSXe++9NJ6UC6
         lzxA==
X-Forwarded-Encrypted: i=1; AJvYcCXAsCOAlri2RHLaZ1jbS5JQ/+O+abpFUlaMK1wWpnP9bZQEMPVNUOnzakQoHjQ1Z1TYJBfdaWtVXFp8e6Rxt22p@lists.infradead.org
X-Gm-Message-State: AOJu0YxwOYl6zzfFTfw2NIYZ++kCNmJZHkf+k/XrMIYqXhDuE9od7pBr
	iH/tpyck3HYyjDFtTIGUt6SgXwRUF3dVik0diuiOOyQy+Wd1O2fn/vTz
X-Gm-Gg: ATEYQzyxuK158AT/O17DIQKZ8ZBcGv2hMwnVIXn/rZuqhuhryTt27nzMgwvlFm6xrLr
	UTWwYcqMnJWiDY+TR3NTpy8LXSqXwsCmNq6PJ2GyaOe5DbfGtXjdUJDom1yInc/6R/yZUtF+0Z1
	Kpe4kjoBVJuO92DQXxOCVXyG+LBDvLYArmaA5NzBYyYm5QjcVZQ1uphNaI/x+poE2J9qyGNQ5BL
	gvSjeXJpINfHA1h7G+lanbUM3ySkhN1i4cL7bOvKmO+tG528lRLwHyEWCXeCqNoJhy27s73xqaR
	fFC2GWRRpp0fdSiZrqyNFNbPse18KA/0dc+QFwY1Nvp3ORWgUydwiMGcjmcGQwJDAJDEz6VxXSD
	1tnBybfoW42hm6w25Jq8doDoyLmdYODAMrEEZ6lH/YNdial9Fo9ppql/Rv2Tamdz1EwhVW/r+EB
	oGv5H6AvpTbUroplVZCLE7si4ZNUmGeiyxoBTNqVVhipp0jz/OuyvF78ZXIcS0i/MJZCL69oxsq
	dWkaCQutP/kqYHaI7bj0lm5fw==
X-Received: by 2002:a05:600c:a413:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-4852fe93699mr24092615e9.30.1772898923352;
        Sat, 07 Mar 2026 07:55:23 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:22 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Sat,  7 Mar 2026 16:54:47 +0100
Message-ID: <50e9dc6710d6b2fe48a509e463e04e6ae8b21e4e.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075525_370686_5DDB1A3B 
X-CRM114-Status: GOOD (  11.26  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add clock-names porperty along with clocks

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 9a29c81b06eb..0ffee2d58122 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
@@ -17,6 +18,12 @@ chosen {
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
@@ -205,6 +212,29 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_aux";
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


