Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38C9C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=; b=Z6/Q2n59r0xX71HLftEd7SAvZh
	p1uPbSWS0t7o+ChMMAp+bdHMZHYEGFlbg5+IODTNn6HhDkEwHBUraq4WW1DlfBbwC4gvv+GwtGFNi
	rFR81uQlbb1T7f9WhGPxaoZWZHLx2nUcc1oRu0vTj7oPINeY/8hWcVWKP3NPeR+pI9UHR9fZnEGNq
	i6DNR0eyDY9q2dx+QctAC+iJRfIzkXWWOCpGyOcsc1Z3R6xBdEZ8xFl0Y+CIlZOsCJbVaBpEswRo0
	e30RtXIYGJaRtwFF7d8CPMm3wMzc68xlY7CKgJszITC32D0CM2kX3HoCEZmtGtiNCABs5rP5Q81Gf
	g7Zydijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjMD-0000000DFJ8-3Ft4;
	Thu, 23 Jul 2026 02:40:21 +0000
Received: from mail-koreacentralazon11013003.outbound.protection.outlook.com ([40.107.44.3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjMB-0000000DFId-42XN;
	Thu, 23 Jul 2026 02:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itMegQHw2ioRHQWRHIUxhyxubDtcCGagZKA1NXVqN/Aq+e6Dnv16CIaOUGphNqJTGTc/Nqd7fGAk/qVeU3fMjW0qlA74nSQ9ATcStJ6Yad+nNkOWwwIPN2bvfy5gsCqVTWcplcyQh+4LJSVYUIeM0tpqF6YDqRcq0LvPZsOF/AZsPLeh/LdyBObH7JnkomyQwRgn+0ZlUjJFod44pjWbRXfIHh6itpD2JQKhnifXGdkYqCdfSV6mt+3II1AenZouT4dKK9WT8YmEwpHEzosb3i+P2DyEMiUifeQCey0YpH+BV8yLV2CEM7vah3VGUf8SAhi2qPuQosyyvBLmfhyjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=;
 b=Zhffd7AokaY/c/0tyTucb4NlAoROSUDGgB+8ioe9ZVhA2sJH6DWQcmHiPFlb0JFGg+8hPVM8zBbzYDwYidaKSsg8U14OaP8Lw8KEm/Ia774/bM+dfGyCmvoqsKAL3mf5frUJ+fqv/VQ4TkGfmht1TUkcYgbfSuXv0JDE4bGKYUDvT8gDIQ3GUPEAhBKYFmTuvlgXcMWDM0n8fv0U++B0vIit/0evC2POx6YGkptHG0s+duusS7qbKkFiDNOpFqCJZ6Sr1fFhefIQCTVujAbgP+f+DGE/DP+4iYyqF/eHFJM46/i3JcLpEciBisGbodkgjk8PBF315jYra5eWDgmHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtZ3BqbxGW18RupfLHyugwVBBQplD8kqMXucWFDqbGY=;
 b=SkmxC14vDRtA4UMgVQ6lTl6BqLWXLAWZ/oSPrzVb8Khoe0iirKpPDEsg1KFHv3O9CU4rf9mNDgFpRK3REKS1t+6hOPgw9bq8GL0mQSu1tlY5Jq35pqkZZ1kAJlql+TXlnpND7YuiakNzz/69I/G5E2agZpfjtDWml+PS74tESI2btR1S5i64Scx3NVsQRcQhimX6+sPst7E2sH3dRja4RxRXi1N0aHTwLTuzzh6mradm/rJ9M/kzF45eFIvcUg0m801V8QFucu2dlomE0eQFderfkxlzoEh8lPnNjoBc5XiBc99TkseSMb+I78VJHwTvxU5n05eMYtEHVtXON09Zcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI2PR06MB5339.apcprd06.prod.outlook.com (2603:1096:4:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:40:11 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:40:11 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] soc: mediatek: mtk-svs: Remove redundant dev_err_probe()
Date: Thu, 23 Jul 2026 10:40:01 +0800
Message-Id: <20260723024002.9541-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0184.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI2PR06MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f56d3c0-7633-45b7-be7b-08dee863b7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 49mpG1XRW5GQcLF1339KZua5jxl6w0Go7m1LlOHoX83RndeyfBA7ZbXBYHOl4Z8MGl78WW0g6YnT/PfCXO5oJ/YT8pLY1ZrCFmjFhww8giC3kYySI4cW66+Aa9GXVaZqDNMrIq2GB0D3vCXk2fWyh3/i2pnYq3D6vxAR3/y+L4JHyqNqVoTFWu8A8tDplZZQNdKLKYW69kc0ymWPg8GumZZH7yydjONK1AluIAQwW3QfjrO1T48sUhYVASn5F9nSYblKOfupiEOYgi7wLRQ/6MvPq1lPhjV+KtJZz0QXcwFq3dEUljtnfJfmVXUCLKu98TqafPtvyyy2yhPpKKeAnYrVoQI6rlW+x0TSbVA03VlAB4CB8So+w3ShsoCl1atRsDj2PGBTSG8Xumu6kl4F39kitn5ef9E7JpZtA7pzK8owJBiODeIt3sjjdUPWKe7qCCAVeheo2YqgbamhMqRKrfoApEJxJSc+hiB/226jyOync/TWBZpbn/sEa6W70CLeN5m5cVI/HnkkpQATGQzrwfk3/bnU9Q7RLyE3/r2tpY/qh5c82k3fltq05j3D2ILWKE3Wdu7NxDYDtg9wfdgIb5GkxIUOZRwnZsRctd7R3ysOmAqLkGBNZnay0iHtt7lDoWu0CuAGJ2EJncfBX+88QrJ2HEckhwzVsLfzxfBoc61JvZsE24VYJzeqdVy5/uSZWqDkCGOz59lZ5wOKVcpSmAJkMqVSPm6AwewDlWO6jNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1hKbhdUHq7EVvvlBQy4aat3x6RxyN0pEJLPPg4KdHs0DJAfc4Cc+M7R6Ppe?=
 =?us-ascii?Q?FZEAfY0uPaehSPnI3O90Yr6Zf1O/Z5yZGnupihITG941nM31ODDlYewfUzW7?=
 =?us-ascii?Q?UM+Icdph5yJNjAaX9F1oRY+isQrjSb4CvY7AR7/PicSPN6RUNZEdAkAc6Rla?=
 =?us-ascii?Q?848n2oRJaAvDK7/AD/BWmtBNw5CozVMexTYOEUhlDa+3ujLk0Z6Thf78oanV?=
 =?us-ascii?Q?4NMTFLqIa+4It1v93r27h0HtYXTZTbmh11pbbOU/XXS/BetHUeoHPW5V04eI?=
 =?us-ascii?Q?RKi0vffHkKCO9WtBVBCW4l07kcfBHuZbmcNjmi6EUWBqB7XXWWuHG1CS6bMY?=
 =?us-ascii?Q?EsGex3t7HGlmdDMO9eDVYr/1jM6XlzdAWRsg/38MYOUetp7jZ4ApBPRY/Y4M?=
 =?us-ascii?Q?XAUDa0w5QOe/m6uRJuxVHpflpl6/7eqvFd8rLa/BjPp7unGXdC59JYg/pDP7?=
 =?us-ascii?Q?hjrx34sz6U4v3/bjAfFhe0qblI9JoF1ONRC+1ScT0LuBZbe+DnwFSScQQUv2?=
 =?us-ascii?Q?sB3NPcmNomKsFXOBDRUSSm+0uPRhV9JUhYr+LkFBnaSsWdWE0gLshNfgKghz?=
 =?us-ascii?Q?z6yOyxulJaEdQzttFWlXxH5cSddkKXszfLLXLSsMg6em1RR0pJdg/5yUeoa+?=
 =?us-ascii?Q?AUG0x9huzUnnd1ztnOZxksZYsI5vVO03d4yY+KBsSBwFbCIR+0PreovyKnJq?=
 =?us-ascii?Q?aQoVENzooA16tAsqrP5b5e9gW7dxfmDSl1YIGKhUsXHxMIBUhC96ql3wKKeE?=
 =?us-ascii?Q?uytrDsbyvjtLjLKXCFWheW4zc39uiZ3w5n08gxo0o95IMrk9aH52CgvoRQ0d?=
 =?us-ascii?Q?8ktR6DertredPe/8wXwk+sQCITkOhHN9ItO4QOm49evUHZl5sv3w5tnT8PrW?=
 =?us-ascii?Q?Lh+pGwIoL2/sEv9PzOpfE8Tv4eixZmcmKrjG5kDrKmlHzO+1fwm16ABbsk8s?=
 =?us-ascii?Q?b9ZI2m0F8h9HnKY/sBOTYgJg7dKZbOj+CWtExdLQCmseuAgdxZQL0CHe2ZTx?=
 =?us-ascii?Q?xyZLqZgYT45j8PdOkBjHcHpKtltmfoduEm9HkTM72RAP9Lfrdbo2TkJnkG31?=
 =?us-ascii?Q?R/ycRrgwnRjOv71iN/R/Cx6IgiOLmXUqPXORbrLCAetzXjIrZpiRahDeqd9F?=
 =?us-ascii?Q?oHf4lEGTOKzyU6/LxXZ1h2YgAIb3mqsveHQjLQ6XSe5s7YkBEZpkU07BZyYh?=
 =?us-ascii?Q?1eQN13zZlaazG3oOEgdyLFNNIrmu1kddro7e3L93/TqjCjpdMTekHDqTZddI?=
 =?us-ascii?Q?T8sTQUzVAq4sxPfI+LapWae9BS/hVCosW3yp5XCutx7yAWGDTW17zS1xNURF?=
 =?us-ascii?Q?JhCEw9x36ORqar6yaNe4xnNMGr6lQ3xtwBicB4le6r0m1pzEPhh6QwvG9JS4?=
 =?us-ascii?Q?G4AsARqTuUte3LBOrg4lCE8P1N6xkJswgc90FluHK0HHBAT4G3XW8Z4mbm13?=
 =?us-ascii?Q?5JnLGtEvRawrlaLuGrmiTKmtoWG97whB0TJ0ymqItgkWK2Mucr4VWAjcWLOo?=
 =?us-ascii?Q?synueHGQkTr9PrkwP3haNzi7hxvLTcMGNP9OlG/qEPQbe3/nFU2vKr2uST77?=
 =?us-ascii?Q?cB8zNMK7+n+65woDoTlJlFoOr+wboKOrGH996gzUL/XrFr/xMi9J88K21nYk?=
 =?us-ascii?Q?vaFi8Qzbk166eAUhTOlkf1DqiztFBNWTCH7L4C6hnxiEl8NWRHs4q223bu3B?=
 =?us-ascii?Q?KuFo809DWCAQc9fcOoViqbu8ah/p7n4Wf7v4GuvlyXxK8vqT5IzGoUOAXO8U?=
 =?us-ascii?Q?9pVZ0UjpZg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f56d3c0-7633-45b7-be7b-08dee863b7ae
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:40:11.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgpDfPK35JqJQE9pdRCHMXlvKwsjsnMemqR4WXGHnfa1NH1CpCvTSJBK9pQA67YR7LOzkLi+D2fbbkkGlgIWkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_194020_000102_F81DC207 
X-CRM114-Status: UNSURE (   8.98  )
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


