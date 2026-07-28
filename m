Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B50DC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCE/k9KLUR+wbARastUqG5zfPao24qJHyU+JFRYqt88=; b=e6deLoEGoBWIbhJMgrh/PzeEhn
	j7mWYKDxPyX223klILwZai5TWzEOU7f2X0rnIs1tC4P2uRJmT2WX5LG2laikqBTpS5EvHhgcG4qPZ
	16TB0tWoUrUEoyntWYsWlO3kPocMu8MaVJWypy1ZqcrCvTxTNraTbfo0+A+or2AlYmcEyoS0i3yHK
	hJJDv4yedfFbSeiFpcwBW+WoISDvHqCaGjy+UseVUyH/+kj33ZmM8Bdj1G575ZBcF/cGdyJEiKiO4
	rLUGDwqSIq+qekSZ27dO8OSvqFtwthsAyfOHzTToFW2KbTRssANsjxpTgWggOd5jgXhE4PC3tAWlC
	5fgm1mdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolWp-00000005wHb-2TXa;
	Tue, 28 Jul 2026 17:23:43 +0000
Received: from mail-northcentralusazon11010015.outbound.protection.outlook.com ([52.101.193.15] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolWn-00000005wHC-0egq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 17:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwTg4r5e/RKoSdEON3MXmjQ9MyJ1K+ytkmQYh/ZmPKCny0OBP4M3ln2CeeqoDRj9HwBcLMMvmAtkDJwCPXVKC7MW4G831/hG5HFn37hO7r/sU+NXeuqjkLBIMuuYmSdYF8Hiuk/ue2cYCsr60GKwXEQsvYhp3ZEeqG+kehHOj55ffDQVvVS3H3LkjyCA5YMqGZW2Gi5URP8zqXFJ/R2fAaCqebaN6pWFzw49IW8xMdNIapu6nP6GhKC7jTq6aBiTukPonfBYJXElXfIGUQTqfB4cf6q90dHIVgS3IICUE1iG6QL7hXVWJc7iEeWZCe/+sDq4A76wG9kULZQ+F75KYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCE/k9KLUR+wbARastUqG5zfPao24qJHyU+JFRYqt88=;
 b=hu8wAuxJWIEhgXEUHNBY3QPrhTHnPLuODSBH77/qSWcZvfMCzeW8I6ffPwElGM8BZBNAoml28Ncxpga1HncK5gWYNqkrxE+M78JDzTXZOQYngsYlmsXvCrrGN8fI6FS8NNcVfkJxHpsLgDL+ODSpDHxqJXybcHEEsHYa+a2XowpNATSZEzzdI1MZTwXTKIZherEg5Qj1CvnDNR/NE1qjA4bXj5P5nXkMyLekMeEjKY+/v+gcQhq1WIBvtwNqjiAqtyetBA7Frn6kX06NUt31Qp9RWUoX/y9szs2wPrTO8eUMTIXM4lTM5/UDaWuhTfEjPrXdQdjBkAzcYgoFuAbiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCE/k9KLUR+wbARastUqG5zfPao24qJHyU+JFRYqt88=;
 b=HA6E3xAPD0gUF4mi0M8FZE52dNL8m2J1yDGzxeoG95fDn5ks2SUIGgO6vknM0+FrL4iasOCdE3Ro3gCRsmVcszM/1z6O3lRk7RoWFiN7iWIYRWaFHnopzSrfBiClmllGpIjvecnkQR2xC56zLsSOFp1vVyFLhZyIG92gcnvgfVhUgRjCuyUg8SlzWU1xx6Tq+M5529vWDFAYh/k+ro7OqoyqKhtt0d6YWU3i4djKRGeZjAl8ZhyhUx6KNk6nsK8Xa4tyRJo6W5KE7wrWmNCFD68/DI87xSCWbBJdIbNh288Mg1yBzMZA73O9fvhEXfaouYk87EK8ExGOWDt7NsKUZQ==
Received: from MW4PR04CA0349.namprd04.prod.outlook.com (2603:10b6:303:8a::24)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 28 Jul
 2026 17:23:26 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::9) by MW4PR04CA0349.outlook.office365.com
 (2603:10b6:303:8a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 17:23:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 17:23:25 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 10:23:07 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 28 Jul 2026 10:23:06 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Jul 2026 10:23:04 -0700
Date: Tue, 28 Jul 2026 10:23:02 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
	"Robin Murphy" <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v4 0/6] iommufd: Iterate the cache invalidation array in
 the core
