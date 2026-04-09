Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C4BF36B91
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 23:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cR38fktjmmuDizJcVdHn5o6pHtyL6bIa69stdOqzxQg=; b=OBOwkWSjWqAVsB6MFFICMU2Ug4
	a3mb4nd0CSmOuOIPH1voYdlNuY5nNcvH5nJ5+zRB+tQPq6t1qc6lTrq+yKN1jqq7QuWShwX6foHB8
	pqZgDFvgZ7J3v2W7lILmX8gxV857I0p/XqGj0u+Tksym2opk1/zT9l/+Wc/u92+oci63miVNjQboV
	7ydyVBhrphEThBFxYtKaZ+NTeYIx03dIsJEV/Qp1mxpoihinMIJqjzMYcJJWqhNQVcAw6mpjLLewU
	PFUkrDhwALC4i3Tubx0+4IQSsUxW18q+c7DSGh+meAYk7MG41PaMoToc02MfhCOoai3e2ZSjrgcoq
	Nqj+l4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAyZl-0000000BJU8-0sSN;
	Thu, 09 Apr 2026 23:14:17 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAyZj-0000000BJTk-1qm8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 23:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0LpyMmGR2GUuwoSVxyAnAB8HmPqhF7nGCiEgEizYXdira7sLnjpPGGMRY/vaaGzuluID8k8JcL3zw+10s2lFrm6hicF8lpkI8j755W7zJHzXQx9vytmQ+jds2T/ZjJdEnJpPUFXsxe4P4ikXHGQOe+0X743yPUxCHtNQdG6z7w45mCIHuMuFAEfQQAgiCrezidg63fRRqxFghW/C+W/XnCznF7XGT7rj6XS2JsumR9ecusBy6CACbV91dWqusI3l2GlvzBxIisQqeqTx6lwpJvQIJ+q39S8yawwTD+m626PbtRJ3YhhUQsK8vAUmipGiAN3umov2nnJ8tFThT1Qlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cR38fktjmmuDizJcVdHn5o6pHtyL6bIa69stdOqzxQg=;
 b=K6zkgU+TkAyla31ZpLj+0qF4MO+Lzg8UJo1E+i/TdKMF89x5JbaqqKDCPzmqk8h5/FGqQAQn44qFsywn5mBHJJLIber8CwD7sNtxHQfOQ+z28haiVyMrKo/Fyw37IlluS8Shtm50S976ifRxCykhR2cxIqzVimMnq+P7soJ3GB5HjBXSIBAuRIm0QPjJ9QwU9uZEINTlGToW5pmaYgJLH+VvXjkGJ0+Xt1E6MnIEBgFE38mt7ElL+5S2gvVMtMa17zDAOBBV1OgZHHl5svv0tRYqJ5OhH75w06d4IOQZST/HgnyXF5EHmf+h43cq5+eH9ZrWLhjE4EFNNRlGxUS9ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cR38fktjmmuDizJcVdHn5o6pHtyL6bIa69stdOqzxQg=;
 b=nVxAGpNYeC9+q+kz+JUGP8fAkq7VNKl+PAODXLewlHFka0r+q/Zy9yRYdSlKAPORe1FKG+G2bZ+TLbUqORv9Rb97gZrzryw62KDrntXGElVqRJznt+0DIWTzPZS5fxEcxMiwzTBPP5Mcd7osqml7wiE76l8ppESz7yjzbuOdr1i6kVDB6cYAx8MbojTurNn+ofHoKAnBBsbh8Ifs1ablitdIfBxypxxxwzWWwRnMYizsI4ffE9C8HWUgritQfwqeB6iK2DfF895kO0O5kmcUTNKjXVikasIIGAWTQ+dX7yyK+seL0fs49gbjGCXxHObciS/gdoRQYds+AZ6qDLlu4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 23:14:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9791.032; Thu, 9 Apr 2026
 23:14:07 +0000
Date: Thu, 9 Apr 2026 20:14:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	praan@google.com, smostafa@google.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v4 01/10] iommu/arm-smmu-v3: Add a wrapper for
 arm_smmu_make_sva_cd()
