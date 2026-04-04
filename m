Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C1FE88D86
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 05:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT1TfIaaFpn0jw4wNtv2hCmnKBJZk5xb695qPIvhbYs=; b=cDLlgMIPJ3PbP9f3wzCPnpdueK
	3iHH8dPjL5XZvqUly6W1M3MucLOvB/SeizG19DGB5SEA2FallAQeA4uwQ1cLs+k9Jb2rQVVrTUjJ8
	uMaNuqGTUrROoEQHo1R1IOWwPF9r7OFVgi2fqjWvsSsTOIdw3yJmmkRtlgV8f8TIKK47qkhUZ8uMb
	ImAByU4UKrkErAGLNv5KRcuTp0g+Xrc2e0ZrtElFLhtOs6O9WzEM83Iscf67VsVQwGULcrwP1rdRx
	bIviZaM3oHwSrfy+/FaKBznb4C080YoH8K4o5qE64Sech19v/n87VDKqm8tbBJXGnxDu8TV9/vuTL
	7eUK/Rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tnP-00000003Bc4-0sXz;
	Sat, 04 Apr 2026 05:43:47 +0000
Received: from mail-eastusazon11012013.outbound.protection.outlook.com ([52.101.53.13] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tnM-00000003Bbg-4AJ6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 05:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9PfSTnbghJZNHDjs9c11rwFsIxqrtB1eZdSqB/5hluRdLvi3CQwNoyNOWNQaS6EQRm5mxsf56IYRN3Wl5u+Jai1S+ovk3hsZA7CxeoLWQ9B1waBXl7dK+nxguuWqHp9dRbMc4KSCzKTQyI5dnVtzRSo56yS7UlV/ycyzt/jDWBOorXbZWkPwrY6NW0i5xZsV9xIx+WwPlDPQXWmx46O/mjCcoE2lLLog+0hSdalHUri0KCR5ToXkE9fayH/5RAmNl4C57uHrDdkNpqUCEb/IzeMAtHxB8PEv27c1JHYPnY6ZtjK2mE/23D81+EpwPm3IvUR4yIYeGX9itueU2p44w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT1TfIaaFpn0jw4wNtv2hCmnKBJZk5xb695qPIvhbYs=;
 b=vvQ5mqqPwFgBGjeSrAp67KRba0rhtlpGQXJhuu1P+oxeka1tmaKQdCXE03OoahTiij6C4ZQM257PMZK0gMGUXfaqeCAg7hMOtSs4z7MifaCAT39y2C21kqZPx+lStr3MxScLsRHgoTffm32rc8r6IB1YYOK97amIgzfB/BFJrFr/kM5U6TQ3A4EtZQFGb58Ar/TUllXvnEsxZ3bh/0Mgces/P3aeUypdqN67fMKAzJ7Oo26G69AzI/QXRbS2WqYgn1hqr2/Xf8KMRe6VTwNbxSW7Pt7pv5Q8nttgPk7yMvteYZTCQs4I2g1b46YrMYoAYo5mjkY2rWRmNhQmERyhzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT1TfIaaFpn0jw4wNtv2hCmnKBJZk5xb695qPIvhbYs=;
 b=hu8E+AQnQCjuilpGS4ZIBXTaKA+TADh9EE2LeN66YtJn6VHFffnvqbjh7efiNSbJnC9asQB+wr5eQd7VwJEMhyjeEjWn2+0mK6V4xBeDFctBFqSjtSwlePJFUC2zlPfMlzaIUjiipwBU4f9H93wlz+4edMa+Qfn/moIwJR54WSJv/uDPxzToda4wM08JZWM/19BiLSJ44pF+vjglbZegKn2BM2tjuimcmIj5L3CPIb9xD0PZUvKC2sxnGNr1iAbnyrSEjCuYe9HqR/IhXnaycBlcySQfvzWQJIeIy9Csu/He8Xy7qb8KVTJyWs55kdiOsq8K0Wb2ujF1YBRXnoHDHw==
Received: from SJ0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:a03:3a0::20)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 4 Apr
 2026 05:43:28 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::e2) by SJ0PR03CA0255.outlook.office365.com
 (2603:10b6:a03:3a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Sat,
 4 Apr 2026 05:43:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 4 Apr 2026 05:43:27 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 22:43:15 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 22:43:14 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Apr 2026 22:43:12 -0700
Date: Fri, 3 Apr 2026 22:43:09 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH v2 3/5] iommu/arm-smmu-v3: Add Stream Table Entry
 display to debugfs
