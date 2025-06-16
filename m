Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E9C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsA25X13WonFVcloDh3qjBXVCkIuWG2U8KU7irxepaw=; b=zZo2yuEaKHL0HtLxGvDVND/RYZ
	jBhqPXTIsjvNVRN5mcvNNpDdGcEnuL1re6DpvykUpYKVzvA/RtwEkpVCiUXo9XQL60R+jMRpmqQch
	KSB2fK7gsqYLCTZGAMWztsZIJqz55axtb6ba+Z40WuAJfZWEHSE/o/MMC9DNpJuqkPhrFCNSXKlca
	8hIfk0JqcJv9JbIFu+P/FrNW/mLFLXpNFwdQS0wAUizzKYgi9qwzYLd71mCmI1fUDSr+VbS9NslsQ
	hSbBelFD4y9Y5aDLGonW+ATAKh+5FFdQbFBjQo4F3MIIGwQUhSh6dMvPkVX6FD6gVhDxmjT2+bLEy
	VlO9qm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREZz-00000005Dd8-18V1;
	Mon, 16 Jun 2025 18:29:11 +0000
Received: from mail-dm6nam11on20609.outbound.protection.outlook.com ([2a01:111:f403:2415::609] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRC0R-00000004uyf-20w6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3XShSbbT4WK9TeXLU+8KGsXVQa35jKJ4O+ziN7G+lbsRyUzjPgo6v7d4EjdfwJiG2mbONTJo57oDKgosZ3qq9KG6mJuhaMP6yXiCLfhvDUv80PZYCsykczJUhxOgx1CnnfFhgVJGshyZCHoGGvSQo5QCFdoyRfnGaRc4WGTAnpVj1R0J6V23LtcdL5/bHfPJ1WfABhXcvpK2zmBUnYJUAkJRM677Zbi1sZnhTyZRdEKQrHVJ4g17vd8DM9dlfVnTDSh2ZrQbIkWy2ssqQGc9ftDjh9T9pWiRPRckD5jKRa1MKi1HhDG0nJPXMTqXACV7bPlR03mU3da3Ba4cU32Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsA25X13WonFVcloDh3qjBXVCkIuWG2U8KU7irxepaw=;
 b=qHfSf6ZGFRZxuRQCE7RiDZLEWIhJLZ1HddMk6PZR1wE4Q7S0t9ArzIDnpqKCJdbtw+oyzRuORfYlPytIm0BXre4un0JVqkYOMx50FjzMb32R2CQwxxp+QK0NXGAJyHz2/a+rsinFt+1aN82NZ+25mG+wVEMNchVZ2P9Js7HUtVGif2AGBSmd7eXOJJIlMph2+f5989561zoquEFPZaTlhyyynLfdo1AlMwCn6C+YMzgOTXGGSG2WYmL1eMRSGwL3jyxFieY/k+sm0a1gI/iBGdTJavSYMQb1EFjWLI0knWSUkY32m+sTVqsh5eyNHZA5JZD3kBHB8KulWzPjQ/O1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsA25X13WonFVcloDh3qjBXVCkIuWG2U8KU7irxepaw=;
 b=TXLUCNxvktyKc735X8BzMVO/TCAtGD3DW4LjeS8lnn/nEgmlPS3MKW79wfP5QQ25t0As779BX1AwJLdpxTX+CuI4fqtGvT7t2ueXZqWQ9HpjohP1V7HUpK6wDVgvCI+X6nDusJMakqILmNir8nM3/B8BQa6t3ADRk3hqDEcOzvwTr3mW8lnm3fXW2Om1Y2kh07hkkxbB0mG/KDYtzbWpu+XC6JH1+HCcaJQ+ZCaqiYC40AN8GkGl5hNwubdBzheVDozSiSCDplIGAaYZo/qheP7t+T4IGmNRGfbj8Vn47C05jeldnFjjcTxkt5G/xyNQ2yQkgFBPCVPk5voW+eVnew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY1PR12MB9698.namprd12.prod.outlook.com (2603:10b6:930:107::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 15:44:15 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 15:44:15 +0000
Date: Mon, 16 Jun 2025 12:44:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 23/25] iommu/tegra241-cmdqv: Do not statically map
 LVCMDQs
Message-ID: <20250616154414.GL1174925@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <c10eec6d48fd25579755973d28ba4a79a21bf721.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c10eec6d48fd25579755973d28ba4a79a21bf721.1749884998.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT1P288CA0028.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::41)
 To CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY1PR12MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: dc609bf9-5c8a-47f8-541f-08ddaceca5ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gQdWM2grO/nNtZ407RumjeF/zpVpCUXcgOKpXbcA8rPl6zHA/+RDDckfW6th?=
 =?us-ascii?Q?f4MemPzTXn4vFCANQEOc+fsjvnThM2fgJ4SFeypmmSKylNVu70A+UJSX5u6z?=
 =?us-ascii?Q?VchYD/UWd2aHuebgZBgqE3Yr3vXREtVH24rVeeBuV03aR1aU+hdZ7qYNW3Ub?=
 =?us-ascii?Q?Fw/G3uhZ/iuOJVJLUOTAhZERtplyyfKxgfh0M9ZOYi0y2nSYRGnHzbMd4NLv?=
 =?us-ascii?Q?PbdHBPaC4vGPyk88zB6a0z4k4k6PTfO7hRJVM9+Sht7+Ze7oclTfx0xx1vp7?=
 =?us-ascii?Q?XTWSdtl0tM1sJwGrHcn2+lhxqHgGcgV2p3sSY/XfwjdpxdNgMIB1Ulm9GtDm?=
 =?us-ascii?Q?MgU6GpCwepCH0j0880PEwIM5nZFa10PvBHJFNxTVTYwAyE4UfEu8tBqE/xLe?=
 =?us-ascii?Q?8emzDYP7k0F2tlDsy/F9tTqwNczTwMv3c4WJX121CuKvjW3A1oYpZvUN9Pks?=
 =?us-ascii?Q?5SfUFTVu5Lf/cjELWHJ6OIs1GaGOx3tKry1+VBs+eSVfqVpiQGqbfma7+XDf?=
 =?us-ascii?Q?OjRAn92akSv9NlJnj/dTn71NdPFeF8v4rNJzUZczJNkyNtjMF7TGSJDiFkH+?=
 =?us-ascii?Q?T1jjmn+H1iLCtLwxd5J4Uas0mQjK2f33QgT3se381o4pB4Lnw6Aihvd63uUg?=
 =?us-ascii?Q?sgUuYDKX11bell2au1U3i+LzB9AIESL3SZOxVQ5RQBHD9qo4tGnRETCCOR+t?=
 =?us-ascii?Q?A9AF8mDVvWhbwft3FVKLYp5fsuzs0SrYEyimCq1t5QJws5orUgeqS0c81y6J?=
 =?us-ascii?Q?mvnOp4g81EJpQB043R6NDyzPpuLYbGPe4Eed47ydeLWGOEQF4FJVlOtLvoCj?=
 =?us-ascii?Q?hw1llMwFRVr3onx+SBiKlvAgz47bm6vh3LuzcVihh0Ob4uJL3oACR3iSJ2Lv?=
 =?us-ascii?Q?Oo0nGtj6FXi3gTRlU5DRPojzvCEa/qMo8iGWe+tVenGEzOXPK7w6zRG1yxqy?=
 =?us-ascii?Q?pnSSU49X9fHrli2iAto/OKy6B2Ph8drD4PiH35jNzhKq1nJkyLHmxywRGkqa?=
 =?us-ascii?Q?ci6ZU8ETZpZ8rUM9l5MMFrT8DuvESRSwioh9tI2bj5sXRUBNjWnuWnrBQFp0?=
 =?us-ascii?Q?k6njaopHaIbDBtLrHmDw/SwdHw9aMUbTP4RtLxr/LSxb5WDvDzfOW2zZy6Me?=
 =?us-ascii?Q?y7DWX+PrnC64i5o08SeUtazCCWdmL6br/jWQ0v15hx/E6l+H4PWfedO1W4cm?=
 =?us-ascii?Q?SR/XZ15dRPryYyB1YKdUMK+8XaqBcRvz2calOV8LDMeALYU7PagvsL3iHLrL?=
 =?us-ascii?Q?BiLuBw75RYZHb/aKk/qrKpMTPezlMEeStTJ8vPocSJq4aPwsymcMR6fJ984l?=
 =?us-ascii?Q?yvqVEccEZqRIexOsGfJv/hXXxTa2Jd8RM17dmcIlz2L6uTq/wHX/I5BeR4iH?=
 =?us-ascii?Q?QA63QfAjmByIHKhB0zMC7g0rsOwfk6m7grFwTrambTQ1QNMmnAntay8hNvM6?=
 =?us-ascii?Q?WCSOpT9ZK3I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8FeeCXINH+x+ktoMjjNsTTouA5244aapWCjhZbX58LI5IRTGTtbnSCRrQM3f?=
 =?us-ascii?Q?XsIfxnA1LPUFwhecl2qxV4ySigJXrEppL/9X58usYMhnKKCcz0VsWk/JMM1e?=
 =?us-ascii?Q?XdfASmi8Ub7a1BGj+oYD71uzFtaOHp9woUArgcV5j6ly0fduoka7Ec4XzeLW?=
 =?us-ascii?Q?Fg8hlMzYRoDARZ/opN16C+k4Aj+MqnfM4V4BjNolUg4Pa8iU/de4w4DlhBBv?=
 =?us-ascii?Q?VlXD6vwdGxEh6QoHTLYunYFu02t0J1QbVXDnBb9lBNYtCex+ujcxjbEMtbCu?=
 =?us-ascii?Q?T58kGt1GfhxDj9p44uGXvB87ConG+/JMb+KUO8ydoSXlzIvlC4sa4mH4f9/C?=
 =?us-ascii?Q?3riEQQXvuuYiGkNFIyZxtRtLbDu2o2FIBNrEQ9nJ3Ta32ba0Etcm/qfhNwe6?=
 =?us-ascii?Q?pfFHH9iuYMklC7YWr3UxbbvEuOnCdMeWx7LRRVyblrGbj94+eoFE0on9uMlx?=
 =?us-ascii?Q?1KgYTwYRz42wy8G12yAAThf2wrbZ7gHaTY2FBbp4pMDAFZtY6n4g3sM3Q9YM?=
 =?us-ascii?Q?O2+m5xucQEt1f1FbOLfPOI0j4UQ8lcZ7Aisp+SZNfB2I8fmqlDwuAPeS/DOu?=
 =?us-ascii?Q?8yuzzzpcNxZrIxQvWX9OjCHj98T3jllzsNTYgTVsH+4/oGZkid6daFBGAyQt?=
 =?us-ascii?Q?gKOPf78iq18vgYOf1OZWVSXBWUVeQb6RZItlyqOAvhSu1gEn6Lm0SV2A7g6w?=
 =?us-ascii?Q?OLu762PK5bZ6mAVReMcjxsb2mY8PREfTghmX/u0KAX+WX0Z0z+kfRywC/m6h?=
 =?us-ascii?Q?e8QNoLIAJ8i6nhxYdI6+NRsmXqziN6BlC9jXdg8FcW8Jo9C7MX46XVXn0azh?=
 =?us-ascii?Q?1Qyh5d2A/McWqhQj04HJRc93xKWEsBEB6l+d6zO+Jpzc7quJuzqDbJJY+ykk?=
 =?us-ascii?Q?sftVhMGh6/ueejBmdjc7PezpUolCSCK7Be1WtKKjPTnNjANhUE4t0fmzbnfw?=
 =?us-ascii?Q?t0WoAqGVORqZd2ajPyjpQbLQIxLRJQZrqC1Rh4lsBpyloaI2k+AJM/SrG2Px?=
 =?us-ascii?Q?sK8MfKfrDdmuYqHFM+OO8tUNQP9+dhpYzwrd3GpuX7ODPkqDEFSYr80JJkiJ?=
 =?us-ascii?Q?IaB45g4ZA5PkZw7qaZV0K3yeygIZjEAzfiUd+cvwW65eCph4q2taXtm0Q+sZ?=
 =?us-ascii?Q?7QtQKDIcDGKWhTicW0+5mYbswfyWpCb9r1QotHHmhxR4Z++QgWjBXi3FsjlN?=
 =?us-ascii?Q?VCqIjcWf2yBtty/9oWlu7jI9t2xefGYfTu/IHQwEWpxlkK6ILuaGF74jV0bT?=
 =?us-ascii?Q?YY8xfPxdok49UsmGcWFCXB/H6qInzf8b6fyikIRKUWarRk+UjGr56nIO7b1r?=
 =?us-ascii?Q?HCdsk72haXhQ11inOjR9dTtFfyPz3hd24F/kCuikRjV5w696BUBNGbHY64OV?=
 =?us-ascii?Q?K4DK4RhB3jaY+190fQlJ9FMNgi//sutXX0gmMFPrEZpY9sj+8wmul37NXdL2?=
 =?us-ascii?Q?o7v5w7tkAEmc0FmJVCo97I6RNkQTsLAHfUVc5W+4+PLL5rWIOltgqb9KzX9Y?=
 =?us-ascii?Q?r3n/Uq4Sfg6C97herWqyvCK6DkMLw4BIfbPjH3hLJ23DzPUBXi6m+SPsGHD6?=
 =?us-ascii?Q?ZElU8gRBeanODCtuIm4l53pccdbVizaFdrt0vEjg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc609bf9-5c8a-47f8-541f-08ddaceca5ef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:44:15.6021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PUXNeK+qf6czD05ig1Wkc+MCl6WJkdOQfl1X5k2ezsSSC/wv/zvRu76HJklboZdl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_084419_523647_97B8C485 
