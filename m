Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042B6FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+M8AOXn9O7RUpeUBA+tCnoNyyooYIprfAY53DgU1d8=; b=ajPYZ3zxhyJxzlCxkpnGBYz5Ec
	tDf/p/S6lsgJonLkSZzqy/oZ+oCkJ4IBJquFy2L3w67jZe1qukhCcdz2RFXo16IaknWadv+S5ZhYP
	ko/aL/t1wgBnQ5kWkONkBA6R882jTd1p4hXZNcfw3QOGbUNBrwy6TZl5uz/+jfhoSt20xr+r0812N
	8/PgE4dC5hwlN+i+K65XoQFUwkSpltKk9ijV3zGbF2/5R+2IlPRbbnDiHbL/ASOCC5/4z7CJTcQ+U
	Vcx0r8rlINFSbhng7Bm5fHaXsByca2+52hl55F/jywSe9DHjQcYd+nj6m1TcUfLywEfthtMkXrfRV
	esDWWjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hy-00000003dYB-2xpY;
	Wed, 29 Apr 2026 13:12:06 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hq-00000003dUv-1W1H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:59 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so5502305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468316; x=1778073116; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+M8AOXn9O7RUpeUBA+tCnoNyyooYIprfAY53DgU1d8=;
        b=vBNjg8rW21brlIXcXRy+EOFH09QjEBjuUNygh5bCs+ny4mAx8pDPHs85wfMq3rHU84
         mVOpkS1kRxqpirttDLCysRqMaUyXYt76Jbh9KkAjVImqKelxrEZifa6K0bcAJOM8tFIg
         E1QMVWFX9+ymVfb8I3OQa3E/6chmeiVdZsP//GXZCaCfv8tQtby4vSr529T1A7RpsTpT
         j1Y6aQ9GPeTkD069VntkgiL+SswT2m9SntZSBbkG3U5d2FJwCQiNj/HOqdKGLC5ygfRv
         ypQKKaCi4LVoxUtRqj8SWDYEDjyUkGxBNcd4UVHHJ44W7FG602GCuWBk2+hvvEVHyfXp
         mZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468316; x=1778073116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+M8AOXn9O7RUpeUBA+tCnoNyyooYIprfAY53DgU1d8=;
        b=jOb56fFxpGKom0nVbEEEb4EI6/ngevFiLyTk1YFwErH+VNMTpr/GM2+S1t8BQ+WNjl
         2Ua8cap7uMU5fjxGnblvpPtX+4qErtqcu/x3/HHeVUOp/PR4OrcCGzZB8OW9b3cIPo3P
         OsrUGlkAUJAZ/wTp2bryMeMsbIYAXzAsSKz4l7V9J0qMv6r2DHqPTt/OIRM4yNte0aa7
         Ca0wLLbkEhhMJAIATQVOfJ+O1vgxk5F7BfAAY+mrqKgEQNXU9E7nYLm/sdiwnLbsi00Q
         ZkEqbmkQbfYR18AgNUjGnfGMLnoTbs9h2CPRHhYrfwfwyILgk+iBVNE+m1RmgSG+7NlX
         Zy5A==
X-Forwarded-Encrypted: i=1; AFNElJ/nxGUezFEq6mAk522LiEtl9qQ7jL3m91MvrRmhk5r6gxtisQ44DycEIXrrsy2/4UlV2XmeGs36AouBBYZhWIRv@lists.infradead.org
X-Gm-Message-State: AOJu0Yyiy7WYK+woaf5R2u6jQT0lDklSVp1c+wJmrf4V56LjgDWQJZXa
	6FEJWhDqEMOfc/oaDqIJnIL7H2P1gUUyqqOwk+yY4fQThkoZkOBAibYrR/FEYOS7pC6LBAjgum2
	EwDdMjxs=
X-Gm-Gg: AeBDietdTko8LvJQ3hXjdDoUf+lyWcl/dt1yi6DVO4XuIeeUYHsDj78DEMMAI+eer2h
	pEDA1WoSQU2tRODGQXTqZKEm2obWuQ4W0cF4nPfBc08YM8SSXiYqBtJoV2b6WR2TkwBEwc2kLJ3
	0+YugwqIP8K/3YPNIJBxVan8vj6r0TXdIwy1ugm+nZWGyqYHNdNcoW531BW+AFwE/+s1gwhqrsd
	C3lULsPtHUoGO0AaiQv0J9t5yEcfMVY5HeSBV0M48HuUt5luLWPB6/6V1W9ZGzVTKjb71PGm3b8
	PSP7B7Dz/O0hGlKC5ys36JvSQzGyWQL0PNaNGWRRtXlYhX/a7gBia82UXtXXzyKrRkcUgL81qT7
	wO/BxKTxoAjY4oUTjvCwNfyLU4lt2fkzYUds6yupQohZq+4R8iFGT497wDGWi3Fy2iANGct12I5
	sTFSKQGm71TNcm5UDAEgQW1X4+ClmOTAuOjIt45TS9EqZ9LHrVXj6bV2JusjMA+FEu9WR29YQ1V
	cueeZU01VaXlKpahw==