Message-ID: <amjldtTZBNLWHOJR@nvidia.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <20260715201521.GL3775915@nvidia.com>
 <alft3llhZ79t17j8@nvidia.com>
 <20260716151845.GO3775915@nvidia.com>
 <alkE4iUQSWeD8Vyx@nvidia.com>
 <amiSKPx6-VXBxGBK@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <amiSKPx6-VXBxGBK@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DM6PR12MB4338:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a83a794-6ed2-413c-ab61-08deeccceee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|23010399003|3023799007|22082099003|4143699003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: QbJGohaSTaJyLdajlSH//1Ekl/GDjBtDYDXLLjPiRzWyc52v/1ak3WpNVi6RRwlsX0sDwYls5zbmOlWydJpxyY8/gQDvj5ZnVDr3dfgf10Cv0w0TQUUbMFtselZklZ+9R9ByJikfWWKJSCuoGs1LwR7ynmFHPktyBeIPXNLVNBShw0G3mQAMHRJoO9aOcD+RMFKfV/kN3hP9b/kN5zflZhLIJ5UXVQ0VXh1JX/4fe7D2K7HtjyR0LIXOoa1loByEKfm1UuODMhU1t3DYtaETnFmDv/EDl2cts61V0MxqAzDhslZKzMD1du1Ho4yESkHKgLE9vJdzwSvelDWB5Lfd2v7e51Zsd3/RJpA2ASsZ8igeUS3pyg24KIaLL1cNvqqUR/9BpmAVI4e/ZaBdRdblCkOpCxfu6hunUCF+UI5aSOGbqtUQYpcYDGkI/JPZpmWBVe+ISJBLQluEqXiuRJDXyyEQ1ICU+dTq6QOFvXUoxknD4K9M6qjeKsrPs7artCjnG8WuiuHwYXumuHVJoh3yaVcCSxchVXtJ4l9tpvqYA6BKPXN1zNa7gd3NFNG3DXCAv/gdR5w7xIRDTQ3CsnIEyvqk5py9QxkskBwz7zSXksUXu5wnnVqZMtBgBRWYlDw8ij0qp4JPs0+zibMNplgjzZBcQDem7pG+iyeKylYCiyJwzXro5SAyBRBIAZgzfMAxxpxI6S6rI8zcSxR9X2hFBA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(23010399003)(3023799007)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fmSaSTO4DkxkePBim9Mb09nex42djLgVgfvFt2+tEA8xqFN/7E6PyM/9y3ZOrVHIeRi2THaeEVTM0oCf4S68L9kLJh66r4lnBS8CX0+txgrI5qY5BgJMHkrMG6H0u31GB7G1/kADA0yLyUDEsdIHBsDU8oal1E4rFVmg6BblltXo8PBEwg1AOO+4vKbRqVKxB4J5s2TOwiJpA7opl/foG7qRkoCPlgicDDeG2TwJQmql7SkXN/x/Y2S7fhsnUnTrNiaYdQPipbHuXbNE5bLdSg3Pn4pPCwxId8v6hj1zNaYphlNUZxMnqj6RDMD6GqIbpAeRQ+g12nnyIBtbsvCDsXdnWa0+r342l4zV2E4/9OshfkhUq4xbZ/mYcJ1cjf/N6XfAOqrEHBf+f1/QRUqw79xsHuxLGcY9mZEpHMgfb3A6xIgrItLk71Il+9zTamrE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 17:23:25.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a83a794-6ed2-413c-ab61-08deeccceee4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_102341_200196_F1E54F94 
X-CRM114-Status: GOOD (  20.53  )
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

On Tue, Jul 28, 2026 at 12:27:36PM +0100, Will Deacon wrote:
> On Thu, Jul 16, 2026 at 09:20:50AM -0700, Nicolin Chen wrote:
> > On Thu, Jul 16, 2026 at 12:18:45PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Jul 15, 2026 at 01:30:22PM -0700, Nicolin Chen wrote:
> > > > On Wed, Jul 15, 2026 at 05:15:21PM -0300, Jason Gunthorpe wrote:
> > > > > On Tue, Jul 14, 2026 at 11:48:46AM -0700, Nicolin Chen wrote:
> > > > > > Nicolin Chen (6):
> > > > > >   iommu/arm-smmu-v3: Support IDR5.DS and widen the TLBI SCALE field
> > > > > >   iommu/arm-smmu-v3-iommufd: Reject unsupported bits in invalidation
> > > > > >     commands
> > > > > >   iommufd: Iterate the cache invalidation array in the core
> > > > > >   iommufd/selftest: Convert cache invalidation mocks to the core array
> > > > > >     loop
> > > > > >   iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core
> > > > > >     array loop
> > > > > >   iommu/vt-d: Convert nested cache invalidation to the core array loop
> > > > > 
> > > > > I was tempted to take this through the iommufd tree, but Will, I think
> > > > > the first two ought to go to -stable through iommu ?
> > > > > 
> > > > > If you do that then maybe I'll pick up the rest
> > > > 
> > > > PATCH-5 touches arm-smmu-v3-iommufd. Merging via the iommufd tree
> > > > will conflict with the PATCH-2 in Ashish's series (via iommu):
> > > > https://lore.kernel.org/all/20260714104202.1664187-1-amhetre@nvidia.com/
> > > > 
> > > > Maybe it needs a shared branch; and then, Ashish can rebase?
> > > 
> > > Urk this is a pain. I think Ashish's errata fix should go first so it
> > > is easier to backport.
> > 
> > OK. I can rebase and send a v5 after Will takes Ashish's series.
> 
> I've now queued the workaround from Ashish.

I will respin a v5 shortly.

Thanks
Nicolin

