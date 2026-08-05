Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE6BC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 03:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=el3n5V7iPOoYu1CRUdT4wfLV7ObCCa5EITz8RK4IuNc=; b=BS4waniRDiqzlwO7GdtX6mydzq
	qNBx59q3l4n9362gHhpmwP+upzhrsZG910+R1GG6QTbajKLUZNU8iNTPoWplfVNlpX7CqZ7aIjpdy
	9b/B4czs151+A3Kyk2b70wFzIrvT8BtSmWALbxkw1PYkbcAtpPCA52pwSpuaN56te9P28H/DBC0KX
	JFrjwajYSeulce9u/kANcuL95tGgS/WnJKNGdFyCdoK50vgia+XA4nbMvzS2T06icrvWI2142oocv
	SfvjKTnDI8ts0OkTAOlaSncfXACmGowqOCENr9nBHSMcq92grkukb4tpKFuKr+aUOXQvx2x0VAdqV
	9l6W5npA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSDJ-00000003AIq-28On;
	Wed, 05 Aug 2026 03:22:41 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSDG-00000003AI8-1J8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 03:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=el
	3n5V7iPOoYu1CRUdT4wfLV7ObCCa5EITz8RK4IuNc=; b=eLWIHhE2IYh1TUsJnc
	+1lRyzilQEozJtFQ6HeGDC1R5LnIKq4on8q9nJhHm8+YuxmKoqPSml/ib8/1o6rT
	zB6hrmyhQPBBn2zs77gw6v7LITjG4eH18L1H3fK75wlrj3L8mRrUx1N5m1ln7l5S
	YPtIX13Dqsn3XmoBXBCJybeZs=
Received: from fedora (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHXvRrrHJqald+Jw--.17167S2;
	Wed, 05 Aug 2026 11:22:21 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: tglx@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	junan76@163.com
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/stm32mp-exti: fix the unit of the hwspinlock timeout
Date: Wed,  5 Aug 2026 11:21:40 +0800
Message-ID: <20260805032139.35420-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgAHXvRrrHJqald+Jw--.17167S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fXFyxCFWfKw4DWr4UArb_yoW8Ar1rpF
	W5t3sYywn3Wayaya1kAFs0gFy5Ca17J3yftFWDXa4jvwn8Wa1kJF10q3yUZF9rXrs5J3sF
	gFsYga45Cas8u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE1vVZUUUUU=
X-Originating-IP: [2409:8a62:3e6:1400:e93f:3d77:3322:beb7]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC0w19L2pyrG1kTwAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_202239_000663_A170465A 
X-CRM114-Status: GOOD (  14.40  )
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

Signed-off-by: Ju Nan <junan76@163.com>
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


