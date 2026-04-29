Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E5AFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 21:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwYya9kj9ebLJmfPo/BibPB0Rvmdjnri+4NZxs4H/KQ=; b=MtTEWH7aStLI0GM6zOi3fV9gB1
	+u18kxFfhGGVwoxbDapFlydBQc+CqC/3a3kalkrLIIsAbk7/KUKawYY6WRwOw/g+P+3yE4RH+a92E
	5SR+/aIGRmNaeVwd2APdg0Y7zJhwsOlIxwrNfjdTZ9ZxpfTWpeID1B6rkw2voZruSAU1cn6qh6OAN
	Hiw8T3tk4ClQ1k40rLBHGs+4JAuf1GtNxlds4jHGJebDJjUX5Bla13nlccCF+NTVCFQF8f6mEj/Nq
	IpgFaZUHojylKtNc9vorV/ETEXo7uDjmCNo5Di8JP1Hk3XcIpTUKu0j8ailWYwx66TbW506HCDw/s
	TnhKaMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wICbv-00000004FDb-2GEG;
	Wed, 29 Apr 2026 21:38:23 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wICbt-00000004FDH-31Xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 21:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRaKFmMYxumeD7Ftj0Pqyr47k7t8NtERAsh4jKG/KsJTu189dsORey4w8LrzrBgPQl0IfX9uwGWB0IrD0m0jVC4rqzDPrDq5XrPqZrZJEKplRddbKFW9WJ0Z/4R5GIWMcu1fu+XrtlYD090AKBnOcvodLgIim3M54L+JKHDiZF24s2k2FK9K2Zs8pxBemikMc0oMmpnY0E8K3Y0DYxzsWQqzudXZKmkN4vb1LQkDBU3h5drG8E8uWO/yzzmpz43O7/Hg7/PZduEjx80LgYD2+7lI14NFxy3SCCZLxd4ZZRsK9vu9KvafIkALoQ54tFCCKkkIrLD+gnPYHSxZtmm/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwYya9kj9ebLJmfPo/BibPB0Rvmdjnri+4NZxs4H/KQ=;
 b=NRewX+UKF3CM903bJ8HVXp6YM0FLC3lnp3gEL7ExVd78vAJaVW9Ehi0QSI5Z4i7vV5YbX6GwE02ICPC0RYdHBlQ8/egCZ/O2D8o6RGle97+v8xQMfG9U7Xuh9D8WqN5jOdbM6EzVIjGywzQNwW6VrVj8l7JvE4fJThLwwlF/6oIGe3TTBTwXhCtuUl7rrNSglpo/E29JKg6IDSCVn/J0qsDCxowRmhql5vAxW8PvMcSpSW93OwNTnS9ZY3aXw3NKo2svq5zJX5g6BEs9mtiyjwyLFWKu5SyV8TQQHVGl4xxT+oYly5Ns9rbnclWp14Hx8n+OgD7UDuPU14PSx34NwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwYya9kj9ebLJmfPo/BibPB0Rvmdjnri+4NZxs4H/KQ=;
 b=ighhV2sHSGpIN7GGaLFm+KiHfRNrMKSTHNfJv+FxCCgXnPOJvRX8fR3vdWaTWf0XT2+OrMPjSFQML1wXI9G//jS8SisGzj6FCIIwEh3Tw37SKqWGV1tpp2z6AJYkXBI/jscGo3hyQo+QA5tldbw1YEjpoAdnW+98dej76Ug7tWU4lvTiObOu8bkko+4rlpIWoiXcp9kqczc7XEHptySKmljoJGJwsWvIY3PwQJI5zoAmvKmZ4W9Tm6AeREtEuCugtBGBbrq1z1iJZUSgnv6+ZlxTZkHfKOdAbSsZcS8ohuDsht/khF/ukF2aYtN+GCBq6zbaBULBKzYzXgyWQSUqlQ==
Received: from CH0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:610:e4::35)
 by IA1PR12MB6211.namprd12.prod.outlook.com (2603:10b6:208:3e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Wed, 29 Apr
 2026 21:38:12 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::9d) by CH0PR03CA0210.outlook.office365.com
 (2603:10b6:610:e4::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 21:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 21:38:12 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Apr
 2026 14:37:52 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 29 Apr 2026 14:37:52 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Apr 2026 14:37:51 -0700
Date: Wed, 29 Apr 2026 14:37:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<kevin.tian@intel.com>
CC: <joro@8bytes.org>, <praan@google.com>, <kees@kernel.org>,
	<baolu.lu@linux.intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH rc v4 1/5] iommu/arm-smmu-v3: Add
 arm_smmu_kdump_adopt_strtab() for kdump
