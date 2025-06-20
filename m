Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646E5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 04:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNVDSAX4nXU7MIRxQIXU+YdGrC9CnOi9x6tPJDjOTnc=; b=TVkW9PkiF2idCaEt+Of/XfcXai
	6WKxFLm3/30vSY694q0Fv6ajurw+XI/EPYXYiPu1T+M/I2jnfKc9RDmEAzHvqZuJQmTNT1M4UsDhb
	MkaM84kGzfRkDFx45kPFpsj58sWKkCHKbQsIWpaqCjSDvGW8d5gO+jRjirJgQp0ikNI7ZxU7tmQ12
	QKzp5SXIWpl0oAXJ+lOoak3zIo4QqDDs+s6/zIsgx95n8vySfNlaPFG7Tx3LtNa/7pVMZU0M0mCom
	R6AlF3widp8ox46Taywejn31hlT/d6QI/4UR8EF64T6lwvU5CcC4kyXtdUwnhZYxtrgg4E6rKatD/
	xUM1+jJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSTW3-0000000EjeE-1R5K;
	Fri, 20 Jun 2025 04:38:15 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSTTp-0000000EjZS-3Fi8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 04:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsUnOq1KDIRR1/6GwYW9r6CfmPIWm/6vLB6pdAE3EPZMdz0pkG8hSQLWyqWfpMQMLA0qi7901EEqZn0Yr+teYNKbVMRvsipMFoW24FFRrEsPTYXyQ6gqwsP599apanA0tyYkTiLjT5CutLiXGnudI6Vw5bnrV02qRiV0EeA9bcAUnV7kveWAker9gLzTPlGYmfD0xVFkzEFjtnvMfjII56rPcT45ICK0NNX0gO/96TrHzXOd6qgbKw+l5/CuWVXDb13Cc7RAGerLannzvWfQVe/g+am3nqH3k9/cRY7+fHdWNayKu7uBj4FzR4B/CJ+oNwyIQcoT+nUpLDQZwLsfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNVDSAX4nXU7MIRxQIXU+YdGrC9CnOi9x6tPJDjOTnc=;
 b=OQA55ba7/a2NANVz/30PoneQrhGyvWoTPMoYCcN7MGlIhSY1jSmSq8K6VE4O7XdeWd9NRZ9QRpdd0nU6HN7v+fR896RbuRVuQSpPaWIT3UkOjX7ROMBn/VZ7Qc9y1JXxmnUfAI12wnEBFE7dW4IX73rDunQuSkCTrCqU3tUaLqH8nGspwVIWe92HJmrXuo+6bF9NuZGgkk4AJxEes5FWxjRFDcD8gs4wZks0FUxTFom74xNuCIe0C2Ysr+8+8JrySDtYiszD1fmjaYpvKWVn0J/nAN7sS/hq/u81GBODv2XXV8u7wSnxPlvV24NBaqUU840LjT4IjVtrnyew6FX3jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNVDSAX4nXU7MIRxQIXU+YdGrC9CnOi9x6tPJDjOTnc=;
 b=ZlsLjc+sxBP+E/9ic0Es21vw/W/P0wlfUgtyt05Uenfr/lgAmdRNLpvXFmLYnbMbr32xfsTbRFipNoUzcwJD6ISbCQ9kygk9JJRhxYluRlvrfdpyJJWG0ydN/Nkpt+RvMLO0oMwtkZjGJ7Cdounh4o81oeCo6Gk1tLKDkDno/xcGEp0lokeI/7gICy05MWQavyXxNXno0/EXDtkfZ5Fh8hLreycR3lFlSIDAfXu7qdlf81bP0qkSlki2kx9edr+eoi8PSWsNgxIJCE8yELS4yqSN0gHh1s30zmBPFIqs9SW1wZYagxibKQfAh59Qcfe0agLg+oCb/x0+Iba0lggPJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5)
 by SG2PR06MB5153.apcprd06.prod.outlook.com (2603:1096:4:1cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 04:35:33 +0000
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::710a:6dd4:e9a6:59a7]) by SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::710a:6dd4:e9a6:59a7%4]) with mapi id 15.20.8857.016; Fri, 20 Jun 2025
 04:35:33 +0000
