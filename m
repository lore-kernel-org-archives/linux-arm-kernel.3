Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C7ECD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gg1KuSgqdJrMOLyf842WvjL/3L5oNbqk/qu2CWJveA=; b=aXAs4DXf7TdQ1q4uslxjKyx8Fk
	/D+KV4gL1jvTqGza6kzebMzyibIfkkW5rKQ2CutqcYbayT85FtkUa07Mc84QA2Z4cOiqDCKU/FaHj
	nCetRacEJ7hN2FpYfUxCv9bKVGTwdaGCqe2SfIVtWmWIVAHWhli/Cd+V1zLEQ17b4dV+m80bB9xRO
	s5MQo5zzgxl13QJpl9NivATkvOGUuwZc8XVvXpnSnAwogfVORJuSuzTRY9srF1juq7Th083aH01Vq
	SYpohoUvMZW4Tfp4DX9cENJJAS1YgATmIFcjWOGPHM96k3IyBtKHuxK+DMzAbhvNlgSlOKXOeYXdx
	3rzSYNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOU-00000001Mv6-2AyG;
	Sat, 06 Jun 2026 02:04:14 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgOP-00000001Mn9-3DAj;
	Sat, 06 Jun 2026 02:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwIFm1vb33b8O2ctYHxztbV4n/zahgnmZHJR2a+Vxuz+vzSNO35jZo5DzMZuvGBWAY1Cw83ycWGsSNQZPUtPv8HwHMWud7TDkqWaviBBrvoh9+sTfAt3/DnNZj9aPhTjqf1ugwD/MSVoFvatmWwlmBAnf2VcSBUyE6g8Dz/yej6fFUB6P1lkOX0iB+qtyIR1pQ68WVU/uv4R2i8gZeWw7WDimhyniKueJPf7OhtQLGxIetaM/BKyAcmJlaEGna3obtLUQxLS5ALZzlsKvF9IYUUEfUxtWs4UIDiVcsERo5tpuZUFYcc4xBLHkOx06t69Kv2vFfqHfILq0D/TDNZXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gg1KuSgqdJrMOLyf842WvjL/3L5oNbqk/qu2CWJveA=;
 b=AEtUyaQiVt/TNDISkMSdSK5yngcgxwaIjfpBBQpi3J8Al3H3wFxir4YeS6OeV+20EVDddIvNZznyiSgURuym67okB8ccs+G26pgtBPQh9An2IZt6vb1DU6pBPUzGQQjA3RZ6jlWopQr5+LQpKNdTPKd/8Yzlfh9q5TKB6ffoZbMcD1DuqTgii5wJBDyntQtCFlZkDKjWOcrVnNoisClLqxZwizWeuo+lNPxB47CbcE9mik1dArXGzPA/ZmcTKZb7K81l4h3EDldlsOh5CKmZnzd/7TNI0VxLNqqoT8dIQApJ8eL0wSUlcvFqshXNNvWFxQMhH8U+ZzWafA/lhqozIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gg1KuSgqdJrMOLyf842WvjL/3L5oNbqk/qu2CWJveA=;
 b=RGlIbK6sn6/TtjHVgnLPbBzqS0wY9tO/eDtsLZ47olAbaUnfc6PwapmWMrgY3tvcB82SB7Qcs5IQ9+mFkvPrb+CXLVcgIy1G3R4HLoydfoUV7nEMqBPNOb3UCRz1SWm5brl5JAJKsieQcJq0zjh0vKd5M/Ou2r03Mt5DTYfiUlssSDvAL5kn4q03XSQT1i49/YN/jnJU9inkOhbWSHefSM+Atxt922vawlrf06uTuzeAukLuBgG3xW2P0tMHNMFyXtHbktyK+Yi5BVi+VhSdl9Csz0bDbvOEC4Lw0tlmh3QRsClbwqORBRwk3xVXKkWRoJ7VM5MDunvbSaTH71xLRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DU0PR08MB9558.eurprd08.prod.outlook.com (2603:10a6:10:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 02:04:01 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.006; Sat, 6 Jun 2026
 02:04:01 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Markus Gothe <markus.gothe@genexis.eu>,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 03/11] pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
