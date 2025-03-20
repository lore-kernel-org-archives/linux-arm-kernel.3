Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD57FC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JTcHUPBi4RdnLMm/SKiBQfh0LKxbXErOyxRh8CzLSYw=; b=fAbmrc4+CGGrybTn8vZzCaRVAt
	kPlKShMm5y/2riihU5SQ+zBPnjrFMGalMrvl9R95uWdB9K9gLoYE5DKwm93jQKBf7oUnyBAwpmbXX
	6jlpzk9ZfCx+iB2tI2GvEVnvEXbdL3ytnftPA4gU9hKLBCxqhCWwpc+3q/naKTQUgY3+Uf68SnZmv
	wo6mWc4a83TXRdV84Hn3/ddVdkVbz5gLPVTvlbhCdNEXnUIvIwrgq0HxY3awdGQ6v+TJfL+g1CMuQ
	2aue/9bA+OR6bYO0nWmKIfFP5NPlzX5n02ocmo/M7f+i2+geWM4OxiUx/TTz3sc/Zk2WLdn6yjEYh
	6nll2z3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEyk-0000000C6zR-1i3e;
	Thu, 20 Mar 2025 12:26:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEve-0000000C6MD-2NRB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 12:23:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso128775266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 05:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742473396; x=1743078196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTcHUPBi4RdnLMm/SKiBQfh0LKxbXErOyxRh8CzLSYw=;
        b=QfMQCm1UUUdVXGvKSPuMO9+4OkJFiMSFVuhg/72VCPtZH12ukNOfvm6Y2/O8bCrM+l
         Y908U5LvW0a+CXPgoQdDyIwWeZKnKz8Nu5JQ0jjLe+0TZYTK3Nm3Vx2/pTmkkWdYA42D
         HYAnrzfF7qKoZQA6+gMf+SCRqEVKEibITO7Hpey+iLfEaGhAmfd5xrqCiXO/zkIiTTyu
         du/dwnCcXZQouTJQdIu5RIJs7MT5FijtCuIuA3mdN0cXGIm0WCjWSAdbNtu6ZPct9qHb
         Hbib7RwW+gcOPrslmUrDFGrT4GOkuUELjOqJSiNDuF072uZWDe97fhmVd5WtoiXfdbNH
         n3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473396; x=1743078196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTcHUPBi4RdnLMm/SKiBQfh0LKxbXErOyxRh8CzLSYw=;
        b=W4GVshXFNjYn5g45AcqRPRORfZk1RWd++8mJvOfXatZ4zVfqiVk3cS63d8G7/0fLBU
         AJMQCqFW/Go9ZnuJEqDGqy4OvwOtpc4NVfCFrluUudBiEsrjZS5tZoHAl9rcCcLhC+Ex
         Pc0cc1/m13RWKKBcKRgGFLs65ndNIeC59Za5itGneHGrw25UZ8yj6QlCtpoBflDufYYD
         HUFYC3PzQQp8Ft8tLvpRSKeI4e3aPTcpbi4um+mnGiKicZxv8H7sAFFpt+/M0xXiwyy1
         OeZcgED3tNzg3YneoYcGDVHILr5IUGXXkVgTVDa9R8IOU5ERHwib+IObEQ/5V2yqZOnG
         WAmg==
X-Forwarded-Encrypted: i=1; AJvYcCV0xn2vdb/3jZOF4kJgX36m5xZ6jlZe2+lxONsBcooucezMEG6UT3HOrlLmLMdbvPXV7WZrCNmYIOUsoYfA2S9H@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Uwn3ADaHjP+591tE05izHBbYcyQGZ+jBxoZgnVsozq4CKoc4
	Ook9buKKfXQwXKhbHQtN1DkLMMX0v1DbP4B/vjH0DALFMyjkA7uy
X-Gm-Gg: ASbGncsU7G2JP1pOc4B/40IrVa+H87tfRPSzbpGAXxxPCZZtAT6rOJxjwZGIkBl5ZTo
	3hjUXPEU9Ef/yiWiBkbNUmwRM2LAQzNYKjdgfODFXNQnp+ZFctuVYS9eDao6mtVv+csNvEnPbj9
	lMtg0KHc1tvwBTK3hVUBlf+D4TXyeSSbuDirHHHWf8IHE97zEavQuqIWe37OZZHJTezrG0f2Kz8
	aEsfSAzQArN569H05hgxN9+VcCpiUfDyaBtb3Tv6Aq+ZSX0NbHMsfZdJffkNO0YAgY9NtddxfYu
	avXq254cw2a3xOCNeIGbWylZOUe5PpqTr8Fs41kRII/txVj+NFQOUjTQ18pL1otVPOaN/+ixL/F
	gvfaexUhAVIy7XMy9RkWVzWAeBfw=
X-Google-Smtp-Source: AGHT+IHZMteGa3S1nkmn4PeuohC1rXzkLQoqtOFH7dp6eE3wLhlL4YTQF8Nz3QxqVr/GwwINnhAUaQ==
X-Received: by 2002:a17:907:3d94:b0:ac3:3f13:98aa with SMTP id a640c23a62f3a-ac3ce0736fbmr333129766b.32.1742473396168;
        Thu, 20 Mar 2025 05:23:16 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ed1e4sm1169211366b.66.2025.03.20.05.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:23:15 -0700 (PDT)
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
Subject: [PATCH v1] arm64: dts: ti: k3-j784s4-main: Enable ACSPCIE outputs for PCIe interfaces
Date: Thu, 20 Mar 2025 13:22:59 +0100
Message-Id: <20250320122259.525613-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_052318_620033_ABF7A74F 
X-CRM114-Status: GOOD (  13.74  )
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
Each PCIE_REFCLK output is enabled via the corresponding ACSPCIE clock buffer,
with each buffer supporting two PADs to provide reference clocks for two
associated PCIe instances. The mappings are as follows:
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
---
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi      | 10 ++++++++--
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi             | 10 ++++++----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 591609f3194c..854fdf7b771e 100644
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
+		ti,syscon-acspcie-proxy-ctrl = <&acspcie1_proxy_ctrl 0x1>;
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


