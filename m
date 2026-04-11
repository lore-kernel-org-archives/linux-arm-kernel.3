Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45B9F36BA6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5y9mnqQP2il1p4CYEdgF7b9etjKWyTTTo8IlKJTR0Ao=; b=EbBwA/HCBivMVfcZWP3f6MV2dq
	LxsMHrk39q9lIIFd1UQavcfYJiG7dmjsHZB58Sot5MQJSmxW1l7stEY5B2xtsJ7TdDoxJgXGOBq2d
	c/ZmqWFnnOrS2mdwVj71Gy8kmupDgimVDSVMGbqHyWWSdv0+cSsAXamWdqQ9OXgsB1N5/vt40wOH6
	F9zNOSe2TOQObMUB4WHOLjqlTh3k0O2nMDu4BmZZQ+cqm1LJw7CmS2H6Z7BBiFcZis38FXpvX+RcU
	+ZsgGzGYT/guTvJGu3r8QhR6N147Bu8Q4/HB3NovZ4ijT6ZcHFpFqXwcXIP+tRrzVJku/A5/6SrUx
	cALQaW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBSiS-0000000DELn-1LCh;
	Sat, 11 Apr 2026 07:25:16 +0000
Received: from mail-norwayeastazon11013002.outbound.protection.outlook.com ([40.107.159.2] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBSiP-0000000DELL-46IR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 07:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1V/wSrq4IUswW32HHAExtWrGlIkbS/MZNjkFlx4VTxCBtxwUpj3LHxBUHBcICX8athDGHizdHHOlt/RzF4zepfMiCklwcHboMPCE+GuVz+EipxgrXbhb/KxjVdKFQCU71Xn8cBNUu02/TgPfiMjB1QSR649BLM+PFTaLOuwcj9YjAf43ohZGzdX0lyFtoIkOm62HomXFNvklS/2VT5ImJXkFeAW+pxOAxs/cTmUj7eNInXks2ryzuGL7YkMRw/emFfoHbZLl5QyojYR5tsgB4xujTBaa1vlgpXGwsJgV4dClzzOy3MyJJiLZWOap/QnKAjQda8hX/7ZMP67oyg0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y9mnqQP2il1p4CYEdgF7b9etjKWyTTTo8IlKJTR0Ao=;
 b=FC2804vRSBavTBVR92dluigSGF70AmiazQHUnZlZz7HrBZ81FoeZozgVyt/C/sWxaDLPqETahTrxSYLORsBbrx2LEggX5gwlksxO53C/d4S8nzz5IlS5AUqT3cHVResZxPpCW4yeyKwGehuHvU/McNcQpP1SY7W1ogS9AJW+6FSXow+Zc8EXwteUwoX357RvH6pvjr8LvauAfNfKkQD/DRR9jVsn4GJkOjoM1UMhxG2u+1GcrYt2OPVJ1vxzlP42k7QeX6f7tIaYEQtw67wgN+zdmE98AJozyymLtWQnPrF1WhMtWE4X9H2g0sEr4SN9NnA1+7RXBfhmspoXvjEx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5y9mnqQP2il1p4CYEdgF7b9etjKWyTTTo8IlKJTR0Ao=;
 b=kphkTyU1JXG+rRDFNxavSa0gscovk1c+c/5FWUlNcoxZYRN5vlpjzTFZEDO640/y+I12OI2+/w+ju5zAb/5gUs50Sue2+4D2d87ibCIM4311qt4pfoiA3Rd9vP3qK/d6Ff/tIVM6mKevbs+IcCrWBqzdAZNp/Wk1MikNT/v+5NLNtzls8tcDOQWWrc2wZRXmLjar6HZMYTsS/2y78rFoGpU/TvHrT/MwW7m92P4uyXiOVRQ7Wg3fhPl+OLLcmHfJaufUZIzXh406plMvMCO8e1rKYs08Zd3i9c9fQIzYUSTelzoS+6C5O9lb4OdE3KezpavX62egAgVPoKjg7e/fJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU4PR04MB10622.eurprd04.prod.outlook.com (2603:10a6:10:593::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 11 Apr
 2026 07:25:03 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9769.016; Sat, 11 Apr 2026
 07:25:03 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-rpmsg: Fix ignore-suspend-widgets only applied to codec DAPM
Date: Sat, 11 Apr 2026 16:24:39 +0900
Message-ID: <20260411072439.1125664-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0231.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::23) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DU4PR04MB10622:EE_
X-MS-Office365-Filtering-Correlation-Id: 39455e3c-4de3-492c-5992-08de979b727f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|19092799006|18002099003|921020|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: 2wfGEicA6zWyOqLvJ7nGVXNdgHC57u23X8wRfAtJp9eLd3YC1tSXQ6sMcM1322Oxr5IENN+/SOP5cda+IpjJXsuOcrqKNXmYkvpgRPiXRLTIm6KF4qUAclVLwtVzQ0C388+mM1CyBvlMUZYNkZ8qcmDSBQaSVgGIwceFhf5HSUEpWRTIp8vGFHhAJrr9PzRoqNWGJBY5+8Umw4+kAnxTfUsAE4PdbC5ed+GSPVN1Kxt2YM38ZUS9U3E3/PhC8Hcq7KLuh+0TvBRYd9LLe861hS2SBAp/99IMMMr2G8e5pEgUaL7OTdrZXfs4xNn3JUniocqae6wkpnY+jdLYWRtrmDlgHELaH1GTdBXOKfvf13mitAPrTNwZt+HhTc2N+eH8wbyl136T36VmyB99CQHLNfnzeQ7deyQ8Jeca77bqEzzCyn/52vFpiyH7LjLhU0CaiFMKEoyZWQkP1RILu926F+RwCVhe/19AvzlbIC7otpzWmz8WFV5dWLH5hOVnybrnRsBT/Q6TjWL/jrwmFTbm91dKyQidoiHBFeLk6wJzFn7vcCY9+VOPGklSW6ncPxDDUFN951gPNYTHyrz+ci/s+OrurCXQ9c81Ai1vi/IWISG8iWeJcWu4lgqq9Ts0bLbZU01qAggrvZ/w5e4cTLQJU4yLSeXHrOt31QVrRdbvAkD1bURwmaikofBg71I70XRoUQbHp7hth8P8EWskbstoxAuEcmcbtuxE3PDgOKpRQzjEXr/tfd58Y11hnDwiN77ioRVMICjHX7oMEVakJHfSV7vIyagQY+7UNWFaaJEUXDc83SiUyOPksGW6GME0Ervt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(19092799006)(18002099003)(921020)(38350700014)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+igXv5t+JszUe3sPSLq7c0wuI0l6/k9WDt2eNkOqaz0dwMxYHk7ZYceJpy2G?=
 =?us-ascii?Q?CLedPTegGjk+mXSPiMytHsqXOhPIGYz+9MyGYVjuX9uLPXJJLXz/BnAbJ0RW?=
 =?us-ascii?Q?ISxSpN2mfYxtpg4q/NpnfeBAx5nimaWTuWjesQ+HZElOSY2NHULlaYF0adSm?=
 =?us-ascii?Q?+2lG1rzPqHHykqQVc3ii0ct/3r6JGrLiGV/ab/e7JxuvjvjPp/CPi2dx9gvL?=
 =?us-ascii?Q?J1myTcJvovgjzcVSEhQ5ZJ6Y55uXsw0wNF0iQu6YxR5opGZj2E33ag1Bb/uk?=
 =?us-ascii?Q?bOANGJHvvPqQDZIAaSfM7fQXTQK1ceSLxsYFq3B5NFnEyYo/t267JpJ4WSaN?=
 =?us-ascii?Q?ED3AJ9YDA4vyyy07C6nzSZOWUX6VOyU3NHGrD075XxD3KXI2s938qgZnwFpJ?=
 =?us-ascii?Q?ZXFufbkRAU8JxPRrjQbIa79V2d+ERGWsds7A7KeHZqLsBwNg4mGkMrMQrawn?=
 =?us-ascii?Q?HpYxFHux/t/nFpTh9B2FDQgN8+wLDoKanB+BdGs/eeqAGAcuSqmCgua56Cjz?=
 =?us-ascii?Q?RIfIXRv2Cte3cwwhliM7UtG8+LcZFuAzQnuH4kwyZOhrVGzRH27/hdsRCe9U?=
 =?us-ascii?Q?ac92n0u6d4KJl5PwVscjV63g/+CVqe39/GJ3ZNbvXVyumRDOzyJ7VZgJ7AVM?=
 =?us-ascii?Q?ge9oBGaB9x+j02pA7h0Dt5yQC1+UynkcIhSIM2c8vt8Ci6OTza3gGL2yVQZk?=
 =?us-ascii?Q?eiDVl/LXMI0KKT2fpZUx4b8XsoNgVZLKulXAVXPE9rBWUyCF42UjEwpJAYP4?=
 =?us-ascii?Q?xfgKW3wJtO+fqnESvlqhNZddFyeK7pyIynNQxfAB0LAvL9eNxosKLCFkeFp4?=
 =?us-ascii?Q?UfGV8OA3wraYX5juXi0xcfrgfE0I3Am1T+/QUD5sP9qoJmeqiW+1256vz55t?=
 =?us-ascii?Q?TKLNNJ9ulycv9W80OHduPufX68R2iG6huXC6dRldnt+2dlO1xODb46J6SHRH?=
 =?us-ascii?Q?qXmXFVG7ZcHQ0jrQgCK7YPjfAZd/KQC6Pj8sWxx0oveRCItZgWozbkMrq/hH?=
 =?us-ascii?Q?Uelv9PEooPcMcWv4agoscL+B+Vq0fSUVMYVk40ly1boy6zn1piZQDAQSNdfw?=
 =?us-ascii?Q?U2eTiQmh9SQbE8FOzdzzgBQng0lwYJ6rDV7nJgvvdCFUr6kXvM6HGRj8FTi/?=
 =?us-ascii?Q?PycOrmVzYRGwns7i+AmzqGNBIiYcA6Foqr2UakybP85MffJxLobbSFD5Q/1t?=
 =?us-ascii?Q?Q88LpLZ/O2RlAZYJuD/7UvdMJ/npqDkU2UXWxzQAMeOmcqkOqRzEsOcaFsyh?=
 =?us-ascii?Q?x/JZsTW0cDltTgBL/0bK1/HfQof4ikRJVto08UMBXWEW3HpKubo3R/JxEMvq?=
 =?us-ascii?Q?K6N5L08G/lgIWDmPsN0RAEMLjb23XaetXIj8d16MHW9zu6VKGVDqQVWbRhua?=
 =?us-ascii?Q?UUVKEYLnQSCumXGjn404Rs5qve18AwyNqZRaCYBfeJbDwRQ/Rtl7PQMO5bPy?=
 =?us-ascii?Q?5EPb/2JVrOVieGg+c3uQ8qZB9ndKCrGZetO/LJXMjKNBQSKEQTUVRxpAgq2i?=
 =?us-ascii?Q?PtowlBgtLpiA+bLfRa7+1w7ZNafYfL244GzQU765q+Wwudh/C04wsh0rtYZj?=
 =?us-ascii?Q?2l0o4dmGg2V0xmqZ/w1VqZP09G0Ws96fjDMFrDCb0mrKL8YFn4AMMD+jkBGD?=
 =?us-ascii?Q?a47XCDUE1b8GQkXWGfYvlp5io4jxfYppv+Dh540fJOdlow9HDmxq0lgnUvY6?=
 =?us-ascii?Q?N3eMkjDilZ33K2Lna3rvUi41Uq48BgLq1kNsDAxzTwLKZyorfUknrBLGZZFN?=
 =?us-ascii?Q?QUyHVCOcvw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39455e3c-4de3-492c-5992-08de979b727f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 07:25:03.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ly1t9A/NdM7g7vxOm/oVRyGk63nlzu3ypwL2YSKhJ3aPmYCSWh04mWKA7jrA+hLls3l3aTAbd2RGUz1/MJYimg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_002514_061630_B3E8DF72 
X-CRM114-Status: GOOD (  14.34  )
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

Currently the property "ignore-suspend-widgets" are applied only to the
codec's DAPM context. However, some widgets listed in the property
(e.g. "Headphone Jack") belong to card or CPU DAI DAPM context.

Extend the handling so that widgets which are marked ignoring suspend
are looked up across all widgets in the card.

Fixes: 5d9f746ca64c ("ASoC: imx-rpmsg: Force codec power on in low power audio mode")
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 40e0043cfe15..4b09b22d413a 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -87,10 +87,29 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	if (data->lpa) {
-		struct snd_soc_component *codec_comp;
+		struct snd_soc_dapm_widget *w;
 		struct device_node *codec_np;
 		struct device_driver *codec_drv;
 		struct device *codec_dev = NULL;
+		int i, num_widgets;
+		const char *widgets;
+
+		num_widgets = of_property_count_strings(data->card.dev->of_node,
+							"ignore-suspend-widgets");
+		for_each_card_widgets(card, w) {
+			for (i = 0; i < num_widgets; i++) {
+				of_property_read_string_index(data->card.dev->of_node,
+							      "ignore-suspend-widgets",
+							      i, &widgets);
+				if (!strcmp(w->name, widgets)) {
+					ret = snd_soc_dapm_ignore_suspend(w->dapm, widgets);
+					if (ret) {
+						dev_err(dev, "failed to find ignore suspend widgets\n");
+						return ret;
+					}
+				}
+			}
+		}
 
 		codec_np = data->dai.codecs->of_node;
 		if (codec_np) {
@@ -107,22 +126,6 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 			}
 		}
 		if (codec_dev) {
-			codec_comp = snd_soc_lookup_component_nolocked(codec_dev, NULL);
-			if (codec_comp) {
-				int i, num_widgets;
-				const char *widgets;
-				struct snd_soc_dapm_context *dapm;
-
-				num_widgets = of_property_count_strings(data->card.dev->of_node,
-									"ignore-suspend-widgets");
-				for (i = 0; i < num_widgets; i++) {
-					of_property_read_string_index(data->card.dev->of_node,
-								      "ignore-suspend-widgets",
-								      i, &widgets);
-					dapm = snd_soc_component_to_dapm(codec_comp);
-					snd_soc_dapm_ignore_suspend(dapm, widgets);
-				}
-			}
 			codec_drv = codec_dev->driver;
 			if (codec_drv->pm) {
 				memcpy(&lpa_pm, codec_drv->pm, sizeof(lpa_pm));
-- 
2.50.1


