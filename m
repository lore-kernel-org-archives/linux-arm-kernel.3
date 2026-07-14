Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A85C4450E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MA+7HpBscRRKuEVDeL83ihJ4j9C5ymr5oo+IEq87FX8=; b=VbX8mPwLD60dsslY2ERWZUNvUg
	QKAKRtUJMJOsKLGh8hzvCw1sCuk7TB/nFw2U5Ve+WFjSPXUFWHUiVtNFDhr77TaVcaNzYbEp2yDsd
	cDeVM6BKeFk9J5KV8MvkPuvF0HiJf+hPujSASzOhspunmYR5pWXtyy56VrcgL50vcEE8RUmoghOII
	ALOPS/I8kGnOaehe3S+bop9sT5YK7E64g5gCEMRBtf1GRPTnXlgYQpp0MEhQso3MCdMpT+rn3Xt0c
	HLJ9I+DXiKDnhAVJk/e2YpBntrsFsTjgGvbkQGM+cc6dKL2tX0CVh7ACXNowhEqWTn7dzAeCvGDMe
	NsLMUfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAU-0000000DH6O-0JFw;
	Tue, 14 Jul 2026 20:55:54 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAM-0000000DGzp-47qj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adeCSR9mIwKdeejRzMF0YepAIM5BS8IlRd2Sz6WkSYRDw3Bovn/zTN2EEF/5UT29NCXJSuycLjv9T+K7iYxkoDApfo688QdoRaUXuC/nYXqCU0A82Uc3VeP8TpqXOhZfvoupyS+6JK0Wqx3Z+RNbVAedLvQJeSjzcTmN/B8IFFTAFvGvzSPpLro4DfLb6h62Xz4cSVDeqyfrWm39NWjtuQTzpP5b5qG6Pk5BjBweBMkY86D/H3yL6GJ52fAgwG45yTSLwX9Yia4t09LtXm/1qoMVN2BqE1JomCmOrqwH+avyZpX/WldWNGj/30iNq93H3EPRPsPWhcaIiM21jdXVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA+7HpBscRRKuEVDeL83ihJ4j9C5ymr5oo+IEq87FX8=;
 b=r++cTK2MlMXP3wY2sXCiSlnrTtTUEV8gLCJ7hwe6XUoTJzGpxgFvGlD9zgh/3xPJF153M95P6jx158DfTzTd8pKqFqzFkMPymE18kgBV05TCK7ypvMysV9lBJGWtYiqpoje1cvdFmZcr/pwNK86ka/xqARnI9+JClnHl9rkcy3Qt7s+46HQF5u2msRzAanQlWSdw8AcQHX1tOrpLW0hCRys+sZvuGO4H+HrTBQemMrb5oi9XQyQ6BlPl5F8HYgqqru5jyatNi5/CN/SH6Tze31lumVULk6CLHJsDI4sywmgxQN1tp1yBgBo4Ljp2JHXJYEdimHiojdr7PrAEmR8uWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MA+7HpBscRRKuEVDeL83ihJ4j9C5ymr5oo+IEq87FX8=;
 b=oFj3IyLL7h2p8mwJivcCh4m88gRG7QcB4mea+Q9CVp6jo4MFPeB7feCJa+lZWSJLYwnOZtZuX/p8+UisXqE1KslDAiAFE1VdKi9odctfLN9kR8XO+hitgGOtRv9ggJfU/ywgQ3PGBxmX4DvmWt0tT09EHvE9E11P8Zg28OCglep7f2Blgf8Bh5kXQ0+5Jh2W3V/KwZF30pSHH9Y2hR3k+4WWQX9xMZ8xYpP5SfHIJENhiZIF7sUTcQVhBnBSKz7gyuehRCDnhpfVgpbR2e+etWYskyafPOuace/OfFLrO8VpoXx3Z1FjmjcAG+8EjHiK/0x/2b+5OeSF0nHWCbC11Q==
