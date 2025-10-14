Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F9BCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10pZ663Njd/ByWxSQm55rtzQH9hSAc5998ktthtwdcs=; b=k/c6h6cyAeqxo5G1DIihLLi6mX
	HV05JTgoZM5Wf1m6Yp6HJMg4PJF/aJMECfAj8c/3a8wwJCE3XVmA6bI43okfzA+pNxopYUGps/owM
	Y5Kt9mchaXb+jPXRQxmd+I7HxLs9xpVY8ooGmrxbz6Mcg07F4/4yOsCsXVoMcaD3RNkaTKDGxF4pd
	pTjoDABQ5B8+nPLrvreKcVsdp0V0RvN5Go5MQZP6CtSTlAqglf6ckMnEjRQeq2ok3FMRKoFYje/SE
	b9I0qFWxV/SphdRQ3RgSAO6GmBOPzk3jDPtN5j0vWXy/jn2usWw1gXxXLflyK61z9IigCEp2vTk+B
	edLWKSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eXN-0000000GJOD-3nDw;
	Tue, 14 Oct 2025 12:53:57 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eXK-0000000GJMT-11Tb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 12:53:55 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59ECrp0Z1506713;
	Tue, 14 Oct 2025 07:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760446431;
	bh=10pZ663Njd/ByWxSQm55rtzQH9hSAc5998ktthtwdcs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=n0dB2ok1P5OLo35nBLHj5g7yqRLkTqbr/CcZUDYhNLpny2thh0BLfxkkxCp4ZE4BI
	 xIJtXFk9UTymRtiuLRa0BrfTopFlNgj95nX6E6Kkb1b4humxaOR4W4v+ZPkSVQb13t
	 8DJgjrjDAJQFxEPoFU3FQ9f5kVqIZ0qxtJ2JizRY=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59ECrp1b3814800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 07:53:51 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 07:53:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 07:53:50 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59ECrhPU055621;
	Tue, 14 Oct 2025 07:53:47 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v3 1/5] arm64: dts: ti: k3-am62: disable "cpsw3g" in SoC file and enable in board file
Date: Tue, 14 Oct 2025 18:23:39 +0530
Message-ID: <20251014125349.3408784-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014125349.3408784-1-s-vadapalli@ti.com>
References: <20251014125349.3408784-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_055354_394923_76B3BFF5 
X-CRM114-Status: GOOD (  12.67  )
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

Following the existing convention of disabling nodes in the SoC file and
enabling only the required ones in the board file, disable "cpsw3g" node
in the SoC file "k3-am62-main.dtsi" and enable it in the board (or board
include) files:
a) k3-am62-lp-sk.dts
b) k3-am625-beagleplay.dts
c) k3-am625-sk-common.dtsi

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v2 of this patch is at:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250611114336.2392320-2-s-vadapalli@ti.com/
Changes since v2:
- Rebased patch on next-20251010
- Moved changes made in 'k3-am625-sk.dts' into 'k3-am625-sk-common.dtsi'
- Reordered 'status' property within the node to follow the ordering
  specified by:
  https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts       | 4 ++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi       | 2 ++
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 1 +
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 1 +
 4 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index ecfba05fe5c2..89be21783e27 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -181,6 +181,10 @@ &sdhci1 {
 	vqmmc-supply = <&vddshv_sdio>;
 };
 
+&cpsw3g {
+	status = "okay";
+};
+
 &cpsw_port2 {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 40fb3c9e674c..0fd23ee996a1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -723,6 +723,8 @@ cpsw3g: ethernet@8000000 {
 		dma-names = "tx0", "tx1", "tx2", "tx3", "tx4", "tx5", "tx6",
 			    "tx7", "rx";
 
+		status = "disabled";
+
 		ethernet-ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7028d9835c4a..774178b9aa88 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -590,6 +590,7 @@ &cpsw3g {
 		    <&gbe_pmx_obsclk>;
 	assigned-clocks = <&k3_clks 157 70>, <&k3_clks 157 20>;
 	assigned-clock-parents = <&k3_clks 157 72>, <&k3_clks 157 22>;
+	status = "okay";
 };
 
 &cpsw_port1 {
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index fe0b98e1d105..73a8882a650a 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -212,6 +212,7 @@ &sdhci1 {
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>, <&main_rgmii2_pins_default>;
+	status = "okay";
 };
 
 &cpsw_port2 {
-- 
2.51.0


