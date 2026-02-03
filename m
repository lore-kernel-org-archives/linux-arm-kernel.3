Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A04E8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdmOY7LQmR5UTdubcM7E9yCsq7xRNEbVEDvfYJrI28U=; b=s+WfBWPDaNl7EcC+s8eurKQ7Zs
	3fERKggroTLTen06lwm+kfzfmGHvtJ66z1+vz2+w91/aKGdcOEkG1aE83oD+eiGy3BwRc8ysVaax/
	MDS/QAW1n87wjqWVZUxs/mIrIhfghksDwLquTsSxF5BSwPhUyzULg/ynhKqNrHCATj3xJN8snqDzG
	h1RpzZmtDmqsUCW3NbPYZ/Yx4cthuPBgvo3VBLjisK90p27ZEWBfM2Znez6mf3TVpxUPsMNyn2YbX
	UJlZL2AgqkK+/j5cq98Wwi1izCaIxiU52mEvVN7EgmSSBFNch1MOSacf3FeqkD7xZlwRXLorxZxoH
	Eb6UA+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKTR-000000074lf-3uts;
	Tue, 03 Feb 2026 17:46:01 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKTM-000000074kf-2NOy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSui1AYTXwAyxHJIEzJtcv9lfJ/waq/K3iLsjNymuw1Utnjj3YxPLOrgiaStlIb+8saoZ5s/1ALOQAgBtIHVXDUqEsxj3k3y3C9F3Bbe6l7d3uXaBVu8SjHASgurSaFY3caBzo7VKVQe6VSeHfdYyO5/YpJDQAPBtBmqUCwjAGEnhmStyXn6+iiHDW+byQoFEuICSDwoCTrnQBnR2366kbnxdzdDbTtv/VQhSYR7DnyWFrvuJhmzQ15VOvrjeEU3qyHsApKvCXelx6Mj6gnMRyzuVX42pPruHWLsPYlvbcR08PqJ6K7TpdjkUo6IxOyF91aWbAv0v3or11mPPlL1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdmOY7LQmR5UTdubcM7E9yCsq7xRNEbVEDvfYJrI28U=;
 b=d35Y0ADwBO255tG0PczGAFTqCCcOyw4u7l+1HueIo8Lhk2sh3e3dsaOgf6btOoO0x4vCyU+yzS8nDt8ys/rpHXhFMMsyQc8Kdwlnfd8bc5Vzj8TYKJFlrqkfdEq2thuc01/L16aBrrOQSREdtU4QfqsJ2VEbtxg7rQSw9DbF65QSVmMC4Ezp/0JZhKHJYx/CJQQbW8rTFq0HqQRxsK2v0pU7+3VNsyun0cmPaWfm1Q4CDGendiFcCQXVFBKoUz1v3o5aZ4JIDKAGS17Ob63HV69B2f3ZFYebhGCI6thEbxYxh8gof7jS51i0u+TJSr+VVKmmfazB3b9uwgYGcfNwjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdmOY7LQmR5UTdubcM7E9yCsq7xRNEbVEDvfYJrI28U=;
 b=P/lZBfX9/HMHXr6mpAe7lBo+Gq2qBTZqK1L3r5nImqs5LFvZiJ3RnXKisBe6D5AjMb188swDMVMrntCYZppxrwRrbY+HQjIc9wXvPdZMMjjaOCbdP/icSFBm3wI1YdKu3xaGH/4HTG+c0gsW2NHH1W6S9jjD2A/xnavASgOEVf7Nm0hKrq6rrOQ9Tl8azmaQZuuB6fMDdUuWzKRvkTJUQGcswDCdsqgbCjktPeRrWLrA/6MNnB9H7dS+J1PAz6Z9dp2qnKQdKVZKSkdhLOIk+Vnv7A1d+qZletVOQgY///iFdiEGTL7TI5thKBEY35epcjGH2pcWKT5AHsSt9rsJ9Q==
