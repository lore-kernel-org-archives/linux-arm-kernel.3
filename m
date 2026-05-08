Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1735ACD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IcU+keYZIui8HaY30EPbxflixrP7R0G3/3FnmiMflKc=; b=AQyH7Mg1x07c/ja/E1Hl8GXSCr
	dCPd16kcsVzqByIIR6FT7SEWBrDYQJQYj6Ri2pYF08Rb3y2jwjf4AhTtnrOAWMxwUsmUK0peQJjHy
	UGnC3Y5l3GNU78o8ytP5wZvJC0fbGjbBE3aR5N48hGGJyb280NYsrbkeZBY2JF9u+d1Rr7OSW4eHc
	oAvUUw4dIbO3C5NFQDwmAfySV1rovnFclub+K+0wQyTBS5D5yLeCl24JzhB7rcj4q00OxIcDG9Qx6
	qDn66/sZdsOFA8tF9gCiDf4UmD4+zsyl3OHqOZK5LjO0uzHvJoeoDSDHsfXeAbpDQhQMZdtvEGp1F
	xkVaC6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBi-00000006q7B-1Eil;
	Fri, 08 May 2026 15:32:26 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNBf-00000006q67-2zny
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxZm1PiCLOqWbAZ/mhc0BH9m0NZTdi5XvdJlRRuhF9ZPrR9OJHfyfcwvMGFywOykdWZV2543XbQcYhYOKglGEc3obb+MguaLgLGiDV6Kdvw0TmqmTl/PrahOqYiZxfidL1TO6e5rtc3Lfw5ZkYWZ62/5ANGvdTBSc/NG2d13bwl9Ov9H/H5HZslHtk2/cV4UgregHqZm6VgwGK4tD94aAQEUmmwNdtU9QE/hX7m3GqyUrs1X8eoRJA/eCLXcAnlYROzsdbUMmp+4/a6nTiYt6xvDZDZpR1ejZDqVD1Nf9R/Zefc/irupSYtS9zue4iWRup6XpzR331EWAjg69ObjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcU+keYZIui8HaY30EPbxflixrP7R0G3/3FnmiMflKc=;
 b=uJ8ULtzRh1yrs0gZyZGpjPrvVuDKPvR7hnW71jpl3/a9s8tzNvTeWodCUWhKsHobsVmvkUSS5GRLyxH3skz2oFX4oAq70Ox9VPyN1xYeWmScAzrAVUpYHorP83YtRhR0ZZhu13jYV2AQlsFq9Q/qyeoQkRKaHapZVmGIc14qOyluIjYeisKuzNnxlqrHRe/WrTSD2WWzkr0sx9WCfnn41uOz+ckX3eGrdfVONDRLUaau+R4SGAaHRF1VfgvgGc248U54GK8fZlnvIukoHt9n5UeKWIa0AOYHBvUr6kLwmLYgH48uNeEENU+R4mGH67EEs71rL6fAqYt1XrJShkggsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcU+keYZIui8HaY30EPbxflixrP7R0G3/3FnmiMflKc=;
 b=nZh/L1/7tIpKY7DrBSOxe0wqcGR15FM3X7ozJUC/BnJ3m9BfHxoAcQS5fDuN/+d2++BGppePdLJfc4Nksm8Z7J/cHKx92op+TqDYsHRUfWjwZQxlEpAtsHd8QrKcT8f0skKDoYnVKSWYkHJ1TvasjwRZufLQqyPM/GCfBbPohm0=
Received: from PH0PR07CA0108.namprd07.prod.outlook.com (2603:10b6:510:4::23)
 by IA1PR10MB6759.namprd10.prod.outlook.com (2603:10b6:208:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 15:32:18 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:4:cafe::17) by PH0PR07CA0108.outlook.office365.com
 (2603:10b6:510:4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:32:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Fri, 8 May 2026 15:32:18 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEdK1961975;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 02/11] soc: ti: knav_qmss: Rename global kdev to knav_qdev to fix -Wshadow
