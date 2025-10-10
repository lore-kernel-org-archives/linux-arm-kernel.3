Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EED6CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=; b=tazjy+8KB2DQfvKMzNUJAj/Vmo
	MeBdmwV4dlkoYL486KyBHFxQhnWY+JHXaKGA9kA8P8sqeZK81a2nwPvV4fuEfecEg9PvrjJb12GJc
	ySnT1bNg+NGeqkSXle6rvBTGA2nZ0tQUiAgIGZP7TMOgrtx9WRjSSI6jW7SmoK5/o21ds5QJHbKNt
	P4ToHSgZvOc2RQU9dbPy3PXRc3eAGfTvP5EEYtxxhB8l9srdxjOTZ5OQa6b0ceJQj1n4fpHCWBVqY
	3pGXO2A4ucRn8nklQIXHvjcKkdUL+YdWZwG1j1luKC8cL/LXPLiQ1o7zq9vQshE7+kcTM1SQOrk/V
	Pgyy8isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jzc-00000009Ks4-1mdL;
	Fri, 10 Oct 2025 20:45:36 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7JzW-00000009KcA-2cbT;
	Fri, 10 Oct 2025 20:45:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMSAd07nOOtfsJ7TzNFLSnYCpQ38Y6muyp5dAX3ESoyDJtnyY8Y/3Q+N8n8rurobzveN1oAQneohPZRKMZDGspVkvJNgINgvN2FzRUB7Q5ZBOK14SVhTZje4EcWCf73Csdf5KUM7JnI2mnjxD+HjxOPC1ehfEqkEkt5OqynYCR1xj0dDm7LpUsJMFypX7/ZUe+l+ZXBQSTn1giaS7xEySdEzR/r+ItqEppqPRqi1fot+Xx9ffOhDCDt83duVLrzfC4jIaw3AyIj0yANq/2c6vedVD9FlX/CUV7CfCVJIKDIDWTc4kADzelmuetrftE3/PBBzjolbE3Jf/uV2Vm8Fcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=;
 b=TQm4RdBqRaqnyntIlMrtpCsdL4Al93cXrLXLFoP80hMMfmmEkqvIMCw+HcyzwOii/85aUZVSPB4Q4p6N6bsSzbqLIqAJ1/9uAZ4zuCo4MAjYPBdRbZIbVjDEFBZzjmL1xVBLJBpPMO2acJ9bRXl+EFnn6TOP4rLF7MaBbrgJQ69Tag3uj7P2LUvxRurskoSW03AqRqkJ0bE0Kea52jJLyGo0c0MvoAPg0FvlMvhCDxLlQGA3hb+703CSH4MI/hkvsFbvmIjpTy+7ChMs1qLuU2dC3kMNm+qZ++BzXA5RPNW6aNAFKZrTihkCm+6xaJEbtoIjtFOSzZymgfFDLaRp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvX94nIt6Ushebm+TMBumijXPGW+xCDBR3BCYJgUfgw=;
 b=yn5sOmLJ3o/1F8Us60pAdj7U4RzGkyAjlxoikZHrMSrgkuFrhWqIFJsnDjhjwTj6twd8eFJr85WZlCqzbKmQS4pVysLofUHsp0eofTTwpxh7y/Nb3AHJiAxDk3tYbBSoJCO4ZOoVZpKhvHcV0nSZLmkaedpASY9skyewIE2eEva5Nj5rw8lY2L45h7aquoQWFDVWvAS6iCPJrlQHJQbxUA0UAKL/jCXfL5AQ9J1JIGP2tTqy2aUutgaHUiYHO2KF9Tclid9BGc09Ayk7oZQMiqCggvdQUNv1n+1ixqW6IIcp2bCesvx1tmQj8rna1tQc9W1RqNHK4ekg0t8Oj1XFVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by GV2PR08MB11561.eurprd08.prod.outlook.com (2603:10a6:150:2d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 20:45:17 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 20:45:17 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v9 06/15] spi: airoha: fix reading/writing of flashes with more than one plane per lun
