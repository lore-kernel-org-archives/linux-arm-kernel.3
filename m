Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB29C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx4LCcdlopyvqbPN/IhBMgG93mXqJFxiV3H6RMakbuM=; b=wkuDkHpxCtYPOgs/62fYQRWIsv
	9e3wawibEpjTdHR7xURSunlF52iYEKO96aHJy8WlAIZuq4o9JQSd/wktAXIh2W5jPuBI0EDPFl3ps
	irUEx9UI2OagZViR7j8zv0GfmBwcNVF0N4G0r78Q5nQm/DSh/s2uRz5dH6w/TTfE1Pq/Q0vNE817N
	8AsPb7bf/yytdBPvD6Sq0e/iDGP0MHVa9ybEvV/5XzBrA2gdvhKPvehA0jLpXECFjQoINpZL+Lwxs
	grbKr9vRE+495GzU89DjVhIjg60eZNMaNJVDK6mdkVHzthEiGF7Ag+7ges0KQKM411WyXOGVNeVI5
	Ox9TJekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzieS-00000004NRw-1Lwx;
	Tue, 01 Apr 2025 20:56:04 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVb-00000004L8z-3fB5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:46:57 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22406ee0243so86284345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540415; x=1744145215; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx4LCcdlopyvqbPN/IhBMgG93mXqJFxiV3H6RMakbuM=;
        b=NvM+xqQMk6xCDm+GlSOqwugiah5+Zr58nvJYrfbwX4hk9OPDZa8ALLepoEY1dglKJI
         sgn2AqRvRGArnTHtwmV8/HNqZdEYB9z657mFkt/LqsvtqWoWbJzE6ciDctYT+Sivo/sg
         0Mmg8cp5k9US79cI4ixv0EssU4fznQoM52PBIwBdP7rFX2FttCRGTImrVMlW7Qj3DACx
         8m1EaSD+ua7idFqNMXgMKMnzFMIcIkz3fbexqJwvxAelZNDl0S5FYGhL75w1eEI1MoT0
         2lu4q5Hwwk1DxXfgcrbPi/4s+vjncSpCF3ykDEz1qUrn6soK+E0CSL0U//7ppxmuGbtC
         Gf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540415; x=1744145215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx4LCcdlopyvqbPN/IhBMgG93mXqJFxiV3H6RMakbuM=;
        b=jg7USIgxpNP7HppuWm/dOrfmpCWhdbvVnnMRxwkmA/RFzgUC0mzfsyPbnTYTAG1RZ1
         rmgZ965Lmwns/yuBUsmx+jPrO7+q0FrIzOiGdMig9Gmr+shrjbo8DDDpJdsml0CQEIB+
         NLswOku81GE6kRmO3ZwXK4N7Ko2jl5DC0ZS2+mfkM/eCvo9xxctJ9mWhPaYE0pdRAwtt
         q3MjHspK8iWz2FdCnAGyI1F355sX5FWoS+9S+6hlg2x86gh+X+yzYk4/Y27Bb1q2dlGR
         2qQW4wHMHaqcEeYJZELshMDKNBEMwPpoxxIj+aW5t3gjwI87RTY2rhWNtuQn6iOmgrQE
         4SJg==
X-Forwarded-Encrypted: i=1; AJvYcCU8u4CdhTbmDidzEIzykPYSbOnmwmS/YYE/3rRL6M2P8erxxSXQtMQtARxPdCfaGOjX+25s6J9m/zsP/pwvE3k9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8rFPuiPeP6h6XQQzHhRQDZh9GtLPE5T+a8xz0wvIk5X4UK6dY
	xCgf+O62YmmVJq69qQ8gtU0WA2sF0idMyP6qBZHMf8zpOo/awPzrbEhgj4dNf+GNgDckSsdepkJ
	kRw==
