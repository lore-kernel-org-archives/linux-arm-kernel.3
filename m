Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56ECCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8g9UgLLxo2Fuh4J8hCO+Zlk0sbgEK3VZTNEp9tiWrc8=; b=waAWQ+5Bi8yrhfYkC+1QT58HIN
	LDAfS6iFXZ4a23Yd9SDJ6435NybvzEiJTJhD+uKVnZn1GA8liS7sABWaxUKHVVHg8e3AH3zKyxMyx
	jAqhhtIOX8kbUL+hDzh2kApkNUK5UGXmGNXZ5cxej3WqZCkICDjF9+CjnFjHMyebvXz0wnhemRQVK
	Xeb1sVATFxzeZqasr+I85ehH4jpiHdkhanbL7iYCwuaRdHqf8Pgfd4v5VGeMcViTW3ghiWJxdSb/B
	g32BI/PaV0YbPfRw84PjJNlor/hhjeuNHcEvhQ0HNqL10tavoYkJUYQS1Dcdv/4DpxZVlzqmE80+h
	bUJ/ntGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAvG-0000000FC5V-3FB2;
	Sun, 24 May 2026 15:39:26 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAv1-0000000FC1H-3AdC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 15:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1779637151; x=1811173151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8g9UgLLxo2Fuh4J8hCO+Zlk0sbgEK3VZTNEp9tiWrc8=;
  b=PkTXj1P6a67iP2yQXSSuAMq1IvR9oOqUoB7GUiJ6y/i1ycGhYPp99Csq
   aOwTAGgPfSOOD23BPCEl8ReS8e62lytrGtHoQrLBzzN0AhCAfqv2XM5Wb
   pnoeZn9vvJ96CLVA1Q2XOPlyIixPdWk7LsQnvjcfBjDqT3JXvFFpt+WYs
   JFYUm5eVjx4wHwW+faM0SChlRKtM6Cyov0u9bLFCdKoFYUo4jIEz+neqn
   TGwiQ1xfTy+UTUWyidplOe6NCgz0oqZeRNwy/TxbEbsRZYJ7/XuQLFWZS
   hKcdmKFV+hX3ajwCnVOSMiBa2oKcoFC7sR7E8c5EG0yAeZydTDCty9NQH
   w==;
X-CSE-ConnectionGUID: kY/91ROSQ6yS+JKmk3U+iQ==
X-CSE-MsgGUID: txIf5C8sS1+zlUX3/hKIjQ==
X-IronPort-AV: E=Sophos;i="6.24,166,1774310400"; 
   d="scan'208";a="20391560"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 15:39:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:13066]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.254:2525] with esmtp (Farcaster)
 id 59be0b91-0c87-4ae3-b7fe-25fe0a37c103; Sun, 24 May 2026 15:39:05 +0000 (UTC)
X-Farcaster-Flow-ID: 59be0b91-0c87-4ae3-b7fe-25fe0a37c103
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 24 May 2026 15:39:03 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 24 May 2026 15:39:02 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<avivb@amazon.com>, <zeev@amazon.com>, <blakgeof@amazon.com>
Subject: [PATCH v3 2/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Sun, 24 May 2026 18:38:48 +0300
Message-ID: <20260524153848.16334-3-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524153848.16334-1-avivb@amazon.com>
References: <20260504133923.23373-1-avivb@amazon.com>
 <20260524153848.16334-1-avivb@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D033UWC004.ant.amazon.com (10.13.139.225) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_083911_845038_5A4A979D 
X-CRM114-Status: GOOD (  15.11  )
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

Graviton5 uses a customised CMN-S3 implementation where certain
discovery registers report zeroed fields. Add the following workarounds:

 - Introduce a dedicated ACPI HID to identify the Graviton5 CMN variant.
 - Derive the DTC domain from the XP node ID, since the unit info
   register reports it as zero.
 - Set the DTC logical ID from the XP's logical ID, since the node info
   register's logical ID field is also zeroed.

Signed-off-by: Aviv Bakal <avivb@amazon.com>
---
 drivers/perf/arm-cmn.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 3443b819afed..0184e598777a 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -208,6 +208,8 @@ enum cmn_part {
 	PART_CMN700 = 0x43c,
 	PART_CI700 = 0x43a,
 	PART_CMN_S3 = 0x43e,
+	/* Synthetic part number, overridden to PART_CMN_S3 during discovery */
+	PART_GRAVITON5 = 0xa5,
 };
 
 /* CMN-600 r0px shouldn't exist in silicon, thankfully */
@@ -2197,6 +2199,18 @@ static unsigned int arm_cmn_dtc_domain(struct arm_cmn *cmn, void __iomem *xp_reg
 	return FIELD_GET(CMN_DTM_UNIT_INFO_DTC_DOMAIN, readl_relaxed(xp_region + offset));
 }
 
+static unsigned int arm_cmn_graviton5_dtc_domain(u16 xp_id)
+{
+	unsigned int x = (xp_id >> 7) & 0xf;
+	unsigned int y = (xp_id >> 3) & 0xf;
+
+	/*
+	 * The unit info register reads as zero; derive the DTC domain from
+	 * the XP's mesh coordinates over the 10x14 mesh.
+	 */
+	return (x / 5) + (y / 7) * 2;
+}
+
 static void arm_cmn_init_node_info(struct arm_cmn *cmn, u32 offset, struct arm_cmn_node *node)
 {
 	int level;
@@ -2242,6 +2256,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	u64 reg;
 	int i, j;
 	size_t sz;
+	bool graviton5_workaround = false;
 
 	arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
 	if (cfg.type != CMN_TYPE_CFG)
@@ -2252,6 +2267,13 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	reg = readq_relaxed(cfg_region + CMN_CFGM_PERIPH_ID_01);
 	part = FIELD_GET(CMN_CFGM_PID0_PART_0, reg);
 	part |= FIELD_GET(CMN_CFGM_PID1_PART_1, reg) << 8;
+
+	/* Graviton5 has a customised CMN-S3 which needs some fixups */
+	if (cmn->part == PART_GRAVITON5) {
+		cmn->part = PART_CMN_S3;
+		graviton5_workaround = true;
+	}
+
 	/* 600AE is close enough that it's not really worth more complexity */
 	if (part == PART_CMN600AE)
 		part = PART_CMN600;
@@ -2341,6 +2363,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 
 		if (cmn->part == PART_CMN600)
 			xp->dtc = -1;
+		else if (graviton5_workaround)
+			xp->dtc = arm_cmn_graviton5_dtc_domain(xp->id);
 		else
 			xp->dtc = arm_cmn_dtc_domain(cmn, xp_region);
 
@@ -2419,6 +2443,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 
 			switch (dn->type) {
 			case CMN_TYPE_DTC:
+				if (graviton5_workaround) {
+					/* Node info logical ID is zeroed; use the XP's */
+					dn->logid = xp->logid;
+				}
 				cmn->num_dtcs++;
 				dn++;
 				break;
@@ -2634,6 +2662,7 @@ static const struct acpi_device_id arm_cmn_acpi_match[] = {
 	{ "ARMHC650" },
 	{ "ARMHC700" },
 	{ "ARMHC003" },
+	{ "AMZN0070", PART_GRAVITON5 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);
-- 
2.47.3


