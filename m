Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAB5CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpFJ2vgllIWj4FqG6DXjRM527rlfnB9NVugM5813YTM=; b=mxAHAyZ+ihLNTTUjIIeUjjo6gA
	hx9hyuA4Npe2SINSQ5hRusNs1bARwqRIzXNlEdOZDoKiUAvSOTyTDoz8rVNA+Ne25MTKs/eRFSw1a
	od3YZs7iWUq1CULTecbQHlpua5CT3TOnyD5T0TN2FMB8blXsPnRGI7rexUCmLMKatGinsCb5kv4Qs
	EdjW0e3ZzdAg85ldfJ1PSzbiYz4eHNSCN9oVJQ5WjLaw71nEpndyCg6hfyBRbW2y6uRw4cai6DKA+
	rDzFTqCWunA53BiDjjHVInClmMGmTBDRLV/5phRmerWyiYpUppeUOLd+M4VZZCpxjwY6K/l3HN7PQ
	7CMWqo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU284-0000000BAcY-17xW;
	Mon, 01 Jun 2026 12:52:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU281-0000000BAbd-1QXO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:52:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2be1dd4af34so147577585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780318343; x=1780923143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JpFJ2vgllIWj4FqG6DXjRM527rlfnB9NVugM5813YTM=;
        b=BUsHfWoiOyDo7DAmLMIDirGGZ+mD95HZ6lN8o3x8bLYPJrCiOgXlcLkhPC5Cl6wn+w
         n8502AvTNlp8LDQLEmJHi/NNVVO2JUz31C8AzbO2WTBT2ALhlyvHbfPIfzLCMblbYfzJ
         4LgR3I6na6m+NJlbRCl51PcSpTp8R/DNDTAdEAfypHcMh1VUZyOIbyVdcDRjrgylpBc6
         VLnL6Xyop7fh8EQX8IpahmOlg4SYWLBJc/s+/p6bF47Bcrpq+S7WUdUmevJhHgP+0NTT
         Sb6Qew0D4CyQrGrWv9sdGsEJT4a2+M4nQWmBuUTtXrKFbBStjJgpqBwUQT+QMoIW8Jcq
         aGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318343; x=1780923143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JpFJ2vgllIWj4FqG6DXjRM527rlfnB9NVugM5813YTM=;
        b=q4mWEqaGt9FBE2rmgI/IkAVhlBUlT5ocLAzYsNN1PLkJDrVlfC6kc70M6qkNsfwxTI
         EZm8UHG8P9j3uC8hvU7reymDlTr78HngOvjtoBBHToD+jeRm/2aTq0ptlPCUIrd99xK0
         8wEVvSMaSKFlvhgMULbuQ76mUWlpZnd55XnTfa97OghCrlcUgok/HRGwAVJM8HaDnmUR
         h/wPbxwm/6dcVv1nsRuqsKC+1bKnxYCTx351IidDjiaJsMgYTc0kweLeHMCnNWK+fQSJ
         C4skOHeUSyiOowRG4Fao5Cq7IrFqcP6Z8RdDGjF6hGMvqRfiVsm+61skc8+pGVjVfQAL
         VqzA==
X-Forwarded-Encrypted: i=1; AFNElJ8N2nJ/NydWL611hL1lC/41evj15awHO/GYz5mkp8/c0aA0eDiv4GllW3B6xaXyL1XBSUb4aWP5jv4+85mVjfHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwmPp5+armtOc40Z7UZFPobpmwCvS9AfpbeZC7xxB4z7w/alGOY
	Y8Wy0q6lroKma4ouZhv+9py9wCLWrD6sbLmpn22t/d9fQ2fSzUf19f4d
X-Gm-Gg: Acq92OGf5VwCbcOiC/kVrFmEm5bSuwLWf1oMaCpkhcB1iJabPmzc+thS+Buw2B6zA8p
	mlB4lrEq90HqyzPc76wqKgobYEliBCZzjPeK42GkWwTHWXy+cNHD11w/msk5kXmQTMyu02tYdHk
	8Lv7ZfrDliYdF/ncKTcVUcqo7MjhtLLNGlZWp+ByE1TORi0bGIUct6Vq0s34b8xk5i78X1Z0sHj
	0/bAZoz6BVqc5mkLCZ86L5HMa4KPJ6XDG//H/mZtsZWUmi8ZgbEQ9O5GSyClGcA4XviHGvqnxpk
	owKIcCDeYPdk968r0uvo9SbUAw4lBtFKGmqBbf4w0X3neG6ogyrNSc21W1/WcArFYn9/wYGeLxa
	tqgYzGLSNT/ckG1r1ow+rn5VN13qpslufBuRhoEFkkVh7jDVM9Rwkj32o9jJ0IHm9KoN3H3b3IR
	EgOroH9ipqgD4/RQxDLxjb9cNZKbWV867qz0IXf14xLpwF4/xka0Y6qiBVjXtlxroeXIY=
