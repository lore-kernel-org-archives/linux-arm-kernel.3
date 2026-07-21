Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D4DC44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 01:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Cc:To:Subject:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scusy1qjER5DitcuHNKjnteY69s05KnoCHsTRfCxn5s=; b=E747vR3agXCriQ0r5bfNiokCo1
	51QSE72oBLOwTwjUNiFftNyzmeN4QBqZ5OahX29CMairGBwR07e3BIcqY1r/T4BT5bVN1df8WeK/g
	MIOGMwFvqEVtf2iqDezN53cza6GBn1tZB3SYghRQD287HnNEj++ExwV9vjlgvXxtdUjk859rhX/x8
	AvajECohOek6uIV2qA1q1/MnPbluCEWg9PB9idHYUFXLKI+vtD8Lg0D++jZx5ic3/M1fUz4NO9UeI
	5RWzRWez1GRFdJxdb44ukPD+UN4o2Zd2ddG4lQ9di3t2FolR9D80AFBY4c63kAIBFSb2RcNk8veVh
	RTXirrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzN4-00000008Bl1-45TZ;
	Tue, 21 Jul 2026 01:34:10 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzMo-00000008Bcw-2mZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 01:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRdEm0HC90dQN08K8DX+j227J1xnxDgXNbXeJiuawmkl+T6iOg0PxB2+qOKp2KO9liU4PIPidq3KfCS0mBVDU/WU6BhZnHtIotOEEHFWPXszd/OKWm3FtcvDf8wsLe3hSDpioY/c+g3SNg70FNGd6w2NjGQofDWywKBJaOC/NKx2fntP0AkDImaPIFTBtIOYCmMVwrlRh0eCWZiOPMt9CgRIb5hhRnmV8PtxsItxlpNne9KzvQgdrOoXZ6B2uJ/IgbHCwRnHQD+DGRkQxOoEr/RmdfhYvZo2BfyFLRhCj0NCQS23z/m6RdVbXh7sDNLlEisoMdK9XWRegZXQ3xhXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scusy1qjER5DitcuHNKjnteY69s05KnoCHsTRfCxn5s=;
 b=uRWzXTSkcO+/fShJ68v7k3P+BLGGMHmcv4Y0nuvzwFVi5FFVGMx7nO3QRGW4OIz14zCxkwMHp5/df7VycLpYn6tdUs7HdbOYq1Q5+EpMHbfCS837WRzzc1dk/KyHXxXA1U2U4jYnbHQ1IOsnA5rd5VvsQh2YCm8M07Qirixz9olukgbUn1Jcl2OQQWjy6sLQVCUXBaeg395sSfIR9/IDpwCh3dKkYrle6PS6CmQdaF+wSHDYIuByIm7/q/s8ZaZyeRXP/ozlKau7Hp3oI8VinZGIX5EbjnC+/1KOZS7lapy4qWsFbeBzofwW4eSI4iPJQRV1D+K8iZrQSi//ONt0VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scusy1qjER5DitcuHNKjnteY69s05KnoCHsTRfCxn5s=;
 b=W2So/y6a7vgtqARSAsq7VjpExHEjl8m4Wt9vVtF+47zcP5BWaZhoSO5QX4Y+ajmlXTkH26B0gP0hzGUwZqDeZfbbefNyTfwE0Whv3s/F8R8q1+0QZICtIjUiwrh0xVYlUsY4ebnnntetSZfavC0hQMn5c1o0DL2zPTITqGjG8zI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:33:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:33:51 +0000
