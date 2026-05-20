Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E587ECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 17:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjCFc/eOsYiHP6CGzZnlON/0G1ap8/Lr1L58erICpPs=; b=okJkXYqn8meVwQw79cRr2Vtn+4
	Zk0zzGuB5SCakVQ/lJ69sBotW42Stih87z2eBHCjpyYi/4YnrYu7hyF5vFUJKg8mjoKl5pnBIGFLG
	4h4tV3Qyal/WL4YHbVha+Y6cU56Tk0/q9RrR9By3uYVRYR967Znr1uvSQlOcMFur8pS0g4sl4SA9o
	BzMNWkTsSAlDpYB9v0MHvK9qaKsKgwZ5n3eqKi1qnUsroGlkZQPQ1s2Un/MkVj0I0O3ZIqVQAJUGV
	GgjUmxJS3JGjU/C31gt0dt1a4ZP5UwYg+4LIjiIEeifhBjMoT3SKaWRnObE15LycCJtYZey40RtF4
	sqLFfECg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLG-00000005FJa-3Tcd;
	Wed, 20 May 2026 17:04:22 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPkLD-00000005FFw-0JeS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 17:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g58L/tcAJHTgfViUi+LzBtEO+jkWkF2LHShtNY4mrBKxRgcmSqVzD0KKF+E5yeF5tTdkf7ro3zqiS8RytMmjPnOAZtalQjeAqn7vzfC84ZOdZf16qN+cBIZ8O4l2pUb5JSpoQvsUwaodfrkCVRUtLO0F8SF+ygrIbNBTR+adGpVG2oqYVtE2KzyCT1LwyI05waCCE6eYwjUbYVPrgc9yA3qhNfubcP7R+lROzVH/e/2f9N904FvbOIpgd/ACsGRmq94hUO6o2oVzJWpFBRfJJwvrLGWqKIlyURXrqQz0rJ0nyjFB5bDy+GoKgttHhbTEZH0iCh2wj7XXXuyusO4tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjCFc/eOsYiHP6CGzZnlON/0G1ap8/Lr1L58erICpPs=;
 b=Jehb0QnTTH5pK05bgAMCGwhCC9ppnWEKjwfz/paRJfcESvCIbYP8Am5XR2XHJSD9Dn7kVL0VZ3+2wE4vAneOTrFXdebA0Wj05jtUCWEc0LYNw+YxvIKir9FXHJC7lyTOhxc0l2nw3yZ+Fz5aFRp4A1NsSkIJqHWHDqdY7cD3wB9+s3ZG1NEEyqo7YPlsSKAeYZKrsMuAJRAItPXg5BKDrRFUZtIFHqquiff2YPfnwNxQ3+7xlrl1e82K06gRTgaKLXZC3L5DAluJpHOTIB7Y3fDBBTyixrbVdhph5NJ6D6Wn67euEZAR/x2ytzVczfcHBZbetVBFIhQ3puD5DfDm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjCFc/eOsYiHP6CGzZnlON/0G1ap8/Lr1L58erICpPs=;
 b=ULgD6hg2+IiWiJDE5nZmXANU/OHyS98rzWAUW03Ygt8QEAv8KNuhxxvQXNl7zegCsck4ogZGK+l+6hSZrvttzwrq9FmIGXoG6uutJEE7QxuNl7cvBB7uGvJEJP+Q7Gg6uDJ8sOE+UxQfEOkMgjkMF+QZPECmT6JrLZxIIaKnHVwop1XdRwwde7uq0yxkq9LvL8BFqf463pqPsR5KN85mosQGa0Nw50nKUIeR2/tMQi380lwvWS0ZofTCr5C3eQoyjO1Fzt8KYM6dAYz4nPu90/4UjCwhe8ojSGjpKRQcjE4gYOyfO9LN/IGByql9pSFekzOW0RV60lU6ywroT6utHA==
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by DS0PR12MB9324.namprd12.prod.outlook.com (2603:10b6:8:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 17:04:08 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::e2) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 17:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 17:04:08 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 20 May
 2026 10:03:47 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 20 May 2026 10:03:47 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 20 May 2026 10:03:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: [PATCH rc v6 4/7] iommu/arm-smmu-v3: Skip EVTQ/PRIQ setup in kdump kernel
