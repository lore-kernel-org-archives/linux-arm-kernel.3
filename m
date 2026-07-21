Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB836C44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:From:Cc:To:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBZep2jMVlcEftpafSb7XFwv14mYB3I3MyW05gPaUoY=; b=xPsOoekZM3VW4ZlKpxc7XXgkIE
	Wd+m6soaU3STx3sjjATHBBnWsZANY1KxTGXIjYT1VpiOF+zIDXxHlyNiZhGGDuqstfTPvPQCRvnIi
	HX7t8Mp7kHIeFMjdv7aaFn4OlMqTZut8l/MQ7jTDfLOj4oIb+xxHDVN1pDR2hfR1wN1sFHB28iibb
	0/rBkZ6FQb/7dtNLiK/MfXORkBLstO/0uhNAdbEH3hKCl73yGWLCrBbKGulUG3P06gGBn1cmJdZWR
	PqILoddXeGjTX0rK3/YftSSwsPTlTMiiFP9bnL8snZgwII/OSnlkCRTS3PA5Rk5WeLpUlvOndC6hI
	/Qokn7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyqv-000000089sc-3Fov;
	Tue, 21 Jul 2026 01:00:57 +0000
Received: from mail-japanwestazon11011046.outbound.protection.outlook.com ([40.107.74.46] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyqq-000000089qo-1i1i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 01:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpXbqQ3I87OlCv0/8CHcCi21MkeYQm6EmxbLQCaXJl2xTFuWEy3TLg1C+2CVrV4NDHZlghBWh5hECOAHhJpnXWTf+q0kG7PWVjz622VGNOj0ZbOAz8gOFqWFf8U312MJt6byGflm9ZZtoARrotRk/1YopBq9NXf7H8+FtwSl/BmVWaUe7EHCBD6rz5hqJYvc1ROOVv21BNQHnO4Zqne+zQcJU87MOl8ex43ZulyvcgzbHCklgHDZuZ12VuZdYEwV4A6966iQ/Ujbpi92Jvg7R/q2vigNbZl6CNsatQP0qEh6O3CVu71195QavKGrGUCi7E2DzpsFzbMw451Yfz4CAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBZep2jMVlcEftpafSb7XFwv14mYB3I3MyW05gPaUoY=;
 b=DlnANdWWi3FIMvweMJX4eOBUi4hqRxMjHOSBcKdAYTgHx1in9PMfVuUJ/OhPw/frTJWiXWRQsteHMiRIqT/al1XLyr7Ye4k2gnl9dgfgmgNVknXTz6n+le9EVgdE7EWnu53RMZyIKplX/MRajS/Agf5NGoCeXUgWxuMwZ2lrSUARsAfOA0J5sfdZ9toSQxx1fcNFbx9/BUqeIv44+BjQGqt998HHlHnDVzCKbz/EFLexFMjJ7I1wLB4SUUtLHq9irG81zLRpS49fYt22cs5TrxLljSlix1IfjfNQVCjeFg4G3RBM+WTnHsz3BSkz/mC7OAizxQMkVSTGf9bYN/DUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBZep2jMVlcEftpafSb7XFwv14mYB3I3MyW05gPaUoY=;
 b=Qczw/UwtiSbE1MeQPCrByXBJy1vba4oxBf+YBPHcn8PQH/RLD9/8LJ+6Q4+9a+OLl/4ovM4o9vtzHsdpfML/I882XqpV8TDGMEY/8MU8sjJiyeVn3Z4f9zFz3UnllIrkBcXYlBdkfLuKuNSHlqq1zqfQbblVUp+FVj4baorqGI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB15382.jpnprd01.prod.outlook.com (2603:1096:604:3a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:00:37 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:00:37 +0000
Message-ID: <87tsptjgwa.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22C=E1ssio_Gabriel=22?=
 <cassiogabrielcontato@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Takashi Iwai
 <tiwai@suse.com>
Cc: "=?ISO-8859-1?Q?C=E1ssio?= Gabriel" <cassiogabrielcontato@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 4/5] ASoC: bcm: use .auto_selectable_formats
In-Reply-To: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
References: <87zezljgxy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:00:37 +0000
X-ClientProxiedBy: TY4P301CA0110.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB15382:EE_
X-MS-Office365-Filtering-Correlation-Id: 917cd280-241a-4d9a-9125-08dee6c37a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|7416014|1800799024|366016|11063799006|56012099006|10067099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 4k0i4wNMRaF2znXjS+NhwvKSwTytk8TRFuV+l+2/b9oP6qRq+SK94L6+gzWVQ7+zZjnhQkwtdXtNYLAEmZtLuyCWv+I6kx+K405hh3c7/G7j56YyykYDbthjl5AHBcrYhfsQsfnNQlEDOrGsAPuV36tXxj662XdCu/3bxTB8QQoACboiKol9ccG/hiGG6raReG7cRs2uaHsjF3rG7yn6byhFZa6iunpA0tSwOk3Kr/mgzKb6Ire3tAy+dfhuaUOG1M1dhxAnxRenbS5NDMWU4r0pzcTW92Dmt925S27yibKftIi6524JSz2vbdWYyGwD16NPhvg2qOZ2cpOW4e9z2hA3wtc7gJWpiZNVw1V0WppYAub+6dPnnP5o9MeLqG1FuQPjEOzeI5bs0XfVrjs072/bbWrxS+xvrUhteaPBykzpc2I0LCVeKeRaogtEtRpLD9+RgtYamflHYyVvcw2QY+U1og7rj8X/Zd2yEbRPDfYRHicZb7FeyLBsQyl8q8Y9TcDkvkHgPmLQR/XTzzQlVi/j6OWz2t7AHITr/qVMwBkZdYnCm6642oerS0W9cpJLZgfhZZYrO3Y5osNz9ytaNje69mm4iC4QaQqZaayZrsu220d4AYsl0iMBEot3TYR/yjK+Ww6sf2MpR3dXz0Do8oBmYMmBEaRbJpJyAWi5ZD4J2ogpbzuAfu6vXcVwOtCluzz30gbm/6CMiUX/Aevayw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(7416014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIuQCZPEkfxcZ4PuuT3OZexo436q/KVIM5KDx7kfDqhNze2GHA24EKf61MT9?=
 =?us-ascii?Q?RPCCRYUzPpbgK2y704ypufjV63/b6OBSVrvjsq9lsSCGDa1+ZmBk0P6ZVpiN?=
 =?us-ascii?Q?jeIwGVSia7qNvOsAdRwB3KYibkaLncGtztNYMOfNcuKo+1oxx2RiBed8vYTn?=
 =?us-ascii?Q?sV3xNh+yvL7dcKWNSTYe4iR0EHybQ4Oc6Tmk4XZNYB296qez+sEXFMUNLCbk?=
 =?us-ascii?Q?94oqOLng05s5X57Z8NT3xeBvzPRtzU/iWehpFJG+k8eXJ0Uli/bVjZZN+wIq?=
 =?us-ascii?Q?q3S/Zt2/rbz+nRVfIuI3DECWPFrt/i6J4mUn9n/t5y2rmptxlM+plMNznkNd?=
 =?us-ascii?Q?luXXXAbMfd2zE21OeM62hvK0+YsaAY6A5UPROL6Ee3pyulmKve08mj/kPKaB?=
 =?us-ascii?Q?E4EOBtMZyDOia+NXD4FEv/RgLG5tQRiPDiQjrD8T5RiObUcbjFVAYIYylSCH?=
 =?us-ascii?Q?xu00T1dKbah73ZjW6/ME4wVLukYhXuR/qw8YAJJF6J5u6jQ5giyGF04ox9mu?=
 =?us-ascii?Q?c+e5sth+eC+ClqEQHw6eAZXSIueCieimQ/Zq1vsGc6zFlCqBCeCpGCkLhnTo?=
 =?us-ascii?Q?VztP/Z+ou61A+eYOVkKGat8R2VJ2j9+/RIspbOuFkPpffwkM6zVx82ZpiAG2?=
 =?us-ascii?Q?R5BAdYCrz0tg12Znnpi5APYwixcSCSXPmZsiVyDzKRehBFpWnKgH0xbrHJAB?=
 =?us-ascii?Q?QGtsmU6mjTjnQ62ZvEBQRHZNNyyws3xW68sTXeaSPHV6jZLqO8M3Fy54Zrx3?=
 =?us-ascii?Q?8mdpoTOmP7V5nFubIpGs152ZxbPbIIEDGvX/8a4Bz5BKopCnyLSxWAGEfoVh?=
 =?us-ascii?Q?P0hM2RA9dB17ES71XNqRWJOKIYhYW6XIRUKE8n+yXWg92R+YInaRCLpOuCeg?=
 =?us-ascii?Q?rcGlZwwr1bGGQLjG//dnrOFYTsmWTFP5Cy9vzbct+i6MksTPY8zjLj4SOyJd?=
 =?us-ascii?Q?ba30kpIxTT7KWLL4uOpYJBbJOUK5Q5YyzANYl8U/Fc5vK6XTV/8Vwc1HPnPO?=
 =?us-ascii?Q?CkEoR+v7tpKE9WZCzj/38UrfVWX+AbYYQmCl3An7GwrksYIdjZjKx0Hpsh9U?=
 =?us-ascii?Q?o6Do65RISvG5iBgDGw+CzbksF2QKALYNWem1MbBSXdJdPOdKvAdkqec6D0b1?=
 =?us-ascii?Q?Uv52GpXaNoqv0z1P0TnuNDiOfb78/czKzC6y4Ap4IM2p/PE1bMjqhpUKTRNX?=
 =?us-ascii?Q?NN8U+D+gHduPjyQ/JE4b9whLBkIg98rS8O8Eze1VDTMoiAtV/Gna9U1R/+2Z?=
 =?us-ascii?Q?Li1nJf4ZT2lUcfySbMODG8B5M573qHhpHZTxDV//g6sDbgKCE63tzghRqrPs?=
 =?us-ascii?Q?PZDVK0mjFh4Q+sCmAueOk0zVQ1s6j7iomQdOV3fqz7jYoSLyG5nCWa7M621A?=
 =?us-ascii?Q?4bq4iEoWiqv1wBU0vHOFq+oeGABPGk6xTcEEtIKhSxusqKFEgOHla17kx0v1?=
 =?us-ascii?Q?SZm9LSDnwAoo5AfPwjmMi8uo5gLPTVg78Ba8+Mn+fX6BeMyPBP6aBMsj4Pm0?=
 =?us-ascii?Q?xjgp2h6nMHgUYXLuLNVEqI7gK4xXX4GB87B7+HFdxrnVeG7/fKs6XgHzN9cV?=
 =?us-ascii?Q?3QGTJuAG7FkVLfMQfXtCP72OP/N+P1m3JvAyZhdZ9iQqxmpi70vVExxd3SUr?=
 =?us-ascii?Q?TyY77eBVKJilGpyMkd8SHqP+9X2/t0n84yVKakugOz/y6XkeRFWyPuTFkPIB?=
 =?us-ascii?Q?hFHY1/obnCmSwIdOcneu+xsTTrhD8xg2BUMFm4Z8kF55Tmj2YC2ImSdZ+ID8?=
 =?us-ascii?Q?p0DkYv6fBqO5P33gC/EVDF7j/pUoGBM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917cd280-241a-4d9a-9125-08dee6c37a01
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:00:37.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JE2wASOEVMiWtkqMPXtmn7VJHG0gBZoJT4FYvJoCPRtFqiS0lkrXV7oakiMtv6B53B1z1yh7g/lHtHhZXmusEE0JKrJv3ANoIl5ogJBEkm3Ut+nwOjgD05pemLAu4A40
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_180052_447342_41E97876 
X-CRM114-Status: UNSURE (   9.94  )
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
 sound/soc/bcm/bcm2835-i2s.c | 13 +++++++++++++
 sound/soc/bcm/cygnus-ssp.c  |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index 87d2f06c2f53a..2089778282541 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -748,6 +748,17 @@ static int bcm2835_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const u64 bcm2835_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
+	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
+
 static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.probe		= bcm2835_i2s_dai_probe,
 	.startup	= bcm2835_i2s_startup,
@@ -758,6 +769,8 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.set_fmt	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
+	.auto_selectable_formats	= &bcm2835_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static struct snd_soc_dai_driver bcm2835_i2s_dai = {
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 47706ae0a31f0..753021789a522 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1133,6 +1133,11 @@ static int cygnus_ssp_resume(struct snd_soc_component *component)
 #define cygnus_ssp_resume  NULL
 #endif
 
+static const u64 cygnus_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
+
 static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.startup	= cygnus_ssp_startup,
 	.shutdown	= cygnus_ssp_shutdown,
@@ -1141,6 +1146,8 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.set_fmt	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
+	.auto_selectable_formats	= &cygnus_selectable_formats,
+	.num_auto_selectable_formats	= 1,
 };
 
 static const struct snd_soc_dai_ops cygnus_spdif_dai_ops = {
-- 
2.53.0


