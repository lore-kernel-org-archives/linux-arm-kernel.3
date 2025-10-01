Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46953CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 22:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHZ5zpP9tC1wl8ucs9JOwOjBMT1xIexdwM8R+ImbukQ=; b=X5gJ28aqMNrlX1jgLGc2EGJEmO
	f4BoHyzMTVsUYDoxihfgKwpr3cM3xnTgSstPUtKdzM2vF7uV2I6mb3uxfGe8+sJfX64AHEKMDEta1
	o1sd6yfQSVRs0VLVZLb5D1chahGld45R4ippnzRApUYwTUGP8f3EmDEJ3aOzfCiLoAoFjKov++Tqc
	eSWrhpkR8NdyHvqdCuko0luzziHej2039YAoycFa2qZRFixR1VSCjI8pgU9oE/N9FLe8KSomUW7ke
	jVtbIno17+beZBxNn9Yjo/lD7NHUoc0Msdyr5a4Ql2XWirEGoECPAXBYdzA8CUARwvN6dGv4xXsRD
	vyLG0GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45Ez-000000098jP-0OAv;
	Wed, 01 Oct 2025 22:24:05 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v45Ew-000000098gP-1pYC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 22:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A00TqnBT9WmCMkp97v6Gwmibpt2sSfqWWHxNyOa7uu4gWlTyB3YCz93UXfdhXsi4+Oi11wSIHhHU+mkM5w9XAgwyD5P5gXvnTv52fzTNsBCe5/ytgGAL0bkXYW+4QZFBCf7/i5k3ebx4Tc9+Jhff9Idrx+L87L5X3KcmgbhPsCacIZ+IJb+kQ+eu9tY43Vpfy5MWye1r2EHj7pUnFUA2Az16o5NIwIVV7M63k3QSmhXYAp+FviQFk+2wUxJxbG+CfbcNUY0Pn+udkJbAM3Cva3dOR0nT26buhbGdrsO0AK6hm0wCOPzbgvy+2ayEU5AAzMLjjoOEWTuU3V+zb8nXBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHZ5zpP9tC1wl8ucs9JOwOjBMT1xIexdwM8R+ImbukQ=;
 b=No24jjQhygw7ZSLah6tFruzSpL456VF7D9EyWhyiSb+EGty8yTqgT6X9zzwlNMIzQadr+6ILJRgY0aBa3f60rjagay66w6Q8B91CEAh5kHse5kQw5Ysokwv3hqFB+LWbAYe9nbr+1+Vhzs1SO/5zQajj25Nv4tEWQSH1+m7eWRwXijD0ZFt1lNNZbNmSuA3imvQD/Q3w+BZFFGMukxmKlaR3lf1NxMjhUF8DjlG6Lajzatygwa1zWGTvygjvN9o7D4Ork4tN+/JxNroerY8vdZ7U2XBr/MJ3NeE6WjofXsveamYSmN78FqAIpew1CywaluaV/K/bEPLbH54B2Ph7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHZ5zpP9tC1wl8ucs9JOwOjBMT1xIexdwM8R+ImbukQ=;
 b=Ntw69pbp28DeBTheEWQA1imcEb+/AeypyDnvOiBxnDu6OqRMQSc/Gn+9DAE13+/lOu8zgjiuNYOe+hfnsnPCT0UP8hPfdjxG6IYqCO97BE+CpaZxtG8rS1wu3K4sSp3WK1syzmKJVuusCCgS+dg46qda8FagswS72sXfs0ZNW88WnWUj+SNBDpSpB2pCOmf2kNQl2KOTFL0EmuTTgfNofgiWpu0ZxFn3gg35smAmq+ZMF4MAsDS6DHBYSIA4/9Enyi1ZsNGYfx3Kzjh0CzY7YFLYq3BZ/Rz5/jQ1SKkJndq47Ba3uPqkDapRdZ731TLnLpHi+DeONPyBEkpdlP6IOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PA4PR08MB6302.eurprd08.prod.outlook.com (2603:10a6:102:ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 22:23:55 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 22:23:55 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [PATCH v6 01/13] spi: airoha: return an error for continuous mode dirmap creation cases
Date: Thu,  2 Oct 2025 01:23:34 +0300
Message-ID: <20251001222347.3386506-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001222347.3386506-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251001222347.3386506-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0447.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::13) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PA4PR08MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5579dafc-e1f2-42ff-db7c-08de01393590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pom2IXUAGY/sCutOYJ6njLN8+/8VUr3ka4FyZDFpNSM6g3Me3uZeD9+upoy+?=
 =?us-ascii?Q?2UTxK/BTGyrGu2nD3iVs/OY/t9gjurk8lmCYrXZ6zc+7CKoWSGPCUS8B44Lw?=
 =?us-ascii?Q?bEcGBB00snPaemGb2NyuUc5tEPUF2w6UMsi9Il8tgKGssODno//BvxuepTzs?=
 =?us-ascii?Q?UjbR0sPJWsn6gbUWBDUCSpQIFIeBXfXhjNS1nZK0bAHJX7uVmBlTSFdkQ8ZQ?=
 =?us-ascii?Q?ZSmuyqCcpa72vOEuCNquK6lgS8J27K9lXda8MrPTbho4kfHLOFXBak1fQR3A?=
 =?us-ascii?Q?QakYEWDA8ZEkNhQtHvKdr4YKONUsbffA22KqGOYAfymMXII+WMb2PlzuBvl5?=
 =?us-ascii?Q?plcfNyOPQnZDRFjORP9Yvp55ZYq3XRp7rQOSqHeUQFJD3Ez1ab19+oR3U9rI?=
 =?us-ascii?Q?XKm+IFVp0Ur4BPbuSvkjpq8QDaXCC/MwLcDTwwKeOA2hrXo6l8QG2mf+XP8O?=
 =?us-ascii?Q?VJQXbLrkVuZQCKSVbYt10j107cWkef3rwostjSFZpUD4W9hVwmMP+51xbsDI?=
 =?us-ascii?Q?gCIT7YberPRlICy+U+0iCyGnehvoZH7bXavVDMkpHiBCV6LdKs0QbUniRhk9?=
 =?us-ascii?Q?3k+/pxq8KbDTmBLMlPBjc7WaaSg0WFqvL2Rla9goakHy4rhEfI77egjkfwra?=
 =?us-ascii?Q?13BXsCTleeW6yZORg8STWgI7OgXLRbJHKIeuHY22aFYONuU0dHWHtBG/adi/?=
 =?us-ascii?Q?eyVeYeSh5UuXSzSgfd660rY77Jxz/jskWO7AD2Q/lus2b3KPxTeJFjMuDgaQ?=
 =?us-ascii?Q?6lbIaGxGX1A0kvrFlplz+YGDYrsQEUxOS5o+/R/GgQBSpkFoecP2D40jfFyy?=
 =?us-ascii?Q?1cj84aU8J98R2l5Mq4s7BDuyuXCGrPXgF1vCcN/L18JEbjrwpuTptsDO0tA7?=
 =?us-ascii?Q?/7H5OqyPewTEgg15jPRQ8gCFDdoOMSi6s8YhsOlMBL9z7GMtP38yee7D5qM1?=
 =?us-ascii?Q?Xj0MmIkEfkNySXRpVEv/vTSaxtPw/gAdhSlt4GuvNdLcUMRvfRJVVpKSYy+3?=
 =?us-ascii?Q?5efRvYY6NUxyVnG2keIx08fOw+UZT9MVkffs7TLqJMlgtWdkKPSQkHIcCPsI?=
 =?us-ascii?Q?ENyXUxijBCadZm7VBxNv0TTZv0bj5bOSMPky1H36ljZ9jQw5318Jdff27IWC?=
 =?us-ascii?Q?wFcfTC1PrSWyGd9T0IeA0NyNRlQWoQ5UC0WcDLoG7kaxS5tYBbRZdg48hu/d?=
 =?us-ascii?Q?ALuFz7ch1VF/Xh1TJeN46UkU24OHCX8qtknj2TQMZtthXTQD2fpeS3N2k0lV?=
 =?us-ascii?Q?NwxhkalshY6lMmJJQYv1CPEQ6AkeHsIbLV6muCr0ASwt8QPaKiCKxT0fGAT4?=
 =?us-ascii?Q?1BwafQ3nvsIU81+0Ab4//omXVhRLKmPKtZig1xWEib9A5uWxyDRroGcWVIcO?=
 =?us-ascii?Q?7ZEeGh3qcLjn2Peb0r4dAwaK9UN0LeiTRQHjO0o5eCHZwMcjkfxNa5uzbw8B?=
 =?us-ascii?Q?gtd7qwZUEiEmT49u0p0ie7iF5egeRWYABHd3MT3F8mlO4gUpLRknWKUYymzP?=
 =?us-ascii?Q?naZGkNjmlW8bRS1fGiW4VwvISzRez0CNRqR3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oad2zINkUH/kHzrYAWSzzZkH2Uc4E/+60fxqY2T0xFQgTGGVl6HCZCXNRYd8?=
 =?us-ascii?Q?9ZcVGU8o2rdLNHwrZJFbYJEiYG2cggzcZ59nuKkQt4SPAs1F2mSAhhK5ZJ1y?=
 =?us-ascii?Q?qmoo1QKXXCE/A7irMJBex5LpBJzUVlNHwyaLiu98twpO6/ebqVOkrc/vbRVK?=
 =?us-ascii?Q?cItqMBQR/jiA/DbZVhEnakKpeehBsmOU3up6WIhjLBIjpu/IpdVbN2Uwo4Mw?=
 =?us-ascii?Q?n9XKGYk8vR+8yBDr+G/rvDGldRzaWgYsTqkTdJ6Wu6FlQDPEae0DjS5tLwzK?=
 =?us-ascii?Q?zKcfAZfZaTt/1a5H0aGQ+eemmU73lm68t9gqtxQK1NE4ZKscuzkQeBdYmnz5?=
 =?us-ascii?Q?Ha8tO+dujrdylKRfDjuelnt6G03cKcBMezeFe0z5zvzqOm469vmMwqMsjC73?=
 =?us-ascii?Q?9fAUHslP+zlm1aX1HpBXp4ZiVLYbszN8dbHU3lufe8SxdRGZdg/kRwnQvZhj?=
 =?us-ascii?Q?vU+NQwdsK3ZL2htuPQ1mM6xA3pMiRU4SZ0pB3UBzaRxWVCm1u4//rPoq1FQ3?=
 =?us-ascii?Q?fLF5M3yjO1//iMJt2+Nym5H+XMM8WThkM7xKEk123TMeAvcicFP3jBl/128G?=
 =?us-ascii?Q?AEHo16QOqTqK5WIdEzRy41pOx483toVCKNgYfNt0rmjL4VZaiGUbprb92Fks?=
 =?us-ascii?Q?CHp7Hg9CG3lcxM8fl7PzLKfS4HTdzNBGz77cwgdS1MgnyE38aZHSf9jZ0ra1?=
 =?us-ascii?Q?mthmTxgkPKoGafvQljP1Af5TqGFVrS0ys1R2TigU7EJzRn9YS5jRi14UrTKv?=
 =?us-ascii?Q?/BFSKPalZAVU+ZF0eiI6Z1X67c8mRy5L6lWV8QsGsMta1ezjAE/OVs43Ls3t?=
 =?us-ascii?Q?VcFcBUS4z+viAG6uiUuXlnhS498iOgfXqVi9/ryzl79YKGFlww4HpqD5COmb?=
 =?us-ascii?Q?8248aJp3pFk+7rmTPqPeNn38w/PaAX4kUPxRg2J1JAmGDxNsDCIJL05hfOVc?=
 =?us-ascii?Q?+Qx+dhaMaw804EHws5uf1qpIbHRceXPSnLR8iBam4oTLMt2w4wZisA2CTyt7?=
 =?us-ascii?Q?yiw9iE3rovcKsVms4s8MhQ4789m4Q1plLc2asAfWdJPtuqywCQKajRmq945k?=
 =?us-ascii?Q?T5dCLN76Suz6EW5eR1eF/pu83qqRVfQYedYMjkuRxRVSc4l3+1xhF3vLPDum?=
 =?us-ascii?Q?1K/ltDsl2OgYs4jLZprfpyEjkgjt5nkrusweoHK8H//+WQKkgyrbmvA/G9sV?=
 =?us-ascii?Q?PahHpvLceu3U3pS+o33FWQkvAeeELfplByTnreYRSAtIJm898M3GlNcXa8U5?=
 =?us-ascii?Q?bMnL+fuvIqzhZujsq3HAuVjrCTrD0zAHTtcp5VDT2/UJzLGQTCMRtUtQ5Pvc?=
 =?us-ascii?Q?p5VjcsNCOBjCgXIVjcj7TrUzTwskwgDEFUOh03OkMRFnb1Kcbtik+myMNHfU?=
 =?us-ascii?Q?G9qQxpWTKkCQhf+95k1AHNQwu4Hka9uuGJCu+ue0HUbXpN4UAiMSSBrYBZTd?=
 =?us-ascii?Q?EUUQGbDz3CCTanFAjGtR0SrgRsapl2YlGZrYZZpxKwc70xq+pJGqSSBgl4NJ?=
 =?us-ascii?Q?0C+s+1WxW2MGinAI8G5MgCJ9csj9mkTlnrXdktl2bG/6iUI3Hy/Sjj5rczdF?=
 =?us-ascii?Q?0pYTI5S7czQVEPi44/E6av2KhyIuW4KCkjr+BqcLZh3K6qy490s68uG+erNl?=
 =?us-ascii?Q?1TRODddp3/QULk6R7lE+bNE=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5579dafc-e1f2-42ff-db7c-08de01393590
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 22:23:55.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBcjvZ/q7tU8XWvJfYUwVNObZ50/OkBY/v8oK3u2ogYQRQBVnMsGNGZf1cq+GUYAiiTyiprEWg0QvqOhxTdeROcaosk9z8Q6hX5Ie+Ke6nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_152402_478438_808E067E 
X-CRM114-Status: GOOD (  12.56  )
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

This driver can accelerate single page operations only, thus
continuous reading mode should not be used.

Continuous reading will use sizes up to the size of one erase block.
This size is much larger than the size of single flash page. Use this
difference to identify continuous reading and return an error.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spi/spi-airoha-snfi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index dbe640986825..043a03cd90a1 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -618,6 +618,10 @@ static int airoha_snand_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	if (desc->info.offset + desc->info.length > U32_MAX)
 		return -EINVAL;
 
+	/* continuous reading is not supported */
+	if (desc->info.length > SPI_NAND_CACHE_SIZE)
+		return -E2BIG;
+
 	if (!airoha_snand_supports_op(desc->mem, &desc->info.op_tmpl))
 		return -EOPNOTSUPP;
 
-- 
2.51.0


