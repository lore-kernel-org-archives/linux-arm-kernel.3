Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4494C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 03:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpbahtdN4/Ps1EvbGR2f2ozCJ73Yupy3v4w+pkhaN48=; b=Nyfb99m86rOe72uOtmHJ16Yo/6
	uQzdPXKio9ntd/CfFBFcF3bpKgT4xmXP8f1tgXVCt0REFheYL02PW+sB1DqhmfkrqnPB27l86X+h7
	OI78DlXx3tdwXtTy1WIcVIF0C7LfCJjE0a1AEeRtmvyb2wBrvhvDmGPKhWgVsarkdViIQCkBgwr14
	cE6ssfNWTSJsE2hKYO5Ldt3Ek75fK8YlirTBz12k/JJdsp52sENp3ZSNfZmUGqrX5QfK8mwl2m9UX
	7aU724P9nmDpHK+qlFcZtMxQTzs8eIYL7SECXSqGoXDRlaZwumH4d78xcz1FtGRP9p4s5L1z2I4qW
	uOGMXsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfY4-00000000v67-2EA8;
	Thu, 09 Jul 2026 03:35:40 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfY1-00000000v4U-3rhP;
	Thu, 09 Jul 2026 03:35:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1Xv6CKHhd4Z/t+peTNc8eNJtgjd762SWR6VZ5teF9GrKSGXv11ZZNjnMYbmwZg3LK6VxXIP22jEqf0Lw9/TCbhsxh9Ru5Z+syi3eUIh14TVyDUZevkcSv70zKVmQhu1dDs9V7/z9WMwRj/qO1YKCaUZxrgj7I/VUbY5hPLnuP2XkY3pO1gBKTzw/WgI1rtdHXqhJZls7JLnWozUzsSJa7HmG8XCn3zGu5g1RVS8/ratffxuCbAkqgSscheSfaob+4fnC3WVjLZSHOgDiSmDhfydhugWUGbZlJ8M6nmRExEjhfDDW9dWkG0oDOY3vo5wFiiQv78j6Qt+aZqcT5uZYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpbahtdN4/Ps1EvbGR2f2ozCJ73Yupy3v4w+pkhaN48=;
 b=ZappYWWutrPq+ltyqr+me/peyxLlNXs3fj0vZs4FsQPZS0K/7hNqm6GsFxXVKXLGMvb1ye4GpfewXbzfoNqbwKJGWJrWBx7QEMd4pdg11VSYbK865oPtzWy761Sv3ZtW0cyaon3wG4X/+I7K//3HcghQDhbnQNSea+6kjGKjk35bKpJnrouBVV0F31BBiHMY4j5+6zawvB1aeXwnHgZPucBVvB3T6PJ451W2sAhXpKiI/tvFtX752MVjz6pVpYMtqaXPjugQB8yjyW8F0foNfdZlBRN2BWp7BLR7QeNUXGHoWgRtx4ZFuadyXY6PBEv6KIFDJvf2tkXu++D4rF8t4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpbahtdN4/Ps1EvbGR2f2ozCJ73Yupy3v4w+pkhaN48=;
 b=dzF1Ru2GH69xQUwRJ4n49GwD6qspXw+u3n/WhUuRKMmEVwMp5XYnILl/le0I338KA+xJhH8qv+7JzY9Ez5C9NVX1bL0gSniAwdqEJZE22NXGFiuGLryMkTuGw7Cy71MwETZ593+oR0iZvOOQO7fNWT2O6yoIxAGWmGNGTYCdwSLBZRCuMi6knWXPivjw6LZiNvB4pR94anmSENnbFm71lww8o1Lg0uxw6d6rRYzutIVJvMCvlz//VIiwWbJtDaFKvslU1VbK9mv6EPSZYo847e/krFmmk8jXwDAty7YArm1kRWd+0MEnJubMpIeMmEgnWqmZ+7Bc9CpAn4QlFoiP2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYZPR06MB6213.apcprd06.prod.outlook.com (2603:1096:400:33f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 03:35:24 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 03:35:24 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Sebastian Reichel <sre@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org (open list:POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 26/43] power: supply: mt6360_charger: Remove redundant dev_err()/dev_err_probe()
