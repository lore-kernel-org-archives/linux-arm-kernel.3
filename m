Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2A2CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0EVyq5EhiXQLJCeHZ7MP6twyErqWEjaRaq7xPSg8wE=; b=K7G9KGKzd4bFxzKvaCRUcVo1lo
	PXdGBnTVtyHlhXA/fMoL8Ow6j1Jiwc4ygeYSwHlXa+hg20z8UvyugtnKIBb4OV4FZgUCy3i9V3ere
	Ffs3ukCwfvbt/GFEMRfi3JULLrZp1iRgq/Zg48nARf8SnOkURRll4CgmTbsjOukC3RBYp6G9sskiY
	1i6hXOkGfuNq2lN0/jhCtD5zJJvxFXqGt2o7i0gFy1hqrWLlPRGwvABy6e+cp2BGP46deRTfbGGYW
	JpQsItZhU0FBGgQ050Ycl70zRJGV17/gnZdSjM7wLQ97gDtlFjwwXRP4NtLshtYxUno2IkVspkCrp
	YbswDAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLI-0000000CtiB-0aId;
	Mon, 04 May 2026 10:16:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLB-0000000CtcC-0lui
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso31790065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889751; x=1778494551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0EVyq5EhiXQLJCeHZ7MP6twyErqWEjaRaq7xPSg8wE=;
        b=Mw2VSxcD6spMstGUwi3sOpaYeMLYxJ8TjoNuY+lcAKAJ8qAF4ddTm8XHkbGZxq5EeY
         iamOAORPrgq2cUUOZcEmsrE233wsPGH7058IKrS5Bz0bMj7kiEE4JFpD97VK5dGIc3gm
         m2poZZNcaveildL7pAgD7XOf5ACmbE+DrAUyHZHUKW24ehY8pQ5k0eQYDfNvecTltFR/
         y6zczquzmtd07eXROKTL4woZpCF3lSoM5jAkHt2xsiBYMkT1kdE6hMUa2aM5zlp1DoSM
         +Fdj4VTjcdhMvs4X/lR23oyLT/kpomZ8jHFknBvX03kWS1Qq/ZtS/6CAV1LLIQv49j39
         YW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889751; x=1778494551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0EVyq5EhiXQLJCeHZ7MP6twyErqWEjaRaq7xPSg8wE=;
        b=eWO7bp+bBFjEV3oW2zlqOGDFNkMyigYeqs5JYGI0ExaACEQBY/CAFBfUb5XtqxZ8XZ
         8PqztVzfEnpSi6VzGCeOp9vsue7rBkuFG+Ne8KMsee4kn3XEovJn9XubmGfeWcOqjvtw
         uTuoKYEppaCFwuKAsysqUS/AniJYbwpxk76kOV0JPohIBT3Qj4VDN+78wGF/sYKGKBdv
         bSOdnbcZwcZme1AVkK06xiIW8RO+dOemI+3WIs/Ws5N9nllw+gkx8ZpLUU0ztsZQNjV/
         vubfrZqjqfyl1ZcdprgNADlvh7EcCWl0zJ8c3ZUv4+i4oT4mZAF97u4S1s51wZJc0Yr5
         NKvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vYkeQDI5yAbjJ7Z4wF/EgYTUAAFOO+LwKrT7B+G6oQkNbjoLRwh2p57/gJ+FobjeHviVQRAWZCCauRG8h9/iY@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfshu9mdM5XlzwUwfg348eTVhCP5BtixZD7K5cea2SCpXEldNF
	7/0PzNKQCh8ZYmsZbQFEHugcSSY0ONs2/bzqg3iX3bOuejgXb4gzjam1g2ulGVOlcI0=
X-Gm-Gg: AeBDieveDNRZ9f3k1rpWIIP/kb6mUVVsiXihFDk6ct3eyME6Y/QsFgXvEN1Rz3IzKzC
	7b5uMCyjK0YYF0WvI0RwTYpRS7fKMGB8eCFRjNhIGSdmYdyK1eSUsGjn8tWPw3hGgWNYiniTTiB
	xAfR4X5c8Nj3dQtE74vgSXPZFh5nXejdvx81TAEQ0hiEd1U8o0He9skKogHRuYJ++HzBAslSgPI
	Nkb+vyIOC8xDi1CoKpmRjOOZrbK2aGFnGAbg8X/81s5TIiPLf8uFQv68tI+ojQLM2O16oVUZ+It
	mnUJO0TWvkX/6o9EXGh6aOGncrG9To9qQE9wfCoL9iY2Rnp5Gp8GN3/ufdu8wmLoB0Y3Y04uc4n
	mgMHOSvXGPeNPC/zEbghcH7SjRYDotEIkdR1sb9wdpM0J7qTfQDvDgtUYqeHhqBn7ByDy8ecbdf
	kQNasXMs15K4lPqmoMD3Ek/Dohcn7z3WrjS5jMORlGdYebG0gku5RS5xLqW9w4mCQk2R7OaNKvP
	FZHd313+605au+fFQ==
X-Received: by 2002:a05:600c:3f06:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-48a9852cc0bmr154515165e9.4.1777889751256;
        Mon, 04 May 2026 03:15:51 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:50 +0000
Subject: [PATCH v4 7/7] firmware: samsung: acpm: Fix infinite loop on
 sequence number exhaustion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-7-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=4772;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fDS0JpnSnl+5Js3iBpG8K3eo2zfUH/0qtj2UHYu+zRQ=;
 b=et8FDig/iX24q+66VwgJtip7dWRrdghXCQvxyY2KUGVWF5Oq9JbEmfl/MKYHq0HlKvtRufdd8
 j9tiPLh/skeDLaQo318hWVNn8p0C8tDZeD642tBjGcnJEULMcw1LtCz
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031553_263539_5E58A825 
X-CRM114-Status: GOOD (  19.88  )
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
index 6fc6175b8924..e31a1b616391 100644
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
@@ -400,34 +401,48 @@ static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
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
@@ -487,7 +502,9 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
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


