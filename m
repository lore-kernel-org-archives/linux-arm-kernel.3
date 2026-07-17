Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266E4C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KaToabX2X3JY+8DVj6+NSdwvPp+1OKu/006dDfyIJw=; b=cmXMfVal8ENuyR+MHmk1TpetMy
	dKHijxk5Jo8t73KO3v9CGvJa0SIfhcsXJN3JDlQnnwOshQMw1Jg0p/Tt76Pyu1dkGchBXuV9Xvil1
	WPOs+8IT76/tXfhNguw09aRRahrtONY8jI3+SFXlwAWC/qf0fmoyIlEvCKpdrFmzkZuYD8avycj2E
	jGKZwvEXxh+PrTJxR1pgFEkOI5peZhq6zem+Y07OiUDIpzQRR6uq3v9PIe5mMWsTC9yUQ1W94ucXU
	BN3oo49AjoOEr2+N9GjlFzIHIKxiJBK4PcqIwpWyuqNY/7WanuP+SBUVeH5fheYUWpvRjGNQGWtmh
	Wk7oJX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdWk-00000001Y9j-3FWn;
	Fri, 17 Jul 2026 08:02:34 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdWe-00000001Y3X-2tPx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:02:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpAZqexxR4T9xqJcsd50JbJWSU4kZkheQ5qDYGY8Cv3MRyQJd9mBMZaPGt+QVOmhhiwUxLn33WYfuE5q33Pe3ZYbVD6IMuFBpUnbi/isBPFW3BQIcF66S8QjAQWx9q3Nl3KmygHJzZRm0E/1QybD5A0xrEKFoB7o1FrGbjtohI+sEbG23KZdCkxI/LzOvAhqIPO7RqtJ2/K+djSn5r1eD5PQzgRjFWN6CB+KOsbyss1PnSd7sdCKeidGPe7pFMw3nja9LkhnKIo1HWQ/DdQmHmQlOtlu3OwWCivdp8Rb8w9nEmxOdW2zFIuOH30xn0Qa7HMm6lBLNboFV2hm/NqXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KaToabX2X3JY+8DVj6+NSdwvPp+1OKu/006dDfyIJw=;
 b=jpp3LCTpQqszZn4Gsx/ZUZCwDr1e6kpfdAiLmvozoRaWSwe/p/ld4DRrl5Fq8YIEvO3Hp8eXF2atrg0UG3QnPKhX7XP4pcbwd+0/8ptl4lDciQdPwGZRdZQjRjFPr9ew+r9QxqT08bUUpVlBqUDvwlAlY+Fzrl8VZlWC/wmRjvSdcOCZsntE3RnEg7r+dDrR6eQCUCtHnmtv44vxoi5Rsh1BrGib4h0eNxwXvuOzEgwkEjijSEIby90yrpr3wnV9SNkDXr5RiH7sAqyCxtdsm5thx9jEsMdwlmMR8xThZdY4ppAvnysDVon/Gd4v/+GfcvgbLKkWLrqWaPoyU1pfJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KaToabX2X3JY+8DVj6+NSdwvPp+1OKu/006dDfyIJw=;
 b=UNg+JcWcuqHzT2zpQn4d7Qw3EYvPN7CXPc3OoBtyYnZglK8kZc9GFSL4+mdf8N420Zl3xRYi1u7PZxPik7TgJUKL2WiFBhcm1UBdIzGyfNzFGEEqGfm79RYQiIkTXcI6JwLdE6MDvETg6g+DRutBK0GxWJwLtxzN6UFucxNgCjQFOY5nGaS0AX2Sr/6CXwsYOngk/s63FJ7qb168HryrYKdOu/9IKgk3k5vvcq58c5rw1x6qKFsE/jmIeInFKmpX1Fp9GJ1r0rInluq+9hotZ/vmnB7HuScYGRkAUiXJ4EMhpb6jJXzfsWMxrAmDeM2wLUyodd9OcqUUpPMQzkJ1/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 08:02:22 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 08:02:22 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pan Chuang <panchuang@vivo.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-crypto@vger.kernel.org (open list:CRYPTO API),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/12] crypto: stm32 - Remove redundant dev_err()
