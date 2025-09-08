Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB88CAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJs2W2zCE/sq5s5LdunCNRlc28v3tu0fQAPxkaNwNvQ=; b=5D8Cd6NCSFOvY0AQCNlDJNe/3r
	YdWpunAFI7d0KEOeohm8VimTFXg/YHL+0KxTFoCROouX4URtzZp2QZXnDVq29zH4QUPh/mBPsPBW1
	RlkkO73O6HgnXG/93eJfJZMjC/Mb1vDgbZhZ4QjmqL9Tncj61hlaM6aDa3PazNYJbexz0Sl0kdZAT
	lB2YGIrdb54B+FVT4rFGzOxmXqxb7ftDX4RSLNr9+wARDndwYbMqHs1fTsg+Vyir9OBfSFbNS39I7
	9yxgs/hwtORABM6CfDf6hjYH7ycIi5WJBRDDz/SATRvrE9t+Xnnpnq/1FKIBHHbFGwIFZkm2BqhMe
	8H6LXt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPU-000000016EG-0VTy;
	Mon, 08 Sep 2025 17:12:08 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcsR-000000006zV-1aSp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:29:52 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ETnro120284;
	Mon, 8 Sep 2025 09:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341789;
	bh=AJs2W2zCE/sq5s5LdunCNRlc28v3tu0fQAPxkaNwNvQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uux9TtE7rukSQPPBQ7N0uCPrD7UVFVpSoQg7Nqf0C2IaauNdoESsF9OfCmtnE1QvO
	 EEZ+zW1dREGzIUoc6fk87Ibgq1W/bjRJ/fmOPekbNOTA5vHkafHYrEbVU/zNmrkJ91
	 0eIzVU1LexG6VDe345V3RsyM2DL/parqH5rkeqk8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ETmrd2464479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:29:49 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:29:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:29:48 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESeco1037553;
	Mon, 8 Sep 2025 09:29:44 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 12/34] arm64: dts: ti: k3-am6*-boards: Add label to reserved-memory node
Date: Mon, 8 Sep 2025 19:58:04 +0530
Message-ID: <20250908142826.1828676-13-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_072951_505855_EB51DA7E 
X-CRM114-Status: GOOD (  10.05  )
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

Add the label name 'reserved_memory' to the reserved-memory node in all
K3 AM6* board level dts files. This is done so that the node can be
referenced and extended to add more carveout entries as needed in future
refactoring patches.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
v4: Changelog:
1. None

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-13-b-padhi@ti.com/

v3: Changelog:
1. Carried A/B tag.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-13-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 15/33] to [PATCH v2 12/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-16-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            | 2 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           | 2 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        | 2 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     | 2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts            | 2 +-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts             | 2 +-
 arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi        | 2 +-
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi     | 2 +-
 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 2 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index bbf2d630b305..cbbcb96e2e24 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -189,7 +189,7 @@ reg_usb0_vbus: regulator-usb0-vbus {
 		regulator-name = "USB_1_EN";
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 403adfbf7dce..3108e9b0c804 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -45,7 +45,7 @@ memory@80000000 {
 		bootph-all;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 03291862f07a..7ebcfe8edfe1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -39,7 +39,7 @@ memory@80000000 {
 		bootph-all;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index d45fc42b03f3..41860ac42f3c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -39,7 +39,7 @@ memory@80000000 {
 		bootph-all;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index a2fdc6741da2..6a04b370d149 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -147,7 +147,7 @@ reg_vsodimm: regulator-vsodimm {
 		regulator-name = "+V_SODIMM";
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 2755598fd1f5..c5b5b00c42b9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -44,7 +44,7 @@ memory@80000000 {
 		bootph-pre-ram;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 840772060cb1..03b8e246d8c2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -36,7 +36,7 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index a07503b192c9..7640c5efe9b8 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -42,7 +42,7 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index ae4a6552644c..fb8bd66f2f94 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -40,7 +40,7 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
index d0c1e4dc1da7..81adae0a8e55 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
@@ -105,7 +105,7 @@ memory@80000000 {
 		device_type = "memory";
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index 876cbb21961d..40b619c9a6c9 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -20,7 +20,7 @@ memory@80000000 {
 
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index 73936994a156..6cd499ea53e7 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -36,7 +36,7 @@ chosen {
 		stdout-path = "serial3:115200n8";
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index 39c2d46801de..e532ea0a22b2 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -39,7 +39,7 @@ memory@80000000 {
 		      <0x00000008 0x80000000 0x00000000 0x80000000>;
 	};
 
-	reserved-memory {
+	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
-- 
2.34.1


