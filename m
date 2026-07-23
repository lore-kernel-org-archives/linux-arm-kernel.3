Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144CFC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=; b=Kac8x2eTDROCjVFdaP33/OJ9rz
	uHgf8xfjvV/T0DxqWjGNxe7VTZuDnwmq87vhUDhU4ZmmmWKYPAQLA52WaOEBn6lQ/4mqlJuVTslt+
	/vGB4H2oJSj/vZoq4ATFpKNSRgR0hmMt4lXa5JLOaocbVe5Yi0/bnRuFCo7Le8YvGbGK1BucIsWKR
	v5+JoMSjyMdJw5HswOWJ137yor55dVdEQMwMdeMEcDbqIiTc9dcdY2z1qYbPBrzXUmpAO1HFnGy7+
	LgbMmomZBfyyeRgEWi3LwcD4PUHfJyUNjMAGCtuplKAka6V2lYxlkDvOFFHNt0EJuviR8E+TbBEa5
	E7FD4wDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjRw-0000000DFtg-1XIB;
	Thu, 23 Jul 2026 02:46:18 +0000
Received: from mail-japaneastazon11012056.outbound.protection.outlook.com ([52.101.126.56] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjRt-0000000DFsz-3cti
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:46:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qriVlgemutt44MOQyfPcv7CLa1vN1zpxIBGFgGlJr3GQ2I5zzICSOskM0spN/ontJMi1E9ADk0xBe6+G86rEizs8HJKNmFxgm20Yb5MuBFXOe16A3YghcpWrLJi23rCMwydsrjwCD7NenzEeapVVUxRQjo996iLJl97qtUvKbHk828Dhw8CR9/LRXK/apzeKN9eqcifZj0VD/k6/FdaTGgRuB7jygZsibgFQTkEzEVdFULq5fPRQ+Pc1DUMTgDcda25eR5eY24mzTWVDP4ZNxNVIvJu/ikSVgzerFgYuuVgf18dE8ZU3Qj9C3jB/Vfqiy/3oglgJjOrdLRQftcedlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=;
 b=Rj98fUqn+Y9mRDWtcE76d9+oab+TGTnGJTaAlkO7XgBv8TOi4xGRA5TRKvUZ75gwI6PrBD+oFrA6Ua3WO9l0/OKdhhqMnc89uQ0xmityUjR5ANN6qNP5TgrY599rhfgza/dwCx8DrYJr33PckYVSgeP7L1wTCwP8DPwQ4Mi/LRBloHM/YyS0/Gmq/M0xnzGXncgxQDnHInOfU9SROdLfN7NZZitfRP4FiAhkYAg7pyphj10fwI+RE3i+XV8FLCqu2tQTHSWGcfdDXXL4K96m33wy8E4MbkYlQSpa0DhQlL/FMojubfw2TrfYc9dsTs+SxY138WvZsJTiwxEkvPHJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=;
 b=U5Y+umd7dBOo6zOW4Q9n0g5pRXcG7B4gHRGxgYheEn3t8EP0pJVXghCA7Bsf8MWkm3NVpKyQRKQUQ+XkNXhq8SgPdClZj3B8Id+Qh/K245w1ad2dwJAA/UTsNmvb5OkEyp/qz0cm6u5df5WozciQKZ/JoxN3p7U5rKI6//nbk2TEv0anKGq6hNKlP7x9WRLwo0NfeXP/WEPKUqPHXAPfuTqxD0mDfkdfcSbOHb1kNbfd1mUo2F5EpxUdziDxfTDoGkmu3L9se7r2FBghlCME9Cw0utEmT2OC7o2HgBRuUGDPayUwmQbGY2VBW8gsoiKjLBC59yvRdKeglj2MQR94pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI2PR06MB5339.apcprd06.prod.outlook.com (2603:1096:4:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:46:05 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:46:05 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] soc: ixp4xx: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:45:53 +0800
Message-Id: <20260723024554.25456-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0270.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::16) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI2PR06MB5339:EE_
X-MS-Office365-Filtering-Correlation-Id: c412852c-6516-447d-f737-08dee8648a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|18002099003|10067099003|56012099006|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: FkXMJRHxnfaNZl+VbxUs46/Zt/9Py7pMsLMiCOpWrmAOWGUtMpQveKYnX/zNRhqA3IhJkGmmerk88oYnPoy7QEWPhAhyPRyMI63YwnXVyBgMa60PvyURUsPPJWqSJjqZPMSmi/jCmRGuS6F/yiEuVfy0tJBPcmN91zNQyeOG1wI6upzRhaYZHqAd0oONyNadv6NKHoJXYqKWg7e5MYz9bynlJo11DoJcFxQLz4TN/UIgg7jyQ6UlgJ23MxVJIhYIih2UYGWGCzhiGxa3MrMxM8WCnSxdt1/rOYDMuwEdC/V9swT5PEWbLR9m0UZI+ZGuqpGYs8QHuRc8gzoCgdPN+laXDuwwLkrwAb0KSBHqFsY5yMRiApwklT7rq2QtE07a3tkZbXY0FVpJhWXeFCpRahxhm6btorzqTKsas4skbOF5758cCJbUfOcGwG8GaO8HQjsiCnC6rifeCujG0fAiJjpMk5k27mco/t+4SF8QONOJiPQQQDn3YCR3PPg9slM7+tL9k10du+Q6JCof/qWHV6FYKSrN+OiF25J9d1eESCiyjdirMVJZ7qa0nREldPjEl7F74A5wm5bphGwoEEADH5cxv8vf6sEhlyvLl4Y7cGkUrrc6AGxje2RlXMsVs6A4votuW7kMPcceHxWg0ZirFlDWxtOfVfY6ThLuue7OMHHlFQzRLvFBJ+xzRwu/vEpqK9nDaKbg4X6tvaHjL9nOIafvz8zEJriuXEyAUIzfYm8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(18002099003)(10067099003)(56012099006)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zrImuz/ud7cJP4XGWmU3c2SlE927mI2MP9jrNBMSCxLKRQq/RYbuCXzxKkqW?=
 =?us-ascii?Q?SxNRRTlP5mp2wxf8G8LWaW+J5wHe+Zhg3GlRcawup2T2hG3fOj/5IZ0/xZ3j?=
 =?us-ascii?Q?O57K1bRRT2vEe2yG0YJRxGkfBIgeWxhlOQZMJuKlGsCwbQrdQix7t9iC7gmU?=
 =?us-ascii?Q?JBr/AbG+RMIhUf5OAolkyar9e3IcPckOCDj4aQ/BkLRX5LYWUNPa85AmQ/yk?=
 =?us-ascii?Q?EoEC7TQgNQN8dGzedksWgdM5rqfOqkWJvNTcooWFC/Ylp4AOTXiHnlguUj/G?=
 =?us-ascii?Q?WyANnmAlJXt9O5yJ2pm9o5Mx+VdpVSZsY1IbVMqBhcM6ADVCpl/bcrlDZHBX?=
 =?us-ascii?Q?SU8S/U8R2TrELv1tzrDIxIfjEADcVWa1vQCcvr8tn4Xy9NYVmrXr5AGQHXeZ?=
 =?us-ascii?Q?oAhO6nvyQ6Y82Q1Crq3/nSGKoDMPKzS4B01YTZGQ6rtel3mbckCvh4X0WMOd?=
 =?us-ascii?Q?tKmScAjgKgcP5AV5F7K2f+S+L/gkm0lbU/tC1snr/aeE6oYYCGzuaXzQH+dw?=
 =?us-ascii?Q?09WqexQs1qLdJKZGkYidvKMQ0hKNs6TQg2gOozlKg3+xZAlvXChSxsKHpyNz?=
 =?us-ascii?Q?fw0HJNqXEo0yJG7IH2dE83YPqEk1l6X55R9cAUAF+IqAhtw268hPH5b+9S6m?=
 =?us-ascii?Q?kzzeB5eS8wXPZn8mFNQjmPJDfc5EeNcpzNrIu/DQM4Lw2fJvtDR5O5vLdoC8?=
 =?us-ascii?Q?MaMLJMIAgu2onDEXO6ljDEKTv3SyVaguQkpxP5pXG0BDlectgtzJEaaCEffy?=
 =?us-ascii?Q?4dW+7d1RYa7lzII5ingqBtOEVfaqOA9NcwvhegRSbsgyElLovtO8f3JhhK8b?=
 =?us-ascii?Q?/75mn4E8vlh2YUEOpdmsMSYl5aM+5MqEEzwUWRTLuviavPkGtAkwS5kguc6o?=
 =?us-ascii?Q?xN3he4p2g+v/4vGJC8xC7sCYj5rJ2WCofj3eviIhQESp9YtlzskhHGL5TzTM?=
 =?us-ascii?Q?4lbhQ0a6I2FoKlrBDM1kPRrdGDIkXAm0tLwCDXM1bvf4ddk7y3UaZrqxZgNQ?=
 =?us-ascii?Q?IMJKR0YwzaPgFgsJij+HHrcpJXrJr01+xwNWUQWmjsBVkpdco1ehWWhLU18n?=
 =?us-ascii?Q?k4fBD1sHmGm07Gqa9cJUw5Doga6OULorydf19iII2FhpshwVKBP2oGlmDaHt?=
 =?us-ascii?Q?f5eQ5+jiIVsUE3vjEWxDCINz1kjeYpxbooc8DVW/FsaEm/gaYKO45LLeTpi0?=
 =?us-ascii?Q?jQOqGIvGFbY9Z0h9Vl45D2/05fN1v7HbrOSlZaiT3PA5L42Js9UooCZVVOgF?=
 =?us-ascii?Q?Oh3mwMVRKUbYe9Cz3Mr1NS5XnkkLV2zcWzFI/M1l7xAaRQfYWZRhh3mnuS60?=
 =?us-ascii?Q?MG16Rjdvbb4QXUuDCHx9flOrVBlBC4ihmFA/w4TaKgSuKVHXUsGpp8sOngwh?=
 =?us-ascii?Q?vKKbD5jeBtD3mr5WBdAwwQibw9Mgq2xKti+Tw7qbWASA1ge5Ljn+Jfpf/hNL?=
 =?us-ascii?Q?sPTBQepiI9jcoIhhaLddO4wADkByteeZaHz2YT3KDnRCRDtiaggyCz9lbXHb?=
 =?us-ascii?Q?GcS4/kMhDDKrzw9nueasQGVFuu4V5YbpjQL6KahyCNhuQXXGup5scCtRrybR?=
 =?us-ascii?Q?TNiRMkqUl1B+9NMNMc1P5HMTtNxhgvdD+Ih+mkNt2LVIffqvKAKdV1RgEgb1?=
 =?us-ascii?Q?DUnrldR8/cTygsH8Xge+ENwhXD9dQhoCwTxdlMGa1L8AGGPTXB32HizaWD9s?=
 =?us-ascii?Q?i5e5iuqfMRqkKmz7Xhr9duO0yN5HFJuo2DRgZuPqhZOctAThW4NHZnSPUzEX?=
 =?us-ascii?Q?NahTG0VZtw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c412852c-6516-447d-f737-08dee8648a5d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:46:05.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY7AhfaU8vtcydWWrTo4BN0occH2dbtpYduMC3R/er1PlwHv/y6C78hTQfi25wSop9DsxXuKPFkIvnSctjqSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_194613_901484_9A6797A4 
X-CRM114-Status: UNSURE (   9.96  )
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
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 475e229039e3..6e1fca630b80 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -421,19 +421,13 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(dev, irq1, handler1, 0, "IXP4xx Queue Manager",
 			       NULL);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%i (%i)\n",
-			irq1, err);
+	if (err)
 		return err;
-	}
 
 	err = devm_request_irq(dev, irq2, handler2, 0, "IXP4xx Queue Manager",
 			       NULL);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%i (%i)\n",
-			irq2, err);
+	if (err)
 		return err;
-	}
 
 	used_sram_bitmap[0] = 0xF; /* 4 first pages reserved for config */
 	spin_lock_init(&qmgr_lock);
-- 
2.34.1


