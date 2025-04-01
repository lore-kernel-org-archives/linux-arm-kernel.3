Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEA2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA8/rbjSPW3y49ht4xFwJaGU+DA9JsbqwVRp3IHMGug=; b=DlpwtE+yUrFyqcyjBXDoJ7Q4kv
	rEYg5PuCqumZGpVmvqTjYQfqPbxABMgCX7Dh1xlV9J/JTMcjHXn6kMKk1J/CXkI009gcoBXv9iyTk
	02PwGIigDWFF64Zus5NhfN/ymVjGjndeGLiwPdATcMRAWnGoYsyJSlC/jbDn0GA0SCaApAKdBJlUc
	VeeUSQ2qtpsD+PH/V60uhMCtQq23GIGHVnkWJc7PHoA8N5FT/gjfmNrFN5jU/caGZJooBf7P5jpG0
	KOxzuSTXq/Q/1waoz7dda9SZmAjnoRREiC5dj3fan6cFXNpoWpSy6ROfvVlQasTv1k5VIK15giF81
	lAJYznNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzijl-00000004OEq-0Kkb;
	Tue, 01 Apr 2025 21:01:33 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVg-00000004LDB-2ReT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so10764256a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540420; x=1744145220; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=aA8/rbjSPW3y49ht4xFwJaGU+DA9JsbqwVRp3IHMGug=;
        b=IxThQbzzQrO31IferWsFB+DijlPnW90JzJOs2Bv0j1UXzzv8qyPOMwRL484BsKWBUW
         gBL9A82T2GuOwqxbGnQberWJZe4tRnMUVYRVaAFv+VZl5GHHKWK3HMQ8H479xq8c6ikt
         mGYMntbXv9P9ovx72sU3F87e18R9GV6sHI+03AQLqkmhNu2NrAkRRYCfUII/KS8FIOwS
         Ycc6DwuJ+yoZYMfyoeGaGrxcguk6vLZWyCfnuFSxPza0z/VuX3BP6pGGA9hQGj6T5E7+
         xNuX/TgnuGHhBl3bWERqnDX/V5NuuY9rGpS1LhlIYa5kCroopThXKY2N9FE5a6i2vR1u
         XtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540420; x=1744145220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aA8/rbjSPW3y49ht4xFwJaGU+DA9JsbqwVRp3IHMGug=;
        b=VIyJFcK5+vebhg/6qzQ9A3MW3JEaoSSdvqBB5pNCr4Gtb3STqAiZWZHwlP4x4Uxmh2
         nobVOLQ4GhQLc2elZtAXtOcpRQLetsLNN3FvQBgKoMPUAQh/BUd6gUeb7QrRdoT2sAxx
         o1Y69qeiw5nxbRPwnjw/7dCX74vcWlp1ghgmd2JhGfm6o09rmkJrz0WwF/IejBKLCin5
         5zA5S9vg3fwVnzP5jkKaiHFbPxhcQ/+T91j2BIvkm1iwivrmMVIlBG0FmHWCaYpwE+7l
         RI1WpGmICLR7omMpuT12tiEpcE/mA9TV8RolC2QlBu94Hux+E7znb7O25Mb+1op5Isal
         Op+g==
X-Forwarded-Encrypted: i=1; AJvYcCXi2ikQ+17kkTMVnvhsaNQZWg9z2541siYxf1lmq4o0EuwxIFbgvdUzGPepn8Tl1GBo1vpIHUyQScxB8+Nywnyo@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJt6M3FerThZCkB1r23kpy8uvOnSssCC6X/Bv1+RLnz1T7rEE
	X+2JgToeQKWSMK4EizOyK5vO+pcUi68jRrkTYY43o/9W8G4xSQGJxJZGRHbvCCC9GhqY3soJcGg
	HGA==
