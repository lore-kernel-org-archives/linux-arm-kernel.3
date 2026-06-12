Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F104CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwTEg4XBjlq2gqrpSaNYbmX8jrkzkowNm264wvHp61I=; b=jbUoJIQ8jjRi1CHpc5iolrdyLz
	ruQ+VPZvyzuvlL06ma0vw4Z9axPJ6qmDRduCdi8iahqHe7qqFU27Tg6TmYhPsTrfLmEDRnkOucYEY
	EPaAws8+VqHDb2qRezkXgTj9hc2LcStAdzXYxsJ1h+t1tATn26TNZxtyNzQwZ74dIw6AZH8zdhxd6
	zpwWoYQhgBYyTfbr7UDI4PK9vmYxfAQPOZfw+CajqmME6gjFzEUd8Pn8OAUQ3/Wbjp7IcrgGBm08f
	odoJc0HnEH5WF8etJV3M1yAUld0x+wGI0VzLPRs3kW4dMa7QAM5974UIe50YSft5SdB6BIoFRqWKw
	/8Kw/Zcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7EY-0000000BR46-1dBP;
	Fri, 12 Jun 2026 19:08:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7EV-0000000BR3k-0SDf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 19:08:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so1139766a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781291278; x=1781896078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwTEg4XBjlq2gqrpSaNYbmX8jrkzkowNm264wvHp61I=;
        b=Asq+OspsaqpjJdf+5UH+Cs6Xmf1p+mk4WuXThVaw1ASJlSlbrTVvooE1nKzUv03OaV
         f9Hnn8nKUHhgjmYWhUrmyBWvZFChlZnkDHk13TfvIcafMgLUs7p32ZZBy2s4RK+snwLJ
         zxYL/sHyqYZUMEGUU3PwD8AX+zkybiFPietaL6Aj87UoBUrQymjShhvzqtq9a6qXL7/A
         UrmUbVSY5K41FDpo28r85RA4pDhVhSXy57HgW+r+/uaFmEQtJYXPfLf1SUw2nYp8NCYu
         IJcZoPWCVvbcYDr1sJ5ZW3eAu4/JNiaC/P5PTtUuQpTomIrWwzgZ6x73FyPadakyg1S3
         fNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781291278; x=1781896078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwTEg4XBjlq2gqrpSaNYbmX8jrkzkowNm264wvHp61I=;
        b=G9xdWZbk2uswmAtzBR8aZavXmDQKv20xrsd16Gbvwq6+X1Z/Po9hI6fSzXnMUdp1Z2
         iiGvFGbPIjErTUJ5TE96sdVw8Hisxjcz5yWXr2kQ0UPqWE2ifjPkNobn2hFP12hB02tL
         vABLAZ9I/9qnXoTki+GF59THaFTmMuBnL85vi7KI3h5Xwn0uwdwqBXwx230SinHYSfLd
         LnKL1MjwuXzU8J/RHFWKlqmeFgAcSs++vEuKHo03z+xG9PmA8PEVA1ln5WRqlbnHDVeK
         vBJi3mBcYMenSRQsydGV2zgUwWUJsUKeL4pMq8uVkynRZ3xd9Y+jv4kFMn2t+osjaoLb
         v7Ag==
X-Forwarded-Encrypted: i=1; AFNElJ9Eq7OW5LMtdzawX5hMeD5JSkezqB4M37C7vhl3V+nz93egy+/YnCGAA+G/JIuw8Ph7T4v5Tpcoe/8ZzdssZHjA@lists.infradead.org
X-Gm-Message-State: AOJu0YxPepLLVXA/pNNNFwtbJFkKWwPKlJ4/nkFQ7H4VMiHDVULdOmQU
	rOr2uqYIIOpewPHojYP+G+2ohJgwxt5yMIY+fGGgDOQMjQbVOegkVND2
X-Gm-Gg: Acq92OGNL8pLBHVipBfjVnBZLIb8gbQ0tMYgU4ucf77fdNG5TU2VGo0VtXPfUPyHEVx
	bDUJpCYyAaqCRMJ/extMItZdpXyX1Q+6gON3Ldh9OYXcoJ/o8vpAFe0Blb+zFRKTyfHtjb0hbiL
	LXXASh0ujMQB3oNEJ1f/c6VV8ihiBk+YxPYe5AYBfKxJt3TSSpJgyN+W7Ha4fztZGEfLuFQHHy6
	1N4onMJYof2ehzHFqjegNn5iLCldRSSerGDulhrM414CEMtdgT9GIOm5qasTJUvXMXXMk7pcpzg
	ZsRH4T9EHboa7Y/uorvM6R+QWLtVKHKlOEbubPSrWqkvLmu0hklDeIojhqUYe+q+wHrnAecelDR
	gYhkoUQfL5CVayK4p2mmHjh94l8xwcl5KJKMqb131iy25P7Mhl1s31rYuS92iPBtv2e0/zhjCEo
	LAeDY5PL0IwyS+717qFLBYOJyQX0p76kpMEm9InL/WrbfIJFkVBFb0sA==
