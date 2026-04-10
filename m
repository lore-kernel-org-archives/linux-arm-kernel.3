Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8307F36B96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 00:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkY9qsV+fcaQNIraPAgrgREF0/R4OYf17eX/BbrEZvY=; b=EaPLwQd+Wpn/y+HNdz3RySv4va
	meT+M7C6KqI2+kR5YJBXJFixobGraJb7czqsskygGgWSQaemFUX4T815e2QQQOCDVcyssAMXCu5Df
	E867MI5t/iaZ2/IGJTud0qHPWET8hSPC88fur/R+5TCpvVyL6BO9NbRqoNoTpwtbP7RUyrKynVe8P
	EuDKxXR+6WZbrZy64yNtmv3aRQHX7/w/sOuXAXKWrcV8nGd+KUmhb0g+AuXcOcZcUcyHrATkqt3TK
	+BNI5FY/aGxwB5kpuEFD+WbSGOupwOXz9HEdw+6bkJQvIhemNZDFdesSjYMVcveJQLJKhirNsBSey
	RXTJFPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAzND-0000000BLrw-3v1H;
	Fri, 10 Apr 2026 00:05:23 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAzNB-0000000BLrP-3DlM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 00:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHvknIJRJQdQqDDIyqwWYTOLKbDY5pK0zvTObH5Illf3yN9rQm1E4z/AUgrggOWavKY48kUkPPoex70EchOD4n1Ua7FUlTa0N0fOywSlbww+We1qc8cSqjiLUw1OdjexK8k/rBnQ3jDtzm6+LNfVu3Rrr2mzMrEHcon1ZimOPIGJqPNp/JnWZGeyPUKRPb+hr6UCzyknLmuhe5tgnB5kl/hwg0AfG0UvrrxWlI2yTrPx+N796USfdaIt8SC9y5ugKUQk8EuulyXImxoT3OJ7Y45tG4SM/OCcBo5dEEjk+hdWjPC3Lcxd4Xgh48N8umLWchsCP7XhdqQfQWujNZbsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkY9qsV+fcaQNIraPAgrgREF0/R4OYf17eX/BbrEZvY=;
 b=pk9OaecWBxC6/oXLL2iKwRUA7+JGZkJr1SGMcIoe70rkddGWTcZ1Vp47g7a27w0vQWh8y40c+EzBInJmv0Hge4wKLyIWbAz6h963LkYOjslCsBoFUtAvT+nEeOVHsO3L3iJfM1kcCiF+eNt2Clop51EYugUcszSAHwCLXu234fvV7Tj37Z0YnZApIzCSS/fcNfjHX2Og2uUnNLEFFe2w1xuuWq22Gp+L5DZSOnXpgROkbUd1CKl4+iCKTrMJHgvra+k7mvaVvmN8+5nzC2BCSUF4pvcsYATQOd3sbAB/b/4MyaIzsJ8E1cH/p2b1dnYBOj3XKIdfuiLB9U/W/VOdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkY9qsV+fcaQNIraPAgrgREF0/R4OYf17eX/BbrEZvY=;
 b=qjGWa/ftUw7BYRa+kJT8AOCP7zXenjHwKrFhXse9ej/52giy55R3RU+nkboctTEtxfGKLhyp/9K2rnW5dkq2DqLpYT5mNuoECJZfJnmbB3aXI34rN9IrWxlAyLMmxFauNxIo+gs3ioQ8Em9GbwoMvqFbJge+cAvRsUwcdNHShTi9UJ70qIn102r7krL30rgY/+XwsSEnItivnHSzCIF1peOyBwnQTM8WIIhezP3jYwNTgTbiUg41xuzit8NehFBQUxeghZ7ouCnSD7Hp6EheCfLw6HKp6szI0nY5oMxxVpXDuZFm5EAeJtRFvAFDhl8bTD6IN8UjHJ2fvi+IosO0rw==
