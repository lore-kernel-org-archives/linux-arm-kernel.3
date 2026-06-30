Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5cNoPvRhwfLpIKM6ae8tR08xr5Dl3OmT2QfMWtQrLI=; b=kkyCrKLrbEhWH0jO2SHkuUiOzx
	lfrRSlnWPDRf13ObDgqvjLpuRNvepHte1r3WrqluHGvV5tcIxCpt7EBcHU97QyBIwkMMqprEXCe41
	TY/yE7tPAJZbUFiM3qjEt3TxK4k4uWQJ3t8d0J7O/SiXGX1Ig9646F9YcOPB+ovAvT+K86Fnxc9Fp
	lLaGcrZ84czXgClzyGUVVz92ZKP98GZOhs9qE5hIGptkA4o+ZX2ZUrH4DIWqS8FpWdAKbmZhVt99B
	ql9lqxSw3kKkJNLSvqkaYSVItq1FneoFZUkAbmyPDS3YOPgkLkJw5QoJPhOmQHY7FnbLpu9kiYGKt
	cR7xrC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weY5u-0000000H6uW-1y2y;
	Tue, 30 Jun 2026 13:01:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weY5n-0000000H6rb-1wGm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:01:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 982E82ED2;
	Tue, 30 Jun 2026 06:01:29 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C569B3F905;
	Tue, 30 Jun 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782824494; bh=kq2w50c2u6bD7KF6gETrdsfnJ9vCOBcPVpF7JOs8C4Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BcyVjUD7Zqw9f1gmXonNnPoLC2XgU9+u4I7VT3HEIzngKYYL9tAaSB6DAS1ZLUyHo
	 hogigEt6GPWKcuQz4G+C1TUboLa927T4KbZOi5cDhry+UMhhZQ6sqxrqumm0OkS/wn
	 GXEbxToNjzPi05ut7ZYZiIq3XakQ4eEGxf4XQrnM=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	zeev@amazon.com,
	blakgeof@amazon.com,
	avivb@amazon.com,
	ilkka@os.amperecomputing.com
Subject: [PATCH v6 2/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Tue, 30 Jun 2026 14:01:18 +0100
Message-ID: <e9340d3a4385e6f1a6e80bda944a3ba6435472b6.1782824005.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1782824005.git.robin.murphy@arm.com>
References: <cover.1782824005.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_060135_600511_87DE2856 
X-CRM114-Status: GOOD (  16.43  )
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

From: Aviv Bakal <avivb@amazon.com>

Graviton5 uses a customised CMN-S3 implementation where certain
discovery registers report zeroed fields. Add the following workarounds:

 - Introduce a dedicated ACPI HID to identify the Graviton5 CMN variant.
 - Derive the DTC domain from the XP node ID, since the unit info
   register reports it as zero.
 - Set the DTC logical ID from the XP's logical ID, since the node info
   register's logical ID field is also zeroed.

Signed-off-by: Aviv Bakal <avivb@amazon.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v6: No change

 drivers/perf/arm-cmn.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 9392838408ff..50402bc4a21d 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -31,7 +31,8 @@
 #define CMN_CHILD_NODE_ADDR		GENMASK(29, 0)
 #define CMN_CHILD_NODE_EXTERNAL		BIT(31)
 
-#define CMN_MAX_DIMENSION		12
+/* Some implementations use a mesh larger than the architectural max of 12 */
+#define CMN_MAX_DIMENSION		14
 #define CMN_MAX_XPS			(CMN_MAX_DIMENSION * CMN_MAX_DIMENSION)
 #define CMN_MAX_DTMS			(CMN_MAX_XPS + (CMN_MAX_DIMENSION - 1) * 4)
 
@@ -215,6 +216,8 @@ enum cmn_part {
 	PART_CMN700 = 0x43c,
 	PART_CI700 = 0x43a,
 	PART_CMN_S3 = 0x43e,
+	/* Synthetic part number, overridden to PART_CMN_S3 during discovery */
+	PART_GRAVITON5 = 0xa5,
 };
 
 /* CMN-600 r0px shouldn't exist in silicon, thankfully */
@@ -2253,6 +2256,18 @@ static unsigned int arm_cmn_dtc_domain(struct arm_cmn *cmn, void __iomem *xp_reg
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
@@ -2298,6 +2313,7 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 	u64 reg;
 	int i, j;
 	size_t sz;
+	bool graviton5_workaround = false;
 
 	arm_cmn_init_node_info(cmn, rgn_offset, &cfg);
 	if (cfg.type != CMN_TYPE_CFG)
@@ -2308,6 +2324,13 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
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
@@ -2397,6 +2420,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 
 		if (cmn->part == PART_CMN600)
 			xp->dtc = -1;
+		else if (graviton5_workaround)
+			xp->dtc = arm_cmn_graviton5_dtc_domain(xp->id);
 		else
 			xp->dtc = arm_cmn_dtc_domain(cmn, xp_region);
 
@@ -2475,6 +2500,10 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
 
 			switch (dn->type) {
 			case CMN_TYPE_DTC:
+				if (graviton5_workaround) {
+					/* Node info logical ID is zeroed; use the XP's */
+					dn->logid = xp->logid;
+				}
 				cmn->num_dtcs++;
 				dn++;
 				break;
@@ -2690,6 +2719,7 @@ static const struct acpi_device_id arm_cmn_acpi_match[] = {
 	{ "ARMHC650" },
 	{ "ARMHC700" },
 	{ "ARMHC003" },
+	{ "AMZN0070", PART_GRAVITON5 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, arm_cmn_acpi_match);
-- 
2.54.0.dirty


