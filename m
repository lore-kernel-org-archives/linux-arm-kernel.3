Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B1EC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3P69QZyor5mPxi6VRLU63qMkHWb4fsadpuY2Dn6pwA=; b=vvanfesej/2kHYNi6gYallurWU
	h8HY0d0zDuma1fxMs7jRqdp57fZkqWMB5ubrhf1Ld+Wt7xRuT7RNJD5Xq73QzdDIc7ptgklmDXmrh
	6aDIWSiW0glaLdC6PwC7iWhOvoz9x05WfnmiFB09O5vkHSZ3AvL4J2s8yCLFcGEJI4+nkkti0huqI
	PCwNI/L5JG2DLLLhawSo80/2++l5WFIIh9n68fk9Gj4Gy0f5wlmiLPtsJJkBVqHbgN78bbe1Xmbmb
	5bZs2N6U/mHtKM+YwnrcwUSQ9UQ+qLfzRfKZSszA6y1ouyg40f90dQiC3Y9cUp+PHiI45dAeAznvv
	CTTOL8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aa-0000000AIag-2Zye;
	Mon, 19 May 2025 19:55:56 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5e8-0000000ABQH-1oQ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:33 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af59547f55bso2847137a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680931; x=1748285731; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=z3P69QZyor5mPxi6VRLU63qMkHWb4fsadpuY2Dn6pwA=;
        b=Uz8qw930IZthRcPXNZgrg2tTF+nVRBVI0cPypKkG1gXD0MKLWtE5McKeS6SW5NbDB0
         tCN0YoSwV+Xvg2UMTcyKd5YhzgP80DN7IILXqyuSHgqRMome1TutzY1xRV12WSPLvBGS
         XGDfc/oL24KOykwLwKjhZ+FIxbVoAbzs7gC8BeauV1FT76oU52VBp+LUWM88sgXRNck2
         ffvR0NBXOdiDu2tf9lXcmno67VrH5HTNsUAqnTVVF5dPA3ga01ZjzoHnsZ0ByLDofmst
         kIKP+R+x6d92XILjOVmqi/U/AS3JSESTWYPmb2S+QIjHVTY52Ue1lM1egIkN3FII69QL
         20lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680931; x=1748285731;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3P69QZyor5mPxi6VRLU63qMkHWb4fsadpuY2Dn6pwA=;
        b=O9eka6cljp43MrdpcQRqRnuO+Qw4Y4sDiYhOcHPOfqJLp1zUnACjHdCWMDmo+9YZvm
         PeVG29GS/+AYAcCavusx0/WcrTyeC7M6/VeHOEdQxt3xyYd2quljovhglJuzOhAQKfnA
         7iAwUzH7jgTGsY/INLdcZ2ssB8aNDocyRN/fyKmjHqswrD3iRlMAA3CQ77p0BjR3hYb2
         p1kxzi78K4z62vGS/U9ScWm6vGYrduKGpMkV0tb1x4GFrtZv3r1Rf3F95zcecbMWeyQT
         SS91vBXTi7ymWUpWU3GOdBaz30dbj3THLxGS765cmPw+DFlus54eNaPd8TopU4fshAMI
         tfBA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+XADbH4GTM4/OnmUprZiL6z5eSxKYB6VR8tdi8A1MzlE8KKDSRR1xBb64YsPKOWdQ19SMNZ93x/tWvLGFLLp@lists.infradead.org
X-Gm-Message-State: AOJu0YzLm58nLBeNLQLoIb4v/JqQDQ3ul/3Uxtmncc1TvnWGEFPMDNR8
	MNcI2UKFMX1djn5J4P6GJBtzF1GTULj4voyI5VwFSXzVMmLt1W/IZRS4+sFwl8HfR+T5q/zPb65
	RZE9g4Q==
X-Google-Smtp-Source: AGHT+IFA9j9P60jaD9boVYX8hbXZAkB3Zgs45T+xHk3Xso4t9vp7uJB4CdjShK0beY0cstYrv/15W251W2g=
X-Received: from pjyp3.prod.google.com ([2002:a17:90a:e703:b0:2fa:a101:755])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c883:b0:2ee:e518:c1cb
 with SMTP id 98e67ed59e1d1-30e830c797dmr22228101a91.7.1747680931219; Mon, 19
 May 2025 11:55:31 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:09 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-8-seanjc@google.com>
Subject: [PATCH v2 07/12] KVM: Disallow binding multiple irqfds to an eventfd
 with a priority waiter
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115532_475058_6B1D9BE8 
X-CRM114-Status: GOOD (  20.96  )
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
index 04877b297267..7b2e1f858f6d 100644
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
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
-- 
2.49.0.1101.gccaa498523-goog


