Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7A4C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLDErP7lwjTldw1/pS35D8l5zAYowrsUowCS37TMy6E=; b=i4hE4ZKBh5gs8A4NI2Yk9cWtqJ
	ME1JFT+ysG+XvXAc8oa5U1VFpgoH3rqsOhN/naZOUeiQUoEX1O2PsdbpQE3jJL9/iUW+plv9hH3yv
	pbufl22UH8inBzxuXNOEAGHyu20UlgjGujanZo36LrOR3jt/pAgyB7VbIeXjZoLiyMITmI/4DX57r
	yej1jquM8of6PLaCRP01kB114/xiX0DT6DxUIAXBrcq0Ntp7w7SnWo/P1wn3vFOAUcu0RRTmNb7gC
	qqQghmffUuOJ2QN5DfYzggA4QBrQ8cwEkbLRYD5A3E1+HYsOeT2i1o/C7+CuNE1eNEJWe9Q2wtGu6
	OZP89Vvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFua-00000002YQU-0jey;
	Fri, 23 May 2025 00:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiS-00000002Vqt-0pTl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LLDErP7lwjTldw1/pS35D8l5zAYowrsUowCS37TMy6E=; b=dNQaSw3RqPDwP9WHcZaxI8neJE
	98uV0MeGrNt0mUeNr7AC8E2P6Lrnwihc/ngU2zgbEQLRm2riplHUwwYnK4AHoq1pdgOQUROuQitgE
	bo3eIzsPvApBRScb46/A09HnaWdhwd6bUoKBgz+hmnSMvR5a0FV/p/s5x880ELrUM/pvv4y/eY9vj
	QEEbHiR9hy6HMVr+BPDC7DKZwx9ZALe1RcQ2ZE7htKeOPyWG8IVliBau+WyKgXPN4lHSHSGho+eRC
	PlF2XR1i+2M5v7PoaWSS+wmxpf5lR9dsjs6JLrDW/we4K0Rzbk82c4UKzXNr9y0prJ75gEsgXNM4N
	tbA6MMsQ==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiP-000000016YX-1ieY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:47 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-231d13ac4d4so116209075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957963; x=1748562763; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LLDErP7lwjTldw1/pS35D8l5zAYowrsUowCS37TMy6E=;
        b=IKq1SJTEqASbkjZmbM5VvIrnAeaCAtABJGGK6y4q7HwIUTXDK9psNxb/ky0YJOkhEN
         uNrIMythqiXgB2phN8wG4kMwABeLABzjdA+zAveO2yt0ZUy92QESni92TGRwS0qt7Pke
         RmOzG1rfRdY+BXeU15apasxk55jk64p23+RAmHWPrFMGDzrLWK7xz+aUZVlApUGSJjRt
         hc3C6A2OOxep00OJI3fKn6QJ8r9dldB4gozJCJ9o+p6W0tWkGa5Qfp+HUlfCJMy2MDf1
         7ptGti1dpt5PCHVgfma1lSxT6W2xEYL5cfjurnORBg119y8LIBzbJ4ijdGTf9LiKUW6p
         3zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957963; x=1748562763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLDErP7lwjTldw1/pS35D8l5zAYowrsUowCS37TMy6E=;
        b=LRigxPlxIau2BkLBcA/WkuK+PiYpGWZ8trqsrBVz6lwWh2ZnX8u0atq3/YXc3F5sFH
         kzwGAGtd9PSZ0jhr6csoTU7ZaFdfA4t0xn58sWnxl8+6RffmlBIkMp8byVHzou1b8zRv
         hZD2/34HaElIMZTMFJYaXiNlLfTk11/DT022Z6507ZJsqHbdb0gEQsthdqIeScu1jmte
         /8+oNLRKFU/bG9nJry8NksMnyh2SeqM7PIE9UUw3Ok+gnBPQnL1uK1QeGpM/9EbTlg5h
         1imB2nQdDR9lOVe4XNsn1M3wSYKXrT58XmnwQ4mkSe+WiCY84vaKXvSE9SZB93AG1KUo
         5uqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWojUlTexYvJmQs5MG7yeuIMO9llybGe+xhUSeXkzoweKCuP6blYu52UMjwjG6CCU7pS+ieesPnnBcCpZTK1UKW@lists.infradead.org
X-Gm-Message-State: AOJu0YzyhXKr+jlSmClXukR++/XEAuX1fX+6B6RfRMPhQCPQeX5iOkWi
	e8JPhGy09OyVPjGVjFzQP6s9sommS+uOmMbz7iUeheMgZ8jHyrys6No8pI1T6Y1N8SFZK3jOg+K
	Kj9NbHg==
X-Google-Smtp-Source: AGHT+IHOq6Cu35CTphJBsObc11lhP6kmwx8FMCg+YC2dNqr/wE8KG8ou9486KEEIS+EkPDFQhABlYWoiNSA=
X-Received: from plhi16.prod.google.com ([2002:a17:903:2ed0:b0:22e:4a61:5545])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e808:b0:22e:3c2:d477
 with SMTP id d9443c01a7336-233f21ae905mr11694945ad.25.1747957962830; Thu, 22
 May 2025 16:52:42 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:15 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-6-seanjc@google.com>
Subject: [PATCH v3 05/13] KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
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
X-CRM114-CacheID: sfid-20250523_005245_597440_100C7E1E 
X-CRM114-Status: GOOD (  16.69  )
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
2.49.0.1151.ga128411c76-goog


