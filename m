Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6C9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 14:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNOBC7olMLbrXH1GbdTgWDhAhDx9tYCg2+8zYiTEdiU=; b=ArvNchECrsruBqkXnwZzYib+IQ
	uiV7fRK7raSMFEPC8p4jt7o+2rsQScrP1/cRXr0sqRVfgrQFuuIkzJRYkOWmjj6t6OkVl/MMxAh8x
	j92e4tRadat6p/rTcf0A9T0U8UfzVYTWoC1m6JPHJa18JJpBW/zYMsS9r+M4cPvyXTMUOjjyhtrfj
	PWZEiwKSwZTEWTRCSP9xnY6LFa6umesqWHRBZjpsEMb0dkwhZhsuqOLy/BOp7KkgjOEbVRwmUfWil
	mb6JwuhXHcWD1TcQIa3jK27O34rnjX0fky5sNENX0hRju1xN/wHVuBz/cDNjbNcfOHH8LC4XUutDU
	Py6Sid/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvbla-00000004paf-3OE1;
	Sun, 16 Aug 2026 14:23:14 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvblW-00000004pVn-2S54
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 14:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=JN
	OBC7olMLbrXH1GbdTgWDhAhDx9tYCg2+8zYiTEdiU=; b=RCsQ4A7UBQLPmou6g3
	Vgqwp6vpB0r/BpJFxTx6vs2beAk+mtllm9qGIFJaD5gpaH8f8fgJCWcx1IaQ4kF8
	yi1wlOpkoaXIGfFz/myOXRzDjDOOyePV03OCQikwVyBWwL5iZIcXRhXNLLBYVEdH
	Le706WT4kK7UGO2W/+bRpjMGc=
Received: from fedora (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3nzeux4Fqz9GcMg--.39607S2;
	Sun, 16 Aug 2026 22:22:40 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: junan76@163.com,
	radu@rendec.net
Cc: alexandre.torgue@foss.st.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	tglx@kernel.org
Subject: [PATCH v2] irqchip/stm32mp-exti: fix the unit of the hwspinlock timeout
Date: Sun, 16 Aug 2026 22:20:08 +0800
Message-ID: <20260816142007.25338-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805032139.35420-2-junan76@163.com>
References: <20260805032139.35420-2-junan76@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgD3nzeux4Fqz9GcMg--.39607S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fXFyxCFWfKw4DWr4UArb_yoW8ZF18pF
	W5t3sYywn3Wa4jya1vyF4qgFy5Ca17J3y3tFWUX3yjv3Z8Gan5JF10q3yjqFnrXFsxJFZr
	KFsaga45Ca4DZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEJ5rnUUUUU=
X-Originating-IP: [2409:8a62:3e2:2e60:57c5:53b8:68c1:9dc1]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1BAZymqBx7DKAAAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_072311_076190_B5D25473 
X-CRM114-Status: GOOD (  14.60  )
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

HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
timeout argument is in milliseconds, not microseconds:

  atomic_delay += HWSPINLOCK_RETRY_DELAY_US;
  if (atomic_delay > to * 1000)
          return -ETIMEDOUT;

So stm32mp_exti_set_type() asks for a 1 second timeout where the comment
next to the macro says it wants 1 millisecond. The semaphore is polled
with udelay() from a section that holds chip_data->rlock, a
raw_spinlock_t, so preemption stays disabled for the whole wait on every
configuration, PREEMPT_RT included.

The hwspinlock core documents this explicitly:

  If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) the
  timeout is handled with busy-waiting delays, hence shall not exceed
  few msecs.

Pass the value the comment always described. The core retries every
HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled ten
times before giving up, which is far longer than any plausible hold time
on the coprocessor side. A timeout is reported with pr_err() and fails
the trigger type configuration, so shortening it degrades gracefully.

Fixes: 5257169ade8c ("irqchip/stm32-exti: Use the hwspin_lock_timeout_in_atomic() API")
Reviewed-by: Radu Rendec <radu@rendec.net>
Signed-off-by: Ju Nan <junan76@163.com>
---
changelog:

v2: Add Fixes tag suggested by Radu Rendec
v1: https://lore.kernel.org/all/20260805032139.35420-2-junan76@163.com/
---
 drivers/irqchip/irq-stm32mp-exti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index a24f4f1a4..f5f0109bf 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -23,7 +23,7 @@
 
 #define IRQS_PER_BANK			32
 
-#define HWSPNLCK_TIMEOUT		1000 /* usec */
+#define HWSPNLCK_TIMEOUT		1 /* msec */
 
 #define EXTI_EnCIDCFGR(n)		(0x180 + (n) * 4)
 #define EXTI_HWCFGR1			0x3f0
-- 
2.55.0


