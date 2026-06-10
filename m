Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B6FCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSnU05LP4qr/miE9bcmCtKHpcKuotIP+m7Vp5isT2ME=; b=ufmDkEirtapqUBDl1Sik06KR9G
	yJxcxctsML/XlQK7iISOmktTSJqNkoqVEOc3U9FkSxLy89F1DaaQkXgP0dkSo3Vdo9Vet0Nb3Bnyu
	cw/KatTZEGDMXXjuCNsNLtHmjXkrTNwW0B3gMdcCYavLFDdjmR6M3ohgi5HaBxMdbTayHB/PDfQHU
	mCnKerW3TAnNmL227R2XRYzfgwGul+LuJVi/lo7ss1AHs1zHXj7zvJ6fHLqh50LwPGMKBO69Nlc0e
	g8UTzw9RpK1ErPcgoMqG2DO9+I54qmLs4YszKV3kYcQyzg00qRkqAUVCBDfwugcz3PzY5CmlfIpNW
	fch5cd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMeE-00000008BaJ-0R0u;
	Wed, 10 Jun 2026 17:23:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXMeB-00000008BZw-44eV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:23:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c132ac5ec2so69836085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781112202; x=1781717002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSnU05LP4qr/miE9bcmCtKHpcKuotIP+m7Vp5isT2ME=;
        b=HY8GL4pUMsAlIthtgggFv00MDHgznT2J/GiM3N1XKpFX3gehUga5jYAiM54NoEvCHv
         vHLiHVxtkpkeic3MmoYc52rEiY1t021ps0KGdQCayHVMee5FaWGPcvUO74AY4GC7/BqP
         1Hc1vzzQsBDDP4oVFMEmEQJwqx7qG2BUoBc1AVdEnbLRr/Ba5HFGf53E209DUSGP1fY6
         u4G1aaCGKNHS8CC4XtZOjFoVSpt+mUsSVq0ZLK146TOU7fajdgV6c2Bil66A8nGbHOtx
         jbNna3TKUeIz2/KyHWFx24G4r44doqLmMvUov/cpcb+ifSLxPYm4kCSvrsyoHHym5f3S
         M+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112202; x=1781717002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSnU05LP4qr/miE9bcmCtKHpcKuotIP+m7Vp5isT2ME=;
        b=BHe50tO3PJgBAVyKcFmUllslBT0T/xil1ydzV+qb/MDUNPcU4TTUSNZTdlerJugyxj
         R9lH1CAkUC66M796QAuDafkAxGqYLSmiLoS7lXJ4R3eNvUJrZ9OEDkLjmSROf4PzlUne
         ZjsUOfGVET5vYa6ayHqeCXTb87Zw56uLAxe5wX2W+04xhyPftPomLY6xUNpnlD0GtoEN
         xlQKUgcSVYzOABZl8YTTsqbCSVd5XCexjXnAAVWMMGgv9eDH6hy3gy69K3DR5Aj1GgJP
         ++JYy7uDomHzJaaxsV/wVPYJTLOCAJZgfpmUUFQC6sXgOp4l2vV1EPWOdncZ+b5STy+A
         qpYw==
X-Forwarded-Encrypted: i=1; AFNElJ9+yhKisEUzAmPpZIP1CLQt/Xk5ZEEicHi0vNGNwTiOL/dRNcT2uGoxS27Vyw1G1+TzOCJl3nVDzrqsEHPBzXol@lists.infradead.org
X-Gm-Message-State: AOJu0YzkUix2rI6O+Iy5dr4YS/KqMfg+kZpT1V0ebvG3y3Uf8oYln9iS
	feIp41GXyN3S4PlR0BCoJTTutYReacME3BVEY1hAyIjKVAcvNCP0m1Sh
