Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73194C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYI49krBNrN3VTpAMVUsuBoeKzdn4aHrhL0Ky9Mxx/0=; b=VWB0lMep5le0o46wngyLdDWvBh
	DjqAeNPRdmDlBx8TIc2zS+tx3GQCbKmcf4hWcGMxvOflDgIn0PvpSt9a2pJwpzuHZ6Q4qmrqYEZs1
	Ls6DvF6LAuOn5nsHURTu3SxiVkDicr/+GvNbOa/nc1GLIGR/GVHiATyFuLtp/FYGiORTXk+f34tOk
	xH1JQvjr9AzHVo97dE6MSNT14X2Ud5/7niA0HKgiGZv6vg2zen36u2ENcH5xR5AXTQxyxbaYlUIgi
	NnKFBCJXcWGRQd01fa6Z+reQmT2gCMemzUPENmsImGgMiJSORHlV7OjbvhUmGQH08APM7xgya51eB
	fe4K8r0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPY4c-0000000C1lL-021I;
	Thu, 12 Jun 2025 02:53:50 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXhQ-0000000ByKv-1HgS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 02:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJvpapsJlDjKdOqdk5TwpcbdvbLSKGdcG2Dcly5XcGzfecRXrtXiQ+M4vrn1KEBRW7XjYZBDNL4/+fV44cLV06UCmKgOKbZGo5sw+tZvTehKkgc1Mw48MEcjyIt23jqvsrzQ4FrmjTmqzIcRN92U1L3Z5PKKdv3dTlSYiYc1UlJgVPBTQZus1R4dgnW1/7a3bxYv4nVYqpExn/nQAEAnueKtz1jvTcryp3RV76v2CfIn/vct/SgU9pr9kzKOKBWkVuWor9TEMCW4BzC//9VJED/GDeML85JZL1ruCPW/aLPj7T99jfwCinQJ5awfng7dJkfyxhbRGlCsPU0JKkZfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYI49krBNrN3VTpAMVUsuBoeKzdn4aHrhL0Ky9Mxx/0=;
 b=avmHXuMlyOPZ4+mjL/ms1wH6t11Tel1ucJXUUEAmtTSPfPkY94ZniiXt+SQlVbZpgQ71vJbQ1NFksUcTLqvDJXOOlRuFn3kVZFC6EoaJjvUbN10GgZLPfuc8u/NEVYZp4bhB7L7uen2zlR+IYoaUu66Y9Yg8lg4wGaZ5tje4l+XLJryacCMmTj2vPnSKMO7/k5zrXwuKuLmB9zQNjQkde1/A5onJu03BmtNWMTtFhTJ8dUe2vl/WWT7x/D6hY/QPsYxKM4D6cmykitAEvZL7JhwOjNdo0qBz++GvxRoCDT6Kcl4ybr5FnRt9wrF4v/TPoK4SFnEpENLsHN36lF8Pmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYI49krBNrN3VTpAMVUsuBoeKzdn4aHrhL0Ky9Mxx/0=;
 b=b5PjChmISXqkVJBLRAQu3hoBykojyCDTCmh9aMddvjzFI+rBzTQ+6hDmPQmIsb7egRiLIJtnASTOcwsQaRvZ7fa7tAWNLS0VksKBa7J9gv78KfYFDwQG2TEaj0FBCSOG0Ke2kcr/n0zoHZdFLaK22Q5lmP7RxbDpIvmUUEvBUjd90kMZFPdVAeKYBWZzTcq7AXhp2Y/ItMCOQVlJ9eH3wuZyn3g38zUpf7sUo63OuDQTteanpQlwRHGPYH/DlyjrIjxnOgCDTokl2dgYbobQQ2We+HedRKGuBO4ZlKxFdamUuHqVCWsRee1ajc/P2/Zr33XORnxFfWo+tpQfG280iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DBAPR04MB7430.eurprd04.prod.outlook.com (2603:10a6:10:1aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 02:29:47 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 02:29:47 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: tharvey@gateworks.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 1/2] PCI: imx6: Remove apps_reset toggle in _core_reset functions