X-CRM114-Status: GOOD (  15.19  )
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

On Sat, Jun 14, 2025 at 12:14:48AM -0700, Nicolin Chen wrote:
> To simplify the mappings from global VCMDQs to VINTFs' LVCMDQs, the design
> chose to do static allocations and mappings in the global reset function.
> 
> However, with the user-owned VINTF support, it exposes a security concern:
> if user space VM only wants one LVCMDQ for a VINTF, statically mapping two
> or more LVCMDQs creates a hidden VCMDQ that user space could DoS attack by
> writing random stuff to overwhelm the kernel with unhandleable IRQs.
> 
> Thus, to support the user-owned VINTF feature, a LVCMDQ mapping has to be
> done dynamically.
> 
> HW allows pre-assigning global VCMDQs in the CMDQ_ALLOC registers, without
> finalizing the mappings by keeping CMDQV_CMDQ_ALLOCATED=0. So, add a pair
> of map/unmap helper that simply sets/clears that bit.
> 
> For kernel-owned VINTF0, move LVCMDQ mappings to tegra241_vintf_hw_init(),
> and the unmappings to tegra241_vintf_hw_deinit().
> 
> For user-owned VINTFs that will be added, the mappings/unmappings will be
> on demand upon an LVCMDQ allocation from the user space.
> 
> However, the dynamic LVCMDQ mapping/unmapping can complicate the timing of
> calling tegra241_vcmdq_hw_init/deinit(), which write LVCMDQ address space,
> i.e. requiring LVCMDQ to be mapped. Highlight that with a note to the top
> of either of them.
> 
> Acked-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 37 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

