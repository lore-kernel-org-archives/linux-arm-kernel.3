Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02706CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcxz1JcWlXzNERGvNURQOn7LnvQ7E0+RQ2OR3eg8Eeo=; b=LA47sz8F5i5Kii6EDodoDaDQyF
	gBeHqpe1yGdPHl5vqqVCskhYgMxpK8WDJSPXc7G9ncACeViNEPknxUA/yxweKG+SO14nrDX1w8Y1G
	3opJZV6L42jrTYLg6R0bHaR+hdo7bEhcItQWMiCn5BnTqtok+9lXpRzMtk04jBDqf52Cwg7j9tkGL
	HzWTOE9KDtBKv320kgGn7lLqHUh/25BKanifz+/NQku6QPtlMrvWEAOrvGAZUz2YFGwqtTofmQg5e
	1hT73AFiGPuRjgyfS5JLuaxuHB1WcElsEkyzwQXeia+looqRr3N8pwCCxxsPxo+OC9Ov44hxwJGD0
	79Dq5nZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upsOS-000000058y2-08yD;
	Sat, 23 Aug 2025 17:51:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqp7-00000004zSH-0eNG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:10:34 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGAURq468604;
	Sat, 23 Aug 2025 11:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965430;
	bh=gcxz1JcWlXzNERGvNURQOn7LnvQ7E0+RQ2OR3eg8Eeo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q95EOqRr/gZeOpPw/rIutZoqyJfLF/+4kR63tTJHRPC/IPQO2ZVDAjlejr3euIN54
	 kCku78+W+ZOLOn1Ze22u74bfA6jcB3GnQ3QexcTGgBocwnUSFkqYETVJeUQG962dNF
	 zzji1JaQNAWxPgIIxsVrCLo1ebxRfJgU83FIfHDU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGAUe1239687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:10:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:10:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:10:30 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9ExV1274978;
	Sat, 23 Aug 2025 11:10:24 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Hiago
 De Franco <hiago.franco@toradex.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        Jo_o Paulo Gon_alves
	<joao.goncalves@toradex.com>,
        Stefan Eichenberger
	<stefan.eichenberger@toradex.com>,
        Max Krummenacher
	<max.krummenacher@toradex.com>,
        Andrejs Cainikovs
	<andrejs.cainikovs@toradex.com>
Subject: [PATCH v2 15/33] arm64: dts: ti: k3-am62-verdin: Add missing cfg for TI IPC Firmware
Date: Sat, 23 Aug 2025 21:38:43 +0530
Message-ID: <20250823160901.2177841-16-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091033_278910_683E0F82 
X-CRM114-Status: GOOD (  13.41  )
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
k3-am62-verdin.dtsi file. Correct the firmware memory region label.

Currently, only mailbox node is enabled with FIFO assignment for a
single M4F remote core. However, there are no users of the enabled
mailboxes. Add the missing carveouts for WKUP R5F and MCU M4F remote
processors, and enable those by associating to the above carveout and
mailboxes. This config aligns with other AM62 boards and can be
refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Verdin AM62
---
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Jo_o Paulo Gon_alves <joao.goncalves@toradex.com>
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Requesting for review/test of this patch

v2: Changelog:
1. Re-ordered patch from [PATCH 18/33] to [PATCH v2 15/33].
2. Added T/B tag.

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-19-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 43 +++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index cbbcb96e2e24..fa2c1dc738d6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -206,7 +206,25 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
+		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cb00000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cc00000 0x00 0xe00000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9db00000 0x00 0xc00000>;
 			no-map;
@@ -1323,6 +1341,29 @@ mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 /* Verdin CAN_1 */
-- 
2.34.1


