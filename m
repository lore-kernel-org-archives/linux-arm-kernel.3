Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B8C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myOtv1Ti+fSD/oUnnjMPiLo6ViBfIn8lXDe7UnZSh0A=; b=mIPPsb8LRqd32vLyG2rx/6+ns5
	JTxImCs9X81kksFtZav9sQmKDf1rmRFxxSPToukpUNR4mEQrIORwRRsq/iAqrwaLlt5P0pS9q7+lY
	sMYMrjgJgw/eV6FRf6L1l6Esndzn9megwgkvX31D1TwFWQ1SCrdQyNx3piLDDnqLoniwEPViJhB3O
	+E9JPQVhRNxXhJyzL7EavWxX86zSppi1KlLfCoTAr/P6x8l00cC9OgN4mbBfIP9+7WA08THUxx1tt
	qC+Ddx59QuO4uLerz52X+lxExq+diEwnVKD16fh5iaDtIwjvXAxrRaKJNHnjxJgCdMmAo7T/Jsz0u
	BVWFZDkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYsC-0000000GGsE-2Ei5;
	Thu, 16 Jan 2025 23:02:00 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYm7-0000000GG0W-0whS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:55:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737068141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myOtv1Ti+fSD/oUnnjMPiLo6ViBfIn8lXDe7UnZSh0A=;
	b=kDWFGToAYreA642mEaPCSTgL8yMCyoWf1ryblhiDYjNDN/jNrkOpR6vFAqcmahj41e3+FG
	n8//t5wXav35O4QoYpGTvE2t9oCA5AxyrNKwEjmv7w4zr0IKjo+0ySN+W9wvQdok+vZWbg
	iWJ/p18qs+HmYN0fkO6qSNwMDnuvFF8=
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
Subject: [PATCH 4/5] spi: zynqmp-gqspi: Allow interrupting operations
Date: Thu, 16 Jan 2025 17:55:20 -0500
Message-Id: <20250116225521.2688224-5-sean.anderson@linux.dev>
In-Reply-To: <20250116225521.2688224-1-sean.anderson@linux.dev>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145543_400837_8EBD3F20 
X-CRM114-Status: GOOD (  12.26  )
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

Some operations (such as reading several megabytes of data from a flash)
can take several seconds or more. Users may want to cancel such
operations. Allow them to do so now that we have a way to recover.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/spi/spi-zynqmp-gqspi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
index cf47466ec982..fa4bff73324e 100644
--- a/drivers/spi/spi-zynqmp-gqspi.c
+++ b/drivers/spi/spi-zynqmp-gqspi.c
@@ -1062,14 +1062,24 @@ static int zynqmp_qspi_wait(struct zynqmp_qspi *xqspi, unsigned long timeout)
 {
 	int ret;
 
-	ret = wait_for_completion_timeout(&xqspi->data_completion, timeout);
-	if (ret)
+	/* Only allow interrupting if we can reset the device */
+	if (xqspi->reset)
+		ret = wait_for_completion_interruptible_timeout(&xqspi->data_completion,
+								timeout);
+	else
+		ret = wait_for_completion_timeout(&xqspi->data_completion,
+						  timeout);
+	if (ret > 0)
 		return 0;
-	dev_err(xqspi->dev, "Operation timed out\n");
+
+	if (!ret) {
+		dev_err(xqspi->dev, "Operation timed out\n");
+		ret = -ETIMEDOUT;
+	}
 
 	/* Attempt to recover as best we can */
 	zynqmp_qspi_init_hw(xqspi);
-	return -ETIMEDOUT;
+	return ret;
 }
 
 /**
-- 
2.35.1.1320.gc452695387.dirty


