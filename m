Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LMyykbbC/WWTAzTJx4YWBzZjQUYfslw/7D0TRjuwUM=; b=hav7sy92ApIeVH6iZoDQrWXmI7
	25kzYcxZLEwXurSWPf1AiO9na0JGbTP5reTAeX+BdaD7QoSqJiC6iJoDn86hWnYqyfsFvesQ9kkux
	OFS/ueK9G55gEW1hmtKXGSJ+cEk8D2ZvclNBmO7lHkdMtLuV3RjGQ21uVuu8BAtSzVEY7i5Qo1ve/
	280nP7qtj3dCtnkae1s81eBZei+WwFXRVRx3JZOYxW9ktlJ7xY1sGohiByFeiTHdjrRS4P546A9U2
	RdsZe7KQbvmmW54hEFvV2Prh7oA8jRjVn2YQxCdNKpMKcAeozU++pMY7dMfjb/KfSs7CRdnFBaYR+
	kleGbi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAu-0000000DHR2-0wgU;
	Tue, 14 Jul 2026 20:56:20 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjkAQ-0000000DH1q-41R2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 20:55:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkO0Z2WQ9ByYiyrAoSPOOCcAXn/UNNF3nHXSAGr3ts3FifEXURq6/as0zztFSdupr9/H1tJ+da18C/SIv+Ux3oLcAJ/tjHP7+8rPZWJZoAYedwwdKnN84mpDY4JljPk8f9dyjKWCxk8p+8U4aU2u7vEWvv3B/yfxFNwtGXFbIYvK0xS8kD7xv7x49ocVNLoIqI8wfIzlPmPIUhLUZMmCkwrkOr9gzYZ5uFsd3w0XAB9bJ50oWdrS+2DO4DNaP3MfFF6MvHzX0ZikHkghcDbY9fwwlPtPJFmfhCEGvJPsJW2dHPZyyvlrBqWhc5/nyVOo542MKCbY7Dd5lhjC+ah9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LMyykbbC/WWTAzTJx4YWBzZjQUYfslw/7D0TRjuwUM=;
 b=r+eCBaRkqpxN76f6jIcWc2X6YWOqVjYcf4o/J0uxJ4BjhMaqvtzYmKS7a+ADM6J0ar41RUnhSarzt1JKjFrixeFtvD3Tg0YtEz8Ub19wHs9N79rpTy32zO4C4eqeqXbcFjLJ9+EJbHSQ32iMgUI++bYgm710qZpWyxJspflmiajG8xWwlQXSp3Gma6hW1RdvZ5fRuCsvp7A8XI9GKOafKArdadi27nMZqSD8PXSCz4PnsG2PQi31HsOIwyz61fngRiu3JJH1D8FJwY4cML7qy++ubpN3p1vTiHb4dkfylrhN86OSce/+qKrRBy81h8KO8bJ3XF/991d+iWwELZWsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LMyykbbC/WWTAzTJx4YWBzZjQUYfslw/7D0TRjuwUM=;
 b=hTegwg6YT8qOo7kg200/Cv0AjG5McfXVe5m3YVODGlX4PBMuhf2fAkZA9pOb7mZSCI2NlORoVIizj7LIS55zeWT3cMggUACUgDw0wrjqalzGX+R1zAL8D6BzWz5EYj9X6uDTpVycV50tYCoG6TmY3RJWTdo6vQb5sK8k3Vf6fowyssOiJiWkTCPAVx6O/JPeV7UYc/DNo/tvolzd8faPAj4BcF5gwWvXMsr/prIpKFDJWPW9SGvYlVEz09+JpGEcWzpY6ZTj0nv9qg03Hw0PW4a08j7n8VcaAl5KgBi26AjW2sQQnNgGebGGRrNVJz2x9LknQ8owqCLUnn9KHirF8g==
Received: from BN0PR04CA0111.namprd04.prod.outlook.com (2603:10b6:408:ec::26)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 20:55:41 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::49) by BN0PR04CA0111.outlook.office365.com
 (2603:10b6:408:ec::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 20:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 20:55:41 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Jul
 2026 13:55:17 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 13:55:17 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 13:55:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 09/11] iommu/tegra241-cmdqv: Fix VINTF0 leak on the init-failure path
