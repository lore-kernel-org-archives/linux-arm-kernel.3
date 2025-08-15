Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB98CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SvPqPFFeuNyih+0ZBEyOGcFEsOwrQGVBa5/Vx54IzI=; b=0YMN7D2xswvL64eyZTXsRiPC8y
	ptivu8yNh6ZXHFhgtXYs2aFRRjmBA9jsjx5exSFz26lcNGkjdc90CjNzx/bG+54TNz2haKHKXX31m
	0qIy6b3GxV/ZKrgVyAjYSWvuX+Ly95tYzApen99dosj786FZBs6z2foVqLmAeR3qpQcdZsXRUpa8+
	JKykNfcbeoAkyh9irxZcq6KIpquMhD1/9lgzd4k57LGlIVNgXoCPCiGl7hOcPhKqpIM/xixy1y7W9
	KbwDUbmrpYyocMzQ19Wau/6PQZkNDOZko4kkinv+pvQgMB/5g1kCWPJAvQGWxHrTGgRw0FUBCF6bu
	bWNcea1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umupG-00000002cT9-1B8b;
	Fri, 15 Aug 2025 13:50:34 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsQN-00000002JHO-2ufQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 11:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6QpORgjCbFbPsaYZbJzKXK8UDpI9plMTsAyd2IUQbmS3di3+l9xUWdDnCrO1ifwk6AmbAi32irvjgqhRW8HqzJmowaO7gm/WCJq26NxXWfPUDDldfZtudDvOJkiTaeP/Yt96w/TCq5Xz77Z/fq+I1hBGjumSp6ZlKQv0pOsKTqkBSv892NYM2ISe5S+Ymr0QvqoNw/X5pVP0EkqDKwNgm9L1vZfqAvYdLnHHVcS9IMC+LFfZRvvANr/YCc0DPL/qp7k2v8gnOD+Qs8XKKK7t7BPSukcfcale5p+tj4DcVbOE3w2odupaXzVP7egMq9tLR1R3P8/dVqNq89dt/bAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SvPqPFFeuNyih+0ZBEyOGcFEsOwrQGVBa5/Vx54IzI=;
 b=DkdaVlKUUyXIIk5lHU8BQoxpgDTYJ+X4lzfbBXv6LROwBopxynH/x+wLbEn8pjtXiagLJlH9XFrolKsQNzCD2gGyGIY6jXz94sSL4KzCXToBB6LD3NLLfx/0YZrEgzI4C6rVfM+OtFr1xzrvl4ABs/wQSTSbqcfpXFQMDZKonS/qJh6Uk/9TCOjQ/Hug5IdHFZTtYEdol0RhFTXfu7RSypaYRiAUiQqiPzigQMZIW35Z+Ga7zHEYhH/oJ93QMGUPfBidzNvBKoVfPvB8/JNf43mTrdBrR3pvzl4bZiJ+rfUR8l8jus3NPOtalnLjYEJF9g5Ri3EPGTiwK9GfHVpQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SvPqPFFeuNyih+0ZBEyOGcFEsOwrQGVBa5/Vx54IzI=;
 b=MeQ36Q5lVzpAe7Fg7t6aWEjU0aj45im9oTzHkpLnjbk2udXxqZOAmAMJtnWWthdYdy23aolU8sYtYj0jwzUD18QPLK+IDiXDXulW0nBuSW++CpZ2HbXVXGLalARGIuxVmc9oKirGpsBcg7WKIrapKBp+lDV1nsPewdCsS7XCvsm/D4iRxej73PZbQt3QSpuHwCePwN9n4Q0qXmFpBKi/QrnKibrkDB5K65PCb5MCFoXBUtSQGxBwc8Md8rmM+G1ba4vGecD4P4X0OEzw9U65eesZVMxH9Qrzv4K1ancpNottSw45yAr5Kf4LDsGglv93n+MoaMghBNko7rU0StutFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DBBPR08MB6268.eurprd08.prod.outlook.com (2603:10a6:10:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:16:34 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Fri, 15 Aug 2025
 11:16:34 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v2 07/13] spi: airoha: support of dualio/quadio flash reading commands