Message-ID: <adCk7bUDsvBa7TE0@nvidia.com>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
 <20260328101706.3448655-4-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260328101706.3448655-4-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|SJ0PR12MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afb52d0-6ca2-41ae-3223-08de920d1864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: i55APxxNQDCUPEpJ8vHAWFIGF5geFw3ySYcaDqRmQPBTofddSnJFEvXn/JjNE/TsaiYi1Xwkkg8i/2aCsuD2XK0483I5tPJsg4LLW2/sg2TQ82FFR6ks5tEYuVP6KvHhwKKvHrFS/Q9OeyDBjOQTHmYH1XoDj0Gdlfo4y7OwcM/8q4Q8eFGvYlknHCv2s30cFQlmCUpaIcUOuru+oMXKnqzA7Ixu9CyZveImUzfXkYz4MNiyzNp1CohbGci5OY01MrlZixJH39DUCWMcjXETWoZVHwocDBbxPTnWpIaX1IFrF+sbiIbEEbi3+Gtx8d4SOck3GMgJFF0LV39Igyx04TLa1qakm0FMGyNw96ZVmW0vOlq6SR6fSSeS8S55a93tNP/TOv9Jxz0HhJvEQYjpSXysCZb4rAsWqoqnkEFZQAP3gabb2TQlbCdtTPG825qva2QBWJlM77QpjtP1gNKWmVNAqRhQ4ILDVA12n55qH8gehKiET3HyhfAir8Q/3FlcntramjqszWnpkSUDUQbWguwuEUc5MUUzLTEMO4uH0xragxDttAOmohQpw/NRBGu6cgmoRRIIguDmnSIwjbizGydZt+2L/XL14RvXEFXUioTrA77+jAYycWZOD/UieRPrFDN990nETXqRs7CcQBt1ANofjr5aUHHPIGdPZicjyN2eI/uy7z+eSlPZz0mcsycGh8ws5L9RNbzWoDt8fFPjT9O0Xiy3QvZptYi+D4lMQ5FwMOMqOy57xt+TctRxRO5XM2XGBxfCgJOgpIPGYrtQqQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lPns5/E4lHWl/cz+V5H2qKhXh2YxGvM5owLVwO18+uR+It/DlgRV8R3D7yo7gg4LMLLBfXmtJ0Iw0FChsjMAhZizZVpixDp2veBMmm2Jo4ZhStdOvoh9QkInKvR3G94BrdspoRIZMvBHTxfbON/kdxjc+fYlXOapl+825Oulyrnldg6F3l1UKtcaBEUZJ6fP06sFMgl+3dhAJE0CRZgA6VPFyX4Aa7i6L+ZhIhU9r8WEAxAPRpJAFzqnHro2Lcz+FKKZUwcK4heAQKIj01xLirIYo5hxEEm2kOGRv0S3Q2KpR+whALfS9KuOE/RrAqLKwCy1rycOsp/9HR4AUsnIwiE2rKBBye/beerSUMoRSUBKt1WRenLF2iUjXd8TrJcPzT3rQSF9bUc2C7FcXhEq4zzTjxf5bkwYK4uDwfFWIwACGT1DYE/BgR6ZyO5fk6ns
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 05:43:27.3253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afb52d0-6ca2-41ae-3223-08de920d1864
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224345_044354_010F450B 
X-CRM114-Status: GOOD (  21.84  )
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

