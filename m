Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABCFCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RiTt3OgHrGAQDAhQX+n6580eNFiVH+JPN7EjoxCvlZ8=; b=W/TME5toB0d/xtxB64Z9aoBypF
	AGIBW9eEWoCyLmdrkdfpzMKl6J1k1Ay5xdrXlORHO0RDjA5JE612sPAE+h0iADL7vpVyjLS3bsqJi
	d2SHXN1ube8MOyS8/GsDAFv2NmAlNVarqV1Y/5yO/rHU7LkYMZn8JABp9oyb5XkYpCVg/4LTlKNhD
	5GeINZtGnjwwMLv/tihf1Yg6Dx5C6GBgW5wJ04AP3Btq3RlLeFkeSj2wJROuhy4LGJrPZK/PCIq35
	ZX4FvLv4gQbSMJD35IiGNC4lM/8QjPqug2tqOBRMgc8KfxrDY+mCzgswlykO3jxwBdg1Ne2aQ/zsw
	m0zrV3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOY-00000003k0r-1yRZ;
	Wed, 22 Oct 2025 17:13:06 +0000
Received: from mail-westus3azon11011038.outbound.protection.outlook.com ([40.107.208.38] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOU-00000003jz9-3pcm;
	Wed, 22 Oct 2025 17:13:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8zhsZP+yz6h+eVG/wc2pxnqU13YbMKQq0cE/5AAO3BUcEWZPxnAvc9OIi2IzqRGayaQ+1dKxrZpaY9xbDLqfJ/ICfxBhpk9ob6lR9vCl23ALjUEQE3m2uGtXkBZSr6UeVlmyXZQxmbudyNtHvbzoOo+KUcB2wfEIUVlhR3Yo723EjD609EA8/qeiUxzUq/Uu/qdCmG/vZaxZO/fSSpc/+FrXuFA9FmeljcUHLVHAXmPJIpQJvey8pFSovmBuxpcnyDh6qEAAcV/E6D9PbyTdZSJXiO3Wh7iCEFrRy+iixI1tL5PxD1KmQdL3gycOCoo1ZyWWVCSslpjIdt7IwrGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiTt3OgHrGAQDAhQX+n6580eNFiVH+JPN7EjoxCvlZ8=;
 b=XmzEGNvJxD1965RWB1rJcrG3yeIiEcF2bwL5Xsp35GAASobPKpPzxP5K2XHzmHM+fifNWMxy6HFMejpBZF+hepjMZ77JiamdLF/qjpIOUOwnJCMcqCKW5C/zRCUtNWYVKqpDn8br/+I+j9TUvCMo24gTS2dqMINcs6HVjMaBuOjU9SBelU8ia1TBGAXAmfzOIqqTGfaanbFwVTcX56mVS5gjUoibR/Yuf3z3T4cvwNpk77Je9JGav06ViLYqOfHn+yvE06QlLvxJlXG1byLkKHU8uHO1Q0aLdeiJCc/fZmhAqii5Rsdo/JnVXIShAq/ykk77tXhpL4TX1CAcCKc4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiTt3OgHrGAQDAhQX+n6580eNFiVH+JPN7EjoxCvlZ8=;
 b=FzGIlU3aatuZnmumdSOmMbvzo0jIx5HRxGEYG67utXH1z5RuIFP8n10CDrWX73JiUlUcMLc2wS3lU9iAjDVx4x8cMUI9FRjhbsM5k9vakOrsBdNrOsvl6E8jnVX9SIC+gjem2mMbDHUSZ16VuJcMu/ReGgl6Dr0IB2F548gk2RBL6Z7+Cw08wp4rCjXtNIuTtM2yrShCk3b/C169DTAvEWK2NZ3+B6keGtcNF+7p0w+CrvxTgGSLLa36/eqchnK9tu+Jrgvv2Q6s75HwyPgFLORqR1O0E78tnl1Bp5NR28MitIAAUy6bq9CWA/aAkE+DlriJS/khmdMHNqdrZ6Wi+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 17:12:53 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 17:12:53 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Benvenuti <benve@cisco.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Leon Romanovsky <leon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 0/3] Cleanup around iommu_set_fault_handler()
