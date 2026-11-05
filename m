Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175E1606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DVRBLQOG;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fKrfP6VJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qwrwRLhO606xqISxahpyu6yT9tKAQINjmSyfzveMT1M=; b=DVRBLQOGl3DvldwSKYje9J9bHu
	D44BfB1HxzFurnRQuGEYqpL8//uH5rh0GF0XrjuXNhDejNEpgF6Cd5mVsW4Sk1jOaJoN9RxuqLUAj
	nrG6LpnkEqTia5D+rj9wi9veU6qRWExqcvJoxSYXKocz4POMaYKwW5OD7jj9Str53TmhUQVpml191
	7T488W4zN55J1NaL6p1q6tRuYI7gZnF902JHwLMnsE8WrdgUfIR+SRtbxpyXGHqh3aNxqc7je0EI3
	ijsqWyXYgfB+BiW/ocGveazhXJIhGXqWzeQWkyRMkQtQ4bW5ZCB9YYVki8s7BncPyGM1mijzxDOie
	Qh8pXfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2PL-0000000AAn3-2cPe;
	Thu, 05 Nov 2026 18:41:55 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2OW-0000000AAQo-36KL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8OFRk/yBAkYRpCl3GWnk+o0iFPj8814Wgql5TqiPg6wO3fJc6fkPP422Tk1r+PuJhyDGTr4yHqjuhA5Io6S5UgGi+9pdCQvA+VdSySIWgFB4q9QBBsdcTw8XsVd1E5zfdIW/nE1mXCwaQVYFJi1J5rbcMqA66Zo3R+SieOoHV35QpKnKSnwV8p+bB6sVvkbTXh2JlFKT7cUBbdfT2ppbjfOnMJg6TLWLWdfX1b3EMM35uf6cUTZQ06QKBWnB6iIbcs4fZjsXfCjhd1KceVWXvQqfhjEIedd/tcSK0k9nk0JvOMCImHAYpNL8wP21wm8ANZJbTuWYfGSUEc5SCzFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwrwRLhO606xqISxahpyu6yT9tKAQINjmSyfzveMT1M=;
 b=Mw6UgvftFRI6jVKqMDoZeLLpBPqroy7ltoytxUJs9aBoMhpb6yDQAl01JZnqMCLpSs/O06kRj0QwX9mt6nkqe+tEAHEQJviZk/PDAk7arTaicEjZq18G73aTlqLgFZLKtkZUI6upVdD1+bGLamERyzajzCs0NTbAv3tOWaXvlxsRIORz5GPXm4yVzO/xzOnPtk6SNGj0igeXmQml48wz+msi1hDdBA8awevKlRnI3KUdBWa0JZAN4VXXK44gHYOUhkjdcdI3lwHahxIYEv944uZndzuE96JSrSUTvrqXaXeUqgBsOl61PfkAWyFYTmOy8gA8XDzdknYsSyp4Gc9tfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwrwRLhO606xqISxahpyu6yT9tKAQINjmSyfzveMT1M=;
 b=fKrfP6VJ28a3Hpl5xg6JUtHKSu22Y+GQBhgstKUn5Im6lX8Pxs0AHezMpqcOguJ9gjNf0J++clPOujDjQOtZEBDVu5FFc+YPZkL+eeZML+9RIeEK98latW4gDWEcRDNrpgixZHP55cdNG6CFGwWQeJTJywCXZ4V5tBDD47PaHRj66h6qa4XW3zmQg3HttBjZdn57q1AZAWtIlKoixCFQ4lcRzLt5oG/FfknwQNJ+Gf2uiRl6PuO1w/y+rhKmZw6xOmeQAC0xw9aBFSuPQM44N1ENLuXVgENwMCoRkMeZqnNZ2qF1HIffRJpq0Ih+1dDbIWyiZO0u8yEPdO4Fv7eN/g==