X-Received: by 2002:a17:90b:28cd:b0:36a:95c:7613 with SMTP id 98e67ed59e1d1-37a0202ece8mr4596847a91.10.1781291277427;
        Fri, 12 Jun 2026 12:07:57 -0700 (PDT)
Received: from LAPTOP-97G9G880.localdomain ([106.206.15.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm2748485a91.2.2026.06.12.12.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:07:56 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>
Subject: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Fri, 12 Jun 2026 19:07:43 +0000
Message-ID: <20260612190744.172638-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_120759_175820_B7BA85C7 
X-CRM114-Status: GOOD (  20.80  )
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

Serialize kfifo access with a per-channel spinlock shared between the
IRQ handler (producer) and the file reader (consumer).  Annotate @fifo
with __guarded_by(&lock) and opt the driver into context analysis so the
compiler enforces that all fifo access holds the lock.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---
 drivers/soc/aspeed/Makefile           |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 38 ++++++++++++++++++---------
 2 files changed, 27 insertions(+), 12 deletions(-)

Andrew,

Thanks for the review.

Changes since v5:
- Annotate @fifo with __guarded_by(&lock) instead of a comment
- Move kfifo_initialized() check inside scoped_guard(spinlock, &chan->lock)
  in put_fifo_with_discard()
- Replace spin_lock_init() with scoped_guard(spinlock_init, &channel->lock)
  around kfifo_alloc() in aspeed_lpc_enable_snoop()
- Enable CONTEXT_ANALYSIS for this driver in drivers/soc/aspeed/Makefile

Dropped Cc: stable — the fix uses cleanup.h/context-analysis idioms absent
from LTS; I'll send adapted backports to stable@ once this is in mainline.

Tested on ast2600-evb (QEMU): clang-22 with CONFIG_WARN_CONTEXT_ANALYSIS=y
shows no context-analysis warnings; PROVE_LOCKING, DEBUG_ATOMIC_SLEEP and
HARDENED_USERCOPY show no splats. Overflow reproduced via a fault-injection
module forcing the post-race (in - out) state (QEMU doesn't model the ARM
ordering that triggers it in the field): unpatched panics, patched returns
cleanly.

Thanks,
Karthikeyan

diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b35d74592964..b5188dcde37a 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+CONTEXT_ANALYSIS_aspeed-lpc-snoop.o	:= y
diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index b03310c0830d..7fa1a345acac 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
 #include <linux/interrupt.h>
@@ -74,7 +75,8 @@ struct aspeed_lpc_snoop_channel_cfg {
 struct aspeed_lpc_snoop_channel {
 	const struct aspeed_lpc_snoop_channel_cfg *cfg;
 	bool enabled;
-	struct kfifo		fifo;
+	spinlock_t		lock;
+	struct kfifo		fifo __guarded_by(&lock);
 	wait_queue_head_t	wq;
 	struct miscdevice	miscdev;
 };
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
@@ -151,11 +161,13 @@ static const struct file_operations snoop_fops = {
 /* Save a byte to a FIFO and discard the oldest byte if FIFO is full */
 static void put_fifo_with_discard(struct aspeed_lpc_snoop_channel *chan, u8 val)
 {
-	if (!kfifo_initialized(&chan->fifo))
-		return;
-	if (kfifo_is_full(&chan->fifo))
-		kfifo_skip(&chan->fifo);
-	kfifo_put(&chan->fifo, val);
+	scoped_guard(spinlock, &chan->lock) {
+		if (!kfifo_initialized(&chan->fifo))
+			return;
+		if (kfifo_is_full(&chan->fifo))
+			kfifo_skip(&chan->fifo);
+		kfifo_put(&chan->fifo, val);
+	}
 	wake_up_interruptible(&chan->wq);
 }
 
@@ -239,9 +251,11 @@ static int aspeed_lpc_enable_snoop(struct device *dev,
 	if (!channel->miscdev.name)
 		return -ENOMEM;
 
-	rc = kfifo_alloc(&channel->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
-	if (rc)
-		return rc;
+	scoped_guard(spinlock_init, &channel->lock) {
+		rc = kfifo_alloc(&channel->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
+		if (rc)
+			return rc;
+	}
 
 	rc = misc_register(&channel->miscdev);
 	if (rc)
--
2.43.0


