Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBcdiLldjk8v/gANyZUsSUZ2NKo4cNfOWoKq7oZAIsM=; b=q4BP/3Z/oexYs6PTD9ubpLDagS
	EVsAfAStkS8S3m63maBIv+ZBMrlUBLU6CXr2oH0i9p3kkd5cWCsFMm5T0lRuQ2U3FyMLlOIb2nfqW
	smjSmG1+fCkQ8u0kYSCwIPOJ6xWw816exkwiwCJMe/Zn2LqP8YzFrZ6vCXWWnZ4OEjpo4fmOkx/Gi
	jFyPzBt1BEKmBHgN607+lnq+m5p4Vus8gGTrafFiv860jaOZrEWJPKTdwUZ047m86OkIBw8fXffDy
	8lDikCsbVKPB0Zk58fQQAYZH+4lcFDI4i00ASexQWzn4Gfn1dOJlufgXpIH7Y3rcsXILwaU33OB3N
	3SiAIPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwSg-00000000Y67-05CP;
	Mon, 21 Jul 2025 19:46:10 +0000
Received: from mail-dm6nam10on20604.outbound.protection.outlook.com ([2a01:111:f403:2413::604] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwNR-00000000Xcf-37dp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 19:40:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5lrM5VAB91Q/qPQxCY6Mfv8xFMyorIwJkpew52Tpnd/qqAloJ4U+NlDmT6GCvSUu/hQmc0rbFrQ8IWjNX5nv0H9U5tFLtsg6g/BpL6I1I/Wu0jI1bAInMtGbI8m+gM5TPlKsms49oGDlUrlcaPD8cWwiPzxD1nQ704z1Y0IwneSYyea/NrHbqqNDI0ven/NjOCIDzTc/1hiSTMjnfhHBqpHFzKiRgyMn+gYMALz2w6lQ2g7vgoJ3b2gRrqrZY2cRRyJfv+YL1jAtK4QHYfv3UELx6CcObNSOQrWdoM+vZu2MU/D2ehhnqrFNEwlZBq8Gwq9Esp3cyq+JIvkz297lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBcdiLldjk8v/gANyZUsSUZ2NKo4cNfOWoKq7oZAIsM=;
 b=oPT6jRnwH16gfpLWjlOTMJDKViU7U6SfMJ+z+OxF9nbmBOujqRljJao9eXZAyPODXEd6W1vsTxMRvFynjygOHUlMSDc/BG+eozz9zpbfuZab/WIBgk4FYsIejVBQacE44dvObT9l+CxrQ7Y5B+bTq0F4S80tSQPEhvtAtGAFRKnpvER3AOBImVfujTks+9CSmQMnf8da+h3xtvGYUdM0wiRkAFRn9ZHt45oAgxZAq4lV7kBweRPYZbjHaZZSLIKY+YDiu2w0HOzbbLnDdTzyPLsdo0q9KQBPvJZERYldbbeKm2hXEFsM2E3cIjf5dGiqsOz/JQ7eEqRBkfQ2zJyaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBcdiLldjk8v/gANyZUsSUZ2NKo4cNfOWoKq7oZAIsM=;
 b=FMxNJ8F1Z/MsU7qAaomhME6WeHKJv+Lc+UPVz+CNIGlceE3QE5ANJm9YuU75fQGisKKMeoIHNE1EHYHwuQ1NYZ8Htr7kE97RjO7BqpWvMvae5cSMi5y9kp3ym1RuhJw1s3LOPYIgxcsKmQhbk1/vgI3Zz8AkTEzj8mF6GZm9EfA9mBeJZ2HFOArFx4N7sKL+7HCt3nhiJxouvhg82CB7qW1Gk0XQGOl8GVO1igFP/F5NfoWq9AbAsx5xgdxUvQvwm2sR0F1wh4ySV6EGsQmCgu/5M5qvQsHv+oYfZdcIQihA6BT1RYdRIR86jUT3NoujYnKAF6AOeKleQPcMHTFt+w==
Received: from BLAPR03CA0095.namprd03.prod.outlook.com (2603:10b6:208:32a::10)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 19:40:40 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::1f) by BLAPR03CA0095.outlook.office365.com
 (2603:10b6:208:32a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 19:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 19:40:39 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Jul
 2025 12:40:20 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 21 Jul
 2025 12:40:20 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 21 Jul 2025 12:40:19 -0700
Date: Mon, 21 Jul 2025 12:40:17 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: <jgg@nvidia.com>, <joro@8bytes.org>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] iommu/arm-smmu-v3: Do not bother impl_ops if
 IOMMU_VIOMMU_TYPE_ARM_SMMUV3
