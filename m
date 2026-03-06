Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E470FF01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8nMX+L7MpY7ICYB//TUczTRaq0rIhtAHdGpAHcEVKE=; b=xIT1Lri9imdng9FqYdyT+L125h
	OOyxJKXHCI/1Rkh8/WHBgRUj1RB1xbP4O053izKL/syx+JkKQbm4I2a8yMiunCPN4GbFrd4Zd5UjK
	Hfa2XXXpkHwUmp06LTew+MaMnX+9rLY4cBKVI3539vXXTdN1rOQQLVHDJsC3CLU+id8J6fN6EqX5D
	hkVmOADF2cxpt5M3kJy7QIVvjP72A1RIZd6ZTDfuZqqsuckBJenayNyvexEQuP38VNKg/HeRokfLn
	R/pJET/04xxRIWz3uzBF5eTg5WvRPHCemeZBy9DWJtSBbNc0ija1I3fEbkLKeiyg2H/cdjSuV3xFy
	dmyokVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUmu-00000003hyw-1dPR;
	Fri, 06 Mar 2026 13:00:16 +0000
Received: from mail-westcentralusazon11013050.outbound.protection.outlook.com ([40.93.201.50] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUmr-00000003hyX-3q08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vi/4IOkyJ9Uzg+TpRIvRubyKkGg1GA0dq4ExvMhohZXCqUonyP1uf8k2TGGTyl38u+ljQOe7ONrEJVjqrHl6DU6qq7Ag9UFCH76dY9RvH2BidcLzD2e7bkq+zB72ezUlRG6hnt1SVIu2h1KNd77IiBY3WH7vLhrPsucBF2HHk4PoAjJlYlaZDV6fL0iqRqWEaLHWrGjekv/QtfLx4neQM83ft0uIef3PQU8PxkrC/qPgJCynOpznJoiUDmJ3dvPaSN91XP58oYKGeZ1SRyXvhWw5yhk0W0cZ8byu/AXeB81sGvOqxIVYI6smxO/7zJAoavl09swESGS+XsHHXEA/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8nMX+L7MpY7ICYB//TUczTRaq0rIhtAHdGpAHcEVKE=;
 b=CBKymy4ior8yuuKSNvl2bdoCSx1NAH8TIikVPa6CSrd91xY8sRjP9a1/mC3bZKha99Di7+Ypyuc8zPH7a6UJHPuW0X37vKc4ker6c+y2ChkoDIKjGMMkEiz1oe4Ok4VqMPcc6KzAQlDH/FiEhmbWJX2OanZFUXAifwEoCQVPQHwqe3d0iLzaSmp7T9bKk5qUdrZoZ9vukVWA6qCM8NE6G0EYdPY33ztH2Muxe9XwizSJI0DF/qAUZagdX3BdillDtX3jKXIbZvFUqeLSW+JtvrgSkLh4iW4L3FotLVhQmlPBS2OrrGyskJJXXthbgDjGfVp+yTiOR1KH2K1dSWPQxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8nMX+L7MpY7ICYB//TUczTRaq0rIhtAHdGpAHcEVKE=;
 b=mPaF62tyrlkgImYgvXFZX+TRJXL1pPFaF9vQ/ZI8uWQ1YTke6C36EoVUvrUOoGMO8pqsd3h5h0stllbs1dZwGOYRxW/jIhBJ61LcHi/UnLv+N+Jh1EIyzrh+dh4co39puy+70eRcBmHxk4coKUspE4uHVrv3pWMxQ0Sanryk+MV8xEpc1KFA/GglcldN8Y4AMs/hF7q8hSA4IM26RUvRaU6W6sBH9Hf+QuMMG8wv7Y3UMaAHhZQsoBPcqw9U01bGD2T5b4b84oCWcuo5cDgXFUjhR/Tx4nN4tfU7aMrfBX4LUtG7PhBPkR+LMYi+RnR5NwbJp6jIIcRTHNyEdPi5sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BN5PR12MB9510.namprd12.prod.outlook.com (2603:10b6:408:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 13:00:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 13:00:07 +0000
Date: Fri, 6 Mar 2026 09:00:06 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	rafael@kernel.org, lenb@kernel.org, praan@google.com,
	kees@kernel.org, smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <20260306130006.GF1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6416b7fe-0190-4c7b-9a62-5da7d5eea794@linux.intel.com>
X-ClientProxiedBy: BN1PR12CA0022.namprd12.prod.outlook.com
 (2603:10b6:408:e1::27) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BN5PR12MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f5426b-5814-4e2a-e23a-08de7b804ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: ++ZfiBMaRKdh9NcJ6hdoTIrs4yUWTzYBoUC2AI1UzoGpEzJLVXZ1pFdz5Eba2c0z0e25kWgpVZiNYZoHEKScy+45OF9IUuqDy8gUaxlfRpoS/zwE2Nlv0CLSjgbN7OuhLpmOOvcrMN+5KK72h3Wr6yYiEhcGLVEo88aqAKgNw8B8kmIR43vtJ9Cbwb3GgEWO1URNmAEJ4tEJ4k0EEXNs0DZ4OueWeTxA/9Znfd6h2abl8ByTlx0xYtmdSAILpUOEZvvO3+Uh++SjBajDKOiS6FZN3XOzblIlDTrMHuyX0PQnc4a9YKLi+DFgO0rNraZVzHS/jDFM8+oI7KriQrwolJVZjTg4LG3cwAsfMya4zCsVOIsFHQP6VgETK64oxwYdXlWypUKiOSZrsVInI+objYJe1sYkIKzaCge9S3EZEa9sYtknGYUWHjESc/G2VzZu32WjidpxmnrBc1pq/Njv/Vx9TyLPJi/qpWOUIm60dlJOo/PrqXpgvGB/D+QFSk/dNpDqE3hT53tfZTa/wxuqZTsyCeNXCsNxqeFQKeg0nm5NyqBkrjWk8bWxZlWnPntoK3I26LsEJ3RnLuK7hAk6s2CVHEPC9x/hZbIfUNUhmjr0FnHSTM1FaKrmT/V36P6jopNyhUIDfy83ElpZ3i9cVu4GatLRfqE/MBZZ1aqEtakeVlvQ8wVaBZIJ2ajvZr+Szv7xriVoXjz7FqChlBpRWSj7Y/x9F72Es7o79s6uKP0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3lzS3i1DxHUZPNMxrMU5HwGlCeyjnW/QdOM6OJcFBkoA5lTuOI4fdArTstuR?=
 =?us-ascii?Q?4z22N5nLpeY/60fF5T65IY8iHqvq6xu0cQHTwvwP14FQsYsHeicZGinC5tXJ?=
 =?us-ascii?Q?gTnhlFduGNpeZMWErXm3H0OTDUCDBzZEgxcpecrIlgF26IPv23Dkg+NDwf0H?=
 =?us-ascii?Q?JpJKaoK8sttsjwKYATuhM7uL4Urb89LJu0xBWgU2SxA4NAOdG/Cy0+arQ2gH?=
 =?us-ascii?Q?QzluyUuFDwqVXqRzgr3EIebUbw4dg/fpstpnnIqgBQfpCa3BUN9XmRYrjbg4?=
 =?us-ascii?Q?Hk6laBPVtHKu8J49+dlqWSxCWgby//mqjB0n5GIdS3chQUI44x2vnH1XEuKo?=
 =?us-ascii?Q?5VxPitfSxTadNaSQtXrBrlAsBDol9nf3h66rl8HuWkAll2+gJ8P2aQmviRtx?=
 =?us-ascii?Q?Y0ok1Sag1xcNIAb992QSBQbrcKPoQLtWQnAuIUu06O3Oz83KAc8xFWqM2naa?=
 =?us-ascii?Q?PaWzlsrhPKmFo7uEiH6MC5WCPOIVmdpq57ta2vfLaqDiiH6DWImoF4QKjXit?=
 =?us-ascii?Q?aKO8C0S1M5hBJbSI/XDAolvwOUxskMW5yiIaTs8vnaFrunGGeGqoT61Uff2Y?=
 =?us-ascii?Q?DKrjcBYG6gLPSl0kl0gI93DGHjdSKqpXDUnDt+IZYKRcJXrfIRPPYHfJaEgc?=
 =?us-ascii?Q?hWM1WVpPh3Tab2Idw2tTzv0rH+GQHgDbTL8Kw/inwLY3wqsSbJ/xTdc00LVD?=
 =?us-ascii?Q?F0nMM6pVy22Uomny6NB5os+qVTLtbeLfdk4BxlT8kuPcwzfRnHA862/hyreC?=
 =?us-ascii?Q?coJxTNnmvzpZ6Xlkmvw/cfSqJs9KoHRQNUoIZZ+CVxbZFQTJnbR9KqT5IZU/?=
 =?us-ascii?Q?Fp+PKIRFaWxvnXgkE08Ct467pIBXd4+Zt3fOkuuoAuzWnn6RK8Da76HUoL8I?=
 =?us-ascii?Q?jlxDb4R+BYaCNsILaa/sghEPjQDgxNFaSJ74cu1ivdgLTvC86xQKZ20K2AA5?=
 =?us-ascii?Q?8DabPGzS2CLtTxRqUwJjKztsYsORIlT41P+8hkrkrYijilRHDi4Q6IKvauDO?=
 =?us-ascii?Q?pQTJf7IiGyaKcV8fREhelbxmk+3iuifbOPqn9qv0GUYXGf5/RQXidsHrMssO?=
 =?us-ascii?Q?FBOqyye+VjDRFxVwGpUonPRr2/lNXp+PHyiA0nH6qy5+dNDFQNmwDgZm8LVs?=
 =?us-ascii?Q?8QsZjnlmoLDvu28U9RkJGGULUrLXEqMe4wrujT8VdIhJcF6cj/z22SPQkWcU?=
 =?us-ascii?Q?iJDxEn7/AXsYpiHhT+1szOt131T4SboATPLfLrZMKK8NV2+qquoT5nGnuZJq?=
 =?us-ascii?Q?Xuq9Ot4dK1ahk/3J3Sl4vR5+nhgsunhY+PYPv41PNHt+Jw22qIb1ib1n1Hmm?=
 =?us-ascii?Q?mxHfHaRnbVbW7Qmglp4I2fiNChB/n+Ps76tJKtgTtaB4/IxQXhJhl5g5BUbt?=
 =?us-ascii?Q?u46/9zaSB573+XpEez+YseJdtwLfC7IMCZaunMObetcU0Fgoy7RXLtgIFvKT?=
 =?us-ascii?Q?IVa5LBhe7QFeAwRChcpav6//uVZ7jXyoCIEutyC5G75dlDn7zdA5l+iUDe/R?=
 =?us-ascii?Q?rKjeUMDJkAd05mSr/sUVssM07IBr81ZakAU12+5VSr/tKdWV6iA1NGlwKj9Q?=
 =?us-ascii?Q?Kt4evuGKM/aNfre9DjRJ+3ptrCQ7aloTjfh+TLsFAqjdd/iEzXP4EfPJg7BJ?=
 =?us-ascii?Q?+JxbIsjCFovCPmgQlawQJzgBCi9TWjVn+TFBnLrjJYTgLRip7KERtOdUYXvh?=
 =?us-ascii?Q?rnqmhHOKTOGnaHKuwtPjUvwV3BWfSPCjIniYR6dYLAnU3vsUwbwtjqrdYWPh?=
 =?us-ascii?Q?qaVdiN/aeQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f5426b-5814-4e2a-e23a-08de7b804ad4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 13:00:07.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZjJ/KFh6+zKhXG7RFrbOLDR0wnlh04wlHgE/ssggWKebbdx6LxwfpSPqji2qDC6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_050013_964825_F2FCC80D 
X-CRM114-Status: GOOD (  10.93  )
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

On Fri, Mar 06, 2026 at 11:22:52AM +0800, Baolu Lu wrote:
> I believe this issue is not unique to the arm-smmu-v3 driver. Device ATC
> invalidation timeout is a generic challenge across all IOMMU
> architectures that support PCI ATS. Would it be feasible to implement a
> common 'fencing and recovery' mechanism in the IOMMU core so that all
> IOMMU drivers could benefit?

I think yes, for parts, but the driver itself has to do something deep
inside it's invalidation to allow the flush to complete without
exposing the system to memory corruption - meaning it has to block
translated requests before completing the flush

I don't see how that can be made too generalized since we are running
this flush stuff in irq and reclaim contexts, it has to be very small
and targtted without memory allocation or sleeping locks.

Jason

