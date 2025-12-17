Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E135D64096
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kq1pcQ/AefxuctPsiba26WJguUJGfQFTbSDr8AsjN/k=; b=OEeGxj5V6oqyiicuUXbQk7L11i
	wG37N69KqpItQL0oY3FtHD/NTgJ0A/asJyzuodKgZd3iK1stKtdrxJql3K1d3vlrLhdXKDsOOyvkc
	z08R1GZUIj48Yq1c0VUQitFDf9mB/tsEh5i4L9mgYJU2NuvRlsdt0dbncSUNCXJUt6+/g4Hn5vHgP
	fv60N5W75YcfVzIOuMMxYOiCziEDwuy9E5YOinOZc5mCL8NfVsdSzQMn2s3Vn3ORiAkwQY+ZE8yY6
	h2iu4LFZaS6rDH8vzraxeWwTiBUf7LaW4oKGcUlg6A3GQgvCtarPTME9+7d29TvuQ+zQTlpIjCgkI
	u+w75aYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnFn-00000006NV9-40wr;
	Wed, 17 Dec 2025 08:51:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnFk-00000006NU7-3i8W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:51:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB49414BF;
	Wed, 17 Dec 2025 00:51:12 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B9D93F73F;
	Wed, 17 Dec 2025 00:51:17 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: nico@fluxnic.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	dongdong.deng@windriver.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH net v3] smc91x: fix broken irq-context in PREEMPT_RT
Date: Wed, 17 Dec 2025 08:51:15 +0000
Message-Id: <20251217085115.1730036-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_005124_965672_DFF02973 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

When smc91x.c is built with PREEMPT_RT, the following splat occurs
in FVP_RevC:

[   13.055000] smc91x LNRO0003:00 eth0: link up, 10Mbps, half-duplex, lpa 0x0000
[   13.062137] BUG: workqueue leaked atomic, lock or RCU: kworker/2:1[106]
[   13.062137]      preempt=0x00000000 lock=0->0 RCU=0->1 workfn=mld_ifc_work
[   13.062266] C
** replaying previous printk message **
[   13.062266] CPU: 2 UID: 0 PID: 106 Comm: kworker/2:1 Not tainted 6.18.0-dirty #179 PREEMPT_{RT,(full)}
[   13.062353] Hardware name:  , BIOS
[   13.062382] Workqueue: mld mld_ifc_work
[   13.062469] Call trace:
[   13.062494]  show_stack+0x24/0x40 (C)
[   13.062602]  __dump_stack+0x28/0x48
[   13.062710]  dump_stack_lvl+0x7c/0xb0
[   13.062818]  dump_stack+0x18/0x34
[   13.062926]  process_scheduled_works+0x294/0x450
[   13.063043]  worker_thread+0x260/0x3d8
[   13.063124]  kthread+0x1c4/0x228
[   13.063235]  ret_from_fork+0x10/0x20

This happens because smc_special_trylock() disables IRQs even on PREEMPT_RT,
but smc_special_unlock() does not restore IRQs on PREEMPT_RT.
The reason is that smc_special_unlock() calls spin_unlock_irqrestore(),
and rcu_read_unlock_bh() in __dev_queue_xmit() cannot invoke
rcu_read_unlock() through __local_bh_enable_ip() when current->softirq_disable_cnt becomes zero.

To address this issue, replace smc_special_trylock() with spin_trylock_irqsave().

Fixes: 342a93247e08 ("locking/spinlock: Provide RT variant header: <linux/spinlock_rt.h>")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---

History
========
From v2 to v3:
  - rebased to linux-net tree.
  - modify patch title & add r-b tags
  - https://lore.kernel.org/all/20251212190338.2318843-1-yeoreum.yun@arm.com/

From v1 to v2:
  - remove debug log.
  - https://lore.kernel.org/all/20251212185818.2209573-1-yeoreum.yun@arm.com/

---
 drivers/net/ethernet/smsc/smc91x.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.c b/drivers/net/ethernet/smsc/smc91x.c
index 9d1a83a5fa7e..d16c178d1034 100644
--- a/drivers/net/ethernet/smsc/smc91x.c
+++ b/drivers/net/ethernet/smsc/smc91x.c
@@ -516,15 +516,7 @@ static inline void  smc_rcv(struct net_device *dev)
  * any other concurrent access and C would always interrupt B. But life
  * isn't that easy in a SMP world...
  */
-#define smc_special_trylock(lock, flags)				\
-({									\
-	int __ret;							\
-	local_irq_save(flags);						\
-	__ret = spin_trylock(lock);					\
-	if (!__ret)							\
-		local_irq_restore(flags);				\
-	__ret;								\
-})
+#define smc_special_trylock(lock, flags)	spin_trylock_irqsave(lock, flags)
 #define smc_special_lock(lock, flags)		spin_lock_irqsave(lock, flags)
 #define smc_special_unlock(lock, flags) 	spin_unlock_irqrestore(lock, flags)
 #else
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


