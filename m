Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9DDD3B7DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 19:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRVu6rdnLR/FhdIgQYfkAfDV/AZzycmE1dZDB/8bjEE=; b=zERHjsxcGdp7e9Py1Owkim+NQ7
	a3QP82DfhnK11hT/hHFZLwbJ8016a1sZ+5SgbbFNjGnXwbt8mEivHyhcVWA5jg1OsXbuwpHpw/1Cr
	UAR+NlCY6+Pd6T55QNUrAtXDlcT7qL14m3rWsQpHeN7uM/Q4/l35+5tQhewy5d+SKGvRA2vUOWr22
	GsLYn8B7R1FBsM1xVGUKvrDWNl2AJTFLBNklcA91K/JuxMEkOSr/Nxic+Xx8km+cgYmZWwxrnwOBh
	GackSPBPa8hiQn9H//VHyCEE1o+QKOACMvLdoL3oEPs91HoqbVEmK3EVI5K5cCBkiZXm3Vi6QEKu/
	RbRIEHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRyE8-0000000BB0c-3D7q;
	Sat, 06 Dec 2025 19:45:56 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRyE5-0000000BB0B-2trY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 19:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkAZvLVo7OU+3wbBbetF7WvLMDyHVqP28MlpA7WdRBNIoskgoqGlQvohsSq0MThYooXgJDDxH1YrAPbRGfPN5ovGWK6c/2WeoXgcttGYLY6VSn84yWIzS0yCnxFWMofOW+z2y+0hMoO80VQqe7NsTs4Ua0sT02n1FZXrLddAYnHw3CCZEhjyKcZrxVH1PaE9W4o+U8K4XrtZ9XU0kb9D0u+HxL0GLshzfJvmI+5ujvGa7SkxlftVGketyhF5+9p/JK3QpnLKg8X2Ffcg1/jbTQF5stdjJ08nUQku8IpDpdNvjrg/nC6P+Gt4tyVYcruH1ymvdKDmIz9zqjt8DQwVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRVu6rdnLR/FhdIgQYfkAfDV/AZzycmE1dZDB/8bjEE=;
 b=Uz5S0z0MlRYITi/+fBgYkSYsnGSGb0kP0HLcI0ZsGjCbY/82RuxQThvuwDEgM5VA3oPXpi9n8KclyFEiQJUKe++3kcrYVWeXoiRgEetFREkDAK7ghJN7kTVQ0MlPmZuJypMbNa4l0aY+6WFMZT4JD3ShDkokv7PCEWz3x1bh+twv6AUJV8GfCO5dNZfjc6t5V5xC34j/PQaP3nZJLmnZXZCDN0a17OnqIZ6lnKVPYCAhuDDZ1M7hHIcLEVzQKf3f+YbZiFMIt8kENBq0lwFzU28P7P51KgB8GWoFbsubqHkuNwAJ6S4eSoHwpzGxswuBXKjX8rIuBs/6uh+XHWsCjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRVu6rdnLR/FhdIgQYfkAfDV/AZzycmE1dZDB/8bjEE=;
 b=pSOLtDTbJIO2NwByxKSpkz8OrTJo7y1InrrLVFRQ4FqMGA/6WOX8S4cjQ2E581XeXTOB2tCyO4aNLsoUt0G7jg3zQqBTFIhNarKwbXFtEds3LhdnsLlypU8vv7OGOoAt79nJOWoa+nFmyYxEpz45ttzx1ltMoPD/zwGC1Xk/XfFUiKbgrLdQIsP5a+i+36AKV9Eipe/CDk96SzQsA9fei6RcAHaqrUiIqrv6Yi89kc5LzH80ItzA9Hocb/CHda6dUWPU2DTsnOVSV7WlDx5v9OkqLbT4xWfQ/sdNiJJpMn8NXccWaCnj0cKin8jeZEorYAe15hV3BJZpnX20Ig91MQ==
