Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137C3D77899
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjsFn3fQWT5H1e2pYNZINURsE3Kg0k2mwqG4stXoDsw=; b=IschzhmPRC/uDDKEVSh6T295/1
	s77WScPB1EnpZ5Y7hUG0VVbukuUGVKjI9xZ45xkypYrXLOstInIYAMmcOrcxIgx4dlQP6lFROCLj1
	Lko46fx2a1JJmP0YytiSb++MOB5PwOwXylWVIdED46o98zz8SiC91qnrPpAa38G7VZUCKjEllTsnD
	dhHBM2m+uL4wOoeA5HV7r+SyGZ/R0hitD1Yqrup2OKpIuUDNWmHxV+mUWggPGO5mcID7dKmBCXIAN
	iYi2clZNIAf7g5n0QWxc2ArooZPK9qbdlzMhKvsqMg54A+leyRaeZj6cmLW3V4lzHJ0uTI1pvS7CJ
	Jueh8CKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL5R-00000009IJ7-40LW;
	Fri, 23 Jan 2026 17:36:45 +0000
Received: from mail-centralusazon11011046.outbound.protection.outlook.com ([52.101.62.46] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjL5P-00000009IIm-2IZh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 17:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kiyx6AJXm/oW6TFcEA2JrHvaVD0RXeuoCFPGInZhRicWzi7iirepRYGXIfsZViyI+O+xpZfkeZAnCdNkAnbwKQKWiFk2chC7kemQiruP1bOq5CJRdwypLM+i/K4AJVDq4mk1upcanKfzm4Zi565nZqeyM3FY5hLVJBGvs+z4SxufOZivGhJYL1Aia3HmHEUgtesXC2lWJDeqheCUuILvNqiXB8Gboe5iZQmmtmk2KQIsC3wbSceDwAxtxg0RuBZOx+4CJiKQl+ZWLb7lYDFYv5f2IR7bwmabcPK598p3di/1jYOYQTPStPj6oOjnu7kcYEvP8tEmODvXZgvPemfp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjsFn3fQWT5H1e2pYNZINURsE3Kg0k2mwqG4stXoDsw=;
 b=YwFcVw4oSGdm6mdflkVGZUxll4Zm9nc0j1x6fSHsu7YvT9Xgxruz1NvRpO6SZid5YWZCZWmA/M34eAToJW8L6Zyn00qT8s/BJjg8KpLMQHe7MMgqK3Hs1ZiiFgjpPYJqDlRyeFrR1E/lJjszafm1B0WlcqCLdR3Mfk0QLgPixf8S+mMJjKwJXKX+U6ZpdI4+tQe1EBk8BPmwB9dgtg8DJP1Dep42OTFEKgldF8/XFaedl5M9FppusuUOXIvm4iihtWAQz5ZdXa1XY6eiyBs3HEaZBg4AigEhbxsDGT440csLhow9EWGuHsGgObeSQQUCkE8I/1ZGzP3cABjLoCJK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjsFn3fQWT5H1e2pYNZINURsE3Kg0k2mwqG4stXoDsw=;
 b=jnlqSsIplzzDmmaSCOwFAL9rwQa0d8gPIUmrIwEynnFEF33fSQ9RA54BGzlLK8ne6bVIz8JzVv2RW7z7HyYKbDxSzjqfGtzXFC8bHoIOtETOeRzDGmKU65DEwANDCVGfKkf0MRDS1ECOz7GSN/1Tk9QfN4CPeg5ZjkfxPlhteTeRZ+lFu73/vQjt+20HCSXIxlp88Kmv6N5HZdpRT2aTNFmc4dBEoaL86E8hV1OonhP2ZNs08kxVn+Cmpqkq9gFlO0uinTPhpkYKNmx/gmKkohsCBVkaEeS4Wo7ezpOgYFK/gDEwZgWv2VK+M4FV3mP8UhyWGNXOSV9/RRudQ3cjuw==
Received: from BY3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:254::16)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:36:25 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::a0) by BY3PR05CA0011.outlook.office365.com
 (2603:10b6:a03:254::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Fri,
 23 Jan 2026 17:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 17:36:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 09:36:02 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 09:36:01 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 09:36:01 -0800
Date: Fri, 23 Jan 2026 09:35:58 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: <jean-philippe@linaro.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@nvidia.com>, <balbirs@nvidia.com>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <kevin.tian@intel.com>, <praan@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 3/7] iommu/arm-smmu-v3: Introduce a per-domain
 arm_smmu_invs array