Message-ID: <87wlupi0sg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8365-mt6357: remove useless assignment
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:33:51 +0000
X-ClientProxiedBy: TYWPR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d51c0b-b2aa-46db-0f05-08dee6c81e94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: EWrh17PHWo4y0t16o2aJKBXuF41SuGdj1EUwuV6KRpOjqYZzsURExhek/xshDeOFlkCWd3MoB0cotuQyITtAWet2k7aG7SvE/pY0XEv7HjPkavcEK4OA/roWP8A30xvYapk9SNEqWuNiuO261gvlV1KGRvnpBCJc2htXgjB4aH82vYSOB5YXq/I8sA1kw244iBks+MZdIaAF1ZzUB5KQD5jGuK1I+s8IO4JtlG1gpZlhBu7Mn5r9nVH3Sr3xwnbG5RLqVFn8Ptzxty1foXGNOhc27HsnKZR5xlfm3WEAYVXgYg5GT5LcfwUBoRohwI0GWmRJaewOMP6j6Zi5Kq+zYzIx0TvSNPOIEkVywBe8CynuUchN6oQGzG1HAUrshSm2qPzyNhhTpd4zgPtihXTnvjj9Q0Zrz5+KGRbd+/umJohSxYfI2UMAb2fFGt5Xo8Fdn+tvoX5u/zF/XjmVhBS9V9YWQ8lzwvKZB/cZ8E/7RqQfw/t1a4znJpXOUnxgLSj/QgPQbJvi1STvWqhogr8aiQo4qY4CHrnih7UTbircMN5ZWSbzA8HnSIm8/+fw9hIZntGlSkVtS5eB9t94D30KzdxQB9ZqRyR32hc3B797+1Fc1988ugaYSnJASm+EGDZR92sQS/TQqvE/tKDnHppn8H2GXD/xlb8ESfIkTIsSBXeE1ycpCSwUEAyOR9qm1W5ISzrBeMKBBSlNDUNQJmS5OPIt8HXNIY6G1NQ+LuFxL/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YcQpyM5xKIQJu8hg4Q93NUt8Ml5VLjmqwqJa6biTk8p+4HXKWkbE8OyQIMrT?=
 =?us-ascii?Q?AXDEyvE4gafJonIau4GPT/HESDqmdPodHRsZbmicpGqhABC8iW2q8it2yDN3?=
 =?us-ascii?Q?kntMPSFDO6/24/t8pt5CvVH2vlRuBLJYkEbNlci1TlBrw8+GYRtYiuhxcPUz?=
 =?us-ascii?Q?664HlIN1mL4voOf+rDncap5pghjE5PtVU/H8f+A1uwTvfTjhrwXz/AaE1Wb7?=
 =?us-ascii?Q?LpVj6rwTBQz0umq0MC+EGjIBy0qk3AdGhjfa+I7ybaX3+qYuXwTSQ+EPNvrN?=
 =?us-ascii?Q?4RbVxSoXCoCDsCbCmLGAY5/lCpknb77u1iSpEzAnEl9A5FfD+J+7alYd8ird?=
 =?us-ascii?Q?bEr01epEuVt9TNnF1wefQU0Xu8OfxZWZaGnpG41SFvcEZ/7QXpF2FSNYy1TR?=
 =?us-ascii?Q?W/Ki0TBmkVDiWp3HQdIcpGsXj92r7mnMDmli9HbfKNk9b54Uud6IUhVCDajf?=
 =?us-ascii?Q?iAwT5328bOo7cNEWKZmkr5XqcVgNGjONn4lCktXWoJya+TY5gO3CkaMJknoY?=
 =?us-ascii?Q?gI1xYW6EExpidBhu/XstpPI0F2U516pRj3iKitb87q5Q/gvbfhGkIAejFPla?=
 =?us-ascii?Q?kD87vGZ/qQdlwRJoWRL62uk0YfZ2djHldyVy3whhKAEtfNkjydL+j6OfirrP?=
 =?us-ascii?Q?FhYvff8K3f9/hhbHnKyEvLKdbGi4y87Xck74AvhPtqZcExW8dUNlawC14jah?=
 =?us-ascii?Q?J7cq//XkrlNwm8xjTDchad4RuYkHmRa87w/Jj6tUKnMotooS0sB5msrpI9bs?=
 =?us-ascii?Q?gkt6wEWXljoWQ97oFzeUnorR+s7JahtPY7/qkOMTCL7shks8zfyiZyJwAdNc?=
 =?us-ascii?Q?7s5Y2cf9txONzmoWaXlJAfGb7RdENARLI5IVJ6bnDe6a2MSmT00+Sm/WF1cC?=
 =?us-ascii?Q?B5zL56fCh6fo3z/uFzfL+0kuJGgj7folb/3CEyvezNDk1YlFXx4f94RDyC3V?=
 =?us-ascii?Q?UPxSqAq1rU6i3uTKUgd7cn/WXMRpTpXQIwwhU1dXlbNeEYBZ+yMMLcRLX7Fv?=
 =?us-ascii?Q?cQpttwLecH8fEN4CSWJnjctvJ+RnmMC++u13ek1cnymOTcySSmQ9WmKRYkNg?=
 =?us-ascii?Q?/dy+pOjHg6tCtkjX5o8pe5UFcDPyopPxdGZ1gRRQ7GFEB5/rtvli86hxbfTa?=
 =?us-ascii?Q?+nPID1nbS6O6okb4YT2EAV1pgKAp85bvuiehKR8KEwtlWWEUy5IKquRXL6xS?=
 =?us-ascii?Q?uYup/sKL3CI+PwK1LpLdqxo46RLlq+B7Kw0FXEnzgL5hjj9oleX56B2ZeYYM?=
 =?us-ascii?Q?q47304PmxhmCcM4m9NSG3dhwlF7FdCSIvtmFLK+NUGVdpAkZ3VPF2uw1ZEHW?=
 =?us-ascii?Q?0dcSim5ET2oDdUrawp9CzHrpf14uRQ5FwM5t6da0D/nHFEIRAe/G2REPJOo9?=
 =?us-ascii?Q?dt9dJJ5nkBGtoayoxotZATkICSbrcHf35sLpcLNEWfUzfmtlzrPsBpX57DqV?=
 =?us-ascii?Q?/KMVCYVUvuGJVOw8f5FQiUjIT5QVVVs/yY+Z0iDZmF/zew0rnxZwat3Ilg5t?=
 =?us-ascii?Q?FD7gVrhjcs+b26MWomwEkYiFniCqLTCM5ixtTKIsDAvMhWyMuuQgXxmsm3VB?=
 =?us-ascii?Q?gnDOIC8Z16FyVIIbwVNNJtyVqEHraNsZKTB5pvQgh6xy8BPfX7F6EaHcsuWv?=
 =?us-ascii?Q?HfjZPvS+sz4/6F/1/ZC12eoaAV/5aQWKmP+Y1FXJ7wZJ9Yt5EE2bZ3kMWg0+?=
 =?us-ascii?Q?emkdqQWNs0NsfKgQQEWmiaQ9wyrWadLBrYAeJFRf69ufIekeJp1ETc8zO12j?=
 =?us-ascii?Q?HLUXGTWh5N5EL+Jdpqbz3kfHqAWZSKcqB4G7KZ2RZQrleqMYtn1B?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d51c0b-b2aa-46db-0f05-08dee6c81e94
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:33:51.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMKVW0wlH/KdU1VAql7CHiQWrqoaCRKWca6efjg/1dLysKpAxUaP3LA+03GNuzVz/sXAszfdZ7EDPtTn9M82SX7NGz3bSkkOTQ3whA8Y2RCISbEX5ZOCFlngBiG2UaA0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_183354_734718_340C0537 
X-CRM114-Status: GOOD (  10.65  )
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

	static int mt8365_mt6357_dev_probe(...)
	{
		...
		struct device *dev = card->dev;
		...
=>		card->dev = dev;
		...
	}

This is useless. Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8365/mt8365-mt6357.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
index 4339f45ee115a..dceee837c67d8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-mt6357.c
+++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
@@ -297,7 +297,6 @@ static int mt8365_mt6357_dev_probe(struct mtk_soc_card_data *soc_card_data, bool
 	struct mt8365_mt6357_priv *mach_priv;
 	int ret;
 
-	card->dev = dev;
 	ret = parse_dai_link_info(card);
 	if (ret)
 		goto err;
-- 
2.53.0