Date: Fri, 15 Aug 2025 14:16:13 +0300
Message-ID: <20250815111619.45001-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250815111619.45001-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DBBPR08MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: e7fc2745-38cd-4b0b-a5c1-08dddbed31a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xQ00asqoqXIEChFUEKcpfzBbiYrmny5BN2TOX4oWaDEmYZMK1yW9sFIJdwWp?=
 =?us-ascii?Q?FAqnkHCypQsLMa9WReItuQ+CdONE6xLKn24duHQhIQ26XHg9wq2hCTk6wdYQ?=
 =?us-ascii?Q?UrgykrLwDEsLgnBxvEcdGG8B9sZMPWg9HaB2f3Zu9MjBa0iOHOaQqWsTqvDV?=
 =?us-ascii?Q?YrE3xtVFpo0sxj/CatTeQeEj6tDSomgDjzy2YuEAnKywRMIIjpLQi9pdsVpr?=
 =?us-ascii?Q?H7r+husJDQFlRAfMD7nXnsjs5CVZnEp9Da7dYP1KDTQjSCmpxMNnmKFE63Xt?=
 =?us-ascii?Q?GqP/87PpyAoIaOJGki8Nd34FnrJUUQV/lM7SuxraAsovDh66FUhflvFplBJG?=
 =?us-ascii?Q?65K7LT09Vz1q6YDn9scgBFDjZtjdnFipEce/K9bxmUsre1rXjcDsvg1BphWi?=
 =?us-ascii?Q?7Za2ssHXdccyb2ZgN6RpGoNjDpwEccHSvPz9nRgaVSaaagzVxebi+uKcwn3M?=
 =?us-ascii?Q?2WL0ERxiKIJFxKWcOOA/xFS/Mlrw0GgybuEWcNbGaCOEXbrVbs0IbfOGsJgt?=
 =?us-ascii?Q?36iAD/xeKpXlJvHXQJMAzxGUaJUBZ02qkQF6DlF9LWYRLet/orGPmfnKzCY1?=
 =?us-ascii?Q?mS0dBlUDh1ShE1+0UrXWLki815YOyAJXnUpOEVn9ScK4HRYB3S3PuLmRhTQ8?=
 =?us-ascii?Q?oxIbecGWPhIS+jGdjaG7otPdo0gp/teOGKUmpV/PVzPjz5usMzntkuDdw2He?=
 =?us-ascii?Q?NEwVptjXWjefFLXSQIN2YIr1fwI4IPsatepJnlsbMnu4mwx+Ns6gqpUb5Bcv?=
 =?us-ascii?Q?tQLTHq6xXnoNLdoGsdZq18q68oKeO9VN1OwzZf8tWThJk/Yo9kHJOy8ik2IZ?=
 =?us-ascii?Q?iQbIrTbYNORVuxz66PwM9Gy4kkloKGnuno7a8dl/e9NnZKIOn1X0jTiqbLuZ?=
 =?us-ascii?Q?gBgSgfAwqopbGlKxNe49DqHbbUwAkhXJBybJMWZuEwRPvQjSDtQ1Zt+fJZvU?=
 =?us-ascii?Q?HqFaWd/o3U6EpnxR3K+YzjOsdqoGqzZB8W8qGihJ+DIk3uugizYtq8YjS2Ww?=
 =?us-ascii?Q?UlrptfWzXeOA8HFXTOgtNh9LO6Ml2IGnVkd3+WK7c49B4sE44p2T9r8hwo59?=
 =?us-ascii?Q?iY0YDdjUjUBZTBtEqSeGym3GQMQI5aiwr+e0YaU40FLJ5UAfBxmYOFDHFHDA?=
 =?us-ascii?Q?EkUIdbXd5Fit6fjLWMWo9SnbRsch1WusC7EuNQ2ztDSbsL4E6unhONDwhil0?=
 =?us-ascii?Q?QedhuZwepoJbP0HsFatclydGFaOAkT1/EyXy9X0VSP6fLwit07TF9FGcIef9?=
 =?us-ascii?Q?l2GH6Dy5bpnYztRPLhog3mzkIJt/FjKcLJmriXu/3zv7pqdiIO0dGpzv91Gw?=
 =?us-ascii?Q?eJ6X0TPx6/J333BZN0h0KyGHIlmaORNihsC7EU0fRMj2eTeXQnik6HHn+e8m?=
 =?us-ascii?Q?pAsGcfXtdUFQBzbvjpLRwHc+R41NF9ljGcjfsEwZ/SOmq9UP7xBs2QvyDgiY?=
 =?us-ascii?Q?mWMfirpdY1WlONYzTcsan0c5/FHj/CJDLBEEnKCB2jpJHhguh91puA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KVJaiaxgXYra8G0dbVVzLXT8Gy16V2owXUFdACB8EfcD15qLweg6FBaB4C4m?=
 =?us-ascii?Q?D5owhh6pIl/W37w8iUF9VEFByGKYPU518k/NHcsosn2luvfdeb0270JU6dw6?=
 =?us-ascii?Q?Pape288Qm9+CKMP6VZx2taV7xZ+cm3lXIhtdiZOqBwT3n6oZVAJInDK+4GLU?=
 =?us-ascii?Q?PuFvASX8CyDrsV5EUulvyKoHs6UaKody4KpaSJBMOLIamcteXWD5pETsG6iT?=
 =?us-ascii?Q?/2twjjepgtWkQ0Fzzutf5jJ9cYiQ/uHZKVXvDUA4tTErDHBv5F+xuJjKL2C2?=
 =?us-ascii?Q?3Kt75b++kC3tPeeM1+H62xMG6sZDHeV4/hhPWLhDrijv06FUrFBgyjcAlVMN?=
 =?us-ascii?Q?qxmTBE0aStGOopNir1UOXDA1iNVzDz2mrUuY+gGzuUEDyDeG5BXPxtvIP5jJ?=
 =?us-ascii?Q?1ihMFFHrcfn9DxorwbuE9vEVPke2Qon80Om9ecbWRrYY9oo4ALbgg7vcJBR1?=
 =?us-ascii?Q?/KJ+rVtBudRZN90CHE9gLCz/o9D3+PkDhMTBqyxzknxQaM95HgJvYq56LGYx?=
 =?us-ascii?Q?LmcRuJ76KJV2uFLu95huNDc2VKPdot9J/+T2BAZLHZXAseQh1429pwUqfNEq?=
 =?us-ascii?Q?jjCTL4X8Ioj726hiXeynPviUt6OW4jrE1Y1YoctB2Kl0GHhSgC6EY/HtYP00?=
 =?us-ascii?Q?kGW6UTYRe9ICaBPisSfFLxgc07H0w1PTMrrvVNVFoyodPjUujgWbMnXy+tuL?=
 =?us-ascii?Q?OHPhsNnwpLki0izQVlcb/r3SWuVEVZhM7tVoQTuRh7VlZNTJx4UChbxtylyX?=
 =?us-ascii?Q?ndLo2CUzMBfRul+beFiEzxl0MCM3WTJCSMfJ659/04+ceKImh9pG2i9t3SUx?=
 =?us-ascii?Q?8xStxa2lBZrOR9/xitZ0F6xEpJaai3wBy9cMX29kGi6D8VbRC+ycKildy4mo?=
 =?us-ascii?Q?cKh1SgaddDmZ3xkZktcvLFy3Vzo6kWCFJnxCIsc4IFhlIOaZwaQCqCgwNIwA?=
 =?us-ascii?Q?deGgkF5VfT0gjoM+cgKh7XHZ7We6P4/hAzgCn1SjHhQjyI3v5w5e9hnZoOcf?=
 =?us-ascii?Q?1rY+WdRVeWhqjueKfbLiqCVH8wBPIl0EZFtSl4KpjD9vcirqtK/LE8dQrJ+c?=
 =?us-ascii?Q?oYzOGxe7mmeBnPxLCxyKVGhiQ6x58D1Lr3AQVZp4px4YKuQ9P0k/MP5vsM4m?=
 =?us-ascii?Q?G+dk0AtwBZxIlKT4gdfhY9H2zo4O3d1IdwbGpNk6ElEUHp+X7JpvWz74lsmr?=
 =?us-ascii?Q?6yF0LsuBSIzdoq/5UycpxXf2l2Vkz77g7oxfoIzuvm2W7uLvgz4wUrsGoUUN?=
 =?us-ascii?Q?KfzY+GwbtnRyF6yQsaxrGaAzVzRk47zetsxd9Vn2d4N3h5e7AZ5ofELdCvNn?=
 =?us-ascii?Q?QxXDE09WVzEoQ2RkkCj9YWZPd1wwl7fzy3usKl/rIydTkkprRWjmZxQJxL4L?=
 =?us-ascii?Q?yE8+ZtTYAOHsOS5IFfRN6AjZm+lAhJ+CuVTedPCgfwPsGK760l43r1axpOHn?=
 =?us-ascii?Q?DcALk744R8NnVPL2OexzE44EZHpumj250wo4XR7Wc5z/jVJ3B1OyK7INXkdo?=
 =?us-ascii?Q?5v8HF+NTlT63Ty1000FrW2tDm51ZvqZRIt2iYgJj+7mG9a1wRDvPw0+uJM81?=
 =?us-ascii?Q?32KXQGoOCY+JSXLtmASVFQt2b0+Ar32dof0Y0X8Sajj932IRiBrL0lJKt8V4?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fc2745-38cd-4b0b-a5c1-08dddbed31a4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:16:34.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rppy/8R78ImTQh/YOu5eTGiIylC0Bh3rU65CFR+4IZjicWc/yeIf4cEYq2qqcWPtaJvyEMVFccjMhGa6DP+PhcaaNRSWu71JZjJEckqa0mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_041643_733099_B91FAE0F 