Date: Thu, 12 Jun 2025 10:27:46 +0800
Message-Id: <20250612022747.1206053-2-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250612022747.1206053-1-hongxing.zhu@nxp.com>
References: <20250612022747.1206053-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|DBAPR04MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: b22f68e6-e060-4188-9659-08dda958ffb3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CzBEekxS9KqbLL61G1x6bb4dGmw2dWE1XVnxRLD69NCXw720M5ur1VmCkjxX?=
 =?us-ascii?Q?S2fWsymnJWXiku9LRLhMZwdrSZhMm5mAsTBKN+D5KpCDNFP1oC5V8SWtOh5l?=
 =?us-ascii?Q?zhHWX1NCrwnkbpW1iDh11hvX+ckjuRI7xgNcCn4z7Sg3aX53V09SkNZBtpYu?=
 =?us-ascii?Q?T2X17Q/YItF1YsvgEzb4HYczUcrMd+zrfxK9AU6mZHyh+AVhlNcRnP/wp5jr?=
 =?us-ascii?Q?Gn+q+gH98XiKPitEd64rb53msz90M5QUc6DG66JQ0pOR5WN++DRTgfnsPsSz?=
 =?us-ascii?Q?HmWKaulLfHEg84vI1i3hrQ+Ttz9pAsctChoetPB7ffQhmuvFjyWvjzqfbNOG?=
 =?us-ascii?Q?lw3WxHrAPL/jSB0n4nRkCtAGuauEh3JTq1NMVWCXlPYRQ4lv/3qPFTCW6Jtk?=
 =?us-ascii?Q?lsAR3JdakaWEf4eeExf6JsN9Bf/uiEGl4QOXACUk+V8oNAe0dNT4OId/Lq4/?=
 =?us-ascii?Q?aKBqqt2H/pZZ9K7wcLbPRbAoJtnVNWLpoSv6VEbmPllADjX+tADj9XJ+9xrc?=
 =?us-ascii?Q?XlgmDk2UpydKVhZ6J1YdvmrrlaleTog6CI72/g0C75pc92AvU+VSmOVTzz6N?=
 =?us-ascii?Q?N+XQsAtYb82vobr/mTthFma2pu6oWTekG4dayExx70C5K0XF4KMVJq/C9SEx?=
 =?us-ascii?Q?Hq5Vzxwy7dpPbFo8bjFzwpfRRzNixMQyiPAepdOWbK6igJS03TUP1aVqGbOr?=
 =?us-ascii?Q?xzg7fH0xB2SuRVzZeEKmB4UNWOuyCkHHR1pKZBwu+2GrJL0LbSehkCeEO/yG?=
 =?us-ascii?Q?aO9qgpcmyuFvFe/z0LTug20LbbGiV+udrskGK/EsvTRBO4xsXzyBiqPrLFLP?=
 =?us-ascii?Q?FJcxo1wzExEuhGbRJKwQW5KZ0mNyZ2hyE/eCGdloRdnCaVp4At509/KHSeeJ?=
 =?us-ascii?Q?nM3T6AKJStT5KK94vSh51hed11jxgj63fa1Ik1zKqDjC6eQsIjC9UR51Y341?=
 =?us-ascii?Q?WElBoumR8CM6xh0GwiNV5O+x5/d1G6xK56DdGKO41+Ng/oEuruuW7lyGpaFG?=
 =?us-ascii?Q?/pqdaUv3ckxtd0nHq1LXJcw9Mr0SS7PG/9UpFT2qVNXZz7IaKA4y3zRYATN7?=
 =?us-ascii?Q?MNrgO/fQ3NncUM85sYjXdasMqXAyE9eSFFcQiQx+jyvQNSoldudbdf7U1Tu9?=
 =?us-ascii?Q?d0LoMunPoTGe/oo11tXJA5Xhanxo5bB+F+P5bTs27SbMeQpuiPBbaSDGe+HM?=
 =?us-ascii?Q?mR5hX8N40NuzWzhuifXqkj4Z9Ohn9tq8FU0RdEiex8tgqYiRkVGaSylzuuWT?=
 =?us-ascii?Q?+aLg1VVy+2kOiMjTKKezzDOcNCtEpJZKEZUVksNkdgvtEukSU2aVcJOc4Rxh?=
 =?us-ascii?Q?L4YI+/a8+6k6+vBkllQWH9GH8bc6aZsieDAR6xjfYDrQ/VwyWXqgTIctaYnn?=
 =?us-ascii?Q?CrpCvLPTHxSZbT9l7rxcpfrXSjKbuzjknZCXKDjYspUH1HXgJYqbhX2pwHDY?=
 =?us-ascii?Q?zrzB2+FUJzb67BiLkS8hpZRazkK4nvDi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XD2AraTdv77GqtaPFUqO+6kd527TJOtsQAgI9m8dyMcrsEcD10n3tRrkdmeG?=
 =?us-ascii?Q?fxXxAmPjXjrhbCF/iXE2/VQ/ZYTZfowB/1wdOVuBP88hFhpJjd0KDdxkL3gu?=
 =?us-ascii?Q?dbxDcUDYS95NRJRkF8phkdu5p8ZGt/FI/EcDsatTppBLTY4YZZN5iggBtnoC?=
 =?us-ascii?Q?yNa/Vf+QP6vk6Lvac2X3epH5wsQJDa66H6nfXrjcGXnQnXn9NJInKTQ1Kazw?=
 =?us-ascii?Q?ot/KCr2XEZqOIzBZWhSNz0r28Lw24Qye9H4nSKJtGqp6dxwHIOT5qMiqnkpg?=
 =?us-ascii?Q?eBNRbqRnR+KNi9PwNmZJvDz4/ihDus/8H+Cxkq1jFIzcF/BCoizNb+ALA+mU?=
 =?us-ascii?Q?hxBXkugqA2Szg6shg97xWmPxtmaAHt2CF/cdCnoIoicYFW2mC3nkFc1UFCEz?=
 =?us-ascii?Q?pcbXmUHran4AGL0DdU5djStyno6X1g3esT6HwIwYjvbe1SdpMYfZJ+LOPH3O?=
 =?us-ascii?Q?YXKlErMFBdrk9+zGIHfXBYZCsCdFNmgRy/sA0rlRzXlcMTk1QbfQZWKcttAi?=
 =?us-ascii?Q?wXs5OoxJ87Eu81TA1PZZA+zLFoL6JV0Xi/s4FyXnIQsobUGk927fKJKxyKqr?=
 =?us-ascii?Q?JsHcARIRMtLwdodolkWQdblEu9KMyIGm3oXDUN5Ah1O4saQJUnZ3TTcNjhUN?=
 =?us-ascii?Q?WYcM7Dv+Z8v4oZc43Eadelv9gKLvRTX96gWHK48tHWNyVOthvnrSpgYKwFnH?=
 =?us-ascii?Q?AIC6HTESOd2NjTEPGzGRId4oLyqbidQwmVz5o0uOcC8uT0lNhKoIs/Ny9GJ3?=
 =?us-ascii?Q?W7Qw3HhiOZTDPFaC6luza+0BRILLQaEL89o2ZoGvps8Yt4K+T4Kna2yud4K9?=
 =?us-ascii?Q?dc/bm+QwMHqD+Kmrzx9bf5zzMVlFqoEpuYVB3v3ll29KGs7JRHN4czFdtMKV?=
 =?us-ascii?Q?y6BvlEDi6ZfHwOjMO8cPqq/R9aDwvQ9FvlKwCSHKvXRXRjZFhxvskCmpdBuJ?=
 =?us-ascii?Q?7SY2HeGR7OdZd3xg9sAn5Q7/Ks4qR9Yce3xBixQksmgyNVL99u5b8uj2+M8y?=
 =?us-ascii?Q?8XttfRpRJ+1inCTz2uB/eumA5Ad6KTlmelzGbT7M0D5RR8Rrk4B/2+PokoJR?=
 =?us-ascii?Q?w4VHDbgQ8+pRUoNlqzpN2+AFXXtckCi4Lc0bORA1pZM1RHcH3//6ht5qeASv?=
 =?us-ascii?Q?sjCqNMW6IFpeGokrBpiS1uThKtHvOnW6Je6QZ92GevyDCJrOiJ5YWr872aCu?=
 =?us-ascii?Q?PY2bfmhiyvtu0y6DceM7H2wZR2IEuZrPvw0p8Y9eTqMrqPujF3gRAJiNexeo?=
 =?us-ascii?Q?YhBXS1nFm1gmvOZW902o3leI8a1Rnwn7cLQD03nsyt8+aw+2Itpu8SuJ1ysG?=
 =?us-ascii?Q?Rpjwfue71KDIc5Am1BoZGn8SOJjqQWKdqUjEF6vy9YaV7b6ZFHKfX47WbE+4?=
 =?us-ascii?Q?E76Sgwgb7dTV5lOEfSseOqkvbPol+ezYa7rT2io9qE+XOkkdfHTwyz6vBIxf?=
 =?us-ascii?Q?18OFUJ+93U9VfZwMGdQX3WyGyQ9gESN6wmEt5oapFBAe//tbiH9TRwtBRnii?=
 =?us-ascii?Q?JC40/dIwyDV0gF6UPauIE8Iuico2QCvF10ZxBQdaxT190pH8usXO27fpL0s3?=
 =?us-ascii?Q?u1FZCsEAJQ98GBQB1IxVvweOleTF4RJinAv99xIr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22f68e6-e060-4188-9659-08dda958ffb3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 02:29:47.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOYAo9JlLueGA2DDHB3DXfdtsX261sHqE1MEHRbZDq38/WdcOabBZ3AfGzzNO8T+acZh9HX52BeZnFQREFvx2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_192952_348947_228CAA15 
