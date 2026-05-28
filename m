Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E732CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIpYvVwi+5yqbVSen1P4PuyFXTHZhZeCg9HPBz5EoaY=; b=OfAuiDLio13upTK5yXbNVasZM1
	eWYYLWREnnLDQAqLwJFk3Kb7bxnt2TCOy3jv6N6oN3a5lWO5Qv7QPt94GXuJr+ID78YY76M9Y6Slu
	Q7tsn1Bv720in2NGa1r8rInCGslbaKQyGmQKyQpydLjJKjq00dF7zTPm6Xw0nIksrs/KWVbSkOQuj
	kiw209Lbjpirr59CCWFlrXagyq3OBjwkDSVqIufhwic4xQIs7uPP9jo0mIo3fN/Qc67HBBH2mWpff
	amagAcTzYhmt+lEgb6aLUfyCOThzQll9H/6v2kSoLe1zpC/GOXVhUhCMZq57lXQUlHJvhkVFYNhLz
	FXdXSVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfZ-00000005Jup-2VDb;
	Thu, 28 May 2026 08:00:45 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVfU-00000005JrP-41ZZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLzTVOlY9vFTII5h+9oKXXuWrLWSqU9SWnO3utMhgRvzL9cEG4J4I3Ih2CZ9JDVfDDwPtraG2p8SdPZX22YSChUGAkvbI8NVrK/PdZVeScwVktbjEqMu8ligIwRokWkew2lGiWTNTY04AC6ivEw3TH5xUqRNz/ij7nsJXRp6UmnFAF6XmuZWWWfCuATAhCw/GXXEH/e6U1mxVAMZFvjnqgm9GGRRKpSQx9ISzET5tlNYsUOSmzY+uOtklFcAW6GS6bclZikm309yMLnu/MxbnBPM+XsHY3aJYT4EmY2RxGje8ySJh6RTEmZtO/mwmM6yIYZO9I61us/6rsIVKuryeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIpYvVwi+5yqbVSen1P4PuyFXTHZhZeCg9HPBz5EoaY=;
 b=ryC0YmYAe22MmIfwiQ2JYYd2k5/Xp3OQHvEOfyK829DmqdYkJx1U4/72tuWS5r4G91DV8Y/gnookSRTrlgB0EDRThibFezgTbaJBRe+lpl3uR49bGuAUzBoLm5s2ycI5XVwAOYrIKeO/iaePVd9AXfEevqN+5ich96Zuyxn7kVz1S0PcGe/vESCQbIPcZTp3pPelE67jovikXlh9IjrMFfy+aR8WAgekwAsXECSEtU4TeuC63jybY14MWuN2IF/mS2g71K1iQLxyFpgT+XGu0+iJ2vWWPMJMUo97DwOhjHm2aFeQhOmscuoAg5jaTNzB1wemYzOg0a4Zpr9uvmrUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIpYvVwi+5yqbVSen1P4PuyFXTHZhZeCg9HPBz5EoaY=;
 b=c7ijlbuH6zjoCxg/QDfgtrrqcIe+qZ4fZMzkc/uxPR5cJZdu0hOqg/HgnBx4TPyFtp4sQkeMxA8+dFLQXJcdIGdvab/ztTBpyDrq3vePKImrwqYOQl5vvpA4MRMlR4TiKjS2JWRvlXgIrJSlPHvPkb/LRQGC5r6dzAqseYljWwMnaUo5GlIls2tXk3LR7O4WUnsSDLFvdTfwBfD7w8ybrTpPC/mJQzx3l0up6y07Jk312+OPZz7FSpmB6nPpfG3G7gNWNRqd8yWOVyCk+ErJ1fDq8xAgirwhmuau3lSF/Kd7x6LGmHg6Gxu9fbCv++vNZg5XarwRp6h2pbTuNQ7Y+g==