Date: Fri, 10 Oct 2025 23:44:51 +0300
Message-ID: <20251010204500.1625215-7-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010204500.1625215-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251010204500.1625215-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00011B51.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:8:0:b) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|GV2PR08MB11561:EE_
X-MS-Office365-Filtering-Correlation-Id: 2faf3a44-54a2-4785-72c7-08de083deb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fI6n8xyKmopE8mDFHyZZzBIFZ44lpBoG3QpEYVk7GUIkDyy1RLdEm6jMjYRn?=
 =?us-ascii?Q?yV1FmGtMukOhVGmbNx6iH+Md7qF3pHdPLUotr9jRhdJLS94zqtVZNprzOH73?=
 =?us-ascii?Q?s1QjYsVVfe5kW6ISmubGI952uGKToxzXDeykqtEJhSch1tuJKYAr5NCCqkfT?=
 =?us-ascii?Q?b/LCrdYvKkJ7Cy4cJgetRIdFnW0Qn6/m8lpDV6bTzDvKZ95sTjf9m8GyTru6?=
 =?us-ascii?Q?jVTHrctq0igdEPRPF8qXkcjITm1cVhp+7O0+kWUIzuTvFSeTwsf+Da7bicO9?=
 =?us-ascii?Q?fwxVg8KknNGf9Xk5wvLsF5MJBuIOyIgUYLP90Y8AFKPOSTs3wMVCCy5o5yZM?=
 =?us-ascii?Q?eqcdHYZjV2HlpqhGaOKB4hp9+MTzJ8OByLZsdo/Qt7p1BPP2bQIX7HWl9K+v?=
 =?us-ascii?Q?hnncwVhJDdh+mVsPiLxA6KwN9Gl2YoBIuQLcBJ9yLH2pHD0A1PUceF76p6b3?=
 =?us-ascii?Q?iyzuF0zOl8Myy00FEC9WUe6NEHM7NmGxQ7NRaTvZIaXnTNb9KwD4CAktG2d0?=
 =?us-ascii?Q?zP09vBuNBJGwA97svR7CIFNszK+aLdPXQXjqelfdOQ4+o6oxOMdr9ZxGHltw?=
 =?us-ascii?Q?qy/6DZl2FZzD+JVqeYnh5XJ3dthMsCzvUzmvxfUas3mroPGLEs3IXYah49X0?=
 =?us-ascii?Q?QUfQJyP8k2R/RMKfE6kDT+1p/rHf88U7LyzKeCzOx8jNevfDh9nk9y4k28BY?=
 =?us-ascii?Q?mc3tAoFgwr0q9fboOHe4CEKz9NHqmJgljyHkOQXrqJPlmV/cCCEcTDV2BMeJ?=
 =?us-ascii?Q?G6AzrMUxv4TEemECNrv4lQqQOggGcY+AuVNQHTJPRjV7JchZJ34jwcmUTR4v?=
 =?us-ascii?Q?GPZVBSfW5OCV97dYW9oIb+FT/I7qHu0tp4L6U6tSEilZo/Iy1f2lk4z6kzV1?=
 =?us-ascii?Q?TCGe1C95CMxrS29KFCxZLwXG1KMg1NsIPYVR8It3CSBIQ1XAE3qbP5oxCH8M?=
 =?us-ascii?Q?FsOV/dmt0vKC9XRl8E3MOpUdthRfJ3EFjaw6fwFsu6rtc8pP5dzKbXUGBFIt?=
 =?us-ascii?Q?p15aE8MWmekt32Wmy5vu36Z0/0GlDdUsSJOPE/uFh2JjG962foDt7QXbqJhR?=
 =?us-ascii?Q?4kQkRXyBpWyupwdJ2YHZUFHcetM9rbYuZDEFTzDLvITR7VTVEiK8Z+E8E8Ow?=
 =?us-ascii?Q?KFFzKTvwrDqjuZDrNUn/QoYvAlMSqcncC1JGnpnfRrSPSOuQ+9cn8aIwf9qu?=
 =?us-ascii?Q?MCYdNIsgg3eopI+FWaR2Grfuc6QE8HQyNCPkWyAeBo0dd6wNG0LC3u5kUeuj?=
 =?us-ascii?Q?IHiSxXfhIIkOPSC2Qq6fWQqGOpai1mz3v6ILb9Yc+Ox5dsPgdsN52VazGjpW?=
 =?us-ascii?Q?OHnlvJtTa8UbGpNUw50XvwdBjA0KadHtitF7LZahmYQXYxEzgiGTatgewe8x?=
 =?us-ascii?Q?EX0JgU31wg/x/9uQyb7VjRSwnRu5FLksuOLFhC3P6cBTo/K9V2/Gsr/ChmSU?=
 =?us-ascii?Q?LZz8rVIYwmRNs97Gux5jORWmSWU9+k66rCSWYnXflly/ie44f7MmkF/+NQmr?=
 =?us-ascii?Q?3+ZhFCX/w417d0FVEYLreL8o/Xg09nzovisFgIiOHowcAGvSqfijs1+QKQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aM/zKw2Ci1IZJq/L8l3xdxDqO+kZzNOf8wJz308LgUDgwu2MfdFlFUazDvVR?=
 =?us-ascii?Q?40mqv7KX18sWU1LfN3uRsy9PGWVlbQLw82y8FuRkyOP9i60H0Ey6aZq8xFif?=
 =?us-ascii?Q?amgeSMZJzy/zCkwFGQUx8RH+bLtBn8ZHGjxdTO5Ef4z6y6ZeHuZv6zeIrHGY?=
 =?us-ascii?Q?BAd/FJvoeAMRHVEzIO/mVi1fUK/a2s5VDgtacoE6+0zFZ3GItba5SstOmKTA?=
 =?us-ascii?Q?MCNaLHjrqOTXHdeuZozJEd7aZO+zYgyLDy1trj5/GryJbt/k0mAmHEP8ocVg?=
 =?us-ascii?Q?I65DpQuLLGfxnwYmRbWekMu6GlWCleKodBCeWbnvU7oqLpLcG2iPWLex/MXz?=
 =?us-ascii?Q?kBvsaYnprsASlzaqkHer+lTibLk9scMb9TFfqrmegMHxS7yOQkBRGCtFArsf?=
 =?us-ascii?Q?A0HklK5fqlh6kWBarOLHs6WNWN+fV+6OpPIX8zXIcys4oW3jkb82GDbKXwPh?=
 =?us-ascii?Q?pedtaqrc/RZ7IB+kTZzjKeLn8tEYAa3RVc7thhOINa5vt3vPxt9BvK0SDovc?=
 =?us-ascii?Q?4xbCgFQ+QdJntW6G7PwjAtRYrRk5JqDRp47QjOsLUhFBVsWZa3/KEdMkf9eU?=
 =?us-ascii?Q?lohxv8u1h4s4gmkpNq0G1i8m32HmKRYRO+xQ+y8RT+/48v8RxeydQvv1tAj8?=
 =?us-ascii?Q?zlHGmWQ7vKHxWtsTJKzTE2T1LC8opPmi1S3zWxCdqLqD5ZILo9K1FTnynxGT?=
 =?us-ascii?Q?Fpza/ykIXywv8zmTb5rDEzaEI23gOjv3l+qE4xzD/xO8EtFHynGZSf7rtYOV?=
 =?us-ascii?Q?eXBcgkAthHHFD0VVjpB+7UkPD6PdKjdsXrMuw91SLnTkQ+so/IvT/OMbaPFQ?=
 =?us-ascii?Q?AXNqB8jkWgrXmVaZ9cGlz2EX2Tp8y0h1EFX0Pz09OzY5P3Ibx5e9vjlOGJ71?=
 =?us-ascii?Q?io+4q1DLpibG4pEpOurJR7panSUHL+9dY8UeQCeL0siTpJk1dzretqoiZZtE?=
 =?us-ascii?Q?Ugp0JE9C3OmKRgU9wE0uhY0CE9a9j0L6h7BK9bpqz7SiEueB7uCyK9ZKOnla?=
 =?us-ascii?Q?NvteZBE8z4dHhEnNfzHbU7IOPYY2/XQY2JgIljdg67lv/GBxUgJNERfxg1Rs?=
 =?us-ascii?Q?aN2FyDLX/flLoj30Dxj2oSw4Vw7Lr8KOYLpdETnyPlCSlFELZkcvJWBAlQsk?=
 =?us-ascii?Q?28gAYpfX7HzhXCQPB/o0esld62DdwiJSyE8O4WdtG52dYjt4xAiIlnMQd401?=
 =?us-ascii?Q?mJaQkWvwH9GIfXe03CJOE8zdnPZkM+mUKjui10Oe4mcn+adg2E5/CBpP/8Js?=
 =?us-ascii?Q?tELHvjdGvXuTye/PTjdSje//d8rnkxcSvpT4b0XKN1w74oA7TPo40wfSCTed?=
 =?us-ascii?Q?p5nNauMwFdiCPkbgNEJkv5qP6bByj2Y6cvW14r1gV09bF1PJT+4SEnSDXBfJ?=
 =?us-ascii?Q?QFaUUVD83glxKfz0sDgz5seyG7LsbdTqTcsszYpbNRJaf+gdIQlON0Mkf3e1?=
 =?us-ascii?Q?7dfhUpRd71/mQTjp1THz7s3h51qADV4CDhExGiZxUKTCAGbAIwGO/a37eYBH?=
 =?us-ascii?Q?bOB7kBFrfC+gJWfW6oSYH8+OknNvaO7OsE2W12tOpg34Jz6p4abXL0ebNWqa?=
 =?us-ascii?Q?udH3D5+2+UN9P7za+6cC0t6CfnNO4oqenDkAdg9bsHvTVAjLhU87U0ETt/3y?=
 =?us-ascii?Q?ipgr+/jxiAmo98q69e74KKc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2faf3a44-54a2-4785-72c7-08de083deb95
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 20:45:17.3778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SAviC9spFFGhHgLJIUd4hMBxZB2z37gL20mqMm4TWdl9ZcO2L1n/nWg89fzGbCgVszvnoGqWRteImTmJvLP0GDSW/XeDmiqdeQTctCEJaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11561
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_134530_668503_9B29ECFD 
X-CRM114-Status: GOOD (  15.72  )
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

