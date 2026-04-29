Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5D6CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=; b=RpJrOy1H28pzHlUCTkeNindAEp
	CSdJVSpD6dRXfComXr2jWynMcz9H04E68bUaqvqYWu+Y5WyMlROxieBAY9/2okgayGA/UbUfeeVgy
	wDKmitTvncNFO0OeZRmrGMxtKgczIn2llw91NJqZQdl7Qrj71TTLg5WGSWbiTP1zYG5Dk6FMLp/nq
	cFpqtrdPZz3tYcQeSUgdwWdkQZ1vgGuKFtF18TEYv8hMvyFBq+M04OZglJqfoUrF39kFKaiEgC4ee
	E4nsZxLrQlB/Re4n83WnrNgbRjR74oavui0m4oF9rh6kOEGZiR78H6TGK4ZaxX1f2g7y68BVgG+/F
	kndrZYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hq-00000003dVY-44Xz;
	Wed, 29 Apr 2026 13:11:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hn-00000003dTL-2TuX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43fde5b81a1so9334969f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468313; x=1778073113; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=BKMk4L9A9H1SPCUX9hr+A4E5mpYUAsWbqz8SL7582id84RqtE380zSLjytk6XQLapC
         UPpoe5qzuKGV7niOF79ediohg2lk14sKESu25BEfdUWm9kaqa0twcHIwL1XX218gWOlv
         HFFmXbTRtFz+v7kBl7hbA5WsmfqhLVwSUKU6ry+QdtoEhO6vSAJDNoizO7QbkA0pepDp
         +/HRtDa3HbVF37nBIWwYJPQqjdr8JxKCTUT0+oTTFIAj3IfuUimfVHq1drQRIoRtGQ6m
         ysiQ4xHmDN96gU4HzejMVlo6Sdnz5Xp7uv3cPsOtdynWAgTekOUZoeh+G4sPGYoYyzPi
         yqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468313; x=1778073113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ougqSxlNHpdb7A3xiXDiO/CHpVSWdAi7241ogZispeo=;
        b=r5aOvvZpwJ7vMvN6Zwle+gISXIjXq7XHed0p4csI6dZ0QfvTNGmNQG4t/9CQK0IDUr
         cCkQ9k0O+gWDFDRuVJA/+13PMvFnxyPyozLJ4g3pQ8M7YFyTKlrozxTzq8olYoiCn5Jk
         sr1w5qzW3uZmtWBjBuDe4XYoPzJqkoojzX5oWne0yhBfhFbjVy2zh7mc4H7dOfXi0pXf
         rEa6qHlrc9//Ssgfyn6t0ofXBb1iV1MTQsIw8vhch1rUq1VgwIodlzjx4OzotiFhNvyk
         0qhq+PcqATPCGhxv3FQ8XUAv65Uat+4QFOHuMegtcNIvrsfegX/eFkVhkCOs7C2GgZEW
         SE/A==
X-Forwarded-Encrypted: i=1; AFNElJ8soIMgZEIB9MA2qcpR+QV7QbzOCGJQT2J4qkhQfJ/cShebsbW7tfJOtA6AgoI4in8AGU/LWsLr6Lz6dWiHnXkS@lists.infradead.org
X-Gm-Message-State: AOJu0YwgTlLqCrZ6fcUVJ+ULFqkB+YBRp/HXVkPUEy6Zd5FDYH7IhB2n
	A2k+aJ79VGZSLDjPsC5y+CRK3ARvWEgc4lICI1KyM1OyN6twc5QIqsXo9I12I+zH7QM=
X-Gm-Gg: AeBDietmuXWThvpZPH14mwTwYlwmrT1akxEscJ+7oYwVtWNuslaH0A80m4cQRVHU1I7
	mb6Fdlvwli/SXgmRG/ZFgkWGS2L6y41HIgADhjeDA82tHJOj85vEZHY5S64Z+8jCsM9REIKVFQY
	8xe8WVlWZh6bfsgvdyTJhjHXCGGt6JfNH/DgO2p1VTh8+xsd6JusfHw/lpsRL3S5+vSdbGfqQZM
	mXTI1zVXjIX4OHfKQ9CbEir8b3sMEOBLff/3uTz5Co2ipZgD+SKrZ5wX65arImleKFMsB0BTQ6y
	JsSDem5cmhDorv23locBPuGvmFz+LSRhgxhxo4sz0fG+itiAVCnJHFTIH0JHXmDmZmXuDgtYQhI
	7y2rFWTbVDYWcpg1iaYiC+MHMYfBG9vq6h3A7lAlBv7zfUFyAMIFO4AY48PDNZpA3aO7Wd401FJ
	Luky2b9jQZeyTsHTssC+amEiV77060RuHkToKKOvfzyvNB65PqsXoS4uf7baVyU7SHorKs5AOHq
	JTxfKGbyOQilfUgYQ==
X-Received: by 2002:a05:6000:2486:b0:439:c62a:6dc2 with SMTP id ffacd0b85a97d-44790d12b4amr6375164f8f.41.1777468312577;
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:50 +0000
Subject: [PATCH v3 1/6] firmware: samsung: acpm: Fix cross-thread RX length
 corruption
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-1-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=4319;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=QTePW60Bb9iT8APl2jkQnh+1qmdtoSopKY5nHEff6yQ=;
 b=JjWGtIEPDHzDE3ifeqhjWynWDXy4srvXw+WvUSrlmTnb9fxve30Ztz8YMbnfS7UZEI4jrFd87
 agoMLbvSxq9D5XsocCvyY1WX21MMIdiQSYMYgNL+fN7MfdDcMC+3y8t
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_061155_670156_0B225BB0 
X-CRM114-Status: GOOD (  18.74  )
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


