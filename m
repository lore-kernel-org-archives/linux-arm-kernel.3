Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677C8C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 04:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBdlixYsvOcxHZFW6ofTe3G3GBiHaRdt10Hz1nuS61M=; b=GTqsXEaQI1/SMUqCQipwtyLskJ
	YusUZGSCItqhEXTqRw/YkHtFSxrAivjfp7rJMjwIGcueHXEG1efkNzid1ZCyhVf3ipqsTjoTTYHfB
	OqxXQF/SCgQIZPYcpP7Z9u7pL6umFvVtbSf6MicJuw1wEnW8z8wngaE9bAAqGz9nlrKWgInw8aLCE
	G+QBOV+7VOMv36YtLhchNYjyAlQ4DiRCYOAnelZt77qmufuH1XUGkvTI57KZWOKIt4/tqIBNbYVdT
	b2geRGtHfhQ433a4Wz3d7/Xjv6LXviyvJTINZnDzOUS0mY/xZ4xQVnkuDicmoIIruSt9HRndfC2E2
	UP3kV+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSqF4-0000000H7U2-0Uz1;
	Sat, 21 Jun 2025 04:54:14 +0000
Received: from mail-bn7nam10on20602.outbound.protection.outlook.com ([2a01:111:f403:2009::602] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSqCq-0000000H7NL-3LGT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 04:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMEqoeeb9B831ISorOol1WGq8K4ESDIIdkfRNx++QZET2MVrTdXQtwnu2kmKfAqTjD/z1ghdjHz7R2biwikAs7yyhM3MWRCLyWJJmTuDbcu5BtfqG8rHjo058G7UJa85Fp4SF20PoxbOZ3Qg0LxHrLWNUOwvOk5qHdFJ2FDG5L5HCbrUV8FnwsLYQViBqwiEKkVdMdA6+nzrgwzTI5C33j+PPQ3467+M2akOaQCdX0So53mOOeIjZjgYelGLWaYAPoKkqpiepKzWLl5NeRhbVvc9EJDCWJCwm42VyLt/17nojpIEYs7JA8p85YIRuFQ1x8PQc+yB2R6vFUW7/ZOZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBdlixYsvOcxHZFW6ofTe3G3GBiHaRdt10Hz1nuS61M=;
 b=BPEjYt8fsKx/bKDjMphXlVtZQLecE5StMZ1p9K6GxaYz7HK1DHI2gn6dUvlfivjlnlU5B5UIwz2A++CNpXPihkeGW8QLJErZ1nSYBOPjLcqRl2n5akRPHRiu/EFiuVmh/hxVHfylzmWGgyR+1/+/Dit9my4DkLsBhMmUrJkIm9QRdAn6+15u+Dlp+UOJ7heN0bOlnZ6JLV9ql7blYNXazVTtQ/P8Y5lo8UmT4un440u/NR7+rWXz2rD/YLZD0p/vBuYckkeXbfX30bSJuvFxQr7zdbyT0TUMlttcwDEXyOWO9+p1S+PyYJkWkQiWdeGs1pP47CqjfmubkXCzE1o0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBdlixYsvOcxHZFW6ofTe3G3GBiHaRdt10Hz1nuS61M=;
 b=kjtM902pAIPSCXuZJ4KfCxUYUdGT1hFo4UsDiDoAiJQO72fiFKmUstB/pjXXwmKd1zeOGwouqLEwQGJqb0lJIw7A+sPO+rHuX0IQ30d5Vdr+nIWqdiRujQbkaDiAnZn9nL8ZwnOe0Ha/ib4Df2sSMori0LbCuFWZK5qECbbW3qg2cWaEa7V/UafX0lQ8BPjd2GAxBbo0MICTdgtnuCtFqlGwgDaAf2kR06Oj1CWKdJp7/XWueRcnDBUgBiUQdgHsAW9J6GroP816RtYQMz+ZPiYXmwBVIrivQSUabPvpa4BZhnH8TTkQFPUFYHy/N1WxDlt+lzatOA/RX6y6BJxJnA==
Received: from MW2PR16CA0069.namprd16.prod.outlook.com (2603:10b6:907:1::46)
 by CH1PPF2EB7CF87B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Sat, 21 Jun
 2025 04:51:48 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:907:1:cafe::5e) by MW2PR16CA0069.outlook.office365.com
 (2603:10b6:907:1::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 04:51:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 04:51:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 20 Jun
 2025 21:51:46 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 20 Jun
 2025 21:51:46 -0700
Received: from nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 20 Jun 2025 21:51:39 -0700
Date: Fri, 20 Jun 2025 21:51:37 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Pranjal Shrivastava <praan@google.com>, <kevin.tian@intel.com>,
	<corbet@lwn.net>, <will@kernel.org>, <bagasdotme@gmail.com>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <thierry.reding@gmail.com>,
	<vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <shuah@kernel.org>,
	<jsnitsel@redhat.com>, <nathan@kernel.org>, <peterz@infradead.org>,
	<yi.l.liu@intel.com>, <mshavit@google.com>, <zhangzekun11@huawei.com>,
	<iommu@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<patches@lists.linux.dev>, <mochs@nvidia.com>, <alok.a.tiwari@oracle.com>,
	<vasant.hegde@amd.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 08/25] iommufd/viommu: Add driver-defined vDEVICE
 support
Message-ID: <aFY6WZAxeFTweA7h@nvidia.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>
 <aFPl1LD8r3Du-Far@google.com>
 <20250619114425.GB1643312@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250619114425.GB1643312@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|CH1PPF2EB7CF87B:EE_
