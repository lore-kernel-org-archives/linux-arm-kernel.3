Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB5ACD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHZhPl6Ww9luKOTLTqFrUaU4l6PHixrZT0EheMjlh0M=; b=1zdr9PGLxt+hyucDcb/E37GESo
	hOP6T9jEn5ae1rpvtc+dCp6qtS3I+m1FA1XPCnFhx5GMGlpvZEI3RzJeha33i0muqdOFMyh7o20VL
	ppXFNYP66ub46PtvsX5xo/hUS3VBGUoGidcpGH+6GesMhYbwA4SJJeRevy+oC+xUAJC8ay2pTvLJN
	iRmQimO+vDsUKK/1cTDVUoMgSowcI/a7vuPy00LpYhENoSgtFVNja9Wzw/lqhW8uX5iHvBcomb0rW
	0pFRthvh5c1qluM2zum5GGiAZwPQMLAg1b0jaqYGUuNfJ7RpxE5w0Bb7tHilWu107wxO7iWtV+RjT
	79V/P1Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hz-00000003dYU-09sL;
	Wed, 29 Apr 2026 13:12:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hs-00000003dVh-0fXF
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PHZhPl6Ww9luKOTLTqFrUaU4l6PHixrZT0EheMjlh0M=; b=XlSSUkK7oqtJ+CC7hNn1J3y1Dy
	tzlb+B2cCNiqL8oIAF04NewGVt9ieiBMazSI5vEXpCvyTj/0zJ9/UjhVR4SvBNm2ELGBH50FmnjuG
	kmueoSSRxXe2XOtWS59k67v34vrBsoCg+JO8rX6vl6Mrpak0tppFyqDs82Azd1N5Kl82+j2JA/BOA
	r4EF89DqulRF68LA1vQQxR2558k1uwsl5OEPRjppKFdDE+lHi81tRtIdwucM9QcbuRFr08C7rACje
	9UEcwmcu4SkwwHTVHppRAJ+xhh8pSMkSCgat8O2a6XVDn/ACr7FUcicrqWp/wTgEJr22SECxTInZJ
	yJV/WRVg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4ho-00000005MdO-3I30
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43d70b3e159so6722067f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468315; x=1778073115; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHZhPl6Ww9luKOTLTqFrUaU4l6PHixrZT0EheMjlh0M=;
        b=JmMGwKuO8PcYbZe7oeRX4yip6VzhF7MuiK9QwlMVkjfM9X0ShuYW7jaE67Ccqc65Ui
         ERGHId8kU0Gca8FN76vRpn+8LC8osQY1/7JLypZOPFRR6FNoC4KokStBMz8isEK2W0rb
         vyv5BkxJorxusIGgmfKLelVXeid069C9XxCEE4a96/6wX9LfqOo/rBNa3HwU6erOE3e4
         9O8tfuVpDRhiUPFpPZCnmBhnmrE0/ue8umcL2evxGzjMxIS8PCEaKCDzpX1GzmCMn8av
         9JfNjANdjXJOeOJ74f4GWL3NL9E5rjX94zlJj755jV7tGz1Z8KtRoeOLvNvZokkDGBj4
         mxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468315; x=1778073115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHZhPl6Ww9luKOTLTqFrUaU4l6PHixrZT0EheMjlh0M=;
        b=reat6JgSL7EmFQZl0OVVzAVKebV/DYaQAsdT/SuvlZtk+++74fKDIhZ6qEXSPVD8tX
         UiflhFFW8pIEzyrJNHyTWLwtdwv5naKebH/yeQ1z1YPEt8ANw6pCF3XmrJ/btIMMhWvJ
         mkE/RvIuPXG5XywNyazQHbkRrlS4iLAP8m63QN/zouHiAZgyh6DutudbDyPNJfzTX3bZ
         K1t9O1UW1rtX9GieoxFS7vCP+Gm/IBYX3u/tZFYMkr6MdvkFCCyw5YN1Mbv4kdYDHT15
         92zb5y3KOIUhF1KMNzmTcVpBrSuq0RUcLE1zuK1crXRygh2QDfSblKM4VUp1Cr0KaMxy
         Oorw==
X-Forwarded-Encrypted: i=1; AFNElJ9Dil7+IYc88Eyf1xPafuqJiR323E8jZcChPPRX+vBR9+B0tIc1a8YSWDKvG8FDDnBu7sCxbsqIhoB8JtIrTn58@lists.infradead.org
X-Gm-Message-State: AOJu0YyBW05ODKqqaoH/s00OmLHQSQWPIU2ZaxkxiD/HGx/MexNownNG
	txB81qi5NfAU3r8GF+54pu60HUU7zfJdWn5PkiGfhUBty1RJDFWU8DIP7V8/IFl6ZAY=
