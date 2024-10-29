Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A917D3A69F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ged5/uc/yrcDLX8BL32oHUquc7hALt68gUQtK/zOQIg=; b=FhRXQGEnt9F+XOYMAqpHdvfe83
	KgVfg6uDNfIhBXj4bfuqPwRTAX/rZ0Ok3/FufZy1sD6N5gqMVl6BNT8aBoUBJIgHo5fkpc9MVkrrQ
	cw1rGHNP2km26K6tdVwgq7zXGwwJNjqYMQMNRU1yoxmTDB+5IjsLBY95MSBPAyTXLCDWa+KqXMBOa
	OEHfNtrKhf5zDy6Da4B/pcv0/F9bo+gQK/tkT4VUkTY7zxHeHdaQsIlMnH31BqnQb8VqICQyRpdi4
	/YmDgKZueoV2cwzEBXFO9JPJExQp3w93XrIo8IVJ+A00tOEnwcnJgbuUy1ZAcTOlW1yoJJPITY7dB
	yFvw+uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5t5r-0000000FrQS-1oSk;
	Tue, 29 Oct 2024 20:45:35 +0000
Received: from mail-dm6nam11on2061e.outbound.protection.outlook.com ([2a01:111:f403:2415::61e] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ry0-0000000Ffs0-3d7D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr//cEvlzthcstRWsnPEo+v89j4Nn8RlgLKQkFELaEQJRiAnMJRU4GM5f+5rfwSCD8ZWsvBtFxx1O2gMjeRxt1+OAtT19BMbRBFO6AZ9mPSuX5VTQWvITsUTjWGduhkjikZsvZ99Ot+imPN5yHMkc2ZujcmxkgfACMZkHAxKQTVnc/kYl8yPGTnHtEfDaCAfMdf44F9TgM4afKPwa1SnU+F0pS0UE7ygtZdX1e9L9h4tBXWl5uccHnkzV2PsaCmJB6Dy6vhmRATWaTCz0IUun/jgE/upYhudLFYSpNWaQqdkNBurTyE48QxiRn5Vq36/3Apij6T9dtHsvWXtUmGVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ged5/uc/yrcDLX8BL32oHUquc7hALt68gUQtK/zOQIg=;
 b=GlzjX9mbVckcUO74gY2vhhWIYmrW4GZb0abiRhkTH60SZHa4jyoh/FgphBxFvrM5gU6Cp0LT+Drf/DVAmSpjGFH620x7IEO+lwRF7cGwi3bLykHCiIyPbxiQghggbug54ldO9RXdWJnRqyYU4Hdd3yFlknqSujnZp3TQLyvHvFVVJguY6rF2543KCEtR93GCi6NkYsUtmX2i2ofsrfdnMwOn2X10fdU2pZd4S4wMjc9cHQDhqHLEZsCA144Ms/QRFAKtmBirLcProYMj/k4jPQ7aeNM5Dacru2Jz2wybZrIDZvxnqTBzk0PnuAFQESbnp6qbAtUtMhhiyyc3PihaNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ged5/uc/yrcDLX8BL32oHUquc7hALt68gUQtK/zOQIg=;
 b=tk7f9RIjgT+4Axmvbwj74Qjeo3X3IxJHZFGbJO9+FPTBh6gJzR7vaaRxiUTGTN2sFes0qEg/fAp+6m3dE3V7aQp77rOlXSMiPEz+w5q3AZBv2z2NHB9ypeie2CZ8o1omQJ+rhEmPUi/ESMKgnXMzH9AZ9kj1QqYa+QvsyogYGxN4GP4mhtzZJGJwxcBmfkZ64UQXI+q57HlbGT/ztZnyRnRT73SNjPWobS5L17zHPMRwPucXCKMVB7Rn+xDOO5W4EoUExvU9kpWu+90S3J/Ymef9aBTcjTLPtU6B6V864GxbQByNA5VIeasgghNHvDicKkZcu45xW7a9HVPt1DZZpg==
Received: from MN0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:52c::34)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 19:33:18 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::2c) by MN0PR05CA0020.outlook.office365.com
 (2603:10b6:208:52c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.15 via Frontend
 Transport; Tue, 29 Oct 2024 19:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 19:33:18 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Oct
 2024 12:32:56 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 29 Oct 2024 12:32:55 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Tue, 29 Oct 2024 12:32:54 -0700
Date: Tue, 29 Oct 2024 12:32:53 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <will@kernel.org>, <joro@8bytes.org>,
	<suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<eric.auger@redhat.com>, <jean-philippe@linaro.org>, <mdf@kernel.org>,
	<mshavit@google.com>, <shameerali.kolothum.thodi@huawei.com>,
	<smostafa@google.com>, <yi.l.liu@intel.com>, <aik@amd.com>,
	<zhangfei.gao@linaro.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 03/13] iommufd: Add iommufd_verify_unfinalized_object
