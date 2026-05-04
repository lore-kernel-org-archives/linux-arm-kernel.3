Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E6ECD3430
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yeMW31xh2IrRZGJdOFJPgh5TF/3iY7D9q0BMKHUqLFA=; b=n5//TUb4lGSwX67z26p0Mmu4Df
	j/q6gGeBIWglgRU0tpvIyabPWabr6WC4lF+ILS4gzB6aw6QyMVUVf1Spg8iNecyISrLIPX1NwfGT4
	ovRKuekD8cYke6OQx6+F3+FvSxGWjTLgGls1rwjokPuLlMmC0BtdZ1OE9tmrFymV4rha4L9VnKIDx
	DPvUIhKp/jt+3Sspjz2CYqwj67xWDOZ/VjUMGLx4MOTTu8Vuafxced3v3fmZ8wqof9oNKLN2Ro1aI
	PcSFSVrpfv5Jok6cEI9s41LRlZc/o93pUNKIMbEpS27io25y9pgXdk3GQLMg9N3Gc2bqQ6zT+zf6x
	tq07nBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqLH-0000000CthL-0ul4;
	Mon, 04 May 2026 10:15:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqL9-0000000CtbQ-45Lz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:15:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso19995905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777889750; x=1778494550; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeMW31xh2IrRZGJdOFJPgh5TF/3iY7D9q0BMKHUqLFA=;
        b=PWUgBgcdzTu0WR4ri5gRL15kAavzbbZVpW3OyCsqmpY23DpeWURnCHPUpHQdKMY6Z5
         qZxwGRKQZuRCuTHlcOVjD3EPYZug8O46xQuy0u0llcUHx8VrDajvWwigFsGrbm+tnNyq
         ktuIo6AwbzotBfasnzJqygFyRNAx/z62IC8UWz8WUG1kf7zaq4e8nNTgo4waqFKM1X0O
         JHgMlYUPdYMw97Md2MgVpj3Ly4uuRGVJ/EPHCXGEmLvlnXlXByktLvl7SeCVvD1lLW6Z
         l5bPFIsrepaJU39JC1mYX+TR0ruKZnn9oUvLjKOjy3Q3Xzcax//Fwj+rO0F4kfb+DsMA
         7NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889750; x=1778494550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yeMW31xh2IrRZGJdOFJPgh5TF/3iY7D9q0BMKHUqLFA=;
        b=BbXYYCtj5PW0FAS8gs0BSiNC1SKzBGKBFBxMy3vme9GylxYPbmkkarzuU/aKFh0E9M
         35TyqPf9dOxaVX3i9jsnGSKl9cM4sNZHmoHJQ+VFXJVbIYye4Q+RmOsL8q45TdebU2UZ
         lLc8TkHad/6y+/D+qdG3R0L7oGltK65YKH/RDn7UdD7DbG6QBney/ZnD/lamophyP/Qg
         Do5TFFEAsD4rXQjKEcOygQyO2T4cBkjql7c+2tPUS8wBYU9nntDo/o50w1/dkiFmhRXE
         9NOZwAY74vTojiNHphC0q67AKbBMS3eTiya8MAFdyo4MAyITCiMvAdvreGyUruo5saUe
         CwyQ==
X-Forwarded-Encrypted: i=1; AFNElJ85QFX/sh5C8APGAAWLSD/hwhTIXa2PzA9MdE4viF2keLVWpsYpx8Uv/Oj48n+DxDeSkWtHvT7eIBKtOcKvPHSs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw9NW4TdPRdghIx57rTIGQ3vvCPBcoTol/E3yDuQ505MbqMwL7
	aBlh58u1X5P8c9LyunbA7v9rLqU6oNcrUCmmLx9qgiQwWyK77k/JzpTbwib8jrRFvsk=
X-Gm-Gg: AeBDiesWNLTsqtL12ETPiXpKlwI7K5lTi2Sv2q2W9zUQhy2SpkRPAEHUAItxQhrS/3I
	adO3tmWxj7CGAyVGdZG/8HXnpoIkoQ+tylZkuxI01YxM9dWiJLeclLzq+Xit0BqV3vddiSgpJqT
	605VQGfJ4m8SwaPO+b+InMcJKVwPRkhl8RbuZsMcF60bQFMmUJhkAZLYQnGMJfEir0R6mxNiPfg
	EXqLTPeLuLRuNUNsrYsLrwv6nBf5cFARIwtwKZvLKuXRfWL4sAP/mzA4tPJpVjyIMME575vwkfF
	6DEZEZcZ033gI0QGO2LpQeMtONRimb3F1YeXkQxNO0wy63fJUpkV1iqVi9nO8A/F7O14ZWynRR2
	KQ7a9ssAlsVQJRFWD7SLPgHCGd2CR2pGWOvE8lkv3oyftf+cPE6E3fZslwO1tg1b8MnFKD0WX5d
	Mc4gMXxlJ4eIWBneTG8a5ECyh4dEKiPoKszP37q/bTXtVIm00BlcxQHp54+4XhhmbM9RHJfliGX
	+nPgmn+T+w0+k0FFg==