From: Li Dong <lidong@vivo.com>
To: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: opensource.kernel@vivo.com,
	rongqianfeng@vivo.com,
	Li Dong <lidong@vivo.com>
Subject: [PATCH v1] mmc: Convert ternary operator to str_true_false() helper
Date: Fri, 20 Jun 2025 12:35:17 +0800
Message-Id: <20250620043517.172705-1-lidong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:405:2::28) To SEZPR06MB5022.apcprd06.prod.outlook.com
 (2603:1096:101:48::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5022:EE_|SG2PR06MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f9fca2-ebc0-48cc-9ca1-08ddafb3e493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qp5QBi+IsrdWIH68hpojDwrSQOjXzebrob7j4zvP8Hie2u/ARYDhrDRCCwcE?=
 =?us-ascii?Q?uMrpw+FIU0CNYiN0DmfLQNOibxD6vaZoojR+X3JcA4T63NDWkN1VQuzzVeC5?=
 =?us-ascii?Q?uLU1BQlezo3nYMbX+gH/Eu7zuyIknjbJ//GoMYewWIFm4BFP5Siu2Mxsf4B5?=
 =?us-ascii?Q?TTvXJqgQUF2wUp5ebeYoTeztI+Cy8k/5p4eozsHijRHbIsuZr1bAaHMkykIP?=
 =?us-ascii?Q?cjX8Xhc/B3wEPxx9DD49s+DvTlpWGCLQPPi9yhTxlcURCsMmDLzvl1PwguP8?=
 =?us-ascii?Q?T+/c0mUJIuQs+3U3XRcvbLvXCIN8hCoNdmPkT0SIc+EQjdSzGqj2q2bAQKPm?=
 =?us-ascii?Q?BeACFJDBMaYO6pszeZgL41ZNRU9qPNIpybKygw0CEGw20E6YfOqXQnbwJvgJ?=
 =?us-ascii?Q?ZroXSaQ9ZOfRnBGfyUqbDOTzh0GD2MvwXA6XYyQgl31va1rZAqc1csYPrNOO?=
 =?us-ascii?Q?tjvWGLrzXL6xhIyWIGvgkxXSxUPWL+NfmoOxaN44N0wi8DaNWbtcBV/tFZ8W?=
 =?us-ascii?Q?OWZ3ccBJO1iQwI4nGxIFQ9rDkXf0aVl8snmZQ3sBuSG6R5CsFvxGKlGsQlcJ?=
 =?us-ascii?Q?D4mK1plnXyWvj3qqM+VvDGvUHNGESZltuPwExxzNbOm3mODl+wPmIhuI+HvD?=
 =?us-ascii?Q?G2C5Nbar0aLU7EvXVJKT6235mk6BOarFuH+iZ1wurrtiPi9SpAFHYmudYn3v?=
 =?us-ascii?Q?d0oLjzVNNpRalIChmlrFPY/nc83W57+mkTCySoOwOjufi4agY93ex9GdI35X?=
 =?us-ascii?Q?KhfpbVsg1Hr3MbWsEsljv3UbxfgmXpSMa0kIv5uqM3eCUcbexC8h/d3nCmr+?=
 =?us-ascii?Q?S8Qg9jDovwOkM6EnBwUD6OwzZVON+wCDt/0seGVQBVvqCt4cZwh3sk8rZBUC?=
 =?us-ascii?Q?X1GbXA72GdIpQYsX1WqUuSBfJ5a+rIPm7U1bfiQiufCfw0mqKRWnTJoJzaAc?=
 =?us-ascii?Q?QnhlgM9dArUSok+aqCUbyvA9BY85Ot9CiF6S9KyLKnw2De9U8AlZpbNY2Gl/?=
 =?us-ascii?Q?mepe3DH3Wrm7H2mX1tVwJnmQF15gpBBGilP7ODeSCGxhMX1cWxBt4iIM4rj0?=
 =?us-ascii?Q?dUy9KWumI0haAgOvO3WUGH704uEEeENaA5/72+8yinZ7NDYIZ87iDl3f606L?=
 =?us-ascii?Q?QGZ/Ob3lb2JqGc4KZ8cN4jQDRoAUULbmESjI3R/AyhmskyIR+uF1tWFaBGJs?=
 =?us-ascii?Q?sG6Beh/sQoxZfBhUKS8KN9kR4jqYgVucmLKEnKDm8BoFIS6x0X7AJUd7MnBU?=
 =?us-ascii?Q?panb/MmLiuddR4cJgsDwerXdShmZVCMR5hG/USUP3jii8sWhtDQpAUcdB1n8?=
 =?us-ascii?Q?WDVCCfZ3lB1a5OvVhtarhn7k3ebWwjMRrT9JG7Zvo6pnoCrD4U+z1moylPo6?=
 =?us-ascii?Q?5FV5nB3KCH3wF2Y2oYgbbznwBB/1mPUkDk2oKdMxa6rPo3TxpOdPWkGILMOj?=
 =?us-ascii?Q?gnMgbbRLgRo1280e4Sgebfp2F8U+tzHepNEtDga3HCBOPe9mpbkT/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5022.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UeFvekHeG6eMPG575Xa2CIy7zVeRXXo6J1XFP94veZHjytIQaBGsFuoENL4z?=
 =?us-ascii?Q?bb3zIFyTmhUBMLRiADC9Xo9iiE6pbqt4mcli8QIfNi+wEPNnvT9w+SbzG+87?=
 =?us-ascii?Q?MZf7l03rg+P4kYGljg0uGbO+hRtQhv5uaFE7xlfo+L13IrKSkP/h2Wr6fhlG?=
 =?us-ascii?Q?7QpX3qnC45BTla3bcERfRy6OOD3tsdGBFZn0RbZg6CClNDwO/ZRJRXxbiFMF?=
 =?us-ascii?Q?F4cWtz2bOMlAQ7ie+QZGW6/7GPhN9kHtjsnn16j4ybdxPkB/v+DnkR+3FzCs?=
 =?us-ascii?Q?NEFXBX2NJbTmEX7VGjjZM1Tkp17pn/pvGDnJ31X3b9CQc7IRBJZKqL1wwuWp?=
 =?us-ascii?Q?SewHn8wcboo16t/SprKLq68fW744biTJIxLrwGQdyEWRT8EyEotQdohMRaHv?=
 =?us-ascii?Q?RhDLMcqU334B+1PaiYtSAdWekgJ9YSWvtg5ZCnMMvoZP4pm57hyGKEFyRNRd?=
 =?us-ascii?Q?j+uH7HopQAnvviJ21mQD53+3fqXsyefxhsjF4PUKNB7oRJA90Pga7ZwRWI0P?=
 =?us-ascii?Q?LPhj1vZUuNaebUMCYYIlqpTnKzmzBPnKIncpu3oook44+M5eZR4cmXi9TZ3H?=
 =?us-ascii?Q?IWDgTpC86IYr4TTlr1zGX+ozb7NLvINSPO1SCHwJ75jHDyxqISP/AnY4GAGf?=
 =?us-ascii?Q?SvopuZGan1pkY25Lx0XJwxU5MzgdEqTQwnoaTZgZE0bn+fS8XcBex1QBM7LN?=
 =?us-ascii?Q?CBnDBYBQxCVndYE0bJIrN4wKAwVHUa9MEHgG7hrGDqdLLa6zKdHapBURgJxt?=
 =?us-ascii?Q?xIArHoPYc5lEWzGtGgI8Trp9ntzHUEfkubAd2AWUj097BlcY4s5JQLT+pifg?=
 =?us-ascii?Q?d/G9E42RCsR5QP/lVS7gpvylZOq6js0a0W2lo/GphJ57SoLiyOhni2qO5OKr?=
 =?us-ascii?Q?v2fnR6VZlWdhHyBtmqHAx/arsGPSwBzUKq865+Ks/7/ukT6/RLqPYZyxgoPl?=
 =?us-ascii?Q?NZ8iGT8ppbJBqcjjKuAr8gDfCs4INdY88P1PIy84jIyTNSJ7MW+1Kk+NGOBN?=
 =?us-ascii?Q?/zbx9f7vun3tTOnTpxx0h1nsUqp7G/4hKiU39nogrEpwlrJ1CVgS4w9B8uFJ?=
 =?us-ascii?Q?N/cD2qnqWvJu8KKAOTS4/QyY6tpN3AUBFdRpV5PBI1ID0jIo1tKFV9ziRxmq?=
 =?us-ascii?Q?kBxgFsrGABoGNtW2ra6GStJdTxpN055xeH4TLSNtuHN0/S1oxrWdfWF165+E?=
 =?us-ascii?Q?y6599KyoGmP2jBeG7GjB9jpkV3ebtMMDGYArCdBviwby9T4tfs78/7QRe0cu?=
 =?us-ascii?Q?qRT8woSWjqAkFLhFMwbAXP5bx43l4a60dgBdFx8SDKlxEaK08aTTVei/Oi3m?=
 =?us-ascii?Q?/tqin7Cq/0ATzya7w9PJ61RO9HI42ABsQhsZH0ZrT3QSa6HEtYv0RyLOXbw0?=
 =?us-ascii?Q?oGOTUp1vhPrUyg5oF17A2Y2w86l9b3TlbE+/HGXt9n+pjhdlzPT5VPeytOGr?=
 =?us-ascii?Q?GAsVAN7xUeo6WAZBddjW4tZDYMiCx9UxE23rI9mgI0L+bG0VEQz32L2ZiYY1?=
 =?us-ascii?Q?nuzr7tKGgU6FI8s3U8au93+hk8j7zM0E+H8iappKwyBGQi5Lkf5hadZuGGZz?=
 =?us-ascii?Q?3nDYYb83OU21G4JuWttUYsPQCWXzeJ5cP4ylPVTA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f9fca2-ebc0-48cc-9ca1-08ddafb3e493
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5022.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 04:35:32.9275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8P/m+afztFIuu1epgYws9UgHQElDCNbJnhoLoB/3Z0E235PWXVLSQ5TCXWS39aotg9Ll6dUrwq0NZ6FMYnBy/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_213557_806737_74904E38 
X-CRM114-Status: UNSURE (   8.92  )
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

Replace direct ternary condition check with existing helper function
str_true_false() to improve code readability and maintain consistency.

Signed-off-by: Li Dong <lidong@vivo.com>
---
 drivers/mmc/host/atmel-mci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index 0e0666c0bb6e..1f11626c8f47 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -38,6 +38,7 @@
 #include <asm/cacheflush.h>
 #include <asm/io.h>
 #include <linux/unaligned.h>
+#include <linux/string_choices.h>
 
 #define ATMCI_MAX_NR_SLOTS	2
 
@@ -2264,7 +2265,7 @@ static int atmci_init_slot(struct atmel_mci *host,
 	        "slot[%u]: bus_width=%u, detect_pin=%d, "
 		"detect_is_active_high=%s, wp_pin=%d\n",
 		id, slot_data->bus_width, desc_to_gpio(slot_data->detect_pin),
-		!gpiod_is_active_low(slot_data->detect_pin) ? "true" : "false",
+		str_true_false(!gpiod_is_active_low(slot_data->detect_pin)),
 		desc_to_gpio(slot_data->wp_pin));
 
 	mmc->ops = &atmci_ops;
-- 
2.34.1


