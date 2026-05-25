Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886FBCD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 06:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s0CoIKHVEgspwhErVQEhnqKpUPZoPE3lbzhgsGsXgjM=; b=jRPtZxEAxnGupm6OjtQv4+uTdA
	C0voFOmkNf7tWwJi3eF4fJCHRDwy7O2Ri6r8W9ywnJ020VCkvlDys9t3VvPAuk6LSOHWU898OXtkH
	gazcaJl4eXSjSkJFg59Re8IVase8J5/uExynpsxxzMfNyV/LfDS1kkCykuBX84tonyq9VrzxkX+Cb
	06Aihj/yA9nxzyiFf5d6UDfGpDxcFV3sUySZ8aSKBPdVly3tgPm6253UnhdwPICeMfcUiZMj6wMAM
	+1d/nIX1zwq52ZWYzWy+13H5M35NQvEhzwY0ydA612yO/oNy3UQtaItAls27UFbxbv+qeG3LHCCwe
	4WLprNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROmf-0000000GPpM-3weY;
	Mon, 25 May 2026 06:27:29 +0000
Received: from mail-northeuropeazon11012034.outbound.protection.outlook.com ([52.101.66.34] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wROme-0000000GPoZ-10bp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 06:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzpwMk/AZyB3rKyxyXCDkH1lumzMRUODc1dA3fCAsBIpjTWTXWptZdsJg59MdIp0aUMRz5mjUOHCyd7zmP/5X02x/ZYTm8T8tvK/IAhuugXwBOGbyEONrPyIrwtUPYFlQPZ6pGCWtscQJgqUIGXlGcYLPWowdlr6fBNoXFAFo5LdJP/7NgOPcIWKB0CH5YZ3GpfPt5B8qW+NamOeIJDC0vZLe9iCT0rfXzFYF/BBdMoRws2GDD4kEGD0r7XKaw3gKPuYwh1FPQoV8W+E5LvzLKmo8KGXooVpY/T6AQ9yEW8bpimo3U5h/Y5VCQyw3Posr4e+am4eOw3L4zN2WpsHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0CoIKHVEgspwhErVQEhnqKpUPZoPE3lbzhgsGsXgjM=;
 b=b91npJ5QvL3TnuiNl7IwAruMy0hxy1WB0SoUhmO5IeNHg06d2psy/QJlmRWcdta78qXksc+NVfLnf4JVxHQ8SLSe46LBxbjZHPMYcB3WqaXdGsC7mXs3HlD1yofkTGXrkikaUAUKhxJlwcn9MmXK+MxAcUrvgPtURWjGNoApJ2VWzTdfSYNiQG3oHnSiRgMbJsPNd9yiMjJloUwFnNudQnTJy/H+xqdCpSZkalwvPUeWKBC7xlFitOfHJ8e+HBS3GfsqWoyeVC4MR7MkBMZ4QcBy4AFIgDWMUX9XLyI+y/0Urs1wcXRsDsV9qiBvpLrlm1CpatT0g9WnlBMdmB12ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0CoIKHVEgspwhErVQEhnqKpUPZoPE3lbzhgsGsXgjM=;
 b=ECSXzF5WX02ZRrxc0s5WwBm2g1YpD/sQOVXxt8o1OIuT6ABdJxulzuD1RvDduiJA1lmdYQse90BPVah2YqdCczJeLHyojjOZmp9pBTxs1cMZFKmXT/W1oHJ6mdLUtziAr9Re4DVh7HrzTaTF9l6bVRVgJ+XLpxwRo8AY++XErbxZQ5ad3QAywrVxC7uMARokOaUarXTP6L5MXjgiCoSWsgNS2B4AFNEeUGQCxzWMQnpJ7PJBuXS2aq1bvMF6qYtFHOKB2PjcDOPp5hVuBfeJLI121JeE+ZMfPV5Jzf0pjZ+9arKmFmufLuNJUFyOJ9CdGC1OpRITgxNYejbjjJXIlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 by VI2PR04MB10764.eurprd04.prod.outlook.com (2603:10a6:800:271::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 06:27:22 +0000
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51]) by AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51%4]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 06:27:22 +0000
From: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] spi: imx: replace dmaengine_terminate_all() with dmaengine_terminate_sync()
Date: Mon, 25 May 2026 14:29:28 +0800
Message-ID: <20260525062928.3191821-1-carlos.song@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::14) To AM0PR04MB6802.eurprd04.prod.outlook.com
 (2603:10a6:208:184::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6802:EE_|VI2PR04MB10764:EE_
X-MS-Office365-Filtering-Correlation-Id: c21a8052-8666-4517-0ea7-08deba26ad92
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|19092799006|1800799024|38350700014|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: bPiK7OS0nGQ4NjYXx7VSRYyFcCXSb9tXVPNHJkCYq1zJJL5c0+PQKgVtVL441FoOrA9ECR0gWqJd9wxqzNISfoah4Pwpbkw4oAtgZdasHIvF9mPXmOxb5jRmGFPX/GoPtx7VR2gkkk6UGlr4mo7QnxxB3SreUFtHdYUgbVCjDMIBLtjeeRHDTOHbiUTbur2j3QJ3hflTIXBYCYVkEZb4Rq+NnuWSS+haT+N7txuv4sunznQgHorGnemEt2PcvVjtZKbt82rC1h2DFSJfxls0Hqv+KNFVvWN0DcFnESUJ2gNi/7wmCKaWPKFsuEYdVuJVuuG/qOa2HJqjpEw2URkIqAImVPKturP4z1TCbQWKtBZOD+w0FJbJMBlGMilhOg/J1/1HeHdIJlHb1n4k6/mXkyZeKa3Rfy41r1RZ/ycCZpZg+G6HQHu+rxMJwqct2V5U6828pASZoAK0zsJlC9L3+KNCBmoaWWdfNAE5WVALDRVw4zldo9/sVd2bWn/xkGBnaWBvChvIPGRaN5GlYt+wARPgQP5+vs3CBwH7JlO2y0vGP0SLSQVzQZaXXXKmJE9LHpLJlOI35Ifz3IYZTmF6BvjhCnlV/H+Ut1T2B7JhfKwHNit1FA8S5G6+kvKh/8M/tJVxaOo9iPN2QCIKbrWbRVaCzgu50kw+Ra/ANZkxX1Nn87DLS5NfBRQeWLCPNcd6w+iQA1Eiw1HGtWgAyjHV+G1CZXAj/HyUiPCS48s5G/IS/wXBfGKq12C0vK9SD8Ps
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6802.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OpirdsjbydIlLyy/Xewmq4nQ9ThBeep+il3q2ZyrIOI03oAzXdFRAuTe0Bp0?=
 =?us-ascii?Q?/MKA5VfYz4vS0rQpCr75FW6Yc+vV8ujfvafPSMT4LzZ1MzbHQzejaYsKk8L/?=
 =?us-ascii?Q?77iH0l320tb+3XVwag81WIDIZ9Gv7Kdpq4Rce6AV6uLyVo1xcV2hYAwnG9p9?=
 =?us-ascii?Q?q+G0e6OQX+kwb1Q6rw3EiZGh0JOVp2hgTNnFiHd7+VewRU/MRX5rftICDNi/?=
 =?us-ascii?Q?RJDgATAMlplJ7gmdGozQA93Ksk9j48Mor0gkznUVc2bkBxbCx3POKY7O1XIh?=
 =?us-ascii?Q?ailNd9HuXY214Lyplwm7Q8/eXXeasD36j26SvD/7X+F25vqJM05sJSXEG2Ju?=
 =?us-ascii?Q?s7CXOdyD27r8EV4kxoo4loNTCVTSFZAkRJKt5PGJeHndHIOMo5a5QgkDABKG?=
 =?us-ascii?Q?kRrwcQRmS5bWfcDKc3eBQ11RKIicIRyPr/VEVJNwBEDw9wGBUtjj84zWcY2W?=
 =?us-ascii?Q?EkGMIFy7GCM7CJmFrW5bl0zw92kHJnqhj6vXIAeLsaJ9ZozfL+CrEKbY980H?=
 =?us-ascii?Q?DVh+2QGQ6TIcEx4c3WcYKr4+8wL9T1vySewaGd3Sz4m3T7nQiZTsm4pSf36z?=
 =?us-ascii?Q?olSPo7L0eqx9OLkdpR9CW7ebFQsxkGYtH4w1sLaEsYC++yK3h0jApTvgB4bb?=
 =?us-ascii?Q?qNdEcrSzuJJM8GRWlubRCNMQGz5SzF9FbrP25mbULOnHklCUQ/QKvZJGGfHj?=
 =?us-ascii?Q?Lc0sOLP6vHHi8rK4vhE7JHr31q5RE2SgZbLYq0Tp6QEGRQwQoKIuawmtwcKw?=
 =?us-ascii?Q?iQCnRNqN+ecf8YUw8BtwmDutLQjtoqh8hxsSsbmrN7U22NCDGgpndo+JgBN8?=
 =?us-ascii?Q?QwtSkoJ+XvT6mpP9DqYtiecSxLrPTxyUKEUg/DpYendqbz1QFeNXq6h3VROU?=
 =?us-ascii?Q?n8CB6XQe6xbsMNMUCrmfbTzT3GsNuhSDUhBfh3zaIbpG71j3wy2iNQysGN6q?=
 =?us-ascii?Q?DSNnf2+Vz0Up6RCglaLW+impY9TyX8GkazQiYPF22plL4U/CYwW82VgHay5Q?=
 =?us-ascii?Q?nOSTPp6Ke7bEHwQpVuDWeTDw92FWq2uJpcOHzVHWfbjKOUXWMrR5pwnvtlB8?=
 =?us-ascii?Q?U3MKFBtAXE2Nb9SlsH1pPtlP/q72k4CoDYxwUZ1vVWHNVQ7q38gel7WSM8ZR?=
 =?us-ascii?Q?eNgsBq1QC+a9RopfsMXkGaFmHwc0ieNiLyqyMzyYvQ21XbscTGN0HfByn+l4?=
 =?us-ascii?Q?qwDu0u9WQUo2ril+UR61psU7S4zpoSXoDfyIceaa+bQA89aHFURPnEJ+yiG9?=
 =?us-ascii?Q?kuo+4vDRs9LmD+VmXX/VlQk9hRIRs5SaNx8s2bX/a9QgX53wEZRSZaooNzIe?=
 =?us-ascii?Q?EtFqTmbgg+ji8ioFy79ZFRw9I8PmzhwNaFlytQ2QfOPRcFDwU2vuBVLnDgqT?=
 =?us-ascii?Q?q07g6MjYzLPRq16YMRTD+7WYheAaCqA9jpQWkcXRRuNcoFdewEKTc5LNotUb?=
 =?us-ascii?Q?WN8L99QDCk5fx2c4q4sdY5XpJDsYKoOioa+R/+/YuYoDVB+B0qY+Qaq3QYKe?=
 =?us-ascii?Q?t78KHNEiZo+fbaYcE1lnYoOWRSNuOtJYJ5+/OyLvxGIZcX1+PQ1rorGnF9lZ?=
 =?us-ascii?Q?zINA6Qg5Soplf8p+Sn2Fe6hNrlc2P0m4cpcffg/Qrl2EnHcjYmgsMJwmqTP3?=
 =?us-ascii?Q?ObKMMpM3VhouruMRkQKek/5Z/ZnJdPOuPUvJnIPMyvbMO7KhJtEUrahE0hNO?=
 =?us-ascii?Q?Czzq6jN1FYQEvEe/NBaXPaKx3ixIMq3FG08mR3vRm60UoWkPDrJaYuodu6Yv?=
 =?us-ascii?Q?98+ta5n5eg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21a8052-8666-4517-0ea7-08deba26ad92
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6802.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 06:27:21.9751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8h0XztaK6WioJayaSsi0xqo25VwL/f5Jo3/NDueLBifY0ao3Q5/iLeFely/8z4UlJpd9whs2oLWtDDJXKuHJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_232728_281794_B93AD6D3 
X-CRM114-Status: GOOD (  10.24  )
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

dmaengine_terminate_all() has been deprecated, so replace it with
dmaengine_terminate_sync().

Fixes: ba9b28652c75 ("spi: imx: enable DMA mode for target operation")
Fixes: a450c8b77f92 ("spi: imx: handle DMA submission errors with dma_submit_error()")
Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
Change for v2:
  - Fix a nit on title and simplify the commit log.
---
 drivers/spi/spi-imx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 480d1e8b281f..ae9912905c67 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1774,8 +1774,8 @@ static int spi_imx_dma_submit(struct spi_imx_data *spi_imx,
 							transfer_timeout);
 		if (!time_left) {
 			dev_err(spi_imx->dev, "I/O Error in DMA TX\n");
-			dmaengine_terminate_all(controller->dma_tx);
-			dmaengine_terminate_all(controller->dma_rx);
+			dmaengine_terminate_sync(controller->dma_tx);
+			dmaengine_terminate_sync(controller->dma_rx);
 			return -ETIMEDOUT;
 		}
 
@@ -1784,7 +1784,7 @@ static int spi_imx_dma_submit(struct spi_imx_data *spi_imx,
 		if (!time_left) {
 			dev_err(&controller->dev, "I/O Error in DMA RX\n");
 			spi_imx->devtype_data->reset(spi_imx);
-			dmaengine_terminate_all(controller->dma_rx);
+			dmaengine_terminate_sync(controller->dma_rx);
 			return -ETIMEDOUT;
 		}
 	} else {
@@ -1793,15 +1793,15 @@ static int spi_imx_dma_submit(struct spi_imx_data *spi_imx,
 		if (wait_for_completion_interruptible(&spi_imx->dma_tx_completion) ||
 		    READ_ONCE(spi_imx->target_aborted)) {
 			dev_dbg(spi_imx->dev, "I/O Error in DMA TX interrupted\n");
-			dmaengine_terminate_all(controller->dma_tx);
-			dmaengine_terminate_all(controller->dma_rx);
+			dmaengine_terminate_sync(controller->dma_tx);
+			dmaengine_terminate_sync(controller->dma_rx);
 			return -EINTR;
 		}
 
 		if (wait_for_completion_interruptible(&spi_imx->dma_rx_completion) ||
 		    READ_ONCE(spi_imx->target_aborted)) {
 			dev_dbg(spi_imx->dev, "I/O Error in DMA RX interrupted\n");
-			dmaengine_terminate_all(controller->dma_rx);
+			dmaengine_terminate_sync(controller->dma_rx);
 			return -EINTR;
 		}
 
@@ -1818,9 +1818,9 @@ static int spi_imx_dma_submit(struct spi_imx_data *spi_imx,
 	return 0;
 
 dmaengine_terminate_tx:
-	dmaengine_terminate_all(controller->dma_tx);
+	dmaengine_terminate_sync(controller->dma_tx);
 dmaengine_terminate_rx:
-	dmaengine_terminate_all(controller->dma_rx);
+	dmaengine_terminate_sync(controller->dma_rx);
 
 	return -EINVAL;
 }
-- 
2.43.0


