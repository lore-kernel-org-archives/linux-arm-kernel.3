Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C87DC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CQDuHs7zFUqfObgU50fZXkBp76ORP87Ik1HRSIRSR8=; b=g6HlozLtzFIsbF2EQvW0E8Bt/p
	7HkpQcX84skIieGTv+n0Gj0LjzFGUuVS/Ncs4ICVtUZsslco6BzP3mArQVYjKYtI4f1JNgPyO15ew
	bN4kneDJ5E5j1v5L36imf8hrVycma8eh2DjDkghwvfddDGd1KU6Zpfwa6tgFFudp9k95TAKp1XEFF
	qpENthtPeEp/zEn3UwUSfpVODWyS8IWel4zzXTBS2Fujqp1zntOb5ZSYmM7VngLw2JYuCG6Up1Qp3
	LQ4JazjdSZmjotDuwJ+CyuL26xoWaqh1HP5Nc2JlVyCLWZckuYGswYByezx/56LhMYzLfIRrAo+c+
	TlAPzaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwRC-00000005vu4-1lmr;
	Wed, 02 Apr 2025 11:39:18 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwKN-00000005uHm-3PCL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 11:32:17 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWCCh3915810
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Apr 2025 06:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743593533;
	bh=+CQDuHs7zFUqfObgU50fZXkBp76ORP87Ik1HRSIRSR8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kZqO0l+LgRTrtMcbrLGyNgLMqXzX9ujkYb5KNB6czl2GGifBjhQYhxcmuZsue8nzc
	 SOvqPzloa392EI0Bkprty8sui5NP3/dRWtT3G7A6F4HL6scw0Kn0VK6AB2xU+/rPN/
	 N6ga/OMTIL0bvquybA5NqQrqTBkt7kfkyyVbrr/A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 532BWC9a103504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Apr 2025 06:32:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Apr 2025 06:32:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Apr 2025 06:32:12 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.210])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 532BWBun017482;
	Wed, 2 Apr 2025 06:32:11 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <afd@ti.com>, <s-vadapalli@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <kristo@kernel.org>, <rogerq@kernel.org>, <kishon@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <j-choudhary@ti.com>
Subject: [PATCH v2 5/5] arm64: dts: ti: k3-am64: Add PCIe ctrl node to main_conf region
Date: Wed, 2 Apr 2025 17:02:01 +0530
Message-ID: <20250402113201.151195-6-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402113201.151195-1-j-choudhary@ti.com>
References: <20250402113201.151195-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_043216_022785_1F4C3717 
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

From: Andrew Davis <afd@ti.com>

This region is used for controlling the function of the PCIe IP. It is
compatible with "ti,j784s4-pcie-ctrl", add this here and use it with
the PCIe node.

Signed-off-by: Andrew Davis <afd@ti.com>
[j-choudhary@ti.com: Add changes to k3-am642-evm-pcie0-ep.dtso]
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi          | 7 ++++++-
 arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index 324eb44c258d..d872a624601c 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -51,6 +51,11 @@ chipid@14 {
 			reg = <0x00000014 0x4>;
 		};
 
+		pcie0_ctrl: pcie-ctrl@4070 {
+			compatible = "ti,j784s4-pcie-ctrl", "syscon";
+			reg = <0x4070 0x4>;
+		};
+
 		serdes_ln_ctrl: mux-controller@4080 {
 			compatible = "reg-mux";
 			reg = <0x4080 0x4>;
@@ -1036,7 +1041,7 @@ pcie0_rc: pcie@f102000 {
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
 		device_type = "pci";
-		ti,syscon-pcie-ctrl = <&main_conf 0x4070>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 		max-link-speed = <2>;
 		num-lanes = <1>;
 		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
index 6b029539e0db..432751774853 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
@@ -46,6 +46,6 @@ pcie0_ep: pcie-ep@f102000 {
 		max-functions = /bits/ 8 <1>;
 		phys = <&serdes0_pcie_link>;
 		phy-names = "pcie-phy";
-		ti,syscon-pcie-ctrl = <&main_conf 0x4070>;
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
 	};
 };
-- 
2.34.1


