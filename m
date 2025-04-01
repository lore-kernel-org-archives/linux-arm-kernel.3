Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C18C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAZ6HcZyPVHZNs/NiQeU2YPtsx7wIdUpIqdNXxdK3gA=; b=LwLDdo0Aw7YMtArXqomqkroauw
	9zEmAgc9GCMWZU1PwpSPE1SR+Qbost6TgLBob+VS+lRYVKXBAWaJpy9+R1taukVa+kF73ewfI/K2m
	Z+XNnxAB3GBau/OCxHVQxyG+LBjbJcan/pqvA9E5jU8Ze6bRKF96S0WUox/W9QUshYjplnBCMrK1q
	SWAnLn4B9H4OryErxIitu+E2RgpHplSSRugkwdWZlz8cyyC3tD6hoZv/8aNa3WjJnQRTuh1kZQFbs
	PuUhh9n8abzPlmlIGAza5mrZB/hjpRxW69PjEK2LGCJ6+eS/r+e6wwxulZ371xDNZadOrB0gXUh1x
	wv+1luEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzihz-00000004O1e-0ak6;
	Tue, 01 Apr 2025 20:59:43 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVf-00000004LBn-2POY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so9883606a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540418; x=1744145218; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XAZ6HcZyPVHZNs/NiQeU2YPtsx7wIdUpIqdNXxdK3gA=;
        b=DC4YfU78+DaD+OkRMJ1YtRk2v+xiRgZafuhOEsY+yVHifEU/ZZw+nsNigfOYnOALRR
         xXiWuhn68+sJTaFDsQvPSTvPBvyUOIXTUQ3SjvUzqXxYt3EoJkKVNmPqgQdpHRvAFWO4
         CweWfP6tSuTrIJoB6DzoUaUYQbJFGiHhR77PZCzkIB+CqmYp4t28moKP4mTcweSybXBe
         x+sKxh8/8gGiwIeDYrY+bkdSH0XtWqPkbweCrY4YLXiCvzR7b8mRHMArXOirq3dJXAyn
         6u4oVBrMGeijqKykmIGBs5vZUYpYO/VV6pWkzMF/4Jr+vMcOFwKCdtX6QGYAuvcPr3xU
         Tx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540418; x=1744145218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAZ6HcZyPVHZNs/NiQeU2YPtsx7wIdUpIqdNXxdK3gA=;
        b=bP2gypYtBiW0eCfq3KXtFgCcZShFzOn5qXsWoyu7EAZzs0U3vabSsRMeSIUMrxIFj3
         j9/fdizmGYiDz0q5173S8iaR5bdgs/Tl8CFSlcEGqnS707SGHNnKEaFV8+yBGAE3KnYT
         R+h0W/OlXvcmFhaSEu2Ph68dfnIngUOTfm6ziXpjovg9g0CibvJShtu1Hn9odrkAzeoz
         iBe3oGs8aILPla7zBG8mfxUL65zfoWwuLdCxgxshwgHqpOZyz3bm2082SGofaGh1+Jsr
         bGbatGf9gtDybKmDQSw3AwJFzBpWQ2AUgdauRroEfkcTfvNcf50useiL3Ol2t2bPDYwx
         g90A==
X-Forwarded-Encrypted: i=1; AJvYcCUADs86zzm2QXhucK1DNVNVgJbR6kZPBe46t25QJPVJnR7fYteU+jcqzHMMvod2r3PRs6cnD+UKlxkufzdo3R3Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6TRk3K8d6iwwRdHXrROVNDazccLzdy48boXx91UDugTojGQBO
	p1aK2pQaDrdlF4bbWnj7Ii1Lk/IwxgyAjmEiUptUtQUeBENVKOWA0TCtVjYLCXDIhCoi2Am7jOv
	quw==
X-Google-Smtp-Source: AGHT+IFdQSCduwNTHLV/nec9/i/BvW+thtXD97niBCIJ/k+4mEqw+xFFVLw5YdqLnoDpAq+BRV3lhigqiIM=
X-Received: from pjk16.prod.google.com ([2002:a17:90b:5590:b0:2ea:5084:5297])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:574b:b0:2ee:9b09:7d3d
 with SMTP id 98e67ed59e1d1-305320af3e0mr18907665a91.19.1743540418245; Tue, 01
 Apr 2025 13:46:58 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:18 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-7-seanjc@google.com>
Subject: [PATCH 06/12] sched/wait: Add a waitqueue helper for fully exclusive
 priority waiters
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
X-CRM114-CacheID: sfid-20250401_134659_604429_D8932C86 
X-CRM114-Status: GOOD (  15.36  )
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

Add a waitqueue helper to add a priority waiter that requires exclusive
wakeups, i.e. that requires that it be the _only_ priority waiter.  The
API will be used by KVM to ensure that at most one of KVM's irqfds is
bound to a single eventfd (across the entire kernel).

Open code the helper instead of using __add_wait_queue() so that the
common path doesn't need to "handle" impossible failures.

Note, the priority_exclusive() name is obviously confusing as the plain
priority() API also sets WQ_FLAG_EXCLUSIVE.  This will be remedied once
KVM switches to add_wait_queue_priority_exclusive(), as the only other
user of add_wait_queue_priority(), Xen's privcmd, doesn't actually operate
in exclusive mode (more than likely, the detail was overlooked when privcmd
copy-pasted (sorry, "was inspired by") KVM's implementation).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/wait.h |  2 ++
 kernel/sched/wait.c  | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 6d90ad974408..5fe082c9e52b 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -164,6 +164,8 @@ static inline bool wq_has_sleeper(struct wait_queue_head *wq_head)
 extern void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
+extern int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+					     struct wait_queue_entry *wq_entry);
 extern void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 
 static inline void __add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 51e38f5f4701..80d90d1dc24d 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -47,6 +47,26 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 }
 EXPORT_SYMBOL_GPL(add_wait_queue_priority);
 
+int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+				      struct wait_queue_entry *wq_entry)
+{
+	struct list_head *head = &wq_head->head;
+	unsigned long flags;
+	int r = 0;
+
+	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+	spin_lock_irqsave(&wq_head->lock, flags);
+	if (!list_empty(head) &&
+	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
+		r = -EBUSY;
+	else
+		list_add(&wq_entry->entry, head);
+	spin_unlock_irqrestore(&wq_head->lock, flags);
+
+	return r;
+}
+EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
+
 void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
 	unsigned long flags;
-- 
2.49.0.504.g3bcea36a83-goog


