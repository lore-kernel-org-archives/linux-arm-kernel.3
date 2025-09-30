Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5A5CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qm85m20QEh2L7COLxiYAs3enh0N/WnT++fwn0WIfer8=; b=uv54K7j1OyVkwswwFL+xJv8A53
	eXMpF5KrLUvvjB+NNoCQp90t194/Uy1Se6AuQWX/acboFhHRRVgtLd3/wogQGgDMs5ZuCRD8guxu2
	os2svwctIhaYumCSIJUpMOCb031QgSw7TGE6mm5REgY+q5Ch1YNfxLTyGdHDEcpi0lQf3sVlp8mrW
	g4GIYkCC2SbYFNGKrY3pOxm2vtCUbrKWCfCCEJ6vpi9GvlRf/M1+oj0G8/A2qlNQeKEYdj0lcRAWZ
	3LaXm4Rj7Gv4GVs8SZxbbQ7OSQSVhDHmMOaf/1IAGmb3oUft/FIAtJqFN6poLIu3lXBaMktPi2qsY
	tWeUZKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gpO-00000006ASg-2nh1;
	Tue, 30 Sep 2025 20:20:02 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3gpL-00000006ARp-3rCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 20:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IC1UhLrYkh/gwenr8fCRaYpS9CwHwbVhXUfNDcRuDP9YHqTNF/hzTPZ33eRA7q/qoOVrlLxvXBqSWFcUc14ZcpcafDwilsGnLESmofaitdaPDrZoZ9gxTldcndtNSNcosRNzcry4f7Q2U/4XkgemmYLzjiPNfYJ6kWo8anm5URHhYBKcXBw7ZVvz1wQkQfekLWdN4iEA4WOgFuwQxIn8o2ZtY8wHpQIrYHUZuvrGlTetq0CYCcoZgy7aP9lyI2G4R48Oucb8d2BFiuO8U1A/cGtvoEJfetJQtMQzPL4qV5YKRZdqJWf/hNaNaEwSUPX9x1UWMPP77jVv1FCQi+uaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qm85m20QEh2L7COLxiYAs3enh0N/WnT++fwn0WIfer8=;
 b=FTAKZ8j1RYmgLG9QeqSPSKM4+l5L2LPVJcCaENGV6sL1wy7cKQJY5LydN+d6WnYockFTbFjKR+ejbC10xNxC3rUBrDaDS27C5tfn3IFslOyFJHr0m9O13SaNstnfZQ7A2LeeGVwqEy5s5ZKVcz7rXfx64/PVSZxYg134pdxLOqbFfYC1bZOIVrGgMz1kX4zZczo9rzypvMUVXsjGl7bzwRhB3Of7h6Ly8oQsTPScl/dhKCjFvMzpAG/sHvNPWdeXl7X6JIHvJoAo2WkYXjAKqTssYnip0D7SIfOBCjsbkII4lzDwDSgGqXAXjT9PTeYgAyqT08cffqgywKxDsB1LrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qm85m20QEh2L7COLxiYAs3enh0N/WnT++fwn0WIfer8=;
 b=NJ5EVz3N7WHUxEfuUk5V8Pmi2usEqcyhKg7y2azOI0F46gGL6C8n3wJnLwQI1akfOWDKlLe1zoaoUxoi+mVM1lGs5D9wI9EuU42x5zOXnGvavRqM8kNYZzIJmYqTfh9OJ6nqiGFNQsPH1wFkv4ODmg5EJ9Rabs4TZZgSqjJLnI/vaF/njGCqWWju0G3vhsJ0dvYSTLFWnDf7NQZfZ41rLT0oMtpffFd01yvSH09wruUpaLiKqufYwIKEEMLiCLVXuU+86Mlm8uXDbd+CK97mgCfFHCLIfbhcZ6d58dNS9wKJSbbejPTWs5zpzB+XBW184RN1l+cq0XO7z1qWVoPt4w==