Message-ID: <afJ6Lu0aZyff5TYZ@Asurada-Nvidia>
References: <cover.1777446969.git.nicolinc@nvidia.com>
 <edc9df0e05559ee3edfeb833b84d421d9b040dba.1777446969.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <edc9df0e05559ee3edfeb833b84d421d9b040dba.1777446969.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|IA1PR12MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 383313f3-8a5a-470b-8597-08dea6379d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vHTC4VwDCKqM0qOxHjRhqlQ1EAROrR27BvBH7t2iv78Xqib+vOy+UswN+nRxKE04HGs+X56ycWcu0clYg5ISTg/QFSxbdeHLHQp6cFlmCYpaXKKWdaQNitgRBFGj1xqZZWxd1NebEdjUwNbzh9Ifn5WoMq/ZfndvTp6W8sP+PCSJKLTdXpnMVR9Bno/cibWtO7m4owCKPBKuse7jOdAKTyEcLi2wmrW7c9RQiIJ9A1gtyytIpAzasa4Vri2f3QPNmxVSqjU23iG9Skah54gxfGHMIjMlBPK45Or6tYu+QJkjORGKSaLnfM56h2UD5RF+FEuhII2tleLpKqlfudAjoz4I0WbBChRFlJbQrDW1zCNoF4bAuxmRQ+R1WgU8rPJNtOE+6yHgmzF2FOOPbFm9QVijPErqFp8W5/yry4ekVhLrChKHN5NIBEZTNSBsAZeRUyFOliMjiPlc2V5lRtc8a/TJ6fGrMnKwjEcFivopUpQd6e9g+AO3iD4+70k+QVB2+Nqozf8EFH9+sGkx7C4gqJRCN7nAdPk5ghGkQZkQ3VXwwILBPnZhjuS7bLGbE6tpjK2b8LesixuaQmnc36o4w3XQgnxHwKPxeZO35XdOeMcIwmCiH8UTfM2nI75NCGtSz/F4KH6OiG1nE0Pb58vuRC0+p0g9XFst+H2oLL6CwhYowqgwWuc2QtEo3CQF/11ZS7IU1ali7fRPtQHN2bUEhXKTz0ouW4ZhNiaBidC1Uk+NES9zUMD1v7IwMiXfLnJmrC1TupFMoyBICKJ67U8maA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3cn9di45m+7c7zJGvmgJX3bpqQaGQoC58W4sWdq+5cEaWnyt1hrrzhkuXo3FJ/87lgpJYhj2Zpf2yrqVdzNyjprEzJ7wT1CKxMR0wuVHENt0tdBQmZouzOJ1bqePzPClwmNbsOdu1sJacWP3ZxoK/7D4WuztQcT1MGEW1yi9BAQRzMBtja0iG2lCkn7DDpHQkopIOgM/ma7m4DXrQfYNTUeucj1R8BrPUuvrsjktdg4sqpETmiLbmMXT87DleuOt1zdpX3yAiPXCKTRVS8Xhzg0dDqtWY24tNdV8ciZUHPSE7qbWYBWO4Dhq5Y8ejk59Z3fBtgzlcGm7MaPSJ3kvJgDN+Mxk5bq2XBDBhYeLhO7J1qSjZf3Lqbb8tiFPTSGLRbpOomdS7wvcwo652uUYLSgTc7JvYX2tayVHKdDbcPK72aztyrSYigAIu+jdaU0X
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 21:38:12.4123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 383313f3-8a5a-470b-8597-08dea6379d4b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_143821_762492_E56981EA 
X-CRM114-Status: GOOD (  11.95  )
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

On Wed, Apr 29, 2026 at 12:20:49AM -0700, Nicolin Chen wrote:

> +static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
> +					    u32 cfg_reg, dma_addr_t dma)
[...]
> +	for (i = 0; i < num_l1_ents; i++) {
> +		u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);

Sashiko pointed out a missing READ_ON here.

And in arm_smmu_is_attach_deferred() too.

I've made a small change to my local v5 tree:

@@ -4337,7 +4337,8 @@ static bool arm_smmu_is_attach_deferred(struct device *dev)
        for (i = 0; i < master->num_streams; i++) {
                struct arm_smmu_ste *ste =
                        arm_smmu_get_step_for_sid(smmu, master->streams[i].id);
-               u64 ent0 = le64_to_cpu(ste->data[0]);
+               /* Pairing READ_ONCE() with the WRITE_ONCE() in entry_set() */
+               u64 ent0 = le64_to_cpu(READ_ONCE(ste->data[0]));

                /* Defer only when there might be in-flight DMAs */
                if ((ent0 & STRTAB_STE_0_V) &&
@@ -4747,7 +4748,8 @@ static int arm_smmu_kdump_adopt_strtab_2lvl(struct arm_smmu_device *smmu,
                return -ENOMEM;

        for (i = 0; i < num_l1_ents; i++) {
-               u64 l2ptr = le64_to_cpu(cfg->l2.l1tab[i].l2ptr);
+               /* L1 entry is shared with the SMMU and possibly rogue DMA */
+               u64 l2ptr = le64_to_cpu(READ_ONCE(cfg->l2.l1tab[i].l2ptr));
                dma_addr_t l2_dma = l2ptr & STRTAB_L1_DESC_L2PTR_MASK;
                u32 span = FIELD_GET(STRTAB_L1_DESC_SPAN, l2ptr);

Given these are two small changes, they shouldn't block community
review. I will wait for a few days before finalizing/sending v5.

Thanks
Nicolin