Message-ID: <ZyE4Zdxvge0vm6j0@Asurada-Nvidia>
References: <cover.1729897352.git.nicolinc@nvidia.com>
 <e99946ea0128370349373c94339d465397946137.1729897352.git.nicolinc@nvidia.com>
 <20241029144907.GB209124@nvidia.com>
 <ZyEKvcpgUsS1nCEg@Asurada-Nvidia>
 <20241029185558.GZ6956@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241029185558.GZ6956@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 986ef0c7-ff0d-4aa4-e203-08dcf8508a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7/4cYC3BF7J/ct/75atLkIexrlkXxqCucCdzgoTPTPzQdX7UuQCxWnGI3/8F?=
 =?us-ascii?Q?7fskP0al8sr4Oa8dH102e/BqDhCW4ToOlKfjQA7FvoFv24psCIqi4MohbyJB?=
 =?us-ascii?Q?hQicfEuxx2dZ72qk1wiEW5QF8J8OFBwUkY35glLd92wkAgAHhJQ6WImweRX+?=
 =?us-ascii?Q?NbJ7PWD2/5UUdu1X6XYTZ8wJPEJ30MrkeiZ+V8vfNItHlqwffntY+SuX43Ri?=
 =?us-ascii?Q?V45W9Qr47AVOb9cMQK72ci8n3Yav3dl1JqTat8aRYtkUAycK7U/KYnvMjaJj?=
 =?us-ascii?Q?ENjhS0b2y69mYanIQgx4R4hX+OOH1JcKbv9AQdcfuxYx97/PywDU2HEenfWq?=
 =?us-ascii?Q?nxrt7DPj4pbUh23kpvXDR95H8Qd7SECi9X6t+JO3Kupo/C11fxNpED84zAiE?=
 =?us-ascii?Q?tpsM87XHwmBwqnKEvwBzYUSqXm0QCae8LfaUbaBo/fpWq92A/QYQXb41VtgE?=
 =?us-ascii?Q?aod+a/ok9G/dKoPo47DomZzrba16Z8/R21oI+y4Pl049t7oRRqjhTlr2LUZc?=
 =?us-ascii?Q?zH9H6Dwp+y56oOmacNVPBDtDkUTglJL3/deTYjgeNhmE3788w6nP1JlCjw3u?=
 =?us-ascii?Q?ULzN29P+b5ouXNpr97VozqysKHVNszoNvmRxGnkILT2dFrbFftPO0GjBF3xh?=
 =?us-ascii?Q?4STWomHmSvtApuBjpmlKJWEajpAQCSpbXiSBmHhL2Qkf0JFUrQxr4nt6hjtz?=
 =?us-ascii?Q?pqdHWocZGWc2zuZp5979mo/ICTUgupfwZ3o8ZnZpZguTq4v3I77aRfY7GlPH?=
 =?us-ascii?Q?lhPDHSVdQqrrtNkapRoMlZ8Kl5pADisBjmKbR+X33IEZH064F/RquxStVNYU?=
 =?us-ascii?Q?dwHhmhj95+kqFDt0lHkGFB1SxzdmFxJglRaH7oI+AwtDFZftNuPQd9hdadtX?=
 =?us-ascii?Q?/hfPDz4QIHOCZfDUOqnp950xwDuP3zrHKIUkfjCIc3HKdWnPfKQ4eQZhkIzO?=
 =?us-ascii?Q?zQevysFRAk15+LoDxbf3BsIYFxZGkyRukYdtXBqbCwOSaaT061G5dp5Pa10E?=
 =?us-ascii?Q?osoq8QD3uo5YLE5iS7lkOFfZh1eTLv9EL30TiiWLDlukhBbop+jyYKoYs2/3?=
 =?us-ascii?Q?TngKSNR0NcUJ5O7PC+PXLsOTM20LlpXIAeFV83bauAuXYTfi0RizCtIcXxJN?=
 =?us-ascii?Q?bx/rgQgI/EfbEkIPsSQqI/kaeBQHoDpISDo82j/K0+nkODOLBsIzS7/+C+73?=
 =?us-ascii?Q?UB6AfxpfaMFSXsXt2LjSmZ4YGdLLV0oJNtvOT3uiGCEd6clP45yEi5yX1b92?=
 =?us-ascii?Q?DK5mf5HGKr3Vxub8PPBQiwbF8c342Kh5sEQpLTZqbxpUFW81YhIOLCJRX08m?=
 =?us-ascii?Q?b1KY3g6898UT2fDKdTsZcMkW4JNBM19aqWOT4MY3Xfle0m2OLs+wkXHDNcAC?=
 =?us-ascii?Q?ZV/kF/OwxUx5tsTuUUQCCLQAGG1hnwMcz/ct1j7MjacO4nMpMg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:33:18.3952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 986ef0c7-ff0d-4aa4-e203-08dcf8508a96
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_123324_932418_BD503098 
X-CRM114-Status: GOOD (  24.73  )
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

On Tue, Oct 29, 2024 at 03:55:58PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 29, 2024 at 09:18:05AM -0700, Nicolin Chen wrote:
> > On Tue, Oct 29, 2024 at 11:49:07AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Oct 25, 2024 at 04:49:43PM -0700, Nicolin Chen wrote:
> > > > To support driver-allocated vIOMMU objects, it's suggested to call the
> > > > allocator helper in IOMMU dirvers. However, there is no guarantee that
> > > > drivers will all use it and allocate objects properly.
> > > > 
> > > > Add a helper for iommufd core to verify if an unfinalized object is at
> > > > least reserved in the ictx.
> > > 
> > > I don't think we need this..
> > > 
> > > iommufd_object_finalize() already does:
> > > 
> > > 	old = xa_store(&ictx->objects, obj->id, obj, GFP_KERNEL);
> > > 	/* obj->id was returned from xa_alloc() so the xa_store() cannot fail */
> > > 	WARN_ON(old);
> > 
> > It feels unsafe to carry on the iommufd_viommu_alloc_ioctl() until
> > iommufd_object_finalize() as the function would touch the returned
> > faulty viommu pointer? E.g. what if the viommu has an even smaller
> > size than struct iommufd_viommu?
> 
> This is Linux just because the output came from a driver doesn't mean
> we have to validate it somehow. It is reasonable to be helpful and
> detect driver bugs, but if the driver is buggy it is still OK to
> crash.
> 
> So you don't *have* to check any of this, if the driver didn't use the
> right function to allocate the memory then it will go bad pretty fast.
> 
> Improving the xa_store() is something that will detect more kinds of
> bugs everywhere, so seems more worthwhile

I see. Thanks!

Nicolin