On Sat, Mar 28, 2026 at 06:17:04PM +0800, Qinxin Xia wrote:
> +static int smmu_debugfs_ste_show(struct seq_file *seq, void *unused)
> +{
> +	struct ste_context *ctx = seq->private;
> +	struct arm_smmu_master *master = ctx->master;
> +	struct arm_smmu_device *smmu;
> +	struct arm_smmu_ste *ste;
> +	u32 sid, cfg;
> +	int i;
> +
> +	if (!master) {
> +		seq_puts(seq, "No SMMU master data\n");
> +		return 0;
> +	}
> +
> +	smmu = master->smmu;
> +	scoped_guard(mutex, &smmu->streams_mutex) {

Instead:
	guard(mutex)(&smmu->streams_mutex);

> +		sid = ctx->sid;
> +
> +		if (!arm_smmu_sid_in_range(smmu, sid)) {
> +			seq_printf(seq, "Invalid Stream ID: %u (max %u)\n",
> +				   sid, (1 << smmu->sid_bits) - 1);
> +			return 0;
> +		}
> +
> +		ste = arm_smmu_get_step_for_sid(smmu, sid);
> +		if (!ste) {
> +			seq_printf(seq, "STE not available for SID %u\n", sid);
> +			return 0;
> +		}
> +
> +		seq_printf(seq, "STE for Stream ID %u\n", sid);
> +		seq_printf(seq, "  Valid: %s\n",
> +			   le64_to_cpu(ste->data[0]) & STRTAB_STE_0_V ? "Yes" : "No");
> +
> +		seq_puts(seq, "  Config: ");
> +
> +		cfg = FIELD_GET(STRTAB_STE_0_CFG, le64_to_cpu(ste->data[0]));
> +
> +		switch (cfg) {
> +		case STRTAB_STE_0_CFG_BYPASS:
> +			seq_puts(seq, "BYPASS\n");
> +			break;
> +		case STRTAB_STE_0_CFG_S1_TRANS:
> +			seq_puts(seq, "only S1_TRANS\n");
> +			break;
> +		case STRTAB_STE_0_CFG_S2_TRANS:
> +			seq_puts(seq, "only S2_TRANS\n");
> +			break;
> +		case STRTAB_STE_0_CFG_NESTED:
> +			seq_puts(seq, "S1+S2_TRANS\n");
> +			break;
> +		case STRTAB_STE_0_CFG_ABORT:
> +			seq_puts(seq, "ABORT\n");
> +			break;
> +		default:
> +			seq_puts(seq, "UNKNOWN\n");
> +		}
> +
> +		if (le64_to_cpu(ste->data[0]) & STRTAB_STE_0_CFG_S1_TRANS) {
> +			seq_printf(seq, "  S1ContextPtr: 0x%016llx\n",
> +				   le64_to_cpu(ste->data[1]) & STRTAB_STE_0_S1CTXPTR_MASK);
> +		}
> +
> +		if (le64_to_cpu(ste->data[0]) & STRTAB_STE_0_CFG_S2_TRANS) {
> +			seq_printf(seq, "  S2ContextPtr: 0x%016llx\n",
> +				   le64_to_cpu(ste->data[3]) & STRTAB_STE_3_S2TTB_MASK);
> +		}
> +
> +		/* Display raw STE data */
> +		seq_puts(seq, "  Raw Data:\n");
> +		for (i = 0; i < STRTAB_STE_DWORDS; i++)
> +			seq_printf(seq, "    STE[%d]: 0x%016llx\n", i,
> +				   le64_to_cpu(ste->data[i]));
> +	}
> +		return 0;

Check the indentation of the return line.

> +/**
> + * arm_smmu_debugfs_create_stream_table() - Create debugfs entries for stream table
> + * @dev: device to create entries for
> + * @smmu: SMMU device
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int arm_smmu_debugfs_create_stream_table(struct device *dev,
> +					 struct arm_smmu_device *smmu)

Usually @smmu would be the first parameter.

> +{
> +	struct dentry *stream_dir, *dev_dir;
> +	struct arm_smmu_master *master;
> +	struct ste_context *ctx;
> +	char name[64];
> +	u32 sid;
> +	int i;
> +
> +	scoped_guard(mutex, &arm_smmu_debugfs_lock) {
> +		if (!smmu->debugfs->stream_dir) {
> +			stream_dir = debugfs_create_dir("stream_table",
> +							smmu->debugfs->smmu_dir);
> +			if (!stream_dir)
> +				return -ENOMEM;
> +
> +			smmu->debugfs->stream_dir = stream_dir;
> +		} else {
> +			stream_dir = smmu->debugfs->stream_dir;
> +		}
> +	}
> +
> +	master = dev_iommu_priv_get(dev);
> +	if (!master || !master->num_streams)
> +		return -ENODEV;
> +
> +	for (i = 0; i < master->num_streams; i++) {
> +		sid = master->streams[i].id;
> +		snprintf(name, sizeof(name), "%u", sid);
> +		dev_dir = debugfs_create_dir(name, stream_dir);
> +		if (!dev_dir)
> +			continue;
> +
> +		/* Create STE file */
> +		ctx = kzalloc_obj(*ctx);
> +		ctx->master = master;
> +		ctx->sid = sid;
> +		spin_lock(&smmu->debugfs->stream_lock);
> +		list_add_tail(&ctx->node, &smmu->debugfs->stream_list);
> +		spin_unlock(&smmu->debugfs->stream_lock);

May consider an RCU list instead of locking.

> +/**
> + * arm_smmu_debugfs_remove_stream_table() - Remove debugfs entries for stream table
> + * @dev: device to remove entries for
> + * @smmu: SMMU device

Again, @smmu could be the first parameter.

> + * This function removes the debugfs directories created by
> + * arm_smmu_debugfs_create_stream_table().
> + */
> +void arm_smmu_debugfs_remove_stream_table(struct device *dev,
> +				      struct arm_smmu_device *smmu)

Please double check the indentation. It looks odd on my side.

> -static struct arm_smmu_ste *
> +#ifndef CONFIG_ARM_SMMU_V3_DEBUGFS
> +static
> +#endif
> +struct arm_smmu_ste *
>  arm_smmu_get_step_for_sid(struct arm_smmu_device *smmu, u32 sid)

Could probably move this to the header.

> -static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
> +#ifndef CONFIG_ARM_SMMU_V3_DEBUGFS
> +static
> +#endif
> +bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)

Ditto

> @@ -3648,10 +3658,14 @@ static void arm_smmu_release_device(struct device *dev)
>  
>  	WARN_ON(master->iopf_refcount);
>  
> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
> +	arm_smmu_debugfs_remove_stream_table(dev, master->smmu);
> +#endif
>  	arm_smmu_disable_pasid(master);
>  	arm_smmu_remove_master(master);
>  	if (arm_smmu_cdtab_allocated(&master->cd_table))
>  		arm_smmu_free_cd_tables(master);
> +
>  	kfree(master);

Meaningless line.

>  struct arm_smmu_debugfs {
> +	struct list_head		stream_list;
> +	spinlock_t			stream_lock;
>  	struct dentry			*smmu_dir;
> +	struct dentry			*stream_dir;
>  	/* Reserved for future extensions */
>  };

That's the end of the struct. What do you reserve?

Nicolin

