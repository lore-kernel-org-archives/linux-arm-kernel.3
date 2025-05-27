Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCCFC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 18:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqnRYC5T5aA/pLnFAA922tll4rD3AKJb7IGxUwbE3bg=; b=CtkxqSvAwnXHV5b2YOQJB5J+7N
	x4JX2woBPfGxaGBSEBXdg7jz3zSBg/nAjzZ/su5Jlmzo5CvsVnnTwuZTC1MmDXNS3L/E0UoEEGq7b
	ozty19KHFzHckOVc6JAp//kWTSYmG/7sSfLlsRc8POALvOfY/uB7k6cF4uHn6b75D+0/4E6put0Tw
	QcNXu/QDYTQnnbWKLkNXGbu1VH8o3wcdwWBJutxXtPKlcTfMhbcFCnoelLgQVFzAU1XtXFUT0lgEI
	05CrR7V1R1B6OddB5mjYXdODFioWggxkQp9FBIN5qNIxK+PrvlgwB31sDJCCW1kUtLq5uGkILJojb
	29kg/3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzHY-0000000BN7w-3kXg;
	Tue, 27 May 2025 18:44:12 +0000
Received: from mail-co1nam11on20602.outbound.protection.outlook.com ([2a01:111:f403:2416::602] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzFO-0000000BMsY-3wt2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 18:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wp5XiuLCvF0ZOKatJTZ4pkG8uCBbhu7xVL7bALjLpZ/N2/ezgQgdrIviCti8vZTen9QQAcNilgMn3C75nYRm8bNJd1iidkAXyBCeEhtMXW7Im46pSoL5/DjQOf+2SE22oo5aGejuJZIL5ynr+tW8bUgZjrePtgEOE4zktHy6LyQ0WASY3Lil50/WZcYBwnw1a7hSPn5coRkyO4gUHlt2AE6dvSV7LT0xSOhO6NkK+kN3yU+iolIOGy4AyoapWScW+1FpMXohee9Eiw5BbTtzBu6vJcAkfacui7vH4YRGKwuZOlE6qQ0DEsCPhp11VuCrvDzVm7yjlV085EliZycjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqnRYC5T5aA/pLnFAA922tll4rD3AKJb7IGxUwbE3bg=;
 b=JRrpz/EX2MADPWR/rt1g5MoWm2RsfZANbX4iUP28C5yI9PotMJb10Fjk5U6xbtmzfoh7d6IW8JGARqC07efaQQXOzMOv8RGEE+IuNBMLwikf/pcZGQLRsedBWyyjam1NrpqRdoa0ykW/cBzjv6CSYuIgAL3z2z63/eZqFGY7Ic7iiB3Ww48NVSMYzmMm0m5urqEctv39aKJsG8yUoOo8OnDaH2SBMuWNvQfqmmMx6Ky9Al4T7q2VMUdHaDkQRKhve1gEqh43rqT9Nl5LOqdV5V5y3L7yf0EQwiyaoHyGU/nMS3T3VsvPy82vT4eItcGWSBhOx+Dd+jIBE4OxsQPdpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqnRYC5T5aA/pLnFAA922tll4rD3AKJb7IGxUwbE3bg=;
 b=t2iD62ssUZh0gX3DXKra8zNfPnP4DL74KjG7YWBFK59S2tQVBQPX+c2dn3vgbFbhQrMWfDfPu0zFQ2Sn3x7pIDIbZQO6kHWPosVZ9RN83rTxV7RXf1UCmulMqphikHyMF9/+o+Hs+LnZWrt1+oRQYb4MsCEdWSIUleL+yPs0pxYAo9dg9Xycxw7Z1KdNsiaoqHy/sVe3Wc5FZY82tqgToqtla2zZZRejCR1hTnqOxwMx95SGOmpdzFRW24fjYV9SJBjw8nGAJSYzyqVW90YB2DbchaNRn6svvPXxqgeHCTyixS5hYvrqLg1prWAUYpKVXSagHlw9Ny0mBuKCysN2WA==
Received: from BN9PR03CA0466.namprd03.prod.outlook.com (2603:10b6:408:139::21)
 by SJ0PR12MB6759.namprd12.prod.outlook.com (2603:10b6:a03:44b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 27 May
 2025 18:41:42 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::43) by BN9PR03CA0466.outlook.office365.com
 (2603:10b6:408:139::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 27 May 2025 18:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 18:41:42 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 27 May
 2025 11:41:22 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 27 May
 2025 11:41:22 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 27 May 2025 11:41:20 -0700
Date: Tue, 27 May 2025 11:41:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<bagasdotme@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: Re: [PATCH v4 05/23] iommufd/driver: Let iommufd_viommu_alloc helper
 save ictx to viommu->ictx
Message-ID: <aDYHT1iCxJKO9Vnh@Asurada-Nvidia>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <5288cec9804e7e394be3b7de6b246d8ca9c4792a.1746757630.git.nicolinc@nvidia.com>
 <20250514170637.GE382960@nvidia.com>
 <aCadeeP+Z4s6WzOi@Asurada-Nvidia>
 <20250516132845.GH613512@nvidia.com>
 <aCemeved47HE6Q2B@Asurada-Nvidia>
 <20250526133046.GD9786@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250526133046.GD9786@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|SJ0PR12MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d07137f-67ad-4ba6-a401-08dd9d4e1fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/LK9nmZCvnL0JN+uNjEJq6OX/co0F7i7rCBoQl5/7QSgxG1mHAh2AskIJo5H?=
 =?us-ascii?Q?pR8yxVSdUOMFIw/W3hVgjAw7m3/S9egV6aovlLAu+j67rP4wP9kYIZFsAG0j?=
 =?us-ascii?Q?iWotrf1FMRAISfo6jgDNFweWpRqMRt37xg7Ye7t70IsV3DqDhGlB7P95svN6?=
 =?us-ascii?Q?fZIgEUvD/Io8ohByX6v2ojmRdyieBW17ncvQpDag8SOzw0esuw++as+U5ZXB?=
 =?us-ascii?Q?0g6qTgyJKk0xHZ6LUlSRcNfpiqPmzNUlK51ZYU1DX1TeFS7FdR7pByXtHPiJ?=
 =?us-ascii?Q?vIzrh3ZkploybxbuG3cY7UJNT4c3G4E+RgFAFHBScPF3nkVw1lZ16SfFiVA9?=
 =?us-ascii?Q?36hbw5qFLbrCJTkXemMghb8P5+0zi1a6nI7IJ562OXnATcYYSdYM52jJ+xtQ?=
 =?us-ascii?Q?7LDIJOaG7ERpwg/cI3235HFLmGlqXI+bUlCqVAuwO9fAdRGUrYekRcF4IG9/?=
 =?us-ascii?Q?u8o0eP2N4eaF1ocvIxU2pT4rp3/tpx6O7wq92MCFM/Oop9WbwZ+C8LPMGN86?=
 =?us-ascii?Q?3g7p8nxvMfq20RRvR7TbaGa1T8K/Pok/cEsUEbDM4Wb2/IRiph87xu798Yid?=
 =?us-ascii?Q?r3Z5LiTW+BCCykGsT4fULbxdQLPcNJg5K2hpCWcgglf4hRrvy6SHORydsdLl?=
 =?us-ascii?Q?3rezZzX1tt+nMWHD0QDTpZsN4+TIjwGTWSpXqVeMQqTOYGIwFhh7odts6yvz?=
 =?us-ascii?Q?EnQXGjXN3hKf1/q2YLePPPX0A38minhXSZ7EHmWZbY1k0sd49U/WdhXwSxUM?=
 =?us-ascii?Q?cfJe3TCEblyC1Gt0BM8Ek0hSQEVuSdHfLc7eu+jsrgyk8P68wFLIVvI+Vylg?=
 =?us-ascii?Q?Zli/L7dlrPyvLo+9eO+kBgcHVCSqIEopD5jx7xDM7M861QJEwacK3PxGkMsJ?=
 =?us-ascii?Q?3b4yZh3em35y8SafxwXQKr5jeqlWZB+EupbReyw1p0JgqKN9rgBZysabbR6t?=
 =?us-ascii?Q?7AopTk/FKnKxkeYnqxAUjhioN7q4sf/iuGhUD08G8Hsxt3B7ivhDHBptpxLD?=
 =?us-ascii?Q?WLL2XBH/AiOWzZOn/SOIjIoF945o8VkntL+OGfk2FhxOz8bjhTZhHjpzk5qn?=
 =?us-ascii?Q?AAyjZer+bSHkF6F6f24QNxqm/BmWPO2bWVxBCkwgFvR/aH+gRofzmFwKr5bd?=
 =?us-ascii?Q?i6t8tIOG/NuAm0y6bIEC8KM5dqe2tgl7kvsp/N7EDfwdNHVeifacuKcnPKWt?=
 =?us-ascii?Q?Rhw1y4OVb4qJUAnN83ttrDmCQ6Syl05rSGizTI1jRRcXQTSDT8MAmfD8jBW8?=
 =?us-ascii?Q?4A66/PzRrpp2xeafXjo4SaKrvusVtMI3IKfy47vVOVATa0JJhefkaRZG7O4K?=
 =?us-ascii?Q?4AepjOV/goRiAWkiB3TmrDPLQMkYi7GeKmlI3mkSYCWLysFXoZn2mnCfSsmT?=
 =?us-ascii?Q?dMAe3UQFb0WZHNtK7Nfu/nYrK2fEtJ8uLUR/+QeS5s8VE8PBW3S0NHjOgNZu?=
 =?us-ascii?Q?pWu5wH6sxriQ8HTtHPi+ebPQoPw+9WuvN/6DQyTPoMLz8sSxZfEzVME0SZMn?=
 =?us-ascii?Q?MepasbXtR4pwIXcxQUGNRvdGIOfZEGDw4SH7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:41:42.0543
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d07137f-67ad-4ba6-a401-08dd9d4e1fc6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_114159_004256_436010FB 
X-CRM114-Status: GOOD (  22.94  )
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

On Mon, May 26, 2025 at 10:30:46AM -0300, Jason Gunthorpe wrote:
> On Fri, May 16, 2025 at 01:56:26PM -0700, Nicolin Chen wrote:
> 
> > > You don't need to move this unless you are using inlines. Just use a
> > > forward declaration.
> > 
> > Since we forward ucmd now, ictx is in the ucmd so we need this
> > structure for:
> > 
> > -		if (!IS_ERR(ret))                                              \
> > +		if (!IS_ERR(ret)) {                                            \
> >  			ret->member.ops = viommu_ops;                          \
> > +			ret->member.ictx = ucmd->ictx;                         \
> > +		}                                                              \
> 
> De-inline more of that function probably..
> 
> Also seem my other remarks about not storing ictx so much..

I found that all other ictx pointers in vdev/hw_queue are unused,
as the core simply gets an ictx from their viommu pointers. This
means that only this viommu allocator here needs such a storing.

With that, how about a change like this v.s. inline:

[ Sol-1: Store ucmd ]
----------------------------------------------------------------------------
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 2b30627d1d8ed..513af9ba04f17 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -60,9 +60,15 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_hwpt;
 	}
 
+	/* Verify if the driver correctly calls iommufd_viommu_alloc() */
+	static_assert(offsetof(typeof(*ucmd), ictx) == 0);
+	if (WARN_ON_ONCE(viommu->ictx != ucmd->ictx)) {
+		rc = -EINVAL;
+		goto out_put_hwpt;
+	}
+
 	xa_init(&viommu->vdevs);
 	viommu->type = cmd->type;
-	viommu->ictx = ucmd->ictx;
 	viommu->hwpt = hwpt_paging;
 	refcount_inc(&viommu->hwpt->common.obj.users);
 	INIT_LIST_HEAD(&viommu->veventqs);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index d74c97feb9b52..6843c748a6f74 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -104,7 +104,10 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx);
 
 struct iommufd_viommu {
 	struct iommufd_object obj;
-	struct iommufd_ctx *ictx;
+	union {
+		struct iommufd_ctx *ictx;
+		struct iommufd_ucmd *ucmd; /* for allocation only */
+	};
 	struct iommu_device *iommu_dev;
 	struct iommufd_hwpt_paging *hwpt;
 
@@ -262,8 +265,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
 									       \
 		ret = (drv_struct *)__iommufd_object_alloc_ucmd(               \
 			ucmd, ret, IOMMUFD_OBJ_VIOMMU, member.obj);            \
-		if (!IS_ERR(ret))                                              \
+		if (!IS_ERR(ret)) {                                            \
 			ret->member.ops = viommu_ops;                          \
+			ret->member.ucmd = ucmd;                               \
+		}                                                              \
 		ret;                                                           \
 	})
 #endif