Received: from BY5PR16CA0010.namprd16.prod.outlook.com (2603:10b6:a03:1a0::23)
 by BL4PR12MB9724.namprd12.prod.outlook.com (2603:10b6:208:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Tue, 30 Sep
 2025 20:19:53 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::fd) by BY5PR16CA0010.outlook.office365.com
 (2603:10b6:a03:1a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Tue,
 30 Sep 2025 20:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 20:19:52 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 30 Sep
 2025 13:19:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Sep
 2025 13:19:32 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Sep 2025 13:19:31 -0700
Date: Tue, 30 Sep 2025 13:19:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jean-philippe@linaro.org>, <miko.lenczewski@arm.com>, <balbirs@nvidia.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH rfcv2 6/8] iommu/arm-smmu-v3: Populate smmu_domain->invs
 when attaching masters
Message-ID: <aNw7UVaktL6/05b8@Asurada-Nvidia>
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <d3f9777e46d531273dfecb54d69725428cdef308.1757373449.git.nicolinc@nvidia.com>
 <20250924214215.GR2617119@nvidia.com>
 <aNrxjkUEEUzKU+za@Asurada-Nvidia>
 <20250930121200.GG2942991@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250930121200.GG2942991@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|BL4PR12MB9724:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6a4521-b918-4be7-24df-08de005eb68b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ci0GPifVwGrf1ZZSLZErqSrb6f7Bcd5UuKNGbca4VzLvbAy3rX6Li0ZEOWRj?=
 =?us-ascii?Q?A0bmpqmuq4x7SXJ99+CvkeKuwWw4o9EX6ALCzvwA+OvTFWoMkT0j6gkyOgKQ?=
 =?us-ascii?Q?aaEL6UO+944bh+bfJggEUHKuPhRasZJ1u7mDGa8UknHK+223Rl4//1fF6Mlo?=
 =?us-ascii?Q?9MGVJCr7GzSEJaavk/miNIK7WHU9UqxpP3auDx5M1Y97vwY8foUCmRUHVcQo?=
 =?us-ascii?Q?KiDK7eMO+unWv4TztQtUT9STUce6jIB3k/iYe8EDFGG4w0yBUY3aQ1YYszf4?=
 =?us-ascii?Q?PZw80DH9PVch+1Z0Yjt6/z/TR0twmsDQ6+n6/V/MPblZc7M6q6DxLTO4mX96?=
 =?us-ascii?Q?MxIKoJy/xJ/fVgldnNgvwLb4zxzVjbxpIcjSPsvbIremAMYlKmUaArXl/e4Z?=
 =?us-ascii?Q?jymcLUvtzm6+zikxros6I3ypEbtydkJziGr5LUJGA+Zl+RIPaPjeMTKPr2sM?=
 =?us-ascii?Q?5jH/EOM4eypYGI21j2KTvJAlqNK3vpWBP85Jz43HkVp/QhlfbTvvYQReg5jT?=
 =?us-ascii?Q?h5eQ5Oe/lR+wj37CS0W79APfDLqqj0l46KyHyLXMG65GoeZmomKP4CYJ5lLh?=
 =?us-ascii?Q?LvFwE0igCyB5N1ikzXhObGyI068CWouc1arYCRKhSnLxeBv/eEpGQkuxwsMN?=
 =?us-ascii?Q?0ZrPxHpuTeJHCLDXZG/9v7vR7qO87pHj0AwpTRKmEnAdjoDwI9pksE0MWd+H?=
 =?us-ascii?Q?Eew+8l4TJoHR6lFJw2fbmMfUWX3h7I0tNtXfKAT4GWsWeI3yLlX6/rRXXqq6?=
 =?us-ascii?Q?LJE2wQXLO2kmfsp4AmWG6D3KUrb8Rh0aibRUjFaLmLZ4/FOAugC9X9tg/zaC?=
 =?us-ascii?Q?pPT7w2+D6/UMBAG16OlQ3+FuBDbmk/3lUXHzE22UnTGFrklPIo8YBOna26im?=
 =?us-ascii?Q?L7rT+zEZUSLM+BpsJE1aidk7ycyWxWTGja/WJeAUL1fQ5m8bEOlQWzGDPfu+?=
 =?us-ascii?Q?Q9DWJLGWGC7dZX/akcZxvivV0+oK2nQSb0IS7QQ56qoAYg3rtrzbBFIQSswY?=
 =?us-ascii?Q?6gE+LP4shuSjSsstd/VuIN9yRfYfityVCMhyR5oVguo/yWUJLwYKz6XhvLdc?=
 =?us-ascii?Q?u2Jmp9unkBwMqCl19Yj8Z8zsdXlN3MM5a3xWHOKMF61+65HhEBPdnMAPhs6P?=
 =?us-ascii?Q?1TP/JoMtnOA81inpQD90cpcgzfnQb+i3ttYJJl7fn/TwJi7U65WUNSroeSFS?=
 =?us-ascii?Q?kIPCL38sRZ6f9w1IGqMQOOV1i8rwAzZUhwBUg16QBoMOKVfB43JTCn2g4pm9?=
 =?us-ascii?Q?yFwiKfjjMkxUNXHHklwtG9oexKH58Q19hbnejZSPEdPRia8zqUgSN7CyQoJ1?=
 =?us-ascii?Q?9BtApfcel37Vcl36j4R7HlRF4W0oYrQz6rGMtFiOs0egdw+4uj96AAiV3F53?=
 =?us-ascii?Q?DJt8I+eYv9dwHa94moOeWEwvuE1YSbq1ggzHuLXcyx7hqRjRGl5oRxj5Lk2r?=
 =?us-ascii?Q?OMt2vPzXs8Xp56VK9EJfCTadPi9e8IZcrurW/kH+NYKWPGihaEUNe+fefFbT?=
 =?us-ascii?Q?kzSwydjPBbP5YaKjLQmwG3EkLpS2pFY79nJKz36N+To6nfaCtq4gutVPYhl+?=
 =?us-ascii?Q?N1Yt9Fk1WciYhBMkd14=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 20:19:52.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6a4521-b918-4be7-24df-08de005eb68b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_131959_962249_C2C68411 
