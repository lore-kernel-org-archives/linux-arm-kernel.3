Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2847BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MvP7KDvy4sJTw8gQos6mlhafABRV6zTde34IBisDN8=; b=urIFzZvP3qKU9fCLPg8L7bqcO6
	SSgB5s25nyQ6jhhz2ojm0Z4iQmSchwPtn7fYIBN9Vyr1ss/iZNw/264a9vtOiGXcfOTeYp+/WdC1a
	SyNLDD7Igjl2dGrZEe4+bIxBxU8XxppZitqDYXiF5pqPTGB05QHxediRbvR9CSmn3D1gnnpScPhaC
	3c2+CO2hV8W3RZsvGtDp81BWhx6DkwFK253PgD9qmNvQigeqVXlPJbwtp65Qb9lyTuI1YRztrSgOz
	ripgmi1rpK7e47OyPFPat3hK2Lep8+sDX8VPM6M7IvgSMXVfjGrRlCkM68fk5/5Za8jESR5NgXAR8
	u8m3rLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL4R-0000000Ceoz-0lMb;
	Tue, 06 May 2025 16:23:03 +0000
Received: from mail-dm6nam11on20611.outbound.protection.outlook.com ([2a01:111:f403:2415::611] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHmk-0000000BycN-2OX4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:52:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwnoTCA6heRFcZiTE48edKJ+BWSp78pXsZY1YggdxAayrxQ+oWabcpERR+hyT6SNLj0DoxwSZTfselyJKFRZArK+67ephiD6GJztlb4XSeMS1Ux0b6MbqkTN0KZC51A0eczgAErRUidy+6XjRalZ8eiU6uTNWZffYEM/f9vIHnABZIr/464K/YVAFp/x/sbez2NzoER+W8QQdMgYiCvxnpWsaCwBWi4CEXmXfUuKZsFnGIV0a35VsS/jBDih7aLITbmPqwfKX/sz3jtPnf9EB56JxGkCuhzN9Tbgzq2FIGQptLipmGEjzJycm5h5Ie+e9FzOx1ks+xpmRCHLgFU1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MvP7KDvy4sJTw8gQos6mlhafABRV6zTde34IBisDN8=;
 b=ngWPueSRqYl07R3hZkEhqpVGQzbm8oDJfkgV0dBmXb2E9qkOyU1auMBXn+fL9UtIXQSPZ7McFcONDe6SbKIZv7kE9/NmzpMIN67WAiRYuXoDZC2rn2j39pwIjp0aEqC8PSktUvgzfE6VZ0fG6b5nwDIiE3bGQ0c54Xs0kctjboPA6QQN7z+cGfRiwxgn26EDkD52B9/wgbU/h065ucE6tQH/quGFi8SGLbvLfHoyuF/55eMH5a0ZZ7B0+pU7rUJCG6Fqdwg/N5oYuKnSN96JWo4cNzdKpLfH72kVas3tFJ7sZ3137vp2C8YZHiZRR//uab9n9zcE+t3kZtMFDAQk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MvP7KDvy4sJTw8gQos6mlhafABRV6zTde34IBisDN8=;
 b=KPV76opzGG7f31cFZ4aCVexBn59iRmOaYhPDJPqY0gI5lzEu/o4BMl6Or9mpECTaI8hmFDEg3LyGEmIzWWE1c06lLO5wyWBT2j0TU83F8NJA2On5PxWWl7jGe9Sx8u3n2kAnthoQM7ze0R2HS+S/YSuCnYEgNI7Z3+TYAprs7m90fYWrfgLErmkyWpSqCtmMarO8iV443iRmmltN1hQjDA555r2sRip9aixWX+R7F7pbkujB8t5vXaa872ELVrE/XOzmMMLbRGos2M+gkhU3nj2Ube4/DXHlWvMaRMtnpl3WBAxJ+YurKC7aW2ubD1nwwIPimFJDJBfoJ6aSvoDUYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SA5PPFDC35F96D4.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 6 May
 2025 12:52:23 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 12:52:23 +0000
Date: Tue, 6 May 2025 09:52:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com
Subject: Re: [PATCH v2 13/22] iommufd: Add mmap interface
Message-ID: <20250506125222.GW2260709@nvidia.com>
References: <aBE38GwvGBnpRNLc@google.com>
 <aBE47aySzDp2lsAz@Asurada-Nvidia>
 <aBE800DsAOOZ4ybv@google.com>
 <aBE/CD4Ilbydnmud@Asurada-Nvidia>
 <aBFGCxcTh54pecsk@google.com>
 <aBFIsYg+ITU8RvTT@Asurada-Nvidia>
 <20250505165552.GN2260709@nvidia.com>
 <aBj1Av6Xaj8flMN+@nvidia.com>
 <20250505173101.GT2260709@nvidia.com>
 <aBkWoH23VysYake3@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBkWoH23VysYake3@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0672.namprd03.prod.outlook.com
 (2603:10b6:408:10e::17) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SA5PPFDC35F96D4:EE_
X-MS-Office365-Filtering-Correlation-Id: 5476d4ca-3a8a-4fa1-6149-08dd8c9cd879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dy/v/4pKBf6sp8WCqJDhzP1pcQPBSHiDik7mUrip3rJmcXz1XgCIRigD3QV0?=
 =?us-ascii?Q?T50Hh5bCpPgbJBLbXMm56t0zE4Gpc144al7PzZqW8uGK4VVpIzuuZfWCVkj9?=
 =?us-ascii?Q?zmEa7564H2FcCIbfHQDYr+jncdGGEwGq5H961gN5ZjuL6zBuTSWbrz4kLIoh?=
 =?us-ascii?Q?k2LWrG8wzWtyRCKCOZ3WBW1z/1t60ZIujfz3W8NE5g2kDIvBJUf7nSw+AENX?=
 =?us-ascii?Q?xB4qB89W+m90GgrBAys7a8AOL4liquI6vOX8lAxHkRYHCDdozgNAd4iEvBn7?=
 =?us-ascii?Q?QefY+QjNNkn/gsBbz/3RrN9IIOyYYe/ZStybZYv5rkbOaGn8YtdkBP+pu8p8?=
 =?us-ascii?Q?IOuSP1Fjdz70dZCLbk92vbmMMridl1jirfPjmt6eeap9qTD2PopVzYA8TVxT?=
 =?us-ascii?Q?CnpwhiMqX5tNKsEi5b4+rMuWQbKZSsdIQv2AbBSXeyjPdiThhAakPL27QoI4?=
 =?us-ascii?Q?j0SnnRh1Hf2zYv/bnyLn5pqTyqhoESGLWnIETuxj+35/vfL3wSwlFCbbyTSt?=
 =?us-ascii?Q?q8+GDSBEaOjijLZoP6HOUYH8YPPqq9UEd2k09deIxc3Qql++n9FpX8JTSQmt?=
 =?us-ascii?Q?JZHf4G4l7HNKURyrH+utUosSsjUfCp8aJYzBdyF+NPHa1Hg0d9tHQteKZjBK?=
 =?us-ascii?Q?9UeeXrdDdmSIcYdpZyCVnzBmWawBr/e9mub9dA1gP8mEd8YAVaSzaAwnErqK?=
 =?us-ascii?Q?NWyjT19nobGmry4MFfNdZj/3n5V5LEZWskPFT36nMDjafaIOF4b5nw909pYL?=
 =?us-ascii?Q?zCwyPpl8ZPvUn+4vegU5WTjeimwb7T8vyL8l/0m+hS//Mt+zuifZp9yi38YI?=
 =?us-ascii?Q?bPevkJuNyDPk01fMjPicof/ltb1heU+UtNCYrUul+f1eZKofL+uVbnXbnhTy?=
 =?us-ascii?Q?aDwKMGytQZRmDoTlPglP/RwWTONoH97T/vta0VFgEZ1U8UCX2yfMk5UeOiOh?=
 =?us-ascii?Q?9Qx0p3KXFNDAkTeM+gg+9fYweLw5LDPhNvnD2QxoKro0EMQ4LXKeWv/JG/aI?=
 =?us-ascii?Q?hnlvsv5Ir+x7Nod85qFeKVyNCI1EXxPJ0Tu9pL9QD8gB5toSDO/FObFqhQCA?=
 =?us-ascii?Q?gC/UoQMtyfwEefsEHHd89cUMZc6LzxROtjE7UvHsfXS5Q2OeKs+rqJVaHaLZ?=
 =?us-ascii?Q?stsBdfROt+xRp8aarQ4Z7f4TyhfKsXEBW3ugp0vHsF24YKKtNpr/ZCqmLbeB?=
 =?us-ascii?Q?QDSkqfv65xSKZ20SNcDzE5DR9haQYjyRJHJsXPjKDYbi9FFlv05xQLX8UhpD?=
 =?us-ascii?Q?4WKOmxYus4pOlHOjwvy2H8kyubpS+nShcUetQBiKAS2ZkKRhgJqZmz+yx8Sm?=
 =?us-ascii?Q?eog4WRgxoIgEmxgB9lNKOng6MsILHV5Fvl9fe7Bj8+v9gzaUrCjmQkQ/XvUL?=
 =?us-ascii?Q?Div3sv1E5ZpNwHAJq6sId174LGlJxtuxNpnlVqfovzMp/9RJaMlipewbLRbV?=
 =?us-ascii?Q?RL8CaGhENus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSRbRRdCVLRaTU0Nk4tf8U8wlHpidhZ8Rnm6ncptcdjo46sTsO2vXVSLHi0z?=
 =?us-ascii?Q?cJXnY85rydQPRdJujmB9c0DBcSYkTHf52KxNOz4WRDAY+OcXwGKZ4bVh7iR+?=
 =?us-ascii?Q?QM6UuzpMXP/+78ZV2iUunSokhCyGHzpXJkeXT+L7z6qLe/3QYtfvhi/OfHME?=
 =?us-ascii?Q?qqT3nZjnW4FjBCa1Q5FzWVCOqMbt5ihapSawz3v3Oc+s8EvU1ziuXassrk8N?=
 =?us-ascii?Q?J8VCr1SnIpDWanWWoe+EvsrxiMKZppSGLYwAfVqR7j8j/ib+AfXcQjgwBy3b?=
 =?us-ascii?Q?ydRlQQ09VdsW5V+w0jRIh8ykVltsM9WrsDjmtR/u7xUnuHSWWLAEIB3BtlWe?=
 =?us-ascii?Q?lbDokzbE8MTZ2EJAsFC9hKTUkmpB0ihwDKjR+Nm/EHAotSd5PZtaqEEseSgM?=
 =?us-ascii?Q?gYayGVqMKJv9/R77Eig08ZwyUxt0TKgTuWxKf0H1nQ8iXCyCOWxonDNs0ats?=
 =?us-ascii?Q?KsSBy1uICu2KlK/Hh6tfX/PozdK/3gZqRriKHYTV7eoI1WA3gi9ql5xZR2Op?=
 =?us-ascii?Q?NiGY2TkS3I/RvvZBSM5NTlS1pLm2XgEGF8VG9gvBSam4X+24rtipmEY8HSXE?=
 =?us-ascii?Q?gEKRWCirmdfbN3XQSpeARMV2fbiihGfotowqdj54wl6qK7HyASWTwd4kySyF?=
 =?us-ascii?Q?NqpgHtYy2S2xlso40lF68erP1NkOXx3GwkGzNzocsnAfeoGhc3KeyNG12F0E?=
 =?us-ascii?Q?zSp/syDSGycbjlNvPpQisDftZghdoPLdzpQ7bZnpZR3+JgLmW4NA9GPmSQyh?=
 =?us-ascii?Q?WflRFwu2CzBT1ZooMN0ybnsK4kWpIgFOwbnzSip84lUpJODS+HL6wnHrWBMG?=
 =?us-ascii?Q?JjXgAzUOE7X7LB+V1QVXS0z3wbnGQkGYRCzkyRNP+0+qivpWvWj5fwIX5fFs?=
 =?us-ascii?Q?eJhFGpkMv219kQsEa/v8y5pszoFO6dQe+7B/IEMR+kN/L6imaSM7LG4A2KrY?=
 =?us-ascii?Q?o0CtKywOBYI0rZ2kO3OtxoVVl9Q9kwZgzQq80o4dtEoFqOv6a7C5uvzxili0?=
 =?us-ascii?Q?LlkDiahW6sFjww2rklGyYNDbkIjg6tnH5LgntJH/2jzGBIbSw7IWPmkDF0w6?=
 =?us-ascii?Q?q0ujv0MS4OaWUDYZtC1WXIahpNNVZl2cTKT7p5Hhr6LnD4Yog3Q1uOX7fx1W?=
 =?us-ascii?Q?+fjl0LYHE1rVSHS0PgekDfSW3qbhRJYoinb/IbMtxfJ0cT6IH3ojXAV38rXw?=
 =?us-ascii?Q?QhMhB/P7jZwasUbRUVP4LZA70ojua0RnO8buA2qzOccnTU0ynKKkuNTzFvsi?=
 =?us-ascii?Q?Lsaw8jOenEarmPWE1m/6U1XnPlUVkTnlfLi9VNhoxf3d9MRl8EvNaBJrb0/7?=
 =?us-ascii?Q?4SuIVN9fTvaBRd8WVgkBJXLKQRDYQogHPcyUXxkSrPpwK1f75STXarblonqW?=
 =?us-ascii?Q?XvLvv8MN883yR8GzVru27G85dSxL9YBajWvW7gJL1a/UvrALTv2nkdjs9V5P?=
 =?us-ascii?Q?RjFYB3/EOKX8feYfecsqmEfKg6YoUGzccja9I50G3q3v2XuGVKc83uPIflI6?=
 =?us-ascii?Q?E02Wd/DXgEcC7unnqLrkMOCGrmeA7K5gDvVoC4kAI3Me79KR8QE5suade1LX?=
 =?us-ascii?Q?nzLlrzfmbX7WxA9yKOoJ7FTHsCybW18/tPQfUgCH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5476d4ca-3a8a-4fa1-6149-08dd8c9cd879
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 12:52:23.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fy3VwAqgOh/KDeAbPXLzs9RIDNpyYCX/TiQinR1Q4f0qRkRXpyv3oL9oWuy6fctO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFDC35F96D4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_055234_614254_11DFCD30 
X-CRM114-Status: GOOD (  12.34  )
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

On Mon, May 05, 2025 at 12:50:56PM -0700, Nicolin Chen wrote:

> I wanted to ask: what should we pass in to the "entry"? An mmap
> structure that hold the pfn range? Or just pfn_start?

Some kind of struct telling you what is behind that pfn range so you
can invoke the right driver callback and retun the right pfns..

> With that being said, it seems that I have been misusing the
> mtree data structure, treating it as an xarray. In your very
> first email suggesting the mmap design, where you mentioned
> "xarray" first and "maple tree" following. So, I thought they
> can be used in the similar way, especially after reading this:
> https://lwn.net/Articles/846175/

This job requires a range based datastructure. Meaning you insert PFNs
A->B and then a lookup would search for any intersection with A->B.

In maple tree you can do this rather directly since it is inherently
range based.

In xarray you can do it with the multi-order feature or you can do it
by replicating the entry across the whole range.

Jason

