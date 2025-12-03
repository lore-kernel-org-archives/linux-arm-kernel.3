Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07021D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsjHYHNLwrkWNxGNsJ2qgEZe4Qdgqq+BoLSOrD9LpHU=; b=YSeN/zIIopFl4VviMO8gxf4FbL
	42Pi6EZpoIt1TkqSn3Dae6w93FpwkOTgi3sAC7P3yyRS+//nqw5dbrN+sAQpvBbHJj2wHFdQIBHfS
	XN2uzmw0afw5g/fS1nCry2J7jhEVdzRjya4qGa3uJU2qVpFYrWmD6qh2OmAJovoDaEUNWdxLWKfep
	g1G4IcE5SgDOcDaljcgFE0SuhdB37coXhfRmyG4ztdy3FSK5shViZpebUa91bwDJQOzmTX0sTvP4z
	PJdKqP5BsuT515CD6KE8HFSOov58fG78EzH1rqhd5ignGEcaPu0aokeAv9nwSYj6hUK7JmtqbXqxu
	iIHtq6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQij1-00000006LPn-3lqN;
	Wed, 03 Dec 2025 09:00:39 +0000
Received: from mail-norwayeastazon11013022.outbound.protection.outlook.com ([40.107.159.22] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiiw-00000006LMr-0YMK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:00:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuS4L2nhqCWpHfGFxBNsS8NR5+a6fHPOhu3beb36NcEcn3IEQiohRjEzPmO278vH3eG3Du7EOuVbR1+8Kcd4cSpET35ris24VmnYM5CUKwZolBzct6UwWG8yfPt8sSehTiWdfIOO0+AegNFBuGeC+n5Po6+ubDVBVqAtx66XLJygTedcwl4BzN0D3sFhZoaHAgKT2evVonfJ7I64zMcqfuurD3tSkr5LVRp7rz8p8q0cU5bL2aX2tfTjW5jSNFyfN74R6P+42eFMZqhhhu3TL7ezex0MHG1Db0goVstARqvl+18WWEUAbt0gq3fyyidiRpWOkgyL1U80Pc3gdiz+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsjHYHNLwrkWNxGNsJ2qgEZe4Qdgqq+BoLSOrD9LpHU=;
 b=mN/MIx+LCt0L4Bh+5lGbG37KzmHz4z8QKjpd+VnwLxsDr7XQp8nbZA9i1cQj3ufiQ4tZ3qROdoUfWO0K9waLS/xgox31xif29zrEhE5ByDBOAcBtvdY3m/0dyt94dIGi9CCzDWER5a9XC1jJ+3GPXuHhWYZB1nfyUdBK1LMJfU5+SYwbaDNj6j+KHTmFLNxeCD9HAL547ElToMzuqkt2UrD+BqiW1TcG2SAKJNb43s6HbvPtPo/8mfNqom9VJKSDQdBa8oxvsUcll8Mj4B5zRQzvQPTbWNxK/bHC2DynEBwrJqjjzc6g0RbrjgNe658A1TyXCmEY1ZPlhlkA/wdvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsjHYHNLwrkWNxGNsJ2qgEZe4Qdgqq+BoLSOrD9LpHU=;
 b=Tf81t/MOGIiOUZtJ1Le0AGFMV8EJvs4VjzfV9UTxnpKiE6kU3n1Du+PlmWrJpe/3Xa+jd01rn074xGk94GTVzYeUOghxaYp/oowIvuu56o8gEzHf9fBsezdEYCDvFTlyvh1f6JtZtb5VsjTXlaMOv0z2ZuVZoO8vXoHJ9FZVXGJSOpvwK0uJy88oo/I+8KXfuswQ/CHU5DszqqnV4JDYX5EicF+met9bngze0PgOld9JSD5W34ggs8wLSLJz1N+sZ9iSm6k9465OyF39G3hpaVPQCvdhYWqRLfVKRASXQDF5yvNjh24D/mBN9OOsv615wGsDVHFGIPKCsL318wSehQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM0PR04MB6868.eurprd04.prod.outlook.com
 (2603:10a6:208:18c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:00:30 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:00:30 +0000
From: Carlos Song <carlos.song@nxp.com>
To: frank.li@nxp.com,
	mkl@pengutronix.de,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	kees@kernel.org,
	gustavoars@kernel.org
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 3/6] spi: imx: avoid dmaengine_terminate_all() on TX prep failure
Date: Wed,  3 Dec 2025 16:59:46 +0800
Message-Id: <20251203085949.2922166-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203085949.2922166-1-carlos.song@nxp.com>
References: <20251203085949.2922166-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::27) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|AM0PR04MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ac0ea2-a8cb-4141-3b6d-08de324a686b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5pD/03z6XvA8nMlEKp/HU1fhuwuNoTcW2g8sBpHjeeCPbmTYAMTKmlvCrEN+?=
 =?us-ascii?Q?KR0PKDl0xqFLwIPp9SFwIJajP7PlZxKcwOyn9kuzs1uXaPkHx/pR1XzdD0JK?=
 =?us-ascii?Q?SUCHW30LSZ9jTae+Mcm7K008OPKnaPIHabPFMND4x68DfEP+5SXuT2E5RT5n?=
 =?us-ascii?Q?xQ1itxX33+2dm4LwLW+vZEp5LNYDO7PstS2r8kg41YBegefb4KLrf2zkoMyA?=
 =?us-ascii?Q?nNYCLjm+m0T2CBAOpq1uazcadULv1mfaxUk1gQ2iyXSbp0qOKD5nvqtmXwy9?=
 =?us-ascii?Q?CbZlYfspJyz5WHwpRz/MK/K1dRTMRVxawTLXhDrXAv/da5jJxQYtEGBKgdNf?=
 =?us-ascii?Q?oMXYb0sZyfxCFZpxm9hvXKVRSCkkmmxLNfizEsZzSk5btcPhC7RIEqxmVjAX?=
 =?us-ascii?Q?7tRtxAaHs4t/cgaouAibpirxjwhTZBNbTi1k3rBmac1FpW5DsrnkobZiKxpF?=
 =?us-ascii?Q?vyvVggu7ApVomJug68EUTqF/tFEG4Nyxx2mXPn70w6ltI2r+djkh3Sn9rXgM?=
 =?us-ascii?Q?dlmKuBEvDr4aTsERHPa7zywG+bv24WfApLdwyepnp704kipoHXjTDCdqjspZ?=
 =?us-ascii?Q?8H2VNDOPnpNZ2G64NPRmGNz4dPP1WtAA86b/CLTiQwZU3jrlCBplOenpEO5T?=
 =?us-ascii?Q?ALPguK6zx+qPRFtC027i7WmLtD+PEfD3C+hCzDgUqS8vdydyeLALmUUEC8AR?=
 =?us-ascii?Q?MkXi2aMAsdtNFqcWxLvGFiNpCcylGHOcsJXgj4CSwjoezmJ77wAx1JKpDCMT?=
 =?us-ascii?Q?0XFfuxAVJ1QiFhP3Pbn0RbapP34siZUffJGtgqjSVFRj6doHTpkaXELLItuP?=
 =?us-ascii?Q?VD9l/ys/CTM8Mfw9LOK81/g/yzYzNfRaMcUJOi6l75nn4SLUPvXvSE3C6CQ4?=
 =?us-ascii?Q?r0/FcM1uacUEfqo3GFF0n3Vubacga7Qvi41ulqCdBBnxEF2F7sNoWUzgwV5T?=
 =?us-ascii?Q?vUEMxuAD8O5MQPKSusLxBb7AKeoQbjB+d/K+AXuwc6T5CHVRjmETbWMwGnhc?=
 =?us-ascii?Q?+JmH4bsUehg3e6GZIYzLYlvqbV5wx3FbPjS0yV3fQ41nrr257nnZmhJIu+0M?=
 =?us-ascii?Q?aEwp0aO9C08XIYghdadP3SZzWw8O8xjeb/AJy4lvp14i+Ftdb8JZ0uMV8D/8?=
 =?us-ascii?Q?YgeXjnb1NhqxbyI5+dicKtoyJQNaEsNPACq7O6elJQN4KxL8OpGaKw+J2gAO?=
 =?us-ascii?Q?Qm0iMGbd9Q4GvEOUwdYtY2grGHQVZrINuYaIzBnrn3wXMjnb9uquH776A/0z?=
 =?us-ascii?Q?XMEXHsNHwCcF6eeeGedt+36fUnbS4vD6+k9Org7GBhh2Yn5TIlQ83xz/Qhq9?=
 =?us-ascii?Q?YW8Owlx8C3lml6sweeCc3Nl2f7PQvPKQLS95l5/u5BUrkvcsSUdjBkNi+Wyy?=
 =?us-ascii?Q?F63y37sECU5zf+8kw4GXX9CzV6FH6Rfboq6t1WRq7ruyuoLEAa+M5fduwHdp?=
 =?us-ascii?Q?GcG/wvNf0gzpZTvHh03Y+FCeDdGjI6dk+yCLWbG4zrFWHtBox97eBodp8ikE?=
 =?us-ascii?Q?M7Khijy/7t2+HxAhPtWUHANWxtM85JCc2mf/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mkNhxstFQyfvmUqop2QrHlxeKXH2Shn8u6Fa4hzoMc8sqIFhu/hY5fQEhRxv?=
 =?us-ascii?Q?BPZ8vVHzyvvduS6dYoE3y6p5XfLKmHAUejBfOROuBMEWntKSNmgKZELH+Lji?=
 =?us-ascii?Q?ZXuRyYPewia6wuxtp8MPPoGdQCq6kxNG6fi3h+SYGs/QHvoRD6GsC7LVi2DZ?=
 =?us-ascii?Q?J3GD28203xMLp8mzFtqQRQczZRzXpJTLhDtvGUcourhQi7LNbIqWlrLPYVSM?=
 =?us-ascii?Q?f9cV1OMs/DT3XlPDMtY9UoUEzIjRFu9DMzPMxR66D8AaiDwciCoQ1YdR9rvN?=
 =?us-ascii?Q?DWeNYASaJH1g8FXWUdvrSJypmr1UvUNoAlqX0+C9VccY6tePFkmTXV/ul9Ch?=
 =?us-ascii?Q?lVxWISDY67PBhSRy/MkYgxMJkfmImdMu93DZ3v5XbhSZ9ZuPtAZuI+6vkEYi?=
 =?us-ascii?Q?qF0L1+Dp+sG6dtQLlTq3NFMNQD2wEp7smZRHRcOxdlnjDDhehFffQWyjxdfr?=
 =?us-ascii?Q?Ts5/iQfdaa323yHj+oiFM1zvYAECYboeoj39pd7Cm6bajVLmQ2BNUTKbkw1K?=
 =?us-ascii?Q?B5e7ITQIocx8bx9+BAwwQV+nNCLw/e0cev1LzxZCLs3UiZSQanAb05cqJPiJ?=
 =?us-ascii?Q?07N8CNqcKPOsv+H0389ZntXdv1v3eA4YT3plChYF2rK87XSPCMhL4oMjzujr?=
 =?us-ascii?Q?3TbnijjyPFRVethzV03sRIIwu+kb5fmqKRRW5C7L008MhQbOO57zZx/MTLk1?=
 =?us-ascii?Q?nwa/okYDRCiRDm6K68SPkHnvmsrVuRMDvuG45gDbYeFtc9L62S4zXahmyAzU?=
 =?us-ascii?Q?KT+g2d8tbUkQXNqQKjTE4TlKGhjI7AuW4MlgfGaPFTfk7cIOsjFJfL6SuP2J?=
 =?us-ascii?Q?VYZJNdRmPNeNAiWDlLvNk5Z09t/1UWwnLmFT8WuPY6tnyCSKjdyl3D467Ph3?=
 =?us-ascii?Q?GbW7tmuTmpUMCanzBN7ma1sSu1tWojy8ywfQl6K6MF8GSWRS49YGaXkaywJs?=
 =?us-ascii?Q?V5Qf5UAdtwApT8GAphQkJFBAeUhnVxQL5bnD8Dwj43JeFFRn/2VMLR6HYnpW?=
 =?us-ascii?Q?hcafRMc2I3VloJFUAHnSnU+t3LeFdbQrwSMfBTZUFmYSCOyPU5RJ6WkcNapk?=
 =?us-ascii?Q?Y0fpW8I5B3byKjawpa13H6kGJzOCDt0jGQgxMSqmCvhKCEjPkBf1XrfNDeks?=
 =?us-ascii?Q?XjUid9o3ydxXhXr2IYTJzKKZD2HW0U6N3XM5qA+3YNDuy0nZGW7v5rl0MPDq?=
 =?us-ascii?Q?xAxPfyzcpS1J4sTqvuAlwUukgryzYdrDOYgbdB6aCNjFFrF5RaI+g+flZbF1?=
 =?us-ascii?Q?TyKPc/NT2SBVVTGP8cSMGeaQ5tsQHCjJdlCo0KBdpk7r5LQtBl1hVy0eAia5?=
 =?us-ascii?Q?00/GA2HN85+5a3hWBW1N6sWl8zqKgPScWKV7mDKHxBPknChS0ksAGKt+tAbI?=
 =?us-ascii?Q?4gQ0GSKchO3umLTb6psm+QNKhFvFlD9ZtlOTSSg9rtIntBr+C/ioX4RL8XhF?=
 =?us-ascii?Q?OHwNq5pUK56+UhaM1ik+BIV8T1MNEGNL4WPD4ogENwAVwzfQo0BTAoLyEFuH?=
 =?us-ascii?Q?sbWNtHfxkS1S1npND3M8g4mb/IlOyGm0MlXIDYg7OC8uy0EhVAWO/lo4ozkk?=
 =?us-ascii?Q?WxvQzpqLkvejMDFNi/bqcbKOh6tXKNDo514oM4UN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ac0ea2-a8cb-4141-3b6d-08de324a686b
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:00:30.2441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzyTvFYNdy5mfMQXdXUxcf4PnIuSE4GfhhKP5msAalmV5WmhS6Eaj7rf7yo5WNZYql0qhLdK1W+dm1BZ70EF/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_010035_305824_8903641C 
X-CRM114-Status: GOOD (  10.37  )
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

If dmaengine_prep_slave_sg() fails, no descriptor is submitted to the TX
channel and DMA is never started. Therefore, calling
dmaengine_terminate_all() for the TX DMA channel is unnecessary.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/spi/spi-imx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 012f5bcbf73f..186963d3d2e0 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1468,7 +1468,6 @@ static int spi_imx_dma_submit(struct spi_imx_data *spi_imx,
 					  tx->sgl, tx->nents, DMA_MEM_TO_DEV,
 					  DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc_tx) {
-		dmaengine_terminate_all(controller->dma_tx);
 		dmaengine_terminate_all(controller->dma_rx);
 		return -EINVAL;
 	}
-- 
2.34.1


