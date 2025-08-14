Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9572FCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzwsWLISBn/+q6XrvI0sbgk5Kv+C2qGvr5xT1CY7NlE=; b=odVNjP5kpN3KnfSNF/u75OfIc4
	KuD+z8XX0SRSIsFVR/jWXoaVX4eCXtBSm/f36Ahq9KF4ptMBQi35cQ0om/VfC2/s5RuapgR2q/2AQ
	I6PMNUwbdzlHruHCT6UVLZgzVW7REay5+A0aB0Ck5xCbJ5CmRP4DgG2Ce07YJoEagw285J1y/j1Rc
	vF6ZS+lGnM28SggxKXaWHNjKHl9LbTlgz+SFtiUz7Z0SXPxlA1Kzn46sjNj36kgQjt6C3D55bQrT5
	E0Pia1fuJamqOh2rAUXu1fiwFOKagieouAV2458ywG/x2c1FTtkWEAOoCN2LUDXqe0HpO2xVS99Z8
	DxF+vxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umhIV-00000000mj1-0J7Q;
	Thu, 14 Aug 2025 23:23:51 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgcM-00000000h1e-00aR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:40:20 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EMeFt52027504;
	Thu, 14 Aug 2025 17:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755211215;
	bh=yzwsWLISBn/+q6XrvI0sbgk5Kv+C2qGvr5xT1CY7NlE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k0cDMD9kyQNJt250X9iKozgKd1jsaxf7X5zP0b0ZygS28WeXS0hAKjeZbAjQaZMlX
	 It14/FsuaQTs1P0JYyRfRA7dP5NaPcO1cECSp2CIaj4ntdUrObEV98sbotxDRzHxfG
	 Q8U+bCnQUTiu4Kq0mLNnCiqu0/D2JcmRMm1DUe7Y=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EMeFHX2016020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 17:40:15 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 17:40:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 17:40:15 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EMcw4p096792;
	Thu, 14 Aug 2025 17:40:10 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Emanuele Ghidoli
	<emanuele.ghidoli@toradex.com>,
        Parth Pancholi <parth.pancholi@toradex.com>,
        Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Subject: [PATCH 16/33] arm64: dts: ti: k3-am62p-verdin: Add missing cfg for TI IPC Firmware
Date: Fri, 15 Aug 2025 04:08:22 +0530
Message-ID: <20250814223839.3256046-17-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814223839.3256046-1-b-padhi@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_154018_142090_63C0E5B7 
X-CRM114-Status: GOOD (  12.97  )
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

The wkup_r5fss0_core0_memory_region is used to store the text/data
sections of the Device Manager (DM) firmware itself and is necessary for
platform boot. Whereas the wkup_r5fss0_core0_dma_memory_region is used
for allocating the Virtio buffers needed for IPC with the DM core which
could be optional. The labels were incorrectly used in the
k3-am62p-verdin.dtsi file. Correct the firmware memory region label.

Currently, only mailbox node is enabled with FIFO assignment. However,
there are no users of the enabled mailboxes. Add the missing carveouts
for WKUP and MCU R5F remote processors, and enable those by associating
to the above carveout and mailboxes. This config aligns with other AM62P
boards and can be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Cc: Parth Pancholi <parth.pancholi@toradex.com>
Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Requesting for a review/test.

 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 42 ++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 6a04b370d149..0687debf3bbb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -162,7 +162,25 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
+		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b800000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b900000 0x00 0xf00000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0x01e00000>;
 			no-map;
@@ -848,6 +866,28 @@ mbox_mcu_r5_0: mbox-mcu-r5-0 {
 	};
 };
 
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
 &main0_alert {
 	temperature = <95000>;
 };
-- 
2.34.1