X-Gm-Gg: AeBDievQYPbZHSczjkAAY+AZHAv8KoGc2o5F0zeMlAtD1uIKubh+KUSEGxFLh/jXdMg
	s2Ai8wiKTgS3gGEQ3DzElPNhLs/WjsoT7V7tYJLWEHCbwrvXJ1CBfkxQOBdOfmynMRTJUSB+pKc
	otGaDz2hnI9DofJGPYXlAo8XKLfEyEwHtLUSd04kMpU3J5rvr1jKFf5+X4qniP8f6jPjJxoGUGz
	5PYtnx2R2RFFzOPBoC308Z6jZjIwz65C0cl88ukDNm4QvPBtCunZ8EZ2uLqs9MjXLGLLn0Mwfjr
	KOkfDJZAJMvWv+4W2ITPayNX/EqW/fRLAi5FQSS/QtJrUeAXLfXUJJys8LKgQmzdURLnx4RWWT5
	LcpH3f1lsRH9WdnaWpxel0yw5ay1WdEePp2kIYVC89vuKQvXLUpWPNobN0D124oo/xLOAEfa4k6
	i+shuc8zkd/Xpd1UKIyRIhL9FKZlynpmLeR6gIJGueAZBTDTZ31dq0QYXUi+4HfZA/69g+WeZD1
	bZUaWwBViIHrnsx3Q==
X-Received: by 2002:a05:6000:40cb:b0:43d:6244:f8b with SMTP id ffacd0b85a97d-44647dcf63fmr14140392f8f.13.1777468315079;
        Wed, 29 Apr 2026 06:11:55 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 29 Apr 2026 13:11:54 +0000
Subject: [PATCH v3 5/6] firmware: samsung: acpm: Fix infinite loop on
 sequence number exhaustion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-5-47cf74ab09ad@linaro.org>
References: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
In-Reply-To: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=3628;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=icbMfRdCY++qMwHt3NVqCYtxBBVHdcrDPMwKwp8NvrY=;
 b=UCDCLiY5Dim90lCTsvySxGERU+EK7a5cZdW8VdrNdJKi6eaVx8FFW563ZHPo2gPXZsudXtv5X
 pxkQW8MG2VsDOsA1JB+fwd9hF3nzSSKENx8TQukhXM5W9K2e0mMwZbQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_141156_948173_0A1CB4EA 
X-CRM114-Status: GOOD (  18.02  )
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

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260420-acpm-tmu-v3-0-3dc8e93f0b26%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 36 +++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index e4d8d1120192..b8a4978b091b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -12,6 +12,7 @@
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/find.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -370,29 +371,40 @@ static int acpm_wait_for_queue_slots(struct acpm_chan *achan, u32 next_tx_front)
  * TX queue.
  * @achan:	ACPM channel info.
  * @xfer:	reference to the transfer being prepared.
+ *
+ * Return: 0 on success, -EBUSY if the sequence number pool is exhausted.
  */
-static void acpm_prepare_xfer(struct acpm_chan *achan,
-			      const struct acpm_xfer *xfer)
+static int acpm_prepare_xfer(struct acpm_chan *achan,
+			     const struct acpm_xfer *xfer)
 {
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
+	unsigned long size = ACPM_SEQNUM_MAX - 1;
+	unsigned long bit;
+
+	bit = find_next_zero_bit(achan->bitmap_seqnum, size, achan->seqnum);
+	if (bit >= size) {
+		bit = find_first_zero_bit(achan->bitmap_seqnum, size);
+		if (bit >= size) {
+			dev_err_ratelimited(achan->acpm->dev,
+					    "ACPM sequence number pool exhausted\n");
+			return -EBUSY;
+		}
+	}
 
-	/* Prevent chan->seqnum from being re-used */
-	do {
-		if (++achan->seqnum == ACPM_SEQNUM_MAX)
-			achan->seqnum = 1;
-	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
+	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	achan->seqnum = bit + 1;
+	set_bit(bit, achan->bitmap_seqnum);
 
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
 	/* Clear data for upcoming responses */
-	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data = &achan->rx_data[bit];
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
 
-	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
-	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
+	return 0;
 }
 
 /**
@@ -460,7 +472,9 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
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


