Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8301ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q59EG8r8mRnPm4MFGBHxIdCjMVDqVdWUq04J9T41SAY=; b=Z0tRuSuQHYlWpdrbJPhi8g+c+M
	OGTV9bji4WnW7INRiiTlaMRquKJwrzSrbSc8gJad4AJy0+gAFWQmPeIK+DLubt0fsplTDjUnOI1uk
	In4pzc6sNokzCdIzHwc57Ten6Rr4tc1S/VtMhR64iWedImNxAS1icrMvCowAZueTARnTj+tj/mLN1
	GsY+5s43w015rM3oN0DrSPbu0kL6oizumuaHLUpe7qv2st8MqE/193QVXTAqtJYAmCmmvhJgHwm0M
	83RuQ06uQ2z/wyl5zINlpamWw9t2XxvNvue8X4A6vuA3gSz5fBVmaDeR2eyJkKTJkDR9RbgSGd2BA
	K1qfIs2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb7-0000000GIIJ-3Bw8;
	Tue, 05 May 2026 13:14:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb3-0000000GIDG-0hRW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so42620525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986835; x=1778591635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q59EG8r8mRnPm4MFGBHxIdCjMVDqVdWUq04J9T41SAY=;
        b=A+eicHa/3hU7jwL1v5w5lJE2U8VTumgRwWWLHBArirvTRJy25XmGhLJp9Gjdl1SnOi
         77lZ2p6eviNDBZhY1lQhGi+/zkIFL9zVGmwgyY1abpu/DF3g3qlP6og3IFTpbXHvhwzi
         Zk8bLFBwGYtQUqmjH4Zu+jzioi/VuCZVBYRstMvMmG9E4pbZcU3X2Q3o7Y9TKhjSeEnB
         r0K4dzsQoDk1O9a82Oye58lVlQR9xaJukShLD7fI8+Q7g5d5hxG/bMK60ah2QHZIT9Ky
         TZRnOBfBtacRqTpzVyV9W9Jm0DN0NCQZ7ihkHHBQWmltFRflF1CuemF/EqRIfN5BWgU9
         OTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986835; x=1778591635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q59EG8r8mRnPm4MFGBHxIdCjMVDqVdWUq04J9T41SAY=;
        b=HRLr/bIWDpH9KFTOxcht5KvRn6CXKKAYbGszIs2muSA4WVQlE7D5SEM8Kin+6RqQun
         XJt5UgaZnIznKr4Sgi/QVL3BWQmfHYDAdQ+k244qPIZLXkflBw5JhMUZeJvkWqxH1RSa
         e9MKQTgVQoMakR8rckADv1w67XZQOX4tHqWYNZFSqv4wsNy0ARLh7I3pIkQxmVjAMQRC
         E+7UrsyFzzz4WbpvSBWjKVWY4mMC2iQ9dOVCYMKD8ZGxq0D44sUcd14wrir6OToeNO/l
         u15ZUufQ2fMig+2nDGYmPyl4TajFs6Bc81sgPT3twHCbMQ1cZV8v2s4gew2fmkoxcQn3
         6whw==
X-Forwarded-Encrypted: i=1; AFNElJ+ENB08rEZNRrXAVCf3On34Ll2bEEg/RIOghlJ9Ond12LrZ8A3/MB5pXBIQZSw3MMWqGD1KAF159yC1NC73E1Cw@lists.infradead.org
X-Gm-Message-State: AOJu0YwxIgGDMssQsYgAK7qMQI13xvSBU4RaQTaEtiqbAOnRauoOqJZS
	s78ZV8KHZ+HkKqWTR3niwBpZZjypTwz+h9O/tg+Uw95kirzHJsKv96/clpOwjwwjphw=
X-Gm-Gg: AeBDieslGvZu2dpMkXZjB9+AWw1ziqLB6/UrEaMIC/dQPnyRRKxgQDTKsmv7ivIDEyE
	MA8GK9xBoTyFAZCTiMlzlmnH1jpiHtvsJ/JUh10InmF8aAURSd1acURTdz2BqcuZE7DBQBX8HCM
	Xj+eXVOgyAPm6HE0HmgkF45D02jvFSRh/r1UCMa0y9GdN7JJWrUmXO1d7QI6Yb72upz7vYHvVY9
	ocaVRWQcXt+Ha6zVLelcqffuv196hgGKDoTOG1DQttnDxDUl+bQxqVQ90NvxXMIjwN567hyNivT
	3kwJ86e6XXJSNz7NthlTFzIeOHZwuK7WumIU+/tY+QQMhiAorNLPlUZ58Li8LjGQCCnY7m77qYF
	yw046o/S8JCtfcp0U/DFLy7Tl0D1H8ETMNfDaj4h8Sr0Jx3qpmvMGZRQhfbdLv9EiFAR7d6hbub
	eiMaSisegZ8VwU6hX8plVWTISdVjmY4wWzFQqIrrZZDDPGzoRPbARHG1UUfz+DS3VvsPINcwfh1
	1ix0Jm0RkxpWcellw==