X-Received: by 2002:a05:600c:4450:b0:489:fec9:a17e with SMTP id 5b1f17b1804b1-48a98874d1emr142393595e9.12.1777889750219;
        Mon, 04 May 2026 03:15:50 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a9879ef89sm28545366f8f.30.2026.05.04.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:15:49 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 04 May 2026 10:15:48 +0000
Subject: [PATCH v4 5/7] firmware: samsung: acpm: Fix false timeouts in
 polling path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-acpm-fixes-sashiko-reports-v4-5-529246be6b2b@linaro.org>
References: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
In-Reply-To: <20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777889746; l=3926;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=tcFrmEcYu2tzuwg42FiZIub27Jmrw6YPYJg6B/kafic=;
 b=byoTnQZ9OiajgkE1qADTMGG6v0P5Fdr56zuMUYOg3Q5Dhm6jmJ3RlDch4Q8PEZoRRi3hYRceW
 mdaoebfXMCoDO432C7dm4UjTiQdSX8QI2aM9laroHWs4R/gnxYG+MEt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031552_070207_75A17144 
X-CRM114-Status: GOOD (  19.78  )
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

Sashiko identified the bug in [1].

In the ACPM driver's polling mode, the polling thread waits for a
response by monitoring the globally shared 'bitmap_seqnum' using
test_bit().

This creates a severe bit-reuse race condition. If the RX thread
successfully processes the response and frees the sequence number,
a concurrent TX thread can immediately reallocate that same sequence
number and set the bit back to 1. The original polling thread will
wake up from its udelay, observe the bit is 1, falsely assume its
transaction is still pending, and eventually timeout (-ETIME).

Fix this by decoupling the polling completion signal from the global
sequence allocator. Introduce a dedicated 'bool completed' flag per
sequence number slot. The RX thread sets this flag using
smp_store_release() once the data is safely copied, and the polling
thread waits on it using smp_load_acquire().

Cc: stable@vger.kernel.org
Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Closes: https://sashiko.dev/#/patchset/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad%40linaro.org [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a9449bc33bd0..ad677962d10b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -106,11 +106,14 @@ struct acpm_queue {
  * @cmd:	pointer to where the data shall be saved.
  * @n_cmd:	number of 32-bit commands.
  * @rxcnt:	expected length of the response in 32-bit words.
+ * @completed:	flag indicating if the firmware response has been fully
+ *		processed.
  */
 struct acpm_rx_data {
 	u32 *cmd;
 	size_t n_cmd;
 	size_t rxcnt;
+	bool completed;
 };
 
 #define ACPM_SEQNUM_MAX    64
@@ -261,6 +264,12 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 			if (rx_seqnum == tx_seqnum) {
 				__ioread32_copy(xfer->rxd, addr, xfer->rxcnt);
 				rx_set = true;
+				/*
+				 * Signal completion to the polling thread.
+				 * Pairs with smp_load_acquire() in polling
+				 * loop.
+				 */
+				smp_store_release(&rx_data->completed, true);
 				clear_bit(seqnum, achan->bitmap_seqnum);
 			} else {
 				/*
@@ -271,8 +280,19 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
 				 */
 				__ioread32_copy(rx_data->cmd, addr,
 						rx_data->rxcnt);
+				/*
+				 * Signal completion to the polling thread.
+				 * Pairs with smp_load_acquire() in polling
+				 * loop.
+				 */
+				smp_store_release(&rx_data->completed, true);
 			}
 		} else {
+			/*
+			 * Signal completion to the polling thread.
+			 * Pairs with smp_load_acquire() in polling loop.
+			 */
+			smp_store_release(&rx_data->completed, true);
 			clear_bit(seqnum, achan->bitmap_seqnum);
 		}
 
@@ -318,7 +338,13 @@ static int acpm_dequeue_by_polling(struct acpm_chan *achan,
 		if (ret)
 			return ret;
 
-		if (!test_bit(seqnum - 1, achan->bitmap_seqnum))
+		/*
+		 * Safely check if our specific transaction has been processed.
+		 * smp_load_acquire prevents the CPU from speculatively
+		 * executing subsequent instructions before the transaction is
+		 * synchronized.
+		 */
+		if (smp_load_acquire(&achan->rx_data[seqnum - 1].completed))
 			return 0;
 
 		/* Determined experimentally. */
@@ -384,6 +410,7 @@ static void acpm_prepare_xfer(struct acpm_chan *achan,
 
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[achan->seqnum - 1];
+	rx_data->completed = false;
 	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;

-- 
2.54.0.545.g6539524ca2-goog


