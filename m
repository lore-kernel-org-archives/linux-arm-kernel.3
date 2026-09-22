Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C170AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6Sz1mrodB67BCGD8KuRgQFFSPrn1VtLf2P4l/t3W7g=; b=QJhOo6DayUL2BU7L439cehzfJs
	TVa6JAReF4zX5KIc31wuQE3IopTpp3EHDDNaRWRJFbvnUbsFBl6Y3wVbpge9QpYcp5b6EtlNTBMB/
	QWqDqu4wm+thFm/ibk57k4N7g6Wd01EnHx6dl7tOBZux008O9ToHiRx+FHoNgUzdiaO3+q6sb82JR
	AHzeT9xEI3P6ela8qdBUrIDMVbtiq7r6Ly9oGgDMaEOF4CjQ9FPXF5Uz/XArpjfTYhKqFNMt8FpqL
	A7HkRHYtW8TUUdQiPOsEoUDVIkwWNutTpongrSONoCZi8kPpP6y3Zmqk3xTvnuPk9klSWVREQBO0n
	5C5wt6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96RK-00000006RdN-1dKh;
	Tue, 22 Sep 2026 19:46:06 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96RH-00000006RcJ-2Zrp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:46:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+NH/5AhJx1D7+c3hhyf7RSfZSWQXKZiIC+LwGNdmmIb1nqaghZR2XKO67aX2te3YOhDv5ac4i5RWxXslk3qFONZ2ZbGjguuG3Y6vPKkMusnOaE7SjJnR+bAszQiSSXZY9E8w9AM2M4UAYAMtau/+KIyTu9aqlQgQzkRrWq/lrm2c1ZdXg5p3Xd2OzzUWa5JCv+6PJz08zPFzR209dfoyIPF6NwX3tFRdm+SDEic/iA+0+auDd7QBz8zWCI0MDzy8+ZE/huJuEhiFkCcuc5Pt6zDbZzvn9ls/Is75cJEvBxy/Lk8vFS6xmTjKqinMkkabBwZoienDfpQq+IZsNpXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6Sz1mrodB67BCGD8KuRgQFFSPrn1VtLf2P4l/t3W7g=;
 b=gJmEvp3MvOFjikj/Mg60sMtokJVcfUJow4oxxYkCQEXMMtwCGA5XZ1TltnHKmmPqh59DThZ8I5Yh7xLItBHt+T/YH0v+OXWLTfDvAR3aNe3mvT3V2zsJqn7xG5YYOhA4PoyVuCCm/3Po+66JKNLq8csL5YnA6t7ZGr542TOC0hRouFLMdCjlQqWuDT1/MKKEIaaRkKHOSyEZlbngoQcRBn6L0LUrIu11dhwKMKxEffJz8sCW0W9ozZVK1/yRQZVSGnP7on7YgfT6gmUIyGPL8UaCgax9CjUdItdFoRxTgBshuMAGPRYPVyxr3iD6jm4v1enehjzQLI06sV7lF9n1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6Sz1mrodB67BCGD8KuRgQFFSPrn1VtLf2P4l/t3W7g=;
 b=lh9EhdV7vKal0a6Gv/sOc5bHnArsRkvX0obpNanBP8kb6xyyY4+bbhPI9oSgT8+ipCuD2vdLb7v2QLThK6RgoDND+sAUKkuTbtu1R/8q3DXk75CbRYU0PTljkG1erTZJvJkLPQUzxsu4LKGMm6A2Gr7L+HvhaE3X1KIJAeX7VRIApxkH7C6YK0/HN779+xAamTRHRxPQGquBpOK3Q89e6xZMhRDlcb/cXlKMJZf7WrEw9NKqJjVkgLEZMD6Sm4PCYwoXw7FMVnmtjgaTro+Qzf/hmlh5Tjc8oIH+scgCe/hPuPB8WZ0mJx3xuoDCnGdiPOrIJJqxfSeJwi7Kc4Y6bg==