Received: from BLAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:36e::11)
 by LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Sat, 6 Dec
 2025 19:45:45 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::5e) by BLAPR05CA0008.outlook.office365.com
 (2603:10b6:208:36e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.5 via Frontend Transport; Sat, 6
 Dec 2025 19:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Sat, 6 Dec 2025 19:45:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 6 Dec
 2025 11:45:44 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sat, 6 Dec 2025 11:45:43 -0800
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 6 Dec 2025 11:45:41 -0800
Date: Sat, 6 Dec 2025 11:45:40 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>, <praan@google.com>
Subject: Re: [PATCH rc v1 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
Message-ID: <aTSH5Eap7leYQtPl@nvidia.com>
References: <cover.1764982046.git.nicolinc@nvidia.com>
 <6ec73bb7cd03d90a0764f12c4b14071158163818.1764982046.git.nicolinc@nvidia.com>
 <20251206193408.GD1219718@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251206193408.GD1219718@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bd2628-0a92-4c9c-4e96-08de35000c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qCGAB40/TQKyAUhPGIdsXreWZrVYRZCnlVSneYtoqCUD4leoSmZrC5nrEDDu?=
 =?us-ascii?Q?qCri9e2V7yOdR2PzEXqvCqYAqVTq2VhyT+wzTqJ6ccmW2VrQkwblfFOOMda8?=
 =?us-ascii?Q?iETkw5IK7Y27Dc3OFPP+2GbP3u47NOOlWYznOfD5/0uE87Pm2wgPpOTwyG7Y?=
 =?us-ascii?Q?G6w8KxIUYKoaJ9YpOsq91w+aG37c4T/bk9aHYgOy87JrCYj+4E2Bpg9wzRdZ?=
 =?us-ascii?Q?Ffil2UNwcEkpDLIxzFEG84dZQPrg2oW18hBVc/M97M6giQdxDlqSw4au4atk?=
 =?us-ascii?Q?Ug5Ka/ZF5muNL11XnSCRfMedY/gqSCEWcyS1yZXc8G7P1OGZXkN7i4u0z/vj?=
 =?us-ascii?Q?dvcG+N1YnqYrChAoigKy/Li1yyaZgof+iuO43utIfv0IJn0NQXCM5N++OO+q?=
 =?us-ascii?Q?D46PixihPAZm5cqdLPxxrqhzzO8uHFKDhUmCH0F2Mh4gkT6A2aWouN6uPwQF?=
 =?us-ascii?Q?r8yPsStmY0Xbe/Q7qR2zMLTcknot+X3+dPX78RW0G8FP7O7g2KzzrMwpg7VH?=
 =?us-ascii?Q?+DiksjdxGv+Ldag0ejmwRHtLTFsYUelEoYSbLVvS/nG8xgck2encHEFkt6l+?=
 =?us-ascii?Q?i2ZgdsRv8XlnpM0BN8IiXYcB/oKihVQpUNG7tLtQP8V2WWMJCeQv2QGXDBoc?=
 =?us-ascii?Q?P6+MiRR+Zp+F8YbyIjT3ZuSko18oDt7N8ipCdWxdrmmOmv9JbevoBj2IO5nx?=
 =?us-ascii?Q?JNm/J7OVGyTD8UHAh6tWDM7qcFPrMBSwQLgZ0BwBXf48c+2eLKNz7cqzcxDK?=
 =?us-ascii?Q?PZNOiVioaUokpgQf7/O2a1xSyi1U8Hl56nUeX0sgmDjOjGljG4iH9OAuQIbI?=
 =?us-ascii?Q?RmZoKGTkAesWNVOF9SDPWOu44ALdt8enGHvgnSPfECxGeaRJO0DXDrFSSI4W?=
 =?us-ascii?Q?lPOFS/ebwsC4KdUVPedgh+4o95IvCMMG1Vm2LUp+VbZKlbTWJkCrtSEq9z4G?=
 =?us-ascii?Q?k6pzsCXcf2o8nQUlpGPDSwvhnYqk20hrON3nCjgliuvHh0KPtfGaeU6o3PB/?=
 =?us-ascii?Q?fG0bDAjNZigu0MUwJ1dxH4njz+Ac0ZD3mpzU2RSvuWhNEciPzsa4ROscEUIL?=
 =?us-ascii?Q?xcq/XrJ9gU31QdScbWubR6WmcM10fkIRbwU35m8YA1wxhHbeVpe4OXosgiY2?=
 =?us-ascii?Q?SRkY522DrtGw3fwBC10le6yDvDfdAD2mgl9iEM1Qmz2ViYgvoynsY/JYJW7t?=
 =?us-ascii?Q?h37rujZsSE8WFT9If72fVEYs8+Tcqis+GDViUPod8JlH8D56rI5amFU00N4+?=
 =?us-ascii?Q?BfAdh5zx09phS8MgdRgxHR58TdQE4CuO0PlbfZbc0wyapCNrmV7ZLn/Ng6m/?=
 =?us-ascii?Q?by+2zlJr287QmhGz2ofQDwk3oKTiUQJVec+UtkzObdA8sZ04U+HooKEYrjGk?=
 =?us-ascii?Q?oR1AwVPJqbJ5sXSYqZZjpi90BX33X5X2xQudWZcoJGEZhGu7mhaxPtcBTVHi?=
 =?us-ascii?Q?PkzKHOrp45PaHQZqzHJsBfPmO42/xM2d0Cx4LWy/LCVuEy3c2OUfYcenZ7gw?=
 =?us-ascii?Q?rn91PizTXqalsxa2A/dZYYQNppK6kL9rNgLiqoigtOI0rzTjY4C45wgw8w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 19:45:44.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bd2628-0a92-4c9c-4e96-08de35000c0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_114553_754281_409194DA 
X-CRM114-Status: GOOD (  13.95  )
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

On Sat, Dec 06, 2025 at 03:34:08PM -0400, Jason Gunthorpe wrote:
> On Fri, Dec 05, 2025 at 04:52:00PM -0800, Nicolin Chen wrote:
> > @@ -1106,16 +1115,17 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
> >  		 * allowed to set a bit to 1 if the used function doesn't say it
> >  		 * is used.
> >  		 */
> > -		WARN_ON_ONCE(target[i] & ~target_used[i]);
> > +		WARN_ON_ONCE(target[i] & ~target_used[i] & ~ignored[i]);
> >  
> >  		/* Bits can change because they are not currently being used */
> > -		unused_update[i] = (entry[i] & cur_used[i]) |
> > +		unused_update[i] = (entry[i] & (cur_used[i] | ignored[i])) |
> >  				   (target[i] & ~cur_used[i]);
> 
> This can't be right? We don't want to ever copy an ignored bit from
> entry, the ignored bits should always come from target. The line
> should be left alone.

Hmm, without this change, the following coverages will be broken:
  arm_smmu_v3_write_ste_test_s1dssbypass_to_stebypass
  arm_smmu_v3_write_ste_test_stebypass_to_s1dssbypass

Both were expect num_syncs=2, but it would be 3 if we don't include
the ignored bits to unused_update. Or should we update the num_syncs
instead?

Nicolin