Received: from BN9PR03CA0072.namprd03.prod.outlook.com (2603:10b6:408:fc::17)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.41; Fri, 10 Apr
 2026 00:05:08 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::b7) by BN9PR03CA0072.outlook.office365.com
 (2603:10b6:408:fc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 00:05:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 00:05:06 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:04:49 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Apr
 2026 17:04:49 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Apr 2026 17:04:47 -0700
Date: Thu, 9 Apr 2026 17:04:46 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, "will@kernel.org" <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"praan@google.com" <praan@google.com>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "miko.lenczewski@arm.com"
	<miko.lenczewski@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, Vikram Sethi
	<vsethi@nvidia.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <adg+nrNAZAJx7JiV@Asurada-Nvidia>
References: <cover.1772833963.git.nicolinc@nvidia.com>
 <a0dd3e4cc5260f55bbec5b3ed6791def33028735.1772833963.git.nicolinc@nvidia.com>
 <BN9PR11MB5276A6B1B103C4B0201458348C53A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <adgsBgXYy68GmxAf@Asurada-Nvidia>
 <20260409225252.GU3357077@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260409225252.GU3357077@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c627250-c6f6-43bf-0732-08de9694d285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: K5xBoyHk+Sk61SxMtW85mDU56VpC15+wHaNTeUHr3a/WLrcgCsYprQBok+j/AwM2hZ5Hj0iihV7gOjBJkurWy2v9PiuKC9ICNNpMrxOD80Ix+ikw1mqP5F53HvuUSFGhPWYhDXFE8mYQZ83cMqCYaSQHa4LTm7MnjPOlscwi2eqbiSDk8sRWZOJtdsAOuDGsfkWMjpvjIpprJfUWVSrrhUPbRSmS8UDCxIMVf9TyvGFaz3T3JVeTT8HD1ZVcmEnbyoBbG3aoRrrbnbL1WAX/xzuaPl5ctzBJDrAhwROpiBQv8EykRyNFHGuTFKxC9FFrVeTn19ueTXSiJmuP1ghJyKCBJi3r3ZXyiWQhXLiHNkMoocmK97L9N5VqlKMlI7N3Z++fVha0AiIzoP0AmZdxYys3imzaeCIlZNaPv+6t3yH1VDn2ey8Cxv+j4t4iGA4ym+84r3DkREYXy9VTWMkTeamY5TtG2tu+mZjjafUYDxatWFoujaGVHjJVka0xmmUJ0RttCknkrAKmc6a+MZjhhB8JpzyIb7K+IPKB9QPZu7TKNqj9OB3KjbH3wNFdvCiiz0uh/2gpihpZ7T3ex3HcYYHxxbbruyq6OlkKX7y2gkZB8rDSsmhAx9/76V4atM0m09hi9YDAWPOmiA3fI6F30XoJ+lQHlR3EgnFmy/pZApKBoJ2p4qNI2Y1j82nh6Os0Zr9FuzpW6DFrA6HPbtqIPIsAJnkzewjGbweXF4HXFrxNHQ8kmSAfy4VmZfPTfC3z0iFr/lH95EZPLIwyd3fw+w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W4/PHzH13j0NB7Nu1Ss4Q/DOUMEaWz6o/kWpL5K8NTsGwxWRnf/KfGYagAdWExN0e0MpWGilXm9VWnXPCnDxtBT+oYeAueXW4SdyQRuz5ekfZnyGSAeQMjvsOV5leyGk5JpQhKfI+zky8h5T62TiLialG4QIZaLvShVTSVBe+dPlYMZrhCcPH1vnrE7sU89eubyViYTT5D8c4F0qy3Pr2gZn1Q+AEqTRNh/j1MGM2iQ8jn3fPm2tEFsV+RT9rDY2GrK0voZeTJ4e8f/nEVKUkJAk6ANd5ZfjtrXEJsAa/x9Zc7FLSkMQx6uzDQVdgImLRetpq0Xm2qjNT4AGYBji8sq3/XrDHz9toNhQrIqftybPPnY8H3yA7KoSgijb7g8UCEbCd963GaOjybRT4y/bu+HisXEDMlNQiuPcHetMlFdYLDCUZWUy0s9kTJmuLRS8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 00:05:06.2560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c627250-c6f6-43bf-0732-08de9694d285
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_170521_811479_0EB3E75F 
X-CRM114-Status: GOOD (  11.64  )
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

On Thu, Apr 09, 2026 at 07:52:52PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 09, 2026 at 03:45:26PM -0700, Nicolin Chen wrote:
> 
> > One question regarding VM case: if a device is ats_always_on, while
> > VM somehow doesn't set nested_domain->enable_ats. Should the kernel
> > at least spit a warning, given that it would surely fail the device?
> 
> No, just let break, the resulting failure has to be contained to the
> VM or the platform is broken..
> 
> The HV can't turn on ATS because we it can't know what invalidations
> to push so not much other choice.

I see. Thanks

Nicolin

