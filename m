Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D4A107BCE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRzrZeQH5rO5VFXhIYBZ8uXWlUGvc/UkH3tOrEvngSA=; b=ss5dVJMJ2IBly0zrQ1WEj9zCiG
	LooJGGnhJMrJTruVNHu/yu+UPQ9vcv1j11bVOV7MQsBFLsDtzhLHwI3heqy9pU9I8l1XKKrve9W5e
	rYhNWSMbLs0X2TGTy+yE5UyfEjyFY7zCUAW4gXviXcdWbquZbCQSdJd+R5lqhERVSXMyO/4sekclf
	BzqsjQW4rPLfZmauWXpXaaklhgxFAM+JVTh/S329NXwYIsp3HN+Cl9mecNuJ4lYEZD46IjxEubNv5
	KdLzVwTPFBXjVtGpSSYDOGo8HzOTThcAeP4M0TNhfd0uFnNL1ikFBonzNUixjKHjY+xQyJwnSfQz2
	EkD9owIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18fG-000000018tE-2pTp;
	Fri, 13 Mar 2026 19:59:18 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18fB-000000018pH-13rR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka9+TiKGY6xNt/yUUQmdqIbfEUFRJVyN0YWzpx43aKb9aR91+GdK4GOKHBG15La8pA/VdgPPb94ohnCgoPyFz3MScBBQjgGUwlfaQsZTorzw3F88eJdiHwc07fds5JnA9ywsE/sEjWyxEUyY4cq2vGqglnF8DZ53sFIGtcbmChg0HS2e1b8jYz7WK3R8rqVOVk94s8w0sw3dVS71TlkyXSblUiDx0flA3EbwY+pcm3kciugySSr+oEjlUejYkBj6WaQq2OUF3scFOB1lDtCmdsE/X/B9XFotkfLdkBcekpYylSE66CmB3k2M9zLjvVIm3j5cNmXi0v0OFjt/7wW/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRzrZeQH5rO5VFXhIYBZ8uXWlUGvc/UkH3tOrEvngSA=;
 b=ExX+qB+Vyude8+tZ/jq+4i+33NPXMEAUMkv9h0W4xsKE/Z4lRuTGU1/OZg9qSqxaNntNTEJXmWrXD45w2Pys/gqsmsKVr6JWzIQKLFUw7jc8OH+XxWFR2f/yO43NFFwg75byK2ae92o2Mc5RTBtw1AieZxxF0tEg/AUfBEjiBuQ6IY1aZGStidTxoxLtHsDfPFWNYtDVDB7gyoCpQiwxIsB1ELyq/mVMzfb236OXrvFaxj6YHqNaJdjZa/GnUkd1uGIx+0vMo8gbceaomWfx92DZAX4RKYTxijkTO7DnQSDNg3BKPPhUioWi+2sQdD1AZbNlehgOREuAP88T2mASiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRzrZeQH5rO5VFXhIYBZ8uXWlUGvc/UkH3tOrEvngSA=;
 b=VeabhZ85VrtOTvFgRDaWOnYEI/ouNDDo7g2bQElHwWdiwN3TATDr8uTl8WMupW3w04KmmDMjZyBRNmusslcszQ14FyVnVhq3fxyHoUAFVLxRTgPr1HX5rWTq72dmZrVLifkHaMS7rZTESTm4ZqufzDb0I43D5iLqJ8LDRzqr9p58Z7E+j8cbfTVPrScoiNHczNkAla3CvHLfARkw/m9bs+ehmLFaIt4nUjBNDKV9Hmp8Ov7xBKDDdiCdSD0X+T9OA8vb8zX3MhJQrGtyf6hxMhl/0afklL+7Dg1fRE5O3IJSCByJ1gJEx3VonGF2EriNEe3DtQSGL+vI+bXq6nnjcw==
