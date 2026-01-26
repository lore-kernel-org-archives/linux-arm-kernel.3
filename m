Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B53D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/kVm4ieWgvGM322zsByWJLrxNaDjtJEpUeMRcQtXVc=; b=rkhCCanaRuD5kbL3Wy/83bSvtR
	Q7j/WTlw+FS18l4e86guU8alOckkXF92pXJ4gb6yPSLlLzAdMa1dg+yQXrmbRLq437kg/OWqoMybV
	KbsyfxBfT73Aq3XD5+VX678eDdbJyatdmncHfaPq7nDDOhLqbtfhXjzJgkSxN2XC2QeB0ruXlNi1B
	MS6gC3+Hcy2MLFyR5yWUas5cYrmPh+NDSeLFdp4SYKgS9DaMnnhaV48tWuxlnz2JY4aW8cE8IayEc
	wrZMK60cDVCXIigI0DAxUiHYV8adxJmzdsVdmZV4NE6ORmEUEXNjcusQk2bgv6WGN1DDz40xHRUZ5
	McDyBmMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQk4-0000000D10o-2hgv;
	Mon, 26 Jan 2026 17:51:12 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQjx-0000000D0zy-3BPx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPaoZQhyx0bzZ/Q6jMjACznx2MqUS5TbU1tnF/RRTGE/zmSUPvVKx0g1tdTwskBUUFQJJT734siH2LRGEO4KGFjv0zRzrOeXbcrsEGndefkfvqBmeM63dDh4agxwswT1OVENeefnFWfQftZjhLhk86IRn6AGUbjdfdoE1WgkwmbfBEW3rx3blW4cY8j1+jxyPZAwInBpLlJqMQAZDTU5WRWnHWS4aW2Yie+fR6C37dPiyc1bxpcH47AVL5rk7ldH4FsvQ5rc7Q9Zvw1/Cvd0w02QEVew18EdOh9iA8GVX3jwcNy/EBtTB2HlzEsJQevhbyYZ1Q9c87PL4OMGrB95BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/kVm4ieWgvGM322zsByWJLrxNaDjtJEpUeMRcQtXVc=;
 b=ojMpfL9vrUBO3a88WzZ1eGybdnwGCp7RRzfY9qYumYd10d++7+B5TPra6tyDq9VcDb3kKIYW00KfMeSlQrJ3eZdCc5B/FP37hChHFqsmtptUYMWwC23TaUbtedIUfCw6H606Tv37uHzNwmAxEPAg9ZKRh8s0I7/yQPROm42Qz497Uqtvw5xekcboeU0jIBMKnp1c6febvKE+lbTeMQAwdut1i+Mr5GDTzPccOkyLB2FptcUg3C2GIGS0hFwfg6LVfh7HwwUUBiTv5VCJ0ds+bbl2MY1djrNRpyDFiB2AapvqT4h0vBUc+tEHATJtwBucYuhrKyV1G27m56Vd5+63jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/kVm4ieWgvGM322zsByWJLrxNaDjtJEpUeMRcQtXVc=;
 b=VGVx1eZMPJRUC/MHJ4eiJ5/J86eHRDgmroYtSL0gWeguOg+KMl4Z/wM8TaH8dsfg9KNyeRMsFBA4yYU3dCh+e391EyIuId1KTJjhHJDX7GR6dqNAEt4HLChrMubcDEqfik3mBpSV+SsLu/LSjTq0GzOcFSStgKpPsKPvmq7R17HWI6pfOZcZBLmFLsqaRncwDImo7vkWo9+uA7I8ZK7jCzbcebt5NudbfNjdpZUJW+mg+O4DDOXD4+JRXCc7lPN6kANGI45fwa7oy7BdkmTtdb+7mbAdPHC6clR557jeh2bU+4ggXbzpdI4B2d0tiCtKyG6br7p4YHRJ9Da/HQpNpg==
