Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B5AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI3B3WQgXAFTHBDb2zrpVAJeU5+h4ni72DFYOqAZgpA=; b=sHFRm+JeKlWN6PvGUisvMQCtlZ
	2IvHGPWSHm/VGWM7YiLEWS96tn9Q5KDEZEwug3hbFFIdCHoLIVvni+/oFvqOccF5hjtoh0cbsI17v
	sxC5e4tFHq1yKJCSEKY95wZvbXgn5ho+s7S+qbxl1T0N141LB3XHZz15AdzukWTJqdAOZaXgv2wpu
	t9/M5lH70liG8sHEryuBTT1I+VQaY2tb68UbkbnftuNhefUKFdwvR+mZI2v7KPqEL6aAINco6SvG1
	DBTUwroZuZn6x2RFnptztXQkTdgfLtzOjSl+6zbd5CL5Lkqf2M13H57A8z1RkZ/0pdDZsTC6yP38E
	PEGXXBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OPf-0000000CxqL-39nS;
	Thu, 17 Apr 2025 12:32:15 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Nyt-0000000Crls-0laa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 12:04:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4WYg621241
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 07:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744891472;
	bh=FI3B3WQgXAFTHBDb2zrpVAJeU5+h4ni72DFYOqAZgpA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SH1TouV8bBT9DSLODHvlHv6K/L9mUygxVwJIIg3i2Ia+pRIqgz9FI6e15Lc/O5vIT
	 24xAXEbTkDxx38gCoHNf2rMv7d5xGui0kCTW3e1Op81CnTtjYXZFsqDCXASaJvaUqk
	 5IoaxO6JOeG+3Uw/hoHTn24VT8b0SydR8xeGa9r0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HC4Wr2083642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Apr 2025 07:04:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 07:04:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 07:04:31 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HC47VO004789;
	Thu, 17 Apr 2025 07:04:29 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 6/7] arm64: dts: ti: k3-j722s-main: switch to 64-bit address space for PCIe0
Date: Thu, 17 Apr 2025 17:34:06 +0530
Message-ID: <20250417120407.2646929-7-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417120407.2646929-1-s-vadapalli@ti.com>
References: <20250417120407.2646929-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_050435_309233_834702F3 
X-CRM114-Status: GOOD (  10.35  )
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

The PCIe0 instance of PCIe in J722S SoC supports:
1. 128 MB address region in the 32-bit address space
2. 4 GB address region in the 64-bit address space

The default configuration is that of a 128 MB address region in the
32-bit address space. While this might be sufficient for most use-cases,
it is insufficient for supporting use-cases which require larger address
spaces. Therefore, switch to using the 64-bit address space with a 4 GB
address region.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 6850f50530f1..a3928fe63ae4 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -98,10 +98,11 @@ pcie0_rc: pcie@f102000 {
 		reg = <0x00 0x0f102000 0x00 0x1000>,
 		      <0x00 0x0f100000 0x00 0x400>,
 		      <0x00 0x0d000000 0x00 0x00800000>,
-		      <0x00 0x68000000 0x00 0x00001000>;
+		      <0x06 0x00000000 0x00 0x00001000>;
 		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
-		ranges = <0x01000000 0x00 0x68001000  0x00 0x68001000  0x00 0x0010000>,
-			 <0x02000000 0x00 0x68011000  0x00 0x68011000  0x00 0x7fef000>;
+		ranges = <0x01000000 0x00 0x00001000 0x06 0x00001000 0x00 0x00100000>, /* IO (1 MB) */
+			 <0x02000000 0x00 0x00101000 0x06 0x00101000 0x00 0x08000000>, /* 32-bit Non-Prefetchable MEM (128 MB) */
+			 <0x43000000 0x06 0x08101000 0x06 0x08101000 0x00 0xf7eff000>; /* 64-bit Prefetchable MEM (4 GB - (129 MB + 4 KB)) */
 		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
 		interrupt-names = "link_state";
 		interrupts = <GIC_SPI 99 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1


