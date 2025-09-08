Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69936CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHoNavILgoH0zoOHP/wjoGt2GG40/38tedSowxsYcEs=; b=Ijd7UWBDIa6Xct0Ncl0NbneTZZ
	GA90+8/u1RKJhETfQ0JieBjuiCqpjAMvFheYRrOef/zedA24QyAtnTko9sFLZgTgcaekZgyla5Zs4
	k2ZcPTGJ3kqbIdtp0UEPR0igeWAB+elNut8fL6+IiBqL2k9erWnTN6LLYoM36ZQWUIq3Wd/E0OyMZ
	Eva4vv3uqTKJkbYl4lRRbEqfOGd2u27oMi6KyibgGTYEffTW1Vy/B7MkW6EjefcGBQrbQAWpmkvXz
	cboq6K//yiAkAhbccf4gPAQWHn+xKEpci6mAo4CV084ACGO/5Bg+q7zhLoCklR6UxNHie6Q2U5+C/
	7Qwv3zQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlgm-0000000367F-3nxh;
	Mon, 08 Sep 2025 23:54:24 +0000
Received: from mail-bn8nam12on2061c.outbound.protection.outlook.com ([2a01:111:f403:2418::61c] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUU-00000001Uwz-3kMZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:21:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hla4kJFqqPM4CoKHkelhXaaf8lH3f3Oz07T2U1M0UEbRpm0a0WFvmPO7xuC/GV82YRmiaDx1m0GdrJnmH6QpuOlXoOAHAEHnnfO+T7YnEBVVc4Tycxv6OX7Lt8nW4jNBq5NVLaofcxSzK2LXlIwkUJM8ekx6O5Q1aHdOX21ssuyPla8s4OJJtYV+he4IturilaUfADOL1GysG+Fii193bRmiZcpSwWfuzkzzllcTOL12WMlHRbO4d4y8xJXfEQM9VBaE/HXsbrD4dcK/RpzB/vErkqEPr3BLT1rDdiVRoDPnj9URYNgnDXy37eX1o85eQfi87SkclLI0doLsskJOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHoNavILgoH0zoOHP/wjoGt2GG40/38tedSowxsYcEs=;
 b=tCxRaEUlCZCDoEEsS8RBC8OjBbXzhNLnBnkM5bzHTA6Xk4d7E/+Jw8Xz8nsBI67XSy1R5oObf/eodA5ex7PRsiq10gwQMDzYJQRdp4Cg44S+WTyNd3+1/QxEU5HtMiFB9wjBgdY8kha9AP/64XnFIcJq/PlSASGd1N1FKNlGbE9i/5wfLACCGzKs/AIUJamrPFt4knvo0bkLY6Lp8r9Hn66B+la8Ptcsnqbfhqg/LWbFktw8d+bwQoOO4qutJT76es8Ac4te/gt7mJbiudTe7WwPlT/7mvPCTl9aSR8LNlmc9haxK+Euxouqttn0l0kMY9fqLV/+j5Gm5y8Yd5XGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHoNavILgoH0zoOHP/wjoGt2GG40/38tedSowxsYcEs=;
 b=hHdvidJpnMnjmdrKbHROfFrndQyfEI8yhWdcmhVknuGk4vFyeRwC/IE1xjrIfe4K+MT1UmyTalYFLO0N41uwBFbJ7zwWr79mA7DiO2AEVjA7LEGhTKSPoUlkRyGM3uBIvpDfnfF36j5k/boA3CkUwuHWUT82DX1U5VMnzyFAPRrj7UskpRAttiCM1Alzi+ns3Jqu6jmRFjeh+Qd7rbRCuQxZd1HIaysHVMRtRHzz4eWTlJ1XreWRkUiOGvH+0zbLYoK+0p2UPmbVJDUgJ6/J++N9A7OCpjmojpKJmJdT7kHXFgy1lu6bblvaxKg/vTyDvMOCBtywiS4XWMAQVqxe9g==
Received: from MW4PR04CA0244.namprd04.prod.outlook.com (2603:10b6:303:88::9)
 by MN2PR12MB4109.namprd12.prod.outlook.com (2603:10b6:208:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 18:21:16 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::c4) by MW4PR04CA0244.outlook.office365.com
 (2603:10b6:303:88::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 18:21:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 18:21:16 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 8 Sep
 2025 11:20:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 8 Sep 2025 11:20:49 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 8 Sep 2025 11:20:46 -0700
Date: Mon, 8 Sep 2025 11:20:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jean-philippe@linaro.org>, <miko.lenczewski@arm.com>, <balbirs@nvidia.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
Subject: Re: [PATCH rfcv1 4/8] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aL8efIbaUl2xxClD@nvidia.com>
References: <cover.1755131672.git.nicolinc@nvidia.com>
 <fbec39124b18c231d19a9b2b05551b131ac14237.1755131672.git.nicolinc@nvidia.com>
 <20250827200002.GD2206304@nvidia.com>
 <aLvt7WBgvVsAD7wC@nvidia.com>
 <20250908155149.GD789684@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250908155149.GD789684@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|MN2PR12MB4109:EE_
X-MS-Office365-Filtering-Correlation-Id: 761055f2-942b-4b18-f31a-08ddef047ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ko56AfPgCfVNlvreaJruizfo01vgA+1T1F7XX6pLlau/33upttUdFhw58xcj?=
 =?us-ascii?Q?6TpIHnyFJGnQLlCj0/3Shfhc9tayE9CvIjCt7SX43+3PGdaym6eOuxfclbpn?=
 =?us-ascii?Q?k6t7C7lcF7YepfrS6DPYPwHvBgCfIcefug3/sBeA4HHNVuJuU3dx+p+hWjkc?=
 =?us-ascii?Q?YIdvUBy374z2zWhRwUVOEC3icCsfVTlgl2YAs+w29+sr75KQtnWOjvXTDy42?=
 =?us-ascii?Q?iOMQ9BxIEBfUyghvRo1L+U8Aw4eqhRqDRQDy09TOUwuQKy0koj3y5OB9eldD?=
 =?us-ascii?Q?u5YO9sHTAu8HTHpoOTbQjUJ3sqgqjswP6/yatP85ThiOSYkpmodVdLghm7rD?=
 =?us-ascii?Q?WlzUOQQEfEhpNlONNm6PBEOpL104K3x86qrJn4c6rSHe8S2Xbj4Sj+qNbiH3?=
 =?us-ascii?Q?1EB5iYVcGYunoMj8LXkSWFxCPksT2cika0P7rHbKtIR3ohG+hvEc+7WtYwYS?=
 =?us-ascii?Q?o6aOztvq9ciWr94MtVT1txqWWf8X65jbCr09fvQRkZfq5cNASgg5Kb9t2zOD?=
 =?us-ascii?Q?6OOxsKKbilH960MtOB/zMDSJMLYpv7F9OV4jFfQdyVliiLJOTL09RW0VfF7Q?=
 =?us-ascii?Q?xjRhOme9ZGTV4JRsEGv3NzezLAbUlCizgSVqrhRtAv1tVqOcs8yHC1qv/jyA?=
 =?us-ascii?Q?J1StBu6B+QvBTYoRxNsxiGwc2JT+UOhkTvCVlAAvIIut722um8VOxBz1dp5V?=
 =?us-ascii?Q?VDpNS1cqOLHQDJsiV+8M1wq2XMpYFz0txMlNoLXVhHwjclt9L+a9Ktfgc78P?=
 =?us-ascii?Q?Z0u/LsjlHme4cl1PgqrW2/XaTLHPz/Y+ORV7XRWoagX7f3b/TI2Mhwwe8Lhh?=
 =?us-ascii?Q?fC2drVkXiK/VMM6wEvPk+Qzck8+vGggG1EPy0r0Dqb/hq18rp7gpIxK1zd88?=
 =?us-ascii?Q?xpPqkjLGq38TfsGZrDJZMVZm9Z7smZLDbvzbmizzXr0wiQhVpObwjyrXSff/?=
 =?us-ascii?Q?y2nilV3gpkVt0rwYPPB8SMB6q/Opzl/VwC/W9NZR9v7oUh+gTw5iLyO6msNM?=
 =?us-ascii?Q?Ou23QDD1yLDSufsTWOPXYV/xdEqlVmi6L3hxVGeuUcWyy2NvDK6+rJefI6Zd?=
 =?us-ascii?Q?+iHv+MB7baPcSpmsIC6d2Wkkpj2eOyMEPWCEUf6/4FHHnUlfmMvj9LyUjZQm?=
 =?us-ascii?Q?ugUKzzocCtr4iVNEXWhcvt//bRYYpnPgBDtEPj8XKAoOZavWlZvZX7C7SfIt?=
 =?us-ascii?Q?tvP6eXxbbOqMlmo9yr0Er+3htuI0q1pUy9vY5hCo6h3X4TTZ6HsmqdDXzw0X?=
 =?us-ascii?Q?NjkohUuV7EVlCkvuCBQ3+zQlZNBbC41VBgnBMiChfERyjjawcJoXVMAzZA8o?=
 =?us-ascii?Q?BmSV3hLisrpCOVkECFX/g/s4GdwR3kOi+eY4mI0RWEmr5uoDIfDp0eG0pBmh?=
 =?us-ascii?Q?pJ6t/WTrRvjpr+pCv+1/S5acbNiSpKikGuEjMT7Ft4DrRXlmqSDd6FDFDssg?=
 =?us-ascii?Q?j5ZdOSaqJINqMdAxg8QRWuyn3Yk/VXqv25qDl14sbAInNcxmw1Bj7Va7qVua?=
 =?us-ascii?Q?5OMujZFn6xRd0TI++DImSXI0+tMSh5joU7Y4?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 18:21:16.1400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 761055f2-942b-4b18-f31a-08ddef047ff0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_112122_924918_275AC545 
X-CRM114-Status: UNSURE (   9.19  )
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

On Mon, Sep 08, 2025 at 12:51:49PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 06, 2025 at 01:16:45AM -0700, Nicolin Chen wrote:
> > > 	/*
> > > 	 * A sorted array allows batching invalidations together for fewer SYNCs.
> > > 	 * Also, ATS must follow the ASID/VMID invalidation SYNC.
> > > 	 */
> > > 	sort_nonatomic(new_invs->inv, new_invs->num_invs,
> > > 		       sizeof(add_invs->inv[0]), arm_smmu_invs_cmp, NULL);
> > > 	return new_invs;
> 
> This should be deleted, merge sort always makes sorted lists.

I see. Dropping it.

Thanks
Nicolin

