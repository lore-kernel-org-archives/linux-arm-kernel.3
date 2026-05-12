Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB00CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTE9sENCyrA+FQ3/aF1GiuwlmmKh+HsAjVQHsUOsWFo=; b=c3+DdF2Cit6V0069bBeVmONSBh
	IaQELlWp8fr5mf0BzFyWPGF48QaiUmXY6BnD7YWcjLBZvxILNUau6tYBtiWSxCMQtX5d56c/leFxk
	Fl556P/NHtAd94cRAVa8G6ixtBdvx9tkCAKugifoV67DXgVwq91XdcNtHPJQ/63RQm6gKNmVydDO7
	5EoEPbU3Kf3HJZfqYVsLwmZi6EyW0lRO1XgfERD+BwNxxQwTz1INGh8JKH8wbNb3sykwOlEHvlMYq
	qLH3iDMAH8Z3a8jNPOjVMq8FdyakDZhCZDi+UZh6Jm1FuVDMyhZ6cYhkhXKgMnyGcHPDI4mHYbKoU
	53NBPO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZ5-0000000HTwR-0Qj6;
	Tue, 12 May 2026 17:06:39 +0000
Received: from mail-westus3azon11011018.outbound.protection.outlook.com ([40.107.208.18] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqZ2-0000000HTuI-1Ipa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 17:06:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7bK0Aw/iTGEJzN457MFehP5oGy4rKFojBWjEisj10Kx0AGXrNP4+XGWU91KX5SZnTopbJc6k00dzy4t5fuWqBkf3zCFHNL9OIlAKgYMRloPhe95dT6bOoKU3MTwl3uvt4FISqcKUVTZtjX2qrqOZC0vzdvgylJddfTnDoDCb6TPVCWUNPq/s5y9h/Cs5Roj0+su3sbRv+kb58f2c3MDb/d7orFcchLsaygZ2g7IWcgaB5gjKhGChNSZsLTmhOO8/+XW98S+AwN3qwQzxq1HGPvsj/GCCQ+y+C/IRmmSieY+G6WDB2s3AKnhhgQEz+GHifCoM7Z0DPrnDX7hipf/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTE9sENCyrA+FQ3/aF1GiuwlmmKh+HsAjVQHsUOsWFo=;
 b=OTZByqY3fxvbIhIgJhgeYJW5kGJDfZlZqqPpdHO6IfPwpMLMXmcLHQ1Z+qoEsXNUZO0f64QnkYlMOyTdWNPvmM1KilJ6iPJGB4Jvy8EVqHLZBrKOeSUjLh6YKDt/OvyrOdfIQeWKEAVbdQc/tUVmj3TI9xVq+FSAGM93/mqGum7UnWY4cCHWl2Ip1rTox8tEAGImZicXPlxUnqlWVTRnSSFpsyI9G6JroDP+GWlVU7s60SK8URJxPAeA24X+U2rn58OE90L6YHB19gDVL1O+c3Zen8nNVaabsfISOEQLyTe/AZupMusEbK2VbVk/DfUkXFkDLYjgKy2VopIRmaFiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTE9sENCyrA+FQ3/aF1GiuwlmmKh+HsAjVQHsUOsWFo=;
 b=B9nmDYQJ7fZf4YEP5MfBEJSHg3DS0adfyr1gGwM1bHU3BZbHdIrC3LR0yVuNCohRdTxS3HbbX1+AIvrhfZOuQ1pNJpqt42abxTve0hbzzQhPNOBBZgSvt2lNsZU1z03/e5Y4/8sjdntpsZnq3G2OLRFM44L04clgav5r3uphC+Q=
Received: from PH7P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::21)
 by DS4PPF0316BCB78.namprd10.prod.outlook.com (2603:10b6:f:fc00::d04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 17:06:28 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:326:cafe::8) by PH7P220CA0029.outlook.office365.com
 (2603:10b6:510:326::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 17:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Tue, 12 May 2026 17:06:26 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:26 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 12:06:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 12:06:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64CH6PBc1887826;
	Tue, 12 May 2026 12:06:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <afd@ti.com>, Nishanth Menon <nm@ti.com>, <llvm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>
Subject: [PATCH V2 07/11] soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
Date: Tue, 12 May 2026 12:06:19 -0500
Message-ID: <20260512170623.3174416-8-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260512170623.3174416-1-nm@ti.com>
References: <20260512170623.3174416-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DS4PPF0316BCB78:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7f28fd-4c22-4221-54aa-08deb048cd6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: n4SWjYhobuS40c/4C0A4zM9Cuu9uIi7lQ1w7U68+38amtAmxZ+zGRS+Sr/ajpnoG/tv03g5aMX3hD2t1n68TftBApjDz2rK/UpYbj/14VSWI27e7LPrDUcXw2MJ7HXe1WcF55FrnU82smqrQQiq+xxOCx78XVmndvvAoeHlyuWVf6vaHAdc3ESY3jU7jecgXIbi0voUM8sTLMbqdvcIUx/JT3Pd/kB8ndfX3IYrXc6orALObxe+MmQhUuGeHTKIUTDH1qVZKYs9QeEQiHNYjaFHG0yzxWft87hcbbKsYBkOP4tKoe5j/F1zGO81SMt6z26f3lVfgKrZxs4LW5S7P0nqb3C4F5s44l6a/xeztBfyOMwNrkVTkDtn1uZf/fUN5GLUUWF2Aq951RKE4BXsHfAQnaY+HZ6/IUFif94d9vfZ0ERD3MVlE1vr9EmXFjyVYfZkbsurW59jWRhl8fln+/pbqmvuQ+w9v/Fzt2610rXjh4UagCflZn/w5p76w3nwYb8vpV5ld6pgfaZNgBkv9G65F8lngjPtVP+AyJIX0eLD5LnYOFaY4MmtuN+/bw7MIxqlCqOH+QhSUfx6zjoC92d+teoxYBIttwQGcsLoX1WdhUt5sCXlDvlyCphupCjGqVdF3c3lBzm01kyye6MRwEuDtX/Zrxi0Haa2eU6kw0a9pWDQuu/id/BrtWwMSDZGsTzkBKtp1BpyVVrWamTc/J7vwV1o+rq2StOKRc244+5M=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A0lVh85W8H7veW78vCvbm8lF7QedOTN6QBy1cX/DEdn3AR2atkV0UgyOaghErpHhXvZzQkageaK69sDJwBdGFsc4fSSYKzGfc63tgwuQNcWFR9hsQF3HBW8Yai3AdGtrafybPECyKz1L+C8p7hPfR+Dz2xZny8ioRZ57fqCvOrXDs5YGbPWAmd7Wsv7Gm3wyG/isvsdAp9gVXQDzmAt+sO/x7vV0xaH+kxGfK0Q5S8DPp2JP9pNbCabhQgsNID2u6fcs+1Tj7EsTppF4OZSA54+5IW4V58MjoJX+Y/AUc9NliHkMRHts56YBEzD0Vq2ncY+aFfN3hzU8m25aodxOLJdUV1PfbKXYDRqi1UqWIr15nqeO2tkozlIFzYOtUqnRcrlUqizCN4Y3/JrAGuH4iRKKqGNNaYMNSoj9Hz04oKcbcx9qIIVxPIVe2SSGzhML
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:06:26.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7f28fd-4c22-4221-54aa-08deb048cd6a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0316BCB78
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100636_352221_69AAA3BA 
X-CRM114-Status: GOOD (  10.91  )
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

Fix knav_init_acc_range() use of 'Return ...' instead of 'Return:'
kernel-doc comment, which produces a warning with W=2:

  knav_qmss_acc.c:473: No description found for return value of
  'knav_init_acc_range'

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
- Picked Randy's Tested and Acked.

V1: https://lore.kernel.org/all/20260508153211.3688277-8-nm@ti.com/

 drivers/soc/ti/knav_qmss_acc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/knav_qmss_acc.c b/drivers/soc/ti/knav_qmss_acc.c
index 269b4e75ae40..1f8b5acdd462 100644
--- a/drivers/soc/ti/knav_qmss_acc.c
+++ b/drivers/soc/ti/knav_qmss_acc.c
@@ -466,7 +466,7 @@ static const struct knav_range_ops knav_acc_range_ops = {
  * @node:		device node
  * @range:		qmms range information
  *
- * Return 0 on success or error
+ * Return: 0 on success, errno otherwise.
  */
 int knav_init_acc_range(struct knav_device *kdev,
 			struct device_node *node,
-- 
2.47.0


