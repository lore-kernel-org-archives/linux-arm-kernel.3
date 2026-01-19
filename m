Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFE9D29C4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmQPVsT5SG6YdxM2nLCXuR9GnJGCKabihjgrJ6UknG0=; b=x2n6ZP8Jzh4qychKd4Z4nEoB4B
	T0WW/NteD2ZeLvIlXe8QGQHnyeRYW1iq1q0LQqVRd7Dh8LbDuUvgSkqZ92sZFQZviVCJHRsUVBBbp
	150frsBLYnErmbsOr1SyYtLxVe/H5aWSgwOeH+8YK3V6/mHTvOU/L4mfusXvVthUDwr7JIInMRJ6V
	OXbul+Ca5wKf1HPBNhf/KGAaUJvkFLVdbhy7NGgDnez2Mv4iSIld+tE/dpytKr4GcuOcBD2n/6H2b
	tLOhCzKTY9on6Z1B1vKvOyHkFxgOTvQODXIF7VMqhnoqm1O8PtYfgb6kQad0dJLvLjstd6HcEE34k
	Ulh1mGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsln-00000002bVW-1olF;
	Mon, 19 Jan 2026 17:10:27 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsll-00000002bV8-1ino
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:10:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcKqaH7aNnSo2aymeD8V0LLW74uX2dRy2wTT63khH85uhyufCphoWk4Ukw6xfyMpkejZWFJ5E3U2hRL/SXcdAvddCMNjxgd3kKcGou5VT7wqf9YNl77jm1baUgBGGNpfxDLs3KD0iMKiSMYrRA0S5JKAPnAo3+CZDThV+/sBmWw/FfxLefhGHV0/j9KPX1Oby3bJxtcf3sZzjr9Bx+MrXTEMK2AgEIzAI81L7SDn/TrbT91PuUnnFFiBhIzl/aTsEuc6tyHBdkN3SDsAoxge836b7SXEJ343AQi7dz11QQJqQxSs/6eir7BpP8aN5fqpqvQHMyxsTGMnSumAnZxqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmQPVsT5SG6YdxM2nLCXuR9GnJGCKabihjgrJ6UknG0=;
 b=MORa+JfV5RMBe68kxrv12w/R9LGwD13GjKTYI4MJoLtm9Pr9IqQnlB5KWsQd2/5A+VjQSKdJmi86NMQhbar7iP0tVQl7BSns7JfsLEOhwWYSmMg8QYsWZQqdfMmFW5++mghr86i/p7RtFLv71fBlfbCPfSBbdggJlx0yOaoLLzj1cMeaVhU8udMfig9THgufsCkHWbmnfsYA1QyS6A0K8BPb0V61pTqxbSvINcVnswgs9p9AC2sqlkL8WWLgWutmUDOsrtLJyjdVjnsymt6C+WLKC8EgqYwT8H+hbtZVThfIWScdRS38ea9fbqZ+iDiE+cL/CbvN1z397biDAC1ICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmQPVsT5SG6YdxM2nLCXuR9GnJGCKabihjgrJ6UknG0=;
 b=qqKQ2f2+rHyHD3orPlGP4voasOFxnnh5K/gQcnDfx1UE1KXMXDSn12KOwLUSfL48KvhHNeA2+t5mBg7w7tdPoWly9Ebzj/wFBa8R8kJSIEwrXpgtNB3vg/saWXCTtdzka2G6nfWu4Cqkr0LrGXjWbM/L/hebE6LJYth4nSoCDALihX2o8VWtByEsVT8OeSORjq8yZ4Po8t7R21SSw64qd8kZ2LN2W0xi6vX/o6t2AcpMW0ezW26hv2v52WNrUenjDbK+G+Ryf+Evlc2WQdk3xs5lSreMcvHiQEOXDH+1X7RaIIprVpSoBeQdv0QeoRrHXgC20bYcJzzfPbewCaqSXA==
