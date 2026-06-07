Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23930CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 00:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=; b=Qb2bIvs59d0aUU8DW+YqC4DKeD
	eCaIuJ89MOa9pXZS1fawuptQ1CxOnydqH59twvn01cYnZ3Kd0zX3LBJndvmHVyBXFFVS/jVuWXb8X
	2Z4eQCuhZqHeGS6sTcBXa0wAMOkZuAjx1fgVL4VXFxR4eakMreVOlcGj9yP0WPXI38tT9oDqN13a2
	Y5PHadiOKKJ55FD00W3TKFeI4zrdNQdurpwA/vrSziS83NR2w/pDnxZkllHIyqa5xNJeWWd2yCWDE
	69H/ANMMVOnUKxTEh5euJ4AKtpwSJzU4QbMsJ6HYPfUCSSlW1QQVxxLjz7aCUvBP3sQoabUndQbxJ
	zuiTt5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cn-00000001uze-3KMr;
	Sun, 07 Jun 2026 00:17:33 +0000
Received: from mail-swedencentralazon11023089.outbound.protection.outlook.com ([52.101.83.89] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW1Cf-00000001uXJ-0oaq;
	Sun, 07 Jun 2026 00:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOup/LjUz6g9eLqgpUKjtLiQJ6bDQpP6Z//McBdfWl408dGoOfzh459SvnGQaYg7iT7AZGE+tsyVBQe6UOwKIg6XzWp3f1Du0CXRHzRbLcT6s0eKYvbcuSIqoBgzKoLEsKy0lbaMxy0ZqUCK+m+AtGoB5EaP/dEQlEO4ZR1T/FvxFwOYszSS8EZDm3lPcPtjcrAWwLHUL905VKz6jvatGYcV4ZMWP7zvaCyQ1K4dXPcr7OKmFblb/tSOZ/XrvwIg0cTQ2uGRNZJ5pSosCA4EiT7+9B4B0apNMAnoszoDzFvbiYl1XapRjx6xB21KOGaUBMlnxFpAEv/yyN9/aghUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=;
 b=qyOdPp0Uf2kN9hEr4TpyhtcwLGp5K4O2B3ie3TI0eO6H0q3CYzDoRXna2e4Gsh9ZhYzAACjlc7VcyaB4mE4jYohZOy/RJZhRd4QtfnnNJWaBBKO179Uo7ETNJr4L3zdZ2PYDMnkxvxr3jJC0Eo3YUK63tjTRIC4Rlt3jLdSoOtQespLobwe44veAvSqqKBcgON5ICr2KjcYNri3G+nZ2AZDwL5GYZ8vp6bf/yEpBvHJT9m+ZjtP6ScfSG+sWvfwawN0h5Ir0MtBSkViAx7jS4L5Wsj4WenlzdIOC3SsgwpjuRYMc8ewdtOg49l3d6Njvew1Bk+Jy+XboZe5sgBpCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwx3SsW5XXXJS3P+97HKeelH/SS4xsMtaWYYAJYZswc=;
 b=ycbCH9xWMdezXmPiMzeSkX5h4ttE0bd9dhU8E+cuecqW1cqfa8AxRZx15gsVPsfdK7Hjq44zo9xZV1ymPFGtN7znnE7vV42rWOYmAoLt6bbNGx/mIblrBHhT5QkMdrpga3bdXsRusaV7gLWBWpafS9g6GMDUlaRbKLRJjcrAtgwXvgslEFkOSCSU/kBziDs8w8KwITvWloBzBlB4J1SfXgo5nOKjL0XRymw5YDsNBNqi99fS2V+A7XvvePPlnKXiT1n8eDgBQJQmPZUP/3moNjNrLIotnogpRXT0m0+WLlj1G0odRttETCarzmtT1LVCkP6QEnhiXXBpedausOftJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by MRWPR08MB11707.eurprd08.prod.outlook.com (2603:10a6:501:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sun, 7 Jun 2026
 00:17:17 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0092.007; Sun, 7 Jun 2026
 00:17:17 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Linus Walleij <linusw@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
	Markus Gothe <markus.gothe@genexis.eu>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH 10/18] pinctrl: airoha: an7583: fix phy1_led1 pin function
Date: Sun,  7 Jun 2026 03:16:46 +0300
Message-ID: <20260607001654.1439480-11-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0001DBFE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::319) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|MRWPR08MB11707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c491798-a9fc-4ad2-d123-08dec42a21e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 74ctCzighXRyYxJFiX466AbZIQodfp1j8F8ywBBl1o62wf/7yGB14JQHqbKgAtcBhntlSyjdU+a3MUusOL/XXNhq8BaUGgYXhgEP3vPwIOE5CS54bp6BehBJwobDJnySlArewCg18+/MruvNIIh8+pCwcbJzpSsGRvBMFYPtvdTu7KjCqoKJbp5Tc4F5hwPd1QzsDGuYnhFmO+mL5Jm31POL0G6kYig2ZSiI6ETgDGI7vdOEmKn3YOBh0xXLzd0N5TNgE/VenFMxHzIzLG2m2IqfjER7E1JPOsFSq2JOfH3yuXqkpARAguwQIziiO4Hw/j1DiJEPPXLquNn0hual7CtcZi9rk1dBaPI5DjBGgjuDquoQoDN8yjcXmvw+PXcpx2ANKwUgTB7VT7SuGhs6WiMmMJyhJCHpvFrcqUZ7TW8kLyN1Rx6QUPb02FDrTdlXRR+SKVuQSib2kfnU8TkaXK81q7EwOMmSJ4Mw7Ril+7GqCZCHFsnKiG42ellBEC6WGs6xcCkbzTl2vhAuc3uLxqelcqILxITe6/y1rAECoskjL0tuq3/ejQIW8Cs9FjuSCRhb2LGFcTIpwGP3l2y6+q/b9u4Z4ZAzEq2WdkfwCe0rJiWYS/hdXi+QKy294hxrOgO83hyPKMHX7bNuGghWNh2FqaCxCGdj1IedlQH7Sw8YHEeWcPuq5hgXzpLLdxnPL/jX1BxiHSA4Tf8M76z6spE+M4TnEE1qC2CXgPXKmwta76OmwiYi+V8rkd63a73Y2aj5OYyTpsRG2jFi28MsDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l71Vk7VLfrl77l03CFP1nJ1gPTimV2+Z6NutNyoAlmkRnOJcc/ulUf3CpbN5?=
 =?us-ascii?Q?UzSdCJ0lqoT5mtZEeHnBpbL5YtulVO5nu6uQQ6peHuvulE01piEsfWXxya60?=
 =?us-ascii?Q?npRJ2ieYLZSTt57E7A7W7fn6pVXjvewGVnn4VB4mPtasDyNQpWzNhyK50cpQ?=
 =?us-ascii?Q?j1ncyQdi+K+BBR4kN01vfB6L98XiiOsZDr4gSWMhfW2AkF27MvdAA2e+FKIo?=
 =?us-ascii?Q?Vs7kMICBBDVQskgBNvD4lqwMOJqpjVOv6n1WN/y47/qbIhaH74XlDmea10wd?=
 =?us-ascii?Q?Swkxt+GebqpsHg2Dh/CdG9aIvdDrTJOY4oMwlGTscEFHfz9Hzk4Drs8n28FQ?=
 =?us-ascii?Q?1lFPERiMLMEfePBPmaAtIidKgBpQsnbAM9UJObZB+d5uwhltugwfO6O0zUKb?=
 =?us-ascii?Q?roPV/z7/wLfhxu00Zc/J5IHhW78leG3WQXMJPFkgDUUa6AwyarYqym32eMXo?=
 =?us-ascii?Q?qQBszMXdXWu7or5g9R5ekUN3FTLENmXMfMvhWODgIjkCsKga347kCjpAygCB?=
 =?us-ascii?Q?EbbUCepv3Fi/7WlY8beDiEfyX1weZnLNrxCCcD2uijRyTvNZPaMEWm03whl7?=
 =?us-ascii?Q?SQmqSNVsVFu/8EPrH2uBg0FXsVODjEONYwXUkt1MimtZdc9PM0ucsA6Ls0LD?=
 =?us-ascii?Q?5jSnmBt1a3t4LF61oX8VTNxN6jujs3zzkxBAScfcBNuCO5tWpXBX2nHM9EZc?=
 =?us-ascii?Q?UpmOdUVuyKWKetC6ZjxBf13ifg1Y/R3aGT3R5WjrOawLDpULoAjX4Diwv50K?=
 =?us-ascii?Q?Ue/pJUL3Dro/vNbmrytSMrE5aQHWken+w/elbGqHBu0+q6w39ggypszA3nI0?=
 =?us-ascii?Q?AUBJjcA3Gotxr2munXNHJgHKXS5/KDdhE+q6A6XYYuO+THFXj4JO1BrmFjyz?=
 =?us-ascii?Q?uwznz44Tg3g3Fbeuet9q03s6FZEr2VKj+lKjJRso40hfsami2g7CGgkg/aWY?=
 =?us-ascii?Q?0kEVm/ntzhO1FdLU9xPFbY2UIBYH8b5tdhzdZEEY3JaUSNlSoCfUgsVqXuzi?=
 =?us-ascii?Q?wmAjErC1Ek6ccNRsYE8YQRBL+CFsA/V6S0rplQwkjVD2SWnYM1vvu9+8W2Z1?=
 =?us-ascii?Q?wLIuobcTUQaLLdpbm4ad6XqOqHsZMefy0ImcxZBxal7Tp66ppIypaa1eNdjx?=
 =?us-ascii?Q?wtmjAduRGUrF2DwSPgJtH+PRcAjztOOs17lkGDpL9aIF7OTqir47qQHxK4bq?=
 =?us-ascii?Q?XsxO8068JoZP26kgHd0Rzh3DtNuNRtyiI9r8ovzYSif0wi9WTbleG96tnXLL?=
 =?us-ascii?Q?vLguFn9cfDg3pYLHlzjxKmKugHi0IUTUBhXVaNd8fBHG/wyr2bmVybriofzj?=
 =?us-ascii?Q?rbKcbOwjbhYCW4+vV5Oz/J5NwYddMqrlppx6VX1SL57KzCMHSY08eqDpz3y7?=
 =?us-ascii?Q?9IX7HCb6ndcZwPd7mGUbMvlbSCg6J1iqIFqwPIZNOTkQ8VPg3QRNQACdviYi?=
 =?us-ascii?Q?DfLW3DMXvBZkjwUd3NM8UpYCpiWQN/NwGnds1rQ4EX7ldU6nmOprpRgMgO+X?=
 =?us-ascii?Q?b14XQGCyWYKJr8JyQBsCrE576f10Qtf9i/c+x4L+Z95yIqVPC1svs8f2uYFk?=
 =?us-ascii?Q?KQO9aFMH8inb1GG2tis4w4YNyppCQ8uCnL6V1Cww3dqj2A/kWHP77iK0DLqP?=
 =?us-ascii?Q?xJxulHWM9A9/t0mhZ7PZ0XbAQcu0mK5Kw5Dzm/u4FcLRSjv1wzY+hiGkAVwH?=
 =?us-ascii?Q?1n2JneiuInC5k05rgcWwt1bHcQmuA0VV3djYwMRe0Qxbyq9fk5uKYDmy7PW0?=
 =?us-ascii?Q?Lwb1xgb0F78mP1CXzI6cI7uN8a9ymak=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c491798-a9fc-4ad2-d123-08dec42a21e1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 00:17:17.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCwVkqXKMvdkwdBl4M+Yjd+Au2HXwN07rrkmI77Pld8e6UmKMzXORzvUNztlagob2+DVKR5WLhWCaWklz0czk0hNv+xSgG6RJ48EiSd/FGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_171725_242135_98BD6DDE 
X-CRM114-Status: GOOD (  10.58  )
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

phy1_led1 pin function wrongly refers to gpio1 instead of gpio11.
Fix it.

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index e66b608c4803..b73ab60d0065 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1754,7 +1754,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio1", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
-- 
2.53.0


