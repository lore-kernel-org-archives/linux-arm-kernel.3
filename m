Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24016C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpXv1zP1pu51TTfErAKypkJY3vjgrcKFdh3KjXTzhFA=; b=tmjnz/Esopul81r674znBiTspG
	FGdnWRoa2WxoxruKBPN+iSP2MUVvzuiz2h9+ww3jvH6mGGaxUzA0jfbtF31ioH5LX8MzK4nyXDqH8
	guoMRJEE4wgPbQVeVrrQcjmCQjl59sYWveI3h6qmXYzS4VrJp5g4aSpDELHW+TLq/NChG82TIflkW
	ppDqAHwI//F2KIfBwCqzWMXHIKIzKjKbe3gfFp5R2gsVLFufE9QbhwdJZmcBvY6a2chdlH0LQdWQY
	m9paJcWkAnxzDGxdV/bUkkieV6D7aseGAHk0cvjcVGx0xX9mNV2W1iPy5zlS1Jn4Nqwe/6LwsMOns
	LtGpCkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI7A-00000005ftR-49fo;
	Mon, 16 Jun 2025 22:15:40 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtL-00000005e8A-1PFD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:24 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UpXv1zP1pu51TTfErAKypkJY3vjgrcKFdh3KjXTzhFA=;
	b=udplqrxWmGeRFbpu6YjHOGUPktFGJtRBM5UfUSsLYVTGVZ2Yt7dK+XIYp7GzFbUKRk447d
	nJ8irijhPldc1awyPuB+LHl3oEr9g9aOSJn+LM0DavL274LLBCCTUpZfacG1+O0+A3TrFl
	NjLIvzJbMesvV/uqBA2M7Ka98jjmCHQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 6/9] spi: zynqmp-gqspi: Pass speed directly to config_op
Date: Mon, 16 Jun 2025 18:00:51 -0400
Message-Id: <20250616220054.3968946-7-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150123_515536_0D1F87C6 
X-CRM114-Status: GOOD (  11.22  )
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

In preparation for supporting transfer_one, which supplies the speed
from the spi_transfer instead of the spi_device, convert config_op to
take the speed directly.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v1)

 drivers/spi/spi-zynqmp-gqspi.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index add5eea12153..a17e77dc4e27 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -533,8 +533,8 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
 /**
  * zynqmp_qspi_config_op - Configure QSPI controller for specified
  *				transfer
- * @xqspi:	Pointer to the zynqmp_qspi structure
- * @op:		The memory operation to execute
+ * @xqspi: Pointer to the zynqmp_qspi structure
+ * @req_speed_hz: Requested frequency
  *
  * Sets the operational mode of QSPI controller for the next QSPI transfer and
  * sets the requested clock frequency.
@@ -551,13 +551,10 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
  *	by the QSPI controller the driver will set the highest or lowest
  *	frequency supported by controller.
  */
-static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi,
-				 const struct spi_mem_op *op)
+static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz)
 {
 	ulong clk_rate;
-	u32 config_reg, req_speed_hz, baud_rate_val = 0;
-
-	req_speed_hz = op->max_freq;
+	u32 config_reg, baud_rate_val = 0;
 
 	if (xqspi->speed_hz != req_speed_hz) {
 		xqspi->speed_hz = req_speed_hz;
@@ -1053,7 +1050,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 	u64 opaddr;
 
 	mutex_lock(&xqspi->op_lock);
-	zynqmp_qspi_config_op(xqspi, op);
+	zynqmp_qspi_config_op(xqspi, op->max_freq);
 	zynqmp_qspi_chipselect(mem->spi, false);
 	genfifoentry |= xqspi->genfifocs;
 	genfifoentry |= xqspi->genfifobus;
-- 
2.35.1.1320.gc452695387.dirty


