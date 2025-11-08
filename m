Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A85CD1292
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 08:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wA7clLHnhSUvZ6fwm9sqhTd4FwmpY4o09XO41gupfjg=; b=ApZpOVza91eLGQWImnOBAlkSKj
	yfAWDIlHsDM3+ePRYXbx7aiDUYYFQ9n8/Hd4rOfK6sRxwmuzGul81OH+rdNQ71ReU1iN59TcSPkDs
	+yKxIH13amroqzyo0pIxs4gRhlzxGRfAekd6tJIpCVEZRoSvuA7rK4u+vyEnXcBI/znbUVt8Jd7Ca
	SZ7KCFHJ8i1jXp2XRwLzzbk1a/Q91HEO1ACX4o0BGbhZWk7tRCf6a13ntm+IIv7cn5CUwkFZO2hm9
	ibjf5TlbuwrXdNwrPTCsJEvN0jaAnhu0Jp1gpgnmDZLTm2fWgCo4EsQuhnZUJmoe/gyMdMpt1QcSj
	9+kFnqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHe06-00000002jkf-1wFN;
	Sat, 08 Nov 2025 08:08:46 +0000
Received: from mail-centralusazon11010044.outbound.protection.outlook.com ([52.101.61.44] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHe02-00000002jgq-3z8T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 08:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzJQQWTa0xYLOCtofu/VZiM1JoUj8ZzwsLXF2ZClJ6KfdLbdyqDfBkeRhSGg3KEt6K0Lmld02nMWe57CwauL1raQoaZS6Fd9MIL7aVcJdmHaKKGH4kXnFfDP1rCPfvwpmzmk/5FOKUD0u048WMOQxHDh5yCAu0s2F4khDxGMoyL8KO3F5obCULbdxuhtef3t65+tFX6rr6rtElYL/gK9XEJLTUUwbRn/lc9M4nN5dmgTsmWj+nwIp4QUDJAPPolGcjRRYW0MQ3qB3Sn0mMN8LUQUUZtP6sxlF82Lg64lvNj8LjOmcBAQUX9W6WoLoVXH3p9TtXjl9vG2U+OJZz5qew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wA7clLHnhSUvZ6fwm9sqhTd4FwmpY4o09XO41gupfjg=;
 b=FgCuK0dQFufHyhwkmptS59bEZf0lvtS1aqhnFV/3f0nF1D7qVXjAtP6Ht0VgIBZ1ZDnEfZHW68ZPwzmpWlhdgjCasZsB1D7nGiNoPS/CsRRrBnHe5IMCMHZGjWTJMqQenYHvynhHoB8wYpPtu5BDDR9Bgal5qqPBBMafN0JkxpBGwSjpImbIaO6rOR0PunqrXXfxlWQTYcMPhhgkOIUXICPvL+XCH/20k2HxQR/3blQN+0sKCjgNY31SEevdClknM49m8j57OiWNdMoSLdxkv4qugBdJOgWfn2V35jEKnNlzDxPK56SA5It+Uic4G3Zbm8iJfV5xRAxxA6Uh3UKtOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wA7clLHnhSUvZ6fwm9sqhTd4FwmpY4o09XO41gupfjg=;
 b=m7SBb/VJQVkLuUmK+SUwWmhx/ju89uHzmua4T2p1v36Lyw7LnsE7faQNSWepGVJjU7ElU+7CHF9HoufI2HVdI0PtfGKYnd0b6ZADaD4ff/EI5aM5uzncQxI+9z4J4UVNsaoyJBgIe09gPU1CLgbKnaZW8GGzHkFDiIEUET27yolW8dBhFoe6JDNE3dwKBaaSaG1BiNk4qU77G8l6wJYznJVKvSRovBGhRWVfkZts0vBj3SGFx+KBZakSl5jox319HRDg4VLCehKbvUhjTuSF/UkrPSd8yXJUBQteZ2Fvibv0+TI/Lxm/Qw9nP1SEJFsaj8RCM+YHScxh398OJOD3vA==
Received: from MN2PR14CA0009.namprd14.prod.outlook.com (2603:10b6:208:23e::14)
 by LV8PR12MB9715.namprd12.prod.outlook.com (2603:10b6:408:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 08:08:36 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::14) by MN2PR14CA0009.outlook.office365.com
 (2603:10b6:208:23e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.14 via Frontend Transport; Sat,
 8 Nov 2025 08:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 8 Nov 2025 08:08:36 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 8 Nov
 2025 00:08:22 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 8 Nov
 2025 00:08:21 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sat, 8 Nov 2025 00:08:21 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/7] iommu/arm-smmu-v3: Pre-allocate a per-master invalidation array
Date: Sat, 8 Nov 2025 00:08:05 -0800
Message-ID: <b6e1b5d0ac0157fc06b5cd20c5cd72caec892c47.1762588839.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762588839.git.nicolinc@nvidia.com>
References: <cover.1762588839.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|LV8PR12MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d7729b-2dd7-4f60-1aff-08de1e9e048b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5rKbvqDbuXny1Wk06p6gi5XtqV4oS6UF100bA8Puxcf5/PIdWEtJAUb+oXv+?=
 =?us-ascii?Q?til1n9xDqK4Ik5NQzsa/51ahdnlUY7eR4522MavgVvbDcH1HBz+Aa0VkJGe3?=
 =?us-ascii?Q?2SmucIG8t1vkfLztwjETh38loBJ1f5R2sq0RZW1mye2yL97ktNHCHKMJoHuN?=
 =?us-ascii?Q?Fx68x8mzxnF1nDXzMFPdvk6pJM6FlfosXXzcGA0vtWCyCLz77FPN+iaE+EpE?=
 =?us-ascii?Q?92DsP/DOQPKLNtP2j2Xf9Ybo2siyOtTnOwf+aN5Wtbb3n3BTS7byMtUKM5h9?=
 =?us-ascii?Q?kYke1CDNOf9vmMG5jABjS+XT/h58fJW2bBY3OTwfW/pLQwl+3olyu4QoKUUw?=
 =?us-ascii?Q?Cgk5AfEm2GjjvIq6LIknjrO/ahOGcqO0ig7oz+WomNl469Xr1SmlBy+r0Vsa?=
 =?us-ascii?Q?ZI1Ph1iTy5CpFVWYpq9kwzWAc8OV+n+oSSnD+DfNkHq5Gnl+k3bOEcD52u1Y?=
 =?us-ascii?Q?AEqaUPN+0OXHbM0nSG+biBInWDBGE7TI9txNzlpfoRx3pZctpPhFeZzfeew4?=
 =?us-ascii?Q?OZleupJW7ufNAXb7NVlg3UV5am7Wao9a8S1ECZ3fEQaZoylzUJ5LI5cI6Ve8?=
 =?us-ascii?Q?3MFRLaP/y6feTlcugvth87gSGuAXtP/Vu1CZ0DWl34X8irvMxRLncrq7rNqV?=
 =?us-ascii?Q?SupkEmoa2CEojR4LoBPtpm2yF2v62EuE2vEG7VeX07exrSfx9iiGeQ9BWU01?=
 =?us-ascii?Q?ENa8pp8baJTmf+kJKMPq/Z5i/BHJkTATa/1b2tSXLASw5IeDOpAuUVgDxyD0?=
 =?us-ascii?Q?FYr4cA6KjQvjEhdNEy3itytce5jUMEsC0iAz6OZYdxp1V+gVohUUvl7lUVaB?=
 =?us-ascii?Q?gd/cYYjZl9uvCW0cA9YJf/Qwp+jcnjlcX5S+Z9DghHICsLHQH2LpiJ5lq6l3?=
 =?us-ascii?Q?FpeSY+v/jJT07BAQUBxMXscIZ/761iwlOYBwoBy9gLgValutklzrXoq0Bi8o?=
 =?us-ascii?Q?22e6bdob3vrlnjGN3M8PYzjX/H2yyZGVhjZHipwERBSE92G0Tqjm6AyMYAEg?=
 =?us-ascii?Q?8dNmmDkaypG+Q3lCaO2J9kUSxQ93fyvmB83hEAP9ZAylhX4P+oD2Cj9xS5DQ?=
 =?us-ascii?Q?jF12B8sqEEq+3VFbqHrfTnL5YZ6DXyXvegMpv0M+nZXNOllZHYUeIPNp2Pnv?=
 =?us-ascii?Q?HTfLhFPxH9p4u0dZU0ZC8qAMEG6daBPpIFTmPZfjLsczMhHtrsmRKgwDhU07?=
 =?us-ascii?Q?P4E2sIFL6py4cToybyJNXfALHTPGmpfryoF0uKQUQAhVUT38QBF64IsewxQ4?=
 =?us-ascii?Q?Wrry1WaYEIUDiZg9sOpSvFtJ8fER0YDZkj5MxyWWCWg0Gl4mLs6lRmIwNxBn?=
 =?us-ascii?Q?M9t20OOHR9o/hDcIyyKQs5SIQR7F23Mm07cCU2rE8w6Ndu2BFetElUkbk0/v?=
 =?us-ascii?Q?MQ5QqUWku27tqSsgwWPLRZePsE2rPalAb7RzvrbT/7n2pbrsjvN7f/aCf97f?=
 =?us-ascii?Q?hEjq/IYj/FOUL4qFUelDIRDsUhLKcDb4rnrMS7KLIbyH71hKug5wNrKyisM7?=
 =?us-ascii?Q?D1LcgWLyCqK3K5JMFRyJMpDp8QOwQE2lq9bdJC/955HJXZfA9gBYMynov6kf?=
 =?us-ascii?Q?w7o6MesNyWS/WYYw6lM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 08:08:36.0989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d7729b-2dd7-4f60-1aff-08de1e9e048b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_000842_999397_F2B675DA 
X-CRM114-Status: GOOD (  19.89  )
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

When a master is attached from an old domain to a new domain, it needs to
build an invalidation array to delete and add the array entries from/onto
the invalidation arrays of those two domains, passed via the to_merge and
to_unref arguments into arm_smmu_invs_merge/unref() respectively.

Since the master->num_streams might differ across masters, a memory would
have to be allocated when building an to_merge/to_unref array which might
fail with -ENOMEM.

On the other hand, an attachment to arm_smmu_blocked_domain must not fail
so it's the best to avoid any memory allocation in that path.

Pre-allocate a fixed size invalidation array for every master. This array
will be used as a scratch to fill dynamically when building a to_merge or
to_unref invs array. Sort fwspec->ids in an ascending order to fit to the
arm_smmu_invs_merge() function.

Co-developed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  8 ++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 27 +++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index 757158b9ea655..7b81a82c0dfe4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -922,6 +922,14 @@ struct arm_smmu_master {
 	struct arm_smmu_device		*smmu;
 	struct device			*dev;
 	struct arm_smmu_stream		*streams;
+	/*
+	 * Scratch memory for a to_merge or to_unref array to build a per-domain
+	 * invalidation array. It'll be pre-allocated with enough enries for all
+	 * possible build scenarios. It can be used by only one caller at a time
+	 * until the arm_smmu_invs_merge/unref() finishes. Must be locked by the
+	 * iommu_group mutex.
+	 */
+	struct arm_smmu_invs		*build_invs;
 	struct arm_smmu_vmaster		*vmaster; /* use smmu->streams_mutex */
 	/* Locked by the iommu core using the group mutex */
 	struct arm_smmu_ctx_desc_cfg	cd_table;
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8266d0839a927..26b8492a13f20 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3693,12 +3693,22 @@ static int arm_smmu_init_sid_strtab(struct arm_smmu_device *smmu, u32 sid)
 	return 0;
 }
 
+static int arm_smmu_ids_cmp(const void *_l, const void *_r)
+{
+	const typeof_member(struct iommu_fwspec, ids[0]) *l = _l;
+	const typeof_member(struct iommu_fwspec, ids[0]) *r = _r;
+
+	return cmp_int(*l, *r);
+}
+
 static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 				  struct arm_smmu_master *master)
 {
 	int i;
 	int ret = 0;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
+	bool ats_supported = dev_is_pci(master->dev) &&
+			     pci_ats_supported(to_pci_dev(master->dev));
 
 	master->streams = kcalloc(fwspec->num_ids, sizeof(*master->streams),
 				  GFP_KERNEL);
@@ -3706,6 +3716,21 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		return -ENOMEM;
 	master->num_streams = fwspec->num_ids;
 
+	if (!ats_supported) {
+		/* Base case has 1 ASID entry or maximum 2 VMID entries */
+		master->build_invs = arm_smmu_invs_alloc(2);
+	} else {
+		/* Put the ids into order for sorted to_merge/to_unref arrays */
+		sort_nonatomic(fwspec->ids, fwspec->num_ids,
+			       sizeof(fwspec->ids[0]), arm_smmu_ids_cmp, NULL);
+		/* ATS case adds num_ids of entries, on top of the base case */
+		master->build_invs = arm_smmu_invs_alloc(2 + fwspec->num_ids);
+	}
+	if (IS_ERR(master->build_invs)) {
+		kfree(master->streams);
+		return PTR_ERR(master->build_invs);
+	}
+
 	mutex_lock(&smmu->streams_mutex);
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct arm_smmu_stream *new_stream = &master->streams[i];
@@ -3743,6 +3768,7 @@ static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
 		for (i--; i >= 0; i--)
 			rb_erase(&master->streams[i].node, &smmu->streams);
 		kfree(master->streams);
+		kfree(master->build_invs);
 	}
 	mutex_unlock(&smmu->streams_mutex);
 
@@ -3764,6 +3790,7 @@ static void arm_smmu_remove_master(struct arm_smmu_master *master)
 	mutex_unlock(&smmu->streams_mutex);
 
 	kfree(master->streams);
+	kfree(master->build_invs);
 }
 
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
-- 
2.43.0


