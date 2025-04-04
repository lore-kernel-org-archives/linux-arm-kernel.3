Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DC8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 10:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qrnOAx1Z42gXuu4NUkGGkg//gH1o3Mdb+pyo1hDqScI=; b=PqU3g5BQS7SZ1/bRF/SsjbG8sN
	L5gaSrIOuZwZORrhIVEmU+91CSWgZarljqbTyOxtEzwTaW6FR1DAo7DQlo0RtgINy7fvGDjx+SQwn
	rJUhXPqud0Up4ArsTlUOMItXrlFVdWtzEyxo6yPiNrc8vUc9JQNbCeva+apHwOXNLydasQWOPkx17
	9dicZNDSlmECL2YQy7NKR4cWOWp602e+tTXGiEpH9cCvd/fD19e+WnwU1DvwwvXqAhBEfblQvgNkA
	jXVZZcYgvGnXUamCvc9QkulrDL1d3izrEqbzMEYaFe8ZuAHV9+iq7wJt4X4RnAZRHhQiZV0LZ4D4z
	4MsdbU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0e4T-0000000BMlU-3KmX;
	Fri, 04 Apr 2025 10:14:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0e2b-0000000BMT3-2e8d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 10:12:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso11890175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743761567; x=1744366367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnOAx1Z42gXuu4NUkGGkg//gH1o3Mdb+pyo1hDqScI=;
        b=UzFSIOPbd80sP6d0KvShMhng5nBKFzcFqH9zvWPx7oE2LHjT3++4PO/aQzpBZbleN1
         9PRNKtsYFbvXfts9hQzdmt42+USVTLUlb0zuzQnNnt2BcOCfeHNwZq5umTQdAIlgg1U9
         ZuFOHFaEGsllSrFNwTLSlgD0X5GCB6lk+Y3CRxWuwR4U/1e0L3etam21DuLWr/fvJDxr
         fiSVnF2R1c4Ahp9U9BMzlapkJtp4T2WNXc8ntXYW3A7VX7M3qnMUtJKr0N2YnIhDYKV3
         SYkbp0qO8Coel2DUmIQIGC0oO426jxCIiJ1nSBaQSmPehq56jkuau0uZZRCDh93TfaOH
         57fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761567; x=1744366367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrnOAx1Z42gXuu4NUkGGkg//gH1o3Mdb+pyo1hDqScI=;
        b=U5869UzczJM2vCRzXa5G9Ee5XgBrI9yWg4oR0M4JKymRxHeWcZT2I88ZQTSzDLO3bA
         KNczKS6fWIDpGdmBfej04jn2psxlP8a6r4QxUqemOH2lZxoTU820TQAQDO+Cvdqh5A/M
         KZS/nETx2mACQU7nGMAbcRCumxq+0EXhwOul6bdO2CrQptHDfoySwblwnrCwh1QLrzf9
         OLZdGZMSbjRy0FHkLBklsKaycNXNTwFzVtEdG1PH2l/dCNDHrfCwcuGUZgpKehCatRnD
         +quM9w1s08wlQDBfbPGfKPIeUGeiJoD2LRv93IDdlg9yLfKdJS+4aBPHqr2himHmGp+9
         KeNw==
X-Forwarded-Encrypted: i=1; AJvYcCV6gypKT+Da3wxtA5zq3VbcMicA3zMmjzVqnnPmTSBFIGv5ZZv92WILz/rPO/8M6o9Smy+WXbd6U/V4aKdQaxfw@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHBRV2Rl4nGuxV2fZwPYP/uHQzPLisT2vq1WizIoigG6dKF9t
	uduQr4U8p0AgwrRQ6/vqWtpDcIu29g3gW5kngymQev/s37It/Gw1nLS13UnN2xc=
X-Gm-Gg: ASbGncvF/nR25CPGWH0lt8YrnfjWa03SUjdFsy/xW6n4okKw5sKu0eT0auAAu91QCum
	XCzhs1j8ZnKWTqUVc5UKjiEQLIgfcXcq6HFRZuoIRbwRAL/dzrIFO9hukZJIdmbkoqzacZch2A4
	iMJ2bkuOwjFiNh2nX1x5ViEL6LhFO1C3Y4DgadhZJmgoeLG7EThiwrqxcq/eFVDe14sHj3btUqi
	KY44QWJFYpun7XqnVXs+MydanaNpnNZof+2igSHV1HSB4LvUsDM/GQKtaGtB7DQEt6N1XKgKMPl
	GNMH0/2js89w8Am/WHyqlWOwEkOQPxg0Q0j3oiTceM/0IK1OtDPZeAfckZDReEaY112BjZ2QqKD
	93puGE+eOuW9Ka/Y2