Received: from MW4PR03CA0032.namprd03.prod.outlook.com (2603:10b6:303:8e::7)
 by CH1PPF6B6BCC42C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::612) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 19:45:53 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::aa) by MW4PR03CA0032.outlook.office365.com
 (2603:10b6:303:8e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Tue,
 22 Sep 2026 19:45:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 19:45:52 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 12:45:24 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 12:45:23 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Tue, 22 Sep 2026 12:45:22 -0700
Date: Tue, 22 Sep 2026 12:45:20 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Mostafa Saleh <smostafa@google.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kvmarm@lists.linux.dev>, <iommu@lists.linux.dev>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<joro@8bytes.org>, <jgg@ziepe.ca>, <mark.rutland@arm.com>,
	<qperret@google.com>, <tabba@google.com>, <vdonnefort@google.com>,
	<sebastianene@google.com>, <keirf@google.com>, Jason Gunthorpe
	<jgg@nvidia.com>
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arLa0E3xq5dGuPpd@nvidia.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260922131259.2975334-5-smostafa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|CH1PPF6B6BCC42C:EE_
X-MS-Office365-Filtering-Correlation-Id: 603dba0e-2a2e-49d8-1e87-08df18e21c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|36860700016|82310400026|23010399003|6133799003|3023799007|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bry51cB9yaK4mFupMYcvnCIRtKOxafbsVlytUvHI0VNTqjM0aUh621EQqL+4oUXgqWWBO8W4LDzg7Fc5RaoVmTzoPbGgdz9gQj2dQfUAZgSBEtSBWGnyaFEWO2nv3rMYkIJXQjhS2iQO3PLVpny1HZMonW+wP+I0WtUv2i6D8bNRQWsxewwQUWloHNWHAfAeyPAYoR+8ebtlozrak/DPtyHYreWAsB1/dsamCu0CUH4/DYMgl0MzwhwHRdLht1XtkTwccPUGEAE/QCDGbbe1+yABLFFLmsQAJNHxD8tFhKBM87CVQ38xHOrL9kOy6QhIvEkP1IbSquM25BgJNfQcxh+xmu9XWlTClDXfenK4n18zbthSXg4m9Gu6m71XDFUT/mpyeHiO7e/nwe002vUP8eJ1Mnh0ViEH0gSX4793cuQLZeUj6rUspbtkIGAb8YVw2C8heqXCVFgJBxsupxvuDL/DwREciCALBeNjAGASzMKPvA7ZkEUJ71lJQji6hdloQlevhT1/8ffmtsdT0CcFJmP2f2c9AAwIAuhkUK53u5inq5m2glrE3g7Hxx2nfFDipAwPYyHrkBDTZWtBORrNcYBFFq/ZHLXsMYJ2oBBhnHWCT00ABUGSR9+OybUugGGqqgse1TJayBHrUlNpzl0naMjnrRA1IGcv2aNu0gfBe07XBNqkuVmHm3jXuLSx5bB8JGLyVQVWctljG9ezHLzVgw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700016)(82310400026)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UgaSzjYVTYsa8G19ddVHwvFWzKm87VCJiWZizfOUXxstnyoMwvvcU9PFLFU86Hs3WRz813Y2avHti4K5Dv7WnNvH59NizUYe1f4yoXnl3mH7hQDHY/5uatF4jqIbbRo6gWPX/xn1qRy1BFSzmHHOYorXua1mVgJssAbpbRZ6EaeVzlTNxdsfTcbzZMdMcqmc8Rv/BlFpkAoJMbJGzJO7+pHJ+1g0umq5BVtzip6yOSgcxTa9FbuvEb4WT6k3VSSps9yBE/F7xp3b1YP8tHLN7VQ3XGTU8oIKgBQ4qqfR5JFBJ9NexAu1jcd4W9v/Dkjn+T+abwiwsATtvrFdMli2Egbl4W7bQwlbjmxsL8aqwrWInYPnlftILCJ0TTRzwl00pJ4W1UmEbbB/J9xFKkBUKHWKGDg0jD9VkuXhhglATg01vp7mCKrX02nvJkr6+EX4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 19:45:52.8128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 603dba0e-2a2e-49d8-1e87-08df18e21c7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF6B6BCC42C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124603_666781_C845E861 
X-CRM114-Status: GOOD (  20.64  )
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

