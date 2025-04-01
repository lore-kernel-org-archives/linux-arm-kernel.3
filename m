Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0EAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amBezYkVNcZuyH4EZC510WvPXbGr3Dq+FrBRP4RH3+k=; b=H6d5JaXGXSmky/CJ6Lo4gUHefy
	kKcbkMvtflhB5R1bxmuq8PkR7Dcm4LbfJOfCWPMVbFSMHoUutTdtwpBntIxVgp8rDB0pVSwdjyd6Z
	PfCl6mWbYjYLWMr3oQbM9o4Aeaxcia98IUTbhm0ccUHyHiLtAMg1srf9F3WsVGUnYkCUYO2jnlVLq
	Iex0zVurBaUJe+DRdN7BJ6cVEvIKLUfG/c7MncJIh2dOuHkACSUEWf3kd7yR/HkjK/QFYQR2c+F5i
	ur7D8wGKQrHWUbrLGVvEomDO01W2LXWgkizCzb5NYqeYEwGBAOKXa2vIPsF7TwDjqiWigk7Hdwn+H
	MX5NFenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziZ8-00000004M8t-1bvg;
	Tue, 01 Apr 2025 20:50:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVW-00000004L52-3eGT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:46:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22412127fd7so83280635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540409; x=1744145209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=amBezYkVNcZuyH4EZC510WvPXbGr3Dq+FrBRP4RH3+k=;
        b=du1YCbEZb7LHWfkJlSVKHXa89Cn3RLggxb0T82710cXbmSb/yL/3KOyOHNPeGmLD50
         uwlrqdxb7WGdvQozzOeEQKxo2W2KA5zuhgGlswZqZ5xR+UkJQQtdqEWDmznLACE3OVVy
         QbVWjpIby1KRYYJYf9YkcmJ32/XMiEEAgQZI80jpUOp+zTuOe/L204nF39cO9O70hphj
         0XlHhG9KnLy/U682mIEfLol8vRaiIz/70yL9/Hsh4vGJh790V+PdnqWe+6cTmPfzd9Gn
         njNX5Whduj49aVfRa1bVTSBTNCNp/WJOuDOT9sdybkGj46EOTnJ299qvy4S/9XvoIfTI
         RouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540409; x=1744145209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amBezYkVNcZuyH4EZC510WvPXbGr3Dq+FrBRP4RH3+k=;
        b=soGB9dIxgfZdj8EHSkh/U/2ujJj2zG22WJwRc/LhEfVZ9FQw/LwiTLvoteXpIW2mUz
         X9cfH7KqUl8X2aq119up2dqWDNRRbB2AjetA2J95dYwwMs48LFoHMJtomicWCFmknlCP
         R/HNy36+e4qCMVgiPQFjuR34J2MU/UXqqUxK3NLkWS13Xe/42Wr6oKfki8j+XKj0PUIL
         4fp4UGbM8aC577kEslaaY7exaIUBWh4ObceXj3LdvpjzRhFFv/btK8miCQvZUzJnM32V
         1oe5vZ4x6YlTClv+r1tgzczRghYrgE31NMWv5a6iNNKpI/aWhNROrBlST7trzmMtggTI
         g7lA==
X-Forwarded-Encrypted: i=1; AJvYcCXSnAN2JFDPnlDL6XNJozxwKeLzcXAmuhHATB5+0Y+6tkg7IL8zb9uEkn5R8ze5l931lyFjNZHBZMM8P/I90HJJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyLW8TXo72aQLOkMuQ5w73Duf7BHVzQlEiEus13L0xvPKejCyrj
	VjXZUHb0NJ7VMNGymrL1NH/46HxG02aq6nraPanOrkNeV8HZzPuOlXQR3qgJfGMuwUcNrx5GxWQ
	yYg==
X-Google-Smtp-Source: AGHT+IEa5pU5FztleJgZ0CTC7h18PjwGLO8G4GBjaSUUoGrBKG+0/CQ77Eky5VEgolWpGWv0RRLt0hcHxXQ=
X-Received: from pfblb18.prod.google.com ([2002:a05:6a00:4f12:b0:736:b315:f15e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:174b:b0:736:4d44:8b77
 with SMTP id d2e1a72fcca58-7398035e5a0mr24221681b3a.8.1743540409565; Tue, 01
 Apr 2025 13:46:49 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:13 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-2-seanjc@google.com>
Subject: [PATCH 01/12] KVM: Use a local struct to do the initial vfs_poll() on
 an irqfd
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
X-CRM114-CacheID: sfid-20250401_134650_904175_25F95414 
X-CRM114-Status: GOOD (  16.72  )
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

Use a function-local struct for the poll_table passted to vfs_poll(), as
nothing in the vfs_poll() callchain grabs a long-term reference to the
structure, i.e. its lifetime doesn't need to be tied to the irqfd.  Using
a local structure will also allow propagating failures out of the polling
callback without further polluting kvm_kernel_irqfd.

Opportunstically rename irqfd_ptable_queue_proc() to kvm_irqfd_register()
to capture what it actually does.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_irqfd.h |  1 -
 virt/kvm/eventfd.c        | 26 +++++++++++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 8ad43692e3bb..44fd2a20b09e 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -55,7 +55,6 @@ struct kvm_kernel_irqfd {
 	/* Used for setup/shutdown */
 	struct eventfd_ctx *eventfd;
 	struct list_head list;
-	poll_table pt;
 	struct work_struct shutdown;
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 249ba5b72e9b..01c6eb4dceb8 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -245,12 +245,17 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	return ret;
 }
 
-static void
-irqfd_ptable_queue_proc(struct file *file, wait_queue_head_t *wqh,
-			poll_table *pt)
+struct kvm_irqfd_pt {
+	struct kvm_kernel_irqfd *irqfd;
+	poll_table pt;
+};
+
+static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
+			       poll_table *pt)
 {
-	struct kvm_kernel_irqfd *irqfd =
-		container_of(pt, struct kvm_kernel_irqfd, pt);
+	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
+	struct kvm_kernel_irqfd *irqfd = p->irqfd;
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -305,6 +310,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 {
 	struct kvm_kernel_irqfd *irqfd, *tmp;
 	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
+	struct kvm_irqfd_pt irqfd_pt;
 	int ret;
 	__poll_t events;
 	int idx;
@@ -394,7 +400,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 * a callback whenever someone signals the underlying eventfd
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-	init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
 
 	spin_lock_irq(&kvm->irqfds.lock);
 
@@ -416,11 +421,14 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	spin_unlock_irq(&kvm->irqfds.lock);
 
 	/*
-	 * Check if there was an event already pending on the eventfd
-	 * before we registered, and trigger it as if we didn't miss it.
+	 * Register the irqfd with the eventfd by polling on the eventfd.  If
+	 * there was en event pending on the eventfd prior to registering,
+	 * manually trigger IRQ injection.
 	 */
-	events = vfs_poll(fd_file(f), &irqfd->pt);
+	irqfd_pt.irqfd = irqfd;
+	init_poll_funcptr(&irqfd_pt.pt, kvm_irqfd_register);
 
+	events = vfs_poll(fd_file(f), &irqfd_pt.pt);
 	if (events & EPOLLIN)
 		schedule_work(&irqfd->inject);
 
-- 
2.49.0.504.g3bcea36a83-goog


