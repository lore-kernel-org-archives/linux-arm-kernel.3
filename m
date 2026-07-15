Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7356C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaPqsnevYHfyxj/8LHZ7XcH7CTej6Jr8t12ZOKmhuI4=; b=P2sXPod5sBUlbXLg3zPoc65vXQ
	F0/rd/yRtz8kyzJUsApwkzymHzxB9CIxUKsyxRcP42Ol0N8/zbYGleREJVtOHAl+tUkb3tLOE/eFG
	46eGovoB18LPDkrpJMX27+5kwxTjB3gwdVhS0btT5zZ3uee77ennvexN2dBPlXwDIkOawdQUZELqp
	8gtCWyp88Y+Jy+17EO+UUhEJM05L9Jnm9DPU/hFNfDyG0KySye0Ezi/+ccRk25aR8U/g7nw/9A21m
	5olfPp7lFyRgxVles4PZ0v3Npe/ENtLRuMhVnF3L/pfbn+1A19sHasB2YHev7eQNlHMz/jw0NiKk0
	uk3J6Fmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk6G7-0000000Fsnk-31iE;
	Wed, 15 Jul 2026 20:31:11 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk6G5-0000000FsnI-1rBs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 20:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0iiPLpCrgqF3XQSCOuOB3E53pGatQoyL3aqNvjw/aKfwsdL4OOCfG1b4kGTWIKNsHNwSvAwpCR26mk4vKfB9BHIHT00rLHKeho2u+Gg8Z9qgZ4DYKfBBgW5DLBL7FYHdN131n2GMbARbcW8bCR9EmMgkOkLWPblSV7ai1GCv6AhqcMR52X1KFbFISe5HGDsFic+0E3RF94x86y0hkLbssNdwu/8DMYnuRnk7k0EV+EP9esgKGfaJOdLEmBthPx1DsQGJe/D0DnKoYAY1FhXOOm/2Ycg3Vbqqzn4g18RaLrf3NCUmyEiR9FWwgIOlZ87Ar1JKn25ZH/MKGVMPzNYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaPqsnevYHfyxj/8LHZ7XcH7CTej6Jr8t12ZOKmhuI4=;
 b=y8KTOOu6uTEMYK/eKQYadifevbBrfvsPdyS8V8sYnPv5ub8FV/c6A8YERssUximFPsGIgPdZO6kfGTkjx4EVenLkju3I2wkwk4+AxtGQybTnr8buv1swdu8ltwJxm8AaMsMCBQGXokdHUNnQu+MqyJ2tdwyCnUFeUQmnRHYZ1AOEyd95ppXNzs+9VTZuBqe+u6EPmC2zSGd3x7oR9wZXjNfNcjqXxOnl+2gcdaGsA1ijo7tV4DiU+1FefwYEutXezbSmRMSU4mxgh4Hnv60KuQp8spOVzxLbz8RDe/aPjg2qzq7coPPuEYmZWsqR6EEcX/YjemCBzhrrekyv/XZvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaPqsnevYHfyxj/8LHZ7XcH7CTej6Jr8t12ZOKmhuI4=;
 b=qN3aNKGvEdqssrBVCrzTroukEARu4pXJqtgc50EynhJ2X5Lu3hZ+eSmtzEK2cq2k/fH1greywpXdn2qBsaLPXJhnymvkSJdUWjqC+JsgPLw4ksNBP/FcRkJDKNsSH/Fz3jH6G43QjfxKzsfVdOspQqz6JaPKu94zgs77tffXHjvQxraHKxtUsB+O9FLUEU/Y8zFrnvBl9HmOkbLcWx7mtJUNfL7vF2lZRsdejUJOofFPMEYO4RTaSHAkmX7s7+FoyI00zg8nXciMqWw+sG68BdMsuRAgKz5Tcun40gV5eQmhTKrEo+UzAIGFzg90jTgTPqIEL9Y/YKTfrOoW4YAgRQ==
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 20:30:51 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:408:e2:cafe::4a) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 20:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 20:30:51 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 15 Jul
 2026 13:30:25 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 15 Jul 2026 13:30:25 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Jul 2026 13:30:22 -0700
Date: Wed, 15 Jul 2026 13:30:22 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, "Robin
 Murphy" <robin.murphy@arm.com>, <joro@8bytes.org>, David Woodhouse
	<dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v4 0/6] iommufd: Iterate the cache invalidation array in
 the core
