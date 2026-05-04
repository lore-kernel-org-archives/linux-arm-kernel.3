Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB40CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=; b=f/uzwa7qu1W6bVIMfs4p9AnepN
	cxv9OaU97YzlI/mQGxzDAtQ8zxJBqpdEnAJV+KEH5Yqpf0qSsdNFb7Kdix+qcJvKNaWFvA7Y6t6YX
	kQIBGw26j109zTioHpFynnimp8bbtvVcuOsxPxtmVmjETkqRX0zthG6GGxxovynyLRbwa1lIl7oVQ
	lPXioXxv4LaMOneUobQvJyMW/SwwsJHzmnNPFaGMhScHPxDsyjm98XPYuXY3CEkWX1QRtj/ZfGW4W
	u2rAvBiXAlpIyRE4xMQcvcnHTfjGaIAILTNoSg8SkHbXydUc1JpzW8uHP+filUHKBwfxL5Lc06C4S
	vaHB6DOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLC-0000000CtdZ-2BBb;
	Mon, 04 May 2026 10:15:54 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqL8-0000000Ctai-1x0N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:51 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so431745f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889748; x=1778494548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=uCqDA7zq3wC+kLyKldcakt+0rPJg89d+6pyGewOINCFHMw6THZi23HO2mt7p8nuk84
         +dRecs5qUBx2tbEnYw9JJytoNJ0ZGqu7Z5P/rVPFp3th8jlAkCBbgL1eWeG5t32zbrhA
         4DRXZCZa0hFdwwFUEZ9KDbiyRMQuoJcoTiVLBuLtGWnthv0eu2mgeFWDZ1YLKTskbJqx
         DLD6kAxNY3xoBXljN1yRqds7qrzOXikRAKiObO8DumhuFtYPCpVZ/JwSoj1b+Wg9MjX7
         qo/NJgIYmR+8lxcnHSgsk6HxC8L3LTDzfczs/O7ojIcirqrT0dHaNOOxQaEX8lcvOAVH
         uZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889748; x=1778494548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=jaqA/KVYYpq5yz1TXD7XAwrSAa4p62FnXsNOc+DfZ63ulx2Ams8pB/FTRmbA+lbpfE
         oKHpXpGBwOqiPGZsIoBC/TIJHSZ2jlDqmpiD85rI6eWZHtf8WuDfcOqi8rclAnuEirRv
         p4R3HniYWOIXDRrlC8P5x4lYwhIo7U9dLIbvzLb4DzEtMdqbp7ChccwpwEx5XOICuV57
         s+RJaGyseySvNPO0JLntkH+WFVc+DUjBGkBIgsrGj+P4nlbu+m+lMO7/E8F5TCS7WG93
         bXDDNrn77yrVCFcRUOCY0XOvLGHThfovueZEhIe7DLDKD0wONvjPsPz92OnPLJTmeTG/
         qCew==
X-Forwarded-Encrypted: i=1; AFNElJ/qS0qWEDJOZ0l9kdihADnKqxHLvM1O5N21DV2T3ACdr3vNDh5fo5sAcnq2J7RxRqq8etnqxS6AbQN7GJQTtAYR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9PEdGmWTJAdN64bawfCDOrZR3cvYqrlZ9yqc6xM1ZNcSyeztZ
	oPCpACcYukzynBxfWeKY7qX0kD1K/A5XnEto1OwGs4kI1csz9Nwu5YvyZRil66dwaF0=
X-Gm-Gg: AeBDietxwj4A36ezflFadvo9hTRCTUWuwinE3uhdz5wjF/df84s7b+0qW70Ht6bOsEX
	d+NQ8CThOH9a5j4+lfq9hPXa3yk0GUvH1L0qNalbsGOAo+rDHaEPs1VFhy/E33irpoUrVauV95L
	+jBA2gDDdyasXJ6AY7LaIgU/da9f1D/3o0+IvYotsJ+Squ8LZv+t+1Ve4JWjyYAStdnqCMStexP
	m2DGMpOWsKgkmWY5u4Mj8bLOW6zYYNn58Ke0jVtvLrrwOpuWD+Tlo5iJxchPbU5U934yF9MP2ZW
	BlyakEWXvb65BkpSYfD7WvnQUe12wyy3Tgx5cXhSbVxZZ8ATJM+2Fil4XdB6D9AaqyW/wXAa/Oi
	/RXqE1fSRCtkznNtzMMs/DSknRLgj+PaAVKYnH6apdnrDtVVMEzbp8NrsKshteK4t7QEj9L+gol
	dTifJAWaQAELqogPyURWyC/Rbs8bfveOu3Zexxr6YC9FZSJRCAuVG+JlcxFCrBa0jUne/OSTY7Y
	dzrrqiOFV7guHI1EQ==
