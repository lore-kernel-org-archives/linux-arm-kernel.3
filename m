Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DFACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erbsC0Vg9mtqhwjoL7B+eBOB5DX7r/gCOj4pQxWk2VI=; b=vdC5+TIVeHsosaEgqwPlvB+MKn
	gZCUgRIxDV8frC48maxlklUxbNQFKR2NXFQoZdy70jjLXubavxfQiU3Q//+r8HafXzpIG21YAdysq
	BFa0KzIRUamUkY7tLbt/GD3M1dOflD3otfpUc9uU8GKc7bU78eddOTnN89AUZMH2DIhyvwiH/vGie
	GtgTLLCJNbp+mK67gTFnjxW9e0SYtAadgd8au5tQtvzUKM1XKj55PRLXWd5kQZwR+0gMneJsOV0cF
	+hgMZhlehCYhmLRkFrkTz8j1Hx/7bQb2YIv3u8CBADWC4CsSjKC3H9YoLYN+VAmjYEz37fc12fchC
	fXwDlGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIXp-00000004cED-0ldO;
	Wed, 27 May 2026 17:59:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIXm-00000004cDm-2PZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 17:59:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b4583f0a1aso87936635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 10:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779904789; x=1780509589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erbsC0Vg9mtqhwjoL7B+eBOB5DX7r/gCOj4pQxWk2VI=;
        b=EE/n8WWEnDx8Z2e6oemrCBzpJVld3ResRKsliuIf7vXy1s2c/Mi9qvCtMlydbJ0P4V
         OkpdTLS1xKxo/mzTuaakMEF3NCTyvYFtMgVUGvLXWULggc8pMr/NjO9zK8nGWzhYjllw
         ltNPndy+aN4HNjK2m9heGXzNueKoMwGCH30rak0ghU377BUQn2POuPPiwGtUIAUDkc6b
         02mSzwwWBTFsLwfLURhgwDXnTmTOrPBQqrWv1q0FhuEE9B1c3fg07zgMXei/EtF5/NWv
         GiiBJaWmze21a2PJwcNfUV/HtCRol6ZoeS/f17nbgI0g59oKS5shhsV4GECwCUE5Kv5A
         alhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779904789; x=1780509589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=erbsC0Vg9mtqhwjoL7B+eBOB5DX7r/gCOj4pQxWk2VI=;
        b=DCdRJKX5CNHVSrQBCqOc2BtWjJOGfbyu0V5A2uRGbaJIowKUiKQ/A8hRGth9E7HjM2
         3hSdrlegZoQCwbaP0bmowrJJxcixJLHhzq3mdnFQTmdBZGWTe4CInRR66vM6HSJWMPF/
         d3hOH+OJ56jemJHiRgbIaZDp5vhRkUWYLv7rwBegq8wL3GXn0qQD8zdemzA9fBFwGtil
         Zscg5mSnnGwPWNRKkK0JA1PP3VygElr05T4m75QYLVFWYUvPIEx1uuIHr3Ejshvhyrpf
         Q4wRFZtSR6VzWehv5lS5p42QmSxSdta8QG2CJuW1lNXxFd6pgaLNU9Bz1zOKSJSLAfAI
         S0Mg==
X-Forwarded-Encrypted: i=1; AFNElJ8Kxm0XFz8yOzz6c0xPVdIV96ym1xVtM22dT9YRQlh6WJEmIGRzgTvlRYxUggKChPfCppDw0JvILaC1UHAslElq@lists.infradead.org
X-Gm-Message-State: AOJu0YzHLbGeRzm/C8H8aWW99SXxyOmef6Zdft47Bej4QacHCdAgsh4m
	yGjgCPo1dixWpdg9yFeJlGd/pfhue57ctYeshjwLR9OdMZtPdMe1WJ1M
X-Gm-Gg: Acq92OGKzcvweLtrE2swidg1Ds3uv/PAHKr8o4GuUyjQ+0gPmz1wKz8U9+WPca0vcZu
	XrH2Vx58pFtmtMX0lVtj93mUOfbCzoVpAcBsReyrxAKzba8E/t5/D2xfsArY+O9Fg8xbKQAQAsE
	RFlhtOc1TG3m9EtHJGodCdbexQWkt/v+HnvPVK0mwi+fcNxdVy5VyBBHT/Ed5uxipeVZ4La1sv7
	5ly3YVWKemYTA5zcII62iLPtTKGGeVJR80499D0+6JwtdcQ6P3uNMSMliebrhR73xO6eNUPCpEz
	XqnMLki0ldSzATtgwK6K2/IyNNid2DjQzhGcr8MgavgB78qne5sZ9mYiKAmCIad3lIrUznYl/wX
	xoIyJxkYZnE5OCcVpfIDa1lhNBSI9eQ0m64y0mzNXRBXhMHqAIeWaQsCxTHLbvDHTzUkJ72qVbI
	AQoj+FbXC2piAUd288BWYpLYI6iLOqsAtGJVUA7i9I01yUq4EhnG/+Pgc=
