Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41630CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wce4tNWUEqmy3zx/t/UI+3vfZvOd9+aZ0wiSmODCESU=; b=Ojhq0UpNm7NZwQ2m2nQs+pTWc2
	P/1qK6xBKOSOf/ClNngdTrk0NXE9HCdJ+n6c0dkxr68eKCEGh9TWdzB7YxLFVsqWcar95kGNTcUD9
	xO7dEc7zXgcuS8Uje9yTrd4VioCo0aoKWFs/J0v26ZYaWpwnt2YZWW8hY+MxlQmi9mxGgq+SHDMeS
	XxalKr4tcj//POZrJZAMQ5K5MlhmCxaAFgqlIhZLBsHxHF/7ol0FtCPcxQtz1dfVaYANvvusgFLzD
	Z/xpsAMI65Iz56zeor8k6m73RC66hJDdUI9DYhY1/KVdGpnu+lpWUsCR9lZnvgjq66TXXt3SJGfiH
	EpIRISVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIok-0000000DNQP-29UP;
	Mon, 27 Oct 2025 08:43:06 +0000
Received: from mail-koreacentralazon11023120.outbound.protection.outlook.com ([40.107.44.120] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIoX-0000000DNBD-05kH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOi/CkJbPkWlQuKHdNoJhC6Kz1i9VpzdZ+KmAYEx9UvvDexeGl2Lc4L0wGvl1pWjgc7hAIOnHEVgsRfpflmjrAPRFada5UaScOWwaZQuCPkQNrQE9z9anCGW4nbTFV3Je4ZB8emZJVyv3A7ALqPcFgjj2licTvo+SpNc8DVA8yvxc5Tkz2EFSVpKSYq58DgV2auOz9iZDYogk4Ynl6MYd9XW1yPIlQ3U07P73wVDJzaHlGVVSYAh7Kl6sUVCy4iU4NIRoshIOHowLpUB0UxJH/CCX3a+g/jWqwtPXLsoyvKJnUVjyD+FvdjxEI35KOdn330bx6AfjvJAacP+cAYUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wce4tNWUEqmy3zx/t/UI+3vfZvOd9+aZ0wiSmODCESU=;
 b=MIeAJpal4L61Ym+bRPeNyHDhkUcT2veLEgBnzWcvXcGKjhDXY12rEf7VDHtW3LeE8jRqvEjrEMcaAX+MiQH8IaI9XXL8y0KhoVNQWMLJPMzSpxSKI9M8BmKutxNyVjd43JOU/I8AdnyGS2n/0NCant1f4k6CMhnX00KVic3HtlT51+zbm2W+zBrDy+KOleWToTCqnHhmKOOqmHcOiaQVp3L+T5WLLpPwix6moK44wEFqve818FIJXSimnrTBlIZgIIqJ5P1eC4dajBXy/ztZqitYdokHo1ja2J/TL3+iQg5LHdcASUjHeRrEKoqLm/0dbPfd4BBxwW2DpUGNAdGREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=amd.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0030.apcprd02.prod.outlook.com (2603:1096:4:195::17)
 by PUZPR06MB6248.apcprd06.prod.outlook.com (2603:1096:301:119::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:42:43 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::78) by SI2PR02CA0030.outlook.office365.com
 (2603:1096:4:195::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 08:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 08:42:43 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2FFDB40A5A13;
	Mon, 27 Oct 2025 16:42:41 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	michal.simek@amd.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v2 3/3] spi: spi-cadence: supports transmission with bits_per_word of 16 and 32
Date: Mon, 27 Oct 2025 16:42:39 +0800
Message-Id: <20251027084239.2610141-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027084239.2610141-1-jun.guo@cixtech.com>
References: <20251027084239.2610141-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|PUZPR06MB6248:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 713d70e3-f47c-47d2-b083-08de1534cbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wtE97W30gffDFkP/pjTygiUnREAMDUEua7h7DUEAoVxAnXVqrl0bbQyrF2yt?=
 =?us-ascii?Q?jc3KQ7oU0TROZWFHnb9J+BqVbf5Cn+muFSeYmkBEsF72y0Ir0EchbZzRuhRu?=
 =?us-ascii?Q?pY4wSZdlKhAdimxcB/f2jgrpxdl5m824VQ0L2LZzx8VztVxTpzvtMrOPQSXR?=
 =?us-ascii?Q?qEYzdVgqWNVTZ6DNVopk76xq0rMii3AzP9/diJgSqBkrWYsoO+aKSpeOA5XB?=
 =?us-ascii?Q?ACA2v1BURULDOt2eOkLbLqXkKyvJgaSgGxFn7DcN4opJD4ThiH3KuzsF+jmF?=
 =?us-ascii?Q?NGc1sLQnBR3AimAI1oW+wFKa2rokl22nZaiyw3Oe/Z0uxh9gimm0jp7Pmh/2?=
 =?us-ascii?Q?sX1usXY2wCOnG+mK9D1UxJNwbUoN0dQAS0//yt9Ee8QXCIlHXwu0RRBg9gdS?=
 =?us-ascii?Q?8NTFvY6WA48fh2lRx0evaBr4eHOLCIa0HfvsBW/gdlXgUmksAmYeifWAnZ+K?=
 =?us-ascii?Q?+e/Q3+BuWPdrZtjEfMICvmgxDEsvZBfxYyGJ3JlcbuiBNcpLqbWEbGL6WN+P?=
 =?us-ascii?Q?eS77VgvSuggFhg8Vo0tTXTh2ZDX7iZaV7ilF/PD1fJZ5pEov6mDhyDBr3hbq?=
 =?us-ascii?Q?f+bRrkYS9Q58dCNlf9C60O++AChZGX/IBhcv+Ghuutl+M/MNsX3FGhE76hkc?=
 =?us-ascii?Q?Qp9EJ4YjlNq93c0d/PEAQ+aJEhFXRULcOzMUYDjyb8CGuRuB0U3+Jdz66SFC?=
 =?us-ascii?Q?wj5G1qUENyyx8suYHAU04yL8ri+KtN48uSKmu8iWt9hYcK9bhAYIk0P/Bszg?=
 =?us-ascii?Q?QgshmJmrCZnP7sN1bWGYUBFrbw0ot9c4Cw/uvd6SX7pR7PXgIR42sNRfJZJw?=
 =?us-ascii?Q?0KHN1ges8ydN1R7mEmcsHf+K0JupyuLQ1GlJkLZYhZSfqWi3K1d0n0hQclod?=
 =?us-ascii?Q?SptXYRisDdXHac4IpcVzXjtX4qKUfq9OlJEuszhnETzz95Z/x+jxifRr4bQa?=
 =?us-ascii?Q?GrcO4Omw3XzyKEGX3UMsSvO9MhrCNpYKY8EG1N4LWMBN5WjTSH9rhpmiJctE?=
 =?us-ascii?Q?eVtEfNIK+p/C+v5bLNpzDl8aQaY0xKsFHDmFoWS9BET/dj4Cfx5wSdzXhUBX?=
 =?us-ascii?Q?aLlkW/WCvKZcNK5KxswBfJG/nLkrQltsxqudqUmjmQRyrfvnQ/3dz8mdV2jp?=
 =?us-ascii?Q?dBYXlZnOgPv2Mmo2odaLLWDUCUkV55P+Dln7O0gTJxjy8mddQGKuNHTC6pUS?=
 =?us-ascii?Q?Ck622U933sBkrpWW9/yYAjs6iBrvPyiFEkZTUC1GPxR8/j64YWeEluzJScVT?=
 =?us-ascii?Q?p7ddq4LsJzFOVBm2otQ48gtyjZMoPCbovcUUD/jEMOTBt6EKOhK07TvaCOCa?=
 =?us-ascii?Q?eqTpmcuwAPYTaZ6OHnXDioTH/2stS7Q94SYu1z4cnFlgok5WaCvwVuTM7MnZ?=
 =?us-ascii?Q?Pai5tAp2RXzr/7JpLZtkYlnHj/Jv3rwBKFdl2MZhZAYMgMudFi+Zk1ckiMX1?=
 =?us-ascii?Q?phGmIwM1OXmHJ9Q34NlW66HOGEbcsxGU+fT0EEnOefuhbUpFUD/0m9Fd21Vo?=
 =?us-ascii?Q?03MoPPCsATspEPX32bIhUJSTxRtPf6hHwSB9lptFjFNyOMFky2cWU9Fe6fWk?=
 =?us-ascii?Q?1Dg5NFbmNGK/HBybmtc=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:42:43.1999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 713d70e3-f47c-47d2-b083-08de1534cbbc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014253_126388_4CF5CC44 
X-CRM114-Status: GOOD (  18.64  )
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

The default FIFO data width of the Cadence SPI IP is 8 bits, but
the hardware supports configurations of 16 bits and 32 bits.
This patch enhances the driver to support communication with both
16-bits and 32-bits FIFO data widths.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 drivers/spi/spi-cadence.c | 106 +++++++++++++++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index 5ae09b21d23a..47054da630d0 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -109,6 +109,7 @@
  * @rxbuf:		Pointer to the RX buffer
  * @tx_bytes:		Number of bytes left to transfer
  * @rx_bytes:		Number of bytes requested
+ * @n_bytes:		Number of bytes per word
  * @dev_busy:		Device busy flag
  * @is_decoded_cs:	Flag for decoder property set or not
  * @tx_fifo_depth:	Depth of the TX FIFO
@@ -120,16 +121,24 @@ struct cdns_spi {
 	struct clk *pclk;
 	unsigned int clk_rate;
 	u32 speed_hz;
-	const u8 *txbuf;
-	u8 *rxbuf;
+	const void *txbuf;
+	void *rxbuf;
 	int tx_bytes;
 	int rx_bytes;
+	u8 n_bytes;
 	u8 dev_busy;
 	u32 is_decoded_cs;
 	unsigned int tx_fifo_depth;
 	struct reset_control *rstc;
 };
 
+enum cdns_spi_frame_n_bytes {
+	CDNS_SPI_N_BYTES_NULL = 0,
+	CDNS_SPI_N_BYTES_U8 = 1,
+	CDNS_SPI_N_BYTES_U16 = 2,
+	CDNS_SPI_N_BYTES_U32 = 4
+};
+
 /* Macros for the SPI controller read/write */
 static inline u32 cdns_spi_read(struct cdns_spi *xspi, u32 offset)
 {
@@ -305,6 +314,78 @@ static int cdns_spi_setup_transfer(struct spi_device *spi,
 	return 0;
 }
 
+static u8 cdns_spi_n_bytes(struct spi_transfer *transfer)
+{
+	if (transfer->bits_per_word <= 8)
+		return CDNS_SPI_N_BYTES_U8;
+	else if (transfer->bits_per_word <= 16)
+		return CDNS_SPI_N_BYTES_U16;
+	else
+		return CDNS_SPI_N_BYTES_U32;
+}
+
+static inline void cdns_spi_reader(struct cdns_spi *xspi)
+{
+	u32 rxw = 0;
+
+	if (xspi->rxbuf && !IS_ALIGNED((uintptr_t)xspi->rxbuf, xspi->n_bytes)) {
+		pr_err("%s: rxbuf address is not aligned for %d bytes\n",
+		       __func__, xspi->n_bytes);
+		return;
+	}
+
+	rxw = cdns_spi_read(xspi, CDNS_SPI_RXD);
+	if (xspi->rxbuf) {
+		switch (xspi->n_bytes) {
+		case CDNS_SPI_N_BYTES_U8:
+			*(u8 *)xspi->rxbuf = rxw;
+			break;
+		case CDNS_SPI_N_BYTES_U16:
+			*(u16 *)xspi->rxbuf = rxw;
+			break;
+		case CDNS_SPI_N_BYTES_U32:
+			*(u32 *)xspi->rxbuf = rxw;
+			break;
+		default:
+			pr_err("%s invalid n_bytes %d\n", __func__,
+			       xspi->n_bytes);
+			return;
+		}
+		xspi->rxbuf = (u8 *)xspi->rxbuf + xspi->n_bytes;
+	}
+}
+
+static inline void cdns_spi_writer(struct cdns_spi *xspi)
+{
+	u32 txw = 0;
+
+	if (xspi->txbuf && !IS_ALIGNED((uintptr_t)xspi->txbuf, xspi->n_bytes)) {
+		pr_err("%s: txbuf address is not aligned for %d bytes\n",
+		       __func__, xspi->n_bytes);
+		return;
+	}
+
+	if (xspi->txbuf) {
+		switch (xspi->n_bytes) {
+		case CDNS_SPI_N_BYTES_U8:
+			txw = *(u8 *)xspi->txbuf;
+			break;
+		case CDNS_SPI_N_BYTES_U16:
+			txw = *(u16 *)xspi->txbuf;
+			break;
+		case CDNS_SPI_N_BYTES_U32:
+			txw = *(u32 *)xspi->txbuf;
+			break;
+		default:
+			pr_err("%s invalid n_bytes %d\n", __func__,
+			       xspi->n_bytes);
+			return;
+		}
+		cdns_spi_write(xspi, CDNS_SPI_TXD, txw);
+		xspi->txbuf = (u8 *)xspi->txbuf + xspi->n_bytes;
+	}
+}
+
 /**
  * cdns_spi_process_fifo - Fills the TX FIFO, and drain the RX FIFO
  * @xspi:	Pointer to the cdns_spi structure
@@ -321,23 +402,14 @@ static void cdns_spi_process_fifo(struct cdns_spi *xspi, int ntx, int nrx)
 
 	while (ntx || nrx) {
 		if (nrx) {
-			u8 data = cdns_spi_read(xspi, CDNS_SPI_RXD);
-
-			if (xspi->rxbuf)
-				*xspi->rxbuf++ = data;
-
+			cdns_spi_reader(xspi);
 			nrx--;
 		}
 
 		if (ntx) {
-			if (xspi->txbuf)
-				cdns_spi_write(xspi, CDNS_SPI_TXD, *xspi->txbuf++);
-			else
-				cdns_spi_write(xspi, CDNS_SPI_TXD, 0);
-
+			cdns_spi_writer(xspi);
 			ntx--;
 		}
-
 	}
 }
 
@@ -454,6 +526,10 @@ static int cdns_transfer_one(struct spi_controller *ctlr,
 	if (cdns_spi_read(xspi, CDNS_SPI_ISR) & CDNS_SPI_IXR_TXFULL)
 		udelay(10);
 
+	xspi->n_bytes = cdns_spi_n_bytes(transfer);
+	xspi->tx_bytes = DIV_ROUND_UP(xspi->tx_bytes, xspi->n_bytes);
+	xspi->rx_bytes = DIV_ROUND_UP(xspi->rx_bytes, xspi->n_bytes);
+
 	cdns_spi_process_fifo(xspi, xspi->tx_fifo_depth, 0);
 
 	cdns_spi_write(xspi, CDNS_SPI_IER, CDNS_SPI_IXR_DEFAULT);
@@ -654,6 +730,9 @@ static int cdns_spi_probe(struct platform_device *pdev)
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "cix,sky1-spi-r1p6"))
+		ctlr->bits_per_word_mask |= SPI_BPW_MASK(16) | SPI_BPW_MASK(32);
+
 	if (!spi_controller_is_target(ctlr)) {
 		ctlr->mode_bits |=  SPI_CS_HIGH;
 		ctlr->set_cs = cdns_spi_chipselect;
@@ -797,6 +876,7 @@ static const struct dev_pm_ops cdns_spi_dev_pm_ops = {
 
 static const struct of_device_id cdns_spi_of_match[] = {
 	{ .compatible = "xlnx,zynq-spi-r1p6" },
+	{ .compatible = "cix,sky1-spi-r1p6" },
 	{ .compatible = "cdns,spi-r1p6" },
 	{ /* end of table */ }
 };
-- 
2.34.1


