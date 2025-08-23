Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB16CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45E9osXqTMYSZyiJZzhMiH8dR89qUdt7aZRrzcTd7f0=; b=EM8I0gQMZdwtg6eXMynggRPQ34
	3CGIs41JX2Qp1BH6V+Xdj2a7XzDIjV9f3s5avLCIl8F0VDGR5foGDYEDNLM4xe6vvxTur09z6i6Qa
	TGFw4EKF2MS6u3mLvDkmKMlh+8yQjYNfvb+zacRWwH3EaAu66WpUZ9mpnlBArdwhAEgUxGyecaU+T
	upPA9IE9rtg+MIvDrsWUCDTJPSqkt9sJefCqgo9lYZyECc6943V+wrrUINDEVKx8T+dAT9oSaivoW
	yHjsyCsQUmJtd+MiyYyEM0WYyeN//yK9wvH1ILlC4GBB4g4p3DO3OT9YWYmL2/oLbUDcrmBkFP5eI
	cIBexoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upsR3-0000000598I-3fcA;
	Sat, 23 Aug 2025 17:53:51 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqpB-00000004zTJ-3t6o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:10:39 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGAZrr936126;
	Sat, 23 Aug 2025 11:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965435;
	bh=45E9osXqTMYSZyiJZzhMiH8dR89qUdt7aZRrzcTd7f0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JWW+P9LVMHzIQ40JmdhCP5TXoJIbrb68M8qYUasKrwXDMKqIdUHFnq4pmxael2CC2
	 9K7Thepa2h1VnH7pIylB+vWDHGzgiu1umQV4+bAI5tK1ACqQHfDFl0RwhTaMQuSVIQ
	 xAXsNZywo1ZufpO0JVOB1asB8SoBGJDlIiuZEJ6s=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGAYeo4080232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:10:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:10:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:10:34 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9ExW1274978;
	Sat, 23 Aug 2025 11:10:30 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH v2 16/33] arm64: dts: ti: k3-am62-pocketbeagle2: Add missing cfg for TI IPC Firmware
Date: Sat, 23 Aug 2025 21:38:44 +0530
Message-ID: <20250823160901.2177841-17-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091038_054871_085BCC64 
X-CRM114-Status: GOOD (  12.86  )
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
k3-am62-pocketbeagle2.dts file. Correct the firmware memory region label

Currently, only mailbox node is enabled with FIFO assignment for a
single M4F remote core. Add the missing carveouts for WKUP R5F remote
processor, and enable that by associating to the above carveout and
mailbox. This config aligns with other AM62 boards and can be
refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Robert Nelson <robertcnelson@gmail.com>
Requesting for review/test of this patch

v2: Changelog:
1. Re-ordered patch from [PATCH 19/33] to [PATCH v2 16/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-20-b-padhi@ti.com/

 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 2eee5f638e0f..729901b2ca10 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -78,7 +78,13 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
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
@@ -299,6 +305,11 @@ mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
 };
 
 &main_uart0 {
@@ -358,6 +369,17 @@ &mcu_m4fss {
 	status = "okay";
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
 &mcu_pmx0 {
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
-- 
2.34.1


