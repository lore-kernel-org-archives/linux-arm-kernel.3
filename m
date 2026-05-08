Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F475CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WR7sVFz7wcSJyHRRMEky8mBk9xvmVoc0G8AZswQt50s=; b=EjM9eXf+uuDPKqDU7DdzJ+FWBT
	fbpRTFlexFA14EEvB+X7lGr6QOvDbfXmhNvNnztXQu1a444OL7Piudk0GSDkJ1H6FatD5JT/4ktOn
	MEzbKcqrzH8WMt8bDJo1lTLCzJPce5t6oLz5wbL4+Abcg1uy3UKAPjWbZ8kk8vGIPBq0/81M41eLt
	5GRA9vVtVWvzjPVG6r4VZNqbjkbReLiyMRH3k38bCrsPtE15pETK4obMRLijOj61BrYyuJ62gBpNn
	dEekR1PtvPo77+47XGCKJ6j7bqvEJWNYQs9Rdn6fv7DoXa6w4ujMWzhE6o2Svr2j8M11pRGLXAYSk
	RZ/F4Vww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCF-00000006qZB-0Q77;
	Fri, 08 May 2026 15:32:59 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCA-00000006qTd-43uW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:32:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBfj75qrDfSLPc/hGeKE1ohb3airz9Y4LU57QuO/XQwLnYFmKNgFCCAYuSLX8rhk2FVH8O2G1Gzsq8UOHXchCcCVXNKUgWSDYDACP9w9sm/iwiZG4zlEsfHSpLm6WCmqMZ699Oy7as95h8TbFuibLhgSPqMRnESK2BZ/TzorqfsYTekiArDoZrEuZeM0Js/+DmbM6EniY6RVRrk5gzLLdieSBSohquYwUkmwwPxXJYVq/KS+kBVg/ZAyI75K1UvaK2EL1bdTDZFyCzCa+U7FSFXW/5Psi3THjObY8UjNtftrt4H/JmczIXD8QPo4QY6+q18BUdxlvReZ1UXQKMVhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR7sVFz7wcSJyHRRMEky8mBk9xvmVoc0G8AZswQt50s=;
 b=pUo0FpRTtvpic6r6Ih57YHwbMvRsx3WDZS9bI36Cmal5bVgOujcXqkw8+gqoL5e+4WMJgIHh9/ZVZICD1mUC3orIwnvRlRqfJGeE8T7FcJw/qZ9/z275XxPNGhrNsI4GK9aBbqykS+hHhjUIvcKTUk+i6MXFbNIz/2nJP7oGJjz9Z7cn3hBXSIayuNKsD+4JKm4/HnzGWsM/55DLBWhAmx0L9R6s/vRoymNkQhXmZwLVISNzDotDpioUKq1XQDxHPMqoWMbPQX5FJ1WErVFQ58aW5T37YipWwIeBfkuao1xmUPecYvqZjcgASEruSKSl3d/dl/djBBoIo3tDoT6u+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WR7sVFz7wcSJyHRRMEky8mBk9xvmVoc0G8AZswQt50s=;
 b=twKtc2r3yfRaA1IqKiO5LHtIhUEtbwj5MVxuZthOQ0WOyb3bBq13G4lN2t+90qXPWEbA1+cVbOolB+Sy+wlMQMVPGJ8bWSlptzW1LXznsOcaHafFNi0FIXRW/+eVahADgcZAsOPWIRjPKE4N4Ho61GmIZK3jV3rIH2ny+29oZKA=