Received: from PH8PR22CA0004.namprd22.prod.outlook.com (2603:10b6:510:2d1::19)
 by CH3PR12MB8185.namprd12.prod.outlook.com (2603:10b6:610:123::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Tue, 14 Jul
 2026 20:55:29 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::91) by PH8PR22CA0004.outlook.office365.com
 (2603:10b6:510:2d1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 20:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:55:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 14 Jul
 2026 13:55:12 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 13:55:11 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 13:55:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/11] iommu/tegra241-cmdqv: Publish an LVCMDQ only after it is fully initialized
Date: Tue, 14 Jul 2026 13:54:58 -0700
Message-ID: <3e0d9156cd7ade5a5ee0b9a63a326dc324866ddf.1784059577.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH3PR12MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d9905a-148c-46da-6c7e-08dee1ea3c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: pQgy24PFosIG1ojQb0yip7aNWxYVxSZnvq5rivkLcztuYJOQFY+x+PedSF9lqNKUvJnoyy1QpeSb6+2CoLJM5s8RNFlz0IBr+qjBdWmJKCTceJTeYnet1/NEjaY6VXlvyJ9+iY/XdFlHKyZdEnhPK6eMqQ8ApbbK+MqBMpaYdtsYYRJlIuglt4D7YsrUc/43EHGpQDigZStjR2v/Ev+9nsm8nZPNPuSWmAAbGu6TxhntBT+jWNocibgg8Kq/o11EHUVy09BBWcjCwJ28M5GllDVkXRv5Iy2eqaOHH4kp42yGJBW//zAPKZ/GSJjWAHMLKBbdjWwLI6bZpm1NNY4i2uelggGiB+dz5sbPiQzjbFXN/Jh4MRrrfl0wVLvpik0lYW8VVRp4UmkGeKajVtiWcN6KT023zenr4fRUn78XOKc2TxVNqUqxotN8eeqrLOg0gu9J1LKKK20qh3LkqM72w/DQB9xAECbq6MBuIT0VvTUfg+k/ZPsR3G8lP+CYP3ThL1SCdS9vYk8UTWbVQ5hfWLMI+zimw6dXQJ5bLrCw/cfGROVWJ4TvoyFLxQUBOShQbM6jKMlQ8UlY5Ms9xci8FlGdwJn/lCMUtWYwEhgARFqrHbcUjUgM7/sLx0ICx+olIMVZJp3Od+bXVYtrXr9mQkVI9L3dPYR5Gz/4mos1tgRXhsnCAzymVnz4Vr4WEGxfxr/vElIOswAP/qZVmkSPCQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gtyiXWAUe8C5z0YdQ1t/ZYPY0qfDU4WhK5B65lJMCgatwRWqkaTDZSnQS9zA/r2fGZbfCkG73QCpeCoCWT2DPXwjQQ7vidmuw5MLJ+t1OekV0mPQ+moza6BZbXAEulu9Isqv0wvFCzNVlbmXkP3kEjn93ddnRRBdmtB2QcZehexKImBwi+x/0BTQ4HcdOxmt6upa9OFOkJBINM4r144RPjPBIpjYfaYztuafg6IXxY1eq5Ht7k6njO8QdhKIhe8RwyeA7kDjfAcpYzHpXg7axTVFnQgFnvxX94P3riOWPMHx+ditJJqKbWYH2AfgQrxURG8X40/Wldwf7sQ9rlVPnO3v2ms/hnB5vdww3HUy6F0fYu1sRUlly8AmrSgSsvgddXlrI5m3Q6e1XE/aElFeyDnIGrB1/eL9QKzaHk9Sqws+xJ/OI1yQk4adHDAZrjag
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:55:28.1709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d9905a-148c-46da-6c7e-08dee1ea3c44
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135547_054920_202000C0 
X-CRM114-Status: GOOD (  14.28  )
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

tegra241_vintf_init_lvcmdq() stores the freshly allocated vcmdq pointer to
the vintf->lvcmdqs[] array, before tegra241_vcmdq_alloc_smmu_cmdq() builds
the vcmdq->cmdq. The error ISR dereferences that cmdq, so a latched LVCMDQ
error (e.g. one inherited across a kexec) firing in this window would make
tegra241_vintf0_handle_error() pass the still-zeroed arm_smmu_cmdq down to
__arm_smmu_cmdq_skip_err(), dereferencing NULL queue register pointers.