X-Received: by 2002:a05:6000:3109:b0:44d:821:1a07 with SMTP id ffacd0b85a97d-44d08211be5mr10020820f8f.13.1777889747958;
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:47 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:44 +0000
Subject: [PATCH v4 1/7] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-1-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=4319;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
 b=80zUlQrtsKlzxDbNPAjqKdF4gRyC7gSE+jSLVylLga3lpLyJFqwFJkPuwnnw17f/SpUk/JAGu
 D5Ns70AdZ2IAayurrPZxSkCThctnUnNJWZhSO/BWwzOez8JvXE3lf8N
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031550_523878_697B1A1C 
X-CRM114-Status: GOOD (  18.90  )
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

Sashiko identified a cross-thread RX length corruption bug when
reviewing the thermal addition to ACPM [1].

When multiple threads concurrently send IPC requests, the ACPM polling
mechanism can encounter responses belonging to other threads. To drain
the queue, the driver saves these concurrent responses into an internal
cache (`rx_data->cmd`) to be retrieved later by the owning thread.

Previously, the driver incorrectly used `xfer->rxcnt` (the expected
receive length of the *current* polling thread) when copying data for
*other* threads into this cache. If the threads expected responses of
different lengths, this resulted in buffer underflows (leading to reads
of uninitialized memory) or potential buffer overflows.

Fix this by replacing the boolean `response` flag in
`struct acpm_rx_data` with `rxcnt`, caching the exact expected receive
length for each specific transaction during transfer preparation. Use
this cached length when saving concurrent responses.

Consequently, ensure that `xfer->rxcnt` is explicitly zeroed in driver
helpers (e.g., `acpm_dvfs_set_xfer`) for fire-and-forget messages to
prevent uninitialized stack garbage from being interpreted as a massive
expected receive length.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm-dvfs.c |  3 +++
 drivers/firmware/samsung/exynos-acpm.c      | 15 ++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
index 06bdf62dea1f..fdea7aa24ca0 100644
--- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
+++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
@@ -31,6 +31,9 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
 	if (response) {
 		xfer->rxcnt = cmdlen;
 		xfer->rxd = cmd;
+	} else {
+		xfer->rxcnt = 0;
+		xfer->rxd = NULL;
 	}
 }
 
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..e95edc350efa 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -104,12 +104,12 @@ struct acpm_queue {
  *
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
- * @response:	true if the client expects the RX data.
+ * @rxcnt:	expected length of the response in 32-bit words.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
-	bool response;
+	size_t rxcnt;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -199,7 +199,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 	const struct acpm_rx_data *rx_data = &achan->rx_data[tx_seqnum - 1];
 	u32 rx_seqnum;
 
-	if (!rx_data->response)
+	if (!rx_data->rxcnt)
 		return;
 
 	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
@@ -256,7 +256,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 		seqnum = rx_seqnum - 1;
 		rx_data = &achan->rx_data[seqnum];
 
-		if (rx_data->response) {
+		if (rx_data->rxcnt) {
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
@@ -268,7 +268,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * clear yet the bitmap. It will be cleared
 				 * after the response is copied to the request.
 				 */
-				__ioread32_copy(rx_data->cmd, addr, xfer->rxcnt);
+				__ioread32_copy(rx_data->cmd, addr,
+						rx_data->rxcnt);
 			}
 		} else {
 			clear_bit(seqnum, achan->bitmap_seqnum);
@@ -380,8 +381,8 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
-	if (xfer->rxd)
-		rx_data->response = true;
+	/* zero means no response expected */
+	rx_data->rxcnt = xfer->rxcnt;
 
 	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
 	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);

-- 
2.54.0.545.g6539524ca2-goog