Received: from PH7P220CA0076.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::16)
 by CH8PR12MB9766.namprd12.prod.outlook.com (2603:10b6:610:2b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 17:45:47 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::12) by PH7P220CA0076.outlook.office365.com
 (2603:10b6:510:32c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 17:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 17:45:46 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 09:45:20 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 09:45:20 -0800
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 09:45:19 -0800
Date: Tue, 3 Feb 2026 09:45:17 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <dan.j.williams@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
	"Jonathan Cameron" <jonathan.cameron@huawei.com>, "will@kernel.org"
	<will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-cxl@vger.kernel.org"
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH RFCv1 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <aYI0LUdXqrjmRcMo@Asurada-Nvidia>
References: <20260121130315.GE1134360@nvidia.com>
 <6971b9406d069_1d33100df@dwillia2-mobl4.notmuch>
 <20260122131432.GJ1134360@nvidia.com>
 <69727e7ded712_3095100ab@dwillia2-mobl4.notmuch>
 <BN9PR11MB527649A0049CA195E7BCF9218C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260127150440.GF1134360@nvidia.com>
 <69795d0366a9_1d33100d3@dwillia2-mobl4.notmuch>
 <20260128130520.GV1134360@nvidia.com>
 <aYGEDv86r4a6l2Dv@Asurada-Nvidia>
 <20260203143348.GA3931454@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260203143348.GA3931454@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH8PR12MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c061000-5332-4116-60bf-08de634c0fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0XtBE0KJWsh8iYrgGlQ4Fr2l/OtjdWtTlK3fw24Xrs6TwIRuCri1lsiUhkfJ?=
 =?us-ascii?Q?AQTeMlTUy+zNdsY3eeTo/Yj10o7znTcG04uq34V12NtuVV4jmXbjVLp1EEWZ?=
 =?us-ascii?Q?ryY2lrhIOhdMKlf3qC8iaPcXhDdoJLJRQLPgk3FEVEVDQqbkgpjiEu0dzli5?=
 =?us-ascii?Q?deF4d873Sx+5Wg81KTrfhN3BC5IjPU5kwkaHteXMKaP54I+iDhlPowpSPWLk?=
 =?us-ascii?Q?Xh24+DI+bRhGXmVAii8/ISm0b8BqlIPYDfb4He8fXBI3qH03l1S/ZdMsuic/?=
 =?us-ascii?Q?N5NwYq/QURKzMUdDy8fE+cm/NouCS011yJTOw9NSbBeZqO3XYW1xgHg4bfZx?=
 =?us-ascii?Q?VresaC7yrd7K/zVCuo+bHmK98AbaAZ/usdzl0ffXTeK0uGEsfTHjIGzPTAqI?=
 =?us-ascii?Q?9vSFE9GLoiIr8oaEiFLCJKJuCnKfl7/8FKtMYf9YwXWrZcAGH8iGFfVsmHeR?=
 =?us-ascii?Q?UqqrTHV7bRF+b5nYyjoQm6XGDAJdJsX6DM6aIOUxGdntJJ53I00TJKTWFaLw?=
 =?us-ascii?Q?ZNJdlDuQo89rIaebmSNf1ohfy6v6LDhVlytRTQg+TPkWTB7A/PTuQuKzG8Yg?=
 =?us-ascii?Q?M8XzAcNN/o4MIxlcrmnCBkCk5wPXFLTXfwX7RDH0SKjwuECWoyPB5vOuv/Cy?=
 =?us-ascii?Q?ic4TwvnnH/lrntf4wS65NFwxs+5CwjVSvK499z3WISfzyxdC05rwSJ5NpByq?=
 =?us-ascii?Q?hk3WCOABFa2s+3Ut4FMuMhtiPRsAQlZ2mSnGRzMcuoY8HpnY/lbO+w9C+UiR?=
 =?us-ascii?Q?99HbNW4j9td/lnsKNi5rCicUElaFkkncYd8xnXmDIWdBQXOPTYvKMvLW7gys?=
 =?us-ascii?Q?CetJnZoRnosyYb8qt/g+jYZ/BKB98qqJLCsZ+ahd+2XJVD9UYhL0XiFyY7qP?=
 =?us-ascii?Q?FaUa8gZhozwnZtl2q5Cf06eX17ML+IUukLmeoYGX2eH9obBCo2zR6SqH/ujV?=
 =?us-ascii?Q?JS4lbiMBoG7VA27JCZuelYGmjXq4Eu1Zm5mZaiDEIDIFHCZI9fjMbdbXB9KH?=
 =?us-ascii?Q?Xqz04M67nwwEAL9e/BvPWV28XH7jlftAvAgsniph14exfLFI4e7BBsMJrvK5?=
 =?us-ascii?Q?yVQKsCLHrI/V7BdfuCkd3DeGnThrrXOkcFwFMIHKepuQvUfKCQojjPJHScg7?=
 =?us-ascii?Q?c69xFcqTwcJUhf5kd/GrCZMyUDi6efSs3jY9O0pEovRlSovkNcJYqOdBkkgs?=
 =?us-ascii?Q?0nT0diipEUAYtzHrNsnB8sdv/4/Gr9dqJjPdrqAubcN4JV80PULYJq3K85jt?=
 =?us-ascii?Q?wh2GI1bRvt1dsBSxw/KEY9DbgmJOXRMtk6XfIpPb0juvyUb4aDKIh36O0w+Z?=
 =?us-ascii?Q?nyNbe4iNnCUsWpqSpHawGppfB+GxTKk1jtv42ZSvJ3daQEET3+LViMVIxEba?=
 =?us-ascii?Q?gMl7RJ+kutOubWXGg3UkOsBZUoVv1ANu33ApVooTGSTwWwII0x886cntu7LF?=
 =?us-ascii?Q?J0/smfc72tqi6bFNsZQemQAMJOuEwaf7+1+FH+FfxqsdF+q1i2gdrucCOMOv?=
 =?us-ascii?Q?jTeMYUFXc1b+5tdWShkd6lsPm3b4IY19f/tvAR1fNTIyTs3Y5Vi02nafSJJD?=
 =?us-ascii?Q?ni05sdfT3EK171JrziP969Kp0broEgOcIaq9AiPLc86pmJ8pw0xEShS8yg8a?=
 =?us-ascii?Q?xwIiwYllzRMnDMZz1SJbBStqg3KCEue+k4nIZ3t65tnZEmdmDVxVpYnbxKvg?=
 =?us-ascii?Q?WkAM5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pDVQh2bbycww8+efPFc8qEpQNCtU2IOpK86BWDu2I6y/b/8gx8COg6uf4ghq6vHgeqsfmTVRpnF4wNGfyuNAIgQ4picgCv8/K2K9Hn8DtSQU7ZE692tHwoXLj6o4yIOHzI8CqQOinauJBBW6OW0ju01t8qRx+RE0wLYxU05K6uvHblL7mVpRhZN/REp+wjngJvESv2083PtngDcw5C0UO+SUoELmqSAtS5A0kLj99PP+g6D5V0BA3cRNUGZTI6SW2pKGQNqsmgInwgviIWFYnAryU+s/cW0lRlH8e3RE7Fbkz1O68WcGxzeGf+D4HPGEqYo1nkxMfKIBrJoYrh0E+2EchVMBgJSM0vdLZ47Q4z/c+qC6F1+TWWvoRDnERxby59UvEXB8IWnbTWV797vgGX7fH2seP+6e5z1DiDrHsqZyoaxMpB46kgZN26pNjl27
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:45:46.4170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c061000-5332-4116-60bf-08de634c0fb7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_094556_639161_A4B5A29C 
X-CRM114-Status: GOOD (  30.03  )
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

On Tue, Feb 03, 2026 at 10:33:48AM -0400, Jason Gunthorpe wrote:
> On Mon, Feb 02, 2026 at 09:13:50PM -0800, Nicolin Chen wrote:
> > On Wed, Jan 28, 2026 at 09:05:20AM -0400, Jason Gunthorpe wrote:
> > > On Tue, Jan 27, 2026 at 04:49:07PM -0800, dan.j.williams@intel.com wrote:
> > > > > Yes, ARM took the position that ATS should be left disabled for
> > > > > IDENTITY both because of SMMU constraints and also because it made
> > > > > some sense that you wouldn't want ATS overhead just to get a 1:1
> > > > > translation.
> > > > 
> > > > Does this mean that ARM already today does not enable ATS until driver
> > > > attach, or is incremental work needed for that capability?
> > > 
> > > All of the iommu drivers setup an iommu translation and enable ATS
> > > before any driver is bound.
> > > 
> > > We would need to do more work in the core to leave the translation
> > > blocked when there is no driver. I don't think it is that difficult
> > 
> > Hmm, not sure if we could use group->domain=NULL as "blocked..
> 
> Definately not, we need to use a proper blocked domain.

Yea, I suspected so.

> > @@ -437,8 +437,6 @@ static int driver_sysfs_add(struct device *dev)
> >  {
> >  	int ret;
> >  
> > -	bus_notify(dev, BUS_NOTIFY_BIND_DRIVER);
> > -
> >  	ret = sysfs_create_link(&dev->driver->p->kobj, &dev->kobj,
> >  				kobject_name(&dev->kobj));
> >  	if (ret)
> > @@ -638,10 +636,12 @@ static int really_probe(struct device *dev, const struct device_driver *drv)
> >  	if (ret)
> >  		goto pinctrl_bind_failed;
> >  
> > +	bus_notify(dev, BUS_NOTIFY_BIND_DRIVER);
> > +
> >  	if (dev->bus->dma_configure) {
> >  		ret = dev->bus->dma_configure(dev);
> >  		if (ret)
> > -			goto pinctrl_bind_failed;
> > +			goto bus_notify_bind_failed;
> >  	}
> 
> We shouldn't need any of these? The dma_configure callback already
> gets into the iommu code to validate the domain and restrict VFIO,
> no further callbacks should be needed.
>
> When the iommu driver is probed to the device we can assume no driver
> is bound and immediately attach the blocked domain.

I was trying to use dev->driver that gets set before dma_configure()
and unset after dma_cleanup(). But looks like we could just keep the
track of group->owner_cnt in iommu_device_use/unuse_default_domain().

Btw, attaching to IOMMU_DOMAIN_BLOCKED/group->blocking_domain is not
allowed in general if require_direct=true. I assume this case can be
an exception since there's no point in allowing a device that has no
driver yet to access any reserved region?

Thanks
Nicolin