Received: from CY5PR13CA0030.namprd13.prod.outlook.com (2603:10b6:930::18) by
 IA3PR10MB8539.namprd10.prod.outlook.com (2603:10b6:208:580::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Fri, 8 May
 2026 15:32:44 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:930:0:cafe::76) by CY5PR13CA0030.outlook.office365.com
 (2603:10b6:930::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.12 via Frontend Transport; Fri, 8
 May 2026 15:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 15:32:42 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 10:32:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 10:32:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648FWEwF1647264;
	Fri, 8 May 2026 10:32:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Nishanth Menon
	<nm@ti.com>
CC: <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 01/11] soc: ti: knav_qmss: Remove remaining redundant ENOMEM printks
Date: Fri, 8 May 2026 10:32:01 -0500
Message-ID: <20260508153211.3688277-2-nm@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260508153211.3688277-1-nm@ti.com>
References: <20260508153211.3688277-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA3PR10MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b24a8ce-fcf6-4ce3-da93-08dead170bd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: kpTq1wK+jjxEkxFzgNEwFs/amjODtjj4PAcyTDdrctRLVMdqxxknoHWK8Xmnq8TTVDEa9IfK14ut2f+zbbqH8VHuRFe2QOvhbMkOaLO++Jca2f92NVeG1iSTWKYD51H1mjcmBRPku1inqKkRXLQotxq4XBrs2OF+ZgCTPACM7mWnqme5y1DuP8DbbIzmZd8DqQNf8T1dlFFh+imKn+uK+eqjt4QyxEutz6hRICZ+pzYhtWWnBIXoAhydNJnokXdDmN00RvIKm5K7vst0jKlvcJgHFk/4pM4+yhTpfEHvtb7CGQ8A2yWg2U3EAHwq2RiIIgIX4QGrtaCDrtdZTpL7u/xJL55YoWA0WgsW4wZkjqfTuBYutyIiR8LrpJN7Ddia7Fz71KcoLOwuteXQkGzWWsdqPOLBF/wVi8tebdwBhjhG7Obt8T0zqWs+6n2JPijzwFh3G8EgcTlt76mgWbD22QWAfpgL8B1pWVp41TYWls8e2MbgvLOnjBkF6pY9z62VLzKNjE7XUhiCm5MRLCMbMLUJgtio2Wq6i4yavXv9gCkN/+eOPzg+eixOiukYSB9u+Q8QUoktiAx4kRtsOscukmARYDOZaULsVTmpSnyG8eexquPomAMKcbzORauFb7esM9lEqU/ZsST2/DY1xff/dj7WeyuOzBDN0GfQw6RbLymWQFz4sjmvQkQ+8n7KEGYz5Yq8yeWgQT8R8t/y1Mqjs6R/4cx0TEbsgDQcHcwswU4=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0TkGafpfY7Zc0yNk5GUtK0Voyi/behLp1kBj2GS7zM8P5oveezGDL1499lzyUQ6Qhtnad7Ap1kyfY56bAqdnVpfEU/p19b6gliGOb+ny3C/jlmkNTcq0HyIS3YVgJtG9KDXJfjX1Q0kVgiQHfmHEQZMaRyKIEL8w0mu30LyWh1yAIxg78fJ+bHzNefv5nMANFEkkexniKG0y06GaH/QoqvbotmX3CcRANjHkEHKCwFn3kB+80+CkC0zL0fNMZVrQ64vzneJUaYpKdtV6iwzsA6uzXkrcxvBYrTO778DPATHknf6k8zhBvBMp0ADprFVmW85jD9FqUKtdSLKPXIamYoIdS7U2FkTRp4MUvY2Xz4nNrWmNM1Gora46eZbReGClsEFvIgzZOs53k+Xb/nCUeY6/INNjlFw1cMzi6QfzlYfNr5TT6Abafb9JzBLNrpRZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:32:42.6434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b24a8ce-fcf6-4ce3-da93-08dead170bd2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8539
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083255_011465_27D79CD9 
X-CRM114-Status: GOOD (  10.54  )
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

Commit 168d2fb78055 ("soc: ti: knav_qmss: Remove ENOMEM printks")
removed redundant dev_err() calls after allocation failures in
knav_queue_setup_regions, knav_queue_init_qmgrs and
knav_queue_init_pdsps, but missed three further instances in
knav_pool_create, knav_queue_setup_region and knav_setup_queue_range.

Remove the missed instances.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

 drivers/soc/ti/knav_qmss_queue.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 86d7a9c9ae01..e87a42734f25 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -769,10 +769,8 @@ void *knav_pool_create(const char *name,
 		return ERR_PTR(-ENODEV);
 
 	pool = devm_kzalloc(kdev->dev, sizeof(*pool), GFP_KERNEL);
-	if (!pool) {
-		dev_err(kdev->dev, "out of memory allocating pool\n");
+	if (!pool)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	for_each_region(kdev, reg_itr) {
 		if (reg_itr->id != region_id)
@@ -1025,10 +1023,8 @@ static void knav_queue_setup_region(struct knav_device *kdev,
 	region->dma_end = region->dma_start + size;
 
 	pool = devm_kzalloc(kdev->dev, sizeof(*pool), GFP_KERNEL);
-	if (!pool) {
-		dev_err(kdev->dev, "out of memory allocating dummy pool\n");
+	if (!pool)
 		goto fail;
-	}
 	pool->num_desc = 0;
 	pool->region_offset = region->num_desc;
 	list_add(&pool->region_inst, &region->pools);
@@ -1211,10 +1207,8 @@ static int knav_setup_queue_range(struct knav_device *kdev,
 	int ret, i;
 
 	range = devm_kzalloc(dev, sizeof(*range), GFP_KERNEL);
-	if (!range) {
-		dev_err(dev, "out of memory allocating range\n");
+	if (!range)
 		return -ENOMEM;
-	}
 
 	range->kdev = kdev;
 	range->name = knav_queue_find_name(node);
-- 
2.47.0