Received: from DS7P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::26) by
 DS0PR12MB8365.namprd12.prod.outlook.com (2603:10b6:8:f8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Mon, 19 Jan 2026 17:10:17 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::90) by DS7P220CA0032.outlook.office365.com
 (2603:10b6:8:223::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 17:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 17:10:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 09:10:05 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 09:10:04 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 09:10:04 -0800
Date: Mon, 19 Jan 2026 09:10:02 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 0/7] iommu/arm-smmu-v3: Introduce an RCU-protected
 invalidation array
Message-ID: <aW5lavfm2mr8GsMb@Asurada-Nvidia>
References: <cover.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1766174731.git.nicolinc@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DS0PR12MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdf212a-6f10-4fb9-8cfe-08de577d9e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|30052699003|36860700013|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f6kdPyirWAEKM+AqboswFwutbWN7uUTCyPlxPJr+KvPwTqjsLk4R37eVptO9?=
 =?us-ascii?Q?XnL5LZ2Wo/jjfIlcCVt5iVE7vobMMjHnJYYwOSzL7HP2h2oK7NeiebiZ+p+U?=
 =?us-ascii?Q?xwCMrdQoFxpiAD4og04zAcCV3AS/tn0s4j4Ji5p24gKnQWbnk6pjn3dVCErE?=
 =?us-ascii?Q?LAYS+xhYbfpQYCLe6HlLD/aOPp48G9S1v6o5ZFUHnEA0lu962vb8cZaJkONt?=
 =?us-ascii?Q?Pf0Q08jxjEGDbQmEoDIwJzMmwh/74n2tCvsxgt5Uu/pdd+DJIaX5weDm7oP3?=
 =?us-ascii?Q?F0Tm0ErrMaOjJWDOZqxrqTb9ABIyauXDbEq+hDiAvig+eYwsa6aZ0VSeOSUe?=
 =?us-ascii?Q?h3Lb09vlKdR3GWSHSFsjXYCGO9FJNWYxjRSVj7ZthwQy5IpVgX2X6oVfcQrM?=
 =?us-ascii?Q?MQMhSUiMXGFTBRv3OXD8FudJVb2JSuwAZS0xMH3cOA71VxBOnt7jSKdNFdZR?=
 =?us-ascii?Q?ueCkHB6JHf5bGQiVZQXT+3iJCRN+nty0R1qeCoQ9cxWtaD5raxbYYTapwxYf?=
 =?us-ascii?Q?tTy33HVwn5et3cMw8RFQQ663D04L5az+Zznnkw9tFQt/7NjMLdO2odvvxtiK?=
 =?us-ascii?Q?2ppy0Dof8wtlXEDXHRRQqPmdZhk4RRjyf1vuPuRyKMmdxoCmYsmGxqbBldNb?=
 =?us-ascii?Q?Ka9IhxlktY3QI8O1JwQw1Reux1t+C/Y+N85ebbYIUaLwWFbKaFWokz5bvSTy?=
 =?us-ascii?Q?CBXR99OqKRmCWQQv7ScgKuWYuk0WdYpHlfAsMXmRlWACYRF3h/mlld/eXocP?=
 =?us-ascii?Q?iu4iRlpo/evLG2RtvzQ4kEufu1mImgcGFXzpg+o11m5JXlqRoeeZBDv4m9/v?=
 =?us-ascii?Q?pQ4GgLyG1aje58HtdogYWhbBdRKj1RvnMl4sQc8e6krr5dhQ2qe0+UnyWYYc?=
 =?us-ascii?Q?QdXIT2hIkbnqunKLeslgFgnf1ufgGMqjiXaKLWC5BCsebSE2Vxu2yBVtB3Ut?=
 =?us-ascii?Q?2qrppedZTEixQC+BGi9/ftqG3a5SkHnEcu2gzpaGyiKFgEYe+mhS1UTAchXk?=
 =?us-ascii?Q?5HMzIxQSMIZoJiVwW/MV9AOLataj4RPTX0hMSoiCs/bg8SJWadAqsryCy5LW?=
 =?us-ascii?Q?Q1jRfFQAUm+r9Qf1OGKfykyNzdNQ4TfqebQXrSEEcMDmRunNDIcFrLrOxTQv?=
 =?us-ascii?Q?1KLHp0s4p4w5HhnOfcsyYAyubgKs2m4WjwxEWOEgDAvIbFVo6E8CRnJ43rv9?=
 =?us-ascii?Q?BKUEdlbTrnBGDJomnk49phm1yaIj3zpI+0MX4L+tFBL3ZSeeSWwufWwPBRWC?=
 =?us-ascii?Q?BlGyeiW7YVOk75wiG5BmogFn9gSB4v2G/YVqpTtx0wbHCbPlm/ggWwK5trY6?=
 =?us-ascii?Q?58+8IfxKuT69EEVekFMikKHy2xl9PluaAC4hlEGPj5SHd/lt7ZMBiT49QR4V?=
 =?us-ascii?Q?HmJzEiaNLMoi0hZ9gFwLvTFqksL6bUS/Tp/AzWwVHZlV8uYxuiJOkkm6Jg+Q?=
 =?us-ascii?Q?Jxp0SHEBoiFUqZF1asBJI1eFWWqjr3NamuB/LMa2k2DHnUnQI/UAVUoxEpRz?=
 =?us-ascii?Q?zyhVo2IXvS2jsH1pBl+XjDduSMC0ulQUEBw1TbxRgETcGEEr4+M73nm60Fbo?=
 =?us-ascii?Q?xl0HW5oW5o1iQ1WpWpIOLWNyYjxc9r4B8KhjnhyyKrqWb6B1HtLXPuUQtvQn?=
 =?us-ascii?Q?Mot62A1scmE04Dw7Torh2MtOq/ZVMpJsSlrbxBbE/+4+re0ukxRI8ZCdZvH+?=
 =?us-ascii?Q?JtlyDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(30052699003)(36860700013)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 17:10:17.3647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdf212a-6f10-4fb9-8cfe-08de577d9e82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_091025_485711_C2D86890 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Will,

