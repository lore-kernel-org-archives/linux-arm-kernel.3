Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF69DF513E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vmKOeKYSVrwlqtFAka48W+unvHZ+UdTtaCe85Z4fUw=; b=bNKTSNJqEcgp9foaH8fn1eYAFy
	cQbHevDO2XxNM4D+7FphqPnvk5c9nQf7lcU/jlke5sUYYfWjEJin14MEYTxKLFbT/ZPjEEHfQdQOj
	ae7e52m2Xso805z0GB1IpFKN0WJ/z3LkbwtZZ+9hSbQmzccyyCChCjkd51N8UXh+p5LwgXawDCKPm
	Dbjc++asdasQrVmfVOoBNw2NkM0fXBXB9CkxX4+116tmuuiJ7AWs7ujdlQfZVaOo6FmIHUPeN/93r
	tLBKD194TCWcP5zNGsOoexOO1zLCY+Ov/ClbPlGQCNGsCAJfxl5WzOqDjjhJoWPvQUFEnT6aw6rCl
	b+dEQqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIV4-00000002kii-0nhn;
	Thu, 05 Mar 2026 23:53:02 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIV1-00000002kiO-269s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odFBOsKK0z0aR5aAGo3C/XtP9NqOw0AZDtT00Lgif/OgKfIWxxSf3qo6pFeYGsLZLYRkV2o2rQEWq8Y+6HGs9I5dTcGIFEEAGDZPsODN6pH4moB/LOYoSyM0z0a2qNnaPW1M4xBinhlfUyYtigMYup5rLUsU5DB85h79UJHzjeyj/PoMqC5QJ4hJbQrW9yqRbJMGVgqs3hZXEdaJafw3P621gkeobvO67vwvl/0GVA+v/BiUam3vJ2Cn0dniRVzdhtVrNfARvTHMM2ks/D247ItvsI2gQjVt/gqmUVqZkAINfzwDeE4Z4/9SzJy6wSPodmw2ZCv8M/rihSjkGrXAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vmKOeKYSVrwlqtFAka48W+unvHZ+UdTtaCe85Z4fUw=;
 b=sN8pU/tWWNvuTTnIRYKzA2Y2CwwwN4NZjrW6e++glzCaDNdykRgZ9+8KT0dxKSARinc2O+xEFfkvLsFkx1sU8YdC0RB9VrDtX8xKPkEiFxXuYdXa0CGTCNkCFXUVXr12LD0mpC1az7OQxlWQu8joEnUBf3ZmWHerqsgvJdiIBYP/jJCAInjvgsbxK39GckE3z3ZBPfySmN3HUiczMyOQJbRZT/iQEH9FTqE9ti0DxUa4kOYW4hrh/Xx49psRaIcW+IbxII/XGvHlR6AlxSBKqeJ3j9jS2mv8JJmuYzqlLRTHpixtIwengyBhe/pgx8Vt93NZAnp7S1bV9fARKWyHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vmKOeKYSVrwlqtFAka48W+unvHZ+UdTtaCe85Z4fUw=;
 b=aJtISiFjQvlhTTvWvzuHzuAyXM6qiIfH15fXsXEsM8bs6gNjSyUswrNYcD+EXQrOHheHxQqpUbD9Ghs2M3gaSaU6Y1G3I+RgZjZb0+Qt2AeALCrCzwJWqwOXm+Qwj0ZIcEoiSE/Vp+58N2UTfdJNxET+RzT5zyjiTSncUhFoBiEid3sMMPhH6sQuGNCreBPMtI0cClyDkjYMAXck/2u/RCXhVB3OQBpkEcRittbZ7WSGhjjJ1atcOEFckXpHkAV4qQ4xr7iK98GkJ100Q1iC+YfKzb1Vj3NCze8lDNLo3pnl4RSTxfDdCdhXhl8EAycOtar3kJC7nnehsnaxrwgZCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY1PR12MB9699.namprd12.prod.outlook.com (2603:10b6:930:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Thu, 5 Mar
 2026 23:52:53 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 23:52:53 +0000
Date: Thu, 5 Mar 2026 19:52:52 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org, joro@8bytes.org,
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org,
	praan@google.com, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <20260305235252.GC1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <a5ff7a43-ea52-462d-a316-d3a6c08410e0@arm.com>
 <aanwTQtMMplXY3du@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aanwTQtMMplXY3du@Asurada-Nvidia>
X-ClientProxiedBy: MN0PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:52d::17) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY1PR12MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a154d1-4141-405d-b4b3-08de7b1250e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: RKuyEfSVTDEiJSydCdbJ0seI31jZu191a83D+aZYAUzDdUABHeu0FKtSZFQBkJ8opM2d/qYhZ9RbzQamrBBNhmrhhZTUzftJqanWqUvZ9wfmIEMjpm0gbG8WqIKOR660DWJy9vBki/TWNgdnQqPZW8V7qm+xwIfBJ1/1ecCiQBL3NyKPbxd6kEupxfpqG5F2KmVQFX8EbEgNfnALD+1QD9jWIKfiFZLb8VwrpmkyStE5/Ky0Cd8jsPY0uA5kPQwFj/RSOVAxxO0PGyzW9eBUGrGme3UG22JkTfA9bubpP5/d36wOYaftfYHRoHM6WVK01d8tBKzhdLO+b0NVBSDR/BNNu6ajBKhefpXl9vwDzFV0Xertf5aOqmnT5PmjTnEFUVWHUPeufdr4t36UF3YZhqV0vxRrK14GyMCIDjdySdFqL4gaveSZuV7ak0NYdrTC/tdb/wvtd3kWNwP9cZE3zHkq6OoSqJGzk1wMlGagmyc04jXBKKwyhi0Y6Py9WB/AcNv6XsO35vrHfYOpcD1l6Us84cBXCRhGcwZt9Ttc4oURQ0OYBhGFteZMDbw+N2+OUUMdUtYdLjCaMeYg3dnadvqPUkH0HX/Eq7eAJ2A7zzBch5ZKV4WYKg9X3rbXS2o8SOJZ8zZp5YDOFhYU/9QtU5q5rH5uuUBoRW85I0/6iLpRzBF+QnbVM4tItF5MJydPdGUNmPfBbOH/YIKtw5WEoppxN2WXt8a0LTclNgEZsls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0X0Je9ReKqsAckki6DhngeLJVGHchxdJP4TuWDZGzbkabw5Wh8zgHUkBhF3t?=
 =?us-ascii?Q?cWWCecn1TmkPnaN1VCCN1oRrsDOqjNF2NkVa64fyyTuG9uZyVNX0sDeRJ30q?=
 =?us-ascii?Q?GlxwfviASduMVhKn7Gm2V52pDqpAAgsYYza518DmplPvkkt3D6o8VjDXTjY1?=
 =?us-ascii?Q?AqUWIB8TjxDe8V3Ztc0sGcAU73Lgj1rX6MUqwZxmXnpHVb4lKofWMWVT0+77?=
 =?us-ascii?Q?bVspRutIABXEI/4VSj4Gh0unv03ADEP9thF8kXf937pm1TMtcIMbCzurwHOb?=
 =?us-ascii?Q?GtLsVgwzuooEg47mJb9ijIvumXIFOeHARX1OwdWZGvU5nm067POsM62LQd7g?=
 =?us-ascii?Q?LKusyPU7wkHXqvARWIJyhYh+1uO2IWZoAE2vd2S+XdmcBjyT3kUoOnvoAN+s?=
 =?us-ascii?Q?q+aYq+EU1V2dAHmRWk+Ex2WQlApci14qTloc7VvPNOvX8cmqJOXmx+7E1QHw?=
 =?us-ascii?Q?ydoPlXlsMX9r70ZIlkPIe3YwUViMX26fS0maaAzfbTT0LXVaxCdMgFNBX6kS?=
 =?us-ascii?Q?qBh+aF4xvaCfjxC4aNcuIGaGn/zlbwzDHVeONKnh935MwAqxKC8mgCu5O7Yy?=
 =?us-ascii?Q?OuH+URQxe2xJuIVGZ9J90b4GYlmAt7+KZZRFLHCj8z7k15FWjFc1k1B4R9MG?=
 =?us-ascii?Q?Mjba8M6Xeo+ebCvu80bkFSGHKq1HGRnUzF5nksmeywj5Wq3tUx056P9kzkwI?=
 =?us-ascii?Q?T4ozPD6UC02bvoBdQ7EhiCX0gegT6B6bWpTqH4LANKeTg73nnTTFxOH65p2c?=
 =?us-ascii?Q?B33Qy35TLjXd3YUbDmG35XFeBKNmWNltNKfODLdtxmYiheWYmv5bobMpeEKr?=
 =?us-ascii?Q?HtXSkofRGf09MdswYCfUAnyB0605Z0o+seF/0GQDtovPBqkPAvZgmWu6j6JK?=
 =?us-ascii?Q?K1U1zbexqPkID0u6D6bEi6IDK0uzj/UEOzjGj0wx/7PeLRO0NP8CtmgyxugH?=
 =?us-ascii?Q?MsXoWLuzi7rHT6yB4WHaI2EJW5dcaCNLywTwGC6lm2mAEArdcZUnDb2jisa9?=
 =?us-ascii?Q?cd99ftV78n7UEdyn91Db6d9HGhg17S/Oe+IAm9no0VRrXbwKnTW0jZbxLPZ+?=
 =?us-ascii?Q?OezsLyksOwKmDfcC3M28FWQzmoyS02DZ2blnfQwKr4AQqrwILf7T05FbODa0?=
 =?us-ascii?Q?ltDPkKuR1nYimEw2IkYAnd5zIEXdd1OeyBFUZxd8JFusT7+isCCzU0Q13y9B?=
 =?us-ascii?Q?tlKeobat9rkTD5wc7fGcWLg0k94HJ/FXL/1ze3OCcZz8wng5xqSVQXwIrAmT?=
 =?us-ascii?Q?jZhHeVixBEZYXAxnRhSVCQmZS5fjflNG8VKEIctPlRtJziaYANNLlKStpEUb?=
 =?us-ascii?Q?ACrt3Z0lmlgFeJJGLVGySdo8rBM2KigjeSuI1tCyhatykaR+O8CH4Ru4Ls6d?=
 =?us-ascii?Q?VP3Ywgiif34zs6hubPd4AL+Sthl5OtDyrOQE7GRLQP7O9YWbaUBpI1mfYKOB?=
 =?us-ascii?Q?cl0X7cRGrdGpLoq0eU/WRXelidab3lwoD9WoBCqcWxO5H4HP1b9VkVDREZkC?=
 =?us-ascii?Q?rW55sVQfMUdTQppFR74lzP+quRnHhzCZ+FyaHCzMFPgEr/nOe6ERy5gI9y/G?=
 =?us-ascii?Q?7x6m3PtxcLuZdhoZgDa6y88i9qijqxzbFpvtFji9TCeeUDvf3uQ0S0l8tmJ+?=
 =?us-ascii?Q?DSjIZtdpGAn+uIaV94bSXqLhrcsPt3izbMCpbHettTs2QOHmy1ac0nhvQ5fu?=
 =?us-ascii?Q?ZYA8JNcSbcuVRso+zL2CPJCTU9Lh+oCLbCUPLBb/v+FJZzUE0o2kbpETXeMs?=
 =?us-ascii?Q?+OfMeDj20w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a154d1-4141-405d-b4b3-08de7b1250e9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:52:53.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cahbJhIcH7OCPLAQXzzLk+RYh6wCbXGLKTtpazHcgJyqO+yEyfLWqfEMhBxS7RNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_155259_564211_ABE6341B 
X-CRM114-Status: UNSURE (   7.35  )
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

On Thu, Mar 05, 2026 at 01:06:21PM -0800, Nicolin Chen wrote:
> That sounds like the IOPF implementation. Maybe inventing another
> IOMMU_FAULT_ATC_TIMEOUT to reuse the existing infrastructure would
> make things cleaner.

I think the routing is quite different, IOPF wants to route an event
the domain creator, here you want to route an event to the IOMMU core
then the PCIe RAS callbacks.

IDK if there is much to be reused there, especially since IOPF
requires a memory allocation and ideally we should not be allocating
memory to resolve this critical error condition.

Jason

