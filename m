Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C708FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcmE5GvhTGMA/T7rAigI/c+hEubQsDNBvymq6rCl2mw=; b=bBZ4JKfDuQvHUCMZe2f2aGRrPc
	olI+sEK6zEWRY8RnndkMROLNLiJq3TaMk8EGOpAyXlSKWNvh60PJR+OfXuYCfwXJk8Pv6DvAmLCNJ
	IkKWnyrPZdGBUFuQTjg9TswDiGNPA/7R0MKOanqHTz101xWJiCV9h6p3sfXL4xf2IFcTrBaro9+1r
	xAw6CrG1SRjnPxWshEsfu6hskW1JCVgkUn7Y59Gh4G2NfKOd/dwj25iJMKu0duQ2vkDAo28MCl2Dw
	CzhJUsjGvPbMJzoFSyNepFBfxm7ZZMjuRkzTOj2jf75onNkPgR84ogFvrHRvT3x6lgA7Xg44EeaQZ
	3oDVsEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpmh-0000000BXAF-171o;
	Thu, 09 Jan 2025 10:29:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpkH-0000000BWSf-42nn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:26:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so407792f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736418392; x=1737023192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcmE5GvhTGMA/T7rAigI/c+hEubQsDNBvymq6rCl2mw=;
        b=rFJ/7aqwMYAyCFGfNv9i7urZjivLGnxvQe2D/3yrZZ7nQtJ4vEMyB8Bst/7y+3Aww8
         6gXqRaW0vpC8tZP7VYf15Gp4paLphIYDEdZ/lZtT6vTDH/JDbTexnRsLsNwzXhEIq998
         XOgb5uNkgk8XW9GBM6o9/nyWExAoV4bc5gvnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418392; x=1737023192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcmE5GvhTGMA/T7rAigI/c+hEubQsDNBvymq6rCl2mw=;
        b=fckZIDdEFJYa2ykr+KIriokINZpS8EL2dsgOgoUGC836cYCwaeI/woOjxnHNEk6qyu
         mrH5CkFhIYhgB/T4k4JGvgUAwtl390qslz4elvnRY9I/R/koy8FsbCcwuMDUa6tCv8em
         WcHo+xNL26OhSa38p2mo+1PoZnwoLlr2cnEnU8Nj3Fj9TuvcZzujnT0d0MHKStIYtBeM
         0Ek2zNGYo7qAcAj22CmIAS3hSlzUGf/L2FQTFwv0GNUz1NUXhiNkybfSYMuvPdw+Oi4Z
         u4lCykqvl1gRZlWiOcQZOvC59WsrAma6VXSUnAsAl7nWxRib5kaYoIK/Lshc0JtlaWqd
         nDHg==
X-Gm-Message-State: AOJu0Yyx/zUPywy9e5nTNN1AhyJu+aBklPpvQQDkAO0I+x3nYIu/D9Yg
	KfeZdZ3B6bvNfo9tUBQoffzASy5EKW0J3Os5LJ7KglNU7yvmE9K5ai36YPnoq4g=
X-Gm-Gg: ASbGncud+wq/B4zj33fA/SUetgJobP4IVtGktxVtoK/LHo9gUf1EnqOmOHdkTbKXzhD
	cyf3Kmo7HUd8SkECLTepXqM0ATvkkRp2puU1M8P4HIlA3YPLic3LkR16u/Q9iIHugUkcCrEax3B
	n/VaAjCfzl7elsGzjTxMX/1vOjfuUbqYWzAARQEb16jla+2uTONJNb6AdFw/LDuTegZsv2z5Ek0
	KsK2xsoBoK/FEJe+aQbTemqsszI9HkIGlTP+vD5QuQpA70Lqi/XP+QWZmgkRaKcN94W2ZRrVgvj
	/XML7yht1eN8xXb8ZUMaZY+3Op/mOjZ9Kchp9XM8xWpRABYnnira0Q==
X-Google-Smtp-Source: AGHT+IGSz7Xtig7cG6CqnUAJvaP//2B3UQME42+mHs8l4qIfBd/THTZ51cBpS4XC0BRBoLcZZmnbjA==
X-Received: by 2002:a05:6000:4607:b0:386:380d:2cac with SMTP id ffacd0b85a97d-38a8730a7bdmr4758466f8f.26.1736418392520;
        Thu, 09 Jan 2025 02:26:32 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38d013sm1435595f8f.58.2025.01.09.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:26:32 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	afd@ti.com,
	Romain Naour <romain.naour@skf.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Thu,  9 Jan 2025 11:26:27 +0100
Message-ID: <20250109102627.1366753-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109102627.1366753-1-romain.naour@smile.fr>
References: <20250109102627.1366753-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_022634_002468_AFAD3C27 
X-CRM114-Status: GOOD (  13.76  )
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

From: Romain Naour <romain.naour@skf.com>

Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
(CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
provide refclk through PCIe_REFCLK pins.

Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
module's PAD IO Buffers.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

v4: no change

v3:
 - update "acspcie0_proxy_ctrl" compatible to "ti,j721e-acspcie-proxy-ctrl"
   since this property is specific to j721e variant.

v2:
 - use generic style comments
 - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
 - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
   ACSPCIE buffer and its functionality is the same across all K3 SoCs.
   (Siddharth Vadapalli)

   "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
   J721E and all other K3 SoCs.
   For example, see:
   https://lore.kernel.org/r/20240402105708.4114146-1-s-vadapalli@ti.com/
   which introduced "ti,am62p-cpsw-mac-efuse" compatible.

   The same compatible is reused across all K3 SoCs:
   https://lore.kernel.org/r/20240628151518.40100-1-afd@ti.com/ "
---
 arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts |  5 +++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi          | 10 ++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index fb899c99753e..741ad2ba6fdb 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -859,6 +859,11 @@ &pcie1_rc {
 	num-lanes = <2>;
 	max-link-speed = <3>;
 	reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_HIGH>;
+	/*
+	 * There is no on-board or external reference clock generators,
+	 * use refclk from the ACSPCIE module's PAD IO Buffers.
+	 */
+	ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 };
 
 &ufs_wrapper {
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..32a232a90100 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2024 Texas Instruments Incorporated - https://www.ti.com/
  */
 #include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-cadence.h>
 #include <dt-bindings/phy/phy-ti.h>
 #include <dt-bindings/mux/mux.h>
 
@@ -82,6 +83,11 @@ ehrpwm_tbclk: clock-controller@4140 {
 			reg = <0x4140 0x18>;
 			#clock-cells = <1>;
 		};
+
+		acspcie0_proxy_ctrl: syscon@18090 {
+			compatible = "ti,j721e-acspcie-proxy-ctrl", "syscon";
+			reg = <0x18090 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -979,8 +985,8 @@ pcie1_rc: pcie@2910000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 240 1>;
-		clock-names = "fck";
+		clocks = <&k3_clks 240 1>, <&serdes1 CDNS_SIERRA_DERIVED_REFCLK>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
-- 
2.47.1