Date: Wed, 20 May 2026 10:03:21 -0700
Message-ID: <1280ac4fdb37f998fd6dcb2bf8f4437283279395.1779265413.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779265413.git.nicolinc@nvidia.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DS0PR12MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 54abf67c-08f9-4864-51cf-08deb691ce94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700016|18002099003|22082099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: BbZoYjoFnrLPOCxdRvndrEn5jrH5ooCnpFTTmMsqhAGdiQ9VvqqbN63lkIx8F4eIu/GSHZhccJRfTnXb8Hk3b7I0TxzA3aQR+FoASA/xVLh59ut8CFOYnd/ncO8zvahNQfxsIlXw1tUjPHHUR7esfs/fThUxQBb3HCfjF3os0HIQ8zXbDdrQCeiWg9PQQAt/CWwDbBlFGjHdSv+ujf/Dzppxl4BRHSIy6yVT+fqgAeeICCzZZwhonx90v0KSbXixOAw0y4it8eu7jF2JBqsnx4Hw6VpGQ1MLQOad6/qw8m/BfWA9KG5lUqGOW5i5msKH34fleOMyqmm/qUVPcjiF6kJXY2oF1GY8YREZF86e9EYnt4KhWjI8pJzXLnUqGdgpkOg7N6/JP1j4/wZNhWl1hzyzsGYRaxkuIO3tfYxxPhZAoo8Gu3hGhJ4JhV3VYTEJfUUNps4s/CDQFmXex1fQvNR2bjQrPQjdgMIup/31Q53JJOQib4hbushRODCCS5WpuqaX+cZLnAd+JRRsGZmB3piSnTSB3LribGV5v2g++oOMpOE71NazQrSwS6i5+S46m+AKA99FIkC1vUNlGCpdA+7Q3q8VMdAtczH8Eou3IoxFZdbVO0LuiD3SOS/2wGZ+73F9/8ZlVn+qyFfz+nnMZA/hWFx/+R79rnVr0WyKEwYM/LC8m+fFMpGyxxTbU1rEkrBlIcFfdkxru1xlNcqCsceO1+qgZo/E/GOwz7MxuRc=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nbjWK6XJTUmMrl9xLgbNsW1ypXi7OU/3ZZC0Wj+I0gk/t2tDonmwYj9bD02W4q0H5v1rA9u7TZG6kXGLv3Alb3omNEB3YEyrKEBKtu7I7cKV802JsUXA/K0CMu94IsNYqOVq0ssf+5B3OraHexG2u0ShZb8g8uZShw8Dq1otEwA/MJPVT0Xxefo5Z+gB8W9zEiuacJbv9zqKxt0ha17jIY8Uajy3sSQ8FvHYFq3d44ACFuPnkVm4akZFsmfhDBQPP45H/rK3aZjavyIJEA7aMDEwbgV5R00cGdwMmHHDiHqQBk4eCrjhgwKdzwkFrrAgGMhVD2Q37ZDI8y9GnFqEa4cjE31629CQ7nqZXWYWScjLZV2clURzX3S/+DYA0a0forK/0lp+AIiFQUQinYRjlj1Y1aV3uG50+JdgrfXwO1RmU8Xe4hyKNFPrIX7SaT3U
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:04:08.5211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54abf67c-08f9-4864-51cf-08deb691ce94
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_100419_931021_ECCFBD69 
X-CRM114-Status: GOOD (  12.94  )
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

In kdump cases, the crashed kernel's CDs and page tables can be corrupted,
which could trigger event spamming. Also, we cannot serve page requests.

Skip the EVTQ/PRIQ setup entirely rather than enabling then disabling them.

Also add some inline comments explaining that.

Fixes: b63b3439b856 ("iommu/arm-smmu-v3: Abort all transactions if SMMU is enabled in kdump kernel")
Cc: stable@vger.kernel.org # v6.12+
Suggested-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 43 +++++++++++++--------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e00b28e36f9c4..3f22949391c82 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5161,21 +5161,35 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	cmd.opcode = CMDQ_OP_TLBI_NSNH_ALL;
 	arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
 
-	/* Event queue */
-	writeq_relaxed(smmu->evtq.q.q_base, smmu->base + ARM_SMMU_EVTQ_BASE);
-	writel_relaxed(smmu->evtq.q.llq.prod, smmu->page1 + ARM_SMMU_EVTQ_PROD);
-	writel_relaxed(smmu->evtq.q.llq.cons, smmu->page1 + ARM_SMMU_EVTQ_CONS);
-
-	enables |= CR0_EVTQEN;
-	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
-				      ARM_SMMU_CR0ACK);
-	if (ret) {
-		dev_err(smmu->dev, "failed to enable event queue\n");
-		return ret;
+	/*
+	 * Event queue
+	 *
+	 * Do not enable in a kdump case, as the crashed kernel's CDs and page
+	 * tables might be corrupted, triggering event spamming.
+	 */
+	if (!is_kdump_kernel()) {
+		writeq_relaxed(smmu->evtq.q.q_base,
+			       smmu->base + ARM_SMMU_EVTQ_BASE);
+		writel_relaxed(smmu->evtq.q.llq.prod,
+			       smmu->page1 + ARM_SMMU_EVTQ_PROD);
+		writel_relaxed(smmu->evtq.q.llq.cons,
+			       smmu->page1 + ARM_SMMU_EVTQ_CONS);
+
+		enables |= CR0_EVTQEN;
+		ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
+					      ARM_SMMU_CR0ACK);
+		if (ret) {
+			dev_err(smmu->dev, "failed to enable event queue\n");
+			return ret;
+		}
 	}
 
-	/* PRI queue */
-	if (smmu->features & ARM_SMMU_FEAT_PRI) {
+	/*
+	 * PRI queue
+	 *
+	 * Do not enable in a kdump case, as we cannot serve page requests.
+	 */
+	if (!is_kdump_kernel() && (smmu->features & ARM_SMMU_FEAT_PRI)) {
 		writeq_relaxed(smmu->priq.q.q_base,
 			       smmu->base + ARM_SMMU_PRIQ_BASE);
 		writel_relaxed(smmu->priq.q.llq.prod,
@@ -5208,9 +5222,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		return ret;
 	}
 
-	if (is_kdump_kernel())
-		enables &= ~(CR0_EVTQEN | CR0_PRIQEN);
-
 	/* Enable the SMMU interface */
 	enables |= CR0_SMMUEN;
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
-- 
2.43.0