X-Gm-Gg: Acq92OFa12W3g5OUHojSiqU5figb7ZjZsMie6/X/0363tLITY4JjlMpuvywTF+OCZhm
	eneO0joKkT+AGAqyZZ5bJIIqrtfy+vmBJrXaeSD0+MVo1j+fHSeSMm6BPh8BQDahRFM5ZoNViod
	Gm9N4Ik2t3A7GcjX/C6c+BUEuqTDygQl8QK03myo1VOWwxL0cozKAYnhNMDl9pvHD9U1sUeOlUG
	6vcz5ggL1EVw8qkYmdPnDBWbLOFaZ5vIq0sf781IVLMj5Wyw/K1DC0BFi+tApi5EF5DuJ4ggkD7
	2Nj62UxRanFHV+UZhET2V7PEnNvS8XbOnlk1LepMyJK3fcUMZNRVayAX6zZp/FEJs1mHUR16X//
	ufG9Iy2Jr2/NKzKCDHVxlct+1xcWC23IcpNDxyaElIwcvkg6H8+GSH1VQT09xlg+vOwbSPS4odC
	spz6T0f6RAQq1jhWDFkE856fkhABzYx3DAqFvYzgw4WiISWdrWZ/B3v6SKRNny7HS+nY9OQzURA
	xFsfQ==
X-Received: by 2002:a17:902:c946:b0:2bf:281f:19ec with SMTP id d9443c01a7336-2c1e8208778mr304491405ad.24.1781112202455;
        Wed, 10 Jun 2026 10:23:22 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2d9bb2139sm2247585ad.69.2026.06.10.10.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:23:21 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Wed, 10 Jun 2026 17:23:10 +0000
Message-ID: <20260610172310.163321-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_102324_018927_8E3E506D 
X-CRM114-Status: GOOD (  17.11  )
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

Serialize kfifo access with a per-channel spinlock. The reader drains
into a bounce buffer under the lock with kfifo_out_spinlocked() and then
copies to userspace after dropping it, since copy_to_user() may sleep on
a page fault.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Cc: stable@vger.kernel.org
Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---
Andrew,

Thanks for the review.

Changes since v4:
- Use __free(kfree) for automatic cleanup
- Allocate clamped count instead of full SNOOP_FIFO_SIZE
- Use kfifo_out_spinlocked() in snoop_file_read
- Use scoped_guard(spinlock) in put_fifo_with_discard

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index b03310c0830d..c9c87a794228 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
 #include <linux/interrupt.h>
@@ -74,6 +75,7 @@ struct aspeed_lpc_snoop_channel_cfg {
 struct aspeed_lpc_snoop_channel {
 	const struct aspeed_lpc_snoop_channel_cfg *cfg;
 	bool enabled;
+	spinlock_t		lock;    /* serialises @fifo: irq producer vs reader */
 	struct kfifo		fifo;
 	wait_queue_head_t	wq;
 	struct miscdevice	miscdev;
@@ -114,6 +116,7 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 				size_t count, loff_t *ppos)
 {
 	struct aspeed_lpc_snoop_channel *chan = snoop_file_to_chan(file);
+	u8 *buf __free(kfree) = NULL;
 	unsigned int copied;
 	int ret = 0;
 
@@ -125,9 +128,16 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 		if (ret == -ERESTARTSYS)
 			return -EINTR;
 	}
-	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
-	if (ret)
-		return ret;
+
+	count = min_t(size_t, count, SNOOP_FIFO_SIZE);
+
+	buf = kmalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	copied = kfifo_out_spinlocked(&chan->fifo, buf, count, &chan->lock);
+	if (copied && copy_to_user(buffer, buf, copied))
+		return -EFAULT;
 
 	return copied;
 }
@@ -153,9 +163,11 @@ static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
 {
 	if (!kfifo_initialized(&chan->fifo))
 		return;
-	if (kfifo_is_full(&chan->fifo))
-		kfifo_skip(&chan->fifo);
-	kfifo_put(&chan->fifo, val);
+	scoped_guard(spinlock, &chan->lock) {
+		if (kfifo_is_full(&chan->fifo))
+			kfifo_skip(&chan->fifo);
+		kfifo_put(&chan->fifo, val);
+	}
 	wake_up_interruptible(&chan->wq);
 }
 
@@ -228,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct device *dev,
 		return -EBUSY;
 
 	init_waitqueue_head(&channel->wq);
+	spin_lock_init(&channel->lock);
 
 	channel->cfg = cfg;
 	channel->miscdev.minor = MISC_DYNAMIC_MINOR;
-- 
2.43.0


