Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C6DC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 21:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVKR0I8f8dVv0OY3V11gaRYIUu1t/U8DlDvdZLegwYo=; b=zGhzDytsjr0OCsNloeQL74M1cm
	oPXQzFBnSzU+dhsOH448QpU8wftOTLV0CqzAQw44W1VWbv/8aF9cojLxIRU7Az7+/O/ZiSwEDFmoD
	pnSxaBouFVn6iHk7tb3mvPkdik8XfepJquCxWrZ7f4vRsF2UdN2v6GWGJ4wTogkPvIRlRWPDg8yTY
	SCnmwRb39SFa386RNBgbZ5ZegDCyH71ZyuWlqkQPlO4hyO+9OEPkxkpICCSSK9yl8GdAEdgzvwluD
	G/y3rol4UDgJxV9yS6OXJXySP4f+jN4kR9xg7BhUBmgsz5XmLFwZOhQPtL76PhhJBCDbj5SDQlwDl
	tT4wq2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClvZ-0000000GkhI-0Wab;
	Wed, 07 May 2025 21:03:41 +0000
Received: from mail-dm6nam11on2062a.outbound.protection.outlook.com ([2a01:111:f403:2415::62a] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uClkN-0000000GjVZ-3Mk2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 20:52:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbSPLLrKYdN/7zRA+zoSyrVp+ZGA2ju+VJMRMmgDPb+4RVoXnED+GNAubKw/HqQkASeV/0KPwd7TIi/gMVigspAneGci9Z8Bk0Jtw/3eJrbEjjEYaKvsWJmLPrY2OUApURtvXznEfOghdbnAN49mf+v727dM7gn53zfqyV8MUhC5KZhzMupzY1PD342Kpd7h672nX92Z6MRgYB1frH2KzX6XFO1FdAy2FUgG73jBEtxymwyUFZjEBp5rpdWvYKXWektBe2zd9boO9od1ZZQ19WE+V7xzD9PoHP4EWzZ2jOrFs0s5hpHmVXT4LOMR55257+tcD8qE2V1YzOgZAKEaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVKR0I8f8dVv0OY3V11gaRYIUu1t/U8DlDvdZLegwYo=;
 b=Fm7ZpXy60OQwu8b4NUURoUKrALcdbU4t+RXwlezS/71jtrGHgeRFHDzT4QVZ6ksiJUW14Bobx06Wn10XEA1b2Vf/3LpVMTFkXVERnbHgnCeo5fn3nDsbRAQnudrcyyUtmvC9ymaPG/FhZJZeCSaDmvlCJkotfwuIDgOagtSN/SNS3uPkHSBSXIatgDTbhw0vjP5J9VTRvRAkFafq/WjldKm8q17U2XNnOqgodxDQl5ZUWurDjKxEKsUpVm589/AU1AD4lNFawpyybUJpCGANYBZephYvf/uVxhaqtszDp3VQ6yoJEBGYNNSFPtSBu+GehJKS4vmtzxp9tVCvzCJ/8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVKR0I8f8dVv0OY3V11gaRYIUu1t/U8DlDvdZLegwYo=;
 b=ubejLry6vTYbtZ+r7OpQXOEH1vnc1rHo65f54q8Qdv/NnhTbpb+tOfCVPf0sSz9N1DMuWHl3WbHfOtXgdiu6XRSdYrrZNK5qUM+34MQgUEDGwzxli276U8YLp0ISsOMeyhdy5++zVfcuTiOseI3+0uVpfRPPbUJPygBOoigf18H7kLiS8esibeH2ANuIIL7rBlPvJoHzMcOkRaXvDL54ZqooAa9nnzGx5bP0N9sr49yJhcqPa0lTs4vJa7+BSMosxBHrD28wyuLMtbwQFQIH9USOW4mV4TlwLcVN6IunHaVCscXIsQbgBNbhVS0iQyzGztb4hxvqHkjWli3ujvwlRg==
Received: from BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::13)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 7 May
 2025 20:51:53 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::4b) by BL1P221CA0025.outlook.office365.com
 (2603:10b6:208:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Wed,
 7 May 2025 20:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 20:51:52 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 7 May 2025
 13:51:36 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 13:51:38 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Wed, 7 May 2025 13:51:33 -0700
Date: Wed, 7 May 2025 13:51:31 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "Tian, Kevin" <kevin.tian@intel.com>, Vasant Hegde <vasant.hegde@amd.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>,
	"bagasdotme@gmail.com" <bagasdotme@gmail.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "nathan@kernel.org" <nathan@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "Liu, Yi L"
	<yi.l.liu@intel.com>, "mshavit@google.com" <mshavit@google.com>,
	"praan@google.com" <praan@google.com>, "zhangzekun11@huawei.com"
	<zhangzekun11@huawei.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBvH046KK9V2YMRx@nvidia.com>
References: <aA/exylmYJhIhEVL@Asurada-Nvidia>
 <b8338b47-6fbf-44ac-9b99-3555997c9f36@amd.com>
 <aBB1gLfahnLmn0N1@Asurada-Nvidia>
 <a3860aed-5b6b-4e68-a8fd-1a6ee28ba022@amd.com>
 <aBEI+T7P+hV8Y6tU@Asurada-Nvidia>
 <BN9PR11MB5276A00FDB2685B394FB9D4D8C892@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aBptQO9VBnO2AG9V@nvidia.com>
 <BN9PR11MB527651D1ED8E6CA4677FD7678C88A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aBsN1ZDr+jJJ5EG0@nvidia.com>
 <20250507123333.GD90261@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507123333.GD90261@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a4f5d8-479c-42c5-3d03-08dd8da8ff25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T/58WjCzOo7+M9ylm7OqfN0KJGKy7wmWaogLnS8yDKkoGALsU5nXIrSw5K98?=
 =?us-ascii?Q?PItnvgHUEClNmxWdBw6oy67Yp5B+NF9iNhmW078s+05R3VXQjarpML+UJzVJ?=
 =?us-ascii?Q?cCwmqgzypTBoD5p8e1c1EZ/CGVJQP4E9aJDOMUK8lT266+QY5xSd2qxFT6Tj?=
 =?us-ascii?Q?XgpBJD8bSy+RrY+MWkBoRJATCik08Hf78lFvwm1tyJGKLAgeUNqnP9RO/m/V?=
 =?us-ascii?Q?Yry4113ADtEvdqZEwYrCLfYgShlSzP2pXo8DeCogu9ep4GH8GysQ03nWCRDo?=
 =?us-ascii?Q?oq1P07IHacKcpE4Ix/HXUQl2VTepXYrk1Nm7adhPfMbJp/MDVjkoKQ4LW+uA?=
 =?us-ascii?Q?eIlPK/+nmzFx9Hx45heYAtxo+mfHJAut66YiX2Kt6ABd+toUvN+3JeArCrIk?=
 =?us-ascii?Q?tUPl+VYq2QBnJ6PzfnN20CB0/jqATif/jpWVYshzZV6Iv1SgQx+XyrzPuKDi?=
 =?us-ascii?Q?3uZSZbPgmlr2XBuKtHjJ6wiPc4D5xSHV+NVpS58C5w8j350Mlgiuq3dnx+aP?=
 =?us-ascii?Q?1C0z/KgrRdMXQCP9J2nb+DQt1x92JwAB2eMWYuutl4p0DiNv7QByMtPnwUim?=
 =?us-ascii?Q?7+clvYQprwGDBiU1Qml6yYBnJLNCphema/IMLNc6dNtgHJOBKqMNx/tWP5Ni?=
 =?us-ascii?Q?HkKMjgMfu7DXpB4xhFav5K4oX760Ojg/TLryCG9/p3TsPatG5OKrKoGM/0Wf?=
 =?us-ascii?Q?VJ6rJiYuUKAjqj8LL0+BTAQ8nWiK/581o7Y0kB62fouAWWxquHRo4UwjFEQA?=
 =?us-ascii?Q?fCKhKrUgruIXKsbJ5BXU/uL72exH6ROmPGgbpDHSztSpX/ahboU2GrTKCtF6?=
 =?us-ascii?Q?aiWM0U5tgY1PYjHcRdP+C48XZwPrMuVp/2GG8Q3cQf5aJyttp0ADQmbgF3al?=
 =?us-ascii?Q?FxkWFZfygJO5yIRlkm95oDV5PV9ugke+EH7Cnihp/Ybw36cB+LILkuBCJRgJ?=
 =?us-ascii?Q?OwmiGc5PvKx37qjXff+XJ0DlenB46HyIzD6WCpanvKcDxjgLK2VGYfyh60RJ?=
 =?us-ascii?Q?DNVuExUJlSMlAHbDPaJ1ng0afI91tKknXp4nAvmydR28KlAYHyMPDFis5tLT?=
 =?us-ascii?Q?Ffq7PgYC3pin9Mg7+jjqb7CqPdNNJ1M28hsJMKp4T0a65UeUphCxGd/QMwAD?=
 =?us-ascii?Q?abTYFvGNwCtANts35VAZrG4bm9dDNZfECq/zPuczDRXTLT2D4r20N2h5Vy4j?=
 =?us-ascii?Q?UCbsvqVRrgoK8737jAm9hSDfCK1qUHwE5WXCIgL1eN4MmZXHh9V0ibQgCOzp?=
 =?us-ascii?Q?waCsBeaYkrZcGTDALOwd9U4n2iBZEY+E9EygFoVz31HGcDLj/5srnIy7WPux?=
 =?us-ascii?Q?5/SJslP1ObqVYlJ+7TGaLPXTCUOX2piEdshYuMWbo6ay81p7kAknRlCDTwcO?=
 =?us-ascii?Q?VEvQWqPYHSMfrzIkiBXC/+5XZhDCieKdkykOYCwv41zOHmElDk4t7G7l8QUV?=
 =?us-ascii?Q?0efGfPfRpzoEAC6ipIGNh1EWx53i8tu+ehJykBsEk78Pht/+yaNej9t0PVjZ?=
 =?us-ascii?Q?GqxGqw7PWnXpREfoGG17T7izddX5Zf1DPoaA?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 20:51:52.9190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a4f5d8-479c-42c5-3d03-08dd8da8ff25
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_135207_834596_214A228A 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Wed, May 07, 2025 at 09:33:33AM -0300, Jason Gunthorpe wrote:
> You could just call it what it is, "DIRECT QUEUE" or something along
> those lines to indicate it is mmap'd and so forth, vs being a SW queue
> with read()/write()
> 
> HW QUEUE is good too

Will do HW_QUEUE, as Kevin +1ed and it's short and understandable.

Thanks
Nicolin

