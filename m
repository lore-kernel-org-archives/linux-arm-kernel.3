Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA974C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgcwyDvjdg6gqeThBtircADvL3wWT7+Rlfxr+ZKTSHw=; b=XF8SwoMNSuTqmR8UiyzkcXHPbP
	bb09L8LeVVq6BrfkWPJ1B3FJlojSCsk9yKDNfNcBAguLNW52DVkw3/q3OKJ9DaJACt60TAk8AHdeK
	Se7fGe+IRqzBPpEDSeck6tR/m5e22ry0BKIfOm9YtarQGoWPvB6R4ONF0xMWZTlWR4IFK8xD5b0iQ
	emJZMVvbUJmefJ3h0wykr0cKCDigLESXO/4OkE3HbuPTYrv/QVmWwYTp343tQdiIZNmyKum+cThCC
	bQ0Fufx1UqBNlYK7+75HT31lANH6g1E31e5t3wUOeY0LAAes3v4KcIUKZ5Jp33SIC79vQgci0e7kZ
	ecbZ6fAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkwA-00000003YX5-0vx7;
	Mon, 23 Jun 2025 17:26:30 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThvY-00000002zxb-0gZZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:13:41 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55NEDbxt1572844;
	Mon, 23 Jun 2025 09:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750688017;
	bh=qgcwyDvjdg6gqeThBtircADvL3wWT7+Rlfxr+ZKTSHw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vMCDUPFdGXCndJ3Pf2o8i0GWTX/u7wBgCRrqNkRKXlpQ7RY6Yp13jPnjDiLrLizx7
	 mXLNL7VwUAwGmHHbYzTtgdiUzaxTvB9/CIsepE1FKUt35nDp7Ith+1eeNXEt3POSLv
	 DI6pni6rTTRcv7E3oKPXZOYjQ+LbEJkU3yydFreM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55NEDbkm574406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 09:13:37 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 09:13:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 09:13:37 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55NEDa4e050409;
	Mon, 23 Jun 2025 09:13:37 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
Subject: [PATCHv4 5/6] arm64: dts: ti: Update firmware-name for IPC
Date: Mon, 23 Jun 2025 19:42:52 +0530
Message-ID: <20250623141253.3519546-6-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623141253.3519546-1-p-bhagat@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071340_255155_BFD7935F 
X-CRM114-Status: GOOD (  10.20  )
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

Update the firmware-name properties in the dts file to point to new IPC
firmware binaries for both the mcu-r5 and c7x core.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 8fde89ecba67..c98e4c98c956 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -487,6 +487,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	firmware-name = "am62d-mcu-r5f0_0-fw";
 };
 
 &c7x_0 {
@@ -495,6 +496,7 @@ &c7x_0 {
 	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
+	firmware-name = "am62d-c71_0-fw";
 };
 
 &cpsw3g {
-- 
2.34.1


