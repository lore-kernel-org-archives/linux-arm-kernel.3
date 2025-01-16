Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DD1C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgUvBMBWULyeQIjVoTQGL6xz3yswwmfd8gZCRxzSVkk=; b=oaJzswumpg6TXmRiJubzr4hghB
	bxoH+RJ0iu01lJZNskv2xFP7+iU++GXEH3OuycmExZ4OgbqdA96yMFzF76nWxYwgSYxqHifWtnyaN
	xw2t3cp63HOC6YbdJMWoELCJH6wMlVT+6UAP10jDc34ZoiQwmRcCM0tcIrswWX22inUL86HYyb0o1
	10GI43DXux0gzasjLbtbUIZDUL4AA75SEwa0VNpRc+YGJ9B9NafZpyqSsgmMZDkBGBivlW50kVftq
	ahy9RTg6PBkB+DS4CH/31smMjrnWjwx/eS+mY/kEmZRX4M/DZ040DRpM81p37FPem3pkqhHJRb3OJ
	kJ0ix7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYqy-0000000GGlN-3hDl;
	Thu, 16 Jan 2025 23:00:44 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYm6-0000000GFzn-1jJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:55:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737068140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgUvBMBWULyeQIjVoTQGL6xz3yswwmfd8gZCRxzSVkk=;
	b=SlvTl+QMSw+AfBh7e1XBZA4UxJHyUmFO8w2J1UXKRGYXgzqh7DxdSvpIefbU2o0HgWxnVH
	zSDfhzQLfQ9E3Dg3v4Bn2cAIb6mIYUkuhoy6n1CzGv2IeDbMoPnFx4myOKalEVB8jHNYUx
	hd1VnehJRgf3YYy92tJ94N6OxYXbXB4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 3/5] spi: zynqmp-gqspi: Abort operations on timeout
Date: Thu, 16 Jan 2025 17:55:19 -0500
Message-Id: <20250116225521.2688224-4-sean.anderson@linux.dev>
In-Reply-To: <20250116225521.2688224-1-sean.anderson@linux.dev>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145542_589652_AD79CFDD 
X-CRM114-Status: GOOD (  10.73  )
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

When an operation times out, we leave the device (and driver) in an
inconsistent state. This generally results in all subsequent operations
timing out. Attempt to address this by resetting/reinitializing the
device when we have a timeout. This tends to be fairly robust.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index 7d138f45b692..cf47466ec982 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1057,6 +1057,21 @@ static unsigned long zynqmp_qspi_timeout(struct zynqmp_qspi *xqspi, u8 bits,
 	return msecs_to_jiffies(timeout + 100);
 }
 
+
+static int zynqmp_qspi_wait(struct zynqmp_qspi *xqspi, unsigned long timeout)
+{
+	int ret;
+
+	ret = wait_for_completion_timeout(&xqspi->data_completion, timeout);
+	if (ret)
+		return 0;
+	dev_err(xqspi->dev, "Operation timed out\n");
+
+	/* Attempt to recover as best we can */
+	zynqmp_qspi_init_hw(xqspi);
+	return -ETIMEDOUT;
+}
+
 /**
  * zynqmp_qspi_exec_op() - Initiates the QSPI transfer
  * @mem: The SPI memory
@@ -1104,11 +1119,9 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 				   GQSPI_IER_TXNOT_FULL_MASK);
 		timeout = zynqmp_qspi_timeout(xqspi, op->cmd.buswidth,
 					      op->cmd.nbytes);
-		if (!wait_for_completion_timeout(&xqspi->data_completion,
-						 timeout)) {
-			err = -ETIMEDOUT;
+		err = zynqmp_qspi_wait(xqspi, timeout);
+		if (err)
 			goto return_err;
-		}
 	}
 
 	if (op->addr.nbytes) {
@@ -1133,11 +1146,9 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 				   GQSPI_IER_TXNOT_FULL_MASK);
 		timeout = zynqmp_qspi_timeout(xqspi, op->addr.buswidth,
 					      op->addr.nbytes);
-		if (!wait_for_completion_timeout(&xqspi->data_completion,
-						 timeout)) {
-			err = -ETIMEDOUT;
+		err = zynqmp_qspi_wait(xqspi, timeout);
+		if (err)
 			goto return_err;
-		}
 	}
 
 	if (op->dummy.nbytes) {
@@ -1204,8 +1215,7 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
 		}
 		timeout = zynqmp_qspi_timeout(xqspi, op->data.buswidth,
 					      op->data.nbytes);
-		if (!wait_for_completion_timeout(&xqspi->data_completion, timeout))
-			err = -ETIMEDOUT;
+		err = zynqmp_qspi_wait(xqspi, timeout);
 	}
 
 return_err:
-- 
2.35.1.1320.gc452695387.dirty