Message-ID: <aXOxfi8ZQAkr4zHU@Asurada-Nvidia>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <8c94c5194871ee1a0f3a6b49e18818b88f51226d.1766174731.git.nicolinc@nvidia.com>
 <aXOpzjkAgODnh2HU@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aXOpzjkAgODnh2HU@willie-the-truck>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: e7dc7c19-611c-42b4-e712-08de5aa5ee89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cwmLwiZJFce3uIQ1oUllUl+KHpFEW0a5PHndOV1JvNX3tJ9jcnzZATAXyHEJ?=
 =?us-ascii?Q?KJSVfY6jpkBgyLkBiPC20Ajj9qLz0iY54UbYiHgWp8j0QdoyC2svaH5jKBAx?=
 =?us-ascii?Q?iw8/yK1dq09UCkqC5Fr0eHeiUvrc0yD0bUjfrshzsRA1ZpkACD9mdqarzuOA?=
 =?us-ascii?Q?D46qRvmjttW32g+x75jFFMIqH5Wvj/EmZkp/HtRrxyl4l5bEFumhOlNL7Qa5?=
 =?us-ascii?Q?SwIw2cAami1RgRxXrcmiNfGCbyrfciPuW5iUcwqnrAm3vh6MLHb2fnwWFKFt?=
 =?us-ascii?Q?6VBo0tWGIBdv5eCxQiNppXs+LnPI09iQReyga781xyms7EbO7NnotXobYezc?=
 =?us-ascii?Q?ORwotq1vdROE7iXYK30rA3/RTAY1PPAi8bviCCsQnydzU3Kyb4iEc2Z18heB?=
 =?us-ascii?Q?U7ioobAkZSTA/qFd9WvG1qLcpdheExJX4AGvCINcE8/l+k3mDZs8v8XkJjm8?=
 =?us-ascii?Q?eIL03zu9c/viIEfP7LUcJfpKJ7sG8UMAYymbKTB/ours7ayUekvFDVznR7/p?=
 =?us-ascii?Q?Hv+S5fQG+nLOK++5FPd8oxYvwT8rhFFRnmRZYht7+JOjAzKmVqvwv2v5fB3M?=
 =?us-ascii?Q?TLQJQGF4qAvYpo/UwR5DLcOW+SILxwzyCKY7lBOTqfv72OG64VF+UOlEFiyB?=
 =?us-ascii?Q?FyWithiJ9SncESQUqaZFzstnlRJvjD670ZTi1NjyP8LAa0441UK3+eDJJwbO?=
 =?us-ascii?Q?tcTh3Y3rBEgPlBlkslb/ff80G7aL8Z/hd+q9eEjtGyH3r8jqgBvk7ZOwM6rb?=
 =?us-ascii?Q?1WGo5ae6l8w0BGIezFUKZguJ9z5We+p+FwZNn2zMPmqu5kjefcceFRlswT6X?=
 =?us-ascii?Q?7DnxOhEC7Jb/kGpHKS55oK+vUAUIg++vUn+AoYk9d0+DXaWjZUfvjo7CQnEY?=
 =?us-ascii?Q?MHu1NXCylswsnK9Uuk0FuwiVj4s/8PeFc+Mk557ThkJe+L3P3G7ImXOUbbzX?=
 =?us-ascii?Q?AtmLqLH/ggSCSOkeeOjtiy1pyWbfZicCeIVXkPSs8waHDoPK3wVxfRCPpbm0?=
 =?us-ascii?Q?y9cEX49mdGoBzrg0zPRAAZSob/4gn0O/hOFvBHIVTWZdgU/3rMVPPDsIVttc?=
 =?us-ascii?Q?uZjWI7DUa55OQrmouzJMLitbhahklp/w/FDm3nBNZZ3SHcKjUWAks6eStYOU?=
 =?us-ascii?Q?/7RoSULH++hdxnysNTMxUFtFkap5Xtd6lvojMGXdz8+7G9c6xOJzLWGu9Lgw?=
 =?us-ascii?Q?dg11bKmkJChxO20JMsYTQduk4LgeJxOruZKqq25My4DYEUx2nQTnNUCN+oNv?=
 =?us-ascii?Q?E1zCBzsBMcWh0BB5hnUFWJU8a+1dhYXDgifhGD+Rjgb63Y70zaAgww12xLTQ?=
 =?us-ascii?Q?6C56dDK/6yLixKDrqFRf2bYlGSipdXEuviRsZOpkh+quGQ/lzF3nK0yDa2EP?=
 =?us-ascii?Q?AibqqOreYRsWncVwOjNkE6gMBYHqzd2iqAgIUexGsHVJ31JSxZEW1Fc5H9LW?=
 =?us-ascii?Q?OZDRfRKT5a/BzTd+2XkEpkqHBvqhS9eZ3qODcDPv0Gf0ZVdYrZLAzaTIm3jY?=
 =?us-ascii?Q?mFVjVm7ryXIH7i6XiC0EHriL9S1LQJ9wAp5K3JQogbTqVBjSfeuqupPmQuLQ?=
 =?us-ascii?Q?qbrIQ3W3XoVJH8Ov1my6FD6iQ2L13CGhrRwu6E+P1VAXxQR1TvGcqHxUif0Z?=
 =?us-ascii?Q?bAziuTyQN4Me2rwoEgRar8g7gwRsgocV7CuCVx7MBZkgA9NENa9kH1FIXzsX?=
 =?us-ascii?Q?B6b7/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 17:36:25.0064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dc7c19-611c-42b4-e712-08de5aa5ee89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_093643_587847_01D4032A 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri, Jan 23, 2026 at 05:03:10PM +0000, Will Deacon wrote:
> On Fri, Dec 19, 2025 at 12:11:25PM -0800, Nicolin Chen wrote:
> > +struct arm_smmu_inv {
> > +	struct arm_smmu_device *smmu;
> > +	u8 type;
> > +	u8 size_opcode;
> > +	u8 nsize_opcode;
> > +	u32 id; /* ASID or VMID or SID */
> > +	union {
> > +		size_t pgsize; /* ARM_SMMU_FEAT_RANGE_INV */
> > +		u32 ssid; /* INV_TYPE_ATS */
> > +	};
> > +
> > +	refcount_t users; /* users=0 to mark as a trash to be purged */
> 
> The refcount_t API uses atomics with barrier semantics. Do we actually
> need those properties when updating the refcounts here? The ASID lock
> gives us pretty strong serialisation even after this patch series and
> we rely heavily on that.

But we can't use that mutex in the invalidation function that
might be an IRQ context?

> > +	/* Test6: purge test_b (new array) */
> > +	test_a = arm_smmu_invs_purge(test_b);
> > +	kfree(test_b);
> > +	arm_smmu_v3_invs_test_verify(test, test_a, ARRAY_SIZE(results6[0]),
> > +				     results6[0], results6[1]);
> > +
> > +	/* Test7: unref invs3 (same array) */
> > +	arm_smmu_invs_unref(test_a, &invs3, NULL);
> > +	KUNIT_EXPECT_EQ(test, test_a->num_invs, 0);
> > +	KUNIT_EXPECT_EQ(test, test_a->num_trashes, 0);
> 
> Wouldn't we be better off testing num_trashes == 0 after test 6 has
> completed?

OK.

> > +/**
> > + * arm_smmu_invs_for_each_entry - Iterate over two sorted arrays computing for
> > + *                                arm_smmu_invs_merge() or arm_smmu_invs_unref()
> > + * @invs_l: the base invalidation array
> > + * @idx_l: a stack variable of 'size_t', to store the base array index
> > + * @invs_r: the build_invs array as to_merge or to_unref
> > + * @idx_r: a stack variable of 'size_t', to store the build_invs index
> > + * @cmp: a stack variable of 'int', to store return value (-1, 0, or 1)
> > + */
> > +#define arm_smmu_invs_for_each_cmp(invs_l, idx_l, invs_r, idx_r, cmp)          \
> 
> nit: the kerneldoc comment doesn't match the name of this function.

I will fix this.

Thanks
Nicolin

