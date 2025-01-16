Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B193CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3kAvIiPvuDbscly1USvzOsklcOMjk05ZoOBm2Yut2w=; b=EojkAbV0/TXRoXZQrPNi7bo2Ne
	O46XS01LzXhVxVoJ1vDB9NFydiWC/R99uMi+eDCRt3krdoJtQNmLYhpkv3g8kCB3Lf8668+xEScAC
	Ex/NebxdzuoaK0i84MB3h+vjlpxjoYM6BY7vo1AwFedIqJ19Z5LTgN4P2AjFwpqOVmbjY3anLIvEt
	RBJlUdy4MpUPBE0PEmRvn5cOiZ8mBzI8QmKpnJ/YZwT2cgkYsteeUj/GQaGTPHtPIunLqN/N74MDq
	6uj/CYAu7dgr8TRu6yPuccpQ6+1RZP3py2xhRWf6KIYkAD+tFaqfh4yY6SyDLS6gJz1IjdzDLoZf1
	7YYHqjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZJp-0000000GTHO-2yTS;
	Thu, 16 Jan 2025 23:30:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBR-0000000GP8d-1gPd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Jan 2025 23:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=f3kAvIiPvuDbscly1USvzOsklcOMjk05ZoOBm2Yut2w=; b=D/cim++ARxUyB7emLE2li+4UwF
	ADujawxbBPJLXSDy+OCNId43ozIeFK/vxOCN5TPB48gRJNRGGEsBQ34SswZfXATDuOoxeBLntXOeF
	DlUCO3CgSPYNITS52Oa/wPMcguWJ7EM+C7lF2MWbt/PtOz5IQ2eT6qy+uxlRHFeAdV3AFZq6bS6te
	1YUCoTJOe1kdvj8/lAqGj8Uc0YU9f6WL9VL61hjFuihFDu8Q2qaxZIid3q0kaBm9lm2jg2Mcra+Uv
	cwHzXv2ziOID/AISWyvIUnLOf1hHnkk5/VhKgON07XEmdkATh6A93TrskSlv2eTzOuzaBV4sOh9zy
	pRq9zdqA==;
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZBL-0000000BKbm-3yM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3kAvIiPvuDbscly1USvzOsklcOMjk05ZoOBm2Yut2w=;
	b=OZHlBT2EInsgKHaSkHw4Zp/mu/U8KYfBsgR4roeno+oDlFuiQYLIY+Noe2l/rde4Wuidmb
	bL9U8Dq/8IkbRrP3mXDLK1JcJyKPvpqyhSkeg0dUGrVOwPBgNw7k8EJp91Q6LVN+uVG91h
	of0+hZ4S9RHUXh/QZ+BL20EnQoVPhQ4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/7] spi: zynqmp-gqspi: Pass speed/mode directly to config_op
Date: Thu, 16 Jan 2025 18:21:12 -0500
Message-Id: <20250116232118.2694169-3-sean.anderson@linux.dev>
In-Reply-To: <20250116232118.2694169-1-sean.anderson@linux.dev>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_232150_370964_F6EF17CB 
X-CRM114-Status: GOOD (  11.04  )
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
take the speed and mode directly.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 95eea7d75f71..ba12adec8632 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -545,8 +545,8 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
 /**
  * zynqmp_qspi_config_op - Configure QSPI controller for specified
  *				transfer
- * @xqspi:	Pointer to the zynqmp_qspi structure
- * @qspi:	Pointer to the spi_device structure
+ * @xqspi: Pointer to the zynqmp_qspi structure
+ * @req_speed_hz: Requested frequency
  *
  * Sets the operational mode of QSPI controller for the next QSPI transfer and
  * sets the requested clock frequency.
@@ -563,13 +563,10 @@ static inline u32 zynqmp_qspi_selectspimode(struct zynqmp_qspi *xqspi,
  *	by the QSPI controller the driver will set the highest or lowest
  *	frequency supported by controller.
  */
-static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi,
-				 struct spi_device *qspi)
+static int zynqmp_qspi_config_op(struct zynqmp_qspi *xqspi, u32 req_speed_hz)
 {
 	ulong clk_rate;
-	u32 config_reg, req_speed_hz, baud_rate_val = 0;
-
-	req_speed_hz = qspi->max_speed_hz;
+	u32 config_reg, baud_rate_val = 0;
 
 	if (xqspi->speed_hz != req_speed_hz) {
 		xqspi->speed_hz = req_speed_hz;
@@ -1094,7 +1091,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 		op->dummy.buswidth, op->data.buswidth);
 
 	mutex_lock(&xqspi->op_lock);
-	zynqmp_qspi_config_op(xqspi, mem->spi);
+	zynqmp_qspi_config_op(xqspi, mem->spi->max_speed_hz);
 	zynqmp_qspi_chipselect(mem->spi, false);
 	genfifoentry |= xqspi->genfifocs;
 	genfifoentry |= xqspi->genfifobus;
-- 
2.35.1.1320.gc452695387.dirty