Date: Wed, 22 Oct 2025 14:12:49 -0300
Message-ID: <0-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::31) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: c81ccd42-623a-4562-64ef-08de118e3cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J/heM5aejHKpPZgtslO0kEHKC9wqL9cBe1Nxss/qMeVG+/BMqIHd45Ssv+i4?=
 =?us-ascii?Q?zUR8huftgWe+5jRHWQ/ylvE97D/RsAQLLW+JWRUa0lTJj+mbumsNpfkTcx+S?=
 =?us-ascii?Q?XAnyPGaT2GXwyQN+ItA+bSpwkekapG4jU08YQnZKCendTC0La9rwiaGx/icL?=
 =?us-ascii?Q?Sk1/uLc0Jk2HP9Nwm7nbF+XWxjDZJhnAUBixJ7r7NpiyBeqUhvROtMSRCEvv?=
 =?us-ascii?Q?vL0xG1U2yZX5113wktAbyS3yXoAqG5vNP/vPqtlqUIJwRuU2kgFBxWJ1YriK?=
 =?us-ascii?Q?gGXG1l5pncqsZ2OI0vdVpobA3prcSYpoPVqm+SgHrrsVd9BsTTY7+tZYnFkP?=
 =?us-ascii?Q?U64xTw3kDfapxbSOEmPiMjTeRNhrBhqp/ps+zfQhXjcpqmuFBJbC24dUbNl0?=
 =?us-ascii?Q?32qBUUeVAgTLEfT9l7Ors5ODkFUqUxAJ7IWR/jftWojYUvywJ15MpqIEgkTs?=
 =?us-ascii?Q?KiAKS7r4YZRPwure6UceHoN5qLVYNmlNbWw3XuyMMJ+TGfnvgPNTLuZ/Wlx7?=
 =?us-ascii?Q?VCkbZfP4ICpawM86AL0Y0FISur7m1ly8EXqZzNaoYEydeOrSzxpBGNYupl+J?=
 =?us-ascii?Q?+6KYhxx8AsaWn/hlZIfiBk1VixI6D74um/cwYR2sPkcVm59IDiiTyaU5+GIx?=
 =?us-ascii?Q?/bs5U1nrKzoEZrolSdJQaxbzh2Of+Hvv8eCyxLqoGWWTMcRl/EIp0QAps3J9?=
 =?us-ascii?Q?Fqdpd1AMC2Iwyn2oOfI3oejAQXon+Utj5BD2zCgaQeG2nSAyLFWcalsxI/o6?=
 =?us-ascii?Q?xDusoEeTeheWc7qlykX/nnGJE/2ZQE8Z1YMnq0yycYUtM+kOFD3vj3VM9qMT?=
 =?us-ascii?Q?GxJdYms46Mr70NSs8QS2NXBCnoOuWsXOnYMdi6R5FpCfTX05/rBVmEa39jNq?=
 =?us-ascii?Q?/IPXEDIcSLeF49lfh72PMW41MwFwbF0qwY44HhrazfzNsj4FzA7BkvWbFAmt?=
 =?us-ascii?Q?sRvRvFykCquaTpB0HZHbzOr9+mRbGhVwf4AYskI9RSBYhKNypBaynH4s0YnO?=
 =?us-ascii?Q?e2Zd4jOuHAE1nckaUeo+wRcbT6roMdRYrCxfA+onozM7diaTMp4AxcutZ97b?=
 =?us-ascii?Q?9NfACQKUqEM99qrbUCGTA3ZjJVYHbDddS9CZAY5qIuDXMNAyOBUtXxutAHuX?=
 =?us-ascii?Q?cf5yoBtdSQvn0WjhdqDBV2LGZuyg+R0B8gwd/AYx5UBzpK5vvtwqvqgW/jkG?=
 =?us-ascii?Q?MK9e6yT8yMO4zE3xoWwOMKfihN4pQA7qK1bl+1C3wyJLr6+t6FIOHPCb/8wV?=
 =?us-ascii?Q?x0Vy7VdDnlRIAKCK2i1l1qNr+3X+xQhxbqkfh/QU5MlM9lZEkQqKZGTDeRt8?=
 =?us-ascii?Q?WMsa0kRbl3nioZ0BDfBxIvFxdLPcOzM/dhUVuP28GLVxYvpIj0PtfwNul2rc?=
 =?us-ascii?Q?5fFTxXxG7pNCS1+BEG1hPvQ9ZRiZe0+mnQItI70jKIlB+OqdaGpINU70+3NS?=
 =?us-ascii?Q?ym7s5gWvNRUMGEent+h4nzidXmnArJDuP7thHTjEI1Tdol7q4fxjT+DnzB5/?=
 =?us-ascii?Q?6HHpYi1wI+2WZ64=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OtO9mMBnFOtWKe8FyILQZz01ScD3aizQi7OOX7SV6pnqH2yeafZe41vlFRW7?=
 =?us-ascii?Q?KeFahGTOcRIT8CX3NHvv6dp9t/5h9/IdKKDQ2cgJwWuIBfnR+WiOK5kfeBAH?=
 =?us-ascii?Q?u3T3k9Zt3EE0eE6QQQ6GEonnsCaganJ76dPkaoimRvSetDgmiYl6luewR+we?=
 =?us-ascii?Q?TeuhjfNb3azoQgFdxQrJiknpLH7bTB83oMw3o4B2gCbUx+WXhWU861V4YZF/?=
 =?us-ascii?Q?BcnwQZbFYk4FjRl44oz/WnQ206SC4WpItPGeRqG/fO8TvADGrOqyU12HJvXa?=
 =?us-ascii?Q?jLRC8ZScUtD+8xS6ZGpFPKuFD3YGPjaDW3ku+NbEoNqf0lnSQCw2Mb3cMZVs?=
 =?us-ascii?Q?1c+Mh4FPmKzPCfcx+fuW/rGj0T4Aeiz98qGJZJrUXe+F82iwgHWkVegmVQkQ?=
 =?us-ascii?Q?gbpbgM9hs0UDG9KGdbqlYS7bB37f0qWiJd5IxmNQpLF2ggMydPwpg8vOZuxe?=
 =?us-ascii?Q?CgiZLRDpPUL37CyHJpCFUjoQrtbpHkhAk3CnhFf0PndJkdMrJjr2DxTlAF1U?=
 =?us-ascii?Q?1UpgX/d6wCj7Z21LieKMggVzErCi5NNgHLsiVX0+/+3ytU0j4deEGsvFMHaH?=
 =?us-ascii?Q?n1Pz5VBpCMDU2X6ezmkOR8brXrZeiRKLCPBlCh0PkAQh60yLeZaWZUAs2vY/?=
 =?us-ascii?Q?sG2ip6O5XE13dsEKLXXjhF4k31spajnzfcGLUow8P6SdBNFRZ4Dqrk2+1Yze?=
 =?us-ascii?Q?s1hKPyN9GPiyxRk9Q32bkPvrEgnn9ijOXDe3gHmpUkzchw+xv8TvacAA7Vzt?=
 =?us-ascii?Q?P44GGqLsWSZRXvOL+QU53J32MvergZhOljCIckXiwAWjQiB87cxGFjq95lBJ?=
 =?us-ascii?Q?/eMABBcSd3U0InT81y647gfyj8Z+m2U4f/9ZAhR6+DBFCFOAck/W/qBu0Ipg?=
 =?us-ascii?Q?/W8tyQpR5ngyzMvH8up/wDjj+1QsuZAWzz99Es6SnPXyN5RC4P3L/3g+7Ltq?=
 =?us-ascii?Q?jwFvIINpBTWIoA7oVw6t907cnivYw10GooA2mwFxkmTm04DekViE0ec6XIT+?=
 =?us-ascii?Q?PA+c8RrXr1uX9ozFrKOQSZNEOErYzoG2iZ961rk7fzkwmqrf/a3eXmn7Rq1j?=
 =?us-ascii?Q?S1BVlsYRiTqUnOeNY0U8ZwTcGb945lewgZ8/Nn+vVNNdKk0iQ56isAAsYM5j?=
 =?us-ascii?Q?Ni06td10t3NCk9XmZ7w7u1cyyWv4NECEDJIkyFLNeUNxgokJBhmCl1LzhOJV?=
 =?us-ascii?Q?Dadg5FqYwGXyfyUevf56ItMLtep9SqlxiLaGzqEG50r1Sgp0+4lR4Q0B/VlT?=
 =?us-ascii?Q?Uhrbjx8ZNoXdfPO/QBykbtYQLjnZ7DMzo5tx8QhdWvYomsPippMunc7Tn02w?=
 =?us-ascii?Q?xIeGvptpi/mqh4AukDxq/Q9uIESyUJf1iIYJLclnU2nX4GGoC0U8o7AhAWXM?=
 =?us-ascii?Q?jw+2fo8V037rLBIiopV1MPbaHsuo4PCu+z5iMUG6cng2tLenEG3TTGMZOjWT?=
 =?us-ascii?Q?yaYK5jFoQTajaI2EqmR6VvL/8h+oGj12EV2dEf/Ojz4oqEdjd0ya4AOLQ1KC?=
 =?us-ascii?Q?vbd1MH/q1rCNhb90TkZ1AnKNJWtZd9yCf47qnSGdXWcEb/k6Vw6QxyAZbt21?=
 =?us-ascii?Q?F9S+AlGpI7jsNuEgCMo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81ccd42-623a-4562-64ef-08de118e3cb0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:12:53.6306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLBCTP0qB1d+VEFmf0SlB2ASyvzWsIzoF/QKri6mUOvtiuP4Xx2qvzswqOQ39tjC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_101302_964454_9641ADA6 
