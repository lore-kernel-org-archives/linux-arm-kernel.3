Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D043CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTcuuyPM1STHES+1Gqa4UfN+n+nje0Qh2APGzRVoQg0=; b=40ctRqe+cBOQ2QwgtmkfI5tTHm
	0Q3YbS08fddnro1jZSJ0hscRUgvLSvRvIdVNkPRFchfrt0mLsReeDib1MrRvu4A3vYVY65ADv1eFi
	LCMAPZXhVwatSy+niQiLKtIoyxuUMNORG7rX6gRa+FdyDbCmwF53V5qMG4u52wbyYe+BN/oXfoGRO
	/6Pki+dMHf8O3dhFaGDF3qtEYlGFEwao+1TA9JQM3SKe3BrOo7wsvuWZQre+PTpxkNwYaMqyxNO6X
	0A4/bjHoUbz1P60pbXS0hiRc+2kTj6BUTzLFw3Hmm0vBZ5i/XzZkm+UubsI4C7i+HSGuY/G5+3bt2
	x/BV9LRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLG-0000000CtgU-1vDI;
	Mon, 04 May 2026 10:15:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLA-0000000Ctbi-2tTJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-449de065cb3so1461602f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889751; x=1778494551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTcuuyPM1STHES+1Gqa4UfN+n+nje0Qh2APGzRVoQg0=;
        b=CfQTBb3HfNUqBOEUWhTeADuD/bh3CdnpX1X3PtNngQGRhqfvlMw53dseKurQUWOxzP
         mEV+1cif8HPSmGXPuFuw9QhONeTEo78k4dy9F4ZEs7diTD5ufcRrjbkEN6f48pR8RKry
         TyfoSqGPmnctBV28IUgcM6tCLwH5J0qolGkxcQIrBrGRs5DFVdTzoH6PSZw1DqDPmTLp
         5YN73m42/xh9i5e1uD3MCriFXpcwssiJs7scfteSbZdTdiG/zHVO2VJPE2OsABWMGlDp
         opHIgQ2RnhOcXHp25cIRDOBjzKq93zRBsio9lefvKVt+MsmyWos/5GNfDaKia3sfGXtu
         5bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889751; x=1778494551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nTcuuyPM1STHES+1Gqa4UfN+n+nje0Qh2APGzRVoQg0=;
        b=hbIJ3EKv3BX/Oeutvi68wwvaeEjvgNQsqnvwSGz/T2nuv/D7e1LPh6l39LzvA07rzP
         /1mOpctmy3YG5VGjYUyLRuK09bPklaLzzIzSvrP0qn49yJIFVuEuFBep7FLqx5SGSNHU
         N4llQOsx08ufipMpEG/y2h1lOGx4bgwaquo8bJ9MPU9MicF3ipO4IBOsse0aldpUiVne
         L9Gchik9VUo/+Qfy0/ltN3MLWCS6SenvOEGntAnktLFGriHOnopAAQ0hfGu1dSSViVP2
         P3jbbVNL4G8EQEqtvqDMTu+FsFhae2i+2sYC5qlp2txrlnSqiVjNCi6awD02P76RAPCt
         przw==
X-Forwarded-Encrypted: i=1; AFNElJ/8pBSOXvTbEjO5BeShhD2FWjzKO8Ocfm3KkCD6sKfU1vD03k7yNgA3ooKL4+/Kitz/PTlRZIqfyl8qmy7ilYrz@lists.infradead.org
X-Gm-Message-State: AOJu0YwUHp3+/Cl+Lu2+oAvG7aZ8LiL+aGID3GUdG+fIwG8RzUJ5eNsh
	ILo9Tq1Lu1u/srVhW0eDhDQ+y7WHWTMZUfRwBkjyRqHvrlZ2oGVMtQXpkShgwjJW1wQ=