Received: from PH7P220CA0081.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::29)
 by DM6PR12MB4122.namprd12.prod.outlook.com (2603:10b6:5:214::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:50:54 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:32c:cafe::96) by PH7P220CA0081.outlook.office365.com
 (2603:10b6:510:32c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 17:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Mon, 26 Jan 2026 17:50:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 09:50:30 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 09:50:29 -0800
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 26 Jan 2026 09:50:29 -0800
Date: Mon, 26 Jan 2026 09:50:27 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, <jean-philippe@linaro.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <balbirs@nvidia.com>,
	<miko.lenczewski@arm.com>, <peterz@infradead.org>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 6/7] iommu/arm-smmu-v3: Add arm_smmu_invs based
 arm_smmu_domain_inv_range()
Message-ID: <aXepY63VzDxpQ0xf@Asurada-Nvidia>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <06999367d001283744fd98eb7c1823afd516ce84.1766174731.git.nicolinc@nvidia.com>
 <aXOqVcX9YEC-Ikdt@willie-the-truck>
 <aXOrnMLLzZL9BtRT@willie-the-truck>
 <20260123200327.GF1134360@nvidia.com>
 <aXdlnLLFUBwjT0V5@willie-the-truck>
 <20260126152019.GK1134360@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260126152019.GK1134360@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|DM6PR12MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c0ca70-cb8f-44c1-c677-08de5d037264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ngkowuIkP3YdHjjpQmiNKOM/lTf2nYYC3SgUCDjjAXd98sJLIQltOuuKC6Qi?=
 =?us-ascii?Q?ZVwSqqTwedEHIumaxWlcRXkZ9dXfMbs4wiBbYe53ny2AK0em2DgEZJWqT19F?=
 =?us-ascii?Q?usjfAM8nQeeH5UoKH7/qfvJuF+hDDYAnMdHv5NWSj+hFHYsrnytl0/tAah94?=
 =?us-ascii?Q?7jABtACQzjsP0XnwO/908kX6WA0IqW5YOEbZEBYIPSbdrjG4/Csds7fddbT2?=
 =?us-ascii?Q?oOPRQKajAWGwKXpLti27sqr22V8UqbeHD6iYjTrv85KB+qa7Kafc19ytPLpZ?=
 =?us-ascii?Q?ZESjcadeqF51TOUBGS+mIemx95TKH1VCwKDISOyAaRD3V9Cd+U76d7ayeau+?=
 =?us-ascii?Q?NPXA866y+JfDnQIlANrqofEY9/hDXz1PzUxyvk4dziA1z1Zkwug+pPZUMIZC?=
 =?us-ascii?Q?ODEnU7ixUH1L/OG6lAPOB1rfstYeRw83E8Q7gx2g6waKYFOnFmOBLqqK8z4d?=
 =?us-ascii?Q?a5rqqIbm3Srb1tNikUTJjuYroKqR6U+KxNZQH+OzOS5HeYaZ4ELcd2zeJ1Hv?=
 =?us-ascii?Q?G+x6ggDne1qDEY3JEgFE1qm50hXOV7D3Yn0SnmxSCGZYf0psVDazm6cnFNQV?=
 =?us-ascii?Q?bNYvjRkkLk0XVZY8mc2tn4+lBtSB7dradH8aBRvZgUuGmbCL9dypnS6X1Iaq?=
 =?us-ascii?Q?qVDUqDl+lHkeEeRZIOsbG0EnF+1zfg5NF3oeFGSsukcBrt+2gqFqUcGRBONf?=
 =?us-ascii?Q?VdeqGRaJOyagMeBN6/tj3d/6jrIdvNJ5nC7bYqpbztyO87blRwjHpMdZukxx?=
 =?us-ascii?Q?GbswhQ4wyeUb4MQF3TiNbJNlQh3QQ3f+AA/mfhua6xMQTX4btKmbVTv3C4Z8?=
 =?us-ascii?Q?j67j2jOIwBpc/d/kSBJpHAyjA/P6KsRPosmw1hywS8VWBRC1VEfS7w/TeJyP?=
 =?us-ascii?Q?9/Vu8Ep6ASIqLawTnEzXICLH0RXj9RN9QdcYoNHdKiKSkp+XR/WRiBYhffF2?=
 =?us-ascii?Q?VMdt35KHML42v8L1Ailuc9K7jTOz+SuelkzhhYOXGS8YBoq/zkzKyCY1IZa2?=
 =?us-ascii?Q?GthMHrt/sD6SInW6JYcQg3JwmCowtIJrLBtaetpUMuSfhTB+1PDjTja6cucO?=
 =?us-ascii?Q?rnH7Fz49jh9DRV9VCrpWyoGlnUgmrkAzuZ1D429NgP2jPX3ASDbpb5/VevhM?=
 =?us-ascii?Q?pWyZ24vPbbTJU40RKc30o3wZRxsjC+MKgy9Jhz5xdTxzMCbsV+fjC2j/8jpA?=
 =?us-ascii?Q?j1QzLqFpVMA/+PKe9ClGljL7ArMjyklmKqRLpCSKsZ4MyCILPwG8mQctFoNI?=
 =?us-ascii?Q?aMNXl6i8SBMzG63duKP/JnG37dznUPB4Xa9iIY1zT+0jmxb1CBYO48j+SkuQ?=
 =?us-ascii?Q?u6lXwxC0tLAwD554NxHqOgyCQYrdh2QO19rOmqfEPJK53Xp54HAOYsSuZOj7?=
 =?us-ascii?Q?suqj4q0nNvGJou/jeslddLO8Ec1X9mLdiKIQ9PmD94BSjwgvweoti2Y9gfLj?=
 =?us-ascii?Q?AuZQ5a+o7Z4MqnQpZat8pbW4Na9RnJBXUXdMc22c816bG2VWi+bTY483VRqo?=
 =?us-ascii?Q?lyoTaNbxOEzPIlM/E3JqhLNOeTa0rOVaMffL9tJAwe7xXwvU4otYdVgPSvP4?=
 =?us-ascii?Q?EP5fWet86lkbP/fTK3oeBYjTbz28qj88e5iysXCUXOLAvLCkpREQFcdd5JOp?=
 =?us-ascii?Q?8vQ2hZD+iGqdqGl7hXz0MnWedrq8h5I5AqTHe1hmUbwO3u1cYXczMGplbyVk?=
 =?us-ascii?Q?ikz6vcIIGOBor/Q01M1OjEnpl5Y=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:50:51.7650
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c0ca70-cb8f-44c1-c677-08de5d037264
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_095105_802438_717C6ACB 
X-CRM114-Status: GOOD (  22.43  )
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