X-MS-Office365-Filtering-Correlation-Id: 47a24bf0-b0bc-4e0c-fe85-08ddb07f5463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gorHbAfQc/BorjlhfqE0doyh+hIS22CU7Z24lvN3xv9Ph7arNi7d9KLuXaQ7?=
 =?us-ascii?Q?3m+Fi/qp8Wwpd/INRvnKNq7xzWydOAASaP0sBv5w54xLqIk6lSGDB/ShitCn?=
 =?us-ascii?Q?jaRA3LBhAq5XtVHqSKDwEaK2UWCVbBDfKpKKaM1DVG0OvtLUvS2/lwGKdtaG?=
 =?us-ascii?Q?SmvYGhw675f37o+6GDcU1bn/WuO0rqGdvUBccpDDMXh7zG9uTHzpNQtSFczd?=
 =?us-ascii?Q?L5vYXHkI4lv8XZU6TXwhgBXBTxq9qNzDExbBnwIPz6afjHl2NLandR9sWmLi?=
 =?us-ascii?Q?J9Z+GUAhjJuJNwDImUmLlABpPxJGjqxEEiMX/bnqlUbvuMUww9U1LogH9jq7?=
 =?us-ascii?Q?iIQL/leFUT4ASbFxjtPsqLChq7SRmLVoIwpFGs6DChPxtyhyhNpGOvk8OEPc?=
 =?us-ascii?Q?363p8ti9HlIB5E9753zw+lj1kmevqIL4ERgc/7X04P7wjNdrOl6yjjnmlV7t?=
 =?us-ascii?Q?f0qSg5AEreZ7pYc9PxIlWHQAFwErwFSIwLUSymtHL92/23yIQNFu5WNx9j7s?=
 =?us-ascii?Q?3qlSXV2zbgNtimFao4Qx4NiSP/UbjJwomA7zLL/yCNI9xfnY0I2L30H3/3yl?=
 =?us-ascii?Q?IafbQo469Jgw0Sxx3q5COw01pKMAQG1lGqeuc7uk2DEw8kQa6ZYB964snEUu?=
 =?us-ascii?Q?LNldJaCEjA09gsTz1czmDT6KRMIgWmmj4ilMjHoaze+GiLQOdBepk9SpOWpC?=
 =?us-ascii?Q?qaxV6TGHH8HE4ZjEgA1/cFVgYRgm0QulqbBwkq8nyf+SWr5t2y27WYzTPN00?=
 =?us-ascii?Q?qOpp2mQBGBf4QtigrISkCZCKFIoMoqsnY29kJJth1pIo4bY5fOpWpZzxHSS2?=
 =?us-ascii?Q?I0FVBH+ySRVjHzg4wI1B7wsdiMnA/Fkgsf0MgajvMzUC6svTBre8JsU2rAyZ?=
 =?us-ascii?Q?iSnbu/crovFaRSsPd3z8pvOcwYKZsDBLl9OuPyaIYuHclbEceZmmiFqf3vDw?=
 =?us-ascii?Q?Y1ze2IkM/CBGItUwmYQAKCWMMgnZ1512A4biUxORWRAJ23Mnz3BQK6DW8EVg?=
 =?us-ascii?Q?Zb45tW2M4cG/r1cmIrVokkdpmHx0Y2twtUONyUAHhNjk01rM2T65icCESf1d?=
 =?us-ascii?Q?GkcAIfuQscEHTT4zcV7D8YhaQ409ojyfQCqi4oJ20wg78Gx/OPBeFvrxU4ZH?=
 =?us-ascii?Q?7gEyyRFKvJ2try5DLFeKcSyNh3S00Cr4G5vuG+YQBvwidHsf69OWqSFnOOW6?=
 =?us-ascii?Q?BEd/XhDewwl5EalljXs+zENdpvAHz5ecLc7/+ysn4lWGSHhLvYgpU6gvGRdF?=
 =?us-ascii?Q?Jo9SSydWEzWQc/4skbFHNMk+DenDtrjULmwbTv9DYdKYcjcNCKAYpx9XLJ/l?=
 =?us-ascii?Q?BnN6oSVQDSFSG08IzeeTO3iKLCeHUq0RKqs1P1DzresJ/VcfmJ1XMwPf1zu3?=
 =?us-ascii?Q?HgAlfq/CSNpxppAxtB8WJf9ESf9olBIIOV7/+ENbIIHTDT45Q3IhbDjdONcx?=
 =?us-ascii?Q?1Y6GTzvEDont4Zi10DdJ+oF2VhEazgTTB9hHkXJas01EC5oj5NiLXPomepKd?=
 =?us-ascii?Q?BJiV3ASyfUq/0XmaAqElpySJY5zC01bZjc5S?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 04:51:47.8931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47a24bf0-b0bc-4e0c-fe85-08ddb07f5463
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2EB7CF87B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_215156_835620_011A0715 
X-CRM114-Status: GOOD (  10.51  )
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

On Thu, Jun 19, 2025 at 08:44:25AM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 19, 2025 at 10:26:28AM +0000, Pranjal Shrivastava wrote:
> > > +struct iommufd_vdevice {
> > > +	struct iommufd_object obj;
> > > +	struct iommufd_viommu *viommu;
> > > +	struct device *dev;
> > > +	u64 id; /* per-vIOMMU virtual ID */
> > 
> > Nit: Why not call this viommu_id?
> 
> And lets have a comment here too, we have so many different ids, what
> id is this id and what it is used for, by who.

Sure. Will change to "virt_id" and add some description here.

Thanks
Nicolin