X-Gm-Gg: AeBDieufKm8HZ7edjMJ1/TF/cWCXDlyn6oXvZap7W5Bgztv0czS10/paFieWW+8sCbx
	5+9pYrdoUBPOr0iTDYXi0C8u32LK7UuT1zN4Xl/282ca7Lhr7AGOotPhNwxDCbxDDkTn7pnc0jW
	LtZO9HBq78dYg9+MrwoAZwwWBniwTbWnO3AhqVsmZ8fhJaMaI5OqCRp9na4BurekpOCsoqJDQH4
	MUH+NB/cW7BRT+Xk62HxDnP3ZdwcH2e/zu9XD7ES6BCCZma+fz8nDvdfR/LyR5lFy28ALAY5omP
	DmPV7NAZkL2+OPlKWWmbtz9OpXw8HWAhBfD2IMMLBtb98E1nrzRe5kWCHbIr/43XJGhN5MP372O
	iD/ulFTQYCdYXi7NZoXTncaIl/Y3g+ph2U508E+f3uxWUc7rgdna6H8AAWgCETI71EzJ5P++UfK
	Xu4r/Q5Pfp7I9tAe0EZ6GpxJZEzUl7BbuQ1h8d+BEKkrV/G0LzYlfx95uSucwkpZUR8qnXcDGfI
	nwYxL8+eSx0fzHTTQ==
X-Received: by 2002:a05:6000:2909:b0:43d:7a08:a5f8 with SMTP id ffacd0b85a97d-44bb716f0c1mr14231907f8f.35.1777889750758;
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:49 +0000
Subject: [PATCH v4 6/7] firmware: samsung: acpm: Fix missing LKMM barriers
 in RX and TX paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-6-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=4822;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=S69mcWVdJW47YZsriq5gOrBQLK0ksV3oXVdlIgpsiSo=;
 b=aU0EI1Y314zHAtNas0QYLUH/hfpwP3SCJGJfFc2yuOk2ibOlWMkcTfPdNUELSV9TnyxJXuHQO
 XXPyGVIV0+RCdG6SnrRIXTl/fC/wZ0LIKWwb5d/1//ymnkDUo353pBx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031552_761542_45BD611C 
X-CRM114-Status: GOOD (  18.39  )
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

The ACPM driver relies on a globally shared 'bitmap_seqnum' to
synchronize sequence number allocations across the TX and RX lock
domains. The TX thread allocates bits, while the RX thread frees them.

Because these operations cross lock domains, they are effectively
lockless and require explicit memory barriers. Previously, the driver
used plain bitwise operators (test_bit, set_bit, clear_bit), which lack
LKMM ordering guarantees. This creates two severe race conditions on
weakly ordered architectures like ARM64:

1. RX Release Violation: The RX thread reads the response payload and
   calls clear_bit(). Without a release barrier, the CPU can make the
   cleared bit globally visible before the memory reads complete.
2. TX Acquire Violation: The TX thread loops on test_bit() and then
   writes to the payload buffer. Without an acquire barrier, the CPU
   can speculatively execute the buffer wipe (memset) before the
   sequence number is safely claimed.

If these reorderings overlap, a TX thread can overwrite the buffer
while the RX thread is still actively reading from it.

Fix this by upgrading the bitwise operators. Wrap the TX allocation in
test_and_set_bit_lock() to establish formal LKMM Acquire semantics, and
pair it with clear_bit_unlock() in the RX path to enforce Release
semantics.

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index ad677962d10b..6fc6175b8924 100644
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
@@ -210,7 +210,12 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
 
 	if (rx_seqnum == tx_seqnum) {
 		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
-		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
+		/*
+		 * Enforce release semantics. Ensures the payload memcpy
+		 * completes before the sequence number is globally visible as
+		 * free.
+		 */
+		clear_bit_unlock(rx_seqnum - 1, achan->bitmap_seqnum);
 	}
 }
 
@@ -270,7 +275,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 * loop.
 				 */
 				smp_store_release(&rx_data->completed, true);
-				clear_bit(seqnum, achan->bitmap_seqnum);
+				/* Enforce Release semantics for payload reads */
+				clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
 				 * The RX data corresponds to another request.
@@ -293,7 +299,8 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			 * Pairs with smp_load_acquire() in polling loop.
 			 */
 			smp_store_release(&rx_data->completed, true);
-			clear_bit(seqnum, achan->bitmap_seqnum);
+			/* Enforce Release semantics when dropping unneeded payloads */
+			clear_bit_unlock(seqnum, achan->bitmap_seqnum);
 		}
 
 		i = (i + 1) % achan->qlen;
@@ -400,11 +407,18 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
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
 
@@ -414,9 +428,6 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
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