Message-ID: <alft3llhZ79t17j8@nvidia.com>
References: <cover.1784054606.git.nicolinc@nvidia.com>
 <20260715201521.GL3775915@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260715201521.GL3775915@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b74dad9-2e7a-4fae-5021-08dee2aff662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|7416014|376014|10067099003|13003099007|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /MNn6E/4fq0EWVAtOkIoiPwCLjpMlf6V6qIdL6ipQ1fcJKxxYIOWlHMEagkb6cwpj4LXAWQX43U3PwjYxh8pUfsfz0zjJ+nAUTbRjKIAbuTqLvDWhEOmJ2wQJvEITuWhqNF9aHz7A5UbIhW3VTWSpS/9+0QOz8G7U5/HyylcQaxVtVico8ywLNIjvPbGNLyeHeGw0aEh/RRpccAg5oZMP3PQb4xG+WipEwkj/p59jxrCNMeuXbZNrrGxRSPAziwILapdyqIlLgmJFGauahNxCfrXK0rY/UiEXogKLnwxqYHQs0+rdmBtiO40wHHO0/YnwKmOqgSl/uLMu7+VxMFT04u4UfPakERe6cYGeVnF8q/seM3UeFTuBmHoMOIp5ty6q6JLSuxH3CNmMSN7RK9shy5COyuPTl5kPN/wUnQKv13FC6PnPOC6DYEp+YwFNMPOdwatDCdomVUj2Z2bauHaeQ7aB+eq5W7oM078zynr0X5ygbaps8FprH+Ym0ajMChGmTP8MoqLkQs6qcswuiAv/Jsjq3+oTQwD2YAFDzEhmfpK5CS9aQQV7Cg4az8jETz43GG/wFstV6UoguGRJ1hU104AuFhumy8TZ9tGckeDwFRoEcysS4v5CbN8IAbhTnRttNSachFWGpF6H6yClnznJryGPDPcY5c3fq2yfb+NFftffTAQxsqvVtqHsO4zcdljNSmak7ZLYDzGe7lMCUhCFA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(7416014)(376014)(10067099003)(13003099007)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 97Tv/BvNvxeVPd/ckvMzw376zE3pBOTyGJ8HvykHr7zDbVeBUBcoZJvDsCdXUxj0eOwVGkGPEb1RUL49luJd+79dzKHw5Nbg/NTyCGBydd21yRcEBC+mM9u2J8olg6PT0WljrghpD+WSMs6zsGY0kB8Wht1t9awAla2EeAULhTKn7T99/soDs7XD68AHo29AmvDrYcHgeCzG6rcNl/PmXWIDKniR56rzZmQXZYUhtKTWM/4w6lgr+7V6ZvDCBz2TwVRYeWZvRFT4Kzjqv1VIlbJEC/EuQ+DRxM9wQegD6rL3OPtCVwyWcT6VvXpZ721SVDTOX+rquBJtPwFH7uSAv3pRgf+dTk/zb2w3zui0jQc6t2ybZUfUETC6xeL5JKnqcsF70oO7XVCPJ3XIVi904exxicsb9JL/HgLa9K91ab9XvKL+cOjArG6M4JljEw17
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:30:51.2094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b74dad9-2e7a-4fae-5021-08dee2aff662
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_133109_488001_FA939DED 
X-CRM114-Status: GOOD (  13.54  )
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

On Wed, Jul 15, 2026 at 05:15:21PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 14, 2026 at 11:48:46AM -0700, Nicolin Chen wrote:
> > Nicolin Chen (6):
> >   iommu/arm-smmu-v3: Support IDR5.DS and widen the TLBI SCALE field
> >   iommu/arm-smmu-v3-iommufd: Reject unsupported bits in invalidation
> >     commands
> >   iommufd: Iterate the cache invalidation array in the core
> >   iommufd/selftest: Convert cache invalidation mocks to the core array
> >     loop
> >   iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core
> >     array loop
> >   iommu/vt-d: Convert nested cache invalidation to the core array loop
> 
> I was tempted to take this through the iommufd tree, but Will, I think
> the first two ought to go to -stable through iommu ?
> 
> If you do that then maybe I'll pick up the rest

PATCH-5 touches arm-smmu-v3-iommufd. Merging via the iommufd tree
will conflict with the PATCH-2 in Ashish's series (via iommu):
https://lore.kernel.org/all/20260714104202.1664187-1-amhetre@nvidia.com/

Maybe it needs a shared branch; and then, Ashish can rebase?

Nicolin

