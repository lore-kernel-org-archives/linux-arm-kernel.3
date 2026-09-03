Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32467C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 01:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:From:Cc:To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zz8XORMR8UcJisImPLaXPueGrRRbGid82ArwcE1ovgU=; b=z2+vPFcxQX0lJNveQOT+EhTbuu
	26uwKwbs2VrDa3sUe6Sz5D+6DxCdVGu7oZ27PcWJOHc+DPi5VoyVAIoylN8W4lIyFmj0SFoJkwOWc
	Eki+qcTj7MYGaGjulSdBKHwN8JpoQ7YbDoLuqQrQ0oT7Se33gM8R7m5DY7tTgsy73CfEDsotnU2CX
	TUnfm6cxOKT50v6S63u67b0bq0GRiUcne6qS2S0DIAwivVwhByh8a8oOWa2EZ4QJovwcvZmE1D++N
	0AokMv6yXx2ysV6DtU6N8AP5FokAy6wC6HhTwLOOmpAID/KLgisCgy4K53MtrlUR1oQLHh60rhyLq
	gnn5S0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1w29-0000000G9fD-2AdG;
	Thu, 03 Sep 2026 01:14:29 +0000
Received: from mail-japaneastazon11010067.outbound.protection.outlook.com ([52.101.229.67] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1w27-0000000G9cS-2E5A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 01:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BucJow+4DZhwHVoGq6N/Yt3PbGCMkd4QhEN47EorJVafK8rj5xXMlakCHBbRDl63/ohjPu+QKtIxw1BH2w52RocwN60qcWO29YczOBbnalmrXgX9X5fLN9tv/F9x85teHOcuE3SiZoY3fQxvC3q31cQVWJDoNM3DaQTIuPvwPgmhis7kdlWlFPOr8PmG9ILcyH/BU8SJdrq2S4FIxIFd/IeC5DSbhL4g4gS8W5i405UVknSzI4Iv5zMgU0o89926HxMbJguTMc9OdqWb9ea+86THOx4R8Lvam92X88IcEQMo0soz7xygUohpYWPCkjftBGDj1n4PTLK51JZOqlUIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz8XORMR8UcJisImPLaXPueGrRRbGid82ArwcE1ovgU=;
 b=oRt6kN7zn1E/EZavY7JjhiaiSYQ3U5DW2ml2L3t3PoqLEauH+N3h4fmUJPe/vbMSUWz5pgOwcIIYzRsxY6f5Sh+xT3dae1AsIYe37DFrQ64CgYfc9iquDryGjz0AAosXsTMazDNj6g/T0EaWUR4xaNSfzV5j6E+jt/RnsAQqih3rb7Bo4oC2tZoe6dOlXUOoe/U+cAH8S6NHBm82B9RsSf9q5EstSTwK3Hg7zQZ5ziJiBi6nD0jAANYlPpiQD0ygQOfxUem3z7pu4MeHiYZJCPuFj6LtQP5jWrfPPsZBqBguWx8iVDaaErDKgO9fZSCajOb6Q6SX0lpgON0Be1VHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz8XORMR8UcJisImPLaXPueGrRRbGid82ArwcE1ovgU=;
 b=a/1129nIx/reWLxHsxfL0tCYM71KTRFsfCxmQamdxRjL4Z19IxsC0CtP5zpauV5xkF9UK6CKEXDSs8X6RRKXrQ461ImG0+LhIVGb9VrzkV6EMOmOCIjb4Us1YFyMGEtvxPWNR209/JEc/jUyjBdPqGpM4Ss+TmUo3gC31/Ocw8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10) by TY4PR01MB17164.jpnprd01.prod.outlook.com
 (2603:1096:405:367::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 01:14:06 +0000
Received: from TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b]) by TYRPR01MB16474.jpnprd01.prod.outlook.com
 ([fe80::2a39:9988:dbe9:894b%6]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 01:14:06 +0000
Message-ID: <87ld9jyw4i.wl-kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/21] ASoC: pxa: use .auto_selectable_formats
In-Reply-To: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Sep 2026 01:14:06 +0000
X-ClientProxiedBy: TYCP286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::6) To TYRPR01MB16474.jpnprd01.prod.outlook.com
 (2603:1096:405:2ee::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB16474:EE_|TY4PR01MB17164:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc04a54-96b4-4d6d-5708-08df0958a66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|56012099006|10067099003|18002099003|22082099003|11063799006|41080700001;
X-Microsoft-Antispam-Message-Info: QgKdnOeFuKvqESdDD0SXFhZyi4ANckUUXe/ZPCmZnbnvpG4l6ifInQkwguXg2QhKQBX85yNGBb75dx/CVJGDc7mVQyC6MrUOsrrWmqRJr6Y5zGeEZQN1Pe/Xo9bNYVTq6Hwa7TiNQX9lvVwNrl0OZH1Vk+ULbpKyUChWDyjDMTBpYlEXKSfb7kMKQ6sIIzFgfdhtDxEeXZoq5RQ1qImR0zdR3URgsUMzfAvPpLp8gOVFRiuC5V9yL8uWjlvhX9J2UrCHWmckE9q5ga4zalU/vVwUtqMy/cjA+80YN/2w9pxANEGSNed7dl53xQBUFZqXK55W7Sj3q9RYslUYY1Ap/XCCM/RqnDwbb0mStTa2/6cm8kNwFUKmvu7ZStBrVGTdxhFJKkDphJxrK2m2Zswj8/kwGNpMXQUkmaeKwvis8vhKqeUZSLj7BKRJpiBZuEHjO2qvfrQzxOn0UHRzjriMgQpLbJVfuS01rhDwSLTFHQhH3WKbJXBYZ6/mGjmB/+JNTQUVOPSEl0fdOY1JjA3QCHTSDoIMSwhmmJqWOlnEfRLd2XWT3mJALYv7PNi4wGbDM7tK6l7aSFCBSF0li8E4Y9miqa7vo5OrgHsEHyfcN9MndO77GmrFhv19g8OQKiM1jkSe6j6iZ/8nmyZz2sQt1uN2zahW+uYnr7T+Zus0OhASq/ZMGYK/E/B7TrsnmYfka9Q37cyFSZsqYk3CxKJeQPeSWdsQuDwvi3OQ+n5z1BdlxupMqUvWwe0dxThBcRQ2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB16474.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q6fTR3QBKBLpqnVaNW4Wlma3bfdZQ4YZz9ytoRGaEwNIFVA4Ri1/67BrEP2X?=
 =?us-ascii?Q?olTNzbuw5sQxNEPdmEkKw8gNiOnr/Jp1IwROMMsOS212eiq4A0/wANrEtImQ?=
 =?us-ascii?Q?1x+5F9dVPbib1wx6PZlMWctelf65qVlt25IxbmKztha7wVI+WWJTIM4a3cFF?=
 =?us-ascii?Q?eHDYMo3nNJVMl55BwxjBjfWxrXWEL91WejKa3GzwmjNn1wW2BuuwIbY8kQSp?=
 =?us-ascii?Q?LvDkL7JP7JYLZTd9ArVnkx1IesUFc60lu44NbB7HL7h4t3ZmHCjjNtMccwF8?=
 =?us-ascii?Q?a9JBXtYjR0auWPrZUwwgLVxSsFdPAMz3u6x2QKQjAlEG6XfzdY/J2e+4CXeG?=
 =?us-ascii?Q?XYq2skJfQf1L6YqmXGJJUnFIeOgNQEs3Xpy7hDbRaLzX8SXXSsOTznJK52/l?=
 =?us-ascii?Q?DiltYfvGU2IVmLUvJfhxPGO7OjJoPPvExI7JExtO1owXHKQnu8KIj+UsPL28?=
 =?us-ascii?Q?pbwaoMh2fKEs30G7optYYQYVpxjuQuaPt9qilC5mZbjNfJCgaSmwkn+J6vgE?=
 =?us-ascii?Q?sIjwMFOpqj6VCPvJkkyQvPZ70kaiSXoFrkxOLsg8ZSFIs4ZCdmzwZnoq8UoC?=
 =?us-ascii?Q?+Lj2sypA5Pujd32yHaRyNLy9vhph7/FPt7yQNS4DlM3+1b3mvPdoYKVpGXHh?=
 =?us-ascii?Q?GACVtQ4KMOx2Lcl6rC1HvC/FrwmOLx+gJsd1Ka7oRLrxiIMSlpdrBWaPB/ZT?=
 =?us-ascii?Q?V8zCbVX53FKC9ixFN8wpturVpRXhVm1DEdNhNZnGXYbxcFbnfFuu6n39u0Ju?=
 =?us-ascii?Q?OAuDMG/F/euU1ZnKKHN5oEOj9rt2ftmTkDrmPqUiq12x8HDvQqVaw3qEfGmg?=
 =?us-ascii?Q?5QpIrdRtsEEwGBSFBlwOUMnRAFww0v9Yans1KOdfDgl57Ib8sljPqpPshJ9x?=
 =?us-ascii?Q?ytKNS5eafBPBGm+F90cr2rD6BV5OoKKT0r3nupoRjclUlmGn0yXsUhhptZMQ?=
 =?us-ascii?Q?+PG/IMI7nSSVA7sQg33WSaWQsdodR94I+FnRtQI2vfh+q+KNuYdzIaY65YZ/?=
 =?us-ascii?Q?Moa9rcI365i+CTgnkFeQTEYiRpsvdw83NAXE6ez4mpJivw7kg2Ve4uOMzw5G?=
 =?us-ascii?Q?e3ywoeMVw4JPKDTHtp5rPqCsayzZIiZgxEhjvX61ESDOb1pqT3HrLqUV8COR?=
 =?us-ascii?Q?z58ICpfZ+vlaSVsQPgrXPa33H9OPXP9+d5RwjNisKUuNB8A4uHaqsJmH9uoX?=
 =?us-ascii?Q?O3jfCs83rFeEarQQEDzB9KlixVemXrb/sDGps6m/HkyB7m0TMmqSPPDbycDY?=
 =?us-ascii?Q?RpNi9mLsYDJ8BY0CAKHmyAfvWhAoNEOOgaG22mOT3l9x0Pf1Y8klqSjE210Y?=
 =?us-ascii?Q?BF1SH6lxQ6S/jRDdMuOGtGLp03fWc9NjP/gBTbYxUNaViuVrCLeOTsgZK9s1?=
 =?us-ascii?Q?xEWWgV4YVwTM+hQf/Drz4zvqHLlqzYeirN0heyTe6x0mOahS+E3O4iQUiYwi?=
 =?us-ascii?Q?GpXKFoqS6AV1qkbKwQenvijsCTjQL7xMjeE8A4YBVXSLEQATfOP1AzxYxzvJ?=
 =?us-ascii?Q?ligXw+kqMhLBgCS/ZtV7zpovwsi230fZZqzCRTBMiVPUkr/8N+Do/mX4Uwu6?=
 =?us-ascii?Q?FDaU+k7TB/YhaEAZW6u0C27doWbWpdVtoY3ityml+a1F0iiODP3E76F0YzbU?=
 =?us-ascii?Q?FGP8kFoxvENvrw7hMqKgHe0v0x2KtzsGtJDVqG8uWIMBwPX0hiiB74OQKjq3?=
 =?us-ascii?Q?9ZCVvjbdLKd1t8WgcVDvsucvlAhOD5hmLL7gXcRsClQzLl0HMIXfCehAJsDl?=
 =?us-ascii?Q?yv95M4X+epn5wXuEsZFJ1HFB6rTkU+bOzKtOy0yWFtwYlbpVu0CK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc04a54-96b4-4d6d-5708-08df0958a66a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB16474.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 01:14:06.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SGk1f2SjtQxuXbQXjCiw9LJSVykqYiIwoE/St1CCKwXcdfIZZFQ8ohDQtsQ09PDagcpzjLiXVDiAq5AlhNGLmdhbA0/ngkuRyBjlZN6h3K5hYIp5SZmTKg3rwBqrr5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_181427_568730_F67A378F 
X-CRM114-Status: GOOD (  10.35  )
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

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/mmp-sspa.c   |  6 ++++++
 sound/soc/pxa/pxa-ssp.c    | 11 +++++++++++
 sound/soc/pxa/pxa2xx-i2s.c |  6 ++++++
 3 files changed, 23 insertions(+)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index fbbce81680cf8..f9066fbdd5718 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -339,6 +339,10 @@ static int mmp_sspa_probe(struct snd_soc_dai *dai)
 		SNDRV_PCM_FMTBIT_S24_3LE | \
 		SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 mmp_sspa_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.probe		= mmp_sspa_probe,
 	.startup	= mmp_sspa_startup,
@@ -348,6 +352,8 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 	.set_sysclk	= mmp_sspa_set_dai_sysclk,
 	.set_pll	= mmp_sspa_set_dai_pll,
 	.set_fmt	= mmp_sspa_set_dai_fmt,
+	.auto_selectable_formats	= &mmp_sspa_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 3a0abcb0bfbdf..9a98246ad19ce 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -809,6 +809,15 @@ static int pxa_ssp_remove(struct snd_soc_dai *dai)
 
 #define PXA_SSP_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 pxa_ssp_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.probe		= pxa_ssp_probe,
 	.remove		= pxa_ssp_remove,
@@ -820,6 +829,8 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 	.set_fmt	= pxa_ssp_set_dai_fmt,
 	.set_tdm_slot	= pxa_ssp_set_dai_tdm_slot,
 	.set_tristate	= pxa_ssp_set_dai_tristate,
+	.auto_selectable_formats	= &pxa_ssp_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver pxa_ssp_dai = {
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index fe1df78926f59..008cf5ae2607e 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -328,6 +328,10 @@ static int  pxa2xx_i2s_remove(struct snd_soc_dai *dai)
 		SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | SNDRV_PCM_RATE_44100 | \
 		SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
 
+static const u64 pxa_i2s_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.probe		= pxa2xx_i2s_probe,
 	.remove		= pxa2xx_i2s_remove,
@@ -337,6 +341,8 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 	.hw_params	= pxa2xx_i2s_hw_params,
 	.set_fmt	= pxa2xx_i2s_set_dai_fmt,
 	.set_sysclk	= pxa2xx_i2s_set_dai_sysclk,
+	.auto_selectable_formats	= &pxa_i2s_dai_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver pxa_i2s_dai = {
-- 
2.53.0