Drop the store from tegra241_vintf_init_lvcmdq() and publish the vcmdq at
the end of the allocation instead, with an smp_store_release() that pairs
with an smp_load_acquire() in the ISR, which can see a fully built LVCMDQ
or NULL.

The user-owned LVCMDQ allocation moves accordingly, publishing the vcmdq
once tegra241_vcmdq_hw_init_user() succeeds, using a plain store since a
user VINTF's lvcmdqs[] has no lockless reader -- the error ISR only walks
the VINTF0 array.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index 67be62a6e7640..f843d607c8134 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -318,12 +318,19 @@ static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
 
 		while (map) {
 			unsigned long lidx = __ffs64(map);
-			struct tegra241_vcmdq *vcmdq = vintf->lvcmdqs[lidx];
-			u32 gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
+			struct tegra241_vcmdq *vcmdq;
+			u32 gerror;
 
+			map &= ~BIT_ULL(lidx);
+
+			/* Pairs with smp_store_release() publishing it */
+			vcmdq = smp_load_acquire(&vintf->lvcmdqs[lidx]);
+			if (!vcmdq)
+				continue;
+
+			gerror = readl_relaxed(REG_VCMDQ_PAGE0(vcmdq, GERROR));
 			__arm_smmu_cmdq_skip_err(&vintf->cmdqv->smmu, &vcmdq->cmdq);
 			writel(gerror, REG_VCMDQ_PAGE0(vcmdq, GERRORN));
-			map &= ~BIT_ULL(lidx);
 		}
 	}
 }
@@ -666,7 +673,6 @@ static int tegra241_vintf_init_lvcmdq(struct tegra241_vintf *vintf, u16 lidx,
 	vcmdq->page0 = cmdqv->base + TEGRA241_VINTFi_LVCMDQ_PAGE0(idx, lidx);
 	vcmdq->page1 = cmdqv->base + TEGRA241_VINTFi_LVCMDQ_PAGE1(idx, lidx);
 
-	vintf->lvcmdqs[lidx] = vcmdq;
 	return 0;
 }
 
@@ -705,14 +711,15 @@ tegra241_vintf_alloc_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
 	/* Build an arm_smmu_cmdq for each LVCMDQ */
 	ret = tegra241_vcmdq_alloc_smmu_cmdq(vcmdq);
 	if (ret)
-		goto deinit_lvcmdq;
+		goto free_vcmdq;
+
+	/* Pairs with the smp_load_acquire() in the error ISR */
+	smp_store_release(&vintf->lvcmdqs[lidx], vcmdq);
 
 	dev_dbg(cmdqv->dev,
 		"%sallocated\n", lvcmdq_error_header(vcmdq, header, 64));
 	return vcmdq;
 
-deinit_lvcmdq:
-	tegra241_vintf_deinit_lvcmdq(vintf, lidx);
 free_vcmdq:
 	kfree(vcmdq);
 	return ERR_PTR(ret);
@@ -1130,13 +1137,15 @@ static int tegra241_vintf_alloc_lvcmdq_user(struct iommufd_hw_queue *hw_queue,
 	if (ret)
 		goto unmap_lvcmdq;
 
+	/* No lockless reader of a user VINTF's lvcmdqs[]; mutex-serialized */
+	vintf->lvcmdqs[lidx] = vcmdq;
+
 	hw_queue->destroy = &tegra241_vintf_destroy_lvcmdq_user;
 	mutex_unlock(&vintf->lvcmdq_mutex);
 	return 0;
 
 unmap_lvcmdq:
 	tegra241_vcmdq_unmap_lvcmdq(vcmdq);
-	tegra241_vintf_deinit_lvcmdq(vintf, lidx);
 undepend_vcmdq:
 	if (vcmdq->prev)
 		iommufd_hw_queue_undepend(vcmdq, vcmdq->prev, core);
-- 
2.43.0


