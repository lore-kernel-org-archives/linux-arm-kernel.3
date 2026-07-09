Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479C1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+cfSAL3Q4PR7oNTHL4eRQO4PHXRrP50b849gIYO7nw=; b=Q1m78jykCw9NcN/6sJYQLVi2On
	YUhd/6Dao2eUId9poDtn8abSYanJn9Fqw8C3dGs6Dl6jCiEfGQ8RClqwEaPkCu7hlgBpWOlzNybqc
	80KQTmQ/sd8mQwCQfWSJY2dmo70XD90/aVo1w7mtxZjH2Z/Ce0/URE5V86m/a/LMteG96Q0o6leEg
	Su+EdsheNSf7FWJpLHvNaOuKK0wPMlc+ejqo9DGd+yCc/BdEsOZqEM5HNjsqggXMfL3jgDGPcSKz5
	Cz9MitHcjyacCvdciExDYQ/AjcFsEBo+9WtO1xo1kKl3+rKpvUJB1mznA3wyQX/oRyZs7hFXAZfsq
	PuyAN4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whdmR-00000000lUT-2qYR;
	Thu, 09 Jul 2026 01:42:23 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whdmP-00000000lTX-1GIR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 01:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQ9OJizXG06KSniq0kBR2xAaeZQzQhkgZE8JWoyGCht+9AoVgMXgpx0xqN2IlB1OZjUAayUwdUCt9e+GL1JGfQezALSzjxe/ou2OcJcaDjlR+2a2j9iUqn8AS28m5EacFRDqXbKn9FP4n28xDfbokVBRI/tIbYvVrxi2VjwpgTKUi6w4VFyjiudZMSupqTdHcEaaMNOYmUuUge15SmCCYryQNhdJphQ3EOQLyrgcKtw5h/VbBCQzq7bjPIelDICD5btFpJNsGLME4+a6zflgyErv8OEkAuljMpDzLYn+t2EKfOfH32mxvhEoacRJK1lRnT6ZQTpPaGTV841OuaTStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+cfSAL3Q4PR7oNTHL4eRQO4PHXRrP50b849gIYO7nw=;
 b=pdUJwEsf7lt6LvfdQFDJzoxSNjXL2CSKRfj7MVO3gIR/wDCdHh8d8yT0A30tKv3Bzq5qOSQ0abaLESWbojyOxLE7alFCw0T+9QZmNt7mTxAk/g/bZaBOyUYbd5Y8SvNmwqH6542s5rajjaf/VwzC9tAeAtO0DoOUdxtrjmedtEUUwrvBb8tQOVpDDztCXKdCbOi5GIDUssqs4Q8FXvdw/y9KFzdNjMdvoqep3IhlxPUA9tG+AnMah5koZq+yn6JyKY9+MVcE10JmGtiiN6WMYwrjznf/DQceLsqUxZjN4sReOj+myk8Z4FBSXUyTL7uswDGlapHBILjbDuaWYYO6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+cfSAL3Q4PR7oNTHL4eRQO4PHXRrP50b849gIYO7nw=;
 b=g/MgjVCjmF5kBNXHhbkf1tvlf3gNrTvqMm9r5h+wGt1nOyLfRrvrfpX5bFUeesakASbxA+tY0zMMcgllPp8+7TT2knta/6IqXWtrfrSxviyQ/Lai6pdT8ES4R4MLUwKsrW3387S7ERRHIdcj07BNqh35EFBh/s9qI/4THPZmC+NukSht+4TU0Vjz41wrX/k8Bia/kvwRfC1lR9jewJLN/Jzu2XAXd9l+eIL40CmOG6MYVgUnqvxDK6yjDcuIhaifw/7bXAIvnP5zVxTyFIbtJtxpBCIJAxkWGBx2oMQC6VMcQIkEyPzCfPoWnxxRJNbJWU7PJCrRdpfzkOiQhdWb7A==
