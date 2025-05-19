Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A829AC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzOWtWZ17B97iG5Cps4S6OXY8vgm63oceMRcqA1Kf10=; b=IrigeYAYrR3ZhxshhEaue1ABtX
	ohJklIVBbBsjm46x1opEK1xmUXsrE1VGomU5PSrCgqY5DCudwwHrhuFRis6qG61HQCUjb+loz0K6d
	/iTzwb1x7/IQOL8IpoLLx6N/4F8smcjuDh5NInVw71RdY9X41Phh+eEh5bguAY3eDUqexr2fa8bwS
	hn9Jl+DzDVz7Rf2Lhty6lGuxvUBFrRN4hB0NveL7rpqaAVlYbL+YPYDQ8W3DlzEAIzbCAUmTDyE/a
	IMDHCd+NvSC7gQVQJAw4iULK8hA/uhW00gvTkk6XaLS6uNPZWIvb2xFajdlEFsZmmEpsQVenLgMem
	Bl25I3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aX-0000000AITF-0IyQ;
	Mon, 19 May 2025 19:55:53 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5e5-0000000ABOK-0N6X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:30 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30e9e81d4b0so3552257a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680928; x=1748285728; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yzOWtWZ17B97iG5Cps4S6OXY8vgm63oceMRcqA1Kf10=;
        b=S/HuJQZeQZ7GjfSpmkg4FiZL1A9xZqfiZp9Frcuzwe9bERZWTVMGefNPRKyzOfEJvS
         235g6MxEegW9nE3R5TLdYBUF+2dXgtH4U1E4KwUr2SsyN/vNAmT5KYqBh2GTyf7mrwVd
         0e7qhltIL4qEMyKWelDK9gm4IRFHkZbTWuV76icym8M21zqXlHpq1zLOLzyHsU6Ift5B
         v7yiOjIvAnuXcVmF2GVNIGsbuFNeXlS6b5dAqdw10PIeKLme3Ih434L6gGMY96q/1pxl
         rKjuENnm/l7+zp3GZZVczQBuBitFeaF/rLoQ32hwXsgWWl2HtZnyyVqEtp9NT/E67Nsu
         5icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680928; x=1748285728;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzOWtWZ17B97iG5Cps4S6OXY8vgm63oceMRcqA1Kf10=;
        b=B1DNdeVKzGgOW2R80L8wW0kg6LKNc9R0SEScU1ZCdPrZPjRZIQ7CsVPP7kbvVtiI8i
         Fw3i6fDFFjxHAMpbWKeQOQGoAiFSTZqihnzKgXtmBUt8c0hLwEpBS3K7HeayVK8aOp9B
         l7Gbi4YYQyiFa71mgWYV0Kod1cIhFilDuW/UHYcAtktB/pVD4ZyfEYX/InUohu/dW2ua
         iKG+SPO90UZQfQOm+kjMs9QjwFoGg97roH5MmwAxKWWxK12z51urai45tcQRUwVuoIL9
         Ffl2Wy7j3Xgndqd+dkw/1838hko4UIMFB7XBHFD71CJjV+eEmbrgZQXf5qFxU8zBIbX2
         EocA==
X-Forwarded-Encrypted: i=1; AJvYcCUkRsEVPqcAd540rIU2zQ/QrnDM/s9KH6d/pe7j4AIGSOVWqwlJHMweNsz2LXe0ruVpHsEqhc1tAySL6mfDtDkz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8oap6wvb0oF6fHhM4HiVdw7H7N1y8s61S73mPabcPejOoxj4Z
	v2Gi9ANmSkdenOkWM7bi48R4plItn/Hrt0iZt4liw/xCJcGgsYsWdaz6j4BPUASdxpovuFCjfK5
	O2zrUUA==
X-Google-Smtp-Source: AGHT+IF4CHreF9GYhizgGap1CjiBCuQFeZKtOe+ZDk0WbGkBJzfweABFcsSXBbTResROqvG8ccbJeQWMTR0=
X-Received: from pjbso6.prod.google.com ([2002:a17:90b:1f86:b0:2ee:3128:390f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd1:b0:2ff:6167:e92d
 with SMTP id 98e67ed59e1d1-30e8323ee6emr17930934a91.32.1747680928036; Mon, 19
 May 2025 11:55:28 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:07 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-6-seanjc@google.com>
Subject: [PATCH v2 05/12] KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
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
X-CRM114-CacheID: sfid-20250519_115529_129219_4AEE48D9 
X-CRM114-Status: GOOD (  17.16  )
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

Add an irqfd to its target eventfd's waitqueue while holding irqfds.lock,
which is mildly terrifying but functionally safe.  irqfds.lock is taken
inside the waitqueue's lock, but if and only if the eventfd is being
released, i.e. that path is mutually exclusive with registration as KVM
holds a reference to the eventfd (and obviously must do so to avoid UAF).

This will allow using the eventfd's waitqueue to enforce KVM's requirement
that eventfd is assigned to at most one irqfd, without introducing races.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 99274d60335d..04877b297267 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -204,6 +204,11 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	int ret = 0;
 
 	if (flags & EPOLLIN) {
+		/*
+		 * WARNING: Do NOT take irqfds.lock in any path except EPOLLHUP,
+		 * as KVM holds irqfds.lock when registering the irqfd with the
+		 * eventfd.
+		 */
 		u64 cnt;
 		eventfd_ctx_do_read(irqfd->eventfd, &cnt);
 
@@ -225,6 +230,11 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 		/* The eventfd is closing, detach from KVM */
 		unsigned long iflags;
 
+		/*
+		 * Taking irqfds.lock is safe here, as KVM holds a reference to
+		 * the eventfd when registering the irqfd, i.e. this path can't
+		 * be reached while kvm_irqfd_add() is running.
+		 */
 		spin_lock_irqsave(&kvm->irqfds.lock, iflags);
 
 		/*
@@ -296,16 +306,21 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
 
-	spin_unlock_irq(&kvm->irqfds.lock);
-
 	/*
 	 * Add the irqfd as a priority waiter on the eventfd, with a custom
 	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.
+	 * underlying eventfd is signaled.  Temporarily lie to lockdep about
+	 * holding irqfds.lock to avoid a false positive regarding potential
+	 * deadlock with irqfd_wakeup() (see irqfd_wakeup() for details).
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
 	add_wait_queue_priority(wqh, &irqfd->wait);
+	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
 	p->ret = 0;
 }
 
-- 
2.49.0.1101.gccaa498523-goog