X-CRM114-Status: GOOD (  14.13  )
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

Airoha snfi spi controller supports acceleration of DUAL/QUAD
operations, but does not supports DUAL_IO/QUAD_IO operations.
Luckily DUAL/QUAD operations do the same as DUAL_IO/QUAD_IO ones,
so we can issue corresponding DUAL/QUAD operation instead of
DUAL_IO/QUAD_IO one.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 75e593a6084a..c18ab53149b8 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -147,6 +147,8 @@
 #define SPI_NFI_CUS_SEC_SIZE_EN			BIT(16)
 
 #define REG_SPI_NFI_RD_CTL2			0x0510
+#define SPI_NFI_DATA_READ_CMD			GENMASK(7, 0)
+
 #define REG_SPI_NFI_RD_CTL3			0x0514
 
 #define REG_SPI_NFI_PG_CTL1			0x0524
@@ -179,7 +181,9 @@
 #define SPI_NAND_OP_READ_FROM_CACHE_SINGLE	0x03
 #define SPI_NAND_OP_READ_FROM_CACHE_SINGLE_FAST	0x0b
 #define SPI_NAND_OP_READ_FROM_CACHE_DUAL	0x3b
+#define SPI_NAND_OP_READ_FROM_CACHE_DUALIO	0xbb
 #define SPI_NAND_OP_READ_FROM_CACHE_QUAD	0x6b
