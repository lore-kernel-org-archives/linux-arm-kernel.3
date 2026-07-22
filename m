Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9BDC44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=; b=g/QjEKN+XtxsWMhpjKF7p9HwlN
	fZmXEALLNiA3jwAQsj3X75rQqeIiUildRGdikKh1zW4kcmiR3lt0UtIxlL2EwZAK2pnfbbZaZiuBW
	mLveULBlxb9JgbYiaI1UdJYTHoMRBImQnRwd03c86i4XkBGZ3S9+zaeaDEC3FrVyZQcmgzBmSIzGP
	yONw/kPWE++fYVyCAICRebgM39Yd3paV1qFNsAnDO/3MGoKNBf9h3P/W0rAeOSs+W0EWHRnQxRSnG
	vjuIDfvTnPzV4Jmz00oWkQrutddGdT7rwWE3TXH4PDteB7mZ6xlxCy2if1HH0PGgGRPFDQTdQ+PE8
	q/+9qYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoX-0000000Al16-2ZKr;
	Wed, 22 Jul 2026 02:36:05 +0000
Received: from mail-japanwestazon11012043.outbound.protection.outlook.com ([40.107.75.43] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMoR-0000000Akyq-3UVI;
	Wed, 22 Jul 2026 02:36:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vx/d6DnscxRfZuBXfJEp5n8RRSd0X7eTMPguCEQ1tGQgCcyQogDOIvW+Eq7dXb+DHTKzR89SLelUhv2j6PS1lTDM4IyFalGaN5L9vhgDzME0xtntlUuJ2RzUBramYSiUonP7k/V6jxRRzswaw3GQPzmXn69LvxPPszP6nnhl+CENzq5tKPYmpveUZxpHboTksGNL7z3wUyZBQ12GS7xH2MoYshshKuB8EI1JNtAPQrPgyvt4gBDvcoRte3GECGxwHrL2oghQhGWZOm2vasL5CSu+nS/Wm0DcVnlZzGADs0u/WAAVkIiHzKxI5gZd6ZxYV3pXB7HsWxa6nm6mRj4QcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=;
 b=hWO4mgL0NZTytfgDV2r5Qi21k82Bi6pU7hUO2zJSaF5WJNm6NTgYWbLCKaNqlPC8OMZrXTuPQ4Txc5X+GLlpERVU6R0T6tiCDHruJfTVP0/sxafaIzA9eoqK9XrvOA67niZjf2SVHHxN/t/DFxp9LyjZaz9QW6lF/UN9i2MZ/pXSZaHE2ZlLACDdVdH+nEXwJsFiBfVkwEEH0t90Bix1gL1Zj6tYvsQXFUqE6Z12cnIqf4ICbv4LtYgm0Su1leXWiab/FC2gDcgKgNpLchRZwotPmoJY1ZMark9mamynIUVatxk9DYhP/gFCkl71n/rV1ewGnEgG7rVHYevqcIziRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=;
 b=jta9n9xkQxO07Yn36rBmt1cZQXcDUFXnGnu9wjD82Tb1saahROtsydYyyOL1ZL3RbBk7zU9W9mDS1PoWkRCczTzFp6VCpRPYMBNCylrQXVHQC9qY7KfeRXBDSmDcyxZsEHl49UUVnbVwJg6mhFIdhw7/UG7c0Hfk5pBrSQqvJutO+1EZnh0JdwH9RPZ+TUDGh+HcUtE0VdIyNE23m849s9ofKpqLOPjbyrtBAX3mNQhSJG8ZP29Z2zE58U+169pSMocdoAhp26zJ5ywqffKuDSZD1wNZSd/gJhMo+/pE+a4NcfsrkDnPzx3hYSFy1aPwnNow0Gl6VKRE2vmMENGCKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SE2PPFEBA6DFDFF.apcprd06.prod.outlook.com (2603:1096:108:1::7f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 02:35:38 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:35:38 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2] soc: mediatek: mtk-svs: Remove redundant dev_err_probe()
Date: Wed, 22 Jul 2026 10:35:19 +0800
Message-Id: <20260722023523.42269-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722023523.42269-1-panchuang@vivo.com>
References: <20260722023523.42269-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0023.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::19) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SE2PPFEBA6DFDFF:EE_
X-MS-Office365-Filtering-Correlation-Id: 434c1f08-bf36-46c5-3551-08dee799ea38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|52116014|23010399003|10067099003|11063799006|56012099006|6133799003|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DNDjXfC78jgdgoryeAaImXxdQ/2nI65YeZ2v9QvCfzYf8/qfmwo1RXFbO/GVKsBNnh8ApFSkSd4HNlOcqDy+0INI1Tc5CfCB9W3g9+jWOxIulC4wWsWDw31evB7XSQUe6Ifx4TrwMeBofw38icDoXzROHtb03teAqxfudME7eMDltQJ/KECXrIIhlloqkIvkpJmZF8OOyO1zg1+PPBJ/ffyiv/J8P0EtQTxbdiie6G0SUhTcIwdGDCcL8+63E7LYAoxEIW6KRa6Jg1VJw7WyCYVdTeUPj+rf1XrdjkalU0SqKlz8tFA6awsmCB0/DUEmt4M79lni2xugmzibOys6Obt7vMDIGPk2/Kpw2gswqIV0AY7KQe6poyJjpd/VXHtevavQeBDfhrm4ByDKbL7pJ8JDneWi9U0PdxeEe/6ZimU1RuwDlBqYqvEB5UQF7ZTeOLkMeR4W+kdJNyTeR7aqaF17RU/erXM6OTa3nnHPHzvWrfm3MH6FvK/7iDCeAYrhGZPbjFypjxv6waiKIMZ/+C9S8r5Txldg/vn4QXc5FIbMLKA4vxXfyqiemf8F8zDP1H1i9J7dcV4fpS8+GhcoLW6DKSjHKkp2zW+7uHlt6WvFQcJ0Y8q61LMaio/ftro9vR2XJQ7YwjOxvREBNEibivwJvXG7s0HCr/fl9OikryWrJkurQhMrmMjz+aOmBmfnkKshKrqoe4Tt7HCiot3nlP6fuadejA7bJ1PHpSY7ahc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6DzepzGbANMbOBpIA9NVsc1CgBUfbUvZNiAZWUzz2NFVvI4KMj8BemZNCvXB?=
 =?us-ascii?Q?cMREDh3dJNG2qzqgZarxbyldUVHA66zXtvPi4GrGHX89xWA/y1QOJIRkIxfk?=
 =?us-ascii?Q?S3P48FA2ZcAg31i5IWvG8jxuBOYLMxfj3o44MtSwxJGoYCGpNgCn9NpG9/Cy?=
 =?us-ascii?Q?RWAgBYcYPuYmr40fATWrCHNwy5mHTbNOaJAnpVoP+PdH9U2MWoDR0JFx+ARc?=
 =?us-ascii?Q?HzRr+eN0DnmPQD5di/ehV4quG8zGNAL8ITZlNuRQOJzuhsA8VIsvpTIFU6j6?=
 =?us-ascii?Q?xhEKReZwt16XeWAiT585+Xzws6Q+W5nklACISNcr4gfGLZgny4z6Dnii+brA?=
 =?us-ascii?Q?b+WR2qX/xcJlZ1n5vmFrmPdrzE3s16xzmFpNgZgZBK63P4+4yOFuz6C1Mi04?=
 =?us-ascii?Q?aubNnyiBonykdVvX2r/BvmI6vP5mzgdj4mDupI85pCN/l0/27IGFek/Oh0TE?=
 =?us-ascii?Q?N7jf8eome+8kXZZK32Kue6D2pkAuW1ML3tr1zRLrQ0/ZWQ0Q761G8T+rxTf2?=
 =?us-ascii?Q?OWtact5T2m1y7S+oi5QnwtVdB6wT6+VAsOvCa9OBXA3u7/u0BxdczNPpF6Ik?=
 =?us-ascii?Q?IeI0bhTMjhzOdbJ+vfGg7ZTpurPpr6hsoxggmayG1h+razQRJ2GjImMHgpg6?=
 =?us-ascii?Q?aaUO0D+JUyk7JdJAbAGiDIG8OOJEoB3ksUJXiJ2rX28kFJrO+kDngB71bhCe?=
 =?us-ascii?Q?1TIMz0djOcPikcGGVMtlM4K/H44so+NOOoWYPIJLPAS8zzsausHXS/vYCmUH?=
 =?us-ascii?Q?kEePe5vRzncKBQJWz8MTjaTWZVgUXqubmRxrBPjjjZou3kzMGaLZ8nXxsa9X?=
 =?us-ascii?Q?MgfU+PWIE9MFl+wCMMYjHs8hy7EK7PMsZyE+ySckzYW3OsINmMTXaE3LSIEu?=
 =?us-ascii?Q?WCDzHxsIpQ/PrhCuKDL1yfrXStYbznGBZq41tXd1cF1qqpR4yqtgLBbYseIx?=
 =?us-ascii?Q?uSWdzR4HZ4x3mMqWy0hf9qEbzcHJE9evrberYjdCJicGVDOj1qw/T/YCO3he?=
 =?us-ascii?Q?A9UjSt4bE03SM06qhS0HgqFOG6dKt3FVU+K2TCFRzFDqMBR0SmjOd+PQBxdG?=
 =?us-ascii?Q?vMMdk0Y30zgRIWEVSjDkLmO+Pn7wzr9Y4C+OihznSMBo/3IJXTw7OFEz4Xo/?=
 =?us-ascii?Q?UaVZItijdKeRIm4k+JBS4YPhGVpBsHodT66+DHZzpGE57FdaKL57r/u+GdLE?=
 =?us-ascii?Q?4f6yLHsQCKG+PrleIqAyxJIUmAt/wr1purfJNBqLkWNU18uKxPD1l01rIRzI?=
 =?us-ascii?Q?OeZyUjijLwn/hSq/+jbygdCGOyWShIA1ReG4QVdsdxiyEEHjup/Nn4ecB24z?=
 =?us-ascii?Q?hvKCpJsy9xOP0E6MiCx3jVwurvICiUcb9y+iOMdpBcojYY6zKlA7l9mROUyr?=
 =?us-ascii?Q?nucLgTettpyJpw6WmzGJ/iFazmdwFuH+GdFxdtbfkq8lXSW6EKhZdaTsSLrN?=
 =?us-ascii?Q?5hXcYOYLzyI9xvLCfmRq4AeiWz4872mHR98byv1xmUDjG1zwsojqx2bO35Hw?=
 =?us-ascii?Q?fn5Hsk27L5xKR7RpsHa+ppeOl7YH6C/cfXzMFncKI3YnAPbs4VpWDYstRbjJ?=
 =?us-ascii?Q?NQtL+T4xqnDwwBfKMtUQJnxuld+LzHuiRCFC7xb64wPCcoa7F3b3MeZ4dI34?=
 =?us-ascii?Q?TcPp7Wv1PmIN9okpQVmR8ybUfC8CybLsJs4CCZHCiALB1NhBLYzF3bnukaMH?=
 =?us-ascii?Q?d//t+BXLeWRw3QGHF9l8zdMgeW17nqkFTUXN8RuuzpoGbot6J/4XesGR1wzW?=
 =?us-ascii?Q?b++IRxfeaA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434c1f08-bf36-46c5-3551-08dee799ea38
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:35:38.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPmMO/9o4SIwVKXY6TOpCGO5sM5Kl5ODnVFhNDDnqTd6kyJf6oT/X+WyP3djxViBQtjn3vFy0JXS2SJGckzynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFEBA6DFDFF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193559_870217_2F8C1EA5 
X-CRM114-Status: GOOD (  10.15  )
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


