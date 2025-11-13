Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02ABCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 05:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR4PqSCoKUZHQwNLH+ibXY+eaMViVtVOUHNqTtgOoNw=; b=rJc/NMJ66CBKpzoqrWNlExceUs
	IHl3DMVGJdq6ZmEDnCZpjq3Y50/OvVr1CHWBFbHl6mIRRs5/wXVk4ZoPthZa3E5ZQJ2cz1+qCMrVd
	zJDd0Sphf8iOik4tK50w6fVKLB9KGaWtQhOxBvhWzSIn1Vgk2DdiE2ZEYelinLH7d3dTdwHPfiGzx
	ldIY8kyBLGaN+IbK1AVgXAnuiIh3Tp2CZmAfGh3O37l9TVGZk7J2Kzd9Xk4PWNWBoFeAWDK+E2kg/
	2iJbHp+St0hDghKpxxWu3y2GSx5d+FJKvIJbaTp3DFS4aBa2lhNRrEoFPtiAuUoXxj5i7ceO0HbMI
	d/T5j6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpj-00000009uv7-1fHX;
	Thu, 13 Nov 2025 05:25:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPph-00000009uua-3gIr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Nov 2025 05:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YR4PqSCoKUZHQwNLH+ibXY+eaMViVtVOUHNqTtgOoNw=; b=d2bohj+C4nqIZ7m4ebyCrCo8jQ
	/u0y54D/tlO+DgqYyTJiEwDArZ3E0evZ+Au8yJFKrSUZnTV0Fp+5Y8fGYgS0NY8gR2NKTizyD/qUv
	DxZWdszAqyNOOTTkzJ4GfoJhR4sXANhaqj73dTPDmHpwfgD84Y7xbikfbmJ54x0mm0j7XSmrEtK7Q
	uChipwdQ2X489EVweW++4JE7H9paDkltet7BBPKUaiU1qGknWiK8XbgUPlISlYkWX9TDzmazMUIjA
	mZuV97Hj/ebGOyIWMUKfTWJbotpoZWj83NKK/eeQ4ECKyUHm15jbyKr6wJLLJwNdmZK73s1e8kYFj
	6I8LMEYQ==;
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOxx-0000000H4so-1MjC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:29:51 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-43373024b5eso6605165ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763011514; x=1763616314; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YR4PqSCoKUZHQwNLH+ibXY+eaMViVtVOUHNqTtgOoNw=;
        b=RHUCTAKpsLuaEtppJzOJhZ4SVJ7vHaJpK2eGsKnHXSWT9WsesKpmI9Um2kvAYZP2OU
         urQrBv3T75KUOmOHBOG9Ku58XHlbNEyUaIToh2BFlNcAZRgFHRBgnNNLLQESzuCqNtY3
         xIx/LBjlyoMi9XwIbRHLCrZlIdKHXjXaKxbL2gyUoWU4XYYwibSkbnmGsORcACtBQOt+
         HvEDaFoCM4vLRzZk4S9UDulU8Z8vVvrQhADFyxaJjg8IasL9G9dIkO9cZUFLHLmzaeav
         fZ+vE9uL7BluMQda1NSBvcGa3iUA5b1iqG7kPowsSabTU46LskZWkfUX+UQKqmwWoOpU
         9FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763011514; x=1763616314;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YR4PqSCoKUZHQwNLH+ibXY+eaMViVtVOUHNqTtgOoNw=;
        b=dPUXhrfH5uHeO+hEyfoKkF6F+8ZyThhb2yt732gtoEiZFg+LRvBPNbCnD+lgvhKlz2
         KdubHJfekGvc4IHC6A4IZamfO1aOGDQAtktbPOxrydn9hJIH68LZlXZEbQ0LSK6d5b5t
         27QoryUri/3S+6nop+TNj7R/OUsQb3Ads/vMgq+tN7vHY6Rqiz/MmoZWbkJPPsq5fqhj
         aWLrUnCyXYBBlj5UNatQIpsJAOGKMKVRRXshM5pzZGpFvjLgvObEH8Jrh9Mj92BG3+Tx
         accMz0si2BItcxoP0tguUs5tNQi0YXRsvoOHQTiHw5gfJ5WHq7SKtlpU7c4GqxB9Wf/A
         +07Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrqpThBE9kWAP65YsC9xKLauuaWBbPkRd1SNnjpHJrkf0CrirBZjHvr20dScBq8WRzDY/BotD+SYvWL6qIcAwg@lists.infradead.org
X-Gm-Message-State: AOJu0YxCiWbUqBc0VWhsA52137ojw4HsAuDdAooS5MKRGIaLT18oX5JM
	5VYKHzaK9tOG7r83t75z+gsV9x5a0FOkKZXbuv4ismuA4QNPHdg2AU3d4vQkJpa24cKpKUnPm6G
	4EbR3PR2Ltg==
