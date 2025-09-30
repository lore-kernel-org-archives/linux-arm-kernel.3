Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EC9CCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 07:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPtOHdPz39jibNtNDLKr8zABSwnOOS6z/GY7ndMNixc=; b=apkuHg3sP56jINGXz/R6PTF6lI
	DdXLZEyhDFV9bFPpsPAGkAYPbRDl4RIgL8FCbXHhVmAe62LM1+En5n5YgXeKqsz4MBfk6cI4Nwxlk
	pg7dYInrRfBlMhM28hUzIfvahTHjQXKHZwW4+h50ydz88jJ3M+7rPJb9jgSPaHeW4CUAtzjXlY74i
	+SqFyODomyCpewn4s8eLCMrcOOL99XAETP4q+9ivbO280jNUL/mLglhlpqZSjIVMsXHjXeyRk6exs
	sJQf8iGhwtwjCk7dy4K55AXgDVZp2SJ+20Mhs6NBMUtA+3YoV5Wy2KDYwD9NwPaOpScSMoxEcbLs+
	a0wr4x8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VEI-00000004YmV-1VBV;
	Tue, 30 Sep 2025 07:56:58 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VEF-00000004Yjv-1tb2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 07:56:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS9MQUQ17LI+4kzGjCSKe1AtA/OFOWSKx8BxhPTbZHKE0PWfrlfxviAVMEpAApI0ELo79X6gg6sW8XHkJRmKR3lS2YLnZqBVFw3cUYnxxFy3l0OqWHpGf5dr2b8cdFk+CUrUxTp3mJWSybN+WyZq/4nPDuvH/5oXa6TSzaVJ19SlBOxaZLS0EIeLCxpUmjd2x0NMntap3NX4RsD66uYC0h0SGeaXDK0sJRAUd7ejKKNafzvdELoGja764o/KaEAjGEvYwqcGzpdmS/PyhIRp+XB7FxpRC5Vtw/jpuEBat9DbuM5QUYbeJdmQAY1fkBRpJgx9mrEHdiaGePRkAZfgVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPtOHdPz39jibNtNDLKr8zABSwnOOS6z/GY7ndMNixc=;
 b=RztxhsKdvhSpj/VIQGY2bXHDlxxx3n6/Jf9xxW/f0/RORX81OAiY5dfxFaVrm6mPgpfCzC0LuDwWmUz7hHDgGJEOqhHNkuN4pHkd6s1i9b+/sCcKAb+Rg+vK4xI5S/+7HZR/0MeXKcLht7jotHtgYwN+iw8G3WRjmmC/haWhh2UsS7ijlOul6Sb1RooKmU93jS96NIensZg5WtDgm83P5zqdb8AxgF1z39/q0i1IuELs5DMwA/7QdxrvUsuApXjlvpjwP1PrbRIMGmRNXMdp2R4a8doVlE0IAS8NQJHha8GAQ4M4aa43WeODkZHZ5e0IBOcOiZ2bBcOaNqSfbrdOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=amd.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0090.apcprd02.prod.outlook.com (2603:1096:300:5c::30)
 by TYSPR06MB7260.apcprd06.prod.outlook.com (2603:1096:405:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Tue, 30 Sep
 2025 07:56:47 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:300:5c:cafe::1f) by PS2PR02CA0090.outlook.office365.com
 (2603:1096:300:5c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Tue,
 30 Sep 2025 07:56:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 07:56:46 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4D79C4115DE4;
	Tue, 30 Sep 2025 15:56:45 +0800 (CST)
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
Subject: [PATCH 2/3] spi: spi-cadence: supports transmission with bits_per_word of 16 and 32
Date: Tue, 30 Sep 2025 15:56:43 +0800
Message-Id: <20250930075644.1665970-3-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930075644.1665970-1-jun.guo@cixtech.com>
References: <20250930075644.1665970-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TYSPR06MB7260:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46eed311-b537-4646-6402-08ddfff6e77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?16jOfJRhVVtCOap3Q5OmeULsc76lj52PSsF1kNIcOWPiW749MkUj+cCPnY2r?=
 =?us-ascii?Q?2LvI7mQtgtVMh/InxjizKYpgdCc0XKWyJ5wmbFOH7sk/EBRsNp12DunVj55V?=
 =?us-ascii?Q?C4QgMkQMd5muGu9xmsptc/LVwLuDXeTuViBcazXSxcYksJEoiam1dFCAyLgw?=
 =?us-ascii?Q?pNRgezRjL2ZPD1yz6WO9/jiFhSPxoQsDbJdExPrqsxl7H0eDwIZ8eRwEAb+p?=
 =?us-ascii?Q?1wYunF1oYDM/gTojE9i2MW8MOhoMLdTBHXH6wSrJOjVtGjnNlmcho7FZO4Fy?=
 =?us-ascii?Q?0bD0P135WkM2NjY61a1fW7cnV99nTjOrOF9Nke1c6dBXxsxJcf2kS2GU6LpV?=
 =?us-ascii?Q?gTU7tSVO5IlW0LhRoW9MPcfO8T6ChQUUo+MlvqKWelYyQ5jTJ+wQnB4HRC8t?=
 =?us-ascii?Q?/ZCGK9M+9zhYTgqCvGlXr48AAZIE5jkiA/opzs1iZZwsOq/g55MHNmIFH7MA?=
 =?us-ascii?Q?CyGz8DIRQW8POhIcQUhCyi6qDa2/L0sMxSkMP5ZqW+ZfF8fi9nbjAzP4KnOz?=
 =?us-ascii?Q?3CvHmJQipiiHDpUDam3vReFhCceEQH4HfziVGAVec4QWagmcIkRM3QJEGRfj?=
 =?us-ascii?Q?2ik2tIKOy+qELK7zouDdROj9TifPzp1bPx2NtD2MK9LCBuVlnF0fnNIjPY8/?=
 =?us-ascii?Q?VGhd84q0CNtaWQhuF6aZGGuvOMk4J0DgZRL2YzdWa7nNLbaYjJ5lnyXDMys+?=
 =?us-ascii?Q?mf3TXOnheF+h2FvaTycjfJY4PCdWfimlECEu3SxXKecVdHvPGecg9M0ZT2Uu?=
 =?us-ascii?Q?Jc2fcqs2PmCfoM2/gNTB5Q6d8XKZevOd0oQdhN2725CULUOYNKsuUU0pbf5b?=
 =?us-ascii?Q?3n+P1HAStA9NBzSAs24sBzLNl8cjcQ2s8W8tJJ3MFBVMLKu2Wghd9cxGnPXv?=
 =?us-ascii?Q?PG1S+Kmrl6aPzdqAMlLSYw+ZjWsGUSKN+kDjtRu0c8EC+3nnmmIy+oc0Dy1I?=
 =?us-ascii?Q?8AH0B7DAoeLjaOU5Z8x78I5q0vB7Tz8psOfuyoG8xWaFNp8VJSEy9v7yCZZD?=
 =?us-ascii?Q?LDj8kK2B5qMmvNxdViq+ujdR8SHoROvhLKumLnMEvBbasAKpmwqnAajoFQbz?=
 =?us-ascii?Q?g67ffEHbHa4uN2bdKRF0LM50k8DJYxbSJZS0yZl7CIKfa3KhH198TCg0jiBL?=
 =?us-ascii?Q?SdZnvCcYFhZ2meuOU/6B+PUyTJuxFFI25ZX99Dr8/BPRBtIJX2DN7pYyM1dZ?=
 =?us-ascii?Q?QV1al2JJPfMsZRe20pVISxhJVaLbBZ87C8PoYS1ptgZJISLN2kwuej3MD0af?=
 =?us-ascii?Q?LAKqJpb2uBmhcoW7yDctn2kwK6GGMoV+AOku+YxAYRQSnkM8SMq8P1FPpQio?=
 =?us-ascii?Q?wnupj2sb0wH1dPDFU/sycSW1w1Ivfl90ydROc/5qhcze9gu53q/IWCkgC9Ur?=
 =?us-ascii?Q?OCI4UdQiUw+ofwdz2XqlimEl9hwk+PG56dHjGvtC1518s9T6lTsLJMCa9lyf?=
 =?us-ascii?Q?H9cVtGugskS51rmDd8W2Y6wYcD/+v4IsCppnU3zvQ8ZWIsyl3sdaoebB2A7b?=
 =?us-ascii?Q?AWUTesKLl+WawyyJpqLcHk9puR+wTndo2U4cVh9hKZOXfyvoqMZEH2yNjE1J?=
 =?us-ascii?Q?+CTiwNF49uY17Y38NHY=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 07:56:46.4924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46eed311-b537-4646-6402-08ddfff6e77f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_005655_510708_E735B967 
X-CRM114-Status: GOOD (  18.42  )
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

The Cadence IP supports configurable FIFO data widths of 16 bits or
32 bits during integration. The default FIFO data width is 8 bits.
If the chip design modifies the FIFO data width to 16 bits or 32 bits,
the fifo-width property can be configured in the firmware (DT/ACPI)
to enable the driver to support data transfers at the corresponding width.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 drivers/spi/spi-cadence.c | 125 ++++++++++++++++++++++++++++++++++----
 1 file changed, 112 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index 5ae09b21d23a..e91c6afbece9 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -109,9 +109,11 @@
  * @rxbuf:		Pointer to the RX buffer
  * @tx_bytes:		Number of bytes left to transfer
  * @rx_bytes:		Number of bytes requested
+ * @n_bytes:		Number of bytes per word
  * @dev_busy:		Device busy flag
  * @is_decoded_cs:	Flag for decoder property set or not
  * @tx_fifo_depth:	Depth of the TX FIFO
+ * @fifo_width:		Width of the FIFO
  * @rstc:		Optional reset control for SPI controller
  */
 struct cdns_spi {
@@ -120,16 +122,25 @@ struct cdns_spi {
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
+	unsigned int fifo_width;
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
@@ -305,6 +316,78 @@ static int cdns_spi_setup_transfer(struct spi_device *spi,
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
@@ -321,23 +404,14 @@ static void cdns_spi_process_fifo(struct cdns_spi *xspi, int ntx, int nrx)
 
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
 
@@ -454,6 +528,10 @@ static int cdns_transfer_one(struct spi_controller *ctlr,
 	if (cdns_spi_read(xspi, CDNS_SPI_ISR) & CDNS_SPI_IXR_TXFULL)
 		udelay(10);
 
+	xspi->n_bytes = cdns_spi_n_bytes(transfer);
+	xspi->tx_bytes = DIV_ROUND_UP(xspi->tx_bytes, xspi->n_bytes);
+	xspi->rx_bytes = DIV_ROUND_UP(xspi->rx_bytes, xspi->n_bytes);
+
 	cdns_spi_process_fifo(xspi, xspi->tx_fifo_depth, 0);
 
 	cdns_spi_write(xspi, CDNS_SPI_IER, CDNS_SPI_IXR_DEFAULT);
@@ -654,6 +732,27 @@ static int cdns_spi_probe(struct platform_device *pdev)
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 
+	if (!device_property_read_u32(&pdev->dev, "fifo-width",
+				      &xspi->fifo_width)) {
+		switch (xspi->fifo_width) {
+		case 8:
+			break;
+		case 16:
+			ctlr->bits_per_word_mask |= SPI_BPW_MASK(16);
+			break;
+		case 32:
+			ctlr->bits_per_word_mask |=
+				(SPI_BPW_MASK(16) | SPI_BPW_MASK(32));
+			break;
+		default:
+			dev_warn(
+				&pdev->dev,
+				"Unsupported FIFO width: %u. Using default bit-width mask.\n",
+				xspi->fifo_width);
+			break;
+		}
+	}
+
 	if (!spi_controller_is_target(ctlr)) {
 		ctlr->mode_bits |=  SPI_CS_HIGH;
 		ctlr->set_cs = cdns_spi_chipselect;
-- 
2.34.1