----------------------------------------------------------------------------

[ Sol-2: De-inline ]
----------------------------------------------------------------------------
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 28dec9e097204..0adb1a552e457 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -54,6 +54,23 @@ struct iommufd_object *_iommufd_object_alloc_ucmd(struct iommufd_ucmd *ucmd,
 }
 EXPORT_SYMBOL_NS_GPL(_iommufd_object_alloc_ucmd, "IOMMUFD");
 
+struct iommufd_viommu *
+_iommufd_viommu_alloc_ucmd(struct iommufd_ucmd *ucmd, size_t size,
+			   const struct iommufd_viommu_ops *viommu_ops)
+{
+	struct iommufd_viommu *viommu;
+
+	static_assert(offsetof(typeof(*viommu), obj) == 0);
+	viommu = (struct iommufd_viommu *)_iommufd_object_alloc_ucmd(
+		ucmd, size, IOMMUFD_OBJ_VIOMMU);
+	if (IS_ERR(viommu))
+		return viommu;
+	viommu->ops = viommu_ops;
+	viommu->ictx = ucmd->ictx;
+	return viommu;
+}
+EXPORT_SYMBOL_NS_GPL(_iommufd_viommu_alloc_ucmd, "IOMMUFD");
+
 /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id)
diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
index 2b30627d1d8ed..259fcfd85b1bd 100644
--- a/drivers/iommu/iommufd/viommu.c
+++ b/drivers/iommu/iommufd/viommu.c
@@ -60,9 +60,14 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
 		goto out_put_hwpt;
 	}
 