X-CRM114-Status: UNSURE (   9.12  )
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

report_iommu_fault() is an older API that has been superseded by
iommu_report_device_fault() which is capable to support PRI.

Only three external drivers consume this via iommu_set_fault_handler()
  drivers/remoteproc
  drivers/gpu/drm/msm
  drivers/infiniband/hw/usnic

Remove the use in usnic as the iommu driver logging is good enough these
days.

Remove generation support from the AMD iommu driver since msm and
remoteproc are not used on AMD x86 CPUs.

Fail iommu_set_fault_handler() if the underlying iommu driver does not
support it.

Jason Gunthorpe (3):
  RDMA/usnic: Remove iommu_set_fault_handler()
  iommu/amd: Don't call report_iommu_fault()
  iommu: Allow drivers to say if they use report_iommu_fault()

 drivers/infiniband/hw/usnic/usnic_uiom.c | 13 -------------
 drivers/iommu/amd/iommu.c                | 24 ------------------------
 drivers/iommu/arm/arm-smmu/arm-smmu.c    |  1 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c  |  1 +
 drivers/iommu/iommu.c                    |  6 +++++-
 drivers/iommu/ipmmu-vmsa.c               |  1 +
 drivers/iommu/mtk_iommu.c                |  1 +
 drivers/iommu/mtk_iommu_v1.c             |  1 +
 drivers/iommu/omap-iommu.c               |  1 +
 drivers/iommu/rockchip-iommu.c           |  1 +
 drivers/iommu/sun50i-iommu.c             |  1 +
 include/linux/iommu.h                    |  3 +++
 12 files changed, 16 insertions(+), 38 deletions(-)


base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
-- 
2.43.0