On Fri, Dec 19, 2025 at 12:11:22PM -0800, Nicolin Chen wrote:
>  * NVIDIA is building systems with > 10 SMMU instances where > 8 are being
>    used concurrently in a single VM. So having 8 copies of an identical S2
>    page table is not efficient. Instead, all vSMMU instances should check
>    compatibility on a shared S2 iopt, to eliminate 7 copies.
> 
>    Previous attempt based on the list/spinlock design:
>      iommu/arm-smmu-v3: Allocate vmid per vsmmu instead of s2_parent
>      https://lore.kernel.org/all/cover.1744692494.git.nicolinc@nvidia.com/
>    now can adopt this invs array, avoiding adding complex lists/locks.
> 
>  * The guest support for BTM requires temporarily invalidating two ASIDs
>    for a single instance. When it renumbers ASIDs this can now be done via
>    the invs array.
> 
>  * SVA with multiple devices being used by a single process (NVIDIA today
>    has 4-8) sequentially iterates the invalidations through all instances.
>    This ignores the HW concurrency available in each instance. It would be
>    nice to not spin on each sync but go forward and issue batches to other
>    instances also. Reducing to a single SVA domain shared across instances
>    is required to look at this.
> 
> This is on Github:
> https://github.com/nicolinc/iommufd/commits/arm_smmu_invs-v9
> 
> Changelog
> v9:
>  * Set cur->ssid correctly in arm_smmu_master_build_inv()
>  * Add comments for INV_TYPE_S1_ASID in arm_smmu_master_build_inv()

Sorry for a gentle push. This has been sitting here for a while.
And we are at rc6. Any chance that it can make it to this cycle?

We have a dependent series that I am about to send v2:
https://lore.kernel.org/linux-iommu/cover.1766088962.git.nicolinc@nvidia.com/

Anything that you think I should improve, please let me know.

Thanks!
Nicolin