X-Google-Smtp-Source: AGHT+IGGwFEdDMuZ0xntNe6yk2g8zeyEv/XFu/sxHNOeaskOniT4X4IpuqAn0QXf3B4CSI533+/1l7AS/qA=
X-Received: from pfbby7.prod.google.com ([2002:a05:6a00:4007:b0:737:6066:fee8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9f07:b0:1f5:709d:e0b7
 with SMTP id adf61e73a8af0-2009f5b5002mr26259502637.6.1743540419700; Tue, 01
 Apr 2025 13:46:59 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:19 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-8-seanjc@google.com>
Subject: [PATCH 07/12] KVM: Disallow binding multiple irqfds to an eventfd
 with a priority waiter
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
X-CRM114-CacheID: sfid-20250401_134700_624958_7F008F38 
X-CRM114-Status: GOOD (  21.12  )
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

Disallow binding an irqfd to an eventfd that already has a priority waiter,
i.e. to an eventfd that already has an attached irqfd.  KVM always
operates in exclusive mode for EPOLL_IN (unconditionally returns '1'),
i.e. only the first waiter will be notified.

KVM already disallows binding multiple irqfds to an eventfd in a single
VM, but doesn't guard against multiple VMs binding to an eventfd.  Adding
the extra protection reduces the pain of a userspace VMM bug, e.g. if
userspace fails to de-assign before re-assigning when transferring state
for intra-host migration, then the migration will explicitly fail as
opposed to dropping IRQs on the destination VM.

Temporarily keep KVM's manual check on irqfds.items, but add a WARN, e.g.
to allow sanity checking the waitqueue enforcement.

Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 54 +++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index a33c10bd042a..25c360ed2e1e 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -291,37 +291,57 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_kernel_irqfd *tmp;
 	struct kvm *kvm = p->kvm;
 
+	/*
+	 * Note, irqfds.lock protects the irqfd's irq_entry, i.e. its routing,
+	 * and irqfds.items.  It does NOT protect registering with the eventfd.
+	 */
 	spin_lock_irq(&kvm->irqfds.lock);
 
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-		/* This fd is used for another irq already. */
-		p->ret = -EBUSY;
-		spin_unlock_irq(&kvm->irqfds.lock);
-		return;
-	}
-
+	/*
+	 * Initialize the routing information prior to adding the irqfd to the
+	 * eventfd's waitqueue, as irqfd_wakeup() can be invoked as soon as the
+	 * irqfd is registered.
+	 */
 	irqfd_update(kvm, irqfd);
 
-	list_add_tail(&irqfd->list, &kvm->irqfds.items);
-
 	/*
 	 * Add the irqfd as a priority waiter on the eventfd, with a custom
 	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.  Temporarily lie to lockdep about
-	 * holding irqfds.lock to avoid a false positive regarding potential
-	 * deadlock with irqfd_wakeup() (see irqfd_wakeup() for details).
+	 * underlying eventfd is signaled.
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	/*
+	 * Temporarily lie to lockdep about holding irqfds.lock to avoid a
+	 * false positive regarding potential deadlock with irqfd_wakeup()
+	 * (see irqfd_wakeup() for details).
+	 *
+	 * Adding to the wait queue will fail if there is already a priority
+	 * waiter, i.e. if the eventfd is associated with another irqfd (in any
+	 * VM).  Note, kvm_irqfd_deassign() waits for all in-flight shutdown
+	 * jobs to complete, i.e. ensures the irqfd has been removed from the
+	 * eventfd's waitqueue before returning to userspace.
+	 */
 	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
-	add_wait_queue_priority(wqh, &irqfd->wait);
+	p->ret = add_wait_queue_priority_exclusive(wqh, &irqfd->wait);
 	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
+	if (p->ret)
+		goto out;
 
+	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
+		if (irqfd->eventfd != tmp->eventfd)
+			continue;
+
+		WARN_ON_ONCE(1);
+		/* This fd is used for another irq already. */
+		p->ret = -EBUSY;
+		goto out;
+	}
+
+	list_add_tail(&irqfd->list, &kvm->irqfds.items);
+
+out:
 	spin_unlock_irq(&kvm->irqfds.lock);
-
-	p->ret = 0;
 }
 
 #ifdef CONFIG_HAVE_KVM_IRQ_BYPASS
-- 
2.49.0.504.g3bcea36a83-goog