Attaching UBI on the flash with more than one plane per lun will lead to
the following error:

[    2.980989] spi-nand spi0.0: Micron SPI NAND was found.
[    2.986309] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
[    2.994978] 2 fixed-partitions partitions found on MTD device spi0.0
[    3.001350] Creating 2 MTD partitions on "spi0.0":
[    3.006159] 0x000000000000-0x000000020000 : "bl2"
[    3.011663] 0x000000020000-0x000010000000 : "ubi"
...
[    6.391748] ubi0: attaching mtd1
[    6.412545] ubi0 error: ubi_attach: PEB 0 contains corrupted VID header, and the data does not contain all 0xFF
[    6.422677] ubi0 error: ubi_attach: this may be a non-UBI PEB or a severe VID header corruption which requires manual inspection
[    6.434249] Volume identifier header dump:
[    6.438349]     magic     55424923
[    6.441482]     version   1
[    6.444007]     vol_type  0
[    6.446539]     copy_flag 0
[    6.449068]     compat    0
[    6.451594]     vol_id    0
[    6.454120]     lnum      1
[    6.456651]     data_size 4096
[    6.459442]     used_ebs  1061644134
[    6.462748]     data_pad  0
[    6.465274]     sqnum     0
[    6.467805]     hdr_crc   61169820
[    6.470943] Volume identifier header hexdump:
[    6.475308] hexdump of PEB 0 offset 4096, length 126976
[    6.507391] ubi0 warning: ubi_attach: valid VID header but corrupted EC header at PEB 4
[    6.515415] ubi0 error: ubi_compare_lebs: unsupported on-flash UBI format
[    6.522222] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
[    6.529294] UBI error: cannot attach mtd1

