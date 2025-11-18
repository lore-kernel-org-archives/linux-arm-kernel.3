Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5612ACCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAWdouTUiW0j7u2rHZQpuhIB1EeuqaCfBSB8UkAjb4g=; b=3WRT1F+vR97qFi5IzN2BlwLRGs
	wk3wVZ4pqcX5NfXShnnVDEyx5W2JbskDD5mz4D/zYyKQkosop8BUq0oIlXNRC44zNt/YwDKyCqYbF
	mCTR0elIu9saa03Mlkzj+kHeYkEp/jwSbnnv+jGxPInWdCQqa4szg9m1VTOhYAtkfz7wlyV0dypP8
	PhcS/peu2MiK2QyTUON0EDGwqyMoaRrNZeOsfOao544d0yKnlkrZ5mb3mSYewB+QT8CoFS7S00lHn
	J0ii+zPtTllLJ/0BX3vKtJe+FGJd15u7mMonxmt1yQ7VzGJZJSavWiNUB9kjXfEFBBL5yv3Z2Bx27
	eATdWmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFkK-0000000HWyM-1cth;
	Tue, 18 Nov 2025 07:03:24 +0000
Received: from mail-westusazon11010001.outbound.protection.outlook.com ([52.101.85.1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFkH-0000000HWy1-3E6d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPxyHHW3vBJ0ivQKOZwrTTbIkVKiIXI3e0a5bRcZ8qZY2UJPhzpqYzkfx0GC4vwvr/iTrJ+5DiIYJUdmhhJmeC77iptRhr8jHCioI6Rn+VXBzKGQdLZSw3sSemymter1mX9y/FYjnLlHI6T6VavdgFspYeKVltusy6HhW7ao5YBTg58bFxs2VQ5JGE47qndTj/jzi8xhafdE07seTr0tdqWp+vE71lLQ08WBC4B4AR2piaRhlIQUWTo/PQ5RVGJOEZPTd20x8A9Yd8PHzXxkwp7KdxATueGedSgzTvBXmiafPZoXt9dswPrYDHhhaLpLgfA/PeQ2Tgehhx3K7fbGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAWdouTUiW0j7u2rHZQpuhIB1EeuqaCfBSB8UkAjb4g=;
 b=O/p4crLUxiMSW6ct3rUB2Fx7ROk9lthQO2abYqS3LScb+ebn2aCp5l8/sgcj5yWtuCgxPxrwGXJjWvBjrOIi2uO0VtjuFtxQ95mvQqXVpFYL6v8T0gNJYBPmXSv4uCFdwH0roZD8lSEb3xBvV6hKS1seaBdxp4K5q1ukIBmazJ5PcRpRTcjiRZbMG68C+yldmggQO1ne4MdXelL0zfT8sQuotOAyYA/CQ6mkSr+HiX7Gbyi395hlyaEHc08JTSrIDve0uyMNAQF6julrX/mIOo5QPmov0GslBhBPxi/xbfmQavfG50Ng0a7E9PmaldoO5Qh2p7FEtA800YDA2mFy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAWdouTUiW0j7u2rHZQpuhIB1EeuqaCfBSB8UkAjb4g=;
 b=Bn3rC5on4fa+dPAAaEMsI0fhuFNKmXc4V+cnYr6M31jHd417wxFHBhoRF7m8l+ZjIftGrAAQhpPgIoJGW6dJYsfyb7lJVS41bjyREWkZaQVIDOvudo2HKcmqJs1COXEUMYxdOrFw84Ecv01XrEULfobD/5lsO3TfnFwQ/mA/JxOrLGbNwdgzrIGfV0JyqiAUk8JqRxaVK9ZvJgEf9GNv4BzZ+y/CjB/mhO6djt3dXRR8VaTm3v+Chdg5IwB9HjtTTlPJzdo8z3VQiXYY9IRDQag5o2PtRayJB6tcU8DPvUKl6keHm5knaX5RIVFwoPEb0XwaVsSn8+FFJYkqRSbgWg==
Received: from SJ0PR13CA0029.namprd13.prod.outlook.com (2603:10b6:a03:2c0::34)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 07:03:15 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::51) by SJ0PR13CA0029.outlook.office365.com
 (2603:10b6:a03:2c0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 07:03:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 07:03:13 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 23:02:55 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 23:02:55 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 23:02:53 -0800
Date: Mon, 17 Nov 2025 23:02:52 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <joro@8bytes.org>, <afael@kernel.org>, <bhelgaas@google.com>,
	<alex@shazbot.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>,
	<will@kernel.org>, <robin.murphy@arm.com>, <lenb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: Re: [PATCH v5 3/5] iommu: Add iommu_driver_get_domain_for_dev()
 helper
Message-ID: <aRwaHMcgQNqV/cCG@Asurada-Nvidia>
References: <cover.1762835355.git.nicolinc@nvidia.com>
 <0303739735f3f49bcebc244804e9eeb82b1c41dc.1762835355.git.nicolinc@nvidia.com>
 <d5445875-76bd-453d-b959-25989f5d3060@linux.intel.com>
 <aRTGwJ2CABOIKtq6@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRTGwJ2CABOIKtq6@Asurada-Nvidia>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d25a5bf-bb2b-4e77-abb0-08de26708a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3YvuBeJpjKx8nYEvFg3Zp/tqCEYzuLHT2jT6idOqZGmTWM/Y6tdfk8YgtgJH?=
 =?us-ascii?Q?x86clj0b6xL3mds2rzi8ZjQFN0xcbuydpd5/VSVZUBhdU62S8+bVT3EnBDoX?=
 =?us-ascii?Q?ps5+ukrF57hLrxantQpoIROlasWMHmjlsg+4titroYF1ayDoB7BwiqDZWPAt?=
 =?us-ascii?Q?kgfs/8M0OezNZpfFrzHQYjmaCHUqqHG+bndu3W67xPxo3sM67G6GBPxbvELA?=
 =?us-ascii?Q?Nogy5tLRZigFnnY/dkDVPpDc2fQFLQZiKT0OZRvBTOO9ptDRJwhb4wvB6PI1?=
 =?us-ascii?Q?ogQrxbE0CdtNEcyR9wOFyve9j68hYYYUhZt6iOaW3ewtaSEcSinI3FgMq3lA?=
 =?us-ascii?Q?9UmGbAdaHKp7VPsYqt6wNoIkMNUsO6NYtxS8yhJsNCl1e+vMYgpJwshWVDP9?=
 =?us-ascii?Q?FZTxnWQBCGyDVH/0oVQw6IkJXJ04R8fGK4smW4Sw9zg8NHKCEznyaPCGnJLp?=
 =?us-ascii?Q?vdjIqdVxUoOTBn7u4GOCy/ir98MVY9zhr9JQoo1ZlppnhtcVS2womHDhWlkU?=
 =?us-ascii?Q?PmnQ03XRkLyjQEbH9vBXX0Fdv1BpvEIKn2Q9b7mF2KNKg73TvtP++owRDxQY?=
 =?us-ascii?Q?/EVTA5RO5QI1urbmfyigiTWqycFd+M7QRYCGNyGel2qavFd/j3Hze8CllJz4?=
 =?us-ascii?Q?PyiBUSYsJZ4bFZ3fz5vIy7OWesSyiW3Rt+SPC1FvJ0Z8hN5g1FzRrdP8jENm?=
 =?us-ascii?Q?T+zvi4r9hFXTxGBI3shWvaoiBikOglEHUIZUgpGI0t33Emdkwvip/3YUuhrz?=
 =?us-ascii?Q?82iOUoF95JQW9CR/aA53ZAg6/QdV+gyuohNrpN0YhbvrzIvIQFd/gpdBPzZ0?=
 =?us-ascii?Q?1KSbjzJ5PEZYlknDMeX6fn1C7OaX/+pFlRt0IyDN0ouSK9sVTFOE4w+HO0T7?=
 =?us-ascii?Q?DTexzYToF0YMpIbh55QE3+ItMTRClSrJfrjjxbber7NbrW6vl9Xd10ZHe3nw?=
 =?us-ascii?Q?tgdeYe4wcgcJhtnH9tzz82YGm0dj774zlmdu/meiLeY4btgpGcYmbyutVLaG?=
 =?us-ascii?Q?kO55AqfrBEa4NZmungnxy78RfYKrDKC1tiMRgY8GtHn8WEBfZiInh+C3bp9k?=
 =?us-ascii?Q?9VmIopCtjRQ/KbdIA4F87SejXq7rVsrCJhg6hLMTWg5a+v5gSZLVO9CCgMjh?=
 =?us-ascii?Q?HqVWV9ZWJ4jV67w1vsJmdE1csg2zDmDh+eZnwv/+hMN22MEeaeYq1Fb77CDx?=
 =?us-ascii?Q?+/ijUAgxYdxSacUOnbwBKvc2NnZ3TA2GaWU0KL3TCXy0JZZQUhReXuRBK4cT?=
 =?us-ascii?Q?6gUKk44g0h1bBfAFJhJJUki5xTw0bEZGXLaZjWGuNwtX+pSdpP1bgIHfti88?=
 =?us-ascii?Q?3p+/MVJrAxlNdm0otsgba4OzqAmcJV+EQ3ZkWNP3v6zBCMVi4y97/2x7Hsry?=
 =?us-ascii?Q?maGmE+h5UagrrCU1LCv1V0gIalz4q/kddlIOV/7weHxfiLIpL3i6k1xB87qa?=
 =?us-ascii?Q?jnDu/nQxLEoEO3V1Ab3q8f1NfTfheoGY6kVNV14A4MHYc7mR62Lz1+ZksmOa?=
 =?us-ascii?Q?u7Ymk3oUvisLuk1UZznikDFMrwhVBj+YaTO4lWliVOwxvkRToQeUJom44n80?=
 =?us-ascii?Q?rz310WSTNc3azJSaErY+/0LTk5q89sKNpHPD4ei4?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 07:03:13.3431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d25a5bf-bb2b-4e77-abb0-08de26708a7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_230321_830401_C2ECF1D3 
X-CRM114-Status: GOOD (  22.76  )
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

On Wed, Nov 12, 2025 at 09:41:25AM -0800, Nicolin Chen wrote:
> Hi Baolu,
> 
> On Wed, Nov 12, 2025 at 01:58:51PM +0800, Baolu Lu wrote:
> > On 11/11/25 13:12, Nicolin Chen wrote:
> > > +/**
> > > + * iommu_get_domain_for_dev() - Return the DMA API domain pointer
> > > + * @dev - Device to query
> > > + *
> > > + * This function can be called within a driver bound to dev. The returned
> > > + * pointer is valid for the lifetime of the bound driver.
> > > + *
> > > + * It should not be called by drivers with driver_managed_dma = true.
> > 
> > "driver_managed_dma != true" means the driver will use the default
> > domain allocated by the iommu core during iommu probe.
> 
> Hmm, I am not very sure. Jason's remarks pointed out that There
> is an exception in host1x_client_iommu_detach():
> https://lore.kernel.org/all/20250924191055.GJ2617119@nvidia.com/
> 
> Where the group->domain could be NULL, i.e. not attached to the
> default domain?
> 
> > The iommu core
> > ensures that this domain stored at group->domain will not be changed
> > during the driver's whole lifecycle. That's reasonable.
> > 
> > How about making some code to enforce this requirement? Something like
> > below ...
> > 
> > > + */
> > >   struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
> > >   {
> > >   	/* Caller must be a probed driver on dev */
> > > @@ -2225,10 +2234,29 @@ struct iommu_domain *iommu_get_domain_for_dev(struct device *dev)
> > >   	if (!group)
> > >   		return NULL;
> > > +	lockdep_assert_not_held(&group->mutex);
> > 
> > ...
> > 	if (WARN_ON(!dev->driver || !group->owner_cnt || group->owner))
> > 		return NULL;
> 
> With that, could host1x_client_iommu_detach() trigger WARN_ON?

Hi Baolu,

For v6, I tend to keep this API as-is, trying not to give troubles
to existing callers. Jason suggested a potential followup series:
https://lore.kernel.org/linux-iommu/20250821131304.GM802098@nvidia.com/
That would replace this function, so maybe we can think about that.

If you have a strong feeling about the WARN_ON, please let me know.

Thanks
Nicolin