Date: Tue, 14 Jul 2026 13:55:06 -0700
Message-ID: <894f84ecc005f2a873491ca6a11ada17f40a45b1.1784059577.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784059577.git.nicolinc@nvidia.com>
References: <cover.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f1d849-81a7-428b-07ff-08dee1ea441b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vQy0JoZUHRZ+Grrx9h8nVSIIaXFiKCSe1n33iKBteERY3llxwaN6/DJFHQ2CVSO48FBD/kXbaRC2XPkxCxyTkc+F3cBjmXBIanEy0SQUox337obPuPL8gDJFWObUh1N/JwBxEe94/FGvBRrQtr1ig+nAnyxS1laGfAeLX4ee0OV0x/dEP7GhoxBRNtMrRdatVReL2T5L/naNuK97nWHYcu6e0TGOlCM7LtCm2cRZuHf7z3GNrDtYtSKU0+DyqVHxWccRIoCZt28uLCP9+4N7f5g/3aK2DtFabEnPXzOejwQ1PWuiJObrI3Jw6qF2TOddvkMd79tkWYSsHdAo23CKcosAeKyAXLNjEnz6bCB0PnIF3ymHi2rnKhp7hNJsOtUX21VJYquXQk6HmnYhCyY1Y37jEJDPMOB49gzC1Xj37uAjVzOKNyxqj4i7qa4yq86pkRc/LPfcGiRIgGw3Nwsi/vYjgf9UI8RUxE1CUNBUgesNCTBsPWwkG5S2Idt0vu4BjFDB+FNmN9tAUo9GqYjaZhMIO08aUUBBxAeRwh1KYnb5eKze4NouE6A1ey1by9NdJQRAN/vUYHIWRGUeU1El8V+w+Rw6W4rYzRHFzeU3M7LO9NGnKpCka1IMGAArSFNTH7Bhekkcs3kqaNanYJ7KjO08j3SVIWqUgvR3l0TDrJaQ1qnfSS7VIaSGTmcLfcH0dC9b3fgtNX5DPjz7df3lAQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xzJ+oaSxGr6gOpvQYMFk7vRmsF8FOD8m+DOGSsBOyQVhWDnhgKfmqJepTCux/2bbH0Id/idGUF41YF0TxtlyXbKHgLIlvTVsiWNOA7sLnS/FB4dT9+a9YQamOJDQT8CKF/LPljn1rKSwSGSgGcvMy2tPM6qzU2RCoq168nL7+cmUBRk+qg+Gs/Er7e/Dr1GPBl3Hn13fZ3kDgI4WvRsEf0itdOnGtymfoVgbvdSRsgMPazAy12P/LYM6RwTcCrrBgJYU14q4Yry6wZ+Wtzzs9Of/mnvREWlgsfrcVjFZFHz9q4fFrAuygl9OS7qtRcix8UlxTcxayAFYQO6fLbG1IcAbFny4mVxucHXuZfaKB/pkasGYM3BY+6jMxrGUwWbV0cwE0xXcO7OeQZQaVSH2mdCZAlIUmaYHirekZ/FaUsP8LrvpwhfTRFFN4b/wtVQm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 20:55:41.2609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f1d849-81a7-428b-07ff-08dee1ea441b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135551_107098_F204F2E4 
X-CRM114-Status: GOOD (  15.38  )
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

tegra241_cmdqv_init_structures() allocates VINTF0 with kzalloc_obj(), inits
it, and preallocates its logical VCMDQs. Two of its error paths leak.

When tegra241_cmdqv_init_vintf() fails it returns before VINTF0 reaches the
cmdqv->vintfs[] array, so the devres unwind on probe failure cannot reach
it; free it directly there.

A later VCMDQ preallocation failure instead leaves VINTF0 published, and so
this time the unwind does reach tegra241_cmdqv_remove_vintf(), which then
frees it from vintf->hyp_own. But tegra241_vintf_hw_init() sets that flag
only afterward, from a HW read-back, so the still-uninited VINTF0 reads as
guest-owned and leaks, with mutex_destroy() and ida_destroy() run on fields
it never set up.

Decide ownership from vintf->idx instead, the index assigned when its id is
allocated: idx 0 is the kernel-owned VINTF0, while idx >= 1 marks a guest
VINTF. So the in-kernel free decision in tegra241_cmdqv_remove_vintf() and
tegra241_vintf_free_lvcmdq() now keys on idx too, and hyp_own stays a pure
HW-readback state.

Fixes: 918eb5c856f6 ("iommu/arm-smmu-v3: Add in-kernel support for NVIDIA Tegra241 (Grace) CMDQV")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index e3603cddde018..f93e59b7bd2db 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -716,7 +716,7 @@ static void tegra241_vintf_free_lvcmdq(struct tegra241_vintf *vintf, u16 lidx)
 	dev_dbg(vintf->cmdqv->dev,
 		"%sdeallocated\n", lvcmdq_error_header(vcmdq, header, 64));
 	/* Guest-owned VCMDQ is free-ed with hw_queue by iommufd core */
-	if (vcmdq->vintf->hyp_own)
+	if (!vcmdq->vintf->idx)
 		kfree(vcmdq);
 }
 
@@ -816,7 +816,7 @@ static void tegra241_cmdqv_remove_vintf(struct tegra241_cmdqv *cmdqv, u16 idx)
 
 	dev_dbg(cmdqv->dev, "VINTF%u: deallocated\n", vintf->idx);
 	tegra241_cmdqv_deinit_vintf(cmdqv, idx);
-	if (!vintf->hyp_own) {
+	if (vintf->idx) {
 		mutex_destroy(&vintf->lvcmdq_mutex);
 		ida_destroy(&vintf->sids);
 		/* Guest-owned VINTF is free-ed with viommu by iommufd core */
@@ -921,6 +921,12 @@ static int tegra241_cmdqv_init_structures(struct arm_smmu_device *smmu)
 	ret = tegra241_cmdqv_init_vintf(cmdqv, 0, vintf);
 	if (ret) {
 		dev_err(cmdqv->dev, "failed to init vintf0: %d\n", ret);
+		/*
+		 * tegra241_cmdqv_init_vintf() failed to publish the vintf0 to
+		 * cmdqv->vintfs[], so the probe unwind path that goes through
+		 * cmdqv->vintfs[] would miss it. Free it here.
+		 */
+		kfree(vintf);
 		return ret;
 	}
 
-- 
2.43.0


