Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E33FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jr9BfdzOzeMntv3lCO5f0JbSt8ePeb2CrWVw6p0+VLk=; b=03PjcFAEQ2JMdO04qDHnmTC1FX
	Zp1c1Zw4jQJXDd+oElUGi3HPvni+kNmOJwXZbrIYVyg0fu9NpDts0TDQurPkKfhDyTdweFwDkxpkd
	jjLTbJxR17UYGPGglLiC9eu4VLRw5UA76woHFMI0Q8WhWpb7b6ZYgrXEFqkkUqpJZe6b4PHGjhrdj
	goQP0ym9q2PxwqiJG3PFA1nKfGuXDFNNI1QBlOnXe7KKGaeF2abv9J514cKjx4NhB6jdV+zY7dE/X
	N25FpkimFA+xkn+AXb7cr8ukRp6Hg6Plp70cXnJ66513lR7nEca3e9ndNjwVGGA7MlpdvjPIHjGUv
	7BJSvyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVg-0000000H9Vl-0vQn;
	Mon, 27 Apr 2026 15:04:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVX-0000000H9Rb-0gSk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 15:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jr9BfdzOzeMntv3lCO5f0JbSt8ePeb2CrWVw6p0+VLk=; b=QaWVFCe/foC4s9CYoAlzUc8vob
	aNgmpztg0sRaghLceM7Xx1LOVOL75tWENESkptivei+Ia5ZBf+AK78HjkMQO6ey3Q9b5BeACZIpVo
	+sHDsnQ1yPSh3CMqscVQaR6jogJ/QpDXy+YfiaID1lKYZSo4Iwt72A7XGoqP3XsfEAFudAfmFxCMm
	sZlKYzOaGLPf3qjwogbOM6ZEm1E3PBgs0Tke7z9WLkTLtrQ3ttF69OHK1OZGMK34hgtgI3b23QjDj
	ftnzi+yi4yiMW3MgJNk4P2CAOMWsB35fF6Yuno0fsyIvi/NuNh9/t2AqY721tY2JBOafWBFNvD5S5
	a+MYofBQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNVT-00000000tB1-1zwM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:04:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso85704915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777302258; x=1777907058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jr9BfdzOzeMntv3lCO5f0JbSt8ePeb2CrWVw6p0+VLk=;
        b=VxSduhWzuZQvtAdEMArhZelqnIt36tP4MpIBtySnUozvdB+2hU53csi2j+YKncPW9u
         hN6aOu9ZPmcBsYTv29SbLyRapNp3SObuYCb7aPypebajMOt616qEyvDbUlqMDgo1R0J3
         h/IkDvAItf9DSr/ldO6dctnjtldM/x+qHZxiDcip/cQPboi1G7xWzp3jrscew6W5MJJi
         WtQgWhg9VauU5pA8677npBLv1mLp/sseX1OaMvKI0M38ZuDhSFSV6HX5g9ud+YlWUOhM
         Lp/a2IUckgiht76M9plr6WHgLNNkGyrm0uBbjIYlekQYI9d+VbcQUKtPwhl9hzA0Yljm
         vUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302258; x=1777907058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jr9BfdzOzeMntv3lCO5f0JbSt8ePeb2CrWVw6p0+VLk=;
        b=HDtHGXDnAvf/9mv3ncsFNDASfpSS+ZzBXbgaItvzMbw9LUTi12GasAdUzwNxdwoYts
         vvmed4eTyfnmb9xnVlIj19HxRwYHf50tpdrRymuL7YIcSaxLrqcaPUM+MXGuQLVbnnji
         3O6bFV47SiW2ft5LVRtSM0+hOIOq0dI+5mSJDDloDUjGTVk7QNtfviRKrPSnIDqJGEhb
         YuV2daNifkoepYy22fVbqucqGmGPPR6PQLWN9libJONsaENtapG1lm3b22dA3saU+OvG
         Qvpar1HYtHYgUlIQh3AitHXhQeGHAsOdzGiq44O+7lgp5ymV5SD6kKtyGAI2JgMegz8H
         Ae8A==
X-Forwarded-Encrypted: i=1; AFNElJ/iiF+Bo7uYb4DitNUzFlu/vhggi619pcqPIUWiK9VkKvsz/ZVEaoKlNs2tInecACLg8S3o63Ot2sRW7IgfA9BT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+hYWwHD+14z/14liDu/v56ShZqb7ALxGiBwoaJODSHdah1wGP
	g/dPMpgOApIoJFPj4M5t6RGIH+bXFm02tEhlE6yvYysP88MjNMXVYGBP318Rjackbn4=
X-Gm-Gg: AeBDievEYOFLG0vnVzO8TrAiGVwJcNtPO+zsU0wR7E/uJ7uNiyL4TxzRbNct0cZachv
	UElyKKxPdTwoA6E+tfeTXRO6TyNWL8XKX/BzvKXmaht6Jc6lyx2Bk5/a4CsZbbJXWs7pVyUG8BF
	xSVQHmJt1KQ3hJWUUxio2MHCWrqq/FonL2heCyehMey5x9pQIGu2TfhxvCPeT0NQp/2qfcxchtE
	ng4n4Kpx3/SpZ/ituI95MR2hr19Tmf7JD+IwVPDV3+mAhd2m5Z0YRJrLrjd1TT2KTizEg8CHF0o
	xDY4BJegmKxz32eeJpJj6oMBWBEkMLzguMazOzdypXRtt0+M+QkijaYLArAY7aMkp/h3v99hT5W
	nHeGqq73Z5wIH5VQ2OQjSxQOEFvLjU6iq4ojYuUcb1tDT2tQi619lPJHtq8L9JdoGSu/ZJPNP42
	ojLM+l83RUQXqTdYvkGbq+bcSgOgC59ZJ5+QRUF64xi71vSDsDgjtkJaJb2u9FiieXfBTadG4S0
	YiwtkUlym1ILk9awFs26BnaSRZu
X-Received: by 2002:a05:600c:a31a:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488fb778db4mr483500285e9.17.1777302257796;
        Mon, 27 Apr 2026 08:04:17 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48919f54572sm235370215e9.26.2026.04.27.08.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:04:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 27 Apr 2026 15:04:11 +0000
Subject: [PATCH v2 6/6] firmware: samsung: acpm: Fix infinite loop on
 sequence number exhaustion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpm-fixes-sashiko-reports-v2-6-1ff8de94a997@linaro.org>
References: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
In-Reply-To: <20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777302249; l=3632;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Pfox4HTiotQewHotJo3sawpHHhi3T/+sCUyRrpfeAbg=;
 b=T6uQ5V1I+QLmMDgHILxHzE6K8w70UcBWioqloz5BhgvWQGhSMPzxfAy0AkhHfQG2ZamvcXx8a
 Q2H+pFf3/J+D/OWHe0FvWpxr8FO1X0YQ9t6yJrretsDXP2JmLZ/djhx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_160419_615412_FF3485B3 
X-CRM114-Status: GOOD (  17.90  )
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
index 43658cc1347a..f086084202fb 100644
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
@@ -452,7 +464,9 @@ int acpm_do_xfer(struct acpm_handle *handle, const struct acpm_xfer *xfer)
 		if (ret)
 			return ret;
 
-		acpm_prepare_xfer(achan, xfer);
+		ret = acpm_prepare_xfer(achan, xfer);
+		if (ret)
+			return ret;
 
 		/* Write TX command. */
 		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,

-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


