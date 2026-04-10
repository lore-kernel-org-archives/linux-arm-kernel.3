Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E0F459E5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 21:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lakhu2AlOo4dePXuPxINKiGVJzogUvxOfVCkrpYI/UM=; b=RG5j2P7PBJyxSMhHcUFz+oiq9w
	SdhDNM6jZjXmSV1UA6Rof5S3euTinM6oZeDsVEsZmmG+LNpQYvKRHKPBCB9daKrPwEaXmAIR2MSPQ
	oUBtAq352DszV/re8BZ2FYTa104/ojP9J09m15MnXRIqxtcSWwkqJw5yDtyeMhGqlHVa+iFPEsX3R
	R3vtnTVR6BaMWkBQACdrCHZQ2zObN8UCmRDyewbuYFg1oleuP4AFdOXncT/ZwgiO/cN5oEAjYDNIW
	yWHiToetjAo1wTXnPaDrSZheI5pLdNs+2JNlaNFznyzIlhG6nFixQcWCamVt3I4JY8HaRMcfi+t1/
	q7dwQW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJKd-0000000Cp4k-2AAJ;
	Fri, 10 Apr 2026 21:24:03 +0000
Received: from mail-westus2azon11010058.outbound.protection.outlook.com ([52.101.46.58] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJKa-0000000Cp44-3nrA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 21:24:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0HmHiHuU6WCDMEVrZ0qn/QMO2y58R6Kq1I6lEacJ/iWjAHBfqym/357/Nsv4qmEuWk9nZn6WNXcizrgRQHUtCAMiBiHlLCfLj4SJnlaiYsU4puUP7m9uB8/MCqCe3XWeSS5b+Ji1rTTadtmyYkTZeiFKD20vfhRcSfaq0OGi+6VfrBnl9IslhaNt6P8RGnBteF7XlUtdCHmi7Jm7cvVwKvIzJY0/+7kCMUrpKHsPoH/x7euttWP3huI8Gc3xN8xi7J4DhIGCeFAF2PCD1/N2qdFevmuuR2QoZODQGpDSq5R2V3gy4ol1v8A/Oju8ya+bR93DEKZDbSzm+jTO8iXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lakhu2AlOo4dePXuPxINKiGVJzogUvxOfVCkrpYI/UM=;
 b=vsF54hhQqhTPOxXajo5mtv79kX24n243F3MxgV1Q2fO+VI5ruuA9D5gz64MScAzEGriBL63JMJ/7hxyjt+99XTW/NptzsND4O9USUdrgl7Hj+FqgvV4fwk/+7WKDJP6eyjLyf7qaXCoJaF7eG3j8EaQsJbo9JKe8m2vCixIkPqfOlJY8gh2FNGL9XlmEpblMd+Lkzf79RjnlelZ9E+WxMy8EmGJBPzcsRuOx4YuBL1tAgINCdpllSTZvI5xNM3+6E07L8ketGu2lVYkzgqx2EW7Oog6dz7XNkF+rAu2Z+srnv6YSlda7hCUTSDfxw55WNUiq7QyZy7yTRfTgHKIwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lakhu2AlOo4dePXuPxINKiGVJzogUvxOfVCkrpYI/UM=;
 b=KbJYF7bXwnGA3zI0Iy8TaAAp575Geq6nQerPVLWPTuhOXIJF/u4A7DPHHg4NzhdDG1+dvyhXSRwGJjvhX4SaXptaCLc7GsGo85JeocHz+2pkSGT2ajdLGn20FjtdlAdCvKy1rjggyQGBnzNVRa4NSjl40Nap5bfSTuMLleg30WuZaTHAlQX64KdXELHkS00ALvRY+zguFMw6q8ltzRl8yrKyQbcnLQmNZe0uOXI6DcfXHrEwE8XcLjke0SPa1khomTynQGedmll0TZzAno5awFBVL3m8G0mEoB7bBQ11z56kV50b/vpZFtlYyRWFwn+Xy9knsdFvrSnIGR7BF0o2tA==
Received: from SJ0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:a03:33a::32)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Fri, 10 Apr
 2026 21:23:53 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::5a) by SJ0PR03CA0027.outlook.office365.com
 (2603:10b6:a03:33a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 21:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 21:23:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 14:23:50 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Apr 2026 14:23:49 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 14:23:49 -0700
Date: Fri, 10 Apr 2026 14:23:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jpb@kernel.org>, <praan@google.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 03/10] iommu/arm-smmu-v3: Store IOTLB cache tags in
 struct arm_smmu_attach_state