Date: Sat,  6 Jun 2026 05:03:34 +0300
Message-ID: <20260606020342.1256509-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DU0PR08MB9558:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fa5c21-2e35-4996-8883-08dec36fe08d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|11063799006|56012099006|6133799003|22082099003|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: Vy4y5dOD96iEKjG4wHQ53pTngl4Y9bzl7SLeKbdStWE/qazYUervz9t5U+XQEOtWpwNQXVVvj2E4QW1F3ZHH3U4A6s6wE8oFqj4AW1Z8khN8ooEX7FjkRcOqU8U3MIcWaUv99tAviRuqNcVvXtFUK3saH6g11zoGTBC84Fp/lntauHmZYCDOOhW/zdMtLMRV4zPeAdHKFv6X0nEby5tIJcyNWl32QrXdHhPwqe14TVx5yrC1Xhow2cz8KidAyuuZHU0+sn4zFe5/4FeNhhM3yvGyyFJleFKjEsoykMbBlxYFSZSQl+SleOc1kmnAz2YGHu0c+7bnhWjSPm6iaPFJM6YuTmDJKhDHrfwGYaobjmUh+zVeeoAhH6412llMUn56TKjoPS91QJBCyB2Y/OK9/uoi5j+lpai/GuCqQD3ht+lwNMl24sbcGQkB+fUFNqMNNxpd0cbtax2nJo4uWWgS4mm0KN0QIY3AzBjhXlBNgB/ZJ5w6l2V9mOcEd1sgP+21InFQP5vmu965DslWs30TdGxKrymbpQh3G+mpgb/oiT5k9Qsf1IhUhFjkW/nW+Z4RhYzqVIic3/74g866sa3+5PA2DKEIP5NDj5yNsSEMeQowyA1HeL9v95ekursztySrngWaRB/cgk5Qa2szSnONxwxkPhXeusq1rOrwBynMd3hc24QdtYwtxe8IV2/0X62YzykaQL+03j+DuKgEj4t1+QiicCCxWtTqoG0i/LjZZPxwPhXLjFT3FO9TjM/yYPtJyoXPZ22D3+0IU3ewJllLUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7WffcCB8NM9DV/Yp4EhhnVmbW33Q7p2dMn2noWbSqlwJ3E4YM1dtYjQjLitv?=
 =?us-ascii?Q?G6hUcn+oofwDgQFktVItseDnQ7kBMx6mULZykXpNFWjqXxitwHeLM5KQpPye?=
 =?us-ascii?Q?xxxbG8ojdj+OFNo2OWHwmVjxpKjjldg6q/Ufdw501eWUU5eJIpZHCRBLme3q?=
 =?us-ascii?Q?MVGQX9U/s9JAfpdtV2TjRPmXCCHalJuN4O1AXaqPj6PG++B5ZP5CZKICir5a?=
 =?us-ascii?Q?MSa6uhRYfh/oTXpc1aRKTa90dRVxR0tnM+p4zjPPzng2Ajr20U5Rn88ijmAN?=
 =?us-ascii?Q?u+ccQJ/MXHMvo2x0JFx3Tp1CoIYu42Q3Hjudsh+v8ZtbCbDQYJE9Ex6J06Uk?=
 =?us-ascii?Q?c/mIIfSXxnM3z3zhQNemgsnwJavJCNANC1WkIqeogabfj/Hriffdvo/4Jc2M?=
 =?us-ascii?Q?V2u7IdtZr6GkZhF7vUC4tGyfFZahUCfPrP/dTwvIyZzBmZRSSRzT6mU1JrKi?=
 =?us-ascii?Q?+32AkbrwagsyGf+e422X2IkAl6FO+6oD0crYKaJ12JptZrR8Rxi38Kp5V/EQ?=
 =?us-ascii?Q?BLTeh18+BZus/jZWcZ1HowD3iiF8RKQbeE/SfpMJMdAWG3TQ0UXaFsVZNQh9?=
 =?us-ascii?Q?G2IR0VrHtxkIdeI8+bIJWWbk/ifLFjqEhRC+5KS//DnT5dbyulmwisYPHTEM?=
 =?us-ascii?Q?hWECH5qA3lcxa2enLQRsPqnHOFVLiURMQRZroil1lMmB3ZIb1fDjn4Z/NhLG?=
 =?us-ascii?Q?sVF8HP1gcYYmsXFlLDxmkjbk/aUd5p07vtQ0ndbl5Z+AEZqx7h23HUsVf3aX?=
 =?us-ascii?Q?E+lMb/HJ2dVwijiDfHYLjuJXDFXyGheNyl9W79FNWYRmKRwoILAjqNKSjU6O?=
 =?us-ascii?Q?DHLvgmN8wgIMOOxO0+EC72iC0INkGhRglYe6zBdfunPkpWRIikZFFhlxcDS/?=
 =?us-ascii?Q?uUaafF5m1rK7pMue8brpjsJ51LxN3aGrnIA30uzInxAKsGgEX1e9Kcw3Ojq7?=
 =?us-ascii?Q?loX7+vujZS1GktOAhOfAst+R++xp6el4wQXUkApvaPGkWBEdaITBmgeVcqUY?=
 =?us-ascii?Q?wZxINHqrFfp2LuwZCaXdWtx8C7bFRz5N/gMxDVvMtkwO1Zu4dRCHozBizZ0G?=
 =?us-ascii?Q?53yoy9jIJokRFFj9b35eefU9owDwxVSUz7c+bBdhUaCV+TUF/op8n7lHVvl4?=
 =?us-ascii?Q?vM0KaNqamF2QEnA/CSea8Okh4pUKtaxrm/AvvO1/lrOfSYMvy0Pdb0qR3G//?=
 =?us-ascii?Q?dnxTeQgAhcb+AJ3iIGwO2I85s/BvXEELEF+Ip0CF1FcmUTIQ17pf6ErnN+pQ?=
 =?us-ascii?Q?x0p3Ocd5gB22IN7sUczrOJtKWmbP2gnLU+7pd6FSIGflzFzOGQheN5CChFQB?=
 =?us-ascii?Q?6XfTnVS5IiC83I1SgdhPzmQo5gsQLBD5GxPeXJ/q2H8Y1AqZzZDox9e2reKS?=
 =?us-ascii?Q?aWFS+PfVGd0jVg4+VIxZ4Vkz+zRV94kg6iNMgfuk4k43rsV0ZompVkTXt5dO?=
 =?us-ascii?Q?aeYNBhASJZ6dkupxwKcDg68hLxz7sH5TfVfgV57TSAjjJZdPCtt8RNGxZXx5?=
 =?us-ascii?Q?TKChEB93ffxrOLoG3zPgR/LCxR5JZ/3so7hPQEg/W6gtFhz7yQco/3nbAV22?=
 =?us-ascii?Q?PqwF/i7FhfWnUPiwwOZmEkInmtMSKodbbtY+tMm6urKYxSm6a7T1Zt8uGSgH?=
 =?us-ascii?Q?J/QKhAmPPwx3Qiu2o48igRvtFRq5oF787GGdAoV1VFnJ3PZwwI2g2iLJBYGo?=
 =?us-ascii?Q?JpvAk6nEVgpwbbQsh+SJOPr407EUyzOTOwOZPa7v02CogsEmYU0k6Ru4CUhc?=
 =?us-ascii?Q?L30dwmU7l7gM/b8UhypJJ+3+8DRK9VY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fa5c21-2e35-4996-8883-08dec36fe08d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 02:04:01.0803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwwUVE2NuhtEOj35DCvl9WESzO3KvJDG126SjnBiy7vjU4Jh3OY1+bcaRN7sCblkA1BrUb9zPS+PJetYJM2wNSkC9UV38VsTLDWM/PYt00c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_190409_812695_07A2E273 
X-CRM114-Status: UNSURE (   9.62  )
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

Pin 32 (gpio19) duplicate pinconf settings of pin 31. Fix it using
a proper bit number in the configuration register.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index c0aed1b60792..14b235727736 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1798,7 +1798,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_PU, BIT(22)),
@@ -1915,7 +1915,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_PD, BIT(22)),
@@ -2032,7 +2032,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_E2, BIT(22)),
@@ -2149,7 +2149,7 @@ static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(29, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(30, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(31, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(32, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(33, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(34, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(35, REG_GPIO_L_E4, BIT(22)),
-- 
2.53.0


