Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1B3FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ti2400kELeoTTXiRLb/VuTvlneI8nPmBzCy26OVf/VQ=; b=QX4evIgyIGfYck7oRJejX31wp3
	H9fSIgHBRf0aUxIxKE59ey3WaAoyOHAnNxOcc/ZwqwJeFWYh22iUDLTBwkA+dI4fszpMApPD1y4w9
	TaPK7DbTpskhqln3hTu8oIw9nXqfxCkoIrSmpEdLHx6K61MBYwLHzYgEpme+tnhcj9eYRqe1oe7Ip
	o0t5lq0brTG/oL/MX5/tMwqybYaRVD9zltgQhoeEDRDeA0G+ZiphrsyTz6hShMKz1qmQTUryL3bNt
	itXuuMIu3Vk5iUM5LpC3e/3nCe4XIXhBmzT63DpojhJkYlBbVThfpi1Fk9gkuwu22/pblSVoVEkce
	DnVgyGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVQ-0000000H9Oo-20ky;
	Mon, 27 Apr 2026 15:04:16 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVN-0000000H9OK-3wgf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:15 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso88309305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302252; x=1777907052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ti2400kELeoTTXiRLb/VuTvlneI8nPmBzCy26OVf/VQ=;
        b=bxSXYmzVOyf+paAWerH8kDIGZfXwQ87368zoqsrhgsKMyMujmO8treS65sg9It1/A/
         lRtCvrSJEDrstE9swgwwOnPkSxIMhMOAmJxKEUXi5t+rIR64XO1eOw7WEO5HJAAtrgND
         yZgFVgVw/1Dvmo8UlsOv59kOpNxr2J9QAYKQSent1JK3CzEP2BCf8nP5GJxzxdF49gqZ
         jCnUcgnauaDaoR3KHeClwb+27NoSWlBiHWNmzfWkAIH/eBGl6GGzM3aJHMu8WihNx6jm
         IqbuCYHNjEmPSp5b0cUGG36ccbUfrdhrXOBKqsy3XgCV1Uul6/uE0WdLKowH7uOomfW1
         Nq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302252; x=1777907052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ti2400kELeoTTXiRLb/VuTvlneI8nPmBzCy26OVf/VQ=;
        b=eKqziCO4J2LBPCoNr+8atd+DsWtz3O2X13WnBArR1f4jjod7YGwIX58rN5mef30zKf
         +tM6YDwc7gs6hILqlqeT2rfgGz2pHG89QTXYMaNgh4xUagbznKU1lK2JLhNit8P5jWWI
         SrtQ8MZjoNsDJK827EHumqccDRE/B0BDNGw0w79vLyAP/BMuCsBgq8gn9ttJNtPLLhYl
         sJatrVMN60yEfSEIF4JjhDFK6jtOcYLrT93p+eI+dPgWheNA72yAuENIxs1QAZOaXOC5
         qd4yxqkw5jFJeLbJnLU6M8AzpGdtPfDBCb5hS2JHLfIYwxipMqS1B3gAl6M63SvOfrQw
         BYvA==
X-Forwarded-Encrypted: i=1; AFNElJ8vrkH81cFh1fSn+I/79ibpKNSE4F02cUoWIBZACM0LEetSJLAhdC33PsiMAFyc61lO/qvW7qw68ZTws1wisIoA@lists.infradead.org
X-Gm-Message-State: AOJu0YypjbwFrKkSxClqy1ABlOTxSs175AqaOk4Qxn03RDeIv4Pq5xBJ
	3O7ad5oIuft+Aqs+Cmv+gJy+PVaQOsXZBrNe00t+wuoAZMHkr9Nue4mvOYEHYOEqB4w=
X-Gm-Gg: AeBDiesRCN9QlKB4jp+YYLTiHWSNB7J4/+TekC6hljdxmwbItTVSfzZKaqkbSC1z3v1
	Y5Kccd8VjxhhJLq7Pan5q37LxWNNUrEGSq8RlKyFyD7U/zF/IMIqm3BsIfSmry/75kRdKDWoVhR
	tckawfps8bhamd3ZcJ/DwQrPvEJFUoUMvdzEUcjRG+OluieYXVNfqgHF6ccl2QLaIUuj3SPSExc
	nMi0Tatsb5VZEpTMrCYqfxNMo2rv7vvkNlDLJbdVzZ4cD1w/ejh4FIzrAc9vhHWdc+DcXabNmEF
	aoIJdY+XTr9G50ynqMvPdviFWhFKetbxKcNbn13jSBl7VsUEbwUNcNfMqkY1t+SNstpiNl7jAhn
	NDZHqDXq1AtYgEFx7HuitW8ERHfJkAIA/rgvsMGcARca4zy55xhDp1mzX4Do/30/gfXx9Z3XAWb
	QkYqipkLj7Cf04qVz9VyC1nO2dDoNcOrnCkeHLHpQ/bwBijpkzfbrVfN2XoVb1/Dm+3i0lYZBDq
	4CeJtykEXw2x7anAqFYGuKL0EwQ
X-Received: by 2002:a05:600c:6296:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-488fb73d764mr592141905e9.1.1777302251486;
        Mon, 27 Apr 2026 08:04:11 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:06 +0000
Subject: [PATCH v2 1/6] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-1-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=4323;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TreFdYinnhSJgXpknKYqTtPyjIcb0I8seNUyWKt+xKw=;
 b=pAQoGOrdB9aglx1LoZ4o96ai+lG9Ru4bx/cyfczVUvFORThYC9GKBIcXcQY0ZFt5VUSyHBvQy
 eyHq/pMisNABff5Vkr8uR57Y8FVlmYKouun6Wac6MFT32bKcRwYv9Vc
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_080414_010478_6C83E426 
X-CRM114-Status: GOOD (  18.65  )
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
2.54.0.rc2.544.gc7ae2d5bb8-goog


