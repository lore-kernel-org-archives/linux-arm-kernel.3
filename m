Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F809CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTDuNChedB0TuD5WiNg03FSxfY5xGoCbfmGISIaYXng=; b=i1yRMzZByu0fIjmiWq0C2xWenf
	fbjzzRpmnQJ8QduJ5Qa/IZak8TE/pGh3Ome+UYjnPv/2F8HzxvwtBm9FZEUEEnOYk7LYtKwSp5Ksl
	rK91KnQHohuSAZ6tUEpCtAdcSsiXH2uDAQxHIqNuN5Ckm5j2Y9jddBBjsmp8BA5bJ/1mFEU1je12k
	cu34/+3U148CadEa0SN1+P8GPKzrZKX2bJHToF1dL7e+9BMqVZF7YsFOb89K6upACrG5gencG6d7J
	trZvqgsnEtIlKPoVmGAq/55rlstUEx2JRTcSLZ1q3cMnmXEA47zg5Ns2RVc1eZCFNFgwh/E7YaTVg
	Y8f/7/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upsJF-000000058eP-44rm;
	Sat, 23 Aug 2025 17:45:45 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqow-00000004zQX-0YgL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:10:23 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGAJRb936106;
	Sat, 23 Aug 2025 11:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965419;
	bh=UTDuNChedB0TuD5WiNg03FSxfY5xGoCbfmGISIaYXng=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nhInGBzIzLqkGdBa0FArCKFIUMmXZmmTqXq9GXf1TnWUG07+7a5//FBSwphmTfau4
	 cYatgeg+mjL5NblZLh7kT1ehvlQ/MrFm8LaDud+IaQfvLjUhdcPP1LgLZ5SSjSQ0kU
	 y1DJzp0iCOCfaUSk7edzAKsi6+jdzI8qwwYJ9pJs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGAJEN4080178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:10:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:10:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:10:18 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9ExT1274978;
	Sat, 23 Aug 2025 11:10:14 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH v2 13/33] arm64: dts: ti: k3-j721e-beagleboneai64: Add missing cfg for TI IPC FW
Date: Sat, 23 Aug 2025 21:38:41 +0530
Message-ID: <20250823160901.2177841-14-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091022_262904_43BB1855 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The TI IPC Firmwares running on J721E SoCs use certain MAIN domain
timers as tick. Reserve those at board level DT to avoid remote
processor crashes. This config aligns with other J721E boards and can
be refactored out later.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Cc: Robert Nelson <robertcnelson@gmail.com>
Requesting for review/test of this patch.

v2: Changelog:
1. Split [PATCH 06/33] into [PATCH v2 13/33] and [PATCH v2 22/33].
This patch only reserves the timer nodes used by rproc firmware.

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-7-b-padhi@ti.com/

 .../boot/dts/ti/k3-j721e-beagleboneai64.dts   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 0d1a313a7d10..2ff4cdf1300f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -935,6 +935,35 @@ mbox_c71_0: mbox-c71-0 {
 	};
 };
 
+/* Timers are used by Remoteproc firmware */
+&main_timer0 {
+	status = "reserved";
+};
+
+&main_timer1 {
+	status = "reserved";
+};
+
+&main_timer2 {
+	status = "reserved";
+};
+
+&main_timer12 {
+	status = "reserved";
+};
+
+&main_timer13 {
+	status = "reserved";
+};
+
+&main_timer14 {
+	status = "reserved";
+};
+
+&main_timer15 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.34.1


