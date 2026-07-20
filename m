Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA52C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=; b=q/S+ZUdIrWHAPohPRAvr6FoYN4
	pFe/E5gvzuKD/8ZnX33aX1CUuHmcWnyWhwg0fVW0Rzf+/gTuuejkMT9JkOJ+/ldQ19XSu+/MGLbfq
	YpeI/PZMcpCQSEfrQrALuY4ltKe9Arqugweacc7Q/Abh43qaZvYOCLhfYglZhFa3a1LWbjRab7SdF
	VO1WMP9YPVw8MjQWlnexPiMV7FAskzfClzrAN+GTJJSQjnbv5wPct1qejda2QO49QLWdxKgc320d0
	w2SB1qe6d8j3HM9GFGGcRPp5fKku7x/OcTMDhrfxee4b8Kmr/Lq3eaOz66+ZorCQJ39oiKZZg6aOr
	EJQmsr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknD-00000006Orm-1Vua;
	Mon, 20 Jul 2026 10:00:11 +0000
Received: from mail-japaneastazon11012018.outbound.protection.outlook.com ([52.101.126.18] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknA-00000006Omg-2kP1;
	Mon, 20 Jul 2026 10:00:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pdnqk1g9wMaBZJJMoNsht/UqsBGvVYCwI+ocdLF/s5h5o1uaypC4XUm2IdcfYCB9xzh544JMtvjAHB0dBUME14U/I0z8eUskYeRo3tyr8oUauCH8k9p+SehVXZH/HyuOltJjB/vYNuQ93ydz/rYCW9XekJ5ZYMHqBZEHUOPK39+kSEM5d4PMuUwty3yq7/2kHdT1P4uGIJXjCamOIjnl2cJC6KKAzq56AjcL3A/PSxCYKd89h5wO3kIygybRX7EfSkrWU+RyteUC9lIn+Nxemli4VMGMbSTVQNo0mrjNgSv9OsWpwiQ+2PS6EDfrwVcs49MkPMD0o9b+QShsINg5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=;
 b=H5vWfoifnNxwUTcsZekJ15EPZtgyPssznFx8s9reyly8eTZUyCIKX5B0g1hv2JsGFmgPaXBmZ8CpUErWTto00Z2By+cXyth5cjFcaz1UzcogPWpp25BVZQD4oLq8mv9CS1KavAZtDwzgpkO44RfFBEZyn7nZKD/YPX8xMYvyrvZF94cC7rdVDTkGBhZc/nQ3KLzvFk7bBu/0dPzVfQr8jYEJranGUMABq05n8kZt9jSq9Zl9dBIvJskhupLM4J37vOne8uZ88xolp+6sNitYwNDaPDzEjSTb3pzrXk04LffRatz60ngoSW4KLH4rA3AMkvumkxGvdUOkM/jmZoTlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=;
 b=ENdoxk/tY0OkWMuq85SEyXNYKa4jOkesepQbav+sFskSQM/WveNhBAgJGMTTms292+WpQfFLEFVPdhcol9J+aW6Ua1p3sR0kd1QAxJUoYNSwbGIuxmaQa1kdO6b10j9sXj/FG+jBClmKuXH8F0MzORh9aeUi5X2mwB4+JGQIXpqgSnR6PF+YmH5ZAILDd1J6G7LgRbwaCsjnSBQQZlegNCk3MHFIo5Ya51k5msXXnMn2MWOa8uWirSzSWK6pOjNlNxS4TTlPshsZE3SWXTzIDA4et3n68huLRhTJ/SbplJl9ySE/Ftb7wwICTrRFmmPo59fEz722Phssd1VUU7yydw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by KU4PR06MB8458.apcprd06.prod.outlook.com (2603:1096:d10:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:59:41 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:40 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 3/7] soc: mediatek: mtk-svs: Remove redundant dev_err_probe()
Date: Mon, 20 Jul 2026 17:59:09 +0800
Message-Id: <20260720095920.542801-4-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|KU4PR06MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 30abe4e9-7bb3-4a79-a6c9-08dee6459dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Uytw6VGSX0VajykyRn6mQ/Jw2zEAdwwPFZZjAoGY3i5qjfKfU3RMHeW0j2bZ7AX+GzS6feg0dWkFJg4HsO8bZSDJO6V53k27mr5NXsQFl9YBCqVU0lxRSj2Vif0nmvvwMFjLjNeO+TXqgxhBAOjXr68X91jY2OKNkPs+J7G2nr3U+WUEcZEviaJm8vHi8NCZF1frSs+AHY5fMuJR1mkySEhoaTDifMc5yVkWOlZIBQC12mtM+cYroOlR+R6H16seCzSX3d+O8Qlness4XXAfTDy7XD7Ykjrt1xnZxwVsLT59uzjJGhHvu+WcYJHtKvM81+D8TluiJw0yFZeY80cGA/P2yX//fqgKWr/HrMWYPn2t7w5kUD+htMgVI/Lc1CxO+0e6IVi/QSVsFoxfC6cjeWr1VbgwfeV1gOL+t64zf6Sk/hVR7wqHPovbAFFIKp5b5v4KvEPjOdeI9Tf1fR/L+52Ti7Ce9VBcYam1uUax+CVINxKZ7S1c/ZBtzRtK+hBxSUlHiWGeFU4dNwYWmC75Y8beg+FkAa2ak8QSlMvtTPGsUZN3fQR52njA+IUFb4CeBiJ57IHIr9G9uItW//IjGLkCODbwiUYaoc1PEQ9KTPpO/tpWujCVlaVJfAjPe11+eAYD3dTrSDh6WpPusYpPrjPNQq/tQ6I7H3deHSY9FwqZzwzAexnaX5uV193owlLRiGhDukKKM/u/L+gxbq+W9ubyI6l/Hg84FjIu5dEuN6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VKxdBtUjFZTpLEGmZZio3m0Pcy7hUZhSJAqt2khBGiYJijQsfj1nGzZBjnwo?=
 =?us-ascii?Q?S+EB1K4kscU6wdTJg2/YAnwlEWyHF/tXA+RQAWF3lt/s/W8XIqCvMAANWQ65?=
 =?us-ascii?Q?Ys6VNWxe3TFAL8wczHlKPNy7s+3n+kBCqlHraLkfIKULRrLGAQTmWimqGFGp?=
 =?us-ascii?Q?lXjl+Y8IHUINoSZ0r0Kqi9wpu1qFo2FtseT/TAqDmBZFFGOdKa+ZWg66HMwy?=
 =?us-ascii?Q?oJJb/F3xXHw4NgzYixN54+iH7XEkhrVr4xDNWz4pY3xISqzKh0UWKzUvQp1N?=
 =?us-ascii?Q?atTC2kw9z5QPljwfvp6IKs8Z3agtVCOCg1TtCOY0LZaIuT8a0VKXED97jEmU?=
 =?us-ascii?Q?IezSi3/M51aQpvDhSrYQn2TwbZSU5jl+z5n8edx7OPDfbKB6DgrEdEACLB0v?=
 =?us-ascii?Q?SpVdG8sQnkcoQ+xdvsWmcU/2e7eTKsoKZwakEynTxsdZmPKMpcMmn0zRrHRr?=
 =?us-ascii?Q?u+O04jH48LQlaGXOnVGW+Q5zBNsHfHXWBxHGC9weXjujS1tDoFPvW2/Tpkwm?=
 =?us-ascii?Q?pjwdK2E2i9wzlEsAxRnQaIZknD2ZIQfrkEFjM5OFQLRgCnWg7Q7jx/Urssis?=
 =?us-ascii?Q?Wx7FcaAg9nw1ZnLBX/IszTOwQay+l3MBLx+BlLnbBRUmBQZayBY7B9jolrYa?=
 =?us-ascii?Q?B740Ul6zmiXV8cVyT81Yum6XDcGhDiAKf1pssDQKyiGEd/76whaBGw/BNw3R?=
 =?us-ascii?Q?GtSy+ibqRcSjKoBFyVywOjXFwmWuHedBtWRpWraCeluneEbWb9PasIQ3tO7e?=
 =?us-ascii?Q?9Gw3RHHjSUPYr3rU2bYdvhqOk8XLD1WGKma5A3ngiYsw8JPBPs6DpVBzhQL7?=
 =?us-ascii?Q?8PccVjrmPA2RgnNihp0Hn6BQb9TkAFpYPjGm5Xgtd223zVC39CAWKxEv2zen?=
 =?us-ascii?Q?gc6zHsTRbUnyVrwq2JS0XjRFS+MKZwQPnQ44i3zm51jr1n6LGcffEAT0QrUs?=
 =?us-ascii?Q?12smD9CApE8NLepaghSehkE/KCQ6VnHqB8xq9NRAav8vDLW90fDrsbpmOMAk?=
 =?us-ascii?Q?mjGEcSM7hRDYRFVcrqtlW6QKGfHyXRd0/GsWBY6omGbRceKmQxpallB2IpVh?=
 =?us-ascii?Q?fzxoIPTcYcweyIEOM38zcXNMOrfy82cf1Qhol/CiZvxlZkxV27bn5ayQqkMO?=
 =?us-ascii?Q?Hdku8LVdbYHwohrur4GaAej1ZvULSo1W+p7XL1as3t/CFHRqAr9S3BQ2hmEo?=
 =?us-ascii?Q?j9uyLRtGK6ju2Zqv0kcDKKnAEtUdmaBRtqmCGnJViZlnjH8oD4z+zbGD1cS8?=
 =?us-ascii?Q?l98HL/HSeqa2jByrR/BAxQ9vwW3nriVAMemg4yu9FfHrfEC74mGFWxhbo6tv?=
 =?us-ascii?Q?B7RIVVyzrVDRzO12TlGSNUv0En1ZZflX6ANUiXGhpUp2nUpTt29zfm9YZaS+?=
 =?us-ascii?Q?GnEbzypsCF14c+Okxnkj7uwW5P2jMIBotEIbkELhG4IrWkv08HtVaa1hz2aF?=
 =?us-ascii?Q?Mq5rbY06VC7UEnZKV8UUpr4fWHLoNjjhjQRy9NXFUKFhC1GYl/BEsMUoSg6H?=
 =?us-ascii?Q?EEwwjTBhR0S65/KshTe+PFUgDCDmB7TtFmOG009WpgBDm/hkaYmAIYrWK/qX?=
 =?us-ascii?Q?E49Y4HIXX0re9ZP3+sr2tdHgCWhoXfhqbx1xCt3JOZxACRGtLOuLtD5qZxm/?=
 =?us-ascii?Q?TS9CGpnBgiAaG51U+qaUhxNDQHFwE0pmGIw6AW0p1B1IdB1HEoWhrdDKkz80?=
 =?us-ascii?Q?zMmA29pF8VrRUz8b/4QRq4b2DzyrfiFPgzNpF8Evw2eRzOrPyJUcFpfefxmO?=
 =?us-ascii?Q?WgacLmCc4w=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30abe4e9-7bb3-4a79-a6c9-08dee6459dc3
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:40.8925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5Jv49K2FzVRTA4UXD3VjE4aPLN5uy1wcfoPNA84VBi9jr+0ouc95gbSRpuxhpMbLEwPAcS5b6KzNC9Rx3mANQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030008_698885_3BE8CF5E 
X-CRM114-Status: UNSURE (   9.10  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/mediatek/mtk-svs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 99edecb204f2..39af0728ce61 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2908,10 +2908,8 @@ static int svs_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
 					IRQF_ONESHOT, svsp_data->name, svsp);
-	if (ret) {
-		dev_err_probe(svsp->dev, ret, "register irq(%d) failed\n", svsp_irq);
+	if (ret)
 		goto svs_probe_iounmap;
-	}
 
 	ret = svs_start(svsp);
 	if (ret) {
-- 
2.34.1


