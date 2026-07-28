Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E1C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eh7MNftgINCvlmmkupdUwszD+QohYPEjewZw5jxF5OU=; b=qFeegyNrx1Fj+D+PvdsPnK89Xr
	fTcQERbRFuk/4WUpY+Jen6z7f2Ydx3L1CC+HalIPCYFwzIgz6XWJVV1EMKYchWwK0iNlf88cCFJ/h
	uVHAjSJYs2+0bbRM50ZBAtze4zaiJDXzEtuVKmgJDg6Lgu7PI+OvhIV+xWUeNurF0dwy9J2E70n6i
	I0kg2cvbDdNSmGY0koK051MzyTEokL1sD+3O/R1tlWMNJ8SnSlad3rfHlkTllguZ0lyCyERho/h4E
	mf8bsd+I8Mmx6jfH/bkV2r0sm5qU9ocMdP0g0ODNyi2AK4WVKtX9iqA3ufyXAWvB8Zph6ueONiN4P
	N+aFwXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolhT-00000005y3C-00Iu;
	Tue, 28 Jul 2026 17:34:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolhN-00000005y0V-13Yv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jul 2026 17:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eh7MNftgINCvlmmkupdUwszD+QohYPEjewZw5jxF5OU=; b=MC1xdtaGtq/svm0IugsvpZ8GOB
	SUPRN4hk5DLvQJ9j0pnTatVTCtC2nQH6iZxwa8PD+2upvSwx5/0Hl/a1ThK3wxpEvxxizRnpnwLzu
	QWDu/QD0jHZartwPyjoX2wUIP/uQx3vPCkmX7GzBQh5rdgZA7mmMIvP3DCh4vP9IelErd0vzhG7k+
	FWLGM6uh5Fun44jELnPJUnfAGz/SVSFPTZEoPlNiDWxKuwGSPiiBa5H6vQ1wcjfmu5FL8HUwRkX5n
	l/bywpzkPN8EeQo7jdTudDE+g23yL8YWnBtUmvEkfVMbzS3paO9qbyUgxxq/izLUJR0VhMlL+Tz3C
	x+YFHE6g==;
