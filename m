Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5133CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yhxvSbXQReGRhqQx/3jdDECx9n6O4mQLUdvrGgK7Qw=; b=cygGTdskC6wBxZwqbQm5W7bYGs
	P2eTdWlHEKU3yGsmCW2uRxL2ZEfb8ZpFSJUq1mXiD1g+yMkm7ckk6IJhIATaMblXgc6utCOdyvEuh
	1mQGv0hWHeKpVb8zaVyiiBtLzKJRODOHdLm//9daJ4KaqmgfLEfz5hul0xAfszM7OKOB5J6gbOvCP
	bm13m2d2TTCt/QuLAEg3xviRtm/tE7exPSSXSkZHLVD/+06GVwqgM3mm03JtKWQTlIvfBgIstTOxY
	A8rWg6ecS3gf9kHtIPHs4yxMPPk4DE5tQU93BdIwOAIsX8CBEKXlCl+jATB6E+U60HLGvYKcm+WI5
	TdSpGTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPf-000000016Ua-0X8w;
	Mon, 08 Sep 2025 17:12:19 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcst-000000007Cj-0pOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:30:20 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588EUGHW071626;
	Mon, 8 Sep 2025 09:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341816;
	bh=0yhxvSbXQReGRhqQx/3jdDECx9n6O4mQLUdvrGgK7Qw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=l6vUn6IbETf3qMICEVkDCmWD3ZDlgGfMifKFxmvr0HiVMu6vCm+fEJ/f8ed8mQm3I
	 4VOgz4w4mz7vrtj4EGHdt7TL3AY0AI5jnHa62d2BytAQrdx5of69phU75nvl35HTTA
	 G2cYzz1PhDq2I0olMwocJEhrX0rdjFAdUdurfmg0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588EUGpW3020873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:30:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:30:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:30:16 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESecs1037553;
	Mon, 8 Sep 2025 09:30:10 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
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
Subject: [PATCH v4 16/34] arm64: dts: ti: k3-am62-verdin: Add missing cfg for TI IPC Firmware
Date: Mon, 8 Sep 2025 19:58:08 +0530
Message-ID: <20250908142826.1828676-17-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073019_334264_5DC578B8 
X-CRM114-Status: GOOD (  13.97  )
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

v4: Changelog:
1. None

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-16-b-padhi@ti.com/

v3: Changelog:
1. Changed carveout node names to memory@addr.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-16-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 18/33] to [PATCH v2 15/33].
2. Added T/B tag.

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-19-b-padhi@ti.com/
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 43 +++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 9384c9a0232a..5ecdd833587e 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -206,7 +206,25 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: memory@9db00000 {
+		mcu_m4fss_dma_memory_region: memory@9cb00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cb00000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_m4fss_memory_region: memory@9cc00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cc00000 0x00 0xe00000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: memory@9db00000 {
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