+#define SPI_NAND_OP_READ_FROM_CACHE_QUADIO	0xeb
 #define SPI_NAND_OP_WRITE_ENABLE		0x06
 #define SPI_NAND_OP_WRITE_DISABLE		0x04
 #define SPI_NAND_OP_PROGRAM_LOAD_SINGLE		0x02
@@ -658,26 +662,38 @@ static int airoha_snand_dirmap_create(struct spi_mem_dirmap_desc *desc)
 static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 					u64 offs, size_t len, void *buf)
 {
-	struct spi_mem_op *op = &desc->info.op_tmpl;
 	struct spi_device *spi = desc->mem->spi;
 	struct airoha_snand_ctrl *as_ctrl;
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	dma_addr_t dma_addr;
-	u32 val, rd_mode;
+	u32 val, rd_mode, opcode;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
-	switch (op->cmd.opcode) {
+	/*
+	 * DUALIO and QUADIO opcodes are not supported by the spi controller,
+	 * replace them with supported opcodes.
+	 */
+	opcode = desc->info.op_tmpl.cmd.opcode;
+	switch (opcode) {
+	case SPI_NAND_OP_READ_FROM_CACHE_SINGLE:
+	case SPI_NAND_OP_READ_FROM_CACHE_SINGLE_FAST:
+		rd_mode = 0;
+		break;
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
+	case SPI_NAND_OP_READ_FROM_CACHE_DUALIO:
+		opcode = SPI_NAND_OP_READ_FROM_CACHE_DUAL;
 		rd_mode = 1;
 		break;
 	case SPI_NAND_OP_READ_FROM_CACHE_QUAD:
+	case SPI_NAND_OP_READ_FROM_CACHE_QUADIO:
+		opcode = SPI_NAND_OP_READ_FROM_CACHE_QUAD;
 		rd_mode = 2;
 		break;
 	default:
-		rd_mode = 0;
-		break;
+		/* unknown opcode */
+		return -EOPNOTSUPP;
 	}
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
@@ -711,7 +727,7 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 
 	/* set read command */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_RD_CTL2,
-			   op->cmd.opcode);
+			   FIELD_PREP(SPI_NFI_DATA_READ_CMD, opcode));
 	if (err)
 		goto error_dma_unmap;
 
-- 
2.50.1