X-Google-Smtp-Source: AGHT+IFRYF4zNyv9Ly6pBzYTZfMV1gbB624Cl5TmoplavbzHX+2MSvXvATj641ux/60yeM2/PvFgItVBduUS
X-Received: from ilbbm14.prod.google.com ([2002:a05:6e02:330e:b0:433:2091:8e7e])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1a83:b0:433:2072:9d2c
 with SMTP id e9e14a558f8ab-43473d2a3a5mr86726965ab.10.1763011514189; Wed, 12
 Nov 2025 21:25:14 -0800 (PST)
Date: Thu, 13 Nov 2025 05:24:52 +0000
In-Reply-To: <20251113052452.975081-1-rananta@google.com>
Mime-Version: 1.0
References: <20251113052452.975081-1-rananta@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251113052452.975081-4-rananta@google.com>
Subject: [PATCH 3/3] KVM: arm64: Reschedule as needed when destroying the
 stage-2 page-tables
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042949_664810_C6EB0AA9 
X-CRM114-Status: GOOD (  15.64  )
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

When a large VM, specifically one that holds a significant number of PTEs,
gets abruptly destroyed, the following warning is seen during the
page-table walk:

 sched: CPU 0 need_resched set for > 100018840 ns (100 ticks) without schedule
 CPU: 0 UID: 0 PID: 9617 Comm: kvm_page_table_ Tainted: G O 6.16.0-smp-DEV #3 NONE
 Tainted: [O]=OOT_MODULE
 Call trace:
  show_stack+0x20/0x38 (C)
  dump_stack_lvl+0x3c/0xb8
  dump_stack+0x18/0x30
  resched_latency_warn+0x7c/0x88
  sched_tick+0x1c4/0x268
  update_process_times+0xa8/0xd8
  tick_nohz_handler+0xc8/0x168
  __hrtimer_run_queues+0x11c/0x338
  hrtimer_interrupt+0x104/0x308
  arch_timer_handler_phys+0x40/0x58
  handle_percpu_devid_irq+0x8c/0x1b0
  generic_handle_domain_irq+0x48/0x78
  gic_handle_irq+0x1b8/0x408
  call_on_irq_stack+0x24/0x30
  do_interrupt_handler+0x54/0x78
  el1_interrupt+0x44/0x88
  el1h_64_irq_handler+0x18/0x28
  el1h_64_irq+0x84/0x88
  stage2_free_walker+0x30/0xa0 (P)
  __kvm_pgtable_walk+0x11c/0x258
  __kvm_pgtable_walk+0x180/0x258
  __kvm_pgtable_walk+0x180/0x258
  __kvm_pgtable_walk+0x180/0x258
  kvm_pgtable_walk+0xc4/0x140
  kvm_pgtable_stage2_destroy+0x5c/0xf0
  kvm_free_stage2_pgd+0x6c/0xe8
  kvm_uninit_stage2_mmu+0x24/0x48
  kvm_arch_flush_shadow_all+0x80/0xa0
  kvm_mmu_notifier_release+0x38/0x78
  __mmu_notifier_release+0x15c/0x250
  exit_mmap+0x68/0x400
  __mmput+0x38/0x1c8
  mmput+0x30/0x68
  exit_mm+0xd4/0x198
  do_exit+0x1a4/0xb00
  do_group_exit+0x8c/0x120
  get_signal+0x6d4/0x778
  do_signal+0x90/0x718
  do_notify_resume+0x70/0x170
  el0_svc+0x74/0xd8
  el0t_64_sync_handler+0x60/0xc8
  el0t_64_sync+0x1b0/0x1b8

The warning is seen majorly on the host kernels that are configured
not to force-preempt, such as CONFIG_PREEMPT_NONE=y. To avoid this,
instead of walking the entire page-table in one go, split it into
smaller ranges, by checking for cond_resched() between each range.
Since the path is executed during VM destruction, after the
page-table structure is unlinked from the KVM MMU, relying on
cond_resched_rwlock_write() isn't necessary.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250820162242.2624752-3-rananta@google.com
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/mmu.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c2bc1eba032cd..f86d17ad50a7f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -904,11 +904,35 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	return 0;
 }
 
+/*
+ * Assume that @pgt is valid and unlinked from the KVM MMU to free the
+ * page-table without taking the kvm_mmu_lock and without performing any
+ * TLB invalidations.
+ *
+ * Also, the range of addresses can be large enough to cause need_resched
+ * warnings, for instance on CONFIG_PREEMPT_NONE kernels. Hence, invoke
+ * cond_resched() periodically to prevent hogging the CPU for a long time
+ * and schedule something else, if required.
+ */
+static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
+				   phys_addr_t end)
+{
+	u64 next;
+
+	do {
+		next = stage2_range_addr_end(addr, end);
+		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
+							     next - addr);
+		if (next != end)
+			cond_resched();
+	} while (addr = next, addr != end);
+}
+
 static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
 {
 	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
 
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, 0, BIT(ia_bits));
+	stage2_destroy_range(pgt, 0, BIT(ia_bits));
 	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
 }
 
-- 
2.51.2.1041.gc1ab5b90ca-goog