X-Received: by 2002:a05:600c:859a:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48d188d4786mr36585875e9.11.1777986835218;
        Tue, 05 May 2026 06:13:55 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:04 +0000
Subject: [PATCH v5 7/7] firmware: samsung: acpm: Fix infinite loop on
 sequence number exhaustion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-7-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=4772;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=EiurrGkcahcx7sI65l5a7ioyNgZJtrM8vsswXoseAMM=;
 b=sGgiYQ0Fj7h0fIetimStE6LYB8Eka6DrbBPLMswMbcYUjNNUFgRR3HOJv91qVm6vem/Uz2Haf
 s2y+X1fAmfYAg6+Az1ciaJJlGHJlRB+5Ax/53p9VNTk8SnnbcnIuAmF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061357_251435_C0C38757 
X-CRM114-Status: GOOD (  19.84  )
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

Sashiko identified a possible infinite loop [1].

ACPM IPC sequence numbers are tracked via a 64-bit bitmap. Previously,
acpm_prepare_xfer() used a do...while loop to search for a free
sequence number.

If all 63 available sequence numbers are leaked due to transient
hardware timeouts or mailbox failures, the bitmap becomes full.
The next call to acpm_prepare_xfer() would enter an infinite loop.

Fix this by utilizing the kernel's optimized bitmap search functions
(find_next_zero_bit / find_first_zero_bit). If the pool is completely
exhausted, log the failure and return -EBUSY to allow the kernel to
fail gracefully instead of hanging.

Furthermore, drop the allocation loop entirely. Because
acpm_prepare_xfer() is strictly called under the 'tx_lock' mutex,
sequence number allocations are perfectly serialized. If
find_next_zero_bit() locates a free bit, a single
test_and_set_bit_lock() is mathematically guaranteed to succeed.

To enforce this locking invariant, wrap the allocation in a
WARN_ON_ONCE. If the atomic set fails, it indicates the driver's
mutex serialization is fundamentally broken. The warning generates a
stack trace for debugging, while returning -EIO immediately aborts the
transfer to prevent silent payload corruption.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 45 +++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index fd2e46e9f7e9..a2cac913b2bd 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -13,6 +13,7 @@
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/find.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -394,34 +395,48 @@ static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
  * TX queue.
  * @achan:	ACPM channel info.
  * @xfer:	reference to the transfer being prepared.
+ *
+ * Return: 0 on success, -errno otherwise.
  */
-static void acpm_prepare_xfer(struct acpm_chan *achan,
-			      const struct acpm_xfer *xfer)
+static int acpm_prepare_xfer(struct acpm_chan *achan,
+			     const struct acpm_xfer *xfer)
 {
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
+	unsigned long size = ACPM_SEQNUM_MAX - 1;
+	unsigned long bit = achan->seqnum;
+
+	bit = find_next_zero_bit(achan->bitmap_seqnum, size, bit);
+	if (bit >= size) {
+		bit = find_first_zero_bit(achan->bitmap_seqnum, size);
+		if (bit >= size) {
+			dev_err_ratelimited(achan->acpm->dev,
+					    "ACPM sequence number pool exhausted\n");
+			return -EBUSY;
+		}
+	}
 
 	/*
-	 * Prevent chan->seqnum from being re-used.
-	 * test_and_set_bit_lock() provides formal LKMM Acquire semantics.
-	 * It pairs with the RX thread's clear_bit_unlock() to ensure the CPU
-	 * does not speculatively execute the rx_data buffer wipe (memset)
-	 * before the sequence number is safely claimed.
+	 * Execute the atomic set to formally claim the bit and establish
+	 * LKMM Acquire semantics against the RX thread's clear_bit_unlock().
+	 * A loop is unnecessary because allocations are strictly serialized
+	 * by tx_lock.
 	 */
-	do {
-		if (++achan->seqnum == ACPM_SEQNUM_MAX)
-			achan->seqnum = 1;
-		/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
-	} while (test_and_set_bit_lock(achan->seqnum - 1, achan->bitmap_seqnum));
+	if (WARN_ON_ONCE(test_and_set_bit_lock(bit, achan->bitmap_seqnum)))
+		return -EIO;
 
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	achan->seqnum = bit + 1;
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
 	/* Clear data for upcoming responses */
-	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data = &achan->rx_data[bit];
 	rx_data->completed = false;
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
+
+	return 0;
 }
 
 /**
@@ -481,7 +496,9 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		if (ret)
 			return ret;
 
-		acpm_prepare_xfer(achan, xfer);
+		ret = acpm_prepare_xfer(achan, xfer);
+		if (ret)
+			return ret;
 
 		/* Write TX command. */
 		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,

-- 
2.54.0.545.g6539524ca2-goog


