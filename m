Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CACC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrCTNjnwenGVMOVRAb51QVMbkhQ7EWMKLvlrn8cUGGs=; b=EC6vReuMeeHD60fCXZuYDh6DkS
	09k/SF9/fuHxoJxjHYSrpwc2R7v0eex7XeQWeSBLr4l8M7zUXY0qQMbnsP9KNl5w5nwipVcaa+AfB
	jCn9m3Qtzw0zoXCCYm+CwAymnyOJNO/TBkFybw09AKQ+t+zHlcW1HkfDmdqyuuY1tyNDVctj5VLSb
	MgDjAgAu4Q5DkLxTEZD90hMtQaRZ0qjAQwrLPYOB0uT0DbTpBFJb12T9cnQf8UXi/5ZXlJjt+Ag8S
	spwg3cbY1Qwt+x6csioZS217HPpoJMoRJoref/vOJJeSnwTvTdhXvYvhb9J+wkwj0c1GSp/4xEZx4
	X3jV64mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nOU-0000000AC7h-3OX3;
	Tue, 29 Apr 2025 16:01:14 +0000
Received: from mail-mw2nam10on2060e.outbound.protection.outlook.com ([2a01:111:f403:2412::60e] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9m2Y-00000009yNY-2a2x;
	Tue, 29 Apr 2025 14:34:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFijk4iV+GzPqNOnE4FpE5RU8IGU2oTBKrmC/BdIKkJiVHaAsJS3IbjtfN0lLt0kuITnrI2J1VRdE2OTHETQkq3eQnOMLedv3DPZ+NXTpU8N1zJYpQrEOZQoF4zNjaNvQB7s0GA7gsI+eI+B38r2IG6unufrWHFIR+r3K5ZQpcXlJAfD8kUfu0ns8QykshwP6Oh8TslwrD7IIMJwVKo9vq5/0pW6VRJMPwLm+zBZN8BI1OCIHVerAVC2zBUBATukc0q9a/iSOuee+PKgEepltARnavr00Fm4aAjjiLH5LOLrat4O01H1bfkhxXdDH5yvkXj9qI6VcuE6RrE/l88Gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrCTNjnwenGVMOVRAb51QVMbkhQ7EWMKLvlrn8cUGGs=;
 b=LUlL6z4SCUH8fsvDenhr5uIQMsWQNNLnQgzOvm2kvZpiOPE+k8SIL5jsvIQZfWBJg0XBChSrTFOpjRg5mgwptk1+xrwxTQo6UyaqvAw7doWarY/u3HjoVwESXo3JT91WPuuofwXcogmdnJVCf9d5ZTCAnBfZdlbMWHFDtaTYK0f+Q3Z1bEN2n0rWFDjaLTXjkt1B9eUHAQKRVQDcTKfhDtvB0Jyrq/urJKQ6mIpT1D6gbbYXudMBpyqpBPwn6E8U46joUynkgbYBSoSGMs969YfFLla5cK8YGH97fjwZ9rSNpjapqQmpWLdH0jwv5CDQKiHDIs4ZTHoUgjsavKkASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DrCTNjnwenGVMOVRAb51QVMbkhQ7EWMKLvlrn8cUGGs=;
 b=FyCPnuxAa4j7ydtj3OsQgSL/x1gshbCvg2LMI7g+cTKkvyjN4VGOM43vJCVtVfbNUaUSNf8ElWj/y+zvYwHFtlV+Kiv2gKETttamBR/h8vQFHmqstHBnqfAmr8Y+EfTuagvPHMHqh6d0pybAZKQAuWp5FRVyyJw11CW0WlMqWnNZ2DiKdB5FgVgJzJpiggo1dcEGC/eE2lMJjZRsc4joTnKLkZmAWdQZXaDzfla2lC2u1LH14ob2fVWKmDEDOVcB62MCj99FVDYyXMcxyErS/dOj05zW/Wi7Bg8waVsc+8TzepyR3iMwPPb0tuemPLuqQmWRVzTE90xOQiGP3kgLZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 14:34:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 14:34:23 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>,
	Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 6/7] iommu/qcom: Remove iommu_ops pgsize_bitmap