X-CRM114-Status: GOOD (  12.29  )
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

apps_reset is LTSSM_EN on i.MX7, i.MX8MQ, i.MX8MM and i.MX8MP platforms.
Since the assertion/de-assertion of apps_reset(LTSSM_EN bit) had been
wrappered in imx_pcie_ltssm_enable() and imx_pcie_ltssm_disable();

Remove apps_reset toggle in imx_pcie_assert_core_reset() and
imx_pcie_deassert_core_reset() functions. Use imx_pcie_ltssm_enable()
and imx_pcie_ltssm_disable() to configure apps_reset directly.

Fix fail to enumerate reliably PI7C9X2G608GP (hotplug) at i.MX8MM, which
reported By Tim.

Reported-by: Tim Harvey <tharvey@gateworks.com>
Closes: https://lore.kernel.org/all/CAJ+vNU3ohR2YKTwC4xoYrc1z-neDoH2TTZcMHDy+poj9=jSy+w@mail.gmail.com/
Fixes: ef61c7d8d032 ("PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5f267dd261b5..f4e0342f4d56 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -776,7 +776,6 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
 static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 {
 	reset_control_assert(imx_pcie->pciephy_reset);
-	reset_control_assert(imx_pcie->apps_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, true);
@@ -788,7 +787,6 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 {
 	reset_control_deassert(imx_pcie->pciephy_reset);
-	reset_control_deassert(imx_pcie->apps_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, false);
@@ -1176,6 +1174,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 		}
 	}
 
+	/* Make sure that PCIe LTSSM is cleared */
+	imx_pcie_ltssm_disable(dev);
+
 	ret = imx_pcie_deassert_core_reset(imx_pcie);
 	if (ret < 0) {
 		dev_err(dev, "pcie deassert core reset failed: %d\n", ret);
-- 
2.37.1


