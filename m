Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D217D597AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 22:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGOqxr3X5DZMVr/7FpvB8qWTi7UFMc+//XQDMNPPAr8=; b=2kfYJv0i/lhVVMh2wR0fv1K1aK
	MiSi9uu2Lx6EFIDIBdduFXsPC6+hi9AuHoS7GU47QsFXbQc3YnhJhXwUAX+fJwNtktb9VXef9++2i
	kCB76lGNbzvxnZx8d/xtsWX4yrOvdF3fC3VBROzVcAWAjL05OiWFcd9bdoS0+tew2NCd5Kr5Sx8U6
	W4ncqrn8Dxlc7zO44cfUwcZaujtblG5UCbfWVX7pWJralYdbvcAye6Taw97kZtKGVvaomLv0R9dkv
	abbebTRkK6hg1Cg4oe78sofTaXcMMv9Pz13n+ZhIauyiT0SuUFdtHkJQBQNwcm6ZHJpz+cLEarRX4
	4yv48WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAzBD-000000057eo-1qQE;
	Tue, 12 Nov 2024 22:16:11 +0000
Received: from mail-bn7nam10on2060f.outbound.protection.outlook.com ([2a01:111:f403:2009::60f] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAz9N-000000057BP-1B4g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 22:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkGc6g0V+s/5Vix8GKFtZxCYkvZr87mY/rxGnChFElq9NognnSzq+5ENZ0GjcQWMP+GU2HGgQ6wawsTTvctUA0+WluVCC1/znnXN5zdcIaBO2c1YsLUVGkyb6jMlmHvfpmJdProf7bZS37MQ9xIwZoB1cQb4Vvy56Y6GpBVwBVBK209si/zWc1BDfD60xfZG0qilFztvBjjq1TJwvWjEQ2PRbLm6wJixRsgIgz+u11KGnwIsWg7ybjUN/D2sOCvZCkevmRkczMTWCe5Rs8yjy/hcFzmYklaICJSkcsipOKAnX0ztjpwMmVmjFHlb0H2jZ3E5o7TabmFzUUiNXI+Q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGOqxr3X5DZMVr/7FpvB8qWTi7UFMc+//XQDMNPPAr8=;
 b=TNODGrV4lHb7xjQiBIHi8JbHsZvI56kLXF/+Wk5NNToVUwRI5dMdCZ5CXYIsYlX6mR88DCyi/qD+Uv4S2zjFYpZj2vIXTNUawX0hDWqHLXYjluQlfiQnTQb5Jiupx3mhqXyn1WtWwcp94q9yO+81cwpCiqMHGRPSB0L2bK6u1hTC4ebmPTmrEfHyAUApoli/H83jWFQh5xpw+wwcmcuSN9fv5MZ+sAah9qzBSWFXnGS/bxlFDysOmNCqxwfGUrLicBHNuDUyNHBAUlHKqoCDE44Nqe+RHd2oqFPJBE4miRWgCplF1/ZBApmIBayxuwREc5tnnO6MJ1fPNn0yCD2TrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGOqxr3X5DZMVr/7FpvB8qWTi7UFMc+//XQDMNPPAr8=;
 b=BmNpDOD/e31L6XgnlufVhS+uWf4NOVyWeNUkuJ+cN729h9LgHs69GueHhreGO9ENulgDC57mseAgxOJACwjB1evNk8Stk6JWHEJQEMgvUAQ8+QXYa63yccpH8CU7bmwmb/U+VXtPWIagNH0jznW/Xb5OWNVm9xa7K+DjIn4LPIs4u/9Y0AnQ33Y6gnLKHU8Ny2f3UsMq3jsdlf+dzciDc8WB7Vv3Gjq/dWPVPxdX8t/4XQQewuxRxSlGZ+7k+XuR5urhNonZfesBbyKKUbwQCNjf+0dCWcScSuMKTBQaRUhqhwbXIVGoZLWLcQAZbbXY8fstb4O+f8JoCsbQedJuhA==
Received: from MN0PR03CA0030.namprd03.prod.outlook.com (2603:10b6:208:52f::19)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Tue, 12 Nov
 2024 22:14:09 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:52f:cafe::58) by MN0PR03CA0030.outlook.office365.com
 (2603:10b6:208:52f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Tue, 12 Nov 2024 22:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 22:14:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 12 Nov
 2024 14:13:51 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 12 Nov
 2024 14:13:51 -0800
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Tue, 12 Nov 2024 14:13:49 -0800
Date: Tue, 12 Nov 2024 14:13:48 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Marc Zyngier <maz@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, <tglx@linutronix.de>,
	<bhelgaas@google.com>, <alex.williamson@redhat.com>, <jgg@nvidia.com>,
	<leonro@nvidia.com>, <shameerali.kolothum.thodi@huawei.com>,
	<dlemoal@kernel.org>, <kevin.tian@intel.com>, <smostafa@google.com>,
	<andriy.shevchenko@linux.intel.com>, <reinette.chatre@intel.com>,
	<eric.auger@redhat.com>, <ddutile@redhat.com>, <yebin10@huawei.com>,
	<brauner@kernel.org>, <apatel@ventanamicro.com>,
	<shivamurthy.shastri@linutronix.de>, <anna-maria@linutronix.de>,
	<nipun.gupta@amd.com>, <marek.vasut+renesas@mailbox.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH RFCv1 0/7] vfio: Allow userspace to specify the address
 for each MSI vector