On Tue, Sep 22, 2026 at 01:12:37PM +0000, Mostafa Saleh wrote:
> Move parsing of IDRs to functions so that it can be re-used
> from the hypervisor.
> 
> As the new functions operate on structs from both the hypervisor
> and the kernel which would be different, we rely on the compilation
> unit to having ARM_SMMU_OBJ point to the correct struct; some

s/to having/to have

> best-effort static asserts were added .

s/added \./added\.

> +#ifndef __ARM_SMMU_V3_COMMON_LIB_H
> +#define __ARM_SMMU_V3_COMMON_LIB_H
> +
> +#include <linux/build_bug.h>
> +#include <linux/compiler_types.h>
> +#include <linux/kernel.h>
> +
> +/*
> + * The IDR probe functions are used by the kernel and the
> + * hypervisor drivers where ARM_SMMU_OBJ might be defined
> + * differently.
> + * Ensure fields used by them are defined and has the correct
> + * types.

s/has/have

We have 80 cols per line to write comments :)

> + */
> +#ifndef __KVM_NVHE_HYPERVISOR__
> +typedef struct arm_smmu_device ARM_SMMU_OBJ;
> +#endif

It's probably safer to include arm-smmu-v3.h so everything would
be self-defined.

Also, Jason's suggestion in v7 was hyp_arm_smmu_v3_device, which
looks nicer than ARM_SMMU_OBJ...

> +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
> +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, options), u32));
> +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, oas), unsigned long));
> +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, pgsize_bitmap), unsigned long));
> +static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, base), void __iomem *));
> +
> +void arm_smmu_device_iidr_probe(ARM_SMMU_OBJ *smmu);
> +u32 arm_smmu_idr0_probe(ARM_SMMU_OBJ *smmu);
> +void arm_smmu_idr3_probe(ARM_SMMU_OBJ *smmu);
> +u32 arm_smmu_idr5_probe(ARM_SMMU_OBJ *smmu);

Can we use "arm_smmu_device_xyz_probe" matching with the existing
arm_smmu_device_iidr_probe?

> +	if (coherent && !disable_msipolling &&
> +	    smmu->features & ARM_SMMU_FEAT_MSI)
> +		smmu->options |= ARM_SMMU_OPT_MSIPOLL;

Will pKVM ever use MSIPOLL?

> +	if (smmu->features & ARM_SMMU_FEAT_HYP &&
> +	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
> +		smmu->features |= ARM_SMMU_FEAT_E2H;

Why is ARM64_HAS_VIRT_HOST_EXTN left behind?

> -	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
> +	if (!(smmu->features & (ARM_SMMU_FEAT_TRANS_S1 | ARM_SMMU_FEAT_TRANS_S2))) {
>  		dev_err(smmu->dev, "no translation support!\n");
>  		return -ENXIO;

This change seems unnecessary. The code above and below this line
still uses "reg" returned by idr0_probe(). So, the original code
should have read well:

        if (!!(reg & IDR0_COHACC) != coherent)
                dev_warn(smmu->dev, "IDR0.COHACC overridden by FW configuration (%s)\n",
                         str_true_false(coherent));

	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
                dev_err(smmu->dev, "no translation support!\n");
                return -ENXIO;
        }

        /* We only support the AArch64 table format at present */
        if (!(FIELD_GET(IDR0_TTF, reg) & IDR0_TTF_AARCH64)) {
                dev_err(smmu->dev, "AArch64 table format not supported!\n");
                return -ENXIO;
        }

Nicolin

