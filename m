Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ECC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYe5nu6TpLkMvmAmuxkk2nqtf0ZOE6ibYgo684ah5AQ=; b=kJcflQY0uKFqD6zrMKE9mswrtE
	l6fG0cC6I0D9yyt3ypwP56yHH61OSppxQ5TpYz1sqrynYSDPYFoQog1ECDvmsRRDZLYAeEAC2TZiQ
	8pqDmr6qZG5QyV5eerRriIZQ6Bt3IUUfezGPVweDErbmTVron27ck56xti490m39UDns6ip6tYgMm
	tUQBi0YFRUyk8e69jZq53160ZUSQ4pjCeqbe8pkN4dSv8pCVinudX9AI52h9PswHni/qlXD8w8ZoW
	fAE4mEvtHUDbhL4/7gC9IjoraBjQfGhXXXbSgGAimy0YX3sx9jOjguZwOPevNGbdlDHtw9ElBY/ce
	dZsYW89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5nu-00000008jks-2tzD;
	Thu, 24 Jul 2025 23:56:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5j9-00000008jRs-3lvp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 23:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RYe5nu6TpLkMvmAmuxkk2nqtf0ZOE6ibYgo684ah5AQ=; b=hMNPbMbY1n/Mks+/3MLTEz3aqi
	l1LWYkPUnet7oO5YbP08K7VzJg8i+hL0hobVJtp8VJCOfySTb3LcYTLYMz4p1xTOhuFZBWebWt0A2
	8zKqazP++CoIB1H22sPdx+0rf93fx/Lp/waIW36/DL8dPKJYsRZaA90OAQCsALt+lfx/qLVRBc31G
	ouSEzy9wWc2DrY+IDnjaspemE++IiGCY7GA3lGfg95O9x9MQIqOv0MsT6Ii4D6Pin6nRtFjQxPEBm
	EDnN/fZdq9VVbux9DEPsYwzsAt6GJFDOxlzVNy4kRcDcjSXMZ7GZ6J7w1gDzJAOwoo/WeWgk3R5Uo
	Z4R27x2w==;
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5j6-0000000Bj4R-3P3U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 23:51:54 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-87c73351935so135066939f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 16:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753401110; x=1754005910; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYe5nu6TpLkMvmAmuxkk2nqtf0ZOE6ibYgo684ah5AQ=;
        b=fA2eQ9El6hDTrcet799SaVVcIepU+2aKC3MJdQ+F2N6dlM95DmFIqIPHefPbn1VhOk
         DHAVMXzAGP10/+Vu8yTgAVogwIy/ctsucErSpLf0Sm+9rnwLDJ37BoricI/xoORyS+Qu
         gvBtxFlMBa1LM4YockZKZ+U0HrZIKinD98QIsy2Ik0OHzrTRgwdOWchQccimCYNFoHRJ
         OEe4MFNnR8pRtglfv3Q5X+Q22j9C2ijMpz27+3ZV8WRPVicoukfpzdmciYNhXqEnCN+O
         mgxIrIDvjBV9ypF7AbTLm+lxGOrVJfqMZ687wOLQLaKwzuTnRw3wYYZvi/JFGDq8kraF
         RVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753401110; x=1754005910;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYe5nu6TpLkMvmAmuxkk2nqtf0ZOE6ibYgo684ah5AQ=;
        b=F8ltmmUvudtU9TLTJNuOGWaeDU0hHLh8SxkHUcNyJV9MSDyndnI1U6nJmw8N/OkFD4
         pLk8H9ptj8iBVWz+y1ZW07bGYst5bk32awSOw7KVem5CjU25iSsGVWw/Rvm/0dEnkxYM
         B7+K55P43rdYJ/EnZoIvLUCCroufNvTx79+mGjXUf982LHcRt/yKmUZUOworh7jyHEKv
         zlCMAP39sQDEB4gr8eR7IUqPuYscm40F5DDutQHSZRzlSaaAUAYEP7uj3Pa69tW8cJkP
         bj10DqdGhzsTt89Jo8GBcCuTWUo4wt4D1sP9u86+tSHbHCm4qePM7yPONbJYcUQyegTJ
         uS6w==
X-Forwarded-Encrypted: i=1; AJvYcCXJKCjo/2gQ31uK1e/Qyg3fYwyt68nDFLqhpYkko3az0UiqJP0tbc3cTwebtt5/flr0OZrYQImfzCCXw1IIedV1@lists.infradead.org
X-Gm-Message-State: AOJu0YxutiOg+gMOm4mcgnnfUIrXgaGXlSM1r/EJ+9XPJ0AqgterG6qf
	dpqxdFzhXit8QCIJlj3ZIC0fEoyUf2hdd5SHi6olwj7Y14pRjvFT50PRY/4BKIFS3QnESB+M/yA
	iFvPyoOkQaA==
X-Google-Smtp-Source: AGHT+IGf/ljX3JnjXsIdWRx5WECI21rxocKvZGW0v63GazO3Xk3AULXotlNLZG82JFTKddhPsrZEmgpTkGDk
X-Received: from iobfm16.prod.google.com ([2002:a05:6602:b90:b0:86c:9981:d21d])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:1486:b0:87c:1424:6189
 with SMTP id ca18e2360f4ac-87c761bf0famr649235039f.3.1753401110609; Thu, 24
 Jul 2025 16:51:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 23:51:44 +0000
In-Reply-To: <20250724235144.2428795-1-rananta@google.com>
Mime-Version: 1.0
References: <20250724235144.2428795-1-rananta@google.com>
X-Mailer: git-send-email 2.50.1.470.g6ba607880d-goog
Message-ID: <20250724235144.2428795-3-rananta@google.com>
Subject: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table periodically
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_005153_089951_24A98F5E 
X-CRM114-Status: GOOD (  16.32  )
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
---
 arch/arm64/kvm/mmu.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2942ec92c5a4..6c4b9fb1211b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -387,6 +387,40 @@ static void stage2_flush_vm(struct kvm *kvm)
 	srcu_read_unlock(&kvm->srcu, idx);
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
+			      phys_addr_t end)
+{
+	u64 next;
+
+	do {
+		next = stage2_range_addr_end(addr, end);
+		kvm_pgtable_stage2_destroy_range(pgt, addr, next - addr);
+
+		if (next != end)
+			cond_resched();
+	} while (addr = next, addr != end);
+}
+
+static void kvm_destroy_stage2_pgt(struct kvm_pgtable *pgt)
+{
+	if (!is_protected_kvm_enabled()) {
+		stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
+		kvm_pgtable_stage2_destroy_pgd(pgt);
+	} else {
+		pkvm_pgtable_stage2_destroy(pgt);
+	}
+}
+
 /**
  * free_hyp_pgds - free Hyp-mode page tables
  */
@@ -984,7 +1018,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return 0;
 
 out_destroy_pgtable:
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+	kvm_destroy_stage2_pgt(pgt);
 out_free_pgtable:
 	kfree(pgt);
 	return err;
@@ -1081,7 +1115,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+		kvm_destroy_stage2_pgt(pgt);
 		kfree(pgt);
 	}
 }
-- 
2.50.1.470.g6ba607880d-goog