Date: Fri, 8 May 2026 10:32:02 -0500
Message-ID: <20260508153211.3688277-3-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|IA1PR10MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f9587a-d224-46b4-55ca-08dead16fd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MzB0ybDcGJopo2W/gaU3jualz8at6Ig3Xy17diWvYcV2djigHuz5Q+Q7ueBdaG51638KFCk3eHuUDWARnxNpUvKPzPdYofB318VAQ83Av1GsmK6rFt/B4Nak0EQfs10i3T5EROqpONC2LHvUGyTGNk7HJOl915AwWxroseq9cjVUBGtLueepmxzuzzP683yRFMVmcDl2d12x/UsqdJp8E3ojxcL0WQ0Gd3yuekHq0sJ54w7CcxbUxojQoHT1uPGx8jIyTrTLI0PyfYO+oHx8Y8EVqirhMijPHvbjKErgAyQgJH8Su1GV1FvY5xiI6FVFzBR7WMxDFqaksm8CFXVqdJxVbmpSTgy7tF9JkRoJq78L41Mqq3nfM7F12uzdN8VN9vQoP7eKlBaDbZYve3IUz25y4uGmR0qwnMuCQxgMnslkwIo0jqtp1k1/Y1m9q9jDTjwoOVBKrZRmWPPFMyTVuFh+7bgnS8XlrzoH3hnxhQ4hZnIByakSgsz1gqx6HHjCuiPLxnxZOeO2N4bTCK0F45UvdAZUxsHxnbW1SpDEew5lFOS5Drvwe0eFHGuJkf+ORyvjS5pQ3AsBzeDEGOiIQRX0QrKcvGw2ea3O2odTJhWmd4etdzw2t0yd8P6RmLzUD9tu1+GdKcCwY3Vy0DMZt4AFivK3J35sdGmWDyCo7qZy5Vw5dDZ7D4BW4wDxpvhOXlaPcPitepq/BUQ7M4GU3cpUpoypZPu2cOTxkL82jPg=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7HRJhOaLKXgUbBVfWYye8C7Li6r1QIBb1MsZkHfwOl0aLCvgIrmB6dbgoKyfC48CuIo+YVkHLKdybkYUdJeaXK9xYD7aCxEDtWxfeahVMQYvxjBPUUgEcmPBm8icW6nK90Y1wxXICUnrPSbs8JYRc9vb1yP7xhOSpkGPZuC89ktLrPfWrY9FfEhWlvSg021rXZqrylmKxNnrFR/5qVG23NJss6wMaWRVBkCoojLYjU8bG+uu8Gc9Q9irXKIqLomCHOGmEIELLC+1FEMuCo/p8HztSZFokGucNqN7bbhy2Cdahj0igajnO8xH/2b0SDM6/COJlyPwA1kCYindsWz9osRCJMhVB5byRsoOANw2KlRaVrdohNfDHjIHATcSMSYY/CaR0yWh1R3wYAvsZyo6RQT7aYfsvo9lmSVeiDnSpItsuq4WqPvIF8RCQTednG/H
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:18.1647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f9587a-d224-46b4-55ca-08dead16fd41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083223_874983_703E0ED0 
X-CRM114-Status: GOOD (  17.80  )
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

Building with W=2 (clang, LLVM=1) produces 22 -Wshadow warnings in
knav_qmss_queue.c because the file-scoped singleton 'kdev' is shadowed
by a parameter of the same name in 21 internal functions and one local
variable, e.g.:

  knav_qmss_queue.c:194:49: warning: declaration shadows a variable
  in the global scope [-Wshadow]
  194 | knav_queue_match_id_to_inst(struct knav_device *kdev, unsigned id)

Rename the global singleton from kdev to knav_qdev rather than
renaming all ~21 function parameters, as this requires fewer changes
and leaves function signatures, struct field accesses, and header
macros in knav_qmss.h untouched.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/soc/ti/knav_qmss_queue.c | 94 ++++++++++++++++----------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index e87a42734f25..2c103bb6edef 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -25,7 +25,7 @@
 
 #include "knav_qmss.h"
 
-static struct knav_device *kdev;
+static struct knav_device *knav_qdev;
 static DEFINE_MUTEX(knav_dev_lock);
 #define knav_dev_lock_held() \
 	lockdep_is_held(&knav_dev_lock)