X-Received: by 2002:a17:903:46c8:b0:2be:fe68:a1c with SMTP id d9443c01a7336-2befe680ebamr8852645ad.39.1779904788724;
        Wed, 27 May 2026 10:59:48 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.201.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm204648005ad.6.2026.05.27.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:59:48 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Wed, 27 May 2026 17:59:38 +0000
Message-ID: <20260527175939.2939714-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <53952f011f2c57ad28d6f864317054a2a34922e5.camel@codeconstruct.com.au>
References: <53952f011f2c57ad28d6f864317054a2a34922e5.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105950_624356_1D56836D 
X-CRM114-Status: GOOD (  17.01  )
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

put_fifo_with_discard() acts as both producer and consumer on the kfifo:
it calls kfifo_skip() (advances out) and kfifo_put() (advances in) from
the IRQ handler without synchronizing with snoop_file_read(), which also
consumes via kfifo_to_user(). On SMP systems this concurrent access can
leave (in - out) larger than the ring buffer, so __kfifo_to_user()'s clamp
to (in - out) is ineffective and kfifo_copy_to_user() can attempt a
copy_to_user() past the kmalloc-2k backing store:

  usercopy: Kernel memory exposure attempt detected from SLUB object
  'kmalloc-2k' (offset 0, size 2049)!
  kernel BUG at mm/usercopy.c:99!
  Call trace:
   usercopy_abort
   __check_heap_object
   __check_object_size
   kfifo_copy_to_user
   __kfifo_to_user
   snoop_file_read
   vfs_read

Reproduced on ast2600-evb (dual-core ARM Cortex-A7) when the host floods
POST codes while userspace reads /dev/aspeed-lpc-snoop0.

Serialize kfifo access with a per-channel spinlock: use spin_lock()/
spin_unlock() in put_fifo_with_discard() (hardirq only) and
spin_lock_irq()/spin_unlock_irq() around kfifo_to_user() in
snoop_file_read().

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Cc: stable@vger.kernel.org
Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---
Andrew,

Thanks for the review.

> The AST2500 has a (single-core) ARM1176JZS

Corrected in v3.

> Don't double-account for the bug

Agreed — the spinlock eliminates the unsynchronized window that
produces the inconsistent pointer state. Clamp removed.

> _irqsave isn't wrong

Changed to spin_lock_irq — fops callbacks always enter with
interrupts enabled.

> Can you provide more details? The 2500 is single-core

The issue was observed on physical AST2600 (dual-core Cortex-A7)
in production under heavy POST code traffic during concurrent
userspace reads. Since the x86 host does not model ARM weak memory
ordering, the race cannot be reproduced naturally in QEMU. The test
module adjusts kfifo pointers to reproduce the post-race state for
deterministic validation.

> AST2600 has a dual-core Cortex-A7, so your bug makes more sense there

Yes, the issue is intermittently observed on production AST2600.

Changes since v2:
- Dropped count clamp
- spin_lock_irqsave -> spin_lock_irq in snoop_file_read
- Fixed platform: AST2600 (dual-core Cortex-A7)
- Trimmed backtrace
- Added Fixes tag

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index eceeaf8df..ef6697a42 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -60,6 +60,7 @@ struct aspeed_lpc_snoop_model_data {
 
 struct aspeed_lpc_snoop_channel {
 	struct kfifo		fifo;
+	spinlock_t		lock;
 	wait_queue_head_t	wq;
 	struct miscdevice	miscdev;
 };
@@ -93,7 +94,11 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 		if (ret == -ERESTARTSYS)
 			return -EINTR;
 	}
+
+	spin_lock_irq(&chan->lock);
 	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
+	spin_unlock_irq(&chan->lock);
+
 	if (ret)
 		return ret;
 
@@ -121,9 +126,11 @@ static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
 {
 	if (!kfifo_initialized(&chan->fifo))
 		return;
+	spin_lock(&chan->lock);
 	if (kfifo_is_full(&chan->fifo))
 		kfifo_skip(&chan->fifo);
 	kfifo_put(&chan->fifo, val);
+	spin_unlock(&chan->lock);
 	wake_up_interruptible(&chan->wq);
 }
 
@@ -192,6 +199,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		of_device_get_match_data(dev);
 
 	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
+	spin_lock_init(&lpc_snoop->chan[channel].lock);
 	/* Create FIFO datastructure */
 	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
 			 SNOOP_FIFO_SIZE, GFP_KERNEL);
-- 
2.43.0


