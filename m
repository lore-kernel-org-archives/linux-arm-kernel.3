Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B817C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWSWdbUdLUJegHgXoeKUtX0FLKPfUed1q5e/HPmxbZ0=; b=C4vibUelnZ/qA08L/VNwykkInf
	UeTWPBEoBrMtHvpI+vHHQAf22OBfu0N5PLOkqICsq132wsan2cNxmzqbSr0X2kR85RAMF0amExsjK
	gZGvI+s9liDkp+7z1+bt7daJ81Eggvvvnq7v2BgclachKj3E0WCoAIRfGX/3rnA8SabObd682De4d
	hWXsfx8hjDaNskSYxG/ORcmF7WYLFm1yuQG0ZX++hiIEMbWnrjTyygNf4q1YOWLjGEW9PvhMhCPwL
	jOow1Izg/mez5pPoQSLv+vKjr94e8+k4v4A75tMZOpB4CHmm8k6W+ltSW+ai5EjRHBP3mKqK0SXLu
	5j0SRgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thhUD-00000002SN5-3LFy;
	Tue, 11 Feb 2025 04:03:01 +0000
Received: from mail-am6eur05on20609.outbound.protection.outlook.com ([2a01:111:f403:2612::609] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thhQG-00000002RkK-0iVs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 03:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPuEDRCcsC7xxfEBML3x5UFHx5E9k1ridncJfYkZWmDuDqc/zNHG04TQsRfZJCylIMFyTWctemyEGsU0gk8Wa8QOQi99FBemdd5ivyQZYzJ/8bgav1KtpJR6PcBzwD5c5N9/v7hwtyJKHUckCOMlz1Zfm4OHeOoumZlDz+1jV/3UwhJk0qBDHt3z+MArZlZJ8lPsGOyBg6zXJ0xbxL9vpIi7PsLlvb8V3JrNThmUOujjDT062etqWL1MT5ZN54v/QXsRXG48AdGHrNr8kFSajFIF6EKVz4ZFPfy5HcswlZSxz4VMBfw55Fv7cdwSxVWLsUUqGqZ3yn9bTGObha1Gdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWSWdbUdLUJegHgXoeKUtX0FLKPfUed1q5e/HPmxbZ0=;
 b=Q0SBZRklKSiuo1quzN4XjHuZd4npgSjQ/Au/3FfbIr3bNU52HSQqCJWxNElepuTGeT7PiOzk4B+YfKTcEIY+Wm8K76iTEz7Odyg1r7/fEu+yps/8hdXeAO6t+M2nVS/2ZzqOl3PXBeg/CvI2EEF6X566y0BQ03AM9g7ct3pZpkhoiUL1C2xU7avgNTyOVKXshGt92b23Emvtk6gBL2ah9iDyvK00IKj8UJIKN+eKkHnzzp3pK0DkDV/NQ2J3b/29wLK5gx3Ltn5yo5yQRNDzEulEIq26iYswU/efrzon+Ez56hIp9hsxgCi0SV1LPznVl1go7Cs/8SI9B7kxtqdN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWSWdbUdLUJegHgXoeKUtX0FLKPfUed1q5e/HPmxbZ0=;
 b=lNUumjgKtqyU15uxcZ6aEpQlhsjpXIs0ARrOryZJz3VOGcV0YIJprHSa0/qifLlRRI2I6Hp3cV+3E6IiONxfLE1K+8sZdYUaIMEHAY+Oa8D0IP1Hj3fuGoluhzdPOCLlUrTs3YZ6WBDJGHhPhtt7rel9qDeWbumwlEDb7g84tjVaH4d/S/PjLgOAspUVxvERjREQJnYZNBhm0pZis73oiOwy9dbAeQVBAxbmwrnSuEmFDNLZIzI1jorMCkrmDVJr93+8cjMavaJMxLE26oai3uqMqi0qpn3nPTPqFlZEqWLMO2JlPA9Gb4dQ2MVZOwX0J2K2gk3DEwUt6EDgrT1ffg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBAPR04MB7304.eurprd04.prod.outlook.com (2603:10a6:10:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 03:58:48 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 03:58:48 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only support
Date: Tue, 11 Feb 2025 11:57:37 +0800
Message-Id: <20250211035737.3886974-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBAPR04MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 7690d8e4-b1db-456c-a4e8-08dd4a50637d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kdyk7xbsCQt/CczTWJtgitLIP8uPYtj+3qLF+bRJbae4Dh07gg0WwF+gufqY?=
 =?us-ascii?Q?R9FplK2Y6duJ0yGI+vdM5iL+73eOx647DnweQ3UlIfPVScE/XRCyRDpmOJXb?=
 =?us-ascii?Q?MfvfjrWw7hVKa+qARJzjS6LR0xYP7M+qkFVlGB62F2Dj6opbmpFjDYb1JAsm?=
 =?us-ascii?Q?kTkO4mEF6h/fF95cROU7pGfcCiiFhMhP5YCywShKDPs4IKUZTCBKvvrc/73T?=
 =?us-ascii?Q?bXBdB8wfFY5eKBrDWhNTt0WGkq67pWkptIQyU7+k77Y64yubLoSCm/GtBzZ1?=
 =?us-ascii?Q?qmsWrpZp2EzzeLYTWuvRFavlfWvohNRUCsASVe6iBreFVZclDTk8Xi1j5BhH?=
 =?us-ascii?Q?2AFrl0J1h0lL64uKzlNdpF3jQwx/Jed0JZvWp13R2MDG5ne1NxN2Tg2gY6Oc?=
 =?us-ascii?Q?ay+RjS5mdOwBCxcKGQ40dVDzrC49IhsAEi7R6EiIKCHmVfi5wKx+NBHvgyi2?=
 =?us-ascii?Q?FJFEnefRqkQexhiMezEi/T70tdU2q9kqmIEmO/l72pQwo4oCVlVjtRq3PFjA?=
 =?us-ascii?Q?q2r62aeYGWIEqYNbjE+FT0N64N0XWxop2j4FbJvrkJju2/BMaqWoIbk8o1v6?=
 =?us-ascii?Q?yKz0RvLVtcoZP8ntWh3fj5nX11abVY3YGapDtC7pFLJvQuG5x5bOnU9aHsQc?=
 =?us-ascii?Q?WRmd05HdCLIBNRE58Jkkv92fltIr/QCymqsDNHw1N9o/o0dMBT95JjhYYRNV?=
 =?us-ascii?Q?Irj92M0o2nMaAEZoG5naU9hamBlzvXFhFRYuT+YH2/fZasRNV4uKV5MEKpfc?=
 =?us-ascii?Q?2MDhaiaPUTmRHHX/xv4aJLuYiP2sBVV5Gh42QoDMW8DWjQP+NaKQYbCQgLTw?=
 =?us-ascii?Q?x2A22h0DI264Lxjjcnn0jnBN83IVDdNsp5n61G2kki+bawkeU9XmAnRyJ5Fo?=
 =?us-ascii?Q?Y9bkaBnXyChXTq2GKMCjGnXBIMMC34kDVPjWvf5QeiZXnHHBLnV1Ku+s5n0S?=
 =?us-ascii?Q?rsJl8GmoiKBzcb0yPxRSMtF3cdItfL07Nx8kX9EhM9qZ7V9OmREdbUVIgf1K?=
 =?us-ascii?Q?lC6UtY9WzQxS3gppJdoeGDVCJYvVHlzbd9bzqr9lzEmDJaBMmzA8p22aEA5y?=
 =?us-ascii?Q?q8HbSNsuduf/cOQgb2pNXbKTsqWwyxRyh8tN+GRxNLeUIJMwHmTSY3fLK0/N?=
 =?us-ascii?Q?Kz6IhXZKTsRGvLp3QeNii71UIUevIVGUMZ8Bh7hF943s70szYDVIPy1vRV7H?=
 =?us-ascii?Q?ZNxqegSw40QZTr9rYUDdc7dKyD1BigLLK8nvLxPSzTEfYfHeBNAM1H+Fp6BE?=
 =?us-ascii?Q?LkT1YwndmbT49goHxw9AziWoWfTYdiZeNciK8dxbxCBg3r8J0Y/ZMNlsG9Z6?=
 =?us-ascii?Q?6mJU888mBbfLg5B9LYyzr9pdQY5znm/87SYVeRjxKeNMZz1DMiC26tytuTSz?=
 =?us-ascii?Q?Fl0avehfwTb6WmsOcK10th6tUPSlFXMnmaUiK6nElW82rflcsqTW124O4o1i?=
 =?us-ascii?Q?+Dr9MnXa/u5e1zhuvnFgs5egytGvE3p85MUArOBf0lo+djrMbImztg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cTAx0+y2hm4t4oQOAGKc+LLI/azNvWlg82mxutQos4hmTOsrlPLzfJs/zwcr?=
 =?us-ascii?Q?4euRRcfsE+K1/Kimu3AwAFYFhkXcSF42WS4wnxqlIU5zOz9VCryQDogs7/X6?=
 =?us-ascii?Q?T1G/75F4RT1IwEqMyKL3dQG7dNSbH+f48qMFZSikIlew9D3W2Ql3b8ZBZdun?=
 =?us-ascii?Q?+YCAwgJU7DtXrPr7ArxHsq/XXm7wJ7L8kNUw9oQ/XZBCFuL7GX4I2wY9xG8R?=
 =?us-ascii?Q?hy6EeW8S2P0mad7aHORZiyqkGB32kUSS3N1gM/fVR5DVPRWjIeH5Dtb5gceI?=
 =?us-ascii?Q?gJu+Hlxsue+BHMVAdj0axXXXQRI3yvI/lV53WKi2gONVikHektn7MzAUUEpw?=
 =?us-ascii?Q?kd+gi7Uci1mOp4hJZb/ICXLAVwOpxI7zbT8IJKEe8Io2oejU+tyDvUvlzzsk?=
 =?us-ascii?Q?RSk2CPU2jrIZjfKgbhRlddPxsFr11mtx/SfARXGTeYEUUyZ8IbKXllWbPdZJ?=
 =?us-ascii?Q?mwxAX3EKzybMdhheWxbCTwERcrA6K96Tim2x96c3dW9o+1coFddMWoeUk0rG?=
 =?us-ascii?Q?+XO3JzAcuVeZDBoOE/Oj2FZWf6M85DnIrYN1nlRbLUbp/OXVa+32sIxLF4pP?=
 =?us-ascii?Q?h06hhWO1T9JTq5UcydFAy77HsRH0O1foIhbkqVvkXUXYbHtmc/tbFUeMqrax?=
 =?us-ascii?Q?ULZoGfmwKmEzHJYtdHJtB4iQzBl2QaLo3FPC+DBbeA3jQSrSSbTNvgbZ/gqE?=
 =?us-ascii?Q?bidEkrc/PkXq8vCYWVf6rsZY5hHYdvpRVe3m+KORyYmQ2ypWGv+uYwMzJFU7?=
 =?us-ascii?Q?xblfSd3wesutbqy7iaFlomh/WKW1GxQ6XCC0t8pKytltSQlW+jRwV89NYHJG?=
 =?us-ascii?Q?ytDtajxuS1vhS3w91bm64vLqiPKSjYef2s7m2ZWOExoNqfv8bC8tsMvq9+99?=
 =?us-ascii?Q?p/Ameg5uyqUkdigtC2YHb0bTw29nNaF5fEq9zm/LGufvwbw2UpghmGP8JaWL?=
 =?us-ascii?Q?PquCaIR72/FBxRVwdCScT5AforeT5G2qeqYLTbA1p+4Bb//HvKhuAZMbAYQy?=
 =?us-ascii?Q?gpjMACeYZ/A7hzcVKFIrMGkPTkRoy9Iu8Inka6juB9Cbu5x4pjT3P6SEsPuD?=
 =?us-ascii?Q?FobqCokJogdjAd/rBlwrImdoIcA/NH41xUGosc6v9rMZv5GAVvJ+EXvhsLEJ?=
 =?us-ascii?Q?j1+E+nP8IPt4P54xmRR4PeGpwr+KgWdctNpN5zNR0XT4rkXJMLEVPGlXDtxg?=
 =?us-ascii?Q?shu0OPfJk4AYMmKsZEeVVwITXXiylI24s+R/7NYfmizoKcG87EClkMBv7ty+?=
 =?us-ascii?Q?vfX1R5iFOs+KIVeZVkpS9ClzmjBNDDVmn0qzVMa/dsUY/pb90mPyV6xWA20G?=
 =?us-ascii?Q?QZwOdypn+1cPrRaF5L4pbs+160RCyFUi4a6V6k2ZElJRPyjUCRSVnKzJRTrH?=
 =?us-ascii?Q?xNn9uCskTI02sMLRi2+v4qyhkXcTmGWV5b6CZTtDbjwmH6t6dFaeRtQxde8j?=
 =?us-ascii?Q?YJrc5AKhksqghBItQL3vQdQf156TpyW1aOj57pg97hEQm3cHJ3nAV71EdK0/?=
 =?us-ascii?Q?xDoN+LX+Wtdk190Zqnhhdm+Hy3rMZDBikuhkWGlf1q75v8vpLJ0QGyp3EF3n?=
 =?us-ascii?Q?omoJFcmOdGDT0NKR1el7vWlU7BEgLB+GBN6qnbxt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7690d8e4-b1db-456c-a4e8-08dd4a50637d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 03:58:48.6554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CqvqLnuKqAy0/wWyhai6I3sUQQVcXekVK6XoIiiG8byxkAd4dHA0mpJmO0p6OzOnkACH5eTazMi0EbsJ6miMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_195856_219577_5107D4BF 
X-CRM114-Status: GOOD (  11.47  )
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

With the DPCM case, the backend only support capture or
playback, then the linked frontend can only support
capture or playback, but frontend can't automatically
enable only capture or playback, it needs the input
from dt-binding.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-card.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index ac043ad367ac..905294682996 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -518,6 +518,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 	struct snd_soc_dai_link *link;
 	struct dai_link_data *link_data;
 	struct of_phandle_args args;
+	bool playback_only, capture_only;
 	int ret, num_links;
 	u32 asrc_fmt = 0;
 	u32 width;
@@ -679,6 +680,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
+		graph_util_parse_link_direction(np, &playback_only, &capture_only);
+		link->playback_only = playback_only;
+		link->capture_only = capture_only;
+
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
-- 
2.34.1