@@ -205,10 +205,10 @@ knav_queue_match_id_to_inst(struct knav_device *kdev, unsigned id)
 
 static inline struct knav_queue_inst *knav_queue_find_by_id(int id)
 {
-	if (kdev->base_id <= id &&
-	    kdev->base_id + kdev->num_queues > id) {
-		id -= kdev->base_id;
-		return knav_queue_match_id_to_inst(kdev, id);
+	if (knav_qdev->base_id <= id &&
+	    knav_qdev->base_id + knav_qdev->num_queues > id) {
+		id -= knav_qdev->base_id;
+		return knav_queue_match_id_to_inst(knav_qdev, id);
 	}
 	return NULL;
 }
@@ -296,7 +296,7 @@ static struct knav_queue *knav_queue_open_by_type(const char *name,
 
 	mutex_lock(&knav_dev_lock);
 
-	for_each_instance(idx, inst, kdev) {
+	for_each_instance(idx, inst, knav_qdev) {
 		if (knav_queue_is_reserved(inst))
 			continue;
 		if (!knav_queue_match_type(inst, type))
@@ -469,9 +469,9 @@ static int knav_queue_debug_show(struct seq_file *s, void *v)
 
 	mutex_lock(&knav_dev_lock);
 	seq_printf(s, "%s: %u-%u\n",
-		   dev_name(kdev->dev), kdev->base_id,
-		   kdev->base_id + kdev->num_queues - 1);
-	for_each_instance(idx, inst, kdev)
+		   dev_name(knav_qdev->dev), knav_qdev->base_id,
+		   knav_qdev->base_id + knav_qdev->num_queues - 1);
+	for_each_instance(idx, inst, knav_qdev)
 		knav_queue_debug_show_instance(s, inst);
 	mutex_unlock(&knav_dev_lock);
 
@@ -762,17 +762,17 @@ void *knav_pool_create(const char *name,
 	unsigned last_offset;
 	int ret;
 
-	if (!kdev)
+	if (!knav_qdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	if (!kdev->dev)
+	if (!knav_qdev->dev)
 		return ERR_PTR(-ENODEV);
 
-	pool = devm_kzalloc(kdev->dev, sizeof(*pool), GFP_KERNEL);
+	pool = devm_kzalloc(knav_qdev->dev, sizeof(*pool), GFP_KERNEL);
 	if (!pool)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_region(kdev, reg_itr) {
+	for_each_region(knav_qdev, reg_itr) {
 		if (reg_itr->id != region_id)
 			continue;
 		region = reg_itr;
@@ -780,14 +780,14 @@ void *knav_pool_create(const char *name,
 	}
 
 	if (!region) {
-		dev_err(kdev->dev, "region-id(%d) not found\n", region_id);
+		dev_err(knav_qdev->dev, "region-id(%d) not found\n", region_id);
 		ret = -EINVAL;
 		goto err;
 	}
 
 	pool->queue = knav_queue_open(name, KNAV_QUEUE_GP, 0);
 	if (IS_ERR(pool->queue)) {
-		dev_err(kdev->dev,
+		dev_err(knav_qdev->dev,
 			"failed to open queue for pool(%s), error %ld\n",
 			name, PTR_ERR(pool->queue));
 		ret = PTR_ERR(pool->queue);
@@ -795,13 +795,13 @@ void *knav_pool_create(const char *name,
 	}
 
 	pool->name = kstrndup(name, KNAV_NAME_SIZE - 1, GFP_KERNEL);
-	pool->kdev = kdev;
-	pool->dev = kdev->dev;
+	pool->kdev = knav_qdev;
+	pool->dev = knav_qdev->dev;
 
 	mutex_lock(&knav_dev_lock);
 
 	if (num_desc > (region->num_desc - region->used_desc)) {
-		dev_err(kdev->dev, "out of descs in region(%d) for pool(%s)\n",
+		dev_err(knav_qdev->dev, "out of descs in region(%d) for pool(%s)\n",
 			region_id, name);
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -827,10 +827,10 @@ void *knav_pool_create(const char *name,
 		pool->num_desc = num_desc;
 		pool->region_offset = last_offset;
 		region->used_desc += num_desc;
-		list_add_tail(&pool->list, &kdev->pools);
+		list_add_tail(&pool->list, &knav_qdev->pools);
 		list_add_tail(&pool->region_inst, node);
 	} else {
-		dev_err(kdev->dev, "pool(%s) create failed: fragmented desc pool in region(%d)\n",
+		dev_err(knav_qdev->dev, "pool(%s) create failed: fragmented desc pool in region(%d)\n",
 			name, region_id);
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -844,7 +844,7 @@ void *knav_pool_create(const char *name,
 	mutex_unlock(&knav_dev_lock);
 err:
 	kfree(pool->name);
-	devm_kfree(kdev->dev, pool);
+	devm_kfree(knav_qdev->dev, pool);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(knav_pool_create);
@@ -872,7 +872,7 @@ void knav_pool_destroy(void *ph)
 
 	mutex_unlock(&knav_dev_lock);
 	kfree(pool->name);
-	devm_kfree(kdev->dev, pool);
+	devm_kfree(knav_qdev->dev, pool);
 }
 EXPORT_SYMBOL_GPL(knav_pool_destroy);
 
@@ -1683,7 +1683,7 @@ static inline struct knav_qmgr_info *knav_find_qmgr(unsigned id)
 {
 	struct knav_qmgr_info *qmgr;
 
-	for_each_qmgr(kdev, qmgr) {
+	for_each_qmgr(knav_qdev, qmgr) {
 		if ((id >= qmgr->start_queue) &&
 		    (id < qmgr->start_queue + qmgr->num_queues))
 			return qmgr;
@@ -1775,22 +1775,22 @@ static int knav_queue_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	kdev = devm_kzalloc(dev, sizeof(struct knav_device), GFP_KERNEL);
-	if (!kdev) {
+	knav_qdev = devm_kzalloc(dev, sizeof(struct knav_device), GFP_KERNEL);
+	if (!knav_qdev) {
 		dev_err(dev, "memory allocation failed\n");
 		return -ENOMEM;
 	}
 
 	if (device_get_match_data(dev))
-		kdev->version = QMSS_66AK2G;
+		knav_qdev->version = QMSS_66AK2G;
 
-	platform_set_drvdata(pdev, kdev);
-	kdev->dev = dev;
-	INIT_LIST_HEAD(&kdev->queue_ranges);
-	INIT_LIST_HEAD(&kdev->qmgrs);
-	INIT_LIST_HEAD(&kdev->pools);
-	INIT_LIST_HEAD(&kdev->regions);
-	INIT_LIST_HEAD(&kdev->pdsps);
+	platform_set_drvdata(pdev, knav_qdev);
+	knav_qdev->dev = dev;
+	INIT_LIST_HEAD(&knav_qdev->queue_ranges);
+	INIT_LIST_HEAD(&knav_qdev->qmgrs);
+	INIT_LIST_HEAD(&knav_qdev->pools);
+	INIT_LIST_HEAD(&knav_qdev->regions);
+	INIT_LIST_HEAD(&knav_qdev->pdsps);
 
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -1805,31 +1805,31 @@ static int knav_queue_probe(struct platform_device *pdev)
 		ret = -ENODEV;
 		goto err;
 	}
-	kdev->base_id    = temp[0];
-	kdev->num_queues = temp[1];
+	knav_qdev->base_id    = temp[0];
+	knav_qdev->num_queues = temp[1];
 
 	/* Initialize queue managers using device tree configuration */
-	ret = knav_queue_init_qmgrs(kdev, node);
+	ret = knav_queue_init_qmgrs(knav_qdev, node);
 	if (ret)
 		goto err;
 
 	/* get pdsp configuration values from device tree */
-	ret = knav_queue_setup_pdsps(kdev, node);
+	ret = knav_queue_setup_pdsps(knav_qdev, node);
 	if (ret)
 		goto err;
 
 	/* get usable queue range values from device tree */
-	ret = knav_setup_queue_pools(kdev, node);
+	ret = knav_setup_queue_pools(knav_qdev, node);
 	if (ret)
 		goto err;
 
-	ret = knav_get_link_ram(kdev, "linkram0", &kdev->link_rams[0]);
+	ret = knav_get_link_ram(knav_qdev, "linkram0", &knav_qdev->link_rams[0]);
 	if (ret) {
-		dev_err(kdev->dev, "could not setup linking ram\n");
+		dev_err(knav_qdev->dev, "could not setup linking ram\n");
 		goto err;
 	}
 
-	ret = knav_get_link_ram(kdev, "linkram1", &kdev->link_rams[1]);
+	ret = knav_get_link_ram(knav_qdev, "linkram1", &knav_qdev->link_rams[1]);
 	if (ret) {
 		/*
 		 * nothing really, we have one linking ram already, so we just
@@ -1837,15 +1837,15 @@ static int knav_queue_probe(struct platform_device *pdev)
 		 */
 	}
 
-	ret = knav_queue_setup_link_ram(kdev);
+	ret = knav_queue_setup_link_ram(knav_qdev);
 	if (ret)
 		goto err;
 
-	ret = knav_queue_setup_regions(kdev, node);
+	ret = knav_queue_setup_regions(knav_qdev, node);
 	if (ret)
 		goto err;
 
-	ret = knav_queue_init_queues(kdev);
+	ret = knav_queue_init_queues(knav_qdev);
 	if (ret < 0) {
 		dev_err(dev, "hwqueue initialization failed\n");
 		goto err;
@@ -1857,9 +1857,9 @@ static int knav_queue_probe(struct platform_device *pdev)
 	return 0;
 
 err:
-	knav_queue_stop_pdsps(kdev);
-	knav_queue_free_regions(kdev);
-	knav_free_queue_ranges(kdev);
+	knav_queue_stop_pdsps(knav_qdev);
+	knav_queue_free_regions(knav_qdev);
+	knav_free_queue_ranges(knav_qdev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return ret;
-- 
2.47.0