Received: from SJ0PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:33f::27)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 19:59:04 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ec) by SJ0PR05CA0052.outlook.office365.com
 (2603:10b6:a03:33f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 19:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 19:59:03 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 12:58:46 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 12:58:46 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 12:58:45 -0700
Date: Fri, 13 Mar 2026 12:58:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH 1/5] iommu/arm-smmu-v3: Add basic debugfs framework
Message-ID: <abRsdCYapDe16GtJ@Asurada-Nvidia>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-2-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260313104351.3502293-2-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e532ffc-8c7a-4378-52b0-08de813af9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: m/gAQkWQM4oXsrI4kAmHzFRjK/KjQ+I4wc0p0Saq7JF7zEXNwHa2uv1MnGcI3Eo9000NERomKfQ8hs3hPZCYOB9gwNRBkJcBP88CvYI7CwOCwgEndIQ3gR/d/Qrwfpc9veUv9pjvrFkVZ+Q9ymVjzEhIMDLyoW3MZo/btokhETWD40xTFL7PtQYs1G+PhXDyjcHNUTt4V4srD3GPz7F0Ad8BvQ4ibrIvvJt+sdSf/d82Sz4KFqcTLXtXJ/dPqSeTHo1+SWLt5YgozHvHMZs/VQqSXC3BaYg8r4NT1Gif67gEno1W2xmbVptHzjHVYsgxD+KoPuL0VBYV2hXNo6MthpJpiSnxU2ZagLeYkzPxpZQ5eyyU2kHN7c4SQQdL4ooQCM/YHwNscIrz6HN1vUh9Cn+W2Y4d3BtU8O2bnUIauzwhBFEqbYWmvRK+57xpFflUlIo7qucCjx+0h+54dTOmR1lgpVF3RpixoX6I4sd3QN1eqLEbKq172UPb6qbE8DQF7ho8T3lYY9ggFswNlBuPu432leZEGKFT9NqoV3eOi0r0Dr0S4MekMGgQn5bdwans49u3d/nKQYcZDxM6lVwO08Sd8kF11uEuWtIiH8D2/PbdCpvDLfuB7tkYkosqo4/1KIlyQCaBMtp+dIJrYnCOPaDfhbOzInTlmL/zOY3BQhYNphjJmiytIUN9u+YmiRwr7qrUb68bMD/uUOKXzfWUMZ0g7XN+dEBaeVJZ+taOKXJI4r479u+NZep7m/JeJJ3viyU/0ADJpPFna1IF1K8Hiw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3GPGOyZQLgQaKh9jraixyWuLwPyhkaoQhr0UkhAh5QbCs6Jvwa3ZrgYYa3ZyR5CRcn1aWxtXrvpwEKQKwHsLx5MWV+/wWMdMZlGdEhaQqgH9Bh5NJ6Wo2PEq8N46i24HMmz8mOu7tMohjmBltn6rgIjKzX/Xkns9esSjepufVw+ZCDZqnQz19Q8HTfsKGzhQVz7D6J7Rxbh02DQn9j3SIKZxCl1gzRbzY8xOYDEEmwFX9zQftlIrCrAqtUFOLA/nN+teM7xYwOEgLezEwu117Ry5JGkqTZPz+ZnaoJWiV33PbZsi4av4T3CvlS7hJO0+jyADcLomXeWpbaXsX6jm7y5kkKRP+gvU02efIdh8wrzazaeOWpPUQ4NZB+4we5VOBiGW3SmeZfce4mATxiYlqUBUpfMMge94CAXUy4suduwczQK2Q0aMxAc/kSDTCuzV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:59:03.0519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e532ffc-8c7a-4378-52b0-08de813af9b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_125913_521851_447BB655 
X-CRM114-Status: GOOD (  19.81  )
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

On Fri, Mar 13, 2026 at 06:43:47PM +0800, Qinxin Xia wrote:
> +/**
> + * smmu_debugfs_capabilities_show() - Display SMMU capabilities
> + * @seq: seq_file to write to
> + * @v: private data (SMMU device)

@v is not used

> +
> +/**
> + * arm_smmu_debugfs_setup() - Initialize debugfs for SMMU device
> + * @smmu: SMMU device to setup debugfs for
> + * @ioaddr: Physical base address of the SMMU device registers
> + *
> + * This function creates the basic debugfs directory structure for a SMMU device.

nit: an SMMU

Or maybe simply "@smmu"

> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int arm_smmu_debugfs_setup(struct arm_smmu_device *smmu, phys_addr_t ioaddr)
> +{
> +	struct arm_smmu_debugfs *debugfs;
> +	struct dentry *smmu_dir;
> +	char name[32];
> +	int ret;
> +
> +	/* Create root directory if it doesn't exist */
> +	mutex_lock(&arm_smmu_debugfs_lock);
> +	if (!smmuv3_root_dir) {
> +		smmuv3_root_dir = debugfs_create_dir("arm_smmu_v3",
> +						     iommu_debugfs_dir);
> +		if (!smmuv3_root_dir) {
> +			mutex_unlock(&arm_smmu_debugfs_lock);
> +			return -ENOMEM;
> +		}
> +	}
> +	mutex_unlock(&arm_smmu_debugfs_lock);
> +
> +	/* Allocate debugfs structure */
> +	debugfs = kzalloc(sizeof(*debugfs), GFP_KERNEL);

kzalloc_obj(*debugfs)

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 4d00d796f078..211a0c87507a 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -33,6 +33,10 @@
>  #include "arm-smmu-v3.h"
>  #include "../../dma-iommu.h"
>  
> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
> +static unsigned int arm_smmu_present;
> +#endif

Unused

> @@ -4909,6 +4913,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_disable;
>  
> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
> +	ret = arm_smmu_debugfs_setup(smmu, ioaddr);
> +	if (ret)
> +		dev_warn(dev, "Failed to create debugfs!\n");
> +#endif
> +
>  	/* And we're up. Go go go! */
>  	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
>  				     "smmu3.%pa", &ioaddr);

Since name is all we wanted, maybe follow iommu_device_sysfs_add()
by passing in: 
   "const char *name, ..." instead of "phys_addr_t ioaddr"

> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 3c6d65d36164..247f27426f6b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -733,6 +733,15 @@ struct arm_smmu_impl_ops {
>  			  const struct iommu_user_data *user_data);
>  };
>  
> +#ifdef CONFIG_ARM_SMMU_V3_DEBUGFS
> +struct arm_smmu_debugfs {
> +	struct dentry *root_dir;

Unused

> +	struct dentry *smmu_dir;
> +	struct arm_smmu_device *smmu;

Unused

Nicolin

