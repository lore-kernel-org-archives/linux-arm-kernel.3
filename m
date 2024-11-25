Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56807D58D4B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UT0ygFIGNZy8rClncJeTPMnEQilwEgKkNkm99OuKNPU=; b=mpRvnzO/FfyT6PAnX2o2v6DECM
	Rwz/URM0fFTxEtBZkpto4ICfaAg5/OPIVmgdlYdl+f48pave3tDKGExc0jjKV/URty1HutGIrNjtj
	+2ocnz6hrFvrWWfxnYRVgEyw4onaPvGBZnYh90JoWG3irtCEI5y0p3LnQU2Pmc19SvTDv5NcapPoh
	gfCPe5OHoy3FNi1toHhLD0GmjSlpu/v7ufc7swlRaUoAaGkeit3KGAgfvs98Qf+iYD8VMDzt2gUWj
	xnQSDpAoXVNl/9Ge+/0rzqOvl6nJppD/A5bGPap8vesOFIjAkfWqLQgTtHsAAv1Si1AVsWahEbleb
	hbwpiVRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZOs-00000008Aqi-2LMP;
	Mon, 25 Nov 2024 13:45:14 +0000
Received: from mail-am6eur05on20615.outbound.protection.outlook.com ([2a01:111:f403:2612::615] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZNu-00000008Ag1-3p2l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 13:44:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3pxgxl14NCgjyJMlfQu9/OYjEiis5YgoaUxzNdkOigT+7i+oBEKHAzA81c70hUp27jOeT56uOC0gnD83GDr5PheSC3211RqzGifl0siPeiX2W38SznBIYKvKaClfYlryrFlLh/vUDpHAmAoHohv6ED2T6VcdmB1ztnnHSxPMO9F77sJ9FiYoDI6kpk4FBE/xpp7qyAFUjzeJj7yotV0U9XskCg4Es+vG2b+EJn+5+auIdoI54ACKdhUo+WjKv0mO8u5MdsHg7VZo6csKBgNBJxcS4e5Nbx6VwQoonP88KddkLaWn8W+rYHQOfQ9Wtbe99Ebg2Xr3vgsdE0NEHtFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UT0ygFIGNZy8rClncJeTPMnEQilwEgKkNkm99OuKNPU=;
 b=jL/5gJDq72KHwM9NdBYV+pQEuG+xJD8Q6lIXj0zqjVes+vAmAkawoPTTAopvoXvgRBwJVMsJVadHpKCsoYGSDQ5HEIebCcLllzqlGCx5YuuB5yqud0DJxbywCaCHWf/ayQl8xQ8xyf2ITc+rTg15lFLn6AgDm94bhIHLhie6eVkrlHrrBxWG+iJCj9vbEGRMsuvKR41tl8GTk6Qz5IOCx8sw/iVbsepgDURofsxw9wucOuwLGAcr8CV3ha23PFw89Jkfq7SIbds4aYZa7q127PLtbwmMusE4HlrOHFmKrYpwAM5XUYaz7qidoI373FO7O/gGUdhasHzOzYG7GAvlDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UT0ygFIGNZy8rClncJeTPMnEQilwEgKkNkm99OuKNPU=;
 b=OHhBLlccQaw85Amb3qC/1zztyJ5HgFcIttOXZIPkUe3pqBZuQ315ffNDmd2qdAzb9X8l0f4oo7kUainVUg1+T6GRd5bVjibHMIQfT5kHeFa210LrkNqL3WI+TDuwfwucvQddVo/+ocqMxAeq5CTazv8PUtHA3gwh/IcQCuEQfQ/Gs37pjHN9SQnZNOOPS9LH4d7U+ACepEsdXn/eYruAqOvh9TdHH8TVYIruDnyQ11LGH2LXl/4mOxLKfS/7aEJpy8hgOWQ6rsq0Mjpa2wFh6KPBg45cDh858l4PcuK0aLkwnTg10EhfFm3/eSkQC3xs69Ff4e3yV13A0ZxI7Fis7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI1PR04MB10050.eurprd04.prod.outlook.com (2603:10a6:800:1db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 13:44:10 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 13:44:10 +0000
From: carlos.song@nxp.com
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: support DMA defer probing
Date: Mon, 25 Nov 2024 21:52:43 +0800
Message-Id: <20241125135243.1612098-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::17) To AM6PR0402MB3944.eurprd04.prod.outlook.com
 (2603:10a6:209:1c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|VI1PR04MB10050:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6e34d1-3ac5-4243-c8ab-08dd0d573d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VQyl4q7aef7d6S0xjtxLRJE0uDlpNk01mLoT2N+xSB8odbxJo9YSG2BWWq6S?=
 =?us-ascii?Q?mWTjkzJ4CA9/wRRQo3W31boIE51EsGyqtuQezIX4dWveSWOv/V+SfsbeoRQq?=
 =?us-ascii?Q?axBgfeSBiEzwXs/ix1TuFyj5z5QFJ152GlU/ZoINJyN8qVMZxNIbUgQdYJQW?=
 =?us-ascii?Q?ov6dXVXPDB6n+hILR42B26tZHQZYd44k8slEGuFxEwZanxJd1zBxvHhL0sjI?=
 =?us-ascii?Q?9vx+q8lX6lp1e7Hr7hKDvpjS0ZyUXImkhzO0cdCQPhJGC73kjFdx3zxlbhFw?=
 =?us-ascii?Q?qxEMelf0A/5AgvPhvVUruNwfvy8Xf0vFrs/kbfSRrCKD48TXoCzsNVj5/nGQ?=
 =?us-ascii?Q?HvqfdYqvn36ArX7h6D+5SafE+vo3vecQXIOefYnuEuxWVC12ru/UQMqeUuPB?=
 =?us-ascii?Q?P+K04t3jyDspFwt1wyxybfB+MrM0tICaDn6WA4tEF72BFZBEsgVriQfZ4RJG?=
 =?us-ascii?Q?mCHoCQq0hRog/NlGY24XaqcHZm5YwsdDY67mHDhFxtXsQG0crZoaTV/Qa099?=
 =?us-ascii?Q?3okH2e9px2zjgcyNFSXggEuB/+S2fL5L2eS+z0mnBy5lt7LxBiGd4EehAWkM?=
 =?us-ascii?Q?WZxZjJC8lbWiC23vWhp7TBvfjLWLxefIZxFD0/s5F1dZ5QDef+y7vWt7JHOw?=
 =?us-ascii?Q?2CUki71yF+1c49ElB1XAbZCS8xUefFtennCdqMTQjl+l8jb4jUFH9DPv4TxC?=
 =?us-ascii?Q?cKKjktMEeO8oyedFpaSP5UFWJAQr6Th1mR2/HI62sq6wrwnpukhub1SmpskY?=
 =?us-ascii?Q?aiaHiZrf1gbyPzqP3bs/XsqIu5e70X9HJuqup4ZkMCyVBB5F+r25sGzfg/gV?=
 =?us-ascii?Q?4LIPWOiIkQk9mLpNkSNYwBaI58E69uPCnBC2qKckM+Y+B4NEZiMOz3fLJCKR?=
 =?us-ascii?Q?c+62mvcjw8DcRDvtNJbHdygg25P1wyflcvrXdvZH/V+taWTExBetXnvVIMYV?=
 =?us-ascii?Q?jvy1dUZCq/lzWRcBKoqdNUzG8oysldaC9qza53t6ni6I+L8fcp3p+WEr3aUe?=
 =?us-ascii?Q?rwsp/P/HHl1DOd6bWEk0JKD/v8WE/og9n67iZE5/aicEpXQxYyB2Bc3vf9zs?=
 =?us-ascii?Q?8Us1lC2mXUOs52sc3sI84QpRNjUBbfx0IdC7aMGwLVDPgs+2+1zG5dhwM1ID?=
 =?us-ascii?Q?fmctS/Po4YiIhw40FlRPBrqYOgeh8d+/OQNT9xHC6Pj2hfiQezWnATVtqGWC?=
 =?us-ascii?Q?T6baDntdf1j2fPA+xVwoZa8uuxZqU0yDDl3i4to2Q3IwBYnEQy9cGuDJbQSI?=
 =?us-ascii?Q?kRK2Rf66dR8VrDpuLa0r0n7eNDOKhD7RU1iGY7m1Y/85Mk8hTs49sOKFIuJX?=
 =?us-ascii?Q?ZfGS8EYEFTOYAycthzCITcnYRm3k3GaGD/zp3NNCG8FH1d1TM3qXBqRph342?=
 =?us-ascii?Q?LHgtc/NjD8MyhsUSTGRoUZ1ejreRV/WQ86zEsbDvdExl2qb3fg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AOjHFBCxy9P19ksN4yYAA8g+rcE6v0Wa0ocL7OTXn3d3NmuLgE7OJBVoJhc3?=
 =?us-ascii?Q?S/OgGlnlBywD2Otb0aeQMGNf6OTQaVsgOell4TBGCvwpwWWVeVLgEBCbXm0i?=
 =?us-ascii?Q?VkI06mUDG6bG5rbV52bgf61wiBWE07spEg4/Hf2Vx84wWwAVhl2k85qvVuzB?=
 =?us-ascii?Q?S+IQ7F4qgYq6O4btVKNoEQjiZ3zcbXTj32D+42+2nAgHzVpKJiUq3KB1MNAl?=
 =?us-ascii?Q?HyBaxw9aY16rdglAWkQ8WIfDEqO7ECNu28fmntNSC+f5GrdBpkP/REVoXNQy?=
 =?us-ascii?Q?wlKEK8lUHZUVoh+VV9x48ctc79t4hYjuZ7X5N2tXgZ7FUlQ+hTiCXlTP0FdN?=
 =?us-ascii?Q?TCI5gCdsUoHsd87J+TKXo6kSwLneCCf4yDRxJ9bOB4/tOxtLJb5C5LTJ2HKw?=
 =?us-ascii?Q?RI9/ZTH8TonHmsmsMMsz+Cgdt8V1Nyn+P0USOX1sffeNkHp7ykWgPO8JZHq0?=
 =?us-ascii?Q?fxXjEWZtsjk734Q0Dcdm40IXS/E4xGdHh6tkJR4tLuToU06JlSx+EdwJVK70?=
 =?us-ascii?Q?xx9gjyWc/t01KLwUyhZhHzsf8pI2oy2fU8hnRB/NXnnxi5XnwPHD132LaBU+?=
 =?us-ascii?Q?Ji8Txe7rh8nRIDyP5FSBysX3bUGchptXKUf9s1DpXVZoNLa0yAXOOM7M8Jh3?=
 =?us-ascii?Q?DhlUyYNVJ7Hmv3iXvk4c6bsH8ZN3Zw1WmIQv2WbfaZkZc5HiaaHB7aaPI3gx?=
 =?us-ascii?Q?yNWsg8GeHMSN3bIhqZhYZ6XmVwvR28PxnKaZKmOcMLwZMubYrPrr9fjA//nm?=
 =?us-ascii?Q?WowFAJ0V6Sxhvoe52/JXGNNbeAHhDRytu56Wn2uFzT4qdKtUiOAttKOnY7qR?=
 =?us-ascii?Q?O7PWDJe81ztp1TpCEDtIwKkfQbae5nX7am+3t/S3GR/UtVXfq7sJNahsaN08?=
 =?us-ascii?Q?cRcnha8Qc4TpxOvj9d/9RXOOussqO77G+BKvvB86YN2hE2ee1blYSaOQ63Y1?=
 =?us-ascii?Q?hvLhyiGKVNefzVOI6oppn6UVPdZ1HjNuU9uJ0SdhG2tNT66JkbRGAnX7eppu?=
 =?us-ascii?Q?Rzk43yA00jbGPdQvpUT5lZAfOoF3RQopyjonVfbgdW3Fd1lrEM36JM3DBW8m?=
 =?us-ascii?Q?9FH93MHSqngCV3eMwIvHyiF3pKiAd3VMOZ3cOinayZcj1B75FlkjamAJrLET?=
 =?us-ascii?Q?a88f7gjaidsk3V2PIS+f6vorfF72uGfeGf5S2GH2aTg3fXgwU96qwF8NowQT?=
 =?us-ascii?Q?Zmvm4Jwxm1k+Y/vuJMZDhRgSiX6cLkFpsT2TS2EXUTZJ8/PnJG7iCIWeqlT9?=
 =?us-ascii?Q?68Nh3zV4FyChbkM5VtJhcLVP9CqnulpGtK8Ji0sMNNXNU+t6WYLOeeit7pBk?=
 =?us-ascii?Q?JrTkgpDLv8RQKxJVb2maTTqJ9RXAiYoKxsbUTE6apPvHzVXDbh0m5MtXISEG?=
 =?us-ascii?Q?ZAf+p9P2/orPSddz8xmNWp5eyPPFLecydYdgXS/yYEG28QWiAhgeXAsoSB2e?=
 =?us-ascii?Q?pUMCEfD1BcUcsIxapY190tazZVqIEmEZn9YTk+bpgpbuZUYSEbnTTjLZ+aFG?=
 =?us-ascii?Q?44WeinAniN81HKMABai+qlafKKt9kTbLnu0LpirZao2VHLi/b7ju3+JmtCIt?=
 =?us-ascii?Q?sMWx15RT0NoP+tP7gYoCSijF+67sbKXgXvbWtD0o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6e34d1-3ac5-4243-c8ab-08dd0d573d80
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3944.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:44:10.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROGi/kM4Y78xhF+fM2ccJiG0xMykGZhmNg/QQLjVcDu3I1LSJQ2PGFNL61XrY8Dsk2P43tTLI/Ug9Bj9SN5qhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_054414_953100_9562BD8A 
X-CRM114-Status: GOOD (  15.74  )
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

From: Carlos Song <carlos.song@nxp.com>

Return -EPROBE_DEFER when dma_request_slave_channel() because
DMA driver have not ready yet.

Move i2c_imx_dma_request() before registering I2C adapter to avoid
infinite loop of .probe() calls to the same driver, see "e8c220fac415
Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
and "Documentation/driver-api/driver-model/driver.rst".

Use CPU mode to avoid stuck registering i2c adapter when DMA resources
are unavailable.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5ed4cb61e262..ee7070ee9e6e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
 }
 
 /* Functions for DMA support */
-static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
-						dma_addr_t phy_addr)
+static int i2c_imx_dma_request(struct device *dev, dma_addr_t phy_addr)
 {
+	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
 	struct imx_i2c_dma *dma;
 	struct dma_slave_config dma_sconfig;
-	struct device *dev = &i2c_imx->adapter.dev;
 	int ret;
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return;
+		return -ENOMEM;
 
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
@@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
 		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
 
-	return;
+	return 0;
 
 fail_rx:
 	dma_release_channel(dma->chan_rx);
@@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
+
+	return ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
@@ -1803,6 +1804,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/* Init DMA config if supported */
+	ret = i2c_imx_dma_request(&pdev->dev, phy_addr);
+	if (ret == -EPROBE_DEFER) {
+		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
+		goto clk_notifier_unregister;
+	}
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
@@ -1817,9 +1825,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->adapter.name);
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 
-	/* Init DMA config if supported */
-	i2c_imx_dma_request(i2c_imx, phy_addr);
-
 	return 0;   /* Return OK */
 
 clk_notifier_unregister:
-- 
2.34.1