Date: Fri, 17 Jul 2026 16:00:26 +0800
Message-Id: <20260717080045.191538-13-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717080045.191538-1-panchuang@vivo.com>
References: <20260717080045.191538-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0054.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::18) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|PUZPR06MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: 529587b8-e0c9-4773-58b1-08dee3d9bb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|7416014|366016|10067099003|921020|38350700014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ElOVtFzRiIGXVde/xA647VU6OO/KwfxcAS9noEqMD9ofMgu8iMvZlwoqSGFdPGTaF/jwoghEriWu8nrYIUgwHglBJzv0/cDPysYswjRUTZY5unNBH3qY3UP10mjRxQNB/VQmk9sWMGHzDAnCFIgN4pxd7B+1tgLU+r5c1FduM0bggWYzDduW3LUHqBwjkEvvggRqZWtRxls01JM6m0m5P2SSBYpwecQSmNnX+sKsLkNS6050z/7yaeHxHKjRRRXfFuC3Pa0iM8fa0YhEuuSa1xcUYVItp2GK33YBNCYch1zuKIhvIFQXkyBPpn34gdIxBqL0O5FZhH/9vh8kdUd9G4y8w/kLuepgMWti1K8P9oLW9TNE9sKRHeaR//UZzSO7E7HBgMTTc6HURAp/lDCT3jAVdDuagx1SENHEhXYqAqFrZp/6p6Yon3tK1Kk40ik+Ff0elardOp67DpCqHG2Zz6qBiqBbPrf2nuIoemrno5aZylajss5T8q35NCHGJ6DlOo1TNo7KUAAeoqe00Z0c3jdcaJQ5LSlFaZvDA0LOqeYtjuzUowedqbTLTUjUAOXZqFsVa1SvAeowGv7NYfqT1UF43Os2hdCWuGWiWaNa7dpJdPOZ8qypkVLdlz4/3Hu+U0ltHflpWzMnF7EIdV1B1OWKFFTp6hP0s7tbavP7JbRyKVZu3d7K+ZWwZGOCqFO8CMcsurdbB1mnAaDetNQUf9MKVvomeykMEY6konFK4ldha8ZAQq0P4i4aaD4IURJa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(7416014)(366016)(10067099003)(921020)(38350700014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PoqKpy43mlEay7LA49/neS0eaDOu0QXY2emjXeoDbRg0drfiKuPM/hyvt8Th?=
 =?us-ascii?Q?T47595yXrKpOm0xMuuOn5pb01slwyNgU3FuuBmaunQnXKrJ6aiOuS6Pe8zUM?=
 =?us-ascii?Q?Ols4ZrVF8ctWxlKLVzIRVj/hF9vlJ3I0PWyKViqvSk9eVYGdYTI+XO6lmw1e?=
 =?us-ascii?Q?voQuAzXrTI/q/l5ENFfkMjA4Q2+KzQZtuxL9YeuvrF/w0Y8wqt6PS2gwTuDK?=
 =?us-ascii?Q?O+5c+5/n85TuU0sAIBUM/WS3MhtndYZ3CEkLEGIS2mlm6KeMPMS5DaR/xd/R?=
 =?us-ascii?Q?X6T0pKb611Ca6quGdgh/pZxrumgBfMO3B4GMPn08SusJWageBDaD3MHX3Ekx?=
 =?us-ascii?Q?PYDlKkhocGkWejO9CU2rI2xdIymzEFRNMSXpOOP+8zb5iqUwbt1uLXlT/Yt7?=
 =?us-ascii?Q?2XN/dOE+F2g+l1TGcG45kO9KNpFGGaepRFABb8eAHOhwnDbSwGCs+qhGO5e1?=
 =?us-ascii?Q?JSs9+bZ+Mbv8+uWORghV08Ak4K/7amgPfwgvmQVMPtdXom3IRDIkJKuDsojU?=
 =?us-ascii?Q?L9lo/p2y0VPyKv7qeAizUMAJSQp1m04vBSN48GVDrd+A0hGGYFwd2gSz0NxI?=
 =?us-ascii?Q?3hllQM8uhEQUZ8+6/rLCZnf1Q44s+zFKgStaC8jtcW0sgUEkDv8mpv04hlnW?=
 =?us-ascii?Q?yULdpPrr4prkbxDE665zLaCB+B/Qcv4wMmY7g8gTij8Lh9lgqvSdqG4YRuAI?=
 =?us-ascii?Q?2ZSV8QFUJyy1vVsWYxB7t+4Fdq1cW/8JXA2OS5VLCQKRHj7oq6poFZwVKcdr?=
 =?us-ascii?Q?yZnL9x8p7hC+QNqFWT0cDIwMjydvgo1dLzmLko2WeeuQ4ZOBJQjhBtGEwlU4?=
 =?us-ascii?Q?ggrDlc0QkJ9smmIykBPaPvpevdnoueSdOUuCaWmV1ssW7FTjNF+Yqgr1hjMz?=
 =?us-ascii?Q?7f6b6P1ALQlDnjGeGdrK0fybQ9LrujMY+byGIDPJsjNiaIIUxy2LHJH+h+5A?=
 =?us-ascii?Q?KOAVbLhdcDpNVf5MliV0SAjr9IcgWp4UCeqY1m/PqmuIzawRV1N18ybJwX5l?=
 =?us-ascii?Q?uoPsQ6BX7mIzOqX2l3mWAkcQR8wt5OuTdphnkECfqSlvB5MyRhpPp4mifp1l?=
 =?us-ascii?Q?iAU0TcgbFFs/AcUkG4YDVktYdUYrL39dSkqumKSeB4ImBWyj3wl647d0hth5?=
 =?us-ascii?Q?fE2IFIyhjsKoppAOikgcJ+y6nKHWW5lt0zZqQtKpZwzNPq3tT7d/EQ50UAYu?=
 =?us-ascii?Q?UvxSl9bfFi9wdjhtaHVVK1+OMzQ+Y9dmfQaqVwzU30dQr4sDh2qsVqb4Jkd2?=
 =?us-ascii?Q?kDTzVxvVI9IaANKgqcE7xgtqCOhPP/er3OumO1G1N0ZWKWLCYvCC4J342XnI?=
 =?us-ascii?Q?3pwl6fpcNXxxnqc2L29TtJrPD3Tgo6Mse2BCGhYywpZC1PgC1NvRVtOIYqM1?=
 =?us-ascii?Q?L6A4/CKdLtzyY171hIhw5TS+Uqipz3DUxQzUtKoPF0QWc/dbAOX30s8FWJBP?=
 =?us-ascii?Q?Dp0LWZIgzJ4jQr6S29nS08g8MzUqYPCF6UVFWSny4oH0gfXiGQWmoUbfyvPo?=
 =?us-ascii?Q?C58+bPBmIJzCVVJFhcLvdiJIV+LsvM11q6E+Dbf8E17vnLzzCXQazbZad5/9?=
 =?us-ascii?Q?vdOn7RDGJZPaiFLJcd92JBGiJfdeTOTsHTdowrQzuqAcjGfgCY4UTRmVMPDR?=
 =?us-ascii?Q?atPZuWd2lkBs3r2CJNTWspQbvvIYVyMr1cW1K4P3Ffuo8qPGwWM4oj5XLNKO?=
 =?us-ascii?Q?d7xG12x1cNMKlFvWSUpiAD4nbeYmUmBlwhE5CmZokBSrqJEFx+kipsglUIXc?=
 =?us-ascii?Q?mp7xRbRsCA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529587b8-e0c9-4773-58b1-08dee3d9bb66
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:02:22.7460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHnK//dguyiRabGMeGGydVaBNeEDw6PmUFclpwZnUGTsqtkh0ai8H+buocEvenHA55jtjEp8BazaIhKOF0bOkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_010229_011990_AE6C48BF 
X-CRM114-Status: GOOD (  10.02  )
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
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 4 +---
 drivers/crypto/stm32/stm32-hash.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index b79877099942..3fc2db290b0f 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -2590,10 +2590,8 @@ static int stm32_cryp_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, irq, stm32_cryp_irq,
 					stm32_cryp_irq_thread, IRQF_ONESHOT,
 					dev_name(dev), cryp);
-	if (ret) {
-		dev_err(dev, "Cannot grab IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	cryp->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(cryp->clk)) {
diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
index dada5951082c..e6a1e9b9f88d 100644
--- a/drivers/crypto/stm32/stm32-hash.c
+++ b/drivers/crypto/stm32/stm32-hash.c
@@ -2356,10 +2356,8 @@ static int stm32_hash_probe(struct platform_device *pdev)
 						stm32_hash_irq_thread,
 						IRQF_ONESHOT,
 						dev_name(dev), hdev);
-		if (ret) {
-			dev_err(dev, "Cannot grab IRQ\n");
+		if (ret)
 			return ret;
-		}
 	} else {
 		dev_info(dev, "No IRQ, use polling mode\n");
 		hdev->polled = true;
-- 
2.34.1


