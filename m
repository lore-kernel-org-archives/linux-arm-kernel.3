Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5328DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 00:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:From:Cc:To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N58aP0s8yDnWFviY0sOhZnd1vxiappgvSpr87UHRRsI=; b=IYF9oJ5W93FS1CZSCrljjaFc0f
	MYdrhkL3TbuEajgqrf3txafWknCFYfpP1rskc/WDGGXapQ23IaQZWRMgqOxJ35pG6Yi2rR8y90T2w
	fKtj31gfsyFSXEbyUNgxELA2a1iIeiYXuSpn2W77x5d3g1MdsFqWmWppQHMr3YZd/i4gBGd9pPfhL
	KEC07T2ZT/UnZV0RPv6naXPGHA/W1KeZQ6DHUb/ow84c8aQIP0MyUUwPM5oQFLHRgI4YL/UYb8fuL
	kTgTujJxl2KoaxztbZOUw086AlOYWHeikmKCYmqhu8K2/uAK5MQ2ru2R1xZ03rcHDKBMwYNC6RRku
	r6jU01Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4WB-00000007sDE-3CRU;
	Mon, 13 Jul 2026 00:27:31 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj4W8-00000007sCv-3uJn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 00:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDHXviZ9q+y4bVbKQSVSMre/OlHKy3K0bjimSuBBF4bMP1FLWuOERl3PGJwyQRDA3gTPveLsia2JgL6OREWgxYJyyQw7eA6jzgu12LTknAzVbK5mG8epHjeC2zMVvQETgiiBPXBAvO2BmyZqp/+vMmgU72P4xAEYhpozxTuCm3pOQxP3KnDAmGjvK+Qjm3zRxZr37SNr27vf03W5daoVHdF0x8fVs4b7epIs7cE364AgduRHfiZyKbvxtnQtjgw02/E7DrOmvSqCrPhmeNc7t/3uv1LuXPOak9BTRHUrmByiLNZsN7LoLTqXMAfvKATLCaFQ2ujFhbrkN/5W1UKRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N58aP0s8yDnWFviY0sOhZnd1vxiappgvSpr87UHRRsI=;
 b=qbvwqszPlgfIolceKiTzqdOd86HbPifllsBk3Bf8cnZ8c/Vf/Pa5gkQYD6jE42+4NAiK/JA4QvwJS4SG3rw3GwJ7NdXGDXjRphg/toJNcmmBy9hVYRrHLTLWokb9cDmr7/xbl/fqHe3pKs/EoFeYn5Ia9mmq+DQKSy2Xjbb4uYKvxbD3ojKiAWdhkUeRX5MzhnDsU/tAAKKrZ5mFsea0f7aiTBezIKvfOhgr3CZ1g6fCQWfMfIDqJ21s5qIK/nfj66yhcZA7XOKpyzjj3N2y4MPwrJ1LUZbXpobE5+pHQk/R8JGfdfjJbDM7BzPNP2N5vARTRUtLLRHwBzTG4jHDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N58aP0s8yDnWFviY0sOhZnd1vxiappgvSpr87UHRRsI=;
 b=XiWmRXj1+H3AO8FQdG3SQjnG321urO6dAJE2f6rk1T+HZJTl2Ldlsh8PbvVRXGeQMmgHo+5sS8ZtQUK3fWVxU5D6L51hx2NY4KPe8VPu57uAXUFs9RXlGtgqmLys80t4TM1MTY+lQR8ViAPLLvXECaLw1p1quzupkc4z6V7RlDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB13304.jpnprd01.prod.outlook.com (2603:1096:604:30d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 00:27:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 00:27:20 +0000
Message-ID: <87mrvv20pk.wl-kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: atmel: use .auto_selectable_formats
In-Reply-To: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl0r20qo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Jul 2026 00:27:19 +0000
X-ClientProxiedBy: TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB13304:EE_
X-MS-Office365-Filtering-Correlation-Id: da5ed6af-9e64-4542-40e6-08dee0758037
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|52116014|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: YbJwAZ0pX88eD/O6j6UT+p70k/oW7Ue9Rtgz9qYvFB3Q3rhY89uKcVqywdFur4UfSkdvye8HLkPaEhFt6AqXunrpt0ItRebAjka8WLvINmeb4HlviT5mIa/CVCgHaKu4rUAWc6LnjdsDJtWMkmR44rusHD1CKUNTPBiglAuiAwjmie3kBalyLyKdHMhOKpkdszb1jy7gm8M0glksPEIyn1B2OhRhZU6JcYS4lWuuLMYjjfqvJugEpDp/ke3/7txx0aDbMOPHMLzb4Sm/lisVNSsFJqlgHvBqd8VWR9JsGLR0wLwXV66Kzh9CSAvipBeCdmruM+/WhvL7FFq5nvc5aZjBAxwpP2R2WIYRzETHWITyM7C7e+qOvnPEwEYenY1EBTjK80tHT2PmRvijwXkMTTAuEUbPEGnLYt8f3AYxJ3DtyTCf8Eh3EIBUjzEmqOr6x+T/fSeqem1RkraeNGAqt+woSKWSQiWJl7EKHMmb5jlF94Bj7/DxU1nkvoRiOBItmfITnFehv/c6ZJoackSavWHwU2aPlVSBmwn8oWgpHycYUcaKzfAm4eaeVv3LczVVkz+pja0URb4g4vUQXrHaMF+AQByJ9k/w74Ixr5n4yupldKwW6Lxqebu7ye3d9WJRjQwViBYfjLhFYNicnGDyI00ETlb8u7PD1jHOiKVntN2FPkWpxTJojoPq2oCYwiYolKciKL/qXHlqNvjvXVDCLJ/bdDblLJoZwf5c8xNCqD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(52116014)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dRJTPR8dAw+udlrckQCu2XgRaQmupAM2PU3TqqDduyUcghnngDWabOoFs+v3?=
 =?us-ascii?Q?nT7bPR+14DnsoZfXV6P64XGegssZMC+t6NzVs9C+PkgzEliWOtuHOZi4pjOO?=
 =?us-ascii?Q?l/xE+A7FxSUP7S/lDGCmRp7Zqwow/PHcJJH+QAJbrQj7amEroBAA9peCSDH6?=
 =?us-ascii?Q?2Pn3bz4EygQXHoJERQR2/M3LG4N0slYPdcXvM3tNIhJhkqayCPO7yBHZZqzW?=
 =?us-ascii?Q?vf8ZcHNkSDPvMHKxgDDP9Yc5sCr/t2P0pi0J7VBWqMUtHTxccDl+d8W3x7+U?=
 =?us-ascii?Q?elqy6yfIWxgVC4AE3VxVIcwL4K0lT/KZ5E/FcabA+xQAREfAFSOF7fBBjPoj?=
 =?us-ascii?Q?9YoX2Dww81Bd1lqilpsmbEISl0+inhQnpnF+TeN1dis+CP7Udl1JMMC9U85k?=
 =?us-ascii?Q?ywLcfX1lHMrkNrWqNCYCvQJVL4e+XOihW/NXjJh60KhO7fUBtwCeWorVTptp?=
 =?us-ascii?Q?qyCPxDPCrijJFnHYzeyJnvfEERyA72ofXKhn9FgrFcnX0g7o3uI4yvlfehr4?=
 =?us-ascii?Q?ZzN0FYFC1eO335GCqfo1/hexnsg59Jq5MeW/CaaEMrKyDovvDZjT71Uy61Sn?=
 =?us-ascii?Q?g15nZ1aJXaUGxyreLTLNDOYSV9QMRaSyW4MdDyAfJq+n1+CRxxKrbhh2YB2t?=
 =?us-ascii?Q?voiPDcxgjBYaRJ4RzECGpGCd1Nuuw8mhLS4TcaogLxqKDzNpKcl3dBaZnpfr?=
 =?us-ascii?Q?MAS0VHNTgrKY3Yxw/4ZlI9+8SKKftetmbWnJhSSlWxRo7lnMls+R5PhNBsUK?=
 =?us-ascii?Q?i/GK8OsNjl/lLrnsGyMoVdsKUPq5Is9x9x1ZTTLrAKM8Z9tl4tcdlgmWLg17?=
 =?us-ascii?Q?OebShFETDLZOI8D/NJbBpSnOO1yegBlkz7TDV8cD1Y3bNUTdZDdltgAUtF28?=
 =?us-ascii?Q?mI7ajahysWOa9e35G64TTpbzjRc9RBnj2QQ1tyMXlLvG/s4FUQY8CEF/Wovv?=
 =?us-ascii?Q?Yn3C2TSIAXjDIIKQHBXAEAO1dc8CB99/h4/HOG6e3XTAqsbopXsK067y09hz?=
 =?us-ascii?Q?c5oOB5AA9P3y4PJqgVmWhNRd8uRp0H5NXK6g34N++ELAPrx+PL+UUaIG2NlH?=
 =?us-ascii?Q?kHCaHC52ggR2/zppr1q66+nCqRTVZecoKCgQ8TFD/p8ZFZGtYFlDpai6u8jf?=
 =?us-ascii?Q?Ie01rAhNtRSN1emLpg+cTvtt+Qix8E4bQ7CtQ9YHZY/uTsyiIX5nKEk4Y4dk?=
 =?us-ascii?Q?7vyLKrXGEJ88Ho5akMGRwp7I31/QS8bREOdvq97zsK2T3YP9r9F5YgTj6ACg?=
 =?us-ascii?Q?XgRaSx3BA0GzcSRM8UhCvRFuFSjH4pOzPeScvUnkG6bW6p1c81TjGUTLFqts?=
 =?us-ascii?Q?JiLEr0hx+gmOS+stl07FoYMLlEYSHv2ghQNuDxZKOCWCPC0NcsSslguT8I1r?=
 =?us-ascii?Q?GgmAfXNtr0AHtsvqWjgjvXl7FTpvMsX2A991m+RS5XI4WL3wyKfeOMXqf4mN?=
 =?us-ascii?Q?yPT4gY0fy1DvZ5fIPkdLI3bX6xNC62BtGN/ZTN5M9H4mX1/LwyKiNSjwVhyv?=
 =?us-ascii?Q?bX1ZZ9XQO8Sxssey93NX3T0bkWLUJ8qInYBtL6vgNOV5oL8uZlv1Ll3Fxp5x?=
 =?us-ascii?Q?mPm8iFpyi30gMHrZWjxpf/TC9F1d2phqw2CJmOb3ODLAPvlJC2skvVEphpLP?=
 =?us-ascii?Q?b60YQfsmjvzJqLFsDzqKeL/eUI6WMh8DRG9L56SaJvl0941siYJ2iTmXH0OI?=
 =?us-ascii?Q?Ijq1Te8YNH4k6pE14zVgjgTke1kPI1dzs5gaN2Vy3wMYFj9sCZZzK7p3CXco?=
 =?us-ascii?Q?9Ybq8iobOOA4wj0nJ6PHT9ob2oXfTxU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5ed6af-9e64-4542-40e6-08dee0758037
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 00:27:20.2359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cS8ijwehaN06waOte6DYoAZs1TcC0g+Rbs0MfJvsYt9J2iJGKLQqGdScpQOMFf/IyPimgTy4ccJ9iLsBtY0N06KU4i0CFl/kVbvSQmGBB8NeSKkJGgyMCAxDifB0/O6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_172728_992481_4B7B5CCA 
X-CRM114-Status: UNSURE (   9.89  )
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

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-i2s.c     | 4 ++++
 sound/soc/atmel/atmel_ssc_dai.c | 7 +++++++
 sound/soc/atmel/mchp-i2s-mcc.c  | 9 +++++++++
 sound/soc/atmel/mchp-pdmc.c     | 4 ++++
 4 files changed, 24 insertions(+)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 762199faf872e..d9ad262ec44de 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -540,12 +540,16 @@ static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 atmel_i2s_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_I2S;
+
 static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
 	.probe		= atmel_i2s_dai_probe,
 	.prepare	= atmel_i2s_prepare,
 	.trigger	= atmel_i2s_trigger,
 	.hw_params	= atmel_i2s_hw_params,
 	.set_fmt	= atmel_i2s_set_dai_fmt,
+	.auto_selectable_formats	= &atmel_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver atmel_i2s_dai = {
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 89098f41679c0..f4f886bf678d2 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -825,6 +825,11 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
 #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
 			   SNDRV_PCM_FMTBIT_S32_LE)
 
+static const u64 atmel_ssc_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A;
+
 static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.startup	= atmel_ssc_startup,
 	.shutdown	= atmel_ssc_shutdown,
@@ -833,6 +838,8 @@ static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.hw_params	= atmel_ssc_hw_params,
 	.set_fmt	= atmel_ssc_set_dai_fmt,
 	.set_clkdiv	= atmel_ssc_set_dai_clkdiv,
+	.auto_selectable_formats	= &atmel_ssc_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver atmel_ssc_dai = {
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 17d138bb90648..a832dee73ac78 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -912,6 +912,13 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 mchp_i2s_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_GATED	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
+
 static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.probe		= mchp_i2s_mcc_dai_probe,
 	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
@@ -922,6 +929,8 @@ static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.hw_free	= mchp_i2s_mcc_hw_free,
 	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
 	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
+	.auto_selectable_formats	= &mchp_i2s_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 #define MCHP_I2SMCC_RATES              SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index ec7233ce1f78b..a6a9b5e6cd95e 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -741,6 +741,8 @@ static int mchp_pdmc_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+static const u64 mchp_selectable_formats = SND_SOC_POSSIBLE_DAIFMT_PDM;
+
 static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.probe		= mchp_pdmc_dai_probe,
 	.set_fmt	= mchp_pdmc_set_fmt,
@@ -748,6 +750,8 @@ static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.hw_params	= mchp_pdmc_hw_params,
 	.trigger	= mchp_pdmc_trigger,
 	.pcm_new	= &mchp_pdmc_pcm_new,
+	.auto_selectable_formats	= &mchp_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
-- 
2.53.0