Message-ID: <ZzPTHD2D5ATBsoGV@Asurada-Nvidia>
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <a63e7c3b-ce96-47a5-b462-d5de3a2edb56@arm.com>
 <86pln1zwlk.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86pln1zwlk.wl-maz@kernel.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: ff59f650-7e53-411f-a613-08dd036754c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+lg+c5kW/VsJ+ka3YrCtIdWIrrEWC+ZigBSwOFyWMOgb2GgRi8pjjWyuMD6i?=
 =?us-ascii?Q?KGe0g51J0MKOndQd9atLhM61ercfjssQngjxWkzYPN0oaURbbmceCc1N0bIP?=
 =?us-ascii?Q?na0hoV7MvwPFT5Sn+6f0LuhKqkLCHd5Q70Th1X/vqgFWCsYK2rL0RGM3yWOD?=
 =?us-ascii?Q?nvli+xllvkkKxIN1IQ/Z8HZkoe5RSd5p8KOMliMtYhVnNSFzvdLgMXtY3L85?=
 =?us-ascii?Q?ztkRozU1Wpx67VOVUJb9QJlkcC3FRZHDtKl23JBvdUjT0+hruSig8vcf/R22?=
 =?us-ascii?Q?zvTISlJHN5GprWirCtDaC0iatS0u0PKaVtTNFUPQ13sajKGccExKhanQuEEw?=
 =?us-ascii?Q?jPan0wtM55tSfTPCIhNxTbBTgPY2audqpfFirJ1wJ0SkN5OUCJnJGk1YD8dU?=
 =?us-ascii?Q?w7romCk9co7F/x7jznrZNH7OmtV4BwgCGT8J+dEkT2ob0G88AYWJk7vlO8Q1?=
 =?us-ascii?Q?quhtkSr3kMZMAuX4d9LdvjeQQGXz0o7YP6BuSK1cMg2JrskqpCUsoVWvq2rv?=
 =?us-ascii?Q?TDrC0psuD0eRPV1qKvZybtaZfRJhw4xY5z3JmMZ50/ZDqN4OIqKPBjEqt4Ro?=
 =?us-ascii?Q?x86H4O9dwv+W3owVzKn7NgULN13pCw9n1C+okqsi9R9GFudw3J+SVQTmwjJy?=
 =?us-ascii?Q?O3uZQMKHXDRSUPC0RzQbSaAIYbEt3JKX/jThqFHvkVF+7qAUW00ACsCDMW0N?=
 =?us-ascii?Q?00VJN2GtulAmfgrEJ5vidJ7ix/WbESbhkmKfgqs3DGjFxBjhrlgWKklvLU/5?=
 =?us-ascii?Q?2SeLsVZlv7OKgii4EBkCN9P7sC/A1RGXOmUnjUOtyIFxGStn/T+Q0AIYMBzW?=
 =?us-ascii?Q?br2MIk1Q7DLI2pS26ouU/UV6G6e1NuLJjgzdtmDRLiXrvdYXKRRcoQrXd1D9?=
 =?us-ascii?Q?/b7uB0U6IXDCIiM3Mz2bNNYJodh+3zCQEZskTplz2B4VfzQa0nwGIwPCt6+a?=
 =?us-ascii?Q?81W5pdZ5ozl4h5gKYcXqRqiQJz5S4gdJWDbr9x2HZf14H3dnJXN7DRGr4Y3W?=
 =?us-ascii?Q?6igqp7yaX6K8+thio4r65UYaCkIBQwApvoyitmCepOm2DKFwlmOjAMFyf4A4?=
 =?us-ascii?Q?65BN1L+p9XhXzC7W1dEFzQwLjso26kesr7U2MZViC/Js8IjRLKnoNurQ1ExA?=
 =?us-ascii?Q?ejfBY7te8IXTxebBzMwbxTh79LYfPHcb93gxgA5nII4seQ6sSHCEfTxp2fZQ?=
 =?us-ascii?Q?pEGuQFpbF655IS+VYh6NBVoJrUI3yJQeJawCKLKePXwF/XtRe4F7wlUMaCa+?=
 =?us-ascii?Q?PQueKDROWxzCrh5EUO5Dz3Si+raeKFelxMYgGtO4zcu5GIPo4xFnPglx4KOQ?=
 =?us-ascii?Q?HrS2OFLKIPSPLY4CvazaojfcP0AYmqc/d2MgCX4Bxj2bfAD77TuojW3yWuoo?=
 =?us-ascii?Q?tsqCBTOA0EXKoZi1Tu5dqjnjzjRZJsAzOdoJUVANhkQT/kOPhQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 22:14:09.3342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff59f650-7e53-411f-a613-08dd036754c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_141418_252500_59CC5185 