On Mon, Jan 26, 2026 at 11:20:19AM -0400, Jason Gunthorpe wrote:
> On Mon, Jan 26, 2026 at 01:01:16PM +0000, Will Deacon wrote:
> > If we've written a new (i.e. previously invalid) valid PTE to a
> > page-table and then we install that page-table into an STE hitlessly
> > (let's say we write the S2TTB field) then isn't there a window before we
> > do the STE invalidation where the page-table might be accessible to the
> > SMMU but the new PTE is still sitting in the CPU?
> 
> Hmm! Yes seems like it.
> 
> However, that's seems like a general bug, if we allocate an
> iommu_domain and immediately hitlessly install it, then there would be
> no dma_wmb() for the page table memory prior to the earliest point the
> HW is able to read the STE.
> 
> What I wrote is is how things are intended to work, so lets fix it
> with this?
> 
> @@ -1173,6 +1173,13 @@ void arm_smmu_write_entry(struct arm_smmu_entry_writer *writer, __le64 *entry,
>         __le64 unused_update[NUM_ENTRY_QWORDS];
>         u8 used_qword_diff;
>  
> +       /*
> +        * Many of the entry structures have pointers to other structures that
> +        * need to have their updates be visible before any writes of the entry
> +        * happen.
> +        */
> +       dma_wmb();
> +
>         used_qword_diff =
>                 arm_smmu_entry_qword_diff(writer, entry, target, unused_update);
>         if (hweight8(used_qword_diff) == 1) {

I will attach this patch as PATCH-1 in v10.

Thanks
Nicolin