Date: Tue, 29 Apr 2025 11:34:16 -0300
Message-ID: <6-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
In-Reply-To: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:208:51::17) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 9446ac25-faa4-4aea-03ea-08dd872aec62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ttvPD65fJ76bWUO/LL6PfdkLQkhMvrkJ6XRsZsetKOQPnb0WE7cp2zza1v1v?=
 =?us-ascii?Q?toBKSUTcFCYSmmhplggL1PK7kmz109fvgnpzPBwhindJsr1xthHostgE7AnF?=
 =?us-ascii?Q?yP49RlsAeyPjDgFrXFiOuEXQlOiRMn7CJvDXaww+FpBiqGipJPUlsmPr0rS2?=
 =?us-ascii?Q?9NrKFAeExDzc59C0pwrM+nfwOQFB14R1dVDV63C5MSeqZR/pPZYtH5ApH/je?=
 =?us-ascii?Q?ExJDYHbP9x3Lxeg8kIW80dC2CiFOnR/XMZm2/TSPaivql60gr7Kw1w3a2xBi?=
 =?us-ascii?Q?XbjzIH3diVkskgOhsTHBoWDNfDalIxGOGIY7ZFRi4HcrzPWRjSYPT3Z+hVz2?=
 =?us-ascii?Q?PaPnuDwgAgSPDPrXDZ7QVcoy7baO5sXxSK1NNbU9DK9DwNLvWkCHyyCtFmPk?=
 =?us-ascii?Q?swl/68kaqIrGJOrzxqYOAwF/Q1KDt2RmLF6YcPCSYUwVqdTaKSGEpADk1/44?=
 =?us-ascii?Q?qeogCQCo76X1kFUWHzrMt+ZRkvxSdQ4E2lco8ZKRlCfIVe9bBxOKzpAxiVVG?=
 =?us-ascii?Q?NAC6i0LXLWs2AVr59z/Y0teRryt3ll9J3hQ5+b9Uk0ywRQHfRejWuhB6MTYu?=
 =?us-ascii?Q?AMJSX3Vq1twuoRDfIyMJuuwOtBYUO7EwUNQpZnWadAEIiiaH6Jn+KUQ6C4+Q?=
 =?us-ascii?Q?fMOttf8HlYoO8y6ZVZm0LTmQ8WyuAlTAvuvLV+fnk5DWdwod8LRStjAuEKKi?=
 =?us-ascii?Q?rRK3MJNh2caBIt6FTu3drt/8bg+S26k3pt1VKGuiJI+h8cKXsho5Gt19VKFr?=
 =?us-ascii?Q?e7utzoIUF1fxKrfDmv5Rd1gUjEZzdBp39o7fisXQRzU49CrnF9JCw3TO5TBh?=
 =?us-ascii?Q?mX2wPAvP0GvozkG/NDKen0DT1vtV6tWA3cIjjylPR3FemeGk3S7Mt2KlS4i9?=
 =?us-ascii?Q?3apDuV6ICaLX10OYAeQcIgkPIamoCHDWgXuvD5j/fH41VBEwJjHqK68gMDcA?=
 =?us-ascii?Q?xJ50/H1p4Kas1plM2u08w2HGlY9nqv5mMoh40p3CI2UcRjBda27aG5ZJZg+t?=
 =?us-ascii?Q?OZLOO6xbGT94SHkizmodBBnzsymU9U5F/0Uxknhl57uhjNz8L8BpPZpdjkmZ?=
 =?us-ascii?Q?VBbGL3t87Tt5kVDfoJ4hmb9kjkcpXMkE1Dy7sxpqWt1AMKDHt6VBdAZJlb+V?=
 =?us-ascii?Q?uezW+MwnVobexdA1RbBtADXIQ2nh/V7ubDrhDLmqzmVJ4JB/ag264o1+00yM?=
 =?us-ascii?Q?aGGB3ud/N3NmgYOi5h0Tkb5fKMw3pLdZVTlik+DFcbJHwfmlcfNWLGO6Zbr/?=
 =?us-ascii?Q?DAVtq+Pyv039WzJ5HGH5iDO85TDcTM8VOSjkro5xVZ3QwUFD24EHXgBERVvR?=
 =?us-ascii?Q?LroS4R2nBkChFC3A1a/1OaS4hukF5LIbqypXxhItA4BCVigxWEqZLTUEM49K?=
 =?us-ascii?Q?fvONrEBYg6/gSRzujbUoRU0SjJVWJ/x+vYoqqk5T1JSAoj4dKrvYtKFEBJfd?=
 =?us-ascii?Q?+vSrRkTOA+jgnNV5NhNcDtywAWr03SqWw4xU/VjJmUpavpnwoxkNWg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40eBm1SOE9rSi1Bq4T2XoCCQ3dEcrV0h4oipwFedsxoO0F/j0szXzLDrfwxB?=
 =?us-ascii?Q?8IzEmcgfzO0S1NA8/3uKDkcknz+w8RXdgJaSLwemQ4LSGRyeNb6yH70OVpdN?=
 =?us-ascii?Q?N5oKphuwY3/+DoiYRgN8eoH6PXQqJ/la123DWnpO+zN94A65thIyzHNAh/98?=
 =?us-ascii?Q?xl0nEcFrt5BlNjp6qBvPip0Ng2s77iUT8cPkzt5iXHwYFfeg4crffucUWqRK?=
 =?us-ascii?Q?e9LwlkALbUc/fzRyr3J7dU4k/Cl5pxEHgy6eIVePQ3iOX/RxBIjit9do3Fig?=
 =?us-ascii?Q?5Xbzx7weoBamazW5Pg3NvmDWGcIg3lp7xK0OtNMpsxFses4F0w8A8qjhTHQq?=
 =?us-ascii?Q?eLBiYBMw3sOA3jDXWQX3qSrNkCfH1u89lmOPg7enzNBv80P/D7U89qLPUJ4G?=
 =?us-ascii?Q?wLCz92cV2KsgQcrtam3j4T2DyHVSXri9PhOnSluK2fHk/8yKAlpHQUXBm98i?=
 =?us-ascii?Q?bjw+kkwlXm0fNcnLDRtvP5W51T1DuSlkQ8ewVap2lgJcKEx4qQXmH8XsF9T+?=
 =?us-ascii?Q?9z0zW9xSKR5G3HntF02GJ63TV9+Pt7qXHjXLmJuEf55h7r00O2jltsCqSK1m?=
 =?us-ascii?Q?iGTNJZX1lw1tPRwYrbWrqjZJaDFCHrJHkmGtDiHKLIux9bV0rhe7q5Dt/AZS?=
 =?us-ascii?Q?dLn+BKLPpVkagNf8K6GyeDE7jxpNqy0G6ODMRa7qM2fswN2wHZCytefjCqSR?=
 =?us-ascii?Q?TbkVAZz0ZHOpb7W7Jqt5QHVhw/TNtMhYigv+ofosAmS6xEbZseQVg+Q7iIdS?=
 =?us-ascii?Q?Jagrn9YcyZTXV3y4q1b0Idypoq7duIJVRyFk1k5i/7J2Xs5KZ12pf2F3PwYu?=
 =?us-ascii?Q?SnKqXvtWP2Dq4V6vUOgtkH0xEH3hlhXWQR5hRFH30lGKzvibdt9NAwrvSToS?=
 =?us-ascii?Q?mbYWx068z8rCpDVuuSWVMo4vkIp5X6Fv4rgFI6QhdYcG7jIbVmLThtll2GgO?=
 =?us-ascii?Q?5WakgbWdQs5GJWxRLJF0G1rThl9MZrAa8R/0UMm3XsrAO0As/F994S1TVa7q?=
 =?us-ascii?Q?Hx7Qdh5/lJ8fHdy8+oDMgLxml1uh5NJrCVD2CKlGGZBjxePyiGrpmswWCxJU?=
 =?us-ascii?Q?cHvxUKxkQkJQnMEvGAJYXUSlHF7MPCcfyDeoE/vAsVEyIaTHNyZdJRYJlU5k?=
 =?us-ascii?Q?HNnfwSRBXD5/Opu1GjUcOfXCMFZDf9JhxJHW1UPL8N71DJjTTZim5nlgpyn5?=
 =?us-ascii?Q?NtntIe91/sNq2e3yJ04gzgYIFb7OHj4RFBh1nvzkEjopVcEFjvaYvIKs6xNt?=
 =?us-ascii?Q?k/LBkoeT3R6Rv7kmU3YKfOklyWcsdmWTvKobvrxCojJ+UIRJatUrEhEfyhUN?=
 =?us-ascii?Q?Ki4cbti2oVzVidfivBf/RtQS29qDLILP35lA1ZGkssWhTaNumV9FxImnpIgS?=
 =?us-ascii?Q?IO9hF1ZjA0YmCx/hicB8NVt0m8si1v7R6cadjOf0Np5K+Q05mGzTulScp4u/?=
 =?us-ascii?Q?qfVseBDHDKS//ni/8maEmc/nQSFDhEtGSPdGlG2viT4redzjPw2wMiPaG2k/?=
 =?us-ascii?Q?BTtVBPsMhbX/nWkf4U4IbdQFh/EYMn4+Jly1/ENk7+n9eRacnaDq1LJIgl0m?=
 =?us-ascii?Q?udQiaSaQNfMkww5mM1xVJzp16JsRH/j063m/C5tt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9446ac25-faa4-4aea-03ea-08dd872aec62
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 14:34:20.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uazW8z0PqXODIAeWFdwFN9S5EL6pktTf3MbT5O1BU30f7EgErhiWL9aK3+AvIbI0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073430_652279_411F7AEB 
X-CRM114-Status: GOOD (  11.79  )
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

This driver just uses a constant, put it in domain_alloc_paging
and use the domain's value instead of ops during init_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 3907924646a20c..d599f778e9f47b 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -229,7 +229,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		goto out_unlock;
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
-		.pgsize_bitmap	= qcom_iommu_ops.pgsize_bitmap,
+		.pgsize_bitmap	= domain->pgsize_bitmap,
 		.ias		= 32,
 		.oas		= 40,
 		.tlb		= &qcom_flush_ops,
@@ -246,8 +246,6 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		goto out_clear_iommu;
 	}
 
-	/* Update the domain's page sizes to reflect the page table format */
-	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
 	domain->geometry.aperture_end = (1ULL << pgtbl_cfg.ias) - 1;
 	domain->geometry.force_aperture = true;
 
@@ -337,6 +335,7 @@ static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&qcom_domain->init_mutex);
 	spin_lock_init(&qcom_domain->pgtbl_lock);
+	qcom_domain->domain.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M;
 
 	return &qcom_domain->domain;
 }
@@ -598,7 +597,6 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
-	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
-- 
2.43.0


