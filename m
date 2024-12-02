Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC810D73619
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YQPjFrGxUzPXgGYDSfzbk9xwSYIQ5wTw0sR1TTLwdZg=; b=XT/y3cXz7FzT60WbP3mBMPBQ7y
	pYU4wenBEVaLehdypddkf4Dwl8wm/oZaCUyzZF3JIJix+Z2Sg18LZDkYzb36+sznyQio4VHN6FHb9
	3uCAHhDHnYXO7oRzi5N7fDeJCVXY3MbHix+lMWiirxiKep7mAWNHWfmqYyp//JpMJvyBEJpOa+bA1
	xrf4Nx5QarCdnnELNRzvW/RHSl1vyKKY03NlBhbJ1Let2UcgPlU6OwirXJRa4znJTPQt4fSwMow23
	wD54MjNFtHedEi1jitMvPxRTOHZlr6Cx305GkY/WeOhSjOZbQyEyfBItY8lN2IEGbcI5uXf0XJBlf
	tsyvm/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3QQ-00000005gmR-47Jo;
	Mon, 02 Dec 2024 10:13:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3PR-00000005ga3-1gSi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:12:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a10588f3so24855285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733134323; x=1733739123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQPjFrGxUzPXgGYDSfzbk9xwSYIQ5wTw0sR1TTLwdZg=;
        b=PvUJ2ZtHoPzaoz9O7l64vI0vhTn/ZitU5P/+H9e02QPhiwTgvl8i1vhj5AMH3ZGt+v
         wDSAGlpoMishwKqVb339DmEfckTC3Ba9Qt7jwM1bbnrsJybmJSSQyJVEQz7X7eje/IOx
         UhTEFFuyiGsaknAEnhpTJY6dODIhpPFE2E028=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134323; x=1733739123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQPjFrGxUzPXgGYDSfzbk9xwSYIQ5wTw0sR1TTLwdZg=;
        b=iYtlMv8HD2+/c8L08p15ExQJ2bPoV5IkhjLUBkqy0tvnHQeFEHMYHZxqS4VWyp8FqU
         G7eskP81yL0bMs5PovB9oPB7HTU435EST0r331vxD+5OHqrsuvd4lfJWjq609Y8+hEDN
         BCyNCHoVA8L63PwJOAGK/xe2iq+23C8eSZOOKlE4nusb6buIW2IwQYCan8m50/YqumqF
         UgEcNyloAiiyO2ERLMUz3xq5QNDzB4yKbvJKjbOpEMa6CFt4dybtZRLaO26E11CI4YCz
         9/Q32pgXyl3M+eTnILvVfe+43bATjx8pfT25nnBaYVoqmjKm8J8YErtXH37eaO35LWSD
         yt6Q==
X-Gm-Message-State: AOJu0Yx0XYyfq1eqQOfNtJ+mM2OAaevye4E8neajcX4Ka+ZVui0cptYK
	gEFRlVhFqVo7lrDC6dfsCMAA/Kyh6Za2Qar7ZCZAEaebaZrlh9C7zDw0WiAXO+M=
X-Gm-Gg: ASbGncv8fJe02vZ267hXXVp/E8CX0hfOOwRzV8T8FBATzovRvIchMehDwlghD3OObf/
	NfUjWvaVYZytIhty9vx/aBC++1IP2BDXpT6wkb8nMJdU1PDIvYk71sHrvUSb9TSko1cTGV+76y/
	HdsOx5px7LydA6AEcvf0ZtpdxquUJcboU7HxmMBMkXaJhqEJTtyCU/RMGSE34Hsz1UKFnCkqGcY
	M1SidFtzKBkoIKTN3rNsWEy4YbasKKI4mLIkn9Yv9rH3/6Yy0gcstJ2vXT7ZR/gZxe7/dJdYlwg
	jq/zXviuy8/schQHA/Xscrqf6D7Z0mIUaHk7gTzBnClNIE4=
X-Google-Smtp-Source: AGHT+IG4GMzTCNAiDXoQ6IfMdGYliGKIimtD8bjQyryGARkZpxz5JZzdvAJtPu8GPuKep9KHnrEIyw==
X-Received: by 2002:a05:600c:b87:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434a9dc3d08mr194372895e9.11.1733134323371;
        Mon, 02 Dec 2024 02:12:03 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa763c50sm177341885e9.12.2024.12.02.02.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:12:03 -0800 (PST)
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
	Romain Naour <romain.naour@skf.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
Date: Mon,  2 Dec 2024 11:11:40 +0100
Message-ID: <20241202101140.48778-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_021205_709567_8BD6F134 
X-CRM114-Status: GOOD (  12.54  )
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

Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
buffer and its functionality is the same across all K3 SoCs.

Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Romain Naour <romain.naour@skf.com>
---
With this patch, we can remove "HACK: Sierra: Drive clock out" patch
applied on vendor kernel for BeagleBone AI-64:
https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b

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
index af3d730154ac..b9bb59ce4ed2 100644
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
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
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
2.45.0


