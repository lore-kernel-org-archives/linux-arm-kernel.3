Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C254CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QF4cS4HL0Tbq6Ho1SuwttYdLot3XiUxvW0Bn5xz74SM=; b=kzZkxGH7g5W0x0R0AgKxG8byDi
	HLzJDYP0YxEOsOjj7F9R0DeAwBvUwKU40DjlqxvAht4X8p/sk7exaJb9Ev65J7hQU3GbQP96lBWFm
	fmxfTV4+pOhHDX0KBJ2joJa8GV4f9utsDANl6uAhXWUEiNb8w0cj4fcj5ufgqsk2Hg63cbOqZNMnx
	6ErWjpKcmJw5ryFwSM3Ht53Xa0cH3Ik2+E1prfTnfi9cWsMrJwgQFcAJHFtHwz7tZL2rTTXTNdXsh
	aOE0FeA/Xoo6fjvxaZ/RIyeYWEHwyetiFKmyKGfnMw0Hqzb+r0UjMbCzXiO3HysgjrEKpGZRowo67
	osQskwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEmV-0000000DdfB-3xxR;
	Thu, 04 Sep 2025 18:33:59 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAsd-0000000CBdZ-46X5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:24:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuuLRBZ3Tg6a/kGv0MptlnXNctC9YaIzvWcj8kjSfAsoYI70qLmJZhTcj0/JgshyLSwr3/NcxRa/VNgPAU4HNMJKxKMtmGp/WAFds05RQeoBnvWe/M33mXNlInfjdxr9YMSj7QwGjIaaSvE5ldj51mYv08vmYd2t2phUb2b+fsrDRD14vF11b2r4R4yrj42gdqh+w2e9heM26tq08A78KC32nMLpqLAkSFke/7W2fHFTvCxF+2atb4571yGciw+CqWuPiZsfvx3H0nRPkgjp8e6nY6TLx2f/uIeexwWW6XrUtKhA4iJH0otzCbKVoOfnSgh+79UrLYZiR/MPmd8EwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF4cS4HL0Tbq6Ho1SuwttYdLot3XiUxvW0Bn5xz74SM=;
 b=mjcFYCyWu7K79tIzvJ15Y4A+/RlEIJzK9q91Uy48bzsHi88f9TcWQngGpFTmnzQYivrSlaInsDFnJO56f6lgsnc+gcS9jK5x9M8TyhJPGSU6t7xt118UUSnVBeXx5gACeHZ2jgzW02h2RZ/g9LqrqAjk07J/jlRn5zUrCnhfs80/Y5wUddndTuJVgP541cTMe0Th1ICcGtQxI3kpnNc8A90Rwd1VLlF+lDniKrj79zg3o1OaKv4IPxRKEpbagajy3O9y3XIkp59xAlS9yBjXMmRibaBtd2JhnwcraqU0coDV+kYqGr9Srsg4TkW9ZPGLGBLXkFIM2Y/rgqeLMsrbqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF4cS4HL0Tbq6Ho1SuwttYdLot3XiUxvW0Bn5xz74SM=;
 b=dayrFUtGglf6RE+GiJksZ64a+Sfoxa905Oo8nD+SmYGr6+ZoFKkbLDcpb3cb7mZeItPGq2VZ0QjivdINbWuGaZiev6braZ8SppbbBnabWBdIrJGd4kdE3nRczIkw2EIzTuHDyJpxhY104f14gc5brNbWy8x0DQ86cNhYxaac22eMIbzQ35gvg2nzXIuMz+oNSmYbGRRl4klhnFb1dOFrnEoLLoRhdlfP4IJsgpK3y5wVI8IDoKm4kz1mNjQjAkeoFcp6fRzDGryWF2qBJ0483e4lnMYamSzFH4hhkvd4nqpKRAWTZsoyGcbU4LDvxlDVg4PRO+23y8VIf8vUhD9nuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAVPR08MB8992.eurprd08.prod.outlook.com (2603:10a6:102:325::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 14:23:56 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:23:56 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v5 07/13] spi: airoha: unify dirmap read/write code
