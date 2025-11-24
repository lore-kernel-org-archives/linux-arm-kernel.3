Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DC5CFD360
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 23:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62Q2Q+vCB0ThKfZt8ZNppaT5xTstNk76EnTl5mLGTNg=; b=eTYEiRk2VvqPzmyn9L100nCkr0
	gVBId8VKuhFk3TIqFnmvTooFkDc0tBpyuGMqE2eUeEJmUwFaq+VcVtQolVZB/Jhy+kvTCw64nyccl
	+yOvSPe+lGyBls8geSfMjwwudoss7+qtYooQQ8KmmP5GXB7FbBMNoMeiEIFPjAGyzVPYT8lWQt0Fp
	VdwQLJDBSZPFbI4rj+MjxSmdcJvyIMqqLjP/SfikjLkoaFPhMVUQnpBBsrjsyWngnQ8F13NAQI60G
	KOyEPwf3/ECbGHHVTlt9PkNpDOOoJ7GB/+2p9bjPg34+CgLWLqH5BPEbL6HUL46+Yjr0kd+1ff7MN
	sV2j/CoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNfqi-0000000CRoN-3xJB;
	Mon, 24 Nov 2025 23:20:00 +0000
Received: from mail-westusazon11010040.outbound.protection.outlook.com ([52.101.85.40] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNfqg-0000000CRnc-2LCz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 23:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urYLB/icMU7hlPS59dtMYUvjO/ef3jHnmUFhUWtJsB/YWbED/eBVyRJT9fHC1wdckrhSz1thCc32+M5uZPntBgdK4kWx2axIov5b7h96Bey4jEDeTmzNqX0YCzpi1zku6LozKWQtvVWNlTN8fELN4SaMIrjIAxzmmROSetxgVR3C4PiC3qxuD3B9IVtdpl5QtAmgjZc8b7PkOJlALp92JE1ikXPsXlVKTWs1/kTjHddFLfN83fZJT1UOdO9QNvx+C4p9LRF9rmcGbVSfylkfbXqTZaUiDUkvWevsj60z3Nfqap1q+SbbwD5ifeIKAevUw0fBmQ4qvFQ1Wm0NTQ24XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62Q2Q+vCB0ThKfZt8ZNppaT5xTstNk76EnTl5mLGTNg=;
 b=xkjQfYQMSWDTdlzCoPUD5onjDNGAE5dkNXNKFgV/dGC0ijDQKy2QgMGGkz5o7due1FFqSSumbjH8HFQqk8QB2WMi1UV/pD8yGO9ivpuB1/yhcuFCgLNJu3IYLPyvzzH/uCs6J7DJft0HmVyGSaWemVqpQNuy0kmABRCJIY2N3A6Ndx2yfpT+IpKXYH27reGCSjoLUgmpGj10VGJJIffA9cJMiGRfCenaFoqqQApu4EbvNox6UuXMvHzhPphCCSYDaUx13makYYeu3EBkIM6zZHCM2k5Hp9IOSRcFPFCa9ZrLA0bwhW4+1VA9efqmYMytRfL0DBKgWUud9lYJo6CWgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62Q2Q+vCB0ThKfZt8ZNppaT5xTstNk76EnTl5mLGTNg=;
 b=FqqcqWXh7aQn316Nut0pN5sBstDAAqJxmXhYoCFnIRRuQ1zcpjC+UOS1+W/GwYYajgBg2CW7+JuGT8fKxAPRbajt4K+r0I2HmiDo7V8kZGUvm6StJmQ/EQgpw88NRyKrqqds5P2gYomyxUv+ol4v6OEOoKb8canRXp2woMNMYxxKIYfBlri5In6TFv3+lucuZY6CHsNcxGMUtYTVj9fJQs1F5X/WN/SxwEDK9OWoaeHMvkkrLTWIlvRmLVa6vjQ9jfzLz/7FBEQRfgSsCUIYRpUfkwnP3bX29RMNDUTCP+aUEbigJd+YXcUdoVaZom75Cej/iaME9ILHs1s2pV8MMw==
Received: from DS7PR05CA0103.namprd05.prod.outlook.com (2603:10b6:8:56::18) by
 DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 23:19:53 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:56:cafe::46) by DS7PR05CA0103.outlook.office365.com
 (2603:10b6:8:56::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.9 via Frontend Transport; Mon,
 24 Nov 2025 23:19:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 23:19:52 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 15:19:31 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 15:19:30 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 24 Nov 2025 15:19:30 -0800
Date: Mon, 24 Nov 2025 15:19:28 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <jean-philippe@linaro.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <balbirs@nvidia.com>,
	<miko.lenczewski@arm.com>, <peterz@infradead.org>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/7] iommu/arm-smmu-v3: Populate smmu_domain->invs
 when attaching masters