+	/* Verify if the driver correctly calls iommufd_viommu_alloc() */
+	if (WARN_ON_ONCE(viommu->ictx != ucmd->ictx)) {
+		rc = -EINVAL;
+		goto out_put_hwpt;
+	}
+
 	xa_init(&viommu->vdevs);
 	viommu->type = cmd->type;
-	viommu->ictx = ucmd->ictx;
 	viommu->hwpt = hwpt_paging;
 	refcount_inc(&viommu->hwpt->common.obj.users);
 	INIT_LIST_HEAD(&viommu->veventqs);
diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
index d74c97feb9b52..50ac3a5703520 100644
--- a/include/linux/iommufd.h
+++ b/include/linux/iommufd.h
@@ -209,6 +209,9 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
 struct iommufd_object *
 _iommufd_object_alloc_ucmd(struct iommufd_ucmd *ucmd, size_t size,
 			   enum iommufd_object_type type);
+struct iommufd_viommu *
+_iommufd_viommu_alloc_ucmd(struct iommufd_ucmd *ucmd, size_t size,
+			   const struct iommufd_viommu_ops *viommu_ops);
 struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
 				       unsigned long vdev_id);
 int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
@@ -231,6 +234,13 @@ _iommufd_object_alloc_ucmd(struct iommufd_ucmd *ucmd, size_t size,
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline struct iommufd_viommu *
+_iommufd_viommu_alloc_ucmd(struct iommufd_ucmd *ucmd, size_t size,
+			   const struct iommufd_viommu_ops *viommu_ops)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
 static inline struct device *
 iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
 {
@@ -257,13 +267,7 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
  * the iommufd core. The free op will be called prior to freeing the memory.
  */
 #define iommufd_viommu_alloc(ucmd, drv_struct, member, viommu_ops)             \
-	({                                                                     \
-		drv_struct *ret;                                               \
-									       \
-		ret = (drv_struct *)__iommufd_object_alloc_ucmd(               \
-			ucmd, ret, IOMMUFD_OBJ_VIOMMU, member.obj);            \
-		if (!IS_ERR(ret))                                              \
-			ret->member.ops = viommu_ops;                          \
-		ret;                                                           \
-	})
+	container_of(_iommufd_viommu_alloc_ucmd(                               \
+			     ucmd, sizeof(drv_struct), viommu_ops),            \
+		     typeof(drv_struct), member)
 #endif
----------------------------------------------------------------------------

Thanks
Nicolin

