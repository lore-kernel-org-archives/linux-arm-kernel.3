Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24356CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 05:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bj1WXbYm4JcjS4FsoXhxwm9RtwlcAQb/xYFTR58pjCk=; b=TnAjqV8PxaJ5oOhmFkFla/OvTl
	aYF27EQdCbKZyPVXJSdjSWQbQ/pExx2OcYC1TbEvOI0MaqZ3vVi97gLULbhpJoFT+nNq50MUubERY
	4yA4nYer941mf23Htf9AGV3Phne3BnJqbuYBgZh+E4B10otxd46dsfCBICU6wMCvGsrGCEREnC2ho
	WmwXc2gC+QvpSuw/y7U0MM0lCfssxvPwHvdxIYc3oTgRtBt6kQUaJwWyhfDAdyG/vAg7AtTjJGb7W
	AJwhqVMCF4/a+8Mt6dtqu7W00KgPDdBeoUf6oQPa4JS8dmWTgLHbLo1ZWOd80Flz1JsvB/HIIkXwg
	iLJ3BwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczGV-0000000AWe0-2BKK;
	Fri, 26 Jun 2026 05:38:11 +0000
Received: from mail-japaneastazon11011028.outbound.protection.outlook.com ([52.101.125.28] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczGT-0000000AWdE-0nGf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 05:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bt/GBzQPdrvj9/hVSf4RvnK7OZY5ixziXeZC14x7+VH9gjhPhbmMlxl4F5I0uuWdJiP1W5BOQbGDolz8aYnKJwctINaoYQMw2Z7Nq8gL4LiiplZr1dGiPV7e/Jd3A93ARW5+F0f9KUHyLtxzzIhHnSUIdVjHj6q4zT6dHPy0eKlf3KAYnuSECg7qLtGP060AVV5NodkC5TLqJ0px+9WLedUIyikHSLih5EnoY4m3HilUMNGt97RS99d52kpoDqBgKq+Nfosm9/KDg4IckBcWCZRtga+imxzLQCeziM0BqkLtm52jlwna4EvuAdcTwz7+3PIcaec54AGZoMGhtiDOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bj1WXbYm4JcjS4FsoXhxwm9RtwlcAQb/xYFTR58pjCk=;
 b=OJqeFnFZw7yv4AVLUXgm8aKcBS5xjc7B8nOQ6iBBr9SgyFCdc+GLVDT1oYWNKGD9637UbnpUEeVlqyJo0dg0Flsa7Alg1UXXUvDT7mRKJ+1TOlIqj6DmnbzfNwxEXiajv2GoTl5oZLNLOONvj2/0PuD35qcXdcd1FwkgV1pC8fI5wR2BhlcjcrKHPVCDPHLRt/h5Blis/GnOQqXDVOmZC0Uc9L8zhdNdH8jmr3+mlCzFiqvDayW28orPjNtbnh9S5rRbXTYDzPgfBB2sP6KCvx9wBeWliYsU0NbwvOQgXP36p52h0qOUNGhFeMi85I4k6+0cwAXKeG3bnmPo+Qiv/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bj1WXbYm4JcjS4FsoXhxwm9RtwlcAQb/xYFTR58pjCk=;
 b=afKmmJYJAFZdU2BcJeoC0ZknT/fZoeaG2wiZlrPxnq1SEtqZWlzf9+USjjKfBiqZ1awwAmU6sRIwCW+IbovRuhXZFrIeZPbxBUXNaogwyj0gLeQqtJS7Hj4e/26+MSwHArRCT27lRz7KsbpYeDcrGU+439x4/ivqyehYLmUObCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB8147.jpnprd01.prod.outlook.com (2603:1096:604:175::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:37:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:37:46 +0000
Message-ID: <87qzlteuae.wl-kuninori.morimoto.gx@renesas.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH] ASoC: mediatek: mt8365-mt6357: tidyup mach_priv
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:37:45 +0000
X-ClientProxiedBy: TY6PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c35b6f2-791b-4530-efae-08ded3450cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0sx6cuQfbBTAvuQsUOrPVxSVkMLSdPwMnWclt1BzTYg7faCfBgzPer5gv8Jmj/lxj8IEtkMTfpZ1LKNvRHa66+VeBwulzj81IdxqjDtM6tQ51bGm34fCOEiSGsMhIdDKVwv2ilmXfHwqE31uNgKF1qmwxaxrUF7cN9Uq3njH5o3prvCYr3Bq9lks5CR/lejHl1lDdURe3nq/Y+PCQEGcaAis78E57ysLIzVfTYWzsBsuK26aLMR8sfn95WteVONu997BR1dDze4QJxrrGnv1MsyWszNMgGruswmoymZ+QE/gH4HvrPeUfqUNwvu606hIBlkIJNXeDyPij3G8TUKaj4sf1jUxtDMZQU84RymIng+87AyA1mv+UgBiyWCvtbdkWUQhArTJH6ppW8Y5NfBHjNdFoV6G8H7YlaplU5+QhAX72hikzPY2OhKNKuusMvGlFXVWIV+Sfr1Pl8iZZhgl2ZNEBAQaiSwvQ05z6FivBUKZET0Wk3O7+Q/IkTwaZin8baeKSorgKbJiI6imdmE7v2dZBheZy0xGGaWkCZa5b6RleOxWi/sNNZr/HqM8cdNaZHJKMXRwwfdHqxXBWGwx/9MsEU+GDNzSHoGrv6aICj6fetleMQfJbZYix9Op3el0iGC7Q/2OsLt7rs1afKRoRiYB4JqWiqpiwbVOj6M0DeuEuSYJ/vtVB6C4JGZg9uEB2OotCa2kIHLRYJesr1f44QFI2qFos37n5fbsrfVnHDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X3TlQgOYPy7ReBWnYo2UFLc0h86NJfs/CtP2fSsHR35a6ME4gBcNVl1oSXWe?=
 =?us-ascii?Q?+nhUONZPZDdVgfjnD4SfhglqXKl9BvK1/ABKe+KWr8YW4LQ2fHLQ20jE4YVx?=
 =?us-ascii?Q?f7RMbcnn+Jd3rsmTv7mI8dsx6QAuvtnJhnknBFlNKOnNuwam+5HC/z5426Qq?=
 =?us-ascii?Q?bdKMNPprIpaar56/pRCnYNSofaG3NAxt0pvfyW8NZ+aJ6H+di/SQBJpHkjPV?=
 =?us-ascii?Q?YjjKUxFQsV+t5tFUUqsd1w3R3/NBsMAuPLFLnfWvCXz/5IUn3r/fmZG4vNit?=
 =?us-ascii?Q?BM10l8Zo4/2bGa+fdusvNAQzLLPR8WFaADy8COgFT8ue3z6g6+tsBCE1KX2a?=
 =?us-ascii?Q?+yo3eEQEopmGV3KdoSiGcKZ7BwVoD6Pb/nppI1KMAge6hAzNUUBHUd/OXE+c?=
 =?us-ascii?Q?ZnsGmMnE/IkgUvFJrufzFNKUGWyhJdG66dxZhB1St1pACgKOXA/qOKRQcuoi?=
 =?us-ascii?Q?g7cguYf7TrNstaK5CKd8NbN/5lZkOgqVTlWybSkG4RRqBPmhKtCLmmkqng44?=
 =?us-ascii?Q?MU6ne00hlTOoMgc5bSRS68wQYrMbsD6d3Ufg7P6qPc8tXHFQV3NHs+Pd75FV?=
 =?us-ascii?Q?aAnWMpLY9/b1Rm9Ezf5pxRZrJiySWTJal7k7ERrH/e6uNGdh52HGHSd6wrEO?=
 =?us-ascii?Q?QhzzF7yzx4XoywCXVp/t3yPWSinEzZhhJk92jZ2EcbMq8CwDKReCZ9HoyMiM?=
 =?us-ascii?Q?h1SPGHfqvV4CBQ5Gq2p0LRbYjKBVgN0bJyIA5f0ZM2W4F6VGXJQm7y91CpkS?=
 =?us-ascii?Q?JNbWsw7Pb1xuEFoMtPPMEnewHnsNfa6DZlNaPlaD84k2tGmQCP7snJochS87?=
 =?us-ascii?Q?GCaMkxEexOp9e2Lw6H9Qnh4osgMC9WqSgmKq/2+L4AgbJCTK+88i5W1T4ydU?=
 =?us-ascii?Q?1C5GDari8sau4XNBsd6EemHCE96UOFs8ituyGWetOKrnXeDOS7I9+T6S9v84?=
 =?us-ascii?Q?tXdQn36sXy6yF7ScTwNgOEyf+HdaDpDeTGSyVvfjryt1UFQgvzw2g74wD+qV?=
 =?us-ascii?Q?wlQg5aph6nLI5li0npidpoRyZWmZY6UCDQD3npRjnN62JRe03vYEw4dI/h47?=
 =?us-ascii?Q?NfpKmguc7EmEYECVwb3RiGi2GJy+NgAE84A/iLE2XQSUPif+/pnBGqkI8PEw?=
 =?us-ascii?Q?1T04edzZyl3YVkTFpCvsxsT89vtYKbOKKnwzEabFADbXHHtUtZxk0f34rjjH?=
 =?us-ascii?Q?WzfKrsWaBnXT388cZdaMXBAomb8XwGYmDGUkieogmQ3nzZt3HQ9u2hdi36I4?=
 =?us-ascii?Q?IA+ttrX/Z1dE6SUSaoja/vtVPvk9VPl4yqZyRtk/yhnT60N/1fKsL1ucXKxq?=
 =?us-ascii?Q?gCwpohjoVsE97/jSVPwcIf7xIacdxzsn6Y8qD83UHMiopMfhBIjPHKQ13hFG?=
 =?us-ascii?Q?nwFnhkfYRBYSE6VPhrzVfW7u40/zY3nIZeaAki1OZvXVfyBcfrEqlsqq5LvS?=
 =?us-ascii?Q?t+gTu4lTVzSRDcHgztpWt5k4BiF5BAdMOM+upEfrrnukPb0AKikIHMYs7pTH?=
 =?us-ascii?Q?PHaUSiXFvdfWCU73y4ldPamKvCOtWiiyJjzd2B8ri11uXj9f9gxrPFdB+LN7?=
 =?us-ascii?Q?Hh7oJU1aLvpUKLhvDjB9cXwBecUUUdJKwiPYbnucCGBvGQQB9TzzT5JiwGSH?=
 =?us-ascii?Q?8tXz6shpfC4chIGaK19Ybz9deTHtgrymTVtiDI4oUlXYbUupRHJXO6o2WqCL?=
 =?us-ascii?Q?ecbGdSFi10Pjw6JfyHk+aIs9A9DLa4xOjXkwh2fQbrN//9AinKE8+/rgdAbB?=
 =?us-ascii?Q?90NwbRZl+v21r7Sy1LqKH2cY3DLpfF18N9p4qyZoQiuSHcv8dePU?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c35b6f2-791b-4530-efae-08ded3450cf8
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:37:45.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtA+JkSrVlvPhwkdA15eLEMePbQreE69CQ1zc/BV9OQXeXkPmPuK5KrfAo1xa+I9Lj+ECzYzkiuWByuhRSSgPz3uQGPeUuio2v1Ej9YB+xv1PuMwvtOyn+gwmtuEQvUj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_223809_250611_9DD77916 
X-CRM114-Status: GOOD (  13.65  )
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

It sets soc_card_data (1) in Card private data at (A), but the function (z)
after that gets it as priv (2) at (B). These are different data (*).

(z)	static int mt8365_mt6357_gpio_probe(...)
	{
(B)		struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
		...			   ^^^^(2)	       ^^^^^^^^^^^
	}

	static int mt8365_mt6357_dev_probe(*soc_card_data, ...)
	{				    ^^^^^^^^^^^^^(1)
		...
		struct mt8365_mt6357_priv *mach_priv;
		...			   ^^^^^^^^^(2)
(*)		soc_card_data->mach_priv = mach_priv;
		^^^^^^^^^^^^^(1)	   ^^^^^^^^^(2)
(A)		snd_soc_card_set_drvdata(card, soc_card_data);
		             ^^^^^^^^^^^       ^^^^^^^^^^^^^(1)
(z)		mt8365_mt6357_gpio_probe(card);
		...
	}

Depending on the defined order in the struct (s), they may be the same
pointer, but mach_priv (2) is not top of soc_card_data (1), thus the
function (z) is getting wrong pointer. Fix it.

		(1)
(s)	struct mtk_soc_card_data {
		const struct mtk_sof_priv *sof_priv;
		...
		void *mach_priv;
	};	(2)

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
Hi

I think this is bug, but not 100% sure. So it is using [RFC]

 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index 10f9ef73c130c..38bd86b67ecc4 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -71,7 +71,8 @@ static const struct snd_soc_dapm_route mt8365_mt6357_routes[] = {
 static int mt8365_mt6357_int_adda_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8365_mt6357_priv *priv = soc_card_data->mach_priv;
 	int ret = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -102,7 +103,8 @@ static int mt8365_mt6357_int_adda_startup(struct snd_pcm_substream *substream)
 static void mt8365_mt6357_int_adda_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct mt8365_mt6357_priv *priv = soc_card_data->mach_priv;
 	int ret = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -246,7 +248,8 @@ static struct snd_soc_dai_link mt8365_mt6357_dais[] = {
 
 static int mt8365_mt6357_gpio_probe(struct snd_soc_card *card)
 {
-	struct mt8365_mt6357_priv *priv = snd_soc_card_get_drvdata(card);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mt8365_mt6357_priv *priv = soc_card_data->mach_priv;
 	struct device *dev = card->dev;
 	int ret, i;
 
-- 
2.53.0