Message-ID: <adlqZLZMr9VfnKse@Asurada-Nvidia>
References: <cover.1773949042.git.nicolinc@nvidia.com>
 <ceb8150f229ee7bd355ec42d23e422ae2185492e.1773949042.git.nicolinc@nvidia.com>
 <20260409234223.GX3357077@nvidia.com>
 <adlG0QTAzdh9vA4M@Asurada-Nvidia>
 <20260410204709.GB2588311@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260410204709.GB2588311@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: ff44c918-f7c6-481e-1ec0-08de97477755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: U/KpUedej7Aac+yugdduupDbHr0DD1eVZBTIb4p15dF5MjVu6MYq2eiuVrPsffhi7R6DYylxGrndkdIsTymga2lx4eT4JVoq8zrPO8wmmhfRXbFBrw3oHtxRa0hewJ/lQlF1oVQCQnusKL3I1DQZI+x6fhQ3f8Oru+LSOxjf1FGK2LQLrriRbzFhxFUI+zYn0yh66pXHTDZhNg2xAvQppDJBLeoa1Zrom/CseRHJRnk5QcvzmvtUr6s8viMlcC787Uv1dAnK6ALcVJtLW7fRJEsE70/sGhMF4Rp2WQwjk+DYpyHzim+ROLWT3F32KHqC6tSJQGR6Nr0TiYj+AWzEuo/sMGluNIswWBuJTiIlgjOJ3wrKBfYx+AjBH5ItzelbX/0WUyzLLx1BHHOs5hEshqRCu5W5+ovPjy6WGDR3Fn94acu2IBbg08Gimflra1T76rS+sCCXWzjQ53wAiuPxgVVsKBXeM2Yyqxtijr7T1CcvDxdKmjTIusOfhHtTa2iIJ3FUEAhfjQ+vXRAwzEuDfQ+9dXvix5xYacB4ux9OpW8Ou9K++vS3S0t1aqpHCC/HVS9wyzqEYK3xLZ9tu/YEjJqkvNuiugBw/iNZkaAUY9a3F6iIO9KAHjcmeMiX8AOWz2Fpw3Q95my5+rT1yVGxS/aMG7XhJzahJ4sGwnJRpdkzsMDmiwZ/v8sCIm9J6XWRBsh79Y94nsh1GHloUOl7Qy0t3/TktPG7ABuO+uD/NpeqnMzTQHEcpyhvSRFiYNVbGawY2d2RS6mcbv+bVeYGsg==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FHEWscSX3QRAcrd6U4FP9KxfPwyzruq2mA/jKtoyX7ZNMtLrmZtogZ5Ez1lxdkhcDqc9eFPBCkZSFCObpA1yMPvcKcJvyON0EZ5xaFwXKFwadlHXJ1z+Ul1M8lW8RF/uvUsADuNR3HIkXiDGEuSolu7DJ5cxN6yDETTQSe/yb83SeJcQ4ymoZR50EhvKU9AD+Kr2KSCPTPfdrs+nbIiAAb+OEsJJXAvABy2JGZtlnetWf/d0B9cEbtuvu3u6syJ0bTzMDgaL2dbYaZSS6AqGGhXsWlOd36a0lSKF2sAp7mZpN7JAfBRSGyJYUFy1rbM4Is9zNRIu2eoAdcsn+LH7vNlpF7aUTvU38akIAdqOV2Ugjy4oLDHVyjv4UGoNSD3OnXrA0EJFAJwv4jsHgxfqPfrop8R7ugOLmW3qdLLyLoSLCIVXpqxGYDko8+2A3e2R
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 21:23:53.3557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff44c918-f7c6-481e-1ec0-08de97477755
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_142400_948331_7DB0949E 
X-CRM114-Status: GOOD (  24.32  )
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

On Fri, Apr 10, 2026 at 05:47:09PM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 10, 2026 at 11:52:01AM -0700, Nicolin Chen wrote:
> > > Only readers *with the possibility of concurrent access* should be
> > > marked with READ_ONCE. IIRC this is just the invalidation walker.
> > 
> > I added a cleanup patch to the beginning of the series and corrected
> > all the new reads/writes too.
> > 
> > > Places like this have to be protected by a lock or the whole thing is
> > > wrong, so it should have a lockdep annoation.
> > 
> > Hmm, is the lockdep_is_held() in rcu_dereference_protected() enough?
> 
> Yes.. but I didn't notice it there, not where I usually look for
> lockdeps :)

I added two new asserts in the find/get() and put notes in kdocs.

> But also that should have failed in your testing in the SVA case, so
> make sure you test with lockdep on, and segfault some app using SVA to
> trigger the error clean up flow.

Ack. I recall I tried SVA case with CONFIG_LOCKDEP=y. But it did
not cover the error clean up flow..

Reworking the SVA code, I found arm_smmu_update_s1_domain_cd_entry
is marked as __maybe_unused and not getting called anywhere(?). Do
you recall why we kept it?

> > > But why does arm_smmu_mm_release() need a tag in the first place? ASID
> > > isn't going to be used when EPD0|EPD1 is set, so the tag can just be
> > > 0. Probably make a patch with that change early on..
> > 
> > I see. I added a cleanup patch.
> 
> Also double check it still generates a hitless update, I think it
> should but worth confirming.

Both EDP0 and ASID are in the word0 of a CD:
    CTXDESC_CD_0_ASID
    CTXDESC_CD_0_TCR_EPD0

So, used_qword_diff is 0x1. I think we are good.

> Also is ASID 0 used at all?

Setting EPD0/1 disables any PT walk. HW could still use an ASID to
match the cache lines. But, in this release pathway, the cache will
be flushed also. And completely aborting any ASID usage makes sense
to me. So, passing ASID=0 to guarantee a TLB miss should work.

Thanks
Nicolin

