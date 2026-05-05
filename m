Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EB6CD3440
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XbpOUBhAHisNgJxpl8N8vXVEUriSOoMRSDM7NHjdJoU=; b=OjRKIIQg56N+/Fx3um23+iHgMX
	lpZZc9HIBEfLxVK1Q+Uz/KTc5rlxeBjYP/S3slTVJtbrTCgaMBzJkx7DgIe4pmijJ+L3bdyWOQl4E
	I9aqNa/uHJjDrcDVelc03rpjqfta8YUzniz4NMcrdQlh07SZ20nAsPmDQJAV6ktGDmU3+ofumqV7S
	pe9x2yhONtJleT+kvqq+btznOWSCH2TNwSdFg/I9YaFsWYLsoaDrXjtldQlh7JfvmGpS14OTZNQvh
	4ytWpXiwV1d2Wju6wDW68z0H0Au3BnT4g/jAj7fMIsZOO0vdOWf+iegrUPlqOs77uM7xfebuJ/czz
	A6l23Vug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb7-0000000GIHi-1Ivb;
	Tue, 05 May 2026 13:14:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb2-0000000GICj-1Oil
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48374014a77so62231365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986835; x=1778591635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbpOUBhAHisNgJxpl8N8vXVEUriSOoMRSDM7NHjdJoU=;
        b=MfND7Xw9kjwBlGcCjFfK8Qhm7qSQwFJsSQPwxbHSVzoiQrrTadXRQk2sHyTyxVu3WS
         aPEg61ggZgbexyEArm63fGGx8ejF75Jc++qwp4EWbC9SZpDBSoektRGF4A2FNF2uzw3c
         RbzPB3KFOX0Opht5x7AL1h4gOjxb0IB1EkjdpeCwLJzO6ozPw8BGwJSpkcMLBmvj969x
         nj64Bbdb1luMsqcImoM0IvlYVACC7gxuQCZv++rjxktSyef116XdK48RPPXo2Tj76K+c
         HCMSbcMmBmHHip/kkI6rRcD/VYS06PfoCV3htMGexBjnEzlcF8DPFqwFkvy2Nsmgd78Q
         7iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986835; x=1778591635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XbpOUBhAHisNgJxpl8N8vXVEUriSOoMRSDM7NHjdJoU=;
        b=LV0bAWpZwMXjcAWQEDDYXW5hsVZr0UcyLwIqVAwDcgbKOhfgS7vYyr43vRR+4KE8m6
         iVv4wbsoYPzKTk/gL5KxvxUummH4sSobuiC/heuH2jX4rgkC5och1sCmokFHo85kGaxH
         kp+y7oTT2NaQaebUiWX71wjMmo2IFDSxWDYEWgX/81HEisGSzl7QZBg2jpqjXxaGbe8i
         EiX0XQwiwnapXEHmbkL36zfSSC0dB/U+quBC15YkT0JA3EJMmreDEa6MIdQUkKpiNB2K
         hJd/CGhd8ZCOOazYjAlHASvOhMOMCVlFv9c81IKf8+X6UMhNEj1mg9Dr9b9RspFaxKJt
         UBEA==
X-Forwarded-Encrypted: i=1; AFNElJ+fhBWBn2cwF7cF0WsG3qzJRKqPOkiCFO50o/wDyD2+VW+d8Wp8q/1pPANJq44wKzhxTPLKr7XTcDwc8+VIc18N@lists.infradead.org
X-Gm-Message-State: AOJu0YyC9x8N+BsEphIQ7iqL+HvbQ3vw9GvNbUq3fAFM++gIRdtOwAKv
	KiBKMtZ5ZscuS95enR30q9TIdEm5ub1oK8YhzToSaXsMnzb7e5DkWwd1rs3gnBsAfKg=
X-Gm-Gg: AeBDietQfYtG0gthk5ePWkXwsFfqqGAdXUsxDqR7tTz7fBsK26xofs/0Kt4tIX7zcod
	N2jJgf6elgLxp7usCGsXukIiyP1pyL20QCVJMNZM8b2c2ELzXMnSnVtHsqzgrxDcK4zQKc9lfsN
	Ty2EBm/PJiOjZqYB2esYSf3vT8bnrY2Pqz9VbqvR0LtvRtXh5uEHLHQcVqN/GzEUCm/TzeUP6yL
	P5R/93Ix4YnlAcCHa9CbTf0Nuh2ogUnDmXmPkNKFBG6joCHiIlAcFQIBuv+a25Anw/phYAt9v+t
	I/3T0d9+uz18O7vLJMtBS31ZaclfSHWKVpF8vrkxvtrHeVQDzY0S4XZ0TtRxh6LcE7i9tYXD4zt
	4zdDoiAcyX+KszzcDvhl4fMoF7utwR36cYVgr2Gau/G2+Omtm2w+k7PW+qgBuDW9EpMoqAYbZvJ
	2zoVmrIF4i8WxurAuzsFp373AkGbV9/2G9m0KV9UyxIJzNZVw81VDEu9/zYXmUKBd4L0chzoETY
	+cK9LJoN8coAP/8qQ==
