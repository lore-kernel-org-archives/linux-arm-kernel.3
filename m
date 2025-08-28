Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53CFCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/15TLv9zzuNxe7/fx6McdV+ZXtXTckksQgFN8JCIc4=; b=CJ14OeOfj8zuXKeEYrvkONX7TW
	NUT300bUIcvfrucxqbt/Ox592K9otOG1WKpwPDid919B8VZkqQEgLjsjUx9mXkKWFK3QxU71371Gc
	fpImX/JuAuUNg6b+Dl2jFvam5P+IHyKjCvHets+CoLUeJhQ+S1qhYzijn+WrqwPw9fLUbWRHyr781
	GitdQ0Fq8hi0DMFzhJgTOY+Cm2+a3q6dzlfIz2JA93olJngiVV9YAKfeh5nosrEvcUL8cZEtoD62i
	ezTXIoEkUKjI2xmbAiWF8scSQQG4f6GXXZfC8gi4untAG94jxyLg04Y4NHutFeFwrI0ZphBbgDu4r
	TRzmdXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgvV-00000002bpb-1hfO;
	Thu, 28 Aug 2025 18:00:45 +0000
Received: from mail-mw2nam12on20627.outbound.protection.outlook.com ([2a01:111:f403:200a::627] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ureFF-000000023Gx-2S4w;
	Thu, 28 Aug 2025 15:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNCJVQxUSKNq4tabxsNWNaRMP/pfU5scCzB1d8ZbVKxI5QTdo0/gAKZ72IFOyDIYfDUbqxEHvYrPGSxvVvsW7WXyHYhXrQWLCY9p1WJ/zHmwoTCL2X1goO4hhIrE04gtevJueHbvVoB78UOUt731ABX+LEGRGXdcIs/Bav/QYsA8WwTNhixExJz0T04pgTMJv9RZ72cGebNY0hRNSOihtonwSlKite6zWsta8nuMH9HOExLkq4h/DsB6z+pFtfl44dFUlzsLedrqRklw+8hvE2JhHpJ/Ib6EYDFv8pcULoBUThdb3t0G2bq2fGQGt0umIj7hxmDh9tKDm3OSYbEvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/15TLv9zzuNxe7/fx6McdV+ZXtXTckksQgFN8JCIc4=;
 b=dGUFAQNLRVuj3ECa/rdCtmPekxdu1682nX5K3ivGmJkLssH9VPLZJ+bHy7yrLpIKOBCwcJJ4/VbrYuiCNce54m1hXAeFA23iEp25s0U4DKHZueTaLnQuz8zhBnWS1UMivNo61KGldnKc1hfspg23mx0DI5pR3wQbzMK7ZXbcG/WpILEqMQ5h1XUKO5G3kwAHGGbRDMxWdfj9Mgz6BxQoO4oa18x9EMDkFD73u/eMG+3x7W4YsUPnDCMqr+E+hmP4Y8CK+fbOXxOJP7C0tuNdWH4RofJyvT59aAMAyR3lwMDHthjMkTgkwRyX3npIIQBLiD1AQf/9rcttA6k1Ft3x6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/15TLv9zzuNxe7/fx6McdV+ZXtXTckksQgFN8JCIc4=;
 b=j0ctJCbn2gyjguogGApv1vCeMlgFDp3X3ic2BEIWDBSUVza7lNtP4MqiTMVjPZSrAiJZ72Ulzgz7tFX6PIxKT5qqG5o9S4FbW29qkfqnoh54dip8ADot5vdxbT1Biv3e8Mfud0W6XMw7aocvceCA9oTV3NkkiloBg9FKGKfXCfJWZKU3sFVtqVGdGCUV94Jslpa+37VOx1za5Xwsty4WmLKGYsQTE/Qw2ZKRvGydtoasSkV9LH8QOKhe3jalLMP7fcjjqQI2eGpLZ5YHZ55u9fYFVJgHG7ENrm0KKKZImwyFtABAf4kV1xO8GB8pgXrBFoNohptDFwbvXHFSF8WrQg==
Received: from PH7P220CA0064.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::8)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 15:08:42 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:510:32c:cafe::cc) by PH7P220CA0064.outlook.office365.com
 (2603:10b6:510:32c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.18 via Frontend Transport; Thu,
 28 Aug 2025 15:08:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 15:08:39 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 28 Aug
 2025 08:08:17 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 28 Aug
 2025 08:08:16 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 28 Aug 2025 08:08:14 -0700
Date: Thu, 28 Aug 2025 08:08:13 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Ethan Zhao <etzhao1900@gmail.com>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <bhelgaas@google.com>, <will@kernel.org>,
	<robin.clark@oss.qualcomm.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<rafael@kernel.org>, <lenb@kernel.org>, <kevin.tian@intel.com>,
	<yi.l.liu@intel.com>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>
Subject: Re: [PATCH v3 5/5] pci: Suspend iommu function prior to resetting a
 device
Message-ID: <aLBw3UTAX6F0IOCf@Asurada-Nvidia>
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <3749cd6a1430ac36d1af1fadaa4d90ceffef9c62.1754952762.git.nicolinc@nvidia.com>
 <550635db-00ce-410e-add0-77c1a75adb11@gmail.com>
 <aKTzq6SLGB22Xq5b@Asurada-Nvidia>
 <20250821130741.GL802098@nvidia.com>
 <aKgPr3mUcIsd1iuT@Asurada-Nvidia>
 <20250822140821.GE1311579@nvidia.com>
 <aKi8EqEp1DKG+h38@Asurada-Nvidia>
 <20250828125149.GD7333@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250828125149.GD7333@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 6876a271-1d93-4db5-450e-08dde644c53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ftz9oIhoxyiiE8b4f5blMj7yMYMLfJjAw//2AGpG9smkaW9PGZ4HD2jhuHw3?=
 =?us-ascii?Q?dldCfZrxffrgUiIQNHM1mF3VPUlsLlPHs3Xifv8PT02r/TYRqj6mEBskVPPa?=
 =?us-ascii?Q?+bhZDcOw3vPXvNldBy+aoSTxCnF7ceUeuLOurgwzDHHQk2F8QYORpNNpja4n?=
 =?us-ascii?Q?3yZn0cG8THGpRGnd3+eZMsqaUSW6bhI8lojtBaIgSuseEk2KAL3Fv35Fh7oG?=
 =?us-ascii?Q?o8Ktxy3MY3/bELl8syTZr+odTO6eHR1Kr/LJ9wV/oRDyLBsU3FRtYl2iyUMH?=
 =?us-ascii?Q?cx+6d+OQEXROz2BgrCKhi0T1W1PWlrl+821/m7wC/PhGEonR6C0xnWnrEKNg?=
 =?us-ascii?Q?hEO8pF4cneH7ptw6xXHRsOF9rOcNgTfN9QmN9iphPoX0IHmn8M9kTKq3SZix?=
 =?us-ascii?Q?zmaEpKkpmgU2mHqHZM+jVFgvju0+MLYnqGxbY0pTXDmI/r63MovXN3DrhsIO?=
 =?us-ascii?Q?rpuNWl/uJyB/3s3qbVx+QBM1MjJTjZKmUpkZ5pugQPB6S2Uw4T+JPTndDc+m?=
 =?us-ascii?Q?imWjMXN+Hul3ENwYt42pzoQPnDoeus5S/d6pVGsU5DCzU7xcDG2B+ONyxv3e?=
 =?us-ascii?Q?80+trG6kSp209GDncVPZRbl0hbXUyeb18ZbZ3KBhDs5XOhyumRJQim0IUAg2?=
 =?us-ascii?Q?CCprfvWKygwgxZwl+CsRhNOR/sY9e7XI7vMxe2T7TUoUOl5PTaqzJTYCKR8f?=
 =?us-ascii?Q?ifD1Fbl6GKwxXz7EpIRhlRaVihW9nKkYJT4b0zYkh0HqixrLWLM9W6LZ7b5D?=
 =?us-ascii?Q?3bqCGDbJuJ9RVblurgLkV0BO2gmIDrkll3NZGz1fmbJzI/kblS1ZmWdxVJnI?=
 =?us-ascii?Q?zz2VPJJdRQ+xjIgYk9YdZRhv8uXK5CQhSomdI0MBvq5FaqotDtREIi5VzGvl?=
 =?us-ascii?Q?qftV/eiuN5haOxQ+I3+OLiQZx9H9TdlgrSHiMWzqwu+Oe7dv1dEs/Pcmdvlu?=
 =?us-ascii?Q?DejpWJaWAWzbP5bALdO06unPUmQmsNCejrCK0WfobnPjyNHJ4xIJ2PWSrk6P?=
 =?us-ascii?Q?grDqQQR75wGqsD+gcQoe4zybOMGEKspD/Wbxh9935Gm89Og6EOue5i5REDVj?=
 =?us-ascii?Q?ud/TUlQmkuoieOSPHVnkSim8CrBulEi5vL4wO3IjkB5+BYoJL/N2bW6F+GtX?=
 =?us-ascii?Q?xprCoWtPu4ww1GhDP8zP4uS0roo2tLCg/5hHjfV3gjWQ9oUV+G8AdkH9LEZo?=
 =?us-ascii?Q?zC1Ze4YPRM4KtQKWNlmqIXG0BS6NsDduFGGuRPKKM8NP6slPnHGr+oLrCgp/?=
 =?us-ascii?Q?GECol9npPhKw3Dyi2wsklZ0jXqkyAtC8Q7HGjy/G4TZZpfEuta45zkII2kui?=
 =?us-ascii?Q?q+Qtq/cPhmW7escwhK0grhj3/G6D0yI02DzO0Pj51ltrSK6Hcz/FwAAPmieH?=
 =?us-ascii?Q?XNnH0twkXCwr7/kovMymWRetkpRo84EnvK3BEXeoo5mW8dJXRGqnKwgfbnyA?=
 =?us-ascii?Q?CYqf+ueWW6tyutzvqFEFknyAAD1nIxo2GHK//UD/ZCSirIlR5eI5S4Aw2gJu?=
 =?us-ascii?Q?KqZQmNkSZno99ZgGBaoU9Zq2GEoUctpKQ+qp?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 15:08:39.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6876a271-1d93-4db5-450e-08dde644c53c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_080857_622781_DFD159B5 
X-CRM114-Status: GOOD (  14.46  )
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

On Thu, Aug 28, 2025 at 09:51:49AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 22, 2025 at 11:50:58AM -0700, Nicolin Chen wrote:
> 
> > It feels like we need a no-fail re-attach operation, or at least an
> > unlikely-to-fail one. I recall years ago we tried a can_attach op
> > to test the compatibility but it didn't get merged. Maybe we'd need
> > it so that a concurrent attach can test compatibility, allowing the
> > re-attach in iommu_dev_reset_done() to more likely succeed.
> 
> This is probably the cleanest option to split these things

Yea, that could avoid failing a concurrent attach_dev during FLR
unless the dryrun fails, helping non-SRIOV cases too.

So, next version could have some new preparatory patches:
 - Pass in old domain to attach_dev
 - Add a can_attach_dev op

Thanks
Nicolin