Date: Thu,  4 Sep 2025 17:23:33 +0300
Message-ID: <20250904142339.656346-8-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250904142339.656346-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::15) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAVPR08MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: e6412d12-0f77-420e-8421-08ddebbeae8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YzPyPL5VlsJZ41uhKOxAAjzIj/DnCZ8Eqx9zifaDjxXDo0AVc1AyJ71RAW8i?=
 =?us-ascii?Q?4vKfZxFI77w/JxHXZinSYQcnVEgdBj5eUWT9vIQwfcIMeF2xW5XaN491mb32?=
 =?us-ascii?Q?6oe+atdjLzi8W2J1TbCYG7csuph2hHV/ewP2+RcY3XGd8df2oSWX+gAMwiiv?=
 =?us-ascii?Q?iI834kOuCjLDSvmHFlrA5IDB5VSHErN4SqXLr0FjIIr/aQdJLBQWUi2buetS?=
 =?us-ascii?Q?1GLqUDT9/t/a8RkLWrQchTMRL1Wajz6zjSPQh8JC4bCOO7puWSUkyGPKAdiV?=
 =?us-ascii?Q?AH/KyWMHbWo0UNEITuzkx5DAdVpXRP3uzTY2kiPZdW7WjBMowYhQIlzIZ69T?=
 =?us-ascii?Q?7mF9N1RcyHVSz7mRplkVwRZgg7iizi4Jx/8tDiFg2BGvEPj6LajdNqXx6jop?=
 =?us-ascii?Q?TQmkJjAc5WItZHJOwALlZcn/7a+aWb4HjedRR5T3Z5Lvx7Jsd02QRJ6vzLB8?=
 =?us-ascii?Q?hSKXX+TVoPeIjINdx6NM+dh36kz2WinpCGQ3IPT59YT3urpI/lizo5+5WqWb?=
 =?us-ascii?Q?5uJ4ZZE2enf4eVAHtVsyCfsjwhowZnyY3flf2LpXGsN7RMy5hKGClY9Quk7H?=
 =?us-ascii?Q?m4lzHRODoF61X99ArenawCCj87qkBnfPj813ZBjRSkGOdPzBhj4B13ttdxBB?=
 =?us-ascii?Q?YP6DES7PmeHDZHgRv4o7Xzxa6IC3pL0xH/qQ6ri7P4iqQcxdETNTAmAzQWBW?=
 =?us-ascii?Q?/NEINb7quVcJDztJMlQf43fqFNHpfDpjyZc3DtYxyKvrVUZt5qIB4Grgr6lK?=
 =?us-ascii?Q?mAZxb24azMt+EnW/2fcmgbB9SKy2yrIIH2R7Dr+zJdCpvtBDHnDsQrqJtwIJ?=
 =?us-ascii?Q?LCpKjW/E6YdTuIP2Mm8onZACfJH3D1CrhCh4NjRPgoAM25iUnyAe6YtgGalM?=
 =?us-ascii?Q?cYh6G7f9npTLeXE25cIGsHCg+afYU1VnfFAwtZ9DbIcL/i4omkM0t+VxgwwE?=
 =?us-ascii?Q?8IwasNo70Eepv+OCPJUs9gw5+kzSFWkYcRasClL0akASCjiMYivp3TffNKXh?=
 =?us-ascii?Q?uDcKkVqkEe66ppmvTtUuXzOVTLL/6ltpVGW00L0zwF8g7FDJurRKofeMp42q?=
 =?us-ascii?Q?heBTC7Ng5Y0e99xE89Aem1YggC44U451+emc72DgwVR9fpCSHWCP39O+pWK8?=
 =?us-ascii?Q?r445IqsoerIq+KmYNaJKjLUWLUjgjG8khjvsCb6c4UtuofFEt2JHoejdAqYN?=
 =?us-ascii?Q?gfJxDroyNfB0sR9+Lbr8taknRBkNNOstnDaWpiBuiVdd5XpZSScQs/21xM+K?=
 =?us-ascii?Q?z4LZJo/8sXzUMGz9b8Rq+Q94z1slPGhfXa23gqyOHalfq9G+fqT2IlY1IDlZ?=
 =?us-ascii?Q?XPAWf3TMBaiD+wMClKiG2L6Ntu90gllU+7i/MUir/m9r6BMUUYFeRhAjNg9p?=
 =?us-ascii?Q?zVyeDZYC7gxLN9axFSGO2Pj+Gkh6R/R5uFPMlqYE8H7rOh6mjRhdHhS6Nb/r?=
 =?us-ascii?Q?bGHDUIxlbMmzOP9THhgJYiVA/V86v/Lwe1gkJdNgbf7dfrewnylgFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KXXMurEcHvR8eczB1xyqvBedlpN9et6Fya+o/DQ10zPUoASfjAD5sDapn/xq?=
 =?us-ascii?Q?YpxLJO/hz4ZxZqWL9ZA/wxStLTRK9aYTfJw6bPrNrgqOazgliX/nvQDzhxgV?=
 =?us-ascii?Q?cJtIfJiW74fYlY1znmtWLlABvN5vSPg0IsNkN/nNC0Pu6mEULc0is1ls9QIC?=
 =?us-ascii?Q?v1B25qdMAdXVTzRtOBW+kOU29bTGddIhk8FMCPj58hVJ7vaPKPZdLYV97+99?=
 =?us-ascii?Q?ETfkdvqVZl3hOc/XiI3n/xAodF9Ftv4C4uU6pMvocCk1RmknaEXDk0G0388H?=
 =?us-ascii?Q?S/V5lTv4AgELgAN18K+krELOeL4IhZhPmU94EPrwsVsmfYjLvznJsYfOnNa0?=
 =?us-ascii?Q?8w1aPeuGgKdTbPEl6YHnYQNw6iDEBC1oEZlyzAkmOKx2cwNhJSqLnVRwXwff?=
 =?us-ascii?Q?/01ErQVTMQFV57OtD45w3s6P/DxuOP4YlHGJwFd8Brsd1NKFiFCP8CZMwW4G?=
 =?us-ascii?Q?gIOIe/14R8sbX+zzE0lBj1z+EMxL9T9cn87ejv5LqWt71g7DS5z15lZ9AGjE?=
 =?us-ascii?Q?FxA6/Ogiy0uzb8d1ReJLC768skweEryFLFR3z3729Mre+jiheaHMFjqqb2iR?=
 =?us-ascii?Q?xusxXNB85L1MG4rhsz6Z0OZ8gADFIWgu2zkrKZOC2onhoYE0kCuTVpXPUbKH?=
 =?us-ascii?Q?HPaSf8B46SQAW9bT9uKf5FGJszmTXz3LrNLuLcJ3K/Atwx+Qs91/ECQvhBKK?=
 =?us-ascii?Q?5UsG7Lrtpr2FbZHimufZluNq3NwVziI/mrnfxkxEd9uJ0RoT9iZry4M00wRe?=
 =?us-ascii?Q?xDvjWgYnoR0XkAvHIsC5BlssQhDN9UYNk2IfNFuuVqSfTXHdGBxNWvThMhFr?=
 =?us-ascii?Q?5QwEGgJUcRm57DIdQYaTKEwpRQG66oxRIkH9YMPZP5N0J4Z/eJSw+2hmvT8w?=
 =?us-ascii?Q?hbP0FdMPXu6pHYKpaOxwEbMHGXQN1s55/o7pZIVXIABY4ex6x+H1tzvbRgoF?=
 =?us-ascii?Q?OJPqzCMv7VpMwrGfRD7LiKVgIwC9/ibk/6h6LMEnNTZ5c1I9RgR0KVtL14RW?=
 =?us-ascii?Q?hlKFDXUaurHECpdWWWIHADZoKWFomLEkm5CMI+KDwLH0/Z03CPn6ZCmceWBd?=
 =?us-ascii?Q?KHBfsKsPfyDB1x/TqbNAmvFnuDxPG4BuQ6C7GX5nPDi1BK6KlVuHeqZ0mQra?=
 =?us-ascii?Q?1PmvViFZ1zZy6alOcdwFdMff8xVG084jSuMgYZufzaXy1Cb5ug0aSu3FeuN9?=
 =?us-ascii?Q?+y6bC8FV6YLcpheBfDreqh/KX7AEtVqphnLxoEMJuX//Fn1DpiyzW6uPmN8v?=
 =?us-ascii?Q?7p6T+HfabodgMwnX/f87UUx1LP+svc+bxJ8DUM8kPi/ObGSK3cfgg+lgzpPk?=
 =?us-ascii?Q?CL1tPOPlUpOePIEqzQ76mlwV8kIhxE4Pigxp55rxc0KR5T7MZ9FXfISfJS8o?=
 =?us-ascii?Q?rl/0trus03rw1luE/yO3SlMKr4w4MpXmI0KIa2ypKNgnj+Ht+ZpgV1jZ/8lE?=
 =?us-ascii?Q?UTWkn95YJMgkzs4HFXA/aUc6AoUILbQKHeLagQUyAAVVB9hAyVyVBLYh5XIK?=
 =?us-ascii?Q?owic37IqyKX1ysNc2qsvgMtoZojOlgaNg5fWwJUa5ObvLbbfgIA/XcF0QAZL?=
 =?us-ascii?Q?XY7GYxPrGK2dko7DecMU0oSBrWKpWSG+cgO+VL1adUO4Z1HkR1bBlv8TbNXq?=
 =?us-ascii?Q?4QTSth+wsMLcHJ1k5vGdbxc=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e6412d12-0f77-420e-8421-08ddebbeae8a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:23:56.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GToj9Zm41B7ObaJFzT0sWSgxDrxt+wlZcqovsTSKjz8oC7YWpztsWI8wulPOw89AxC71sUSMVvkAgX/LT9vMjnW3brbQ2GwbSlvCEL166mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_072404_019587_6776E2BE 