X-Google-Smtp-Source: AGHT+IGn5zQjckVMr5yj5RkLrkNmEYqXiyrId5H4BjH0hkHpDWBOU4XybvpfkaZInnb7fcnChm8sLg==
X-Received: by 2002:a05:600c:198b:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43ecf9fed70mr18873905e9.25.1743761567394;
        Fri, 04 Apr 2025 03:12:47 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm43732995e9.2.2025.04.04.03.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:12:46 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE outputs for PCIe interfaces
Date: Fri,  4 Apr 2025 12:12:34 +0200
Message-Id: <20250404101234.2671147-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_031249_673816_F69754D3 
X-CRM114-Status: GOOD (  13.42  )
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

From: Parth Pancholi <parth.pancholi@toradex.com>

TI J784S4-based devices, such as the AM69 SoC, provide PCIE_REFCLK outputs
from the SoC, which can be used to clock external PCIe endpoint devices.
Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock
buffer, with each buffer supporting two PADs to provide reference clocks
for two associated PCIe instances. The mappings are as follows:
        - PCIe0 -> ACSPCIE1 PAD0
        - PCIe1 -> ACSPCIE0 PAD0
        - PCIe2 -> ACSPCIE1 PAD1
        - PCIe3 -> ACSPCIE0 PAD1

This patch enables each ACSPCIE module and its corresponding PADs to ensure
that all PCIE_REFCLK outputs are functional.

This change have been tested on an AM69-based custom hardware platform,
where all four PCIe instances (PCIe0, PCIe1, PCIe2, and PCIe3) with the
internal PCIE_REFCLK are utilized with various endpoint devices such as
a WiFi card, NVMe SSD, and PCIe-to-USB bridge.

Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1484211/am69-pcie-refclk-out-and-acspcie-mappings
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
This change depends on https://lore.kernel.org/all/20241209085157.1203168-1-s-vadapalli@ti.com/
v2: set ti,syscon-acspcie-proxy-ctrl mask to 0x3 for all PCIe instances to prevent unintended overrides.
v1: https://lore.kernel.org/all/20250320122259.525613-1-parth105105@gmail.com/
---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 +++++++++---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi           | 10 ++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 591609f3194c..d82d5cb5607e 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -132,6 +132,11 @@ acspcie0_proxy_ctrl: clock-controller@1a090 {
 			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
 			reg = <0x1a090 0x4>;
 		};
+
+		acspcie1_proxy_ctrl: clock-controller@1a094 {
+			compatible = "ti,j784s4-acspcie-proxy-ctrl", "syscon";
+			reg = <0x1a094 0x4>;
+		};
 	};
 
 	main_ehrpwm0: pwm@3000000 {
@@ -1067,11 +1072,12 @@ pcie0_rc: pcie@2900000 {
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
 		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x3>;
 		max-link-speed = <3>;
 		num-lanes = <4>;
 		power-domains = <&k3_pds 332 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 332 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 332 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -1111,7 +1117,7 @@ pcie1_rc: pcie@2910000 {
 		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
 			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
-		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x1>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 0160fe0da983..ebbc315649d0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -34,8 +34,8 @@ pcie2_rc: pcie@2920000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 334 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 334 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 334 0>, <&serdes1 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -45,6 +45,7 @@ pcie2_rc: pcie@2920000 {
 		dma-coherent;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		ti,syscon-pcie-ctrl = <&pcie2_ctrl 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x3>;
 		status = "disabled";
 	};
 
@@ -63,8 +64,8 @@ pcie3_rc: pcie@2930000 {
 		max-link-speed = <3>;
 		num-lanes = <2>;
 		power-domains = <&k3_pds 335 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 335 0>;
-		clock-names = "fck";
+		clocks = <&k3_clks 335 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
+		clock-names = "fck", "pcie_refclk";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		bus-range = <0x0 0xff>;
@@ -74,6 +75,7 @@ pcie3_rc: pcie@2930000 {
 		dma-coherent;
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		ti,syscon-pcie-ctrl = <&pcie3_ctrl 0x0>;
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie0_proxy_ctrl 0x3>;
 		status = "disabled";
 	};
 
-- 
2.34.1