Received: from SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 08:00:34 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::7a) by SJ0PR13CA0062.outlook.office365.com
 (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via Frontend Transport; Thu, 28
 May 2026 08:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 08:00:34 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:12 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 01:00:09 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 01:00:08 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>
Subject: [PATCH v2 08/11] iommu/arm-smmu-v3: Allocate IOPF queue for ARM_SMMU_FEAT_PRI
Date: Thu, 28 May 2026 00:59:36 -0700
Message-ID: <a02e498421b4ce702900d015881fd351c28ceadf.1779944354.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779944354.git.nicolinc@nvidia.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a29e90e-752f-42cd-0dff-08debc8f322c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ubj3m2exgT72dsl8BYSofL3N20jDKFH+yc6n3dOoA2U5h7qkKGEowg2bTi2VeEmVpvC94HyH8FRj5Q8oJ0RcYB1u4C7Aq9Clz+bC3PV2Zv6ifcZEtjMiHjxGQDjRMOUczHJIfl5PS9mws2f9Ysc6mM+VItzStqid40eq4z0JpF59lv6Ml3MVlNhAMFN/jLJMJ642bikpkjq6yfiHtm6W9DnyrDwVKAhuMkkp8KnLv734GURBIqt/XG9ZNsrr+0gTTTTVIphjy9uZ2GDWAenjkVUTDSv5eTiu4wu2tSvvjgzr8a9+SsZB06L+vZCcljNyaqCdl2aTl3QNhyxhhjCibEzMkIdIOSP/rwl9OfJlx5+Bkg1qndbNX0l3s0iW2c1+X471c4ot+tQQRRKE8TMcbxwErF2RoPWSG7r23fhuJ6QH2kZBuftRkuZDI4ndy3BFFD0adzYtNYeXwq9Fq+uE7LYMcT3SJuuKNNWw/C5KABbkRilrPhaSLROCSZXQt+rli0v/F+zUM5puYhNoap5wdzXD1R77LRp1A7cPq66mFLViKKhthaSUFVw34QzdgWDfFhga1eEq5u8tOM8azX1kKMJ19J7f06C8Ljsie6LGvffJhAy91QmLMeqPXEpBRylamOIfXpku5CwM9eSRT0/XeAxyr0RzjsgBjp3fCmLuBB/LMja4tScvv7V5bqTVgS/oE4rFZzFGZ+kJ1yMZSgLXecXbAtmtzoYs+uem0LvCxGQ=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1xnXc+qFbHNgCtjPVKbU/0tJxgk9vHYWnl/I31KkAm0g0skhjnvxY6GnSiQOxrX/P60GwSKXnFYpKH86VYkJAt/+MAE3Nkyo8jLt2OBeCx6x6NapIeNefGwrQlo2Kk5iCLtAN39MgOV9DJJmjUPRhjNXOHe1zsJyUTB597DuHLe5FK1/Wx5mrWYsa1fyLxEwaPns9d6N1iTuPHSEEaXWXwOK/gE1b8MVOQngLo4OqVYpU9CBhmtHUWYzqLxfe/agrKFZe3GodJ4ZK4GhUhgqgOHw1TR+nT8o9lPLdOaFSwbfAyCMMXMJHQuvRJEAv+HcLCn7T7sv0gUqZmUQcKt0SExOtRHC0mDRSpGRQEVds8Bkql0WfDSE3D+px88o8mFEaSejbRLMsTLmgjxjjTTyy2ypuVs/TKzP19P6lLtktJxv4y9IjHgcK5/WutpubxOQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 08:00:34.0902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a29e90e-752f-42cd-0dff-08debc8f322c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010041_022232_3D49EF49 
X-CRM114-Status: GOOD (  11.86  )
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

arm_smmu_init_queues() allocates smmu->evtq.iopf only when FEAT_SVA and
ARM_SMMU_FEAT_STALLS are both advertised. A subsequent change will add PRI
support on top of the IOPF infrastructure, so the IOPF workqueue must also
exist on SMMUs supporting FEAT_PRI without FEAT_STALLS. Extend the
allocation condition to include FEAT_PRI.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 72fd5caa27368..87e4880a145f1 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4504,7 +4504,7 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 		return ret;
 
 	if ((smmu->features & ARM_SMMU_FEAT_SVA) &&
-	    (smmu->features & ARM_SMMU_FEAT_STALLS)) {
+	    (smmu->features & (ARM_SMMU_FEAT_STALLS | ARM_SMMU_FEAT_PRI))) {
 		smmu->evtq.iopf = iopf_queue_alloc(dev_name(smmu->dev));
 		if (!smmu->evtq.iopf)
 			return -ENOMEM;
-- 
2.43.0