X-CRM114-Status: GOOD (  13.67  )
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

Makes dirmap writing looks similar to dirmap reading. Just a minor
refactoring, no behavior change is expected.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 50 ++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 5ad3180ac6da..e90fab69d81e 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -672,6 +672,8 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	u32 val, rd_mode;
 	int err;
 
+	as_ctrl = spi_controller_get_devdata(spi->controller);
+
 	switch (op->cmd.opcode) {
 	case SPI_NAND_OP_READ_FROM_CACHE_DUAL:
 		rd_mode = 1;
@@ -684,7 +686,6 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 		break;
 	}
 
-	as_ctrl = spi_controller_get_devdata(spi->controller);
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
 		return err;
@@ -748,7 +749,7 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
-	/* trigger dma start read */
+	/* trigger dma reading */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_RD_TRIG);
 	if (err)
@@ -806,37 +807,47 @@ static ssize_t airoha_snand_dirmap_read(struct spi_mem_dirmap_desc *desc,
 static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 					 u64 offs, size_t len, const void *buf)
 {
-	struct spi_mem_op *op = &desc->info.op_tmpl;
 	struct spi_device *spi = desc->mem->spi;
 	u8 *txrx_buf = spi_get_ctldata(spi);
 	struct airoha_snand_ctrl *as_ctrl;
 	dma_addr_t dma_addr;
-	u32 wr_mode, val;
+	u32 wr_mode, val, opcode;
 	int err;
 
 	as_ctrl = spi_controller_get_devdata(spi->controller);
 
+	opcode = desc->info.op_tmpl.cmd.opcode;
+	switch (opcode) {
+	case SPI_NAND_OP_PROGRAM_LOAD_SINGLE:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDOM_SINGLE:
+		wr_mode = 0;
+		break;
+	case SPI_NAND_OP_PROGRAM_LOAD_QUAD:
+	case SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD:
+		wr_mode = 2;
+		break;
+	default:
+		/* unknown opcode */
+		return -EOPNOTSUPP;
+	}
+
 	memcpy(txrx_buf + offs, buf, len);
-	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
-				  DMA_TO_DEVICE);
-	err = dma_mapping_error(as_ctrl->dev, dma_addr);
-	if (err)
-		return err;
 
 	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);
 	if (err < 0)
