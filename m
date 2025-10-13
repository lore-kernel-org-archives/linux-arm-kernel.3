Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F2BCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGdj3UhN4DDaR9cP8b0NALwx4FhyUYgq9KowsMDlFqI=; b=vOEzIZJCUfrRhZvQEuyUKafAqz
	EX0t5ALOkQRDFHqdKOpBD9AD/qAa5xNp1C7NR6yz5yF6aO5keOVBAFcUGwyvLnZZfmatGukeMn3LA
	ErzwZQmug3Zlffqsabv9aeyy1LyDW4Tz6ZGRpXupF3u3rzMveLi3IZnvgYmChZdeuBn0B+lNXuLQ9
	seM9UZY5Oz8oI4xvaeXC/Osen4KUCLuWVLeedceuWYxtRoDwlDZarBxgDodymTkPyXagN2CAwueYt
	WY/ge6S6GvUnwl7p5R1mAoz5MIdLAGqcyiWFwUmULw8KJYfQcYdRHqW413nJj/Id2nnF3OSxM0rho
	xv2iu5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PHZ-0000000EQks-3xhp;
	Mon, 13 Oct 2025 20:36:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PHX-0000000EQjb-42bR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:36:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A80D61E71;
	Mon, 13 Oct 2025 20:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2137C4CEE7;
	Mon, 13 Oct 2025 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760387764;
	bh=chMAaHPdvZjXfYZQTfmqroMaCahKvWi7hxvycGkBc0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d2HsIj0GjEnJTG81nuvxt+rh9V8jVDkwbolK1vZjH/QLdrhSvnA4rL0lejyT03fUk
	 AYQKAmOHXS+cRkZyMi+8eL/fcdpoD5VY6iC9oTM4NqHv00OF3hCY96KH1rhoGQ9WaS
	 FAvGOoJh3cunza7z8okA+g3/wzRnll3xJH1fzYwKHMUEuxT9HranLKJnuHZYIdXZCl
	 DAR47RiTFVA+tE01uD8gMxCMzvEl7IPtksM+od6OjCFZjAEroLlDCHRxcoddmDtTra
	 uUCQU+FtsHyohiTXjUfWqTx58+dKEq/DSkCy0XlqFAOBoVjCCVB/zzVTbAzQ5eAKLi
	 rFUdm4g/rBL6g==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 32/33] genirq: Correctly handle preferred kthreads affinity
Date: Mon, 13 Oct 2025 22:31:45 +0200
Message-ID: <20251013203146.10162-33-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013203146.10162-1-frederic@kernel.org>
References: <20251013203146.10162-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

[CHECKME: Do some IRQ threads have strong affinity requirements? In
which case they should use kthread_bind()...]

The affinity of IRQ threads is applied through a direct call to the
scheduler. As a result this affinity may not be carried correctly across
hotplug events, cpuset isolated partitions updates, or against
housekeeping constraints.

For example a simple creation of cpuset isolated partition will
overwrite all IRQ threads affinity to the non isolated cpusets.

To prevent from that, use the appropriate kthread affinity APIs that
takes care of the preferred affinity during these kinds of events.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/irq/manage.c | 47 +++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index c94837382037..d96f6675c888 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -176,15 +176,15 @@ bool irq_can_set_affinity_usr(unsigned int irq)
 }
 
 /**
- * irq_set_thread_affinity - Notify irq threads to adjust affinity
+ * irq_thread_notify_affinity - Notify irq threads to adjust affinity
  * @desc:	irq descriptor which has affinity changed
  *
  * Just set IRQTF_AFFINITY and delegate the affinity setting to the
- * interrupt thread itself. We can not call set_cpus_allowed_ptr() here as
- * we hold desc->lock and this code can be called from hard interrupt
+ * interrupt thread itself. We can not call kthread_affine_preferred_update()
+ * here as we hold desc->lock and this code can be called from hard interrupt
  * context.
  */
-static void irq_set_thread_affinity(struct irq_desc *desc)
+static void irq_thread_notify_affinity(struct irq_desc *desc)
 {
 	struct irqaction *action;
 
@@ -283,7 +283,7 @@ int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
 		fallthrough;
 	case IRQ_SET_MASK_OK_NOCOPY:
 		irq_validate_effective_affinity(data);
-		irq_set_thread_affinity(desc);
+		irq_thread_notify_affinity(desc);
 		ret = 0;
 	}
 
@@ -1032,11 +1032,26 @@ static void irq_thread_check_affinity(struct irq_desc *desc, struct irqaction *a
 	}
 
 	if (valid)
-		set_cpus_allowed_ptr(current, mask);
+		kthread_affine_preferred_update(current, mask);
 	free_cpumask_var(mask);
 }
+
+static inline void irq_thread_set_affinity(struct task_struct *t,
+					   struct irq_desc *desc)
+{
+	const struct cpumask *mask;
+
+	if (cpumask_available(desc->irq_common_data.affinity))
+		mask = irq_data_get_effective_affinity_mask(&desc->irq_data);
+	else
+		mask = cpu_possible_mask;
+
+	kthread_affine_preferred(t, mask);
+}
 #else
 static inline void irq_thread_check_affinity(struct irq_desc *desc, struct irqaction *action) { }
+static inline void irq_thread_set_affinity(struct task_struct *t,
+					   struct irq_desc *desc) { }
 #endif
 
 static int irq_wait_for_interrupt(struct irq_desc *desc,
@@ -1384,7 +1399,8 @@ static void irq_nmi_teardown(struct irq_desc *desc)
 }
 
 static int
-setup_irq_thread(struct irqaction *new, unsigned int irq, bool secondary)
+setup_irq_thread(struct irqaction *new, struct irq_desc *desc,
+		 unsigned int irq, bool secondary)
 {
 	struct task_struct *t;
 
@@ -1405,16 +1421,9 @@ setup_irq_thread(struct irqaction *new, unsigned int irq, bool secondary)
 	 * references an already freed task_struct.
 	 */
 	new->thread = get_task_struct(t);
-	/*
-	 * Tell the thread to set its affinity. This is
-	 * important for shared interrupt handlers as we do
-	 * not invoke setup_affinity() for the secondary
-	 * handlers as everything is already set up. Even for
-	 * interrupts marked with IRQF_NO_BALANCE this is
-	 * correct as we want the thread to move to the cpu(s)
-	 * on which the requesting code placed the interrupt.
-	 */
-	set_bit(IRQTF_AFFINITY, &new->thread_flags);
+
+	irq_thread_set_affinity(t, desc);
+
 	return 0;
 }
 
@@ -1486,11 +1495,11 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	 * thread.
 	 */
 	if (new->thread_fn && !nested) {
-		ret = setup_irq_thread(new, irq, false);
+		ret = setup_irq_thread(new, desc, irq, false);
 		if (ret)
 			goto out_mput;
 		if (new->secondary) {
-			ret = setup_irq_thread(new->secondary, irq, true);
+			ret = setup_irq_thread(new->secondary, desc, irq, true);
 			if (ret)
 				goto out_thread;
 		}
-- 
2.51.0