X-Google-Smtp-Source: AGHT+IHW0sXHX4wMGJ15kvjoFqaPE9awBB7bIk66pU6GUBUvNZBfoLxZ3yipmWjxsb6XuZDLmoik4bMgDVc=
X-Received: from pjbsi11.prod.google.com ([2002:a17:90b:528b:b0:301:1bf5:2efc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2bcc:b0:224:912:153
 with SMTP id d9443c01a7336-2292f942acbmr235734395ad.5.1743540414753; Tue, 01
 Apr 2025 13:46:54 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:16 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-5-seanjc@google.com>
Subject: [PATCH 04/12] KVM: Add irqfd to KVM's list via the vfs_poll() callback
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_134655_920067_251AA754 
X-CRM114-Status: GOOD (  21.02  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add the irqfd structure to KVM's list of irqfds in kvm_irqfd_register(),
i.e. via the vfs_poll() callback.  This will allow taking irqfds.lock
across the entire registration sequence (add to waitqueue, add to list),
and more importantly will allow inserting into KVM's list if and only if
adding to the waitqueue succeeds (spoiler alert), without needing to
juggle return codes in weird ways.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 102 +++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 69bf2881635e..01ae5835c8ba 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -245,34 +245,14 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	return ret;
 }
 
-struct kvm_irqfd_pt {
-	struct kvm_kernel_irqfd *irqfd;
-	poll_table pt;
-};
-
-static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
-			       poll_table *pt)
-{
-	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
-	struct kvm_kernel_irqfd *irqfd = p->irqfd;
-
-	/*
-	 * Add the irqfd as a priority waiter on the eventfd, with a custom
-	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.
-	 */
-	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-
-	add_wait_queue_priority(wqh, &irqfd->wait);
-}
-
-/* Must be called under irqfds.lock */
 static void irqfd_update(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
 {
 	struct kvm_kernel_irq_routing_entry *e;
 	struct kvm_kernel_irq_routing_entry entries[KVM_NR_IRQCHIPS];
 	int n_entries;
 
+	lockdep_assert_held(&kvm->irqfds.lock);
+
 	n_entries = kvm_irq_map_gsi(kvm, entries, irqfd->gsi);
 
 	write_seqcount_begin(&irqfd->irq_entry_sc);
@@ -286,6 +266,49 @@ static void irqfd_update(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
 	write_seqcount_end(&irqfd->irq_entry_sc);
 }
 
+struct kvm_irqfd_pt {
+	struct kvm_kernel_irqfd *irqfd;
+	struct kvm *kvm;
+	poll_table pt;
+	int ret;
+};
+
+static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
+			       poll_table *pt)
+{
+	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
+	struct kvm_kernel_irqfd *irqfd = p->irqfd;
+	struct kvm_kernel_irqfd *tmp;
+	struct kvm *kvm = p->kvm;
+
+	spin_lock_irq(&kvm->irqfds.lock);
+
+	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
+		if (irqfd->eventfd != tmp->eventfd)
+			continue;
+		/* This fd is used for another irq already. */
+		p->ret = -EBUSY;
+		spin_unlock_irq(&kvm->irqfds.lock);
+		return;
+	}
+
+	irqfd_update(kvm, irqfd);
+
+	list_add_tail(&irqfd->list, &kvm->irqfds.items);
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
+	/*
+	 * Add the irqfd as a priority waiter on the eventfd, with a custom
+	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
+	 * underlying eventfd is signaled.
+	 */
+	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
+
+	add_wait_queue_priority(wqh, &irqfd->wait);
+	p->ret = 0;
+}
+
 #ifdef CONFIG_HAVE_KVM_IRQ_BYPASS
 void __attribute__((weak)) kvm_arch_irq_bypass_stop(
 				struct irq_bypass_consumer *cons)
@@ -315,7 +338,7 @@ bool __attribute__((weak)) kvm_arch_irqfd_route_changed(
 static int
 kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 {
-	struct kvm_kernel_irqfd *irqfd, *tmp;
+	struct kvm_kernel_irqfd *irqfd;
 	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
 	struct kvm_irqfd_pt irqfd_pt;
 	int ret;
@@ -414,32 +437,22 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 */
 	idx = srcu_read_lock(&kvm->irq_srcu);
 
-	spin_lock_irq(&kvm->irqfds.lock);
-
-	ret = 0;
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-		/* This fd is used for another irq already. */
-		ret = -EBUSY;
-		goto fail_duplicate;
-	}
-
-	irqfd_update(kvm, irqfd);
-
-	list_add_tail(&irqfd->list, &kvm->irqfds.items);
-
-	spin_unlock_irq(&kvm->irqfds.lock);
-
 	/*
-	 * Register the irqfd with the eventfd by polling on the eventfd.  If
-	 * there was en event pending on the eventfd prior to registering,
-	 * manually trigger IRQ injection.
+	 * Register the irqfd with the eventfd by polling on the eventfd, and
+	 * simultaneously and the irqfd to KVM's list.  If there was en event
+	 * pending on the eventfd prior to registering, manually trigger IRQ
+	 * injection.
 	 */
 	irqfd_pt.irqfd = irqfd;
+	irqfd_pt.kvm = kvm;
 	init_poll_funcptr(&irqfd_pt.pt, kvm_irqfd_register);
 
 	events = vfs_poll(fd_file(f), &irqfd_pt.pt);
+
+	ret = irqfd_pt.ret;
+	if (ret)
+		goto fail_poll;
+
 	if (events & EPOLLIN)
 		schedule_work(&irqfd->inject);
 
@@ -460,8 +473,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 	return 0;
 
-fail_duplicate:
-	spin_unlock_irq(&kvm->irqfds.lock);
+fail_poll:
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 fail:
 	if (irqfd->resampler)
-- 
2.49.0.504.g3bcea36a83-goog


