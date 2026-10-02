Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D148BCA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGCDr1Sue0EJUWDzOAHX/PGZEHcGGudMz68KGzp09tY=; b=itjKYIB4HzKexL9dWhD/+JyYxE
	J1+vgFyx4c4jVUOjq+q9IeWXp3g9QqtRGNBXoZZ7sxWEnjjt2myGK86LDPlWsjXpc1bfnc2T01LWn
	6a/HooxBDnHnsO0jNffi4VhkLtGmeIFoJ3cOgAcyVmwdeAyuGaO+NQaogEUkV5xJ2hxhZFbc003Lv
	LoPm93U5HAJTIAlB2P/L8LG/as0NthGDv6xnUMOFOySN2kT2PhU+xWCq/CnwYdRpeJpkg+qOifQUy
	PnoZHyEj4RNErXh14Hesn7VVJT/lo8NylsxO7x7GinzWkVxlGn0QF8uM0Hc1Oz7w1u8S1wQtT+rBj
	GkUlQ4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCitp-0000000COTp-2oVF;
	Fri, 02 Oct 2026 19:26:29 +0000
Received: from mail-westeuropeazon11013016.outbound.protection.outlook.com ([52.101.72.16] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCitn-0000000COTP-3mcD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:26:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YBSKyPI7VQL54FOApDEENt4FKzdFGO6VLANUKMhqfDfYQP4ZX35ugdqNCrvRtak3YeRa6GBD9k29/NSxSbE6hVtdD19N4L0kCowedMbwga+qr3NRxybv+Ab/a9BCoEPgftvrDDHP2WGrh0uKYfkITNh/8LNJM1hy/S1c4hpF3Rkc7kmooXqYuU9BW9j90K8LoVDrjHP6G0I4t04H2WLxc+xwsbYqZe+G54oryBWKq7eV7ZPzZj0bAJcYYUm1I2GUbnHuZPbOIjHTDUx1/A9Ww2raxmP9OVYSeGEvcprIqKZH+Seujbmqx0mRf0qV6qiUBiw4rovtmU8XZnf+6LMoxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGCDr1Sue0EJUWDzOAHX/PGZEHcGGudMz68KGzp09tY=;
 b=weSGLXT31glbBSFJdrraqwG3moBWFK13sSDhYuLxXqpr4PifCjEoSlZqiXwkChCCUCA9ZZyhfcLhVuNxUx5ZFp9zdKloYOUz0uTIUcaSfGydRGaS+8d8JuHWK74Q5DBOkSMQeFLus93mKRfXAo3h4i6xHZQMFJZ2TK4u/QjDc3fs+bBYu7hdeOzAK+pOrriD6b/ojx5a857ddmjf6CewuLD3zzlzZJPHrtIv6pVQ4TLG8Sd2yp7mnOgLGiUSGsDePF/RkL1KNRm7JaYvgts4IJJ8f0Fb3XVzb8ju5V10laDHIBr6qmZhvlbZcAZrRo4gxOIZly/WXHUSsu/EszQxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGCDr1Sue0EJUWDzOAHX/PGZEHcGGudMz68KGzp09tY=;
 b=eerRH1R5UVkvgbpFEoRK4I144y3TBfty+tJ0ZXJMp7Jus7/7IYNE1FqvO1RTxi1i+8iZsacUKTv7iuh+RpYGe9uprODNCIZ8iHNL1DkI3/znbRiiFtIyPGO5OUg8SP40xlb4C6IKwgtEEP03y26F62I2k6pXtpfcMOHBDO/fE23eO5+pRo4wmoDMdL+kVT4a+GptrIWF8TbCC2r3pFZ0NvlhSosxd9rXd5CSwHPBLqZ2J/sHWGMK/qU/3HjY2TGq9pZhPm40yKpiv9j89dYOuJKHsmGFsbItjfqZ7ipru33Q55Jg7Tu2ZTY/zUkVksCy1WbUTwL7hZ7hxP6RRqwA/Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB056237.eurprd04.prod.outlook.com (2603:10a6:290:d1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 19:26:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 19:26:22 +0000
From: Frank.Li@oss.nxp.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: vkoul@kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] spi: use dmaengine_submit() instead of ->tx_submit()
Date: Fri,  2 Oct 2026 15:26:14 -0400
Message-ID: <20261002192616.161440-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB056237:EE_
X-MS-Office365-Filtering-Correlation-Id: e898e522-160c-4e34-21df-08df20bb0ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|23010399003|366016|6133799003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 2vkoy88YeN1iz6TeSJmWi6jowhq9ZmnSJJiWPjYcBPWJugZnZ+cztKqPJeAZtyrcguO8u2ogzoZWPyQab9qeWUw/rmBxravWPk4HSqtdY51HWDTpn1JmJjVOyl84QAQXoqit0bdkGfngZEeHs6isf+m2fATCUHmvxAMqhCZqK3tNt5R3L3eORaXzQitztuXxbq8q/UiblRWuOqNEcNgSiqgcrk95mLf94zHEXiom0lxuGKqi9kbfVPRRnxKrfa/YDObt+R3pbCz6waxcWlLMV4sYNKMkLWsyfHTbkwVg6//hkSwiXkn2eleOkcoyAO5U/SZ4+V0dyjxxGRIHNHssHFRtRgBJp+vDHVyIHABVFeKPbLCKFSqcbsMMj28npC+p7Ouo8ioywL/76+9uT4GbwNrrF1wJ1BN6dJhgFkCbpDvN+TohfXdZEISFoa81gi5p/xOlJqKjrqzqTLAOFSeGrCu5vnuYUvk8E2iR3mKVVkkWXkGtRwW7UdXcDEOfE19R3YOgkcnCOVQBpB1cHqHIMQu5YynowjDEB0qZzcjd+n1NT5dW0gXC0y9l9SrtktTc442pWex0hBr8KvLcdzGI8dfPtsx0pv18Cu3+Ecpny2cvN9FkXExkW63y/rqifP8etZgfKQpivh7rb75AFLjY4Ci09QwBjkz0aJJQ/o4QqRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sktk/eFdKXq2C8Q6JnbgpksgEzTmHh79yWMwVfIk1CHspcwugjvYk+c8d2VB?=
 =?us-ascii?Q?+TppOyiA8CSBjUkNAx0W+FjRhlnZn/z6/477LYg3JoR86cjHhuyGEKS89isB?=
 =?us-ascii?Q?QXMq4ypRRm0adBMfCwDZw/1+Amg59LlClr9veXC65cbwywT+8jbhi5XS7TvJ?=
 =?us-ascii?Q?VC+dPka2qaLiobwriJqymxnKqLmFHj8EZgewFMRhXgiEVRuMUih3f9B7sa+U?=
 =?us-ascii?Q?+/8EEHNdnos/xOLj86wFSF+pypLIlGabJePPAL6YARFl4et0aqpwP+vgAyJb?=
 =?us-ascii?Q?A8ZHJiaFKQpL2o+TDHq3M4nLYgR1WZNMuQCe2Ahkmn+2iQoMdRXajOZrZVQ+?=
 =?us-ascii?Q?RGwgOFV15Q7TIdVkTtKmyv9RqsPgNNjMteRGg8AQo3X7C8N2BlyPsq5Mk3sx?=
 =?us-ascii?Q?B4d6aJC6Pyy7wsZB4MKlTkVwAKD5uR0q002qARx1p2jhkPg8TYRLuttmMPGe?=
 =?us-ascii?Q?JM5jg9pGlkywapA86hYLy5SpJLrfuxXvJJjwmwL9MMr+q/dNJZLN8uin1UXp?=
 =?us-ascii?Q?TfzJ4+Teh23YGdk29/pL1oYwbDV/nNgYRlbxbdL4Zo4dILrqiNBXihv3+9RP?=
 =?us-ascii?Q?cgOQeI+uCSOqVa391PzXTcOh77Y0JTP/iRJ32rLvfCNOWN/aAFWqfkx2Lx1+?=
 =?us-ascii?Q?Hx3pjpmALmjCuNGqREjpc+qkFyPBSM1Amg0SvsQl+qg1gUQyPI1af2W8+dB/?=
 =?us-ascii?Q?bUHSnZ1JmVlB1RHM2Mvs9zwovWh0kiOIK8ivZFEYqUBFoUKLt8rV7SjFotLT?=
 =?us-ascii?Q?tJZ9/4OxvruWvhrEaQSPfpG7qr/TtXIROzqOcAYYutfpDJOH7iJ92OSMWdNY?=
 =?us-ascii?Q?G+5eIY89yIuDKD4qJeCY4WNgQdGRqFuaCHgaQ+pAMWAR3duM7YEhP8MRm/3U?=
 =?us-ascii?Q?lfc9ZDWHZFCNAjZudn70vP/MKQUGFkBxULA2ABY0Rjb9uJ+IZXvwNR0cIGXr?=
 =?us-ascii?Q?ZV8hPrFgdM2SafR50SeZTEx3NAU1Ocw2m5RAHvawQCINY+PJFi+mz4rHc1RB?=
 =?us-ascii?Q?jevvRgOXyiSAOqMVCu7Ej1uaXlPolall1um5mM4n51nBTYQPPMVnBiKvcoGm?=
 =?us-ascii?Q?9wgK0dZlehn7W8dAcnQhNjfN29l96wIdAe8tZBTDvhlGq7xSSGFNHHGBTQNY?=
 =?us-ascii?Q?OFjkPAMc04xliyYywEbKyML29eiSb0iUKBhwqU+PyssBrmvcJLQaN1LUWG7W?=
 =?us-ascii?Q?m6MQlvBsjBF1m72F+7S2mjY+ENriGPd/4Oa/yjKNpxYg6QxgdxqGdJfRs9CK?=
 =?us-ascii?Q?XjALxmzseO2P++ZLHq/6GwxW2Yfjz/z+n9i2616CYA3nySaCPxORRWLIuc/O?=
 =?us-ascii?Q?0QIf6rQDxjWahVEl30hE5xG+Xf4cZw5XNlqIswTviktsexK5so9UbK8ej6dT?=
 =?us-ascii?Q?3gVTP/vZvSOzvoYKiNhBar3sZRQigLjKRrzrYOcmU4mG4Dw5jQ8yuVe08Se4?=
 =?us-ascii?Q?VENHYzYpuT9igcuYuhdMl9+RxL2lf+NGVLf52raeKyvlqWWKuMsDO3cBcwxl?=
 =?us-ascii?Q?ngwof960Sur1RojjQyziJ0LSlLbmSEo3o2JsuqV6OH899/i+SXGJ0v+m0FUm?=
 =?us-ascii?Q?ADJ4XNzUR3uD9ywqdGs6s5lyPQah4pqN0umFeAaHB1JNIei/7wszU4FIuxBn?=
 =?us-ascii?Q?kxLxhw5sQQ5pFw9gwH1OHQsh1q9aO1XM57OqFqNCnBAIg6pn2cGZUB6PPFx7?=
 =?us-ascii?Q?LOsn8K1H6Z1qCgkIyneuUcQifPWdqCXKL7l96AkWzzr8mE+/c7IocyU/qif5?=
 =?us-ascii?Q?6OQxHamstub7yR9Umh55e21+nqteBbrlZgj1HzT95SrFH903DCwa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e898e522-160c-4e34-21df-08df20bb0ada
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 19:26:22.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbFLeFf8WY4XSwCBQI7SRYdKCD7k1TCyT6XaVM1otwWCAb1vBNfis2/sJbDjevLWN4CDvkb8p/ySI+aalMyrWxoH9iZXt5ZWITMjYTAu0YiPcwTpa7BTxk1coK0F9QHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB056237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_122627_969092_A76E27B2 
X-CRM114-Status: GOOD (  11.77  )
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

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_async_tx_descriptor->tx_submit() calls with the
proper dmaengine_submit() API wrapper.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/spi/atmel-quadspi.c       | 2 +-
 drivers/spi/spi-at91-usart.c      | 4 ++--
 drivers/spi/spi-atmel.c           | 4 ++--
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 drivers/spi/spi-ti-qspi.c         | 2 +-
 drivers/spi/spi-topcliff-pch.c    | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index ec19fa0180f00..3acb139e4db13 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -792,7 +792,7 @@ static int atmel_qspi_dma_xfer(struct atmel_qspi *aq, struct dma_chan *chan,
 	reinit_completion(&aq->dma_completion);
 	tx->callback = atmel_qspi_dma_callback;
 	tx->callback_param = aq;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 	ret = dma_submit_error(cookie);
 	if (ret) {
 		dev_err(&aq->pdev->dev, "dma_submit_error %d\n", cookie);
diff --git a/drivers/spi/spi-at91-usart.c b/drivers/spi/spi-at91-usart.c
index cdc771350db93..aadcdf734fb03 100644
--- a/drivers/spi/spi-at91-usart.c
+++ b/drivers/spi/spi-at91-usart.c
@@ -231,11 +231,11 @@ static int at91_usart_spi_dma_transfer(struct spi_controller *ctlr,
 	rxdesc->callback = dma_callback;
 	rxdesc->callback_param = ctlr;
 
-	cookie = rxdesc->tx_submit(rxdesc);
+	cookie = dmaengine_submit(rxdesc);
 	if (dma_submit_error(cookie))
 		goto at91_usart_spi_err_dma;
 
-	cookie = txdesc->tx_submit(txdesc);
+	cookie = dmaengine_submit(txdesc);
 	if (dma_submit_error(cookie))
 		goto at91_usart_spi_err_dma;
 
diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index af1f0ad16be67..ffc896e4621ac 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -871,10 +871,10 @@ static int atmel_spi_next_xfer_dma_submit(struct spi_controller *host,
 	rxdesc->callback_param = host;
 
 	/* Submit and fire RX and TX with TX last so we're ready to read! */
-	cookie = rxdesc->tx_submit(rxdesc);
+	cookie = dmaengine_submit(rxdesc);
 	if (dma_submit_error(cookie))
 		goto err_dma;
-	cookie = txdesc->tx_submit(txdesc);
+	cookie = dmaengine_submit(txdesc);
 	if (dma_submit_error(cookie))
 		goto err_dma;
 	dma_async_issue_pending(rxchan);
diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index fe5b094f0b6b3..709aea0f237fc 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1398,7 +1398,7 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
 
 	tx->callback = cqspi_rx_dma_callback;
 	tx->callback_param = cqspi;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 	reinit_completion(&cqspi->rx_dma_complete);
 
 	ret = dma_submit_error(cookie);
diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index fb0d940883fb9..091a8b8842f58 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -454,7 +454,7 @@ static int ti_qspi_dma_xfer(struct ti_qspi *qspi, dma_addr_t dma_dst,
 
 	tx->callback = ti_qspi_dma_callback;
 	tx->callback_param = qspi;
-	cookie = tx->tx_submit(tx);
+	cookie = dmaengine_submit(tx);
 	reinit_completion(&qspi->transfer_complete);
 
 	ret = dma_submit_error(cookie);
diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
index 0da1b986d3ee1..117eb83ce1990 100644
--- a/drivers/spi/spi-topcliff-pch.c
+++ b/drivers/spi/spi-topcliff-pch.c
@@ -1092,8 +1092,8 @@ static void pch_spi_handle_dma(struct pch_spi_data *data, int *bpw)
 
 	spin_lock_irqsave(&data->lock, flags);
 	pch_spi_writereg(data->host, PCH_SSNXCR, SSN_LOW);
-	desc_rx->tx_submit(desc_rx);
-	desc_tx->tx_submit(desc_tx);
+	dmaengine_submit(desc_rx);
+	dmaengine_submit(desc_tx);
 	spin_unlock_irqrestore(&data->lock, flags);
 
 	/* reset transfer complete flag */
-- 
2.43.0


