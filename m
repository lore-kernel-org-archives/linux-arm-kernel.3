Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E35CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B8vi+fO7E87X2/Yr3zQZT+lVZd3L4RO60Bff+Ucili8=; b=RWdyyyaCXS7BRhPLqhh8FRH4sC
	5ELamBl2BHkdqbehOva9FmeVbLM7TZ7naKcBwJWhM0Yly+dmOZaox1ijjA60D7nROs2cQaM0dZP9R
	LnuNcHdYNk4ktDkiqVVc3FdHaOdOeiRvFzBE/60O1/SCEnS3V9MBqY1cVf3Hou+hOlwYYV+C/F7EI
	fUC80/P/KhbFM9W8MJe7EILGKiOWNzzO3tX9Eb7NpeoS4wIYeQo7my0GS4DyWDGspRooxDAACkPbQ
	a/Wx2+CbwtDxg5cAHSrBU7Z9Sw8mE60oQIQUgs0Xxah76axv7FuyLTWANtnCKrn4rBT0JnPNi1kBa
	UlZfVeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnG1-00000006X1b-2Mgm;
	Wed, 03 Sep 2025 13:10:37 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmOM-00000006M4Y-0hk5;
	Wed, 03 Sep 2025 12:15:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/SWB6DAyNoTFR61PcSEzNBDuFcWXxplIO7u/eLX2svEP4AssBQIBNKnIrBbFK/mJbvygbzmjge1yfUz7zbx9Dq2TKHaz7InKGGHo8S6c3Ahh08xQ6nDvlNIMEvNSuKoMA6WWk1oSMm2Bvxx8aOciTEXfEjK03a8sdy9SEPU0//BywsETajbeAkqhnu+39gH4Kup/8ATMDJeroX8YOey+P1x4bXqsX4a1U7X3mxmUQZY+mB1DMMJCkYyQh8TEgtchxZhP0tg13DH7ZEfAWkqAQmRuZl2wH8ZzOIWlH8RTdLLCPQFhW1cH8yB4m+Js1Yf5vzSoSmr2tN8eTlLD9tRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8vi+fO7E87X2/Yr3zQZT+lVZd3L4RO60Bff+Ucili8=;
 b=yn2emIZvRWdfn8lhj49zFGO3UrFdHuw2Xk99HfDwCI+P25RyLAevZ0YE5I7OMOvMCe/kzwcWo1+EsVFotxCmZXYPDtfPEF9hLt+fKHb/H/yVROWch4Kk4r0+jYzUV8g2FycYck8LcdmDCAyOmXXhk/7XqjyttdyzzKGprafMdyaEAGAEx3buslm0NrmLXIT1FMaI/DhiUUABaTHYldccH3/KKtVorEJZGNS7l/KLtaUm+qBH8BjrtcWIwFsUZl5IeFlXyl2uxiQpKuEYX832p4N8MqNtfIaLB9jXSQxKaft7NSsM5ql/yUQlLMHdy5k/lpO7wkT9XiigfIdEK/NV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8vi+fO7E87X2/Yr3zQZT+lVZd3L4RO60Bff+Ucili8=;
 b=XorG8aODIs+D2vs5AqJIXFoahqOQJAtba9XDIH1Cs88bk11H0lo0I3H8MwZE263o+4+nHczPokMAvudj39Y8ZjnH7rleTBNbO+S5cSIJmbjRKC1tpnCi5vuvTwospDroeQHNL25ej6H7ldJAHKi3n1jY6gWkiLvtDdKACD8RlFitdQAjQA45nxYOB2/qz61JMWkHahf9hP+TGigwtVzpxUP6ExyJu8hjwnvVoVg78vnzYSYDOtTw+v1itJAQ26xkBbnBZuD2aiFT7dr7yBGfssMiocdktJ4kZAOmHCDyTKcA3lb/M8XGYLrwoIDHTHy05ZnV/wwpfc/2nRnF6GZqEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB7318.apcprd06.prod.outlook.com (2603:1096:820:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:15:03 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:15:03 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org (open list:DEVICE FREQUENCY (DEVFREQ)),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] PM / devfreq: mtk-cci: avoid redundant conditions
