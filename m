Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C2DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 15:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxYF3M/XgAVOApER89yPb5OmdJsTfSeYm1HWWw5CeHI=; b=FscHfD+7Gxu43RVcLr021oV984
	+LQYEMAisxBsiIkcXZm7I+UHNgTAupkV4v9vW1J0a+r/t7KWEqtbC8xGSdRie/y5dT1Ckawkb7xlw
	dWP5aVf3Dw0pfdXXgH2uV4EPaAyGaQd+HdQmXnxOz5FwJVo0xIqHzw0rYOY3WEJJBUFGYGZvVFkYU
	+BmLAJvK9Q0OP+vpZo3i9Lt5i6mDO9q4v8hPzpjvYwLE/t4u3RzoTcov48tBDf/mVuxRkOpWR0KkB
	F+mSEnpBW6lg33YBAatUJGM2Oib7zt3Jc0pftD1NNv19ZQk6InpRlzArv3q3cCGDjrv0LaL140Ne8
	tqrBSoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZjh-000000097xZ-1PVs;
	Mon, 26 May 2025 15:27:33 +0000
Received: from mail-co1nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2416::62f] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZhZ-000000097pt-1ume
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 15:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmSJLwa0ATjSxV1a+IpmgrBw3IZhD8VwWsjouyxm4oEwM6LM0x7LRj1wxKwHAA3wlNdR7MFQDEPr0XZSWIz/TCF9aTAHW24O6JW8I3dX//OqpC/zBWsHLaMuc6W8J6dA75T6KGE8ivQSDQk/d3uuaWZ5hEY6eb+dzVfeDCALKMxqzF70ZLGPZX9pqdPEw+4wKIOiPT/NxoOxKoRLv8IG3XI/51sxYN/Sb9Yh//r0OYm00bqrJuKeMwWQ9h/8l5myKSqm7PXV74TX5IT6A/aqZQrGr4EEmCBkwSaP+EfRWfaY+wfONAvsEIqWRqylPQKpot6eiENcL4eQscchg9wMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxYF3M/XgAVOApER89yPb5OmdJsTfSeYm1HWWw5CeHI=;
 b=NiTfrHDHVypYmx6eDJbdUXTZTXAi/vKHu5YHVF2Bn3owZptPQZD5g7j85Ke3L/Y3azAxoF5FC+PWgbbqxch5iLbDptM9Z3R+hNXdWKtyxdWSll/QddeHEd6NA3CAaXzF6aJ0kfSVjL1PwvxYGH+U1AF8j8WgemaBw9suDAWyTdVx2+atNWw8d/dNJxaJr0aO4m5eV4SrZvjhXykuUWrRNuMPIgLKuFTyvZAz4mma20BIzm/ruld49mIXCSJ1A160Oho/6HSPCT7x4+K9eAW8svl3VttmTFuVBm/vC1ZYDOncyY05yAYGlJ+Fecjoi2D2ia0Nd8/98tMenpSnn48b3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxYF3M/XgAVOApER89yPb5OmdJsTfSeYm1HWWw5CeHI=;
 b=BMP3HtoYhEcXjbT183HlFsjZFwIzGbS4TvxRGz3K0mLQVZKR5zbw1VDVwu9xEViA/kTzplAB/k8aTJ3Wmi2BL0svNpUo0UrsLy976HHoPlRNT2FHVBUozq5PIBph2jdGhQG+ZyP2+eD9PP8PRY0dHByB3qrwhcf+WaiCVzaz3VmlsQYwk5o2NEqQ/i62tBxPGiBvHIxpKBmzF29D8WBz7JBvGc10NYJBeWXmMOy1OTAdDW2dMLAtNx6kLYgUq7IjIHtVwNac0jykn3aVmx0TZ3/Am32Qx8NlWXmikbJtkxD4znwGNWvWfaslhplpqne2tIInpchdP0GIFZzN1u4vLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB6981.namprd12.prod.outlook.com (2603:10b6:806:263::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 15:25:16 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 15:25:16 +0000
Date: Mon, 26 May 2025 12:25:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: ankita@nvidia.com
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
	shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com,
	aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
	kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
	acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
	danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
	udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
	sebastianene@google.com, coltonlewis@google.com,
	kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
	akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
	ddutile@redhat.com, tabba@google.com, qperret@google.com,
	seanjc@google.com, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	maobibo@loongson.cn
Subject: Re: [PATCH v6 1/5] KVM: arm64: Block cacheable PFNMAP mapping
Message-ID: <20250526152514.GE9786@nvidia.com>
References: <20250524013943.2832-1-ankita@nvidia.com>
 <20250524013943.2832-2-ankita@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524013943.2832-2-ankita@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:208:329::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: d7476602-25ac-4a91-4b57-08dd9c698411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HmMKpggfeXvyHCpvXH+ZLVcDIBnIZtFDFyHknA9DaX7BqouZ1X+p4fqeD6hn?=
 =?us-ascii?Q?Ivl0FKxSNo6tp+3ZARsFBJ/uHwSYAAc6TtAOOvyRTfJzxY/3dTZepbkUT8CO?=
 =?us-ascii?Q?mHizSV1T/xHPz1u8up7Gp1G5Lmw7E1Wx9nTuqbEiDZxDOLHd/z/YAuqbjSMG?=
 =?us-ascii?Q?veKCgx0hsYmEuFX1ljkSmrm85+f2A/ST6VIHOX49671QR2loMBgrg4MrVUzf?=
 =?us-ascii?Q?C3kUBOlXe4/tlBe7qgRQtL6vF7hrN4mpnQAhYhoWZ4JSvgm7sr7t17UGYsLL?=
 =?us-ascii?Q?ZQbHn/bXgptA7z5Xr8R8OgbUxmZ46PYZ8Tq6xpEuA3PYI4iwKDN0IEdDYXJ7?=
 =?us-ascii?Q?DxShXFWeO1i+RgvNjTivdqQsVY87tt3BaaK8OfjD75bVaea6vwQLtLNeL1MT?=
 =?us-ascii?Q?QKKD/qjxD+2J8JXYM8tMKbCgPWK62q5OvLb1BDec/jc3c+PNwk3EJKzMBgoJ?=
 =?us-ascii?Q?bxAkZ/G9l8TRJRvTA1VYkvLuZZjUd1KAaieyViaUhcgVdgJ9a7jNQN/IslDS?=
 =?us-ascii?Q?ZNzzbdGHWjEjxSvof8pGLXMOPmwdmfRNvF+04cw00PxknbEyuKQwBEGP96v5?=
 =?us-ascii?Q?117zRies9G8n6nbEcqnSsGHaHC2jEtppnpGo3Emv1Z5g06WN6R3f+LkZMlmp?=
 =?us-ascii?Q?LxVFwm0MWlNsmwyNdOUeKDjT1loQN7eD0pEBMSV67V5kpLwEvR3LdBodWbc2?=
 =?us-ascii?Q?TjAWwciBVP967QGhWb4o403oYe7O8Bx+gX/Bxzwvqpvs7JxfBGynoGLzWINw?=
 =?us-ascii?Q?XR2nom4gf+I5fRjoyuIxRG50DEJ5AEHTbcpT5c5DW0HX1pgvGJVXj1/EZEMu?=
 =?us-ascii?Q?pIaYV11nWzPLvrBeWJHMHquqo5gNmMd9oRx0ZtEGrcZdPu49qYlQfIhysNKI?=
 =?us-ascii?Q?tkoFy3n6iKGVkRltr5doJXszSDJCr5R/4od7daBAyz9ZSedZeV/6N7Phba01?=
 =?us-ascii?Q?hP24XHdUe1kDOCMP6luoj72z/hqMy4hhKECbNiLL99I3ZJKsuwXaNTDASVHM?=
 =?us-ascii?Q?5hZwmSl3Pu+Dma7M9/hgrIf1j3ZHpPGvM9GH66VxQeR8d9wW7EcZeHSxDCNv?=
 =?us-ascii?Q?QhiqiXLEw5kAvS17IPCuE3VQIAKFz0l+JSfUk8V8DdDALvfWw1SfnmQpk8Y7?=
 =?us-ascii?Q?CLi9mpNX0KLh13Yqzr7TkMoOz7IYP57+Rje4uDBPjRMz7B3CMR6ZkKzJjues?=
 =?us-ascii?Q?IqYr7GQAmELstFCMCdx78wBfwo/CvPlRWgETdL5dFyzkTZBEFGBP3iOeJIxm?=
 =?us-ascii?Q?PZKKCvabVzAad3ikxnz1rjV+urrQnAVCtMNoRA5oOlz7VYBoEwKqc8z/LSca?=
 =?us-ascii?Q?frdhl33pptNzxElkpZUGv5ETKYqAK/GTAX8ZyhGobXISh6mnWSpViIwoUqNp?=
 =?us-ascii?Q?c+yrLxxAqN+GOOqnjRZXJdNdvcxEMSPwbigxRsWg+7x8fXqxyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+v/7nd7jL+FE/yrC5e9aqZEg79n4fFRAQ59YHz40ty2iMBkC1C0vPhr4g8zk?=
 =?us-ascii?Q?t+V4+Jp2dwsktLW6FnBSIJwRGITdaIfVq6Z8VQtwU0ofti3SJaAhQKl0U2O6?=
 =?us-ascii?Q?bVq2N9RhyaP3YKPt+h/oIVGdHX2QprjTY1d5bIxge19BI2cJYEs0kLbVnV0a?=
 =?us-ascii?Q?J92k1XqSJuGXzUzE+gX+KXUWuclAe7MIGSiPvGBSNfUzZj0T5WGzJAdTPKa5?=
 =?us-ascii?Q?WPHFulPVHuAMXTgyiNRp5DaO/BCeyh6iTC2NDH1UKxCZUxePFeGueptiByS5?=
 =?us-ascii?Q?4vsj/UHMtTNOsurhduLwiXhRdQNP+8NDHBi+ieg73oWXRnbqhD9ne54btBHa?=
 =?us-ascii?Q?NxOHItFSZU2mMLC4JAsZzExsWwnnBO7tTGUp9iDosr7n40svaRVC7+kb/Cma?=
 =?us-ascii?Q?tJ+W3wpqKNeAzNg0R2YSC25Cm8JjX3fXhAjx26ijS8itPNtx0smss3uICgMe?=
 =?us-ascii?Q?jMVXI/KLZeStAmk1y+kZ1BKkl1zUW43AoVRMqfxBPOKYje7QCowL8exSd1y5?=
 =?us-ascii?Q?7wC39nsoMTI3F/r1o+fwz2DvM9QNoxEHCUKPAzaDbDx4DjDzojUvP26P2oiN?=
 =?us-ascii?Q?o7/VXU3wY+/QWYakpomjXMV2GHv5P9nuvag9ph9zvuFF7eG7yttzCQ6cnfBR?=
 =?us-ascii?Q?S/FSsXYCHvKvXEjACmG8ghUikP/bhxLXtGj7uQK+Yu1UvUT0iGAKu8INzc6W?=
 =?us-ascii?Q?mO60xBbuCzGUssXbhaW1hqW2141U7X2a94DLxMzur13L4Kdqy2km6bHxzShG?=
 =?us-ascii?Q?fKXDPZBfhp3yRIgEVnh6MV1IJCi58p7XMkWpKaH9h2fxdSxzjYSZg7DE44xR?=
 =?us-ascii?Q?7fsgdL6ieuqySPJjofdJ6IUJ1vjMHBP4HrIqIRq4wfsVLcG8p197zy1IhayY?=
 =?us-ascii?Q?7DlKErSevGh8UerDItBPg9YC43sGZ+OEqQpgijQyUrYMuAuvdCNSA6795B3F?=
 =?us-ascii?Q?8uVaRARFEBIVytX8QthfrBlnKu3THIqiHNSJOqbic8QO37AKzUM2Wisg+a/8?=
 =?us-ascii?Q?l2Cf8BrFm8I/063+9r5Jw1OpC3RFvMgYZAB64puUg17MLKhLCsXD7B2w1o1J?=
 =?us-ascii?Q?0B3q3Y704plo5TgTKMCBr5FRyWjSvx3uJUyM4j9LU2hcli+03lFWZq31nSTL?=
 =?us-ascii?Q?EiKT936rxO7ac+ZZPQxUXpD97MMQzLABve1j4eAG7iYwXs56i7e8Eds7tJoi?=
 =?us-ascii?Q?OT4tXwO5BuIFqdMYIojtUbwONZhn6GEoE2lFXCkPqFkEKO6sL7RGdlgTFsBJ?=
 =?us-ascii?Q?uKub4LWKxbgeR0jxch+RZFEe8AYkFKW4kmGM12n4XevKlOzGEvtKVtWH9G+n?=
 =?us-ascii?Q?fGNGDY5rMOmTmsC7NjAzjjsMS5DjHWDwy/mf/kQr/Mf53hl7yXjV0bUkH4Hg?=
 =?us-ascii?Q?csLkWKwpLDmdpfZ6G/mvRBEh6d+8JzvStzS8EvK7Kwr7R8AGB7EkksJv20t9?=
 =?us-ascii?Q?yEgQPR7rTTLYNfwV4f0sWG75s+DoiQgDkCWk+j+T+iqNHOlrFkZHrjEnlvy/?=
 =?us-ascii?Q?5m0p/GqkggsNGidnALYkvQh0BvBvdJ62hk95hgnFaKqOucW24ppBpXPGwr1y?=
 =?us-ascii?Q?X4C0S6y4FGOKUST2KmY11+iaHyH3EaSwsV4f9WOS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7476602-25ac-4a91-4b57-08dd9c698411
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 15:25:16.0273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXsRJ24x/BykNC7yH78kAYzT9nrQ+gFbyML5d72U0BO/RnxDW93FmsG+7dmOlf6G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6981
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_082521_557249_B539AB67 
X-CRM114-Status: UNSURE (   7.48  )
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

On Sat, May 24, 2025 at 01:39:39AM +0000, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Fixes a security bug due to mismatched attributes between S1 and
> S2 mapping.
> 
> Currently, it is possible for a region to be cacheable in S1, but
> mapped

"cachable in the userspace VMA"

Jason