Received: from mail-westus3azon11011031.outbound.protection.outlook.com ([40.107.208.31] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolhJ-000000059vg-0EZ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAcZiSttLcj26QccebuLNpTkYtL+CMifaG1pt8t4dBfDnfJq4oOE02fUSMLQeVkX6AVDoS/LOIVh201Urji29VhF7htlVwsw7oxDPEz+VO7BKgSyP7KOKBLHzwUc8Sgu6sKOpJzOiaWdYObVXiztshw3QOEJrPGwJ9wniTtJlNFTiIAwlzL175JMIVp+UwOx7OsINyQ/RkZ1QtMvhcP8EpkKyl0lelLIBZMyiFi/B1X8x6f4EqGK+PT+pGZeAPtxveKgch7kXXZdGBecjd4HjXmBIYCC30CDOUhQmN46an3o4Q7pXZgLAtbnnTPnp7ed+dZTTog5GcpYD7r2eMJzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh7MNftgINCvlmmkupdUwszD+QohYPEjewZw5jxF5OU=;
 b=kS6/8q+IEh3ry7AtvHyokkHAbZuKUFW25Tomf0UutrRywmW+g7nj54r1+sPq5lS+lFJrblBOXtMUa/GZjT0buk+HWeGtJe04hv33b+xlRjiegg+ZP0u/ECAANLnSsA/Rt+PrENwrAxEFEHvyXadQVygI4dIHBwketgwez63YPRGJ2NwWJC4QD3kff3ye5yLj6dPbqqjOFIaknjjpD5U704p4lx87RR6ab3U4w1YPWsYLGIZGXO1QNwe73b95mamdzk2HkBp7YG3MPZtYI9Sm26UdcFj3KprMloBL+bqL4WHYjlLlU2amGqzGRJWpseHVbrvB7p3321rPBbLne+Js+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eh7MNftgINCvlmmkupdUwszD+QohYPEjewZw5jxF5OU=;
 b=cpbXg6eMM9+kBlE1LzPQxGCYYrsDV9Tx1gnrwoHI1zFUCh3JzYLqUk/InJzIlUCbe+xoPEjdT7qql/YYKtuKmCsopdkuMPaVeJC3qaC3sL2uoGkH5XbKHAcNvds9N4xFgJvf80tTTMSb7VjouVX0iHmD02/xO+ONiUe2whQoO+ZsnZArnUIL9GnUW0CLeJ4iz30mPUqK7Yu4/fA+dR2j9HPpOpUDfK1ncInlo20sbPn4IamzVkhaVJA4ifiC4urBl1Ks5SfeHeGWQ3Nwqh9vuC8BO171hkVhSq12CTctVbHgSLHUbNZIgjW5FyravUnnOb8VZlP9Uk5FV6GLZLzKfg==
Received: from DS1P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:242::7) by
 PH7PR12MB7187.namprd12.prod.outlook.com (2603:10b6:510:203::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 17:34:11 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:242:cafe::a1) by DS1P221CA0017.outlook.office365.com
 (2603:10b6:8:242::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 17:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 17:34:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 10:33:49 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 10:33:48 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Jul 2026 10:33:47 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
CC: Robin Murphy <robin.murphy@arm.com>, <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Pranjal Shrivastava
	<praan@google.com>
Subject: [PATCH v5 3/6] iommufd: Iterate the cache invalidation array in the core
Date: Tue, 28 Jul 2026 10:33:35 -0700
Message-ID: <2891142326df5fbd7f2e4cac23eb2d894f8fc84c.1785258826.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785258826.git.nicolinc@nvidia.com>
References: <cover.1785258826.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|PH7PR12MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: c97624c1-1286-417a-6aae-08deecce6f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|23010399003|376014|1800799024|36860700016|6133799003|10067099003|18002099003|22082099003|5023799004|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: WPlBC6pQMfK9K1Nt6gbK0k2oIGC8KQ8gBx7ngmZFUHE3cADFJHC9dgUzxrpz2IX14t2vMXtvbsqwxjs/2DZJ+KOIe4sWmt/8TS4XlCiUBQeL2/m5qXrbSNE/gfZU4QrHSl+ncutcJZWlClSTzsXCToPHoxR/3Stk5JZOB+v2MmUpR6PPGc2xWLQb3oBv602PSQYy+LhXXXBoGei8ZE2cbIjc8LX6Z6i5hoPSWz42kMcheBuGF2qiuV7+81xw4J9Gb2aEMu60APoxaBbh8qZjZaGYepi1g+v3ySOtPrU07TEB/3rkGJRKOuoyxBFsqhrYWDRewIuHmQWQmCay8MjS3lLK9n/cMrYO77tZ/23m85/hUxCqMtDQZ1sl+NIRQx4OzhfrWfVsJgcBFfyDqm5mFvo3PSL6YH2zMHA1tuj2WU6zQdlro6d4SKnexZFaO7dv1TC341TM6Cx/aMoCO5/N6RvpE/01YTz4HnHe5Nw89YPw5WPNpyj0LPF3a1RBr2vBXpFxASEyNY8Rx3VXpMeyqHcX8LArUmjZnftvlZrZPihtOF8nZ/0o5TLR3wa1MBKfRwYVOba3b+YjoGOJtUudbowB7uSbrBZ9NXb8J9JWbFdI5QRrfpsNdrN0KGk4LCjJxUspjmQzx27zNPZrUZ42jypGFXzrXrZEF/Il1VJVwO47KYKWVbnSrwUjYxv+HJBrAypMPz0CPgKcYPww9GJyAg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(23010399003)(376014)(1800799024)(36860700016)(6133799003)(10067099003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SozZ1PZJGtfUMxKAankMYo/b2GlsRTEdkUc362KrxSXVNBYJsybgQsW2AbLF7+Lx2C7Bmu1x7QVswFnXxeYUPE/cvOTatqA7543CStvpsFyD+y9yg2IYvieAr3u3Cy2fVVygEiun0mAz5i1iZqOhnWB3pqr1Az0woc9Q3ap6mENsg+9KzMYcH4jfAcAtXwB6ZHkMljnsq/0qOdTaUDidUT++pf09iYRW24Mmd0cjrKOgqXGZD0462jrp30QfRBzdkMNlviY00M8vVAFYqFoJTupIOavn2hihD9KaEGp8S7g3glOl0KJd9QeJES2ZjBREH24nvuXUmu8NtwlR5Gj2NnPGojaRA/QyJRr79eptk2Py7m7oL892OL0b0vEcBZbZsNt0g0C49QEfeIbcARL8vnB/+/GECESaNYqKoiwRV1kYmqkY0dOy7Qg5bsYZQN3N
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 17:34:10.5368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c97624c1-1286-417a-6aae-08deecce6f39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_183433_214790_AFFB7025 
X-CRM114-Status: GOOD (  19.98  )
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

The cache invalidation ops, cache_invalidate_user() for a nested HWPT and
the cache_invalidate() for a vIOMMU, are each handed the full user request
array and report how many of the array entries they handled by setting the
array->entry_num. Every driver therefore implements its own loop over the
array, and a driver wanting to process that array in fixed-size chunks
(e.g. to issue commands out of a fixed-size on-stack buffer) has to carry
the loop and its sub-array bookkeeping all on its own.

Move the iteration into the iommufd core instead. Invoke the op with a
sub-array that starts at the first not-yet-handled entry, let it handle a
prefix of that sub-array and report the count via array->entry_num, then
advance the base pointer and re-invoke the op until the entire array has
been consumed or until the op returns an error along the way.

A driver that handles the entire window in one single call, as all of the
current drivers happen to do, finishes the loop in just one pass, so this
does not change any of the existing behavior. It instead lets each of the
drivers convert to bounded chunk processing on its own, done by each of the
subsequent changes.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 include/linux/iommu.h                |  6 ++++--
 include/linux/iommufd.h              |  2 ++
 drivers/iommu/iommufd/hw_pagetable.c | 25 +++++++++++++++----------
 3 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d20aa6f6863ab..969758f87e445 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -773,8 +773,10 @@ struct iommu_ops {
  *                         passes in the cache invalidation requests, in form
  *                         of a driver data structure. The driver must update
  *                         array->entry_num to report the number of handled
- *                         invalidation requests. The driver data structure
- *                         must be defined in include/uapi/linux/iommufd.h
+ *                         invalidation requests. A driver may handle fewer than
+ *                         the requested, in which case the core re-invokes the
+ *                         op for the remainder. The driver data structure must
+ *                         be defined in include/uapi/linux/iommufd.h
  * @iova_to_phys: translate iova to physical address
  * @enforce_cache_coherency: Prevent any kind of DMA from bypassing IOMMU_CACHE,
  *                           including no-snoop TLPs on PCIe or other platform
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index 6e7efe83bc5d8..3087f5b2def84 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -154,6 +154,8 @@ struct iommufd_hw_queue {
  *                    The @array passes in the cache invalidation requests, in
  *                    form of a driver data structure. A driver must update the
  *                    array->entry_num to report the number of handled requests.
+ *                    A driver may handle fewer than the requested entry_num, in
+ *                    which case the core re-invokes the op for the remainder.
  *                    The data structure of the array entry must be defined in
  *                    include/uapi/linux/iommufd.h
  * @vdevice_size: Size of the driver-defined vDEVICE structure per this vIOMMU
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 623cc608ca0cd..644daf18849f4 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -501,6 +501,8 @@ int iommufd_hwpt_invalidate(struct iommufd_ucmd *ucmd)
 		.entry_len = cmd->entry_len,
 		.entry_num = cmd->entry_num,
 	};
+	struct iommufd_hw_pagetable *hwpt = NULL;
+	struct iommufd_viommu *viommu = NULL;
 	struct iommufd_object *pt_obj;
 	u32 done_num = 0;
 	int rc;
@@ -527,31 +529,34 @@ int iommufd_hwpt_invalidate(struct iommufd_ucmd *ucmd)
 		goto out;
 	}
 	if (pt_obj->type == IOMMUFD_OBJ_HWPT_NESTED) {
-		struct iommufd_hw_pagetable *hwpt =
-			container_of(pt_obj, struct iommufd_hw_pagetable, obj);
-
+		hwpt = container_of(pt_obj, struct iommufd_hw_pagetable, obj);
 		if (!hwpt->domain->ops ||
 		    !hwpt->domain->ops->cache_invalidate_user) {
 			rc = -EOPNOTSUPP;
 			goto out_put_pt;
 		}
-		rc = hwpt->domain->ops->cache_invalidate_user(hwpt->domain,
-							      &data_array);
 	} else if (pt_obj->type == IOMMUFD_OBJ_VIOMMU) {
-		struct iommufd_viommu *viommu =
-			container_of(pt_obj, struct iommufd_viommu, obj);
-
+		viommu = container_of(pt_obj, struct iommufd_viommu, obj);
 		if (!viommu->ops || !viommu->ops->cache_invalidate) {
 			rc = -EOPNOTSUPP;
 			goto out_put_pt;
 		}
-		rc = viommu->ops->cache_invalidate(viommu, &data_array);
 	} else {
 		rc = -EINVAL;
 		goto out_put_pt;
 	}
 
-	done_num = data_array.entry_num;
+	do {
+		if (viommu)
+			rc = viommu->ops->cache_invalidate(viommu, &data_array);
+		else
+			rc = hwpt->domain->ops->cache_invalidate_user(
+				hwpt->domain, &data_array);
+
+		done_num += data_array.entry_num;
+		data_array.uptr += data_array.entry_num * data_array.entry_len;
+		data_array.entry_num = cmd->entry_num - done_num;
+	} while (!rc && done_num != cmd->entry_num);
 
 out_put_pt:
 	iommufd_put_object(ucmd->ictx, pt_obj);
-- 
2.43.0


