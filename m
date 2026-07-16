Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC875C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZtGg7/00pd6XzbaXecqzYaQPq/6LlmpmdCeLKfHoy4=; b=huvujlXMHR96N22T3jTUWqz23P
	HkoY4hQFriCO8+mdFVILg9mE5DETz+MlwzJeLgruCgOb64zgxeN890LnIzyS8uESyuH22AD8qX6gK
	72rcEfFNxbDAFZ48nZxDFjI/4xGoXD7rRYtWMo/TB+IKaMPw0HSa3n1Qct79flJxB0OdT+v948bba
	5WBVyKPAxMTboyycf6Mq6CDJgqOBmIJ3bAmRF4wXzX1vdchu7YnY4jFCW6ugD6vliSrDrTvgaCEqG
	FueUEPSuxG3xhzFnhUmEV1ccYKPEbVwavlAp/PQrhsuEBikX/0HR22f3sTCcu98hZG/nRXCEtYmKw
	SjPCU5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOq0-000000008uQ-2G1H;
	Thu, 16 Jul 2026 16:21:28 +0000
Received: from mail-northcentralusazon11010070.outbound.protection.outlook.com ([52.101.193.70] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOpx-000000008u3-2iEU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dg26EmGSD+JTO+QmNbyPSR466uVBb1Jjg1HDRl7HrHuwZYhmZ07qlwsx/hZA+Z33uItKYLiwYtngvpnHGKADeR6hklNqUjl93dXxpavpgk6StrlqGD/nQ2ZIi/sxH2+MybBYEBFDlQismfGhW04q9Zzh0jsBG1409sWxk7/h7D/9qNFO96EQe/PAcfyVfNuRhKVXniQ2ylnq9ZnDnO1EDPEhN6WQZ5shRyic0xS+BndG2Uewt1lMPjMOYY344p0pzZPWVMcxFDAbZHhvUQ1zAwtzUPwPF34O8ZOtcRjvraJN/HFNmRpSdqd/mf+mOIanoCunfiAi+o6y5uMdLcu/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZtGg7/00pd6XzbaXecqzYaQPq/6LlmpmdCeLKfHoy4=;
 b=PaDwwEp9Vqg2ngMOprZKbkxICchK0+ZYGhHtBJ+KKBDg/YHYSDGPZ8wDmsMljldMNOfTpSPJ28yHCtio+mZA+WpKxfJFrdv63ocxxMFE8YhUyzvgSZZ1epCFMfPENWCUOGbdYAzkQLG6QbNbSJMM4h9UBsxYlZaxoxE4MAFD6Y9IRT1M1QsMms4hX+V1J8jFTs3UJVpxBVD8bRcuQjpkAU7khojnXhdjCICGvApcpNmoa8hpH9UVrsliesYKeN59T43+YC2ogOptyXbHjKR8Urh9C15DLXtPz1J/zGlfNLdv/TVwe8k5godQmDs1I2qzidfNyIT1Dw/H5jQcaYsrFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZtGg7/00pd6XzbaXecqzYaQPq/6LlmpmdCeLKfHoy4=;
 b=jqF83rSjJRpXn97/3iFj5x0CEkmhD9vLUb+LdyXyStncSs2GcZigw6IO8s26uWXxCiPwuv3lD1ep1SjK37+UxsIev9uNV11S6BR8wViM3R0MzxiByzVhG+VLb7z5RWRfhXS0QcZOL+dRXJGyDjIjctT6RXC+oZ5q7y+uXK3vA36qnAtLCNylv6gKs1hxVpxHqVPUYlRXObGRHnG6NBzj08R/QpmkL4WpZsRYX+trmlHQeRftsxMsCwPPN7hy452ai8Bnt/9Xl5BaEd6PQSln/yo45TH7EbWl02aUATVc4npNRb3jX6l/EItA4pR2STAWQWaoP8JpICy6IKwfQRDSgA==
Received: from CY8PR19CA0022.namprd19.prod.outlook.com (2603:10b6:930:44::6)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Thu, 16 Jul
 2026 16:21:15 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::1a) by CY8PR19CA0022.outlook.office365.com
 (2603:10b6:930:44::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 16:21:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 16:21:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 16 Jul
 2026 09:20:53 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 16 Jul 2026 09:20:52 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Jul 2026 09:20:52 -0700
Date: Thu, 16 Jul 2026 09:20:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, "Robin
 Murphy" <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v4 0/6] iommufd: Iterate the cache invalidation array in
 the core
Message-ID: <alkE4iUQSWeD8Vyx@nvidia.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <20260715201521.GL3775915@nvidia.com>
 <alft3llhZ79t17j8@nvidia.com>
 <20260716151845.GO3775915@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260716151845.GO3775915@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH2PR12MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 823832e3-f561-4f34-2ff7-08dee3564214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|13003099007|11063799006|4143699003|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CrhyFJ3MFdFODct3nRSh1d0vo8ou/y8wXyiQAXUT4ak4vwZLceYJuYYPATmslDCzve727v5xfDn08/jYQLLGlv6p/AFzo8efO4b+pYV+AdjwYqnnt9nsRWtyQUUEW+uWu0e5+5/EKUTCoIYfamrhOTid783xnHu4tFh34QODurJPqUlgwhP23XRoNZOCgbKdSqJVNF2D3zeDyRWuaZJ6e+m8fgjQy2BluZnHQSew45tAiCIEoKeKKjDNtVf+YvYy+LV2aCms74Mzlcn7rC3q6iiwg7Zvk5YTA9SGIi1/kN+OpV/0PTTXUkl9nmOU5JBLLHqhavnF6aOzwAasz8gNdGZobVtrHOxKiKfLeBgk13Y0nzfQxxj3WErMEF6E32RctYfxLxQbw1OYTLbLZDDHfV2lI8FkRTLxqoioXqgg+Mufnrm7f4hHClgjceK6xqbboK4/WzWHua4ypulRVrhl2T67GSifU9LHOQCHS2ZeVfz2HMFtQiAflCfKuGB+ow/1ff6Jj6Ir/XBFo59miU4unAoAuWdclnPkRuvV65xfg/JsFSyxT/MknY/5dAKFI97C83ydZoVy6CzJti4o0Od3+ibOXvF0AYyboLCDtAuyzMGq8bgYuwVm3ZwEsctMF/iLAgwBxypdtZXbWoHvfmARJAmKdZ7Q3Ytl+ruQmzh/4he5gHF1BXH3WKTM9PxZDuFmyFK3w106HRdBcOMuwIckOA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(13003099007)(11063799006)(4143699003)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WNw5OdBDZcUVnKJIaAU+0svmAuUNW6ByF8TtWpVor27kKGysk9z+U1myxePxZOHMkAvsCvRcVl6JSvmxCOM21bzYTpdlVMKI3PXeWRsOGZg70YkyL/7aaKOTD1qnCzDtWUvN/7O9sfojsYimHCB3HZOEMyJj5hIgOXVJ0KwL3asNOUZ8vXdXNzCutsJUrNP6/zhNt13sOoay1BkoPgQfoVi0fa35WmeH87kNvKfLO/ezj7eykTkvF8psygIy/Q0AlQmp4+378mv0Bhiy1ttE3wcy6KhG82t7LTRVwIaJ9CLEJWVI53mEFiYRiRiTa75spbtOvinpPYwIcJhIISkG2gKpx0Mzgmo1IES4oC6L47MHW3Zuo7v65LE2ydnpX0NUjmzE/6Yp3di4Ueit9B59of31wdK3AjvmhybGvh28cPDLlYlwflsLXGWPsaXOT5nx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 16:21:14.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823832e3-f561-4f34-2ff7-08dee3564214
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092125_706920_F4E41437 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, Jul 16, 2026 at 12:18:45PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 01:30:22PM -0700, Nicolin Chen wrote:
> > On Wed, Jul 15, 2026 at 05:15:21PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Jul 14, 2026 at 11:48:46AM -0700, Nicolin Chen wrote:
> > > > Nicolin Chen (6):
> > > >   iommu/arm-smmu-v3: Support IDR5.DS and widen the TLBI SCALE field
> > > >   iommu/arm-smmu-v3-iommufd: Reject unsupported bits in invalidation
> > > >     commands
> > > >   iommufd: Iterate the cache invalidation array in the core
> > > >   iommufd/selftest: Convert cache invalidation mocks to the core array
> > > >     loop
> > > >   iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core
> > > >     array loop
> > > >   iommu/vt-d: Convert nested cache invalidation to the core array loop
> > > 
> > > I was tempted to take this through the iommufd tree, but Will, I think
> > > the first two ought to go to -stable through iommu ?
> > > 
> > > If you do that then maybe I'll pick up the rest
> > 
> > PATCH-5 touches arm-smmu-v3-iommufd. Merging via the iommufd tree
> > will conflict with the PATCH-2 in Ashish's series (via iommu):
> > https://lore.kernel.org/all/20260714104202.1664187-1-amhetre@nvidia.com/
> > 
> > Maybe it needs a shared branch; and then, Ashish can rebase?
> 
> Urk this is a pain. I think Ashish's errata fix should go first so it
> is easier to backport.

OK. I can rebase and send a v5 after Will takes Ashish's series.

Nicolin