X-CRM114-Status: GOOD (  21.26  )
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

On Mon, Nov 11, 2024 at 02:14:15PM +0000, Marc Zyngier wrote:
> On Mon, 11 Nov 2024 13:09:20 +0000,
> Robin Murphy <robin.murphy@arm.com> wrote:
> > On 2024-11-09 5:48 am, Nicolin Chen wrote:
> > > To solve this problem the VMM should capture the MSI IOVA allocated by the
> > > guest kernel and relay it to the GIC driver in the host kernel, to program
> > > the correct MSI IOVA. And this requires a new ioctl via VFIO.
> >
> > Once VFIO has that information from userspace, though, do we really
> > need the whole complicated dance to push it right down into the
> > irqchip layer just so it can be passed back up again? AFAICS
> > vfio_msi_set_vector_signal() via VFIO_DEVICE_SET_IRQS already
> > explicitly rewrites MSI-X vectors, so it seems like it should be
> > pretty straightforward to override the message address in general at
> > that level, without the lower layers having to be aware at all, no?
> 
> +1.
> 
> I would like to avoid polluting each and every interrupt controller
> with usage-specific knowledge (they usually are brain-damaged enough).
> We already have an indirection into the IOMMU subsystem and it
> shouldn't be a big deal to intercept the message for all
> implementations at this level.
> 
> I also wonder how to handle the case of braindead^Wwonderful platforms
> where ITS transactions are not translated by the SMMU. Somehow, VFIO
> should be made aware of this situation.

Perhaps we should do iommu_get_domain_for_dev(&vdev->pdev->dev) and
check the returned domain->type:
 * if (domain->type & __IOMMU_DOMAIN_PAGING): 1-stage translation
 * if (domain->type == IOMMU_DOMAIN_NESTED): 2-stage translation

And for this particular topic/series, we should do something like:
	if (vdev->msi_iovas && domain->type == IOMMU_DOMAIN_NESTED) {
		msg.address_lo = lower_32_bits(vdev->msi_iovas[vector]);
		msg.address_hi = upper_32_bits(vdev->msi_iovas[vector]);
	}
?

Thanks
Nicolin