Received: from DS7P220CA0104.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::19) by
 IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 01:42:08 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:8:25d:cafe::97) by DS7P220CA0104.outlook.office365.com
 (2603:10b6:8:25d::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 01:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 01:42:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Jul
 2026 18:41:59 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Jul 2026 18:41:59 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 8 Jul 2026 18:41:58 -0700
Date: Wed, 8 Jul 2026 18:41:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Ashish Mhetre <amhetre@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <ak78ZKr1fxASWwl4@nvidia.com>
References: <20260609073204.1760077-1-amhetre@nvidia.com>
 <20260609073204.1760077-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609073204.1760077-3-amhetre@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6fad2d-7431-4a71-1515-08dedd5b495f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ajXzsSZAXB/VSyjTsrVTWIXSbWsPaLqgLRX6sLdXE0NTQ6A8UrUwJbDRy+oezOjlZtMhBLddB0M8jtCA1XckiUfVfAc4glkuMVm+C8ZUV/6GS6LVBB5rz0/WIU/53dkdT5rOl230nEZbXP7xRR2WkI3Ciam+aSBhYTvh0eJZ6Vi594wP2KI+DNoYdAZXHkcJBa4qBIIZ7NRaL7QI4Mv4thEx1f5JxJ/3Jm4DyUsvjINAnm1iIDds+X3gSOaiWlncIvtcYyHhvpHJzDpsb+uVKtHMHiWB7ET5MSPDBlvV8Gho9ioZFh26JEeSlJ6A2JMi2Sv7VwuY0fsOwhh34LktBAnhHCek9PAHRH0nj8nnHbbG4FHN+nbNJ9Il5HUewBbQ32kcY5Jd9lcZI7iTd/S/vr+j5EaJ6lPoCnEEPRKBcWy5Z/KVwiQu2HMz0cNnbh/iYMkmz8tCcByeQq4ExIog7J+zFyW06U6Mrei4Sjh57uFxL79uXssi+OuTHw+xRDkEWN+3y47T7X2qpWWhgb68oUwzpwxytgxTcU63+mqU/MLbfDKHg3fn2BlzCFREMQqewbypWmvxWw50IAklQgXk9TiJnWaddzJymAT5pxdCxlxpeKhR7qOXLjsIk5tEdKxN75TCvzyiljFEL9X+uNK2n/4M0DMruLXkzS3pSueaDGSoYbtoW2biOejVxq935sjsB5GlGLiXE087ySeM4jf4+Q==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1YfOaFnyp0NOpjABo9d7NWOFYaGHiC5gPQnZ7NG5ObwMmK8M0H9hpFhv/Wt35WAusBSnp/IliQVph2kbRR2J+ytoCy/BFZHOdxEkhv1gHjAvBKrHcVBEOaYtF+OFWABWpoByHBdneLiIgX97SXZ4moXZP/SdtcgKapm6P2ORKs6ZxkjTlrej/boxEM2HT9NtGEaEOPXF639Tp2DLKlB0wrs853fv1MA34RLioC6Tan+15Sgpx6phfswn7vnqMoDEMS8kqXYi9g1Hqev0FQCRPx4QI4hAmGyfCu45SMJ3QAWkCQQHGrl5xElhd37FswjVqvke68yR3ne27jq0K+VBD+98H+1hBqfOTVtMbVResPGu2oQnVSmx4RfPDK2+KDsGRkch7PbFbGCSYRkv1G9DFqvawSVaUoZyMpYZXpwEWDXEM18YFeDbSPvD1Tx+hrNi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 01:42:07.4595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6fad2d-7431-4a71-1515-08dedd5b495f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_184221_342498_864204E1 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, Jun 09, 2026 at 07:32:03AM +0000, Ashish Mhetre wrote:
> @@ -5303,8 +5305,11 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  	if (of_dma_is_coherent(dev->of_node))
>  		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>  
> -	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu"))
> +	if (of_device_is_compatible(dev->of_node, "nvidia,tegra264-smmu")) {
>  		tegra_cmdqv_dt_probe(dev->of_node, smmu);
> +		smmu->options |= ARM_SMMU_OPT_REPEAT_TLBI_CFGI;
> +		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
> +	}

This would be nicer to be the last part of the series. Since we
need a respin, I would change the order a bit:

patch-1 factor a helper for force_sync
patch-2 define a static key and its WAR functions
patch-3 detect per compatible string and set the key

Nicolin

