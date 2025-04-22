Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39645C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ/tDli0UVdGhUBUbsWxOnKadhDMEs3cC/lGhTcqtyQ=; b=b5rPqHkCWsAHAfLBXpbdsC5yDX
	bEJ4o6Zc1+GFgUa3kp0xo7n3oL0XDSF48ZHk57jajIsIDnVZvPdpWnMuu7YiS6l9lW4hesiNhNwtR
	k+187zGhga5+VF17ojX2ZXtWBZ4/skFUmV3D97s26ZOHRIjlmeNHjVwm3vSOfrqJYQKr3MGSqIc5H
	gf0ZNBXoQO7cfuVpYvgnzFumgQJsk0BtL/SuXsmqaNqpAe0lQYKa7nfWBq29kC/GvxOSwNaQ+GnT0
	T+OqlpG4LGtzZjtgk3OjqxFYwfQfbgvBareIRabl+fZ4sPafAG2+t3ItNfpDh/CcK4i/RogtonSmH
	QueqvNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dcl-00000007Hv9-1R37;
	Tue, 22 Apr 2025 13:25:19 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CJQ-000000072SY-1IwA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:01:17 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC1DNn1206468
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745323273;
	bh=tZ/tDli0UVdGhUBUbsWxOnKadhDMEs3cC/lGhTcqtyQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wpChS8WfJBroFySmZ7bUughF+8cVTfyhOkfw/C5NGSC6irLfLy7ro/mPXTiZEBPnq
	 4aE3FNCQWeXi2r1x1pRWgcZWrV41qhYMguCkV4Z8u5yjDawAGEjGIQkSwaqJBOlxPE
	 ClkebCwGYqM3bTRTXo5JXXA/iElA9WJPVdmaTeuw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC1D17000443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:01:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:01:13 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:01:13 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MC0hW4094623;
	Tue, 22 Apr 2025 07:01:09 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 7/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: switch to 64-bit address space for PCIe0 and PCIe1
Date: Tue, 22 Apr 2025 17:30:42 +0530
Message-ID: <20250422120042.3746004-8-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_050116_440789_E9E246B5 
X-CRM114-Status: GOOD (  12.70  )
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

The PCIe0 and PCIe1 instances of PCIe in J742S2 and J784S4 SoCs support:
1. 128 MB address region in the 32-bit address space
2. 4 GB address region in the 64-bit address space

The default configuration is that of a 128 MB address region in the
32-bit address space. While this might be sufficient for most use-cases,
it is insufficient for supporting use-cases which require larger address
spaces. Therefore, switch to using the 64-bit address space with a 4 GB
address region.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Link to v1 patch:
https://lore.kernel.org/r/20250417120407.2646929-8-s-vadapalli@ti.com/
Changes since v1:
- Based on Udit's feedback and offline discussion as described at:
  https://lore.kernel.org/r/7f6ea98c-df6d-4c94-8f42-76cc8306b6c4@ti.com/
  the address region of 4 GB is split as:
  0. 4 KB ECAM
  1. 1 MB IO
  2. (4 GB - 1 MB - 4 KB) 32-bit Non-Prefetchable MEM
  instead of the previous split of:
  0. 4 KB ECAM
  1. 1 MB IO
  2. 128 MB 32-bit Non-Prefetchable MEM
  3. (4 GB - 129 MB - 4 KB) 64-bit Prefetchable MEM

Regards,
Siddharth.

 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..e6c9080d80b0 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -1055,7 +1055,7 @@ pcie0_rc: pcie@2900000 {
 		reg = <0x00 0x02900000 0x00 0x1000>,
 		      <0x00 0x02907000 0x00 0x400>,
 		      <0x00 0x0d000000 0x00 0x00800000>,
-		      <0x00 0x10000000 0x00 0x00001000>;
+		      <0x40 0x00000000 0x00 0x00001000>; /* ECAM (4 KB) */
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
@@ -1073,8 +1073,8 @@ pcie0_rc: pcie@2900000 {
 		device-id = <0xb012>;
 		msi-map = <0x0 &gic_its 0x0 0x10000>;
 		dma-coherent;
-		ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
-			 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x40 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x40 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		status = "disabled";
 	};
@@ -1084,7 +1084,7 @@ pcie1_rc: pcie@2910000 {
 		reg = <0x00 0x02910000 0x00 0x1000>,
 		      <0x00 0x02917000 0x00 0x400>,
 		      <0x00 0x0d800000 0x00 0x00800000>,
-		      <0x00 0x18000000 0x00 0x00001000>;
+		      <0x41 0x00000000 0x00 0x00001000>; /* ECAM (4 KB) */
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
@@ -1102,8 +1102,8 @@ pcie1_rc: pcie@2910000 {
 		device-id = <0xb012>;
 		msi-map = <0x0 &gic_its 0x10000 0x10000>;
 		dma-coherent;
-		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
-			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x41 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		status = "disabled";
 	};
-- 
2.34.1