-		goto error_dma_unmap;
+		return err;
 
 	err = airoha_snand_nfi_config(as_ctrl);
 	if (err)
-		goto error_dma_unmap;
+		goto error_dma_mode_off;
 
-	if (op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_QUAD ||
-	    op->cmd.opcode == SPI_NAND_OP_PROGRAM_LOAD_RAMDON_QUAD)
-		wr_mode = BIT(1);
-	else
-		wr_mode = 0;
+	dma_addr = dma_map_single(as_ctrl->dev, txrx_buf, SPI_NAND_CACHE_SIZE,
+				  DMA_TO_DEVICE);
+	err = dma_mapping_error(as_ctrl->dev, dma_addr);
+	if (err)
+		goto error_dma_mode_off;
 
+	/* set dma addr */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_STRADDR,
 			   dma_addr);
 	if (err)
@@ -850,12 +861,13 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* set write command */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_PG_CTL1,
-			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD,
-				      op->cmd.opcode));
+			   FIELD_PREP(SPI_NFI_PG_LOAD_CMD, opcode));
 	if (err)
 		goto error_dma_unmap;
 
+	/* set write mode */
 	err = regmap_write(as_ctrl->regmap_nfi, REG_SPI_NFI_SNF_MISC_CTL,
 			   FIELD_PREP(SPI_NFI_DATA_READ_WR_MODE, wr_mode));
 	if (err)
@@ -887,6 +899,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 	if (err)
 		goto error_dma_unmap;
 
+	/* trigger dma writing */
 	err = regmap_clear_bits(as_ctrl->regmap_nfi, REG_SPI_NFI_CON,
 				SPI_NFI_WR_TRIG);
 	if (err)
@@ -931,6 +944,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
 error_dma_unmap:
 	dma_unmap_single(as_ctrl->dev, dma_addr, SPI_NAND_CACHE_SIZE,
 			 DMA_TO_DEVICE);
+error_dma_mode_off:
 	airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
 	return err;
 }
-- 
2.50.1