X-Received: by 2002:a05:600c:2e0c:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48a7bf39d6fmr31504885e9.0.1777468315731;
        Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:55 +0000
Subject: [PATCH v3 6/6] firmware: samsung: acpm: Fix memory ordering races
 in RX and polling paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-6-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=5716;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=qIi4uEXjUsPRYYUetGAKlVVsN1QT6jgcMevIIMn2wws=;
 b=n6p8KMgV4VXWOdTJOMRAdVfyCy1JYt9VnaozXQPFuRYYG/Sdcg02lvO7Wqps2Wkhke/a6iO7V
 YjeMPAOm5V2CdnvfidMtNJqGt3sYxPv18LMDCqgVxcTKOhqwQUxY7dC
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_061158_453368_955F7386 
X-CRM114-Status: GOOD (  21.51  )
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

Sashiko identified a memory ordering race in the RX path [1].

Sequence numbers are allocated by the TX thread and freed by the RX
thread. Because the TX path is protected by 'tx_lock' and the RX path
is protected by 'rx_lock', the shared 'bitmap_seqnum' is modified
across two separate lock domains. Thus, the operations acting on the
bitmap are effectively lockless and require explicit memory barriers.

This patch addresses missing barriers in two paths:

1. The Release Path (RX thread):
When draining the RX queue, the driver reads the payload and uses a
relaxed clear_bit() to free the sequence number. On weakly ordered
architectures like ARM64, this allows the CPU to make the cleared bit
globally visible before the preceding memory reads (memcpy or
__ioread32_copy) have completed. If a concurrent TX thread allocates
the newly freed sequence number, it can execute memset() and corrupt
the buffer while the RX thread is still actively reading from it.
Fix this by replacing clear_bit() with clear_bit_unlock() to enforce
Release semantics.

2. The Acquire Path (Polling thread):
In polling mode, zero-length messages (rxcnt == 0) can have their bits
cleared by a concurrent thread that happens to be draining the queue.
The polling thread waits on test_bit(). Because test_bit() lacks an
acquire barrier, the CPU can speculatively execute the client driver's
subsequent instructions before the RX thread's memory updates are
globally visible. Fix this by pairing the release with
test_bit_acquire().

Note that the TX allocation path (acpm_prepare_xfer) is safe as-is
and does not require an explicit acquire barrier (like
test_and_set_bit_lock) for two reasons:
* Address Dependency: The CPU mathematically cannot calculate the
  destination pointer for the memset() until the non-atomic
  find_next_zero_bit() returns the index, naturally preventing
  speculative execution of the buffer wipe.
* Lock Boundaries: The visibility of the atomic set_bit() to the next
  TX thread is safely protected by the 'tx_lock' boundaries
  (specifically the Release semantics of mutex_unlock).

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index b8a4978b091b..15627b439838 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -7,7 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -207,7 +207,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	if (rx_seqnum == tx_seqnum) {
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		clear_bit_unlock(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
 
@@ -268,7 +268,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -280,7 +280,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 						rx_data->rxcnt);
 			}
 		} else {
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 		}
 
 		i = (i + 1) % achan->qlen;
@@ -322,7 +322,14 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 		if (ret)
 			return ret;
 
-		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+		/*
+		 * For zero-length messages (rxcnt == 0), the bit can be
+		 * cleared by a concurrent thread draining the queue. Use
+		 * test_bit_acquire() to prevent the CPU from speculatively
+		 * executing the caller's subsequent instructions before the
+		 * hardware transaction is fully synchronized.
+		 */
+		if (!test_bit_acquire(seqnum - 1, achan->bitmap_seqnum))
 			return 0;
 
 		/* Determined experimentally. */
@@ -392,13 +399,24 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 		}
 	}
 
-	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	/*
+	 * Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62). We do
+	 * not need an explicit acquire barrier here because visibility to the
+	 * next TX thread is safely protected by the tx_lock boundaries
+	 * (mutex_unlock provides Release semantics). The RX thread only
+	 * blind-clears bits and doesn't care about this.
+	 */
 	achan->seqnum = bit + 1;
 	set_bit(bit, achan->bitmap_seqnum);
 
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
-	/* Clear data for upcoming responses */
+	/*
+	 * Clear data for upcoming responses. Speculative execution of memset()
+	 * is prevented by the strict Address Dependency (implicit barrier) on
+	 * 'bit'. The CPU mathematically cannot calculate the destination
+	 * pointer until find_next/first_zero_bit() returns.
+	 */
 	rx_data = &achan->rx_data[bit];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */

-- 
2.54.0.545.g6539524ca2-goog


