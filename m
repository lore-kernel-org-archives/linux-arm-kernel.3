Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207D1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 02:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFxUkhg9QJ7xUqbUrqBmljBaBafloBC1VvvbvT0bbkw=; b=p9SGfxulqGqLq9QegnmarAIWuz
	QaJMR7mh4cHthEmTh0UpDT+JMA5RBP5CloPTO/OTH4D+n/fpwyFr00rJ9dSHWi2jUL8/tvKYMFink
	6cVKxnRqSR4ajAoksyFFx2QnBNiT8i5qf8wpn90o6OJ/EVNz0SCrDkWdxoApf/LLFCxz+tcyXoocC
	ArQ8kHmqkc/UTry2RGy8ORwrpqSr8ryfkpDiW/3tCvnsSCyrP35QwuseXSDAXcja52BuzW95pJWce
	F/xnWMimXx1QyJd2eIqUoi07/eih9pN2901YRCZysNtYgXP6E28XFjG+vf5/JTR+40CJ+riPnUH6r
	VmXiJYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFMw-0000000CTN3-3gGn;
	Fri, 21 Aug 2026 02:52:34 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFMt-0000000CTMb-3DHC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 02:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LF
	xUkhg9QJ7xUqbUrqBmljBaBafloBC1VvvbvT0bbkw=; b=Ym1jZNNjpfz1CC24Yw
	XbGwzU99iwTEfvQj7vqmqtKcbxZi/noWWnwUcAl3GIJhrm0WZZwQtUtkRqz5UOKt
	iddNif3LbkRimCRcUeD2Be+MMeJkO6Yx3t2ZkSOoAV0jxBtKacBCxAE8e6N0h9Iu
	tETef2yMrq9iysjVnBBR12chY=
Received: from fedora (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3Py9WvYdqaYjMNQ--.27755S2;
	Fri, 21 Aug 2026 10:52:07 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: tglx@kernel.org
Cc: alexandre.torgue@foss.st.com,
	junan76@163.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	radu@rendec.net
Subject: [PATCH v3] irqchip/stm32mp-exti: fix the unit of the hwspinlock timeout
Date: Fri, 21 Aug 2026 10:47:57 +0800
Message-ID: <20260821024756.24927-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87cxvdkhmn.ffs@fw13>
References: <87cxvdkhmn.ffs@fw13>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgD3Py9WvYdqaYjMNQ--.27755S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fXFyxCFWfKw4DWr4UArb_yoW8ur1UpF
	Z5t3s0yrs5Wa4jya1DtF4DWry5Cw47t3ySgFWUXa1FvFn8W395J3WIq39FqF12gF4xGF9F
	gF4fXFy5Ca4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEJ5rnUUUUU=
X-Originating-IP: [2409:8a62:3e3:ea0:568a:8731:8836:98e4]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9RkCs2qHvVn0OwAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_195232_202682_37FE9036 
X-CRM114-Status: GOOD (  14.85  )
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

Fixes: 5257169ade8c ("irqchip/stm32-exti: Use the hwspin_lock_timeout_in_atomic() API")
Reviewed-by: Radu Rendec <radu@rendec.net>
Signed-off-by: Ju Nan <junan76@163.com>
---
changelog:

v3: redefine the timeout macro with time unit on it
v2: add "Fixes" tag suggested by Radu Rendec
v1: https://lore.kernel.org/all/20260805032139.35420-2-junan76@163.com/
---
 drivers/irqchip/irq-stm32mp-exti.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-stm32mp-exti.c b/drivers/irqchip/irq-stm32mp-exti.c
index a24f4f1a4..ce4e03ee1 100644
--- a/drivers/irqchip/irq-stm32mp-exti.c
+++ b/drivers/irqchip/irq-stm32mp-exti.c
@@ -23,7 +23,7 @@
 
 #define IRQS_PER_BANK			32
 
-#define HWSPNLCK_TIMEOUT		1000 /* usec */
+#define HWSPNLCK_TIMEOUT_MS		1
 
 #define EXTI_EnCIDCFGR(n)		(0x180 + (n) * 4)
 #define EXTI_HWCFGR1			0x3f0
@@ -377,7 +377,7 @@ static int stm32mp_exti_set_type(struct irq_data *d, unsigned int type)
 	raw_spin_lock(&chip_data->rlock);
 
 	if (hwlock) {
-		err = hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TIMEOUT);
+		err = hwspin_lock_timeout_in_atomic(hwlock, HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			pr_err("%s can't get hwspinlock (%d)\n", __func__, err);
 			goto unlock;
-- 
2.55.0


