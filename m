Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98EBCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8EDc8rZac4RsFY8nAVqxYalOxuPA5SriPQpdHsNWSs=; b=clM/DW8TzISed0DJ4o69qhKAxC
	U4G9U9HECyuXDhMXI1pHAEjQn2wuCwkwnH4cbMiXwfu58j0xTXabJ9rRhuNbBlK/Z0DbFEsaxPra7
	7YpmWuwl63h10vHgBVDuZsxeyxjmO1070t4oChj23jTPgdmJp9oBSnNe+pRKusePcdu87E/ysw48W
	lWyMOtllurnmdmjG8u5u8xTXJymtaJ3sWQ/3qdX2O/sjppvfS2YfD3OW5wwzU+8BtFmUjkEfNzQ4y
	4Q1r2cRhwDp6K7CbMk6Dv5VUhQdEfY34dgh2iK23WOfiB08Vbj4YjWzVS0/jvo5XQODSOIDcczrsg
	QBLOvzvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhfb-000000030eo-1D4i;
	Fri, 16 Oct 2026 13:08:23 +0000
Received: from mail-pj2-x06.google.com ([2607:f8b0:4864:39::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhfY-000000030eI-3k6s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:08:22 +0000
Received: by mail-pj2-x06.google.com with SMTP id 98e67ed59e1d1-3964e7720afso3405599a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792156099; x=1792760899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8EDc8rZac4RsFY8nAVqxYalOxuPA5SriPQpdHsNWSs=;
        b=CzWhZMPDjjyxfuru7prZ3NhT2Kny7oOEVhI0LcOyMfJWpEffSAit2TBb29dHGBT62B
         UCOEw3Buu8d9ul3s66OSfukiH+s3BXjx2xNTFtR5M7NwyQaywjOA8qh+CKk9p3CH53Wc
         TPiSupuRfvc9XChL7l6Ut10nzGZICofK4V8xyZstNyiolJ9d7WzuEUfH35s7JAaz5qkR
         cs8STbqXP8TZG3+jl2vmSd1FFwgdvQD/IZmZKGAXP+A6ZobSTQvMbVuYSRIhG1nqQmwL
         ZAn0thG/hNTXnxMLg6sx5cqucbzU4B/LSa7sMJTlyOBYFZwH72YUXmpynoH+r26jMEHL
         HI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156099; x=1792760899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8EDc8rZac4RsFY8nAVqxYalOxuPA5SriPQpdHsNWSs=;
        b=AwDGtAlXyaw2Nvu7hpcyVcYlm+5Iw79DVE2AZLiTq8Fe0sLxnxkSEE1MkKnSAYXuLu
         6kyYRtKPfBVqMnsbG75kEtAV/+7sgWz1oQZJgvHE1dqLb0nAo+y2sgJyxb9bBNDpmzV7
         RnGWJzoaOxD88d2rDyts6Re7Wvtoyah41F05/Vh9VarA/48KsOkhFFdbbj1ZvXjcwol5
         LDyPl9vOqtx/UQZTEw1XBHffV+kCm+RC7XNcX8GTQ0PIs3qAqHI2JRn5aXnH8KOXgGa0
         YFiO12wH6wuMXhn7v5MSfaz7lYnVwLPvRv0PUgNV4A8MTJiyrS/D4fqkAeYr/m5pj5O5
         gS9Q==
X-Gm-Message-State: AFq9FYJ/Qvf+cNl5t99uBUtGfN1nNQMyQ/hF4A28uc3qiI0kmMdGYJqW
	LEM5qkWRz6GU0NzFR7XcqBHPVnahRLCH/yYrSRVvCXs0fvuA5cNeU0K2
X-Gm-Gg: AYBFou2iqKzypIxrzBRKMgrrhdpecXbhLUgeAczldn4MKqB20YZZIazR0HnHWBLp1iK
	Mkne79fCJUbilPQ2a/X0M/zRgFB/ThhgHMGPUp35zpmz6mURsvpBqAhmwtiW+Wfppe+zr7WFVoM
	MlglyDNM7Ebd5V+gE/vsHq3t0e7OLKKyccCV0dIlUwDUlGgBV1wTURLroNXn3cWdsqktMpIbaJx
	aUxY/eapkebiXuEb10WaT3QSMq4h7O1dvop01Zcfz/r57hmWadtPD5xDpDz4kLI41Ct+pCIwBY6
	HrG4B3pGVKD1KhjwNNz8YP1Vgg2ZLJOgsAyHNU4jr7ATnWeDeO/VY52Tfinzkh7U85ZPeFnqVvN
	oKVn/uNlsKvs279sY26mK0tHbHg1f8X5A+KGNu1BpW46doVvzSaqv4AR0G3k1uxhn7f+ObC1Zpx
	Y8r0dhkS5iszkXcNez3afkdFiQJ4xtla4/VsDoBcDhe6nVOSrT8pWNXVodq3jlt29hBR8I3u0y2
	x4CkwIMkkasafNodHmS
X-Received: by 2002:a17:90b:258f:b0:3a6:dc51:cce9 with SMTP id 98e67ed59e1d1-3ab3a96634dmr18516390a91.57.1792156099489;
        Fri, 16 Oct 2026 06:08:19 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm4190467a91.4.2026.10.16.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:08:18 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] spi: zynq-qspi: fix address buffer corruption and support 4-byte address
Date: Fri, 16 Oct 2026 21:08:12 +0800
Message-ID: <20261016130812.282624-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_060820_935329_1A6F240B 
X-CRM114-Status: GOOD (  17.56  )
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

In zynq_qspi_exec_mem_op(), when transmitting address bytes, the driver
iterates over op->addr.nbytes and populates xqspi->txbuf[i]. However,
xqspi->txbuf is never re-assigned before populating the address, meaning
it still points to (u8 *)&op->cmd.opcode from the command phase.

This causes two severe issues:
1. Memory corruption: Writing into xqspi->txbuf writes past the opcode
   buffer on the stack (which was passed as const struct spi_mem_op *).
   If opcode is zero, xqspi->txbuf is uninitialized.
2. In zynq_qspi_supports_op(), operations with op->addr.nbytes > 3 are
   rejected. When paired with SPI NOR flashes larger than 16MB (such as
   Winbond W25Q256), spi_nor_spimem_check_read_pp_op() tests 4-byte address
   support, which fails and causes spi_nor_select_read() to drop all read
   capabilities, failing probe with -EINVAL (-22).

The Zynq-7000 QSPI controller hardware in manual I/O mode natively supports
transmitting 1 to 4 address bytes via its TXD FIFO registers
(ZYNQ_QSPI_TXD_00_00_OFFSET).

Fix this by introducing a local opaddr[4] buffer in zynq_qspi_exec_mem_op()
and explicitly setting xqspi->txbuf = opaddr before populating address
bytes. Also allow up to 4 address bytes in zynq_qspi_supports_op().

Fixes: 67dca5e580f1 ("spi: spi-mem: Add support for Zynq QSPI controller")
Cc: stable@vger.kernel.org
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index d762aaf45..bfcbcfe85 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -229,11 +229,10 @@ static bool zynq_qspi_supports_op(struct spi_mem *mem,
 		return false;
 
 	/*
-	 * The number of address bytes should be equal to or less than 3 bytes.
+	 * The number of address bytes should be equal to or less than 4 bytes.
 	 */
-	if (op->addr.nbytes > 3)
+	if (op->addr.nbytes > 4)
 		return false;
-
 	return true;
 }
 
@@ -526,6 +525,7 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->controller);
+	u8 opaddr[4] __aligned(4);
 	int err = 0, i;
 	u8 *tmpbuf;
 
@@ -547,12 +547,13 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 	}
 
 	if (op->addr.nbytes) {
-		for (i = 0; i < op->addr.nbytes; i++) {
-			xqspi->txbuf[i] = op->addr.val >>
+		for (i = 0; i < op->addr.nbytes; i++)
+			opaddr[i] = op->addr.val >>
 					(8 * (op->addr.nbytes - i - 1));
-		}
 
 		reinit_completion(&xqspi->data_completion);
+		xqspi->txbuf = opaddr;
+
 		xqspi->rxbuf = NULL;
 		xqspi->tx_bytes = op->addr.nbytes;
 		xqspi->rx_bytes = op->addr.nbytes;
-- 
2.56.0


