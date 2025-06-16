Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E226FC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDbZTTRrRalFNUJNx7F13nnXd0WwvyKGpjTIfJ+WlFM=; b=4Ny5qK/Avw+6HB29vRT4oEoKlu
	oKdgPST/KCpLwvHUq3GetjlcWS5h5pWQNPFFaPEJetdxaG8yoaxLjWTDLe5GezZl1wS10G8Xz0T8o
	EI0NMDoVHXzcipye+ue5L3JH6YEQiulwBuo59aLBepf5u5NLs+5DZqRRxhcw4bvOt97LvZfgzPFbK
	dAvSO6v1U3Iq04BKyhos01qBfyxd2hbuw/0KXGNzddrRU/XpHQG/EGx8uDPk+Y1A6gqhkg2noo1DE
	a7t/lEOpotzSqNyClWNqx7+j/Pdg7wRphFlBWxQ1laIRfLtZoKRVE1K45TGkyuR0VF01Lfm91zvfA
	CfbldHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3la-00000003ZSF-2JdP;
	Mon, 16 Jun 2025 06:56:26 +0000
Received: from mail-bn7nam10on20611.outbound.protection.outlook.com ([2a01:111:f403:2009::611] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3d9-00000003YLP-0KXg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggJatRjYfoZVtzQRQAS779M+hFt13EISj2ISyFUZeniYOsylfqC5+t2yP0oX10vuHKdV3BUiFCF1DWbZW8vs2NSeKUoa5r9XabhJPJupuxE/oq5T/PSpFrI+yYIf2+d02rJJ6VuwciSD+kXBAN9KUuD1CXG+U5qxJad5TwuMOHSPB75nNQ6g/5bWam779lS5CXWs51lC7PU18oxVXeTLHADondOj1xWeOHJpqklh/GHcr/ZkoICyby3FPIdJ5VRiNV3Nx14f5E6Q4+meQD+W5ROX11KxlU5S947X+hHjD5qeTozfkcfNmnosqxbqUXTO5NhRqAlivDBYABl1o0Z6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDbZTTRrRalFNUJNx7F13nnXd0WwvyKGpjTIfJ+WlFM=;
 b=FQhfyBKWywyuvQvtbQjOnxhFi/kZK0dvR3q9HvNuuM1IofJAQkr02hH1L6lEHaA8zkaax3Jj9ZJcYKwlaEi2hKA3O04OwkNW3HLKvsqekDC9mWl01TwPI4ygW0G1PQKaVZsQvB+Ge/61c+xgYgjkNDTpK2a8LKOCVZFcnK6WL+mRAtn8NtoqIwFoXleAggZSpKxsM73pxF2Z3gtwGmi5QWLbulIcCe41n/pbIXa8HB2Bm3NbPpko4kelfatUQxT/WczRTVJsIde65bys1neml7xbFiz9ZaOuYfMuSGpqGkdYm3KbkeMJUlPk5sOL1RrB1u4V5R0E7M9kfD2BcEfERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDbZTTRrRalFNUJNx7F13nnXd0WwvyKGpjTIfJ+WlFM=;
 b=ZYTq7djhlL7GCG2Gwc0ZAc+RBjhNzNltpl7X18D9U460MApIv88oRAyVzvLl3MYJJDmztCNWnFD3tGYp40bckX8xWISGi6VtPU/FmZ+dVOXyX6eE+78RRhTHEgRAU+eS3x8k3xteafa/abVLtQOrj/nAKa0QDCupyiGzG+UygHRdqMALRH6RvHCJRKlNaVAHXzCzs2liNcy1EcnRmv6tEvqIh/ul+y/usC5sD7bGXjI/qUkfYnY/Jh2zSlymK4EsYxyaGgQ7LhCenBitAAgZa+aZaeMdE5T6QN+cY2ACnoywclq83eI0pVRctNvKi9jhe3XvyB0Wgi+HbmPojOZeQA==
Received: from MW2PR16CA0051.namprd16.prod.outlook.com (2603:10b6:907:1::28)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 06:47:35 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::c7) by MW2PR16CA0051.outlook.office365.com
 (2603:10b6:907:1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 06:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:47:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Jun
 2025 23:47:21 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 15 Jun
 2025 23:47:20 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Sun, 15 Jun 2025 23:47:14 -0700
Date: Sun, 15 Jun 2025 23:47:11 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <bagasdotme@gmail.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <thierry.reding@gmail.com>, <vdumpa@nvidia.com>,
	<jonathanh@nvidia.com>, <shuah@kernel.org>, <jsnitsel@redhat.com>,
	<nathan@kernel.org>, <peterz@infradead.org>, <yi.l.liu@intel.com>,
	<mshavit@google.com>, <praan@google.com>, <zhangzekun11@huawei.com>,
	<iommu@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<patches@lists.linux.dev>, <mochs@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<vasant.hegde@amd.com>, <dwmw2@infradead.org>
Subject: Re: [PATCH v6 10/25] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Message-ID: <aE+976F9zPsjtfry@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <7dfb002613f224f57a069d27e7bf2b306b0a5ba0.1749884998.git.nicolinc@nvidia.com>
 <1ab8030b-8d2f-4ebe-a280-6d0e4e1d17c7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ab8030b-8d2f-4ebe-a280-6d0e4e1d17c7@linux.intel.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e81667-edcc-45ab-fa18-08ddaca1aca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9Qqa4uLqSwy0sYhnbIcU7LRbr05x68IiFs41+/F6EURNZIx75DDD/5vvt0Qd?=
 =?us-ascii?Q?+CUsCpYeBpjvKk4Q1x0nzoSJzYgnzCridGFZujXixgprt5V6OqL2mQaYHusl?=
 =?us-ascii?Q?IfiRLEj2sFCdCVUtm9ACnOTXVYoFKje1+fkSAjHy4GQ0Gc2LjizhEL+vLK1V?=
 =?us-ascii?Q?nO1j/aFja75SzLBipjRaslOP7eJo/1MDBqvXtYr9Dv9R5lbA+5es07GCksD4?=
 =?us-ascii?Q?0fuzNKjiuL84HedophAmNdMmt47802AOR6rvwPhtRPVtoxSppdlO0+b3+q49?=
 =?us-ascii?Q?YpilzC/AURY4m6RqPyNGVys61ZXxdWHf9iF8UgMTogQ4VS1Jdv+tKoIBjckk?=
 =?us-ascii?Q?Sp7jPKLfdNmWWianlg3TJXGx26WxgODAmYOTuRviCmqVq+fe9jBxWmNARM4q?=
 =?us-ascii?Q?g9u0PYIGRy7YL+TRNh6g2VByqmsiQru+1j4E/kYkYtUMszxRjFf09jKmSxNw?=
 =?us-ascii?Q?OsQnUWoyCEE8PTHDQ6M5rNxR5LDXXoHSr7gHqv6i5lYL6JmmDxuzyiyzjnGY?=
 =?us-ascii?Q?FQgMI3OoHczea22oJmzyrfrDTVoA5xTV9mtEy47CupdTAimkhk/yANKu1Sdc?=
 =?us-ascii?Q?JnnPmOl3rpuu3VXbMfoVIaQadLkZ0DWNgTI14iEN7kVEhDDn8xuvFMYE5N4l?=
 =?us-ascii?Q?mWy5XnzKoNWofOvEG7zZPyrDOk+J3uLj80K9sC0ur5EHVts/t49SAXRX3WWi?=
 =?us-ascii?Q?VgpNMduxHO619ebdTTL3eVXKOAwrcSJuR7Zrex4G2y8f04cpW5J4vi/i/xm/?=
 =?us-ascii?Q?tH1UrjoV1HM8dRBjWwVvnN4swsKAvKuTuSFQaWF+IuA9PCZ+wrixFZknob1A?=
 =?us-ascii?Q?GadTWPfnvTij4btY6WkR1ZF1bAL1iAXZCExHkZNGt6qXdj1snTp959ydMe5e?=
 =?us-ascii?Q?zswmRgRwIVlZfg8LpzYOrp//GWsVS0BwZyZpUGcl2pspMtm2r078e0l+bm/a?=
 =?us-ascii?Q?IgJdLEzhZ5/yVQitxXw9xWaT6/yWbp3pMrXhgTa79MulLly6Oznq1Rwm1RiI?=
 =?us-ascii?Q?/bCyFB+i+MJEt1Fp90NRmw5cRFbLxtJuZ90BGaDdgLN99khNuTg9u6ipvDyT?=
 =?us-ascii?Q?9d5uXZ7f2Y886r2lEjHEPO3/CUSbyXymI9nCw1hs4Mml7jMu3MhMY1NYzCos?=
 =?us-ascii?Q?bM2QI8KE5Y49XrviHdgADdqhdSLn0BHEWcYDDgWFDFZy0mJRaEJ6/bwCohCP?=
 =?us-ascii?Q?/cHssG0HbRr1cmsR4CEoEz4sSCDlugANIR91ltAasGNcy2+1e9YaIg5e/PrD?=
 =?us-ascii?Q?hNk6/wcNdSMiBUUUg/sdOsZu1mgdk/IPtgBVecz80W2FmY+RfNoZ/wjKwAQi?=
 =?us-ascii?Q?T8BUiHQ4z0ZnTJctRbzl67IRZioFM/8J6M3RuJB4GlJkbsQLlpCNHfErVGGY?=
 =?us-ascii?Q?Ttq6eOrgLfkLnzqBmpDrteUp4FUqw8dxgy+WdE8eP6Zeh9JS7ApB3e1vlMo+?=
 =?us-ascii?Q?flldShUPr53zK8Cip7+vfotJm3qmslAXE0DZTZUJGTe7iiX0HeHxCSysui9z?=
 =?us-ascii?Q?5arEK4itL6DxTv/WGJSw618ZDEd/Dg23h0cC?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:47:34.2357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e81667-edcc-45ab-fa18-08ddaca1aca4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_234743_215300_E3477D7F 
X-CRM114-Status: GOOD (  17.51  )
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

On Mon, Jun 16, 2025 at 02:12:04PM +0800, Baolu Lu wrote:
> On 6/14/25 15:14, Nicolin Chen wrote:
> > +	if (!viommu->ops || !viommu->ops->get_hw_queue_size ||
> > +	    !viommu->ops->hw_queue_init_phys) {
> > +		rc = -EOPNOTSUPP;
> > +		goto out_put_viommu;
> > +	}

Hmm, here it does abort when !viommu->ops->hw_queue_init_phys ..

> > +	/*
> > +	 * FIXME once ops->hw_queue_init is introduced, this should check "if
> > +	 * ops->hw_queue_init_phys". And "access" should be initialized to NULL.
> > +	 */
> 
> I just don't follow here. Up until now, only viommu->ops->
> hw_queue_init_phys has been added, which means the current code only
> supports hardware queues that access guest memory using physical
> addresses. The access object is not needed for the other type of
> hardware queue that uses guest IOVA.
> 
> So, why not just abort here if ops->hw_queue_init_phys is not supported
> by the IOMMU driver?

.. so, it already does.

> Leave other logics to the patches that introduce
> ops->hw_queue_init? I guess that would make this patch more readible.

The patch is doing in the way to support the hw_queue_init_phys
case only. It is just adding some extra FIXMEs as the guideline
for the future patch adding hw_queue_init op.

I personally don't feel these are confusing. Maybe you can help
point out what specific wording feels odd here? Maybe "FIXME"s
should be "TODO"s?

I could also drop all of these guideline if they are considered
very unnecessary.

Thanks
Nicolin