Message-ID: <aSToANNpeb5GxBP7@Asurada-Nvidia>
References: <cover.1762588839.git.nicolinc@nvidia.com>
 <ebf35fa1b2025be736475950503f0dc0612371f4.1762588839.git.nicolinc@nvidia.com>
 <aSTRdltJpMeFLDN8@willie-the-truck>
 <20251124231341.GO153257@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251124231341.GO153257@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4f3b72-d4e0-4af8-0a5a-08de2baff8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hh1y57uca6pjFOwtyDWQ1xTD2OJHyOl7c6jLtapZNe8ijUHc6nqOY4ziziCD?=
 =?us-ascii?Q?l4svNrayX9gNtZ0+I7STI2riP3HaZZuL8DbUyzk3bBdcoUcHX47MsH8hE+oO?=
 =?us-ascii?Q?FOCUeqzSdtOstzjT0oZoRnH0X/hAZV/LgVFGwOW8SzoxST600ulu24MloWS1?=
 =?us-ascii?Q?tPc2UZ2fBpymIFgVzkA9XL1oSPQq8zZ6Ko6hQvwZIAwKo/wIuGtRbOHVTihX?=
 =?us-ascii?Q?EKGHFG2SO0gulR9dIhJysdsU5ywaUGOUT8+NCt7z5AtI90RezDIsz1JAAys+?=
 =?us-ascii?Q?cuXzzIW+WwpIjLLV5f9zgF9zF2djUVszRWITR04PpTiN3qE95UDEDfjqZxVi?=
 =?us-ascii?Q?YzHCAsR17x9+gzHdh4LdH3dayb8Y8V7Xp8GkP3jc6203lML2CidqvHh6q9AU?=
 =?us-ascii?Q?x9xV3XEzSXgCCu88TxDP4y9pbM6Zdh/yboMKn0J1hQrX9pXvCTxBltzoJzWX?=
 =?us-ascii?Q?rPm8z70vuNmciO0q8iw8B/ZGTvYkX1Ls/n9ueFiAYlybbaIZrUZluaFa+w/W?=
 =?us-ascii?Q?briJAUTZ7g4kDZmYMeXeIjMmwR3O5M83ex7/uWjRrtcOdVW3UiuyOCtIBugx?=
 =?us-ascii?Q?tqbew/gABgzEV+rjhrAXA9mJoxujE95SXpnj3uBjnQY5bjsbnQUROSsTiap5?=
 =?us-ascii?Q?pFTyc7seRRgcaDQ7V2YdwE7xBcx32CpP2PpFfYA4o2U99GjnJv0xfqBTUWh9?=
 =?us-ascii?Q?vC8ffd4pUpsWBWt/QT98hOa0oy/gLRUmB70aOCH+yUEcE5pc6to+2iLg2gRp?=
 =?us-ascii?Q?g3r8m+BkE/o7ivW7QBVJOpZMIgP02QfXDcSauo0jzRZGnPWCpsQnV/QSJway?=
 =?us-ascii?Q?L0gby3CtkLukbcvv5G2G2oHpQLLehwSSLdP0c9C2eGEMdLT4yCu4D9drBEjD?=
 =?us-ascii?Q?VWoKAK7rteqSGNfEnhfh4h+Iw4ceu3XGhtHs5HBnf1zqjudNgS9P44Q7bxIU?=
 =?us-ascii?Q?zOUKRbrwGRBmHoXazG/JBpPvxC2yoA7yct6A32H+YomLYdW0zVOeqnXqpVPe?=
 =?us-ascii?Q?t4xgsBn7ek2hNZvwx3KxycTMd+vWxhvw0lfX7Nxn/AlYZRQZXros9ZSfe0TR?=
 =?us-ascii?Q?Nf85fnjeNBMIg9n7jN3O36qxMmC7FLj0emdaGGEJLsxaL32admcCD2zcpQDV?=
 =?us-ascii?Q?Q5qkxxnStLztr7OX/gOTD3OT6wWir35qjmioHJhId2QfltGAehOTY9BGf7Uj?=
 =?us-ascii?Q?fL0mWZQMoUEXWgILa1HcwxIGTA6O29S7IWvmtcRN/fbgsYoP+4jx+ivXdTH3?=
 =?us-ascii?Q?bSdoRSuptOn+EvHm2ae+4FbTPoCUeaLZsEyfYUFn4SEUQwOJmd+SFg2R4/j9?=
 =?us-ascii?Q?XCygGaozFVB03mEcaLdb8afqZJeIsB0qK82GfXmlpzB0u8MtbnGBUHzo82oH?=
 =?us-ascii?Q?f1vsbvKbS2EcY6DBGS+42fNErICZbgvHmn/bCfFfm8Z/36IiaLSiVcgJou9r?=
 =?us-ascii?Q?2lyDbS6Y5KV/bLUz1WqZrtdDhPfPhZhEceR4cWHbFOjnnPFOx37yByMU1x/I?=
 =?us-ascii?Q?c/pokGYGk7iXEDVV6i2T5kKVVWOIyYc7neSULEHb+J5F54F2BNDoOntcPDOb?=
 =?us-ascii?Q?MtpVQuih81gqjXeTNEs=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:19:52.6249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4f3b72-d4e0-4af8-0a5a-08de2baff8d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_151958_597561_45CA2331 
X-CRM114-Status: GOOD (  14.95  )
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

On Mon, Nov 24, 2025 at 07:13:41PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 24, 2025 at 09:43:18PM +0000, Will Deacon wrote:
> > > +	/*
> > > +	 * We are committed to updating the STE. Ensure the invalidation array
> > > +	 * is visable to concurrent map/unmap threads, and acquire any racying
> > > +	 * IOPTE updates.
> > > +	 */
> > > +	smp_mb();
> > 
> > Sorry, but the comment hasn't really helped me here. We're ordering the
> > publishing of the invalidation array above before ... what?
> 
> "concurrent map/unmap threads" means other threads calling
> arm_smmu_iotlb_sync().. I think the matching comment describing this
> and introducing the pair'd smp_mb() is in a later patch.
... 
> Nicolin maybe this barrier line should be moved to be added in the
> patch that add's the pair'd barrier and description?

Sure. I can move that to PATCH-6.

Thanks
Nicolin