Message-ID: <20260409231406.GV3357077@nvidia.com>
References: <cover.1773949042.git.nicolinc@nvidia.com>
 <7889322d41b1d8fa83bb318df2bd705a6241f6b1.1773949042.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7889322d41b1d8fa83bb318df2bd705a6241f6b1.1773949042.git.nicolinc@nvidia.com>
X-ClientProxiedBy: YT4PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: bbde1b8b-b39b-4d62-1a6f-08de968db322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: cmvJyILIc3C3zSezD4VT9cfuekMoEMJfnTTBpjk6mVHC9RyFEw1wteH4JkaQ31knhN0UwrGJt91WWwzF+4OSiFGMTSWrPPmZnzfw3/hMS515TiuOoXajJbO4G7/6NhvXp1DN4D2ZcDkGNm/Vnti6gkvfx43vlmI9OXBYX2Z8NfxW3NppZKOUBnAth4KLZ4XG3zX/xlvroANEiTJZ2T9bZAjYnCXmC5i4WV0Ma8zM/GCDCwwpjTFmywPVq/hkaSgsgnYPKIm8DrhxTBjncrknMCK5SrNBmMYA2RVGViRfR4NMUoejhrttiQyi8m9zvJOVpJabli94seW5+e9s6xCLmLN4yy2TAr952a94ECo+aILG6WSEMS9FlYJgPMWFJ61GxyO2duHsiXkBrM2gF42Q1tvyoKicVW/VN4im7H+mU2edlhTY3+xmDG/cwZrnxrW9k/Hww6aNtMlJaeEJ5I6IiolV2ISqTupyk5eRTFA+9e2UG7xK9R1Wj0CihNRf9f4LP7nE1+LyG25o+AjlrrN25WbMxBoc7ToQ44uQJdynKLmlXZ8LItHD1nAGRUKwnNCBkqSjE9K28zXIStx5bxGO5L8qyvTdXwPxvLWd3M7BIktgSJ1LfnZhlLA55maj4EWgOpZxpXibWUGcOJgNnIY4W/WsWFlvxFQmKXbIupaG8qBnKM7NZ0knrLls7wZML2FA2gwPGIhiZNAA4qEij6BBWULfTFiY8i+xmm/dxcOK2jU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c/8QzYwy3Dhv11+iVxtCoX+DKIwkVYbgCSwsbJVPh3+e+XlS8FDqWVhpffd4?=
 =?us-ascii?Q?m5GMWKUJKLO4wQ5lFbmNFCc3LYnoTLnJlRYrR/4fonzmRbl2uoufLT+GNpO+?=
 =?us-ascii?Q?LmFUYEumi7xQpQEC9uR9/N+94trDbJlkG9lNYd19dedeD5pdGtFgbPuwBrH/?=
 =?us-ascii?Q?mhmLCY9148L/IUJgPyVQ2EAXC43Ud+NlF7GSAmDz81lOuY683rkwVOTCiTQi?=
 =?us-ascii?Q?3Tdn5RO2DM7H0JAEOuY92IYBMEy+ZvC41RIoVqtEbwlPf+3Lx1D+FlPPuIWV?=
 =?us-ascii?Q?w+a0xENzTGxP4MMhzbbu+Rnhq1JxbxnDDTlh4KTsBEHFhuu5k/T3r90A88LM?=
 =?us-ascii?Q?pCl9Xy/0lVjQr9olcXeE7JvSD+aHI3N+9XleuYcPXMI+3RdbtxYHbV9DxEOt?=
 =?us-ascii?Q?qn3hS1waWbRDmjen6wN5Y6OtRTbenQ7R7c++X6WoAGjAOPf1AqgLHuwdhrHN?=
 =?us-ascii?Q?Qy0xwcIm5N2IICwS+Q+aLyZ/OEiIFap9TbT8VoA9Jhp4eSXKmS3M7cpvVWuM?=
 =?us-ascii?Q?GbBkPfCmFILXpD9l6gpL7mNOYdcXRbOrU7bRSyuz1P+In+Oe7w3R4zYqPU2+?=
 =?us-ascii?Q?SqHtudKDdhYNzjt+M1ZlRXNGl1OqFB2Giy/+j+NO/8TiRu9U2mDussTIjbXU?=
 =?us-ascii?Q?yWukyYa9vIurMMls0OZH3x9hmB99e2aWtGt5FTBafpae7IU9R61Xf08+Y/Zk?=
 =?us-ascii?Q?9pvwHJUj1WVpMhh220VShj58otWwxxiQqHdvTv43zX4lTXfzW9tPmupSAM19?=
 =?us-ascii?Q?sSCgRw/RosjZRZobphyO+OQ5/im/uRZSmMkogydtwyBVlDWdbkxPUEauyOOz?=
 =?us-ascii?Q?GqhPJxzXQCJPfFtmeGe3h/oSukbSxR5A+Jeq/vmDAgOuUMgXrvrVE47e3Pz5?=
 =?us-ascii?Q?ZFIP7sVIutWIA14eWLJhr5kUFTmcFSpZ7L+deB2oF0AkHH13kEsgLJOTXXFv?=
 =?us-ascii?Q?LElKKByVigLmhjf5f5pTPxlw266rKcsItcNxx2nSN3LJ2CzdKrZ2RWjUDy/D?=
 =?us-ascii?Q?9fa0tqPWo+Eb60Jpwpzeg0c7VT+pZIeN7gFdRY9t0aN8VbbGHjTvEP96BtyJ?=
 =?us-ascii?Q?GetpP7gyZvhFJm80Hf7l/YjowNxtMNcmmG7ykeZ8HkSO5wgs8ua+AJfbYJ7P?=
 =?us-ascii?Q?94Suy3/6Yzsluw9m5cNRF54/AWFVKaTMgQLbJ3a8Wscr8d5b0UcV3Mt7fG2W?=
 =?us-ascii?Q?W+AAdxxhtpwCrAxNBw5mBanvEi4KxDjkjzSF/jYCfv5jrotNwYR0S3Pu3thE?=
 =?us-ascii?Q?RXM2VMmWcbQrBuEcPZGl2Fhs6/uMZxl2Sj+dXmQvCs48ecu+9CowXA5d5CXJ?=
 =?us-ascii?Q?zGcZsV1wA/pv9z1HvKdIYKpmIP4JWxxcpzrwRhNsLmkaAXETuT8FmiIgO6v/?=
 =?us-ascii?Q?7rvt2/9kop92JsxcQ4jFzvv6vKCL1ZQ7ELBfqAKBvHB2DzP6dE37FrlnMQf8?=
 =?us-ascii?Q?YCmX/Mk18QIFhl0MtYMSEo2B9RkPHwtTb4UUw4283lO/yqe1nx7DesARWUhK?=
 =?us-ascii?Q?gG2tEiPfFzt66hmRGslHokz7k1NKXna+SMXxOVBDs6lkm2JsOAVL5uyVWzJ7?=
 =?us-ascii?Q?D0StiBDEWrc3EboHCTMGQQ69FA7uRTwRxOgK7ydGPPKHB5xG570qV1mg9WNe?=
 =?us-ascii?Q?uWbEORqetdfafI1Vju83b2/VFu0NCnND07cKkmApXvh3EfE6kBY1QWoNqWQe?=
 =?us-ascii?Q?rLQilSZ0Pl+mWXX9JEt0rIl8vBw+dyGsXjfgQHmphFuHhilD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbde1b8b-b39b-4d62-1a6f-08de968db322
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 23:14:07.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fBzT/OujuBuVAl+yK0myXoSG3uJuQ7b5y2mG3AH5d58iSMtDDm6gWNqYTqtj0hh7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_161415_476502_0A61E4E7 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

On Thu, Mar 19, 2026 at 12:51:47PM -0700, Nicolin Chen wrote:
> Rename the existing arm_smmu_make_sva_cd() to __arm_smmu_make_sva_cd().
> 
> Add a higher-level wrapper arm_smmu_make_s1_cd() receiving smmu_domain
> and master pointers, aligning with arm_smmu_make_s1_cd(). Then, the two
> function can share a common typedef function pointer.
> 
> No functional changes.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  6 ++---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 22 +++++++++++++------
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  |  4 ++--
>  3 files changed, 20 insertions(+), 12 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