X-Received: by 2002:a17:903:1905:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2bf36803dccmr130037915ad.24.1780318342942;
        Mon, 01 Jun 2026 05:52:22 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.200.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf7b6609f5sm85932415ad.60.2026.06.01.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:52:22 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Mon,  1 Jun 2026 12:52:13 +0000
Message-ID: <20260601125214.2071019-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1e2b77c7916259e3e269d19f637c29427c175350.camel@codeconstruct.com.au>
References: <1e2b77c7916259e3e269d19f637c29427c175350.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_055225_436268_6AD07723 
X-CRM114-Status: GOOD (  18.69  )
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
  kernel BUG at mm/usercopy.c!
  Call trace:
   usercopy_abort
   __check_heap_object
   __check_object_size
   kfifo_copy_to_user
   __kfifo_to_user
   snoop_file_read
   vfs_read


Serialize kfifo access with a per-channel spinlock. copy_to_user()
runs after dropping the lock, since it may sleep on a page fault.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Cc: stable@vger.kernel.org
Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---
Andrew,

Thanks for the review.

> This seems inappropriate and I expect is flagged if you compile with
> CONFIG_PROVE_LOCKING=y or CONFIG_DEBUG_ATOMIC_SLEEP=y

v4 drains the kfifo into a kernel buffer via kfifo_out() under
the lock, then performs copy_to_user() after dropping it.
(cf. drivers/gpio/gpiolib-cdev.c, which drains under its event lock
and copies outside it.)

> ensure you develop, build and test on recent releases

Tested on both v7.1-rc5 and v7.1-rc6 with PROVE_LOCKING,
DEBUG_ATOMIC_SLEEP and HARDENED_USERCOPY enabled: read path
round-trips correctly, no lockdep splats, no atomic-sleep
warnings, no usercopy aborts.

Changes since v3:
- Replaced kfifo_to_user() with kfifo_out() + copy_to_user()
  to avoid sleeping under spinlock
- Rebased onto v7.1-rc6

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index b03310c0830d..0fe463020e25 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -74,6 +74,7 @@ struct aspeed_lpc_snoop_channel_cfg {
 struct aspeed_lpc_snoop_channel {
 	const struct aspeed_lpc_snoop_channel_cfg *cfg;
 	bool enabled;
+	spinlock_t		lock;
 	struct kfifo		fifo;
 	wait_queue_head_t	wq;
 	struct miscdevice	miscdev;
@@ -115,6 +116,7 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 {
 	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
 	unsigned int copied;
+	u8 *buf;
 	int ret = 0;
 
 	if (kfifo_is_empty(&chan->fifo)) {
@@ -125,11 +127,22 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 		if (ret == -ERESTARTSYS)
 			return -EINTR;
 	}
-	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
-	if (ret)
-		return ret;
 
-	return copied;
+	buf = kmalloc(SNOOP_FIFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	spin_lock_irq(&chan->lock);
+	copied = kfifo_out(&chan->fifo, buf,
+			   min_t(size_t, count, SNOOP_FIFO_SIZE));
+	spin_unlock_irq(&chan->lock);
+
+	ret = copied;
+	if (copied && copy_to_user(buffer, buf, copied))
+		ret = -EFAULT;
+
+	kfree(buf);
+	return ret;
 }
 
 static __poll_t snoop_file_poll(struct file *file,
@@ -153,9 +166,11 @@ static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
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
 
@@ -228,6 +243,7 @@ static int aspeed_lpc_enable_snoop(struct device *dev,
 		return -EBUSY;
 
 	init_waitqueue_head(&channel->wq);
+	spin_lock_init(&channel->lock);
 
 	channel->cfg = cfg;
 	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
-- 
2.43.0