X-Received: by 2002:a05:600c:828a:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-48a98638119mr230594515e9.9.1777986834642;
        Tue, 05 May 2026 06:13:54 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:54 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 05 May 2026 13:13:03 +0000
Subject: [PATCH v5 6/7] firmware: samsung: acpm: Fix missing LKMM barriers
 in sequence allocator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-6-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=3932;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=PCWsEmI/WUR42uueqaiei2Cmh0aP35hqHHvduAG7Yz0=;
 b=6xEALCsBvLgFLhQqxJE6EKeqjKKLMRa/BgZwjSGhuyo/8qCLag5h9khWX13dP5jGqQFFSnkGf
 zLyzE9iH3B9AXvc8+kToq57C7FccRBTmsZom4GoFmepT6jQmeA5ZBD1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061356_412250_E54E0408 
X-CRM114-Status: GOOD (  16.53  )
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

Sashiko identified memory ordering races in [1].

The ACPM driver uses a globally shared 'bitmap_seqnum' to track
available sequence numbers. Even though threads now strictly free their
own sequence numbers, the allocation and freeing of these bits across
concurrent threads are effectively lockless operations and require
explicit LKMM memory barriers.

Previously, the driver used plain bitwise operators (test_bit, set_bit,
clear_bit), which lack ordering guarantees. This creates two race
conditions on weakly ordered architectures like ARM64:

1. Polling Release Violation: The polling thread copies its payload and
   calls clear_bit(). Without a release barrier, the CPU can reorder
   the memory operations, making the cleared bit globally visible
   before the payload reads have fully completed.
2. TX Acquire Violation: The TX thread loops on test_bit(), calls
   set_bit(), and then wipes the payload buffer via memset(). Without
   an acquire barrier, the CPU can speculatively execute the memset()
   before the bit is safely and formally claimed.

If these reorderings overlap, a new TX thread can claim the sequence
number and overwrite the buffer while the original polling thread is
still actively reading from it.

Fix this by upgrading the bitwise operators. Wrap the TX allocation in
test_and_set_bit_lock() to establish formal LKMM Acquire semantics, and
pair it with clear_bit_unlock() in the polling path to enforce Release
semantics.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 2dea9b7bfe91..fd2e46e9f7e9 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -8,7 +8,7 @@
 #include <asm/barrier.h>
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
-#include <linux/bits.h>
+#include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -344,7 +344,7 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 				acpm_get_saved_rx(achan, xfer, seqnum);
 
 			/* Relinquish ownership of the sequence slot */
-			clear_bit(seqnum - 1, achan->bitmap_seqnum);
+			clear_bit_unlock(seqnum - 1, achan->bitmap_seqnum);
 			return 0;
 		}
 
@@ -401,11 +401,18 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	struct acpm_rx_data *rx_data;
 	u32 *txd = (u32 *)xfer->txd;
 
-	/* Prevent chan->seqnum from being re-used */
+	/*
+	 * Prevent chan->seqnum from being re-used.
+	 * test_and_set_bit_lock() provides formal LKMM Acquire semantics.
+	 * It pairs with the RX thread's clear_bit_unlock() to ensure the CPU
+	 * does not speculatively execute the rx_data buffer wipe (memset)
+	 * before the sequence number is safely claimed.
+	 */
 	do {
 		if (++achan->seqnum == ACPM_SEQNUM_MAX)
 			achan->seqnum = 1;
-	} while (test_bit(achan->seqnum - 1, achan->bitmap_seqnum));
+		/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
+	} while (test_and_set_bit_lock(achan->seqnum - 1, achan->bitmap_seqnum));
 
 	txd[0] |= FIELD_PREP(ACPM_PROTOCOL_SEQNUM, achan->seqnum);
 
@@ -415,9 +422,6 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
-
-	/* Flag the index based on seqnum. (seqnum: 1~63, bitmap: 0~62) */
-	set_bit(achan->seqnum - 1, achan->bitmap_seqnum);
 }
 
 /**

-- 
2.54.0.545.g6539524ca2-goog


