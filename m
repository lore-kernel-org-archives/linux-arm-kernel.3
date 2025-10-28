Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EEBCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eR4popbPYKTm4IdURWFMHNCaQFM1QK1+9AKs1QYAp9U=; b=FkNfCau5w0XpNX37oDXrL8NZmp
	IyXYacjacTxwv1qnGdNP9M0oO4nFSk6O7EMPwZQ5MDSVMoRtu5c4aw4IFJMUQOn9twfb9XPQGFqB0
	owdRaMhb3jDQ6HPFk0gvqtdp0M1CpQxfHMljlwm0Eaflez8WR7pSDRb3dauHtwuV5pfXYh3b3hUe+
	s/8DMEqc7SYE1mS6pe4KAEQzVjKnUFXp5SOaNA4OoMGRXFML6jJheSvx0uIhgZNVB1sjaSSVFzYGm
	XE70+V7buSGseJVYFftnvtplM8SQtmm4t54Bo9Z6u6TPFPhG9dcSnl/uS4kml5NW8FtI8cosgXMoL
	cYYD3tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdbc-0000000FN3r-0CGR;
	Tue, 28 Oct 2025 06:54:56 +0000
Received: from mail-eastus2azon11010032.outbound.protection.outlook.com ([52.101.56.32] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdbY-0000000FN3A-23gY;
	Tue, 28 Oct 2025 06:54:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDwGpY+2GG8kNMqgzBnhwH5CLggZvsTBLIr3mQza/WoZ3woQpyItQ58GpNa7u+vaxth487zqE3A1IhIQuQlrzRD9JoWUHNlVfCX9YhIzixT2TYUyxMImOvFBbUEPmfR2mLCiOo2M0VDzgoeHx4oYiGzC0rYpErjdHLwX3rDnh7q4XqlLVQdhlV0mmEI5Sqf2fNgf4iNZAw8XF7a3Z6fhfwK/wN4I03MfmC/sUJ5xWTvAIvGPpA5lMaQKYgJzyBVYqTym7Mi89jjN6j5lN32a/NCPkdGG1BOEOSF6tvzWDiEiPQ+9DTMIZvXPjgoS0M+3uArYtpl1j5M3Y1VlEhmtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR4popbPYKTm4IdURWFMHNCaQFM1QK1+9AKs1QYAp9U=;
 b=P/HuKTiAIJ/DvIyozvoCFtK9d+TcrRJxsQ2A1C+6PHo3JuEMTo5fiUWDV6e6uoQxpuzny+UlwY6d+/0wjELh0Pi4s2jv3zJ+DWQC7w2QcQAnqJU6OPEqIvRNeZgzTHX/o35/jdgU2EQXv+4N18xTkg51SrywRIXJFOLOVXJTYeSlB5hcDOEDdr7lR6C/C0rrdV13HCi7wPSWsqcTamNGkBpeJ9GyL7kZtQe0UK5t9FvAgNFnZ8DCwatXCsL9Hk8BHEps4UHZzCQcs9OXh/XJClPASmgFNEJOV12U0PFbf+4S2boDjm/AvYiMwu1y6bYaXcwvyRUwjjIcPT+4ARWGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=csie.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR4popbPYKTm4IdURWFMHNCaQFM1QK1+9AKs1QYAp9U=;
 b=TxIbLLJ1ZbEblp1VoOQ60IDHzlN4QXA/g96jscBJKSMAIJ/MFHDFdSg9bkPkBpoQCmoofjSsGQLF+Ysd2qO1B1bZJXlloN4CU1kmGmR6K0ye/R85cX/lcwsCuOc6QULA3CekBjTUZz6fXcNx8oep/xKpL4oNHCPtERuq8Vbx73wYUX/aJ/yKEYe9O3/q334SVFkxJNpXTQHFGBahVrVwP14Gvyy3mK9rrd4Zy6ALXie+bc0vgVY8UCT1SABR10+hiJ+hjwaiBAJ5ipKg/80pZX0JWxrmr34g+CjdNTx+2kLf9Au4cjpffnVzHS4p7UwdKTu8kjitSWmUgIKRS6N0LA==
Received: from BN9PR03CA0778.namprd03.prod.outlook.com (2603:10b6:408:13a::33)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 06:54:45 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:13a:cafe::88) by BN9PR03CA0778.outlook.office365.com
 (2603:10b6:408:13a::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Tue,
 28 Oct 2025 06:54:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 06:54:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 27 Oct
 2025 23:54:32 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Oct
 2025 23:54:32 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Oct 2025 23:54:29 -0700
Date: Mon, 27 Oct 2025 23:54:28 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <joro@8bytes.org>, <kevin.tian@intel.com>,
	<suravee.suthikulpanit@amd.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<sven@kernel.org>, <j@jannau.net>, <jean-philippe@linaro.org>,
	<robin.clark@oss.qualcomm.com>, <dwmw2@infradead.org>,
	<baolu.lu@linux.intel.com>, <yong.wu@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <tjeznach@rivosinc.com>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <schnelle@linux.ibm.com>, <mjrosato@linux.ibm.com>,
	<wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <patches@lists.linux.dev>
Subject: Re: [PATCH v1 03/20] iommu/arm-smmu-v3: Implement
 arm_smmu_domain_test_dev
Message-ID: <aQBopHFub8wyQh5C@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
 <f52e8079148a673641d2858700c49fa0c81022aa.1760312725.git.nicolinc@nvidia.com>
 <20251020163231.GX316284@nvidia.com>
 <aPaWsEg1Y3XqsA3E@Asurada-Nvidia>
 <20251027232640.GE1018328@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027232640.GE1018328@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: d842b719-4def-4257-6660-08de15eee099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fGUmcarunF6mbX+AippTaiEUY2peatoTMyHGt/KfKy82iBEYmMgWDqCJLU/h?=
 =?us-ascii?Q?Aft3E9MtBgUdOMN6R24elRge5gJpCjyvq9E6iOTo8noba4j5ciQB8mnl9vs6?=
 =?us-ascii?Q?Ao909usDPbZo9CPI4pE/nfstI6KvV49m+L1exjNHcXFja+5o9VgjOxCptyCo?=
 =?us-ascii?Q?hv/zbnbtbNop/T8PoB/m1sYKTB57zhBq32HFTP5Run2bpy2grlNVA6XeDItc?=
 =?us-ascii?Q?BtV+th7UuaYSlmNgGr2HdH3c25h2zLOId3UOpPpAXr0YKrXUi9eiv3D9Oi3U?=
 =?us-ascii?Q?80QwygkLP5U5KEgPytBCtvF3cXZUOaLFfb2HfmTRxIOzassw4A6FyNW06Qwy?=
 =?us-ascii?Q?nnvfmhXf9VF5y4sXbAzdvqyJERaO+cetn/rhrskWyl7wzvcUKloGDW4HbuE1?=
 =?us-ascii?Q?nyf9htzTeYsiJXrrANlb+NtzHI2YnXPmJ3fWB3aOSAwSQK1G18N9XmIW7JZj?=
 =?us-ascii?Q?lQSpI/NxnSlfOGVjfJ2lxgyrxNYK3fhm8hptPbf2du/skdlq+XpaLuqGdv3h?=
 =?us-ascii?Q?nhcrMPd3sRS4vOwvADAMXO1x2HKn4DDwRi6B5xPIHXc23mGEvRokDbvshJ75?=
 =?us-ascii?Q?yuqquIQJLgzy9xtMUtNEI/gKesh6F8HFZ7MmxHeEBLExYAg3xX7n2iITrLVO?=
 =?us-ascii?Q?xD3QhMmO1rQWG58NiRr9zkZ3ryQ38lFzOkZW+cICRy6X5nUBeoiD1+2Ec34i?=
 =?us-ascii?Q?Io6f9XfPpGXuQSyay+198NTqurSjqbhSb3c9NxxQTtvKYMqoi0+twtZAWnMo?=
 =?us-ascii?Q?rZVIeMHLtM/FBhk63WbKj6FidkePaa6jdX30UtvLbidnk4XrLZIDOmfE78aY?=
 =?us-ascii?Q?yWSrvDme5KB6UtPHPwQv4NJ520oR9l8RQ6d3w/HiUMSeCe9J4yIEnjBVdA23?=
 =?us-ascii?Q?iPZ0kTX6QWtRR2g94o7CXdjOTKh1U0d3sOcPIGtnQyapbYUypByRPxjfAvQa?=
 =?us-ascii?Q?ygyMMEm7WFbkAlRvC/rKgkkya5EG1ZtLUfDX4VmHa+0t0ry1Qyv/J1ukBq4F?=
 =?us-ascii?Q?R/BoLph5OFN8esguQ5X3SdDKXsZJNKGqZyg2LwgajfOpkG7IsmcbaaN+R4zx?=
 =?us-ascii?Q?QGAMkFtxNli3zX1RJdGhSHfZuTiMKWJcce5aji5JYK0tfInHZo6mZFBAkfKY?=
 =?us-ascii?Q?o+C6HMB6/YiVosEyUEOCOQvD6D07LjC+RmsuiM3HI3SRM69Sy/jMYIJp2Bmc?=
 =?us-ascii?Q?JM8oyBU5HkP5OpWMgJDydBr0WZ4GhsQRaAsJXqXG3+G3OQd7QXgi04BRhTVI?=
 =?us-ascii?Q?4jEfql+tCHJiwWpCPX7Ej1MQZKJiMlYGVg51co74xVHHkyB6/VXb+EUCjvhk?=
 =?us-ascii?Q?d7zs0ojjatsiXxhN1kMWhXPGkNgLcpjHQATj6RWl1Dm0MvFG4gMVusc4xCjz?=
 =?us-ascii?Q?jp0X7BujtfEtj8FEUVS3le89JnTBj3GmWNiWCBF/AVBwyUvA7arQyCpZNSjg?=
 =?us-ascii?Q?ppki4VjznSsWJmOLGT1wgXxoNj8cE3wKbJ9AORGcG4k1dGimclIPTO7x7mTt?=
 =?us-ascii?Q?hflYUIgm3p/pD4x3l75jcVRr6AuJH0dYA2gqKqkqqtQlPdWFZqrPK1tbi2hR?=
 =?us-ascii?Q?yzgOBayjqOPa+OsVpBw=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:54:44.6252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d842b719-4def-4257-6660-08de15eee099
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_235452_537606_3814AE66 
X-CRM114-Status: GOOD (  24.01  )
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

On Mon, Oct 27, 2025 at 08:26:40PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 20, 2025 at 01:08:16PM -0700, Nicolin Chen wrote:
> 
> > > I don't see any reasonable way to mitigate this??
> > 
> > Right. It can't simply go through a regular attach_dev call since
> > driver wouldn't expect any inconsistency in the core.
> > 
> > Driver would have to be aware of the reset state, and make a copy
> > of the old domain's CD/STE to use for a test_dev() during a reset.
> 
> It seems convoluted :\

Yea. Both core and driver would end up with complexities Orz.

> IDK if you want to do that some kind of "attach but really don't" flag
> so all the tracking was kept, just the STE was forced to blocking.
> 
> Then since all the fake attaches are tracked and validated switching
> to a real ste shouldn't fail.
> 
> For instance SMMU could continue to build the CD table and act like
> the CD is active, but the STE wouldn't point to it.
> 
> Basically, this approach doesn't seem to solve all the problems, it
> reduces them sure, but there are still enough gaps.

Yea, this works for reset because the physical STE is on an ABORT
state, so SW can concurrently mutate the CD as much as it wants.
Yet, with a translating STE, CD table can't be mutated I suppose?

So this "attach but really don't" flag would be used by the reset
case exclusively. It feels like the surgical in-driver approach
that we thought about in the beginning v.s. the core-managed one
that we wished for to fix all drivers.

By doing so, I think the core could simply forward the two reset
callbacks to the driver where it does an STE-level suspend/resume
and raises a reset flag so that any concurrent attach_dev would
bypass the last STE updates until the reset_done is finished.

This, however, will require driver to implement those callbacks
individually, if it cares to fix the vulnerability..

> So I think we either have to live with them and call it a user bug to
> change the domain improperly during FLR.. If it happens dump the
> translation into blocking and move on..

But, we previously discussed that it'd not be a user bug for VFs,
unless they are all getting reset by the PCI core?

Otherwise, returning -EBUSY rejecting concurrent attach would be
the easiest way.

Thanks
Nicolin