Message-ID: <aH6XoVHRBvOfP0ZH@Asurada-Nvidia>
References: <20250721191236.1739951-1-nicolinc@nvidia.com>
 <20250721191236.1739951-2-nicolinc@nvidia.com>
 <aH6TuLAz4DeoLByx@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aH6TuLAz4DeoLByx@willie-the-truck>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 0451cdd3-1e98-4a00-e95e-08ddc88e78d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rfk5+q7a1GxquPow8paH+7s5u2lqu+iAj5Un4kWRX1AUaALHK/5bCi8Lbe36?=
 =?us-ascii?Q?nfmXS0D0G+N0K4F8HmH2co4ibIBr0DQ70xxUEAX06ov7W+frCQPWK1oRBI7q?=
 =?us-ascii?Q?wbnkscz2+yLygrp90+sxAtfIzfURLn7uHrPbaU6SdqWETXtOJT7hjBcZ8qWd?=
 =?us-ascii?Q?H8fRO3xMJAKONtlkyUCM1owmSiB9keWIbl7Q4L7gF1WMmB8SidOQfK9BQvYl?=
 =?us-ascii?Q?e2J+TD3zPWbz1EfKz3V9s5ra57vG8urM2pLar4X7hijkj2bZF9ViR2jc/E2y?=
 =?us-ascii?Q?VkPfmVNspOTmNIgGZfpIy1Tzm2Q3AgxSlz1pQ7qBYr3KBbdB27Wx+zB+1SNx?=
 =?us-ascii?Q?eO0+WnFlaeFKWaKZ7Gb3jek9XZ/RxBmlw0mb3jIycfGULhHE2/rjaZPGVI15?=
 =?us-ascii?Q?NnVe6Nq7p5TWGtYLvHAwrJEVOkBr8mojPFyesk8GCqh26tyeX/B1D0vgfmEm?=
 =?us-ascii?Q?ONAKpWqfffsDf4/7GZe/XG1jrXyka7lD55wHud5oRUJvh3HS1wWPFP/bbq3u?=
 =?us-ascii?Q?A4rH26R+KkNKXifBMGdph4fg2LVQpwBplgHmsGgli1YWYwN4KYUBdP3dy60V?=
 =?us-ascii?Q?UUD2EHXQYeZZWG6z0ljt0mmPBJzDoIC88EqVGVFMYv4Z8AF3S7smbyLeZR74?=
 =?us-ascii?Q?jbvjEVuf/B7GvDKv86FU7OCBn1NHAMD1yv0t3DF2Pn+D5BOhqNU0r4EWffoD?=
 =?us-ascii?Q?rJgtlFRQ9a9Kjl6kW3DnQWAOoG9UTeOGsLmzBT3vkCFYMUawCz3GUMu0efhi?=
 =?us-ascii?Q?DYp41CchO07yG5z2QKc2PGkircPdIbmmS3yM/FQKW42qOj1Fvux9y9on1lug?=
 =?us-ascii?Q?ttO8io5efygnDNAVcHpQCD+OTPMezD+K6dijK4OJSaZZL+oIlcc17lu1tXlM?=
 =?us-ascii?Q?Q8+oSoJLZ4q/MVwZb8zoaan5HZylWLGfCo/E/qL/rfuRXIbvMSZhyYcwr7Ct?=
 =?us-ascii?Q?MJ4pzNH4tzaQtOPetfZVgEsO5uxdXSyQiG1MnqJUB0hD7npVpmT/oVgHAxWr?=
 =?us-ascii?Q?aYSy/sPZ1SWSEm4SKWxZxuE+xSKbx/c3znwFmXL7F8DEh50grGws9hPt3Y1N?=
 =?us-ascii?Q?EcJ9KQ6h3EXGsQOWOb5safyJwLITsPCbYsWlF4RZleRTawNdPBYwzy7qmSkw?=
 =?us-ascii?Q?EE3EjTfxPrXZOfiGIqu7Wm7br+mfJkHDMksE9fy7t+XmLYYiaGFOuLnop3Ej?=
 =?us-ascii?Q?SHev9RxnYlH+gK6Vi4beMMUqJmkGC6qTCYNQJ6eyAHTK8u3XqdJeFiv40Ceu?=
 =?us-ascii?Q?z+IQRwb9MNvSbXeEOeRlTx8Zx+y+ZilQ2NE3tsQwTVsQKojtrN9LTYObHGDU?=
 =?us-ascii?Q?titI6Q09wcp8zRPKojAihYGi1ZNvQFVZL6mWPM8Jw1L87HW5phZGZ0CXijBT?=
 =?us-ascii?Q?6okmsXjjWpmnizsUMl7IhDCR4uGjTGy4W0Hd3qHe5A36JHukx7/ynmQsPOQN?=
 =?us-ascii?Q?8mlzi+sq8I5L993ltHHe6WWajAm2oqDgOWyod8IscF142BxfM5zp1evv5q9r?=
 =?us-ascii?Q?fRcGT4aQX9FD7i4HYZvCiLJLnlR2vVIzW4Y7?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 19:40:39.2645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0451cdd3-1e98-4a00-e95e-08ddc88e78d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_124046_140185_8C3ADB68 
X-CRM114-Status: GOOD (  12.66  )
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

On Mon, Jul 21, 2025 at 08:23:36PM +0100, Will Deacon wrote:
> On Mon, Jul 21, 2025 at 12:12:35PM -0700, Nicolin Chen wrote:
> > +	ops = new_smmu->impl_ops;
> > +	if (ops) {
> > +		/* vsmmu_size and vsmmu_init ops must be paired */
> > +		if (WARN_ON(!ops->vsmmu_size ^ !ops->vsmmu_init)) {
> > +			ret = -EINVAL;
> > +			goto err_remove;
> > +		}
> 
> I suppose that could be != instead of ^ to avoid mixing up logical and
> arithmetic operators, but it does the trick either way so:
> 
> Acked-by: Will Deacon <will@kernel.org>

Ah, it only compares one bit, so I think "!=" would be nicer.

Will quickly respin a v3.

Thanks
Nicolin

