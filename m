Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81CC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvJsYiQM+mJGanwjIrW9x1n983u+zy15a4QrJmtJhu0=; b=Z9PHXJ1qjXBT4sfk0UApHnxPGS
	J5Mbmcca+AX2d9/Uny+qCy+mUcWeT9842nCSV2zYsywyu3ngx6rSmRL37HLZRgjwALCg2oksyj3En
	9++n0GnYDwiwECPvwX6DIq3oyvzgNX0H5+IZWtRMMM0PnaAZi3NFLrZumjfft8CUxN7hdipZOe3/b
	Udvtf3gN81uUK/XTe0Utnm7ZqZQpaDKtJNgxUimd3FLhPmQo1Dv1wCMkAanPIdjRGii8NHYz/9zxr
	Y/0qo4LSiC9uMPDF4r2E3DyK8mx3q/CYr+9fh0UEp62uxktuMEIqCvNwlYQ0YsVS0AJVhvozFz1w0
	DdM1M0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyI-0000000DE5G-1w3D;
	Sun, 28 Jun 2026 17:07:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyF-0000000DE3o-2APP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 17:07:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so18625145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666421; x=1783271221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvJsYiQM+mJGanwjIrW9x1n983u+zy15a4QrJmtJhu0=;
        b=W/qALolg4fFDsYKm/BRlWTecKpTG/6h56UVpaMkkR7Mkgz2atNT5V6xzQyOxmcm2Uq
         +XuqiwLnfT4T7W0pXaDi7vu54mz55TLoB9M6kdQsQsLt5CAlaXV6YzIj5wszRWCqEq+0
         l+cdbWTk0gA6byN09s5LOf0uYDScgOt6fwszV46mihs78qU0rFC7mmYd3ImlCevf56/X
         ak3A4BKiGmiaNc5HzTi4eowgKh/mZyxcxkrC7vwxT4Gja7I/T1hgj5koEgyfOp2OE0jX
         PLHJgWR7FRgR2K5YPSHEamgU+oAvbqs/NjYlFRWpI2Z/ldk5R5S3UdlVqqRridyTf22Q
         UVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666421; x=1783271221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvJsYiQM+mJGanwjIrW9x1n983u+zy15a4QrJmtJhu0=;
        b=I7BN+vkOXNXSkHrpDRxCOEsMwmGmg3GlU+OFxeDP4QsvlvRyJQJ3yerZC4/XMo9tkl
         y/ADZXB2U7enkJOrRgGzoYiqgaIbPd3ZHkTqShIEmRldSLSSHXlQM6o3cHbprvC8yaK+
         tlzeQuGWluNWerlpJK5LIY5vJ8tY0t8gnxRXd5ap6n7M09GojjZZEpxIdTmh0OJ2ml/i
         agd4CYRrxIITl+UhjhUd/fk4Iig05051Uy/X3Gi7dpsfxwp0gUcenXeA6fcof6uoQLdu
         o7lSkaLGZyqtQgqxPFa0zwt15rL5hb+DAePVXFQgeRovNCNgne7V20DFViEyWS+jjtf4
         XCtA==
X-Forwarded-Encrypted: i=1; AFNElJ8mAbmiWohQmp0lhU/SdSEd6ARELIZB81WNwsSfNjZ6NvkvNt0ZfUwuc3daLQS55f7mpX7M+QLgy6KGSwK1+xQG@lists.infradead.org
X-Gm-Message-State: AOJu0YwWMlCAPrZpUPt5eOLWPo8oFmZgkO/pkcfEPRig9MEQvBGI4wvo
	e07+w4KKAiVqU+5kNHQQv7loCeZRUelus6pOrS9jchDykHZVIlEVmcZZ
X-Gm-Gg: AfdE7cnCxYx1Sav94NVP1jLdea8VXHlQZL21EuAxP38wiuO47ShG45SmKqOGcPSeGKk
	23rEj6ZiBgz0F/wxKNHVEsfN5HLb9NcDuroneRcUlyNIWM/N53fWv8AbzYjfTDv1JZMcr1Zyr+D
	Ca27uEt4WS+9RMSgrzx8Lv2XNKkRfEXLY5b/GOcokC9wR1Ih6ko8/C7gf6H0NBDS6zN9d7w0xW+
	kUoW1nQ1RalXcRf/5z/YX4l2xYPH9FAUvq3p5cIAKvD1Gsj25lh2rGxTOfzawxnFLlV9Ry8qszJ
	xmYUQWkKs9pyDwOzjpdRayoPmlo+6BUiaUYr2KYazEcyxVc4DS565y3fBICnwmcOVlTTOVVz9nQ
	zlzqvQfhKg9BiW4DliDOCUIiD5QvlMcwlueXYNWmBvm/QmqRyFt+ZN7GQRnfPlnI2QMi1cSeONo
	KY/8MIANOEoWzNiNZWNYdQ5m39bZOQNykBcevkjXfTR9yljthckbgRFYtMCX2yq6MdBJAic7cyI
	T3HMH3dvlXcwzF8QLccRWqWBw==
X-Received: by 2002:a05:600c:4f8f:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-492668b7599mr219013735e9.35.1782666421372;
        Sun, 28 Jun 2026 10:07:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
Date: Sun, 28 Jun 2026 19:06:46 +0200
Message-ID: <d89ea82a4bbba9b97c7128b4a1c0e5b857a921ed.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_100703_911244_378E8940 
X-CRM114-Status: GOOD (  12.60  )
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

Fix the Ethernet device tree description on the VAR-SOM-AM62P.

Enable the CPSW Ethernet controller and correct the Ethernet PHY
description by modelling the PHY power supply and adding the required
board-specific PHY properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde0..be19cbaffc4b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -113,6 +113,15 @@ reg_3v3_phy: regulator-3v3-phy {
 		regulator-always-on;
 	};
 
+	reg_eth_phy_vdd: regulator-eth-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_eth_phy_vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&main_gpio0 46 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;
@@ -149,6 +158,7 @@ &audio_refclk1 {
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii1>;
+	status = "okay";
 };
 
 &cpsw3g_mdio {
@@ -159,9 +169,10 @@ &cpsw3g_mdio {
 	cpsw3g_phy0: ethernet-phy@4 {
 		compatible = "ethernet-phy-id0283.bc30";
 		reg = <4>;
-		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
+		bootph-all;
+		enet-phy-lane-no-swap;
+		vdd-supply = <&reg_eth_phy_vdd>;
+		ti,min-output-impedance;
 	};
 };
 
-- 
2.47.3