Received: from DS3P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::14) by
 PH8PR12MB6745.namprd12.prod.outlook.com (2603:10b6:510:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 18:40:53 +0000
Received: from DS8PEPF000000E3.namprd05.prod.outlook.com
 (2603:10b6:8:45f:cafe::2c) by DS3P220CA0009.outlook.office365.com
 (2603:10b6:8:45f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 18:40:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS8PEPF000000E3.mail.protection.outlook.com (10.167.23.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 18:40:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 10:40:27 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 10:40:27 -0800
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Thu, 5 Nov 2026 10:40:19 -0800
Date: Thu, 5 Nov 2026 10:40:16 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>, <iommu@lists.linux.dev>, "Alex
 Williamson" <alex@shazbot.org>, Alexey Kardashevskiy <aik@amd.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Cameron <jic23@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>, Krishna Reddy <vdumpa@nvidia.com>, "Lukas
 Wunner" <lukas@wunner.de>, Robin Murphy <robin.murphy@arm.com>, Samuel Ortiz
	<sameo@rivosinc.com>, Shameer Kolothum
	<shameerali.kolothum.thodi@huawei.com>, Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Thierry Reding <thierry.reding@kernel.org>, "Vasant
 Hegde" <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, Xu Yilun
	<yilun.xu@linux.intel.com>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v8 13/15] iommufd/viommu: Allow vIOMMUs without a parent
 HWPT
Message-ID: <auzNkAGFLH6da8fq@nvidia.com>
References: <20261104161632.3547423-1-aneesh.kumar@kernel.org>
 <20261104161632.3547423-14-aneesh.kumar@kernel.org>
 <auuBjRjQwXl7UvvO@nvidia.com>
 <20261104193139.GB3889730@ziepe.ca>
 <yq5afqxf97a1.fsf@kernel.org>
 <auzAivzpzSUHjEQj@nvidia.com>
 <20261105182106.GD663069@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261105182106.GD663069@ziepe.ca>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E3:EE_|PH8PR12MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d941dc-f517-4cc0-48e3-08df3b6c523f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006|4143699003|261026121527099003|261102123227099003|261021135927099003|261028144727099003|261021121427099003|261022075727099003|261009223027099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: V4IVy8cdluPJH2tfRuYJB2c5S9dz7gD/IXPSxQtSXqTGoqSFRTnuuBk3mGYpV8Oi1+48Y5pzur4NWPWw1G+Xzy+IE56rX4ScthM2jXelRCdvFTmoLS4yMdxuVNmQsAJkEBnx6gUCbdpydIT7HF1JKKMO3NdbWimPw5afsgC8wZfhLyG0xeZuUMGpkp7RdxYd8g22mk1CozFAaar+uYlaPTHk5pbl/RkKMnc4D7UJPmog7I5Dtvw//UqzOD+hPsGKprq6ImDBonLUbuvoI6UMtB/EHe4/SJNi4JtpHoP1cEFB7ngdQd14HXclIbhqD4Ln1xAyM5dFvfhG3WTzxEJG6EAPeG8TwyUoTxO31IqCLHeqYYs8H1E2tNYN9U6htopM2klVhq+8eeF0CrHjhIqT06uGq26HC8iKeft1DRCvGEltb5edqYSBeU8SDF05gzrTKYB5sV8eGYdTW1s1a6ZArecJFQUnBpcIsU+6taT/TM5sYOB28QnWCSV57zb3wc+wC9NHEn7iyVlxCGK3iQ8wDcWg9kh6tyd4osGiOsBL/wKJpEjCbr2KOY0v4YLN1V9CmL9RXw9b/QrFEdfjif7KdeqqLTjrLIhNWUjP+QSis4c5xwfutpevS6O+rLDnLAz+wvjdN3tAGr8B17JOfnuhBGTAzdSMKbIlTJkYlnzGm3P4QULhxd2vKMquxSdifa6Nh9MiUiNBCGBvvnayOfeAYw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(261026121527099003)(261102123227099003)(261021135927099003)(261028144727099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FFmEDHaAvae7GJATKzAttTK72XtjmrPnh2uZ6WImvfroImHRNZmR6Wl5iQ8Q2KUVstodoPm4gGlsH0psXoc22Ip3gfcxpYZdNP9b19ev+WOmULcF86g6YJeaDvUt3CuU+Fsfn4u0ShfMvFwvFuLOu1Qh+i+29qW+7kRQtjJC6pshxQmFjTWt///CYortlFVhQC4vE0HawFBMGM6suqUnp54o8yNeaOLipJbasIHP+RP4Pvm4M84gBKQW8pPHLgBuhDF1T7YwVuJMEscJ1nCIecbLjT3SLC7IBI9MtBbu1g0oUAFpzsnkF8y3xDQfvMysKdAzK0KVdfFOs//wLA1xRoUSzxB4bCBpQA4tgZguG68Auy8txjc9BeTWIIEI33oOH2UugCbyCfkBxoOkMYgr9ZXtRCGzVkTsU1M2DMt3BCxXc9Fxh28bZ3PhGZ5Xd4MY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 18:40:53.1246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d941dc-f517-4cc0-48e3-08df3b6c523f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS8PEPF000000E3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_104106_154417_1AFFC558 
X-CRM114-Status: GOOD (  18.33  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 02:21:06PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2026 at 09:44:42AM -0800, Nicolin Chen wrote:
> > On Thu, Nov 05, 2026 at 10:58:06AM +0530, Aneesh Kumar K.V wrote:
> > > Jason Gunthorpe <jgg@ziepe.ca> writes:
> > > > On Wed, Nov 04, 2026 at 11:03:41AM -0800, Nicolin Chen wrote:
> > > >> By dropping the nesting parent from VIOMMU, it just simplifies the
> > > >> attachment to an S1 paging hwpt, right?
> > > >
> > > > Yes.
> > > >
> > > > The VMM must always maintain a S1 paging attachment that is the
> > > > identity map of the VM on all devices, same action as when there is no
> > > > viommu.
> > > >
> > > 
> > > I am currently creating an S2 paging attachment. This results in a
> > > configuration with S1 disabled and S2 enabled, which is used by all
> > > untrusted devices.
> > 
> > For validation, that would work. Yet "no viommu" should would be S1
> > paging, i.e. hwpt allocated without IOMMU_HWPT_ALLOC_NEST_PARENT.
> 
> It doesn't matter, consistently using a single S2 for everything is
> probably better..

Hmm, I am confused: if we use a nesting parent, why do we need to
allow a viommu without a parent HWPT here?

Nicolin

