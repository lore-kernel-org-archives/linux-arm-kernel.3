Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C772AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 13:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIeV8CRx1+lCd8420TzH+2CKzwgmxlhGYdd/TGwwqTs=; b=0O6JTewb0vA/vbR5J6eryhflkC
	pHuSL2BsP5XaSAIZkRa5p/hgzH3GA1ztr+44pHp2esoSSFvbSYDIPBGt8vm1bOvmfnew4O51x3Ukl
	DwUxuE/0aoXOmi3fNS6ZGh+1odjTAeH97syvY4L0KJov8yrnGgvy7P4h25o5jYK6umEfggspww93r
	4jdP/WTs6WwggQtPCyPcn4GJTeadHLCC+3E5eonp3S5bBxS1sKDLjUFC1GpACbSZJwQg+Db2HXdDV
	MYs9msiak0whribatMyqyVZXBLhBvx8b9L1IvvmgjoTToCfqhuWHrTVv7tcssF8DeYqY7p2MaAYR6
	ZoVjNnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DUv-00000007GGO-23TQ;
	Tue, 22 Apr 2025 13:17:13 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CJF-000000072Of-1Nw8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 12:01:07 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC12w81886392
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 07:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745323262;
	bh=jIeV8CRx1+lCd8420TzH+2CKzwgmxlhGYdd/TGwwqTs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cl89CAyn1Rxs2JMXwh19Qkox/SNipWMYv02e/Kkyma9AOO9yzkSp+EbWmJdilo1Ss
	 95Nh1cWG8t1oedojkxEysiQ4tzhs82qTx+6yC8RU8Isn08H4d5pied5ks0o0g5amm0
	 hhznLfoUPcbPETuF74ljsW/gRmF0o7sjyG6U9p1I=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MC12Mf128164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 07:01:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 07:01:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 07:01:01 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MC0hW1094623;
	Tue, 22 Apr 2025 07:00:58 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 4/7] arm64: dts: ti: k3-j721e-main: switch to 64-bit address space for PCIe0 and PCIe1
Date: Tue, 22 Apr 2025 17:30:39 +0530
Message-ID: <20250422120042.3746004-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422120042.3746004-1-s-vadapalli@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_050105_455446_0A1E6945 
X-CRM114-Status: GOOD (  12.87  )
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

The PCIe0 and PCIe1 instances of PCIe in J721E SoC support:
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
https://lore.kernel.org/r/20250417120407.2646929-5-s-vadapalli@ti.com/
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

 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index af3d730154ac..6e1bd1dac6e5 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -941,7 +941,7 @@ pcie0_rc: pcie@2900000 {
 		reg = <0x00 0x02900000 0x00 0x1000>,
 		      <0x00 0x02907000 0x00 0x400>,
 		      <0x00 0x0d000000 0x00 0x00800000>,
-		      <0x00 0x10000000 0x00 0x00001000>;
+		      <0x40 0x00000000 0x00 0x00001000>; /* ECAM (4 KB) */
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
@@ -959,8 +959,8 @@ pcie0_rc: pcie@2900000 {
 		device-id = <0xb00d>;
 		msi-map = <0x0 &gic_its 0x0 0x10000>;
 		dma-coherent;
-		ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
-			 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x40 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x40 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		status = "disabled";
 	};
@@ -970,7 +970,7 @@ pcie1_rc: pcie@2910000 {
 		reg = <0x00 0x02910000 0x00 0x1000>,
 		      <0x00 0x02917000 0x00 0x400>,
 		      <0x00 0x0d800000 0x00 0x00800000>,
-		      <0x00 0x18000000 0x00 0x00001000>;
+		      <0x41 0x00000000 0x00 0x00001000>; /* ECAM (4 KB) */
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
@@ -988,8 +988,8 @@ pcie1_rc: pcie@2910000 {
 		device-id = <0xb00d>;
 		msi-map = <0x0 &gic_its 0x10000 0x10000>;
 		dma-coherent;
-		ranges = <0x01000000 0x0 0x18001000 0x0 0x18001000 0x0 0x0010000>,
-			 <0x02000000 0x0 0x18011000 0x0 0x18011000 0x0 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x41 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		status = "disabled";
 	};
-- 
2.34.1