X-CRM114-Status: GOOD (  21.47  )
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

On Tue, Sep 30, 2025 at 09:12:00AM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 29, 2025 at 01:52:30PM -0700, Nicolin Chen wrote:
> 
> > > > +	if (!new_invs) {
> > > > +		size_t new_num = old_invs->num_invs;
> > > > +
> > > > +		/*
> > > > +		 * OOM. Couldn't make a copy. Leave the array unoptimized. But
> > > > +		 * trim its size if some tailing entries are marked as trash.
> > > > +		 */
> > > > +		while (new_num != 0) {
> > > > +			if (refcount_read(&old_invs->inv[new_num - 1].users))
> > > > +				break;
> > > > +			new_num--;
> > > > +		}
> > > 
> > > Would be nicer to have arm_smmu_invs_unref return the new size so we
> > > don't need this loop
> > 
> > The "new size" must be invs->num_invs subtracting the number of
> > the tailing trash entries. So, arm_smmu_invs_unref() would have
> > to have the same loop validating the tailing entries, right?
> 
> It doesn't need another loop, it just need to record the index of the
> last valid entry while it is doing its own loop. If it reaches
> invs->num_invs then that will be the new length.

arm_smmu_invs_purge() needs num_dels, while its fallback routine
needs num_invs (new size). This forces arm_smmu_invs_unref() to
return two numbers.

I see a cleaner way of handling this is to update invs->num_invs
inside arm_smmu_invs_unref():
----------------------------------------------------------------
@@ -1209,6 +1216,13 @@ size_t arm_smmu_invs_unref(struct arm_smmu_invs *invs,
                        j++;
                }
        }
+
+       /* The lock is required to fence concurrent ATS operations. */
+       write_lock_irqsave(&invs->rwlock, flags);
+       /* Trim the size by removing tailing trash entries */
+       WRITE_ONCE(invs->num_invs, num_invs);
+       write_unlock_irqrestore(&invs->rwlock, flags);
+
        return num_dels;
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_invs_unref);
----------------------------------------------------------------

So the caller would look like:
----------------------------------------------------------------
	num_dels = arm_smmu_invs_unref(old_invs, invst->new_invs);
	if (!num_dels)
		return;
 
	new_invs = arm_smmu_invs_purge(old_invs, num_dels);
	if (!new_invs)
		return;
----------------------------------------------------------------

Thanks
Nicolin

