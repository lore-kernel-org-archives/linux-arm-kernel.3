Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCB5606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3WYtk2Y;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=tU6wexFD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lBty04VWGx6OTs8IxjT6/mXezzwuQfDiBt+l30CB91E=; b=R3WYtk2YOJZI0F
	BWUAvtKsz9MrxmXbROYX8fgys9ADo/sVTv3zubtz0vJn6WqRqA9wvGjbhqDwIHESbQnFsEFEYiGsg
	USqD6sNk+HPb384ShljMZAXj6KS78Blvewu+JFLfVDxa+JDu5LNbbIODfcwFg2ejqqv8DFEGNyF3X
	mVhi12SwDgWzDyeiIfA+2vEQrHh8bLBMZB3m9xG9HEKKrFBow9uwS33MDq5ZOUTVareZs7h6VU8mA
	cOStl0VtF1nM5marVuBC+4OKnurqN94ZARXHJJV1Mdm5CgqtLBXVV8HJ8eIb+l24/d3XqXD3eIz6A
	6xeKPT+XnnzH5JakAydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9uH-00000001Xkv-3qkv;
	Tue, 03 Nov 2026 08:30:13 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u7-00000001XcR-3T32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694610; x=1825230610;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6NQ+JCrUKfrA7uFLiOTfNzx/YP0EhppYPV0YnJM/iC8=;
  b=tU6wexFDy4aP82imG3Im+MVZt+Bx6YWy0k0gPYk+ZZnGgSaxkMEMq/kk
   1Iv3E9L1BxXeVRV5LT+r41ISc4u90bNQJNXEmY59+WQfuiaSdqLhlM94f
   l3CJpcZIQg4oswKFELTnipd6er0UfA1P+jXRedCApelw+TN2M776vlvOw
   rg7YqadcFuJ1K1PLG0uQ4WPGe/+Vr6Nm1oSifN0t82TzNY1dLHz2gOPNR
   NikT5UIyoXTk+RiG5SSPV1tXMvF5EsPoVWiIax5Wi7h4+fUyrb8IaCPDH
   wb4vQ772pH6RjPeIuiXMNuiuCnqzCZDeamzzAEowel+XLMwZ3EuE6M7Na
   A==;
X-CSE-ConnectionGUID: wuX0ZJnZTHyhAAIkiW9XjQ==
X-CSE-MsgGUID: EkGu9RRxTMeuti8uevDl4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:30:07 +0200
X-CSE-ConnectionGUID: CTAxmoEyTR6UyFIkVF/rng==
X-CSE-MsgGUID: Z2v27LxZQs+5B/Dvmx/71A==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 03 Nov 2026 10:38:00 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:58 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 03 Nov 2026 10:29:44 +0200
Subject: [PATCH 8/8] i2c: nomadik: reduce FIFO flush timeout to avoid long
 interrupt handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_003004_575520_F29EBDF9 
X-CRM114-Status: GOOD (  20.82  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In flush_i2c_fifo(), the driver sets FTX and FRX flags and waits until
they are reset (these bits are self-clearing). If after the first read
one or both of these bits is set, it waits until both are reset. The
timeout is 10 * I2C transfer timeout. I2C transfer timeout is by default
200 milliseconds. 2 seconds are much more than needed: as stated in the
comment above, the flushing operation takes just several cycles before
completed.

flush_i2c_fifo() is called from init_hw() that may be called from
interrupt handler. So, if the I2C controller is stuck and the FIFO does
not get flushed, the CPU may spend up to 2 seconds in the interrupt
handler and cause watchdog timeout or other unwanted consequences.
Moreover, if the interrupt is handled by the same CPU core that updates
jiffies, the loop may not finish at all.

To avoid too long waiting, reduce the timeout to 100 microseconds and
use read_poll_timeout_atomic() instead of relying on jiffies.

Fixes: 3f9900f17cdb ("i2c: Add support for Ux500/Nomadik I2C controller")

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index cc8b5a357f06..1f332e66a243 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -278,9 +278,8 @@ static inline void nmk_i2c_writeb(const struct nmk_i2c_dev *priv, u32 val,
  */
 static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
 {
-#define LOOP_ATTEMPTS 10
-	ktime_t timeout;
-	int i;
+#define FIFO_FLUSH_TIMEOUT_US 100
+	u32 reg, err;
 
 	/*
 	 * flush the transmit and receive FIFO. The flushing
@@ -291,21 +290,16 @@ static int flush_i2c_fifo(struct nmk_i2c_dev *priv)
 	 */
 	writel((I2C_CR_FTX | I2C_CR_FRX), priv->virtbase + I2C_CR);
 
-	for (i = 0; i < LOOP_ATTEMPTS; i++) {
-		timeout = ktime_add_us(ktime_get(), priv->timeout_usecs);
-
-		while (ktime_after(timeout, ktime_get())) {
-			if ((readl(priv->virtbase + I2C_CR) &
-				(I2C_CR_FTX | I2C_CR_FRX)) == 0)
-				return 0;
-		}
-	}
+	/* This may execute in interrupt handler, so use read_poll_timeout_atomic() */
+	err = read_poll_timeout_atomic(readl, reg, (reg & (I2C_CR_FTX | I2C_CR_FRX)) == 0,
+				       1, FIFO_FLUSH_TIMEOUT_US, 0, priv->virtbase + I2C_CR);
 
-	dev_err(&priv->adev->dev,
-		"flushing operation timed out giving up after %d attempts",
-		LOOP_ATTEMPTS);
+	if (err)
+		dev_err(&priv->adev->dev,
+			"flushing operation timed out giving up after %d microseconds",
+			FIFO_FLUSH_TIMEOUT_US);
 
-	return -ETIMEDOUT;
+	return err;
 }
 
 /**

-- 
2.43.0