Non dirmap reading works good. Looking to spi_mem_no_dirmap_read() code we'll see:

	static ssize_t spi_mem_no_dirmap_read(struct spi_mem_dirmap_desc *desc,
					      u64 offs, size_t len, void *buf)
	{
		struct spi_mem_op op = desc->info.op_tmpl;
		int ret;

// --- see here ---
		op.addr.val = desc->info.offset + offs;
//-----------------
		op.data.buf.in = buf;
		op.data.nbytes = len;
		ret = spi_mem_adjust_op_size(desc->mem, &op);
		if (ret)
		return ret;

		ret = spi_mem_exec_op(desc->mem, &op);
		if (ret)
			return ret;

		return op.data.nbytes;
	}

The similar happens for spi_mem_no_dirmap_write(). Thus the address
passed to the flash should take in the account the value of
desc->info.offset.

This patch fix dirmap reading/writing of flashes with more than one
plane per lun.

Fixes: a403997c12019 ("spi: airoha: add SPI-NAND Flash controller driver")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index a39c3ab4af5c..5ad3180ac6da 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -726,8 +726,9 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* set read addr */
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3, 0x0);
+	/* set read addr: zero page offset + descriptor read offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL3,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
@@ -860,7 +861,9 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2, 0x0);
+	/* set write addr: zero page offset + descriptor write offset */
+	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL2,
+			   desc->info.offset);
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.51.0