Date: Thu,  9 Jul 2026 11:34:05 +0800
Message-Id: <20260709033428.362970-27-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709033428.362970-1-panchuang@vivo.com>
References: <20260709033428.362970-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYZPR06MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: a211bdfa-cde8-4f12-5493-08dedd6b1cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|38350700014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5Q/sFSgy4xlGNVyAvQ+BJlGc9xw7JFtjCPRQrRJfN6O+5ktsA6Vur6pV2mSfTuwa13vPu2c8Qk3WoxznLs1RY2merUF+YtG3kRPWmcAIbVdbc+Hl1VL24gSzDB9JF8qYPyrdFMASWPdWKtozFRnDZ0JbLyts2zQHQ7CMqv9uCyi0XFp5dEnJSYvl/waTIZntMyO27jVv2MVya0u1M3XAIXmx/Aodyk3omYkVQLekgF00JPyH0YezydoMldJRfTZg91bEttdYeXP8ojCneeA+hRihx8M453+nRFXpdTAVdsXVWLI2BHFL6VlPLDqBuTlpIRjXrRcExhT0r8nK9WUun+qwceQUbYyjYAxvjfv3/G5VN58lqhML9cJA5IwOcD45ctkRkPOxmoO1Z1GWC47/XkxVZtHtkwsRhYfwpMItNkdOMMcDozbNwuJ5ehTV00/ZUivXGtWayQi9pYTsihjeiUEnyzTVS0oHxYjWWKIYussMGM+9rr0R4VBSHMU4DJWmp3s6fol63P1UwEV8qTydi2JOswxj0KnbfVBlcL5gBZMc8zlVNpZf0RAPj9UjvxXd8DMPpVKgeyIi8KCQZFjfFV2KokFelhacTEu++UOquZewygqhXhneiZ44ZIJDgFC/toOo0lMdR38IuHAEKOtroB3vYwYef7IO4OHAJqikY8UssgNOKxDvKbeZGhQ1h8UGPuZtOH4GtkwKcSD+ofBemeAuha0kNzoftfUAyjDRU/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nkz+OZDB3q+LtsK//BMcJiWfp1rftlwg01PiaF3Ie5nDFcIM5ZjAujeAMMPp?=
 =?us-ascii?Q?P/BnVDMGfuat1nC1LzZs4ldhFqvHEChNtJun1hpIBcfBKnLpQbWXTPqeL4j1?=
 =?us-ascii?Q?wwCbWtkvXVl05AB9EdLuh2CfMnW1olwO2ZoZkIay3GMOWOAbPO55OlK0SoOA?=
 =?us-ascii?Q?+i/qvQSZeXHM1TLQ0ZNdFWOqvY3elzFxqYGgi9iRBvWa3hPIXg+PCV9zBQhG?=
 =?us-ascii?Q?Sg0lBkrdRu1lSBl6+SgAdX7oxF7PSDHBg5uODfoOoNQvWIgFK166hXwCm4Cy?=
 =?us-ascii?Q?z2IDcffoZJ9Olwl/NKMT5glxXBFZbLlAs5vRaHDQCn51dzMZOq8OMpXG20Yd?=
 =?us-ascii?Q?aXm/D5grxaJz3AKzIqcOjerRsRfhdHN03QM13KIRNUDmXJhANF/QE2yOIXQH?=
 =?us-ascii?Q?XQLjtH0W4OiV4TzFo6jDjO2i6t1cDUAV73CqVTPGtCbZkGi+PStK5Iy5MRnh?=
 =?us-ascii?Q?4E7QI9+/ejoWNwQh0zhlnp9qqgTrFY7b5vTdNWFuOXtNx5ejj5IWCtj6/85h?=
 =?us-ascii?Q?kb9aysK9JThgvVcM+g8Au1qpOd+ZcW7Ps1qnEjn+BSzwZIjU8EVb49msyXNB?=
 =?us-ascii?Q?waZdE60t5OjT+akSgs3+FZYZL/0oHRfAGGZSB/oCvbfWsBoES0lku0dzoQeO?=
 =?us-ascii?Q?9nK+LttI+U/N4O2wwjkECWq7Kk9E9ZvWClD0cAIXDM4L/jiO9Naz0qBv3UVO?=
 =?us-ascii?Q?Hei72812YZlxl1RliuT3KCd1796dV9mPWn7OQud0fJw9q1USW+M+QtZumJVv?=
 =?us-ascii?Q?cnGY+t3IoeHdZkXHJloQGYZ8CJvwyLi+WKtsYHJ+4xjqzKGTd9I/zC0Cb557?=
 =?us-ascii?Q?+Kalgj+rdrmDKmak/pjkUSNs8rCeWWBjtaocCFg6Y+rIk+MZsRBDsfrPQP8x?=
 =?us-ascii?Q?qMYpf4Z3wzNkCX+fB0OlQ0qglnbjxwKb4TPcc1S2nJDZmjOhhPBxJFQZsPM4?=
 =?us-ascii?Q?ERZUtdzbuSPKVtIk1nLlt8fgUgLoo927sqWLxltSRAFC13V405L7co9Gl0PL?=
 =?us-ascii?Q?uU1nJZHoTNvGeSHvmAKWz+s6w3nyea5674VLuI5+XwKEgd+u9GyfMWAkwkbK?=
 =?us-ascii?Q?Iiry1UyFpUqT4EF260KxXO/DkWtQQcfddimcqLVixbZrYvkLaqhfoIIUtNXr?=
 =?us-ascii?Q?ZVqnsumT4ld526vH4s99f6zEkccsn8likieO+8/Fmf7DAImBd3nfsLSBBujc?=
 =?us-ascii?Q?U3FJ6j+zabcROhJSk1HMrnBPIsg1EJvj0uw2LSH5/3E/D96oJA7vF0XhS0Ku?=
 =?us-ascii?Q?Lz6ukB5m1bJYiEGW+XO2z35cLClnKxlTvWmY02TxxiGap3xmhDz75S0084iC?=
 =?us-ascii?Q?vpuQtGgpU9fxTa5cE4t7tsbhGkeWd34rKAsZ/DL/1ZomuZu6unwzphSIvqSq?=
 =?us-ascii?Q?TtobGm1D2pEutODwe1G9F2vWo1CUdoU462e3qJDPtF5kFylPmfH70fnCkp+t?=
 =?us-ascii?Q?4d3axSXbZpQWyVnjnYeTJOVZigGCL9LBczwOCQfG62GfayVwAAB8SVpPHX0W?=
 =?us-ascii?Q?3J4qeRJ0JyGwB9lxy6ATs5jIMuPgn/LufTZ/+x281XWt4/um5tzyth4dTein?=
 =?us-ascii?Q?DPtjsayjQd8bRXPb43OE11gQHZIHo+989HfD6z8TMoBqd2pTItCw/5uy0FAp?=
 =?us-ascii?Q?0A9DT3vI1vaUpWimv2gU4+Pot/jrpl65ZqWZoCh9Yzx2VqIQtaYRInyALYSi?=
 =?us-ascii?Q?ZxxcWbZrO2UVv+v4aaDtkenMTC1e+tcoKri6Y2IjVih4qx1fnUWbHP1D40n0?=
 =?us-ascii?Q?ZkOiFZjZNA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a211bdfa-cde8-4f12-5493-08dedd6b1cbe
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:35:24.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIH4IdtimZRV1n58QxtXV3r64DQ7o5qfQUZxk9D+qRmic3sRVUOjcsmrCAM68CMzn3BirHqApxNs4D9FQDPYbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_203537_960114_F021EF0C 
X-CRM114-Status: UNSURE (   9.74  )
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

The devm_request_threaded_irq() and devm_request_irq() now automatically
log detailed error messages on failure. This eliminates the need for
driver-specific dev_err() and dev_err_probe() calls that previously
printed generic messages.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/power/supply/mt6360_charger.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index d3b0731f6562..b4d462343151 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -721,8 +721,7 @@ static int mt6360_chg_irq_register(struct platform_device *pdev)
 						irq_descs[i].name,
 						platform_get_drvdata(pdev));
 		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret, "Failed to request %s irq\n",
-					     irq_descs[i].name);
+			return ret;
 	}
 
 	return 0;
-- 
2.34.1


