Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D61E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD7oo7MGfrEn4qm3fkgySzt8Y+M2xVBjWLd+qKinRIM=; b=uzBNyHFmbKFeIyaKR9jSpo5A38
	qDsS0kAQIJsGW2bjRIakCHCO/rVG3kumNvksiXHwznIOkf+6qKIWsgUr38Q7F+SnVSf3Z5r7XDp1a
	iNJ6tQQAymwwEQl0o9++sztxAmh7+243RvrKe1JioNydBfP7FDZxWcjca6xU8OJiH4SvK6/t8onGW
	c0WnfqdyNoshuEQ2+vUwmWf4ra2EencljYHzKzsu5DecO2O+vfirH2dGKuRNC7XPr9xrBnDqSOmEF
	/thQqpdwa2zCn948yGns6H8zXmj0Aq6mmLjKixOjk6Mg3M13RyBemZYNC6woEvv4LCtAOWTLeOFXy
	DF9QKjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL9M-0000000Gpdk-2vMm;
	Fri, 10 Jan 2025 19:58:32 +0000
Received: from mail-dm6nam12on2060a.outbound.protection.outlook.com ([2a01:111:f403:2417::60a] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWL82-0000000GpSp-30La
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kchZc8gPCfUNHEV8oGlnDF7EZwEpytPxWJF91ud3L7O+iDh8DQXREqVjtDDAxYp8LNzTm3I989rLgWOUR4pwY7Nre91Fj2vhsmaKJxIhvijmFCdbLPonKjMUTKBqYStOyTYNRsg6Z3V5p8WgubBz7sBjpK8tC5UlrnxqQE/pXjx0UOAXO2eCsdL19isccCFWyCq6FAbCKcjZte0bAWAXrPI4JlWpjA7C+4wzp/OwSrgMzAyQ+JfL5tJtR1ZjBzENmQxNXpmSnC7jmEac2rmQcVPVAMPSxFORn3Zc7OCvLqq+2U4eVHk3phej/x9rcNafemJITb9ydJBVpwX80VgGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD7oo7MGfrEn4qm3fkgySzt8Y+M2xVBjWLd+qKinRIM=;
 b=Kd7LE0dIneKZkreHKUbECsrgdPDsdOORjWIH5K5UrG4JpKaas/0sQAYd9vTHBmUMHSH6z6s6PAseOjpGDFrP6MMLwpo74NvLgUUYF63QURvOjb/7I8iW+1tlhddmYJST3FcgltwOv/KeZg+vQ5gtHVzvSb6Nh++MdKbQoinn5Bq/62Py/l9TWvQAUneo03J8ZxA7SZibUbO8Y/aAN/dtCzMYlweTo1idBUTZaLTVsH2fxb6ditIUunOgHIkDsmPsB8eZSczRI5BuPYkWXSHLL+DsTpshSHb0BaNCbMTEiSQHjEpGq6qdQM6bUN7fFjQY9OOojULSIl5BlR9w+15u6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD7oo7MGfrEn4qm3fkgySzt8Y+M2xVBjWLd+qKinRIM=;
 b=UI2fsV0mYsZRrNeix62EzkimhAU8rHOI1PlwNiU0K/h/XkgrnY0xYz+0b4iYS+qW6XmQ7WsBdjPMbwsTF02H+YUGIHqhFJbHvJUWahgeXrQH95DhjjtuDFaE4fodvhIJWQHN0H4HYZMcuISIufEyoAlV8DOznY63UxixGZNs8n+a065hR6+aj/016TtHiA357Ke+WeeY1gHvjlxXanjunxpaYzdHX4mccOfBtdudCbOngjOmdl7XPU1OcpcYVK9qtmMPgWJhyX+2IL9mSa0+Rirmniw4xv4jyzEfsFfosmTh+jpJNz68NzUE9uBuWiBagPTvAbIEMOgHT8fNidncHg==
Received: from MN2PR01CA0033.prod.exchangelabs.com (2603:10b6:208:10c::46) by
 IA1PR12MB8078.namprd12.prod.outlook.com (2603:10b6:208:3f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 19:57:05 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::a5) by MN2PR01CA0033.outlook.office365.com
 (2603:10b6:208:10c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 19:56:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 19:57:05 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 11:56:52 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 11:56:51 -0800
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Fri, 10 Jan 2025 11:56:49 -0800
Date: Fri, 10 Jan 2025 11:56:47 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <kevin.tian@intel.com>, <corbet@lwn.net>, <will@kernel.org>,
	<joro@8bytes.org>, <suravee.suthikulpanit@amd.com>, <robin.murphy@arm.com>,
	<dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <shuah@kernel.org>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <patches@lists.linux.dev>
Subject: Re: [PATCH v5 08/14] iommufd/viommu: Add iommufd_viommu_report_event
 helper
Message-ID: <Z4F7fzLYtD/h9J4q@Asurada-Nvidia>
References: <cover.1736237481.git.nicolinc@nvidia.com>
 <b9b4f3df990934cb80b2f5e1e49e555e50c1c857.1736237481.git.nicolinc@nvidia.com>
 <20250110174132.GH396083@nvidia.com>
 <Z4FpMs4qx3NdwrnZ@Asurada-Nvidia>
 <20250110195114.GJ5556@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250110195114.GJ5556@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|IA1PR12MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: ff0f744b-0449-4dd7-4084-08dd31b0f554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EEFj22D/JShHoSgD1dfsZJEjT/pBk6XnPg7CWKfiHxXmVq36AE7tzNtzx6wr?=
 =?us-ascii?Q?5/i5XSx3BmoEPC6GRhrlOgOGZzQgUC3EgvVuPu2TG1sLSp6EiFwIz45Gg/gq?=
 =?us-ascii?Q?GRsnOpnVGIdZvkytDQqQtvORWOO+n2j4RqIS1axxIJM2HB/SwjM3HDy/WCoI?=
 =?us-ascii?Q?6Chd4gBqWX6IxiOOUnnOES9YSIhdygu6iMtPQ3Qvj9Z1dtiT0sAmbi9MoUhq?=
 =?us-ascii?Q?CvHgeU61LWlNE40JFd5Wr8Iz+juiVb1Pa70rFUDjlyKU3oFa4PRIgcWH5Yvo?=
 =?us-ascii?Q?IemOeFaWNwkMcAGqBEFeKU0r+n89hjptUTwB78w7aQOZzdQ1sw00Znbt+GQu?=
 =?us-ascii?Q?F2fbOa9yaP/sK+LE9vrFlEOO5AlDRH6pwYRI/QB2gYcWVyM130/d/ocwH4W6?=
 =?us-ascii?Q?pjQ2M4o+0ln04ghb1U9g+Y1LuI8SQz3B2Pcy1RHpU9rvaWqKx/lL8iMVslYO?=
 =?us-ascii?Q?4wY231cHU7rG0IXtUDowtKh29uAIApETjYABAFJ25A74bGsSoUE/2hgf8rwD?=
 =?us-ascii?Q?HcBIqdI1wG02/9fi47UFTVajcFo2kXcHvGNoZyj3dIjrl5gv+1f7Y29u+Qsb?=
 =?us-ascii?Q?zIB8+3j5gI+GEQwXwTByDwQn4gr1TXwV2h+BOtp80dmpRTQyrfSqQE+ldir0?=
 =?us-ascii?Q?A9nQfrGAvD8MVSZHVZ3VHgyrmBA1kayORPgEMdJgtvwUZyZwjz9WG4+wKbvC?=
 =?us-ascii?Q?iTv/V7mBDQVgMioHr6mQJA6uq/W14gs43Ke/5T0+A0Q9BpSyacf/zwli5ZiT?=
 =?us-ascii?Q?7Z7vrTZEMG16X9ehm5YlcIJ9Gj+0OiQRJczM7ZthovvUhi+kbmKurOJtb7Wl?=
 =?us-ascii?Q?+fukQkjHYZ6K5Bx1kc/VdoCdqzQnKPR+g49HnR8BGgboakHu0dNo4807HaFP?=
 =?us-ascii?Q?bIVD5PX5ab5IJwBo0E9PlqWUqIzjbXc5L1bSudlqlL/5djq7QWeUE757jYQ6?=
 =?us-ascii?Q?Mfs1Dj9b8iv8CMJI2HxvFN7la2XTjwA+SjFJ0OvTHjWS3Wem/BKj7Ji2/scp?=
 =?us-ascii?Q?4F8B5H6/gsEk56NN1O9JbQXZnvAq1V3kt/YUYpsnwSmcD73yDYNHrPtOKatl?=
 =?us-ascii?Q?/d9uTEraWgQxf8+uBFF9ynzKkWbuZAmMauVLlmPyi6Gri4I0gdfyjLaxWPCP?=
 =?us-ascii?Q?d1zkUvxP+JjjThpt8+DuAgHdPP+aTl5LtxXG7wDgwY1UeC7Y3XLuy+jce03I?=
 =?us-ascii?Q?kgKEM+af3TtzpJLHbbdHFhuSCt9OuyD7FAm/FURyw+iflcqhkttm0dlN6cD/?=
 =?us-ascii?Q?FJV6IH2OUMs8zk+2UCaZYURnjgd4p+oqoEdMHw6I8auQv1rYScrJRMQS8HFP?=
 =?us-ascii?Q?yPMBMg20i/QY06f7lZ3UuOFRaPA0RAbsGlNQFwVeL8N8Q2UsOwleWJ4JeV3F?=
 =?us-ascii?Q?39mxTqvzyl4KLixLbYWVIuRvC8NxlmyYXHodaLDrPrLgbYkzbkQ9KRj+50FN?=
 =?us-ascii?Q?QcP55xFDkZw00VAO4GORh9wk3F3HFeqgX7bPbTJGspfnFRrvQCg1CAxPla6n?=
 =?us-ascii?Q?T4Jan5LSklD68y0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 19:57:05.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0f744b-0449-4dd7-4084-08dd31b0f554
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_115710_767097_5E0F0004 
X-CRM114-Status: GOOD (  21.74  )
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

On Fri, Jan 10, 2025 at 03:51:14PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 10, 2025 at 10:38:42AM -0800, Nicolin Chen wrote:
> > > The virtual event queue should behave the same as if the physical
> > > event queue overflows, and that logic should be in the smmu driver -
> > > this should return some Exxx to indicate the queue is filled.
> > 
> > Hmm, the driver only screams...
> > 
> > static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
> > {
> > [...]
> > 		/*
> > 		 * Not much we can do on overflow, so scream and pretend we're
> > 		 * trying harder.
> > 		 */
> > 		if (queue_sync_prod_in(q) == -EOVERFLOW)
> > 			dev_err(smmu->dev, "EVTQ overflow detected -- events lost\n");
> 
> Well it must know from the HW somehow that the overflow has happened??
> 
> > > I supposed we will need a way to indicate lost events to userspace on
> > > top of this?
> > 
> > Perhaps another u32 flag in the arm_smmuv3_vevent struct to report
> > an overflow. That said, what userspace/VMM will need to do with it?
> 
> Trigger the above code in the VM somehow?

Oh, I see. I misunderstood somehow..

Thanks
Nicolin