Date: Wed,  3 Sep 2025 20:14:52 +0800
Message-Id: <20250903121452.387023-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::13) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: ea72ec49-a4c5-4558-fc69-08ddeae382f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iE7ichsJW6wALbu6ecB+KxHS3dzy5+rfGqNna1/l31mo1FFw1x5mNXCUqthv?=
 =?us-ascii?Q?QWU3zG+ehE79RnsiEwbuyRyov4Wl9nddttVMcUCBbs6Ympmhdcarw9qW28Kb?=
 =?us-ascii?Q?xvh8ancdrunEUn8/hWhvYkPAyHIK2o4GavkjPkqY0/r2BhXz0QiRe+lejv2U?=
 =?us-ascii?Q?cfoM5GlLBypv/1shyobKRUalUfdPCWTgraQFGYVOzmoeeTl75rPj5szYWfLd?=
 =?us-ascii?Q?sbQwmpqTptWoz1EAkLnjInQBkD3SwKjGIgitg/2zX+g925P0AO2jBGsoMRRv?=
 =?us-ascii?Q?DGGmifnB06u7BzGofCEBRuUGC+6EJwoeYtpN1r7CICQmspdr+HU2QYhI3kHd?=
 =?us-ascii?Q?fDb88qP3KvPP6c2Wozg6yXGeMbwdgkD57pvpYF0M/ItYWxrRvK8L95Eg7+FB?=
 =?us-ascii?Q?+zv5MZRqVcgngvmQa80GN/gn4wS4GUC3i2FaPT2lOUJd+IcfZuL5VFPQuqQ3?=
 =?us-ascii?Q?wffE9BCxxek/HhK0lnUOgKjL7/xbCJpdKBDCqoejSSZ4NbW4D1DutWZC2SUM?=
 =?us-ascii?Q?kqC0K78ZmS4hb7oL5T5iRiH6wI/PhH0ViPMLBf3qJz3nfBaS+YslT1Z+MAs8?=
 =?us-ascii?Q?XCHM3AxcNyVUI5EpsXtlFLLeuU+efJdomYsEmeix6MtIxTBzmULW1QbRmZD8?=
 =?us-ascii?Q?Gajs4cSnwfsWqZiaNOHLlBml6ux9QhU7dPbI7ny5ebv5mL/rRzGxfIfEM8+B?=
 =?us-ascii?Q?bv1urDDXAb7OsTyKgKr+W+zLMzsgosHdjdd6DNZxYX4F+gbNJs6MYr2ZbObG?=
 =?us-ascii?Q?cOKXwZUjLECViTb680zTgS5s4M32yP4C/KYfhvtOKGP3A3tLO1r+ZmJxYa5g?=
 =?us-ascii?Q?5xZ8zrSNW6XcEzQF5rjla3D4ZrAUlZ7NSC5xg9rP7Pc02/vrl5xYxtGkxl6i?=
 =?us-ascii?Q?Mkn3NMSbbbRBjsXWfsxL//PW1aiX0FcZEf0qTQ40CDHoQfvQA9bY9h2NDcVh?=
 =?us-ascii?Q?Rf880zhok6WDTNxiljRXjd2xTXq52BNZxseZ34U8l3AyGHvtBiqC/7GscjTH?=
 =?us-ascii?Q?pRIuTlvXQ7h7JVAmFJ9BY1MGBuP4rjnp0nX9UjnnB+HJXpG3X2FPu70S7LpP?=
 =?us-ascii?Q?hkQoLDcKEAZ3iaKxlYHYO4FOw0spNp2SV5YAPiCMQl3gdGkmLsV6fozMgL/V?=
 =?us-ascii?Q?uCbjezCFOZKuQ0Ua6GmZKYQlcqwhz5934kZcKmzyIrxChtkCQRFHfCTH8P1b?=
 =?us-ascii?Q?DucAytXoFhqH37CCYf79ZAxB/cXEEuXQVlmayy9SEwzRGYVZDJiTjc+EXThr?=
 =?us-ascii?Q?JhKsIK6yQzdZai0uRX9z8UbTAQ6sDMd+urjlHf9BttbNMlp5vOn70wLgC84T?=
 =?us-ascii?Q?L7ODYkXnKpXdPPYqWJGAF7Q0n8X/yqY8ORDVrKYNhvNPXDqOdOmYttpGirxu?=
 =?us-ascii?Q?hkzY+HPr0b+yMqdrtQhv88SCkcW4pijlqyvXrJnhG5csz0Z8VZA9BmS+oT8f?=
 =?us-ascii?Q?nm9VYpJRdL/HG1DfHFtloPq9xHhrptatSfx2n19hgP4t8BJj/F0ykQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5576.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BMZIOOMbbQdz9I8ZahvBqG8WYo2TARxjvu81xWdOxtfH1g+DYVClgUN+WZlQ?=
 =?us-ascii?Q?EOZzAEMci894BlAj9qqqC0tADBNK07/C2jvDNOR5EIdTWqmFt2CFbbEOt6mR?=
 =?us-ascii?Q?qElSKhF4utwLP3VZr6Xmz+Z8vch4f462iGl/uA7Cv6Cvdn5TyVyZxnkTBpFv?=
 =?us-ascii?Q?n2IXlbNtk0M+rJS07Ra7+KEekyC6EnRpaUFxV6s6hcVvGCbIwOktnpQlWrHj?=
 =?us-ascii?Q?RWHUMzgLVsZEccb7Oe+5zhoYyEdSuN1z2cpyz7YRCPEVfb5bjLXIedH8zoM9?=
 =?us-ascii?Q?rYLmEjOHsTOBofWX4kYxlme4Tzs+No3AfONow2wDryT8++gGcOijfn3WINDP?=
 =?us-ascii?Q?RFYv1F9zE3eldmRhNuQSV6LP/w/DkMSpaT3wWFP5R019zfoVeiJORqBIXam5?=
 =?us-ascii?Q?eG1Ws0u5WVTzZrNW3JqaFMWvxhIFu9s2zC60nA3aq2X3csp8s7MI8a8aOP+Y?=
 =?us-ascii?Q?24tIWwA5K82SNRS4k1Q+d+9fz7un6GYHEu8gueb4vm3zTj4i3Dhf1JM6Jh6j?=
 =?us-ascii?Q?aidLfGutWWg5kgAoDwKAExxvMh37d9tdfW81zxkFnI+8braWGXGGEUKwZvkS?=
 =?us-ascii?Q?yFe46z+RBk58gyEed2j6pWPTMW5saKTzEhM+GD5EsGgO2AZjQ1t9yRJdRIbs?=
 =?us-ascii?Q?tsO6a/FX8pMD424g1YLFcSnONaMgKQ+Lrnm6Gmo+tQxd5DIdLe+YwInvLhW4?=
 =?us-ascii?Q?UAB0/vfsttqvocLfj7Pb2KdTKxddHcsAi4P1GUoj2xKeiRBwKCZLNIB95qym?=
 =?us-ascii?Q?J7YR9peCH2o26kGCKTXkuU6ndgZsNmzNlSPy+DfB25222wCB8YoU1bO7/Rdd?=
 =?us-ascii?Q?+TaM12W7i1hjQN8Z16xs1CkIf+eyOZSkMV8zbpa069WdanNqdaKd313kuoup?=
 =?us-ascii?Q?SI0GfjmAy/XBCzFHWXx5NMby9Qqqzj/1Z6Z53ijdq1AyxkW/PH/AuVpYwbHx?=
 =?us-ascii?Q?BK85fJxDUJyWAd+DhTOkmtD1zeUAhuv2w7LRGc3fNj+oAmTWQQCjG2YvMrCd?=
 =?us-ascii?Q?IULhIpgEC6OKi+4LdbWxfzoOrCBugBBwd9zuUrubFvLIPJEkOxaRwVLeIsc6?=
 =?us-ascii?Q?Fw5Y5Uh6/g4J0G6fNsHfg0mGzs9HG0ObOIVT7y2Qz0GpF+RClCaj8mMiF39f?=
 =?us-ascii?Q?gNYn2xR9wB8S03R9dVQqduGYAt7CenE0iNRvE98Be0E7pAUJ8f6nwLXi5MpI?=
 =?us-ascii?Q?e8+ghf0OyhnrNG8+tEn3iR5O8x57FIfm281aBCaTb4GSR3xg5GaTnRwwS721?=
 =?us-ascii?Q?yWRZUlyMNwx7/i00BAv29LgGJ0i3CkEGcCqLLeaLIyLICHVBjHh3KzkJppno?=
 =?us-ascii?Q?EnXDns9if4CfGwZ+ZpyE38IiedaHifuw38bM+zYSYTKPJL8gujnTweldvg2J?=
 =?us-ascii?Q?QUfGKMt3clbviKErYBWL26wgTkGY5YaaMasdBggo5GTIA4Oqwrfnq9RpCi6C?=
 =?us-ascii?Q?zf1Ul1XGWyf3Zn/naWyGtPh0WdeAnLd5Es/b3+wXEwLTIZo+vbvrL5m7y6Iy?=
 =?us-ascii?Q?caeK0JRDAG67AwE8jP3vZPUTqe00LNnaHUAblmac82Pj3zFriFGKXIdxew4g?=
 =?us-ascii?Q?qPaDtsjiWWA0D37Pj5GhzknTYX8rbRh/KcIucerQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea72ec49-a4c5-4558-fc69-08ddeae382f8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:15:03.4235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3PlzR4ZCPV2Jbb7fIbQHuc4Zjiq/8RKga0+wipr6jyAAww5KD+7K83qW2K81O/ol7HzO2o4HfoIhLfWtCmLkhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_051510_209234_A2AD70A5 
X-CRM114-Status: GOOD (  11.85  )
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

While 'if (i <= 0) ... else if (i > 0) ...' is technically equivalent to
'if (i <= 0) ... else ...', the latter is vastly easier to read because
it avoids writing out a condition that is unnecessary. Let's drop such
unnecessary conditions.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 22fe9e631f8a..693c59c8037a 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -86,7 +86,7 @@ static int mtk_ccifreq_set_voltage(struct mtk_ccifreq_drv *drv, int new_voltage)
 						      soc_data->sram_max_volt);
 				return ret;
 			}
-		} else if (pre_voltage > new_voltage) {
+		} else {
 			voltage = max(new_voltage,
 				      pre_vsram - soc_data->max_volt_shift);
 			ret = regulator_set_voltage(drv->proc_reg, voltage,
-- 
2.34.1


