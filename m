Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F87C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7qvTnT5s0mxP5eCWb+NaTk8UKR3m+k6rkKzLbxKznI=; b=cfMrHvQ6htHbNxpzYALhOPg1p5
	+BaerzbGFp0U17qIuucAO1m9Pd213W0MrROuN6X8ZW00qRREU0WFI8eUTzPVatnPpn/y8JNf7jyWZ
	awDlwn7MQkEFpeKK9IK4nYwf6ua4fUe98sxtXkt7K5zhdqBLqpnEjzbsojKAdXRijH2/Ls+hdW8F8
	bvlHv25H0W2nBQsOcCBooiIr6TXTxQk4ysRcqWHxNgCmXQLqWvhtWFvufe2WRZtxpJcy0HJRrQCe5
	AHWmJ/D4LOJPF1Y7DvJqPc9fBJgPMaXP2I+v9UzblCooJun2Mz6DSvB9jd2SsbJX6PKpfkMzqzBwu
	kBpHbTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFsY-00000002YBI-1Qlk;
	Fri, 23 May 2025 00:03:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiQ-00000002VqO-3vir
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=f7qvTnT5s0mxP5eCWb+NaTk8UKR3m+k6rkKzLbxKznI=; b=hRlA3qQ9/rC6GxMvyqz3YEcGKD
	5ZhfbAUVR2DuLP2Nl85hkQmVc9RsR1ijf8IQhOQ5bsr/BwgGCEY54gaKW/fwmN7wh/UIMVvtJmopb
	a7VNRIHR0Rh9wuPdO3Hnma6bjTpOW9vnu2Mqcb3zIXWAslWC9/Nyuor/qNoCpevTV1+GJC4tsd/3N
	mXlVwfJVVylgDKZllTCt34kl6eICWEYpI0dJcCMAqAbqB/7lWKYsbsTmpTcWOwVguxmZ0kaxvhhPd
	9b4cR7h1r3NN5A9ikBF8wVkrkO5+/+K2OQK1LFCX+lYwLel761VPI2SPoA8dyxfFPWVx+p1XI5HQN
	Rvg1mvzQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiN-000000016YD-3G8K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:45 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30e8346b49cso7199512a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957961; x=1748562761; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f7qvTnT5s0mxP5eCWb+NaTk8UKR3m+k6rkKzLbxKznI=;
        b=2GrFOfsFUci+O2gwHGAS66JiweLOd897bYfzdEouBoMKPtmMOH5ZY2m3421Kp7xXVW
         x68Eh6YQFBqMbahbRjEM2ehFwbfSwAG576KmDgkvb9WZ9nbePzFF9ST0eisEIx65ZJWT
         KW8aKEkmumu/dzxpwFidH3yXf4t5EHx/vLUXrIJRWJbTDDIHNEHsEU+ccFE3dB8BnQ2v
         EmRqJGh6BqQt54DXayWY+24btoxVqECJU3ttIDW5BfFGyDGwgLk9CegNcBu72tdOxRIQ
         7w7mgdcHUY+9w/I+4lm21b3LZ0Expsdd256Sq0z2ljr8N58tqHXEPZ7SKG/UN8UQcJFi
         Qczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957961; x=1748562761;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7qvTnT5s0mxP5eCWb+NaTk8UKR3m+k6rkKzLbxKznI=;
        b=h1qOH9vXMlpCtcRLapop4V+fzPZ0GFK8LFHYPtNOcqbBMqf0hBehywL3TPjGlgxu5s
         mjOWrXPropNxQfsKr9IYA6OC+xjio7PLt6Sh8ej4NVRR0J6iJt7y8BdSb+juh3verVc8
         s2eheWD/ppdRF7R9WU0L7NIIZVYM5ibHcrT9Q0xHz8sxAMdEq2OSM4p2MhdR1D2JWFyM
         DxJFNYDJ58cnLtPSNOfBvF+PHgG1LujIC0gwDqjAMT5XBFCaCB/awQN4CWVGIvy72OJS
         sAPYfGgLXdp2vqUQfLtVCfFQN0Q+zt7mRXuEBdZm5OH7hJTl034oe45SG3FQqzzoejp2
         BccA==
X-Forwarded-Encrypted: i=1; AJvYcCXjX4BoY/yAG6EmxqsgVff1LB4wDYI6d75WbI6E//aMe+YoLmsNnspX5Hk59ncsohoVhHddS/TsQ/ALFIX0B1rZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7UXFXwFxko56CWoK7WgPhgxB7Oix6KUVgGtrwO2xRoYkWYSZY
	1tbbhdIhqHyM/Jv5E7an/y9sjMHS1fACd88py0JImJOiVkiLpgctjLTvbSpMgJvrPjBiUVDYMoa
	lIJ08Qw==
X-Google-Smtp-Source: AGHT+IFhLIWMr3ct7tle+BqkfXynUt92dE5T1Ga0fMI6fA92WD5PFOynQ9QIYOuFaunMobUQi3Ht7v2BK94=
X-Received: from pjbsz13.prod.google.com ([2002:a17:90b:2d4d:b0:30e:7d59:f3a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc7:b0:301:c5cb:7b13
 with SMTP id 98e67ed59e1d1-30e830c6247mr35762810a91.3.1747957961111; Thu, 22
 May 2025 16:52:41 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:14 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-5-seanjc@google.com>
Subject: [PATCH v3 04/13] KVM: Add irqfd to KVM's list via the vfs_poll() callback
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005244_088548_158A518C 
X-CRM114-Status: GOOD (  20.07  )
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
index 8b9a87daa2bb..99274d60335d 100644
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
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
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
2.49.0.1151.ga128411c76-goog


