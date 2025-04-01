Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F5FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 20:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1emrfR/t8xEof5u39JxRR5LEtGKo3o+GNsYerS4PAw=; b=arLShlAMl5pIfcMgTf6UMHoo4q
	tEy8f7u8pwulVCWWjzamQ+bCESY90aRy5+z4wC/trLNox8o+3nJEao+o9EjeMqkpWZHlMqbclpbOa
	prjty1UkfUO+0axebuwZZi0OX5v0CoyU0xcMP0OI3cCwKfMvbUa13vQI0gn7FpQZrVc7S0KXSj456
	IDwcyXarZ4wRz2ZGBk3QjTxBmr4YgDhwNHvz5nS8fEKNR4KNB0jp3Z5dKLFuwC5SiJ6Ug1i7B0KIo
	fmQ+9n6aIQyMHCQQ8lLvh2LwKxMNUGQhvwpFHL7X8nC1X7d4zWIkfU5UZnpw6nNDYhjctsGLdDkvb
	udYnHf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzigD-00000004NoD-3ASJ;
	Tue, 01 Apr 2025 20:57:53 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVd-00000004LAK-3ZRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:46:59 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3032ea03448so11185545a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540416; x=1744145216; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=y1emrfR/t8xEof5u39JxRR5LEtGKo3o+GNsYerS4PAw=;
        b=BgN5OffTtnRQ2WQZ0krPQogGHsySApHi+y1H+GQUcPO0FWvCbi1T/HbuaBXqkNH0Wn
         RzY44w+tpNlZxHGae0GWm4y/uqUBhPTSGntF0aA3fHUyMne66gCYWoNj7xlOyrUd2o+L
         3c9jfAq4tw6A53qrnNtCc/3ZJRNPyaTIB9vHTacALIg8jxNPrFwCoQP9dfn9KFIlwMXK
         dfXdKxqkj/o/yVy4QKiaofYvXc7KOCCZnxuXNuYAIHrQwT5BtWqudaV85LJXxd95PW5U
         aQVkSlkK0ypTIoYklVo+o9qaVTG9tg851qfCcTkQFwdYSYfgW5frnv6YIeVKh/DTs4sp
         jzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540416; x=1744145216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1emrfR/t8xEof5u39JxRR5LEtGKo3o+GNsYerS4PAw=;
        b=dZfSB6voCtf7SVCq0ofTkW7m50xf19x3gP3+BsAGD7UzD7tiI6I6qpvG9+lv+AH3S1
         GQYVzmtEIf5Tpt/5JMKJ/qYxiGnUIbXuKO0PuiLx7hRn9j83YXUUqMOapZVEkPXcy6cD
         wwN/EJZypindbWtV/gI9CB7aaQysGn4DqzA5kDuTtVDMg28mIQauFk8jb+ZPm+v/H4hj
         NMTTENzJHKrbigJK1jj0im99h/OuYEErK9YcJ0vpRUtTkzZGhiFeYm6ytIsfRi6O0z7f
         FBZ3zsRyOcEwc6Y55K2J5Q7EgX144GjT/exPtsMcesXaftCdcvN9/zaEYf2Y6mR2Vc2I
         wmSw==
X-Forwarded-Encrypted: i=1; AJvYcCVs7LlIg1TqyfSva2aBFbL3JV4AodL4n8OGbQh1J5vFK3GB4ddpNAYrZ8qn9vc8UZYIGfBtR7ezQLB6tQHLJ1VF@lists.infradead.org
X-Gm-Message-State: AOJu0YxeU2lAyEqhrq5xSu7bLa5/BES4HvwBGyQPcwRJBtCSxrO1l08b
	sEinBkqxF0/LbHcUGUGXlHG5dSQnY0ueTbLnSIbI5ILYnn221iNiAYBRJx1Ro0Po3z+bMlY4ALz
	NkQ==
X-Google-Smtp-Source: AGHT+IGO2fBqWvuDL6Vwrbo2kzqtang4rRNKtiORi8KQTXOklAN9xTuLpqS5Vs1VfeAZVw4/UWdyo4ySkHQ=
X-Received: from pjbsw7.prod.google.com ([2002:a17:90b:2c87:b0:2fe:800f:23a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38ce:b0:2fe:ba7f:8032
 with SMTP id 98e67ed59e1d1-30531f948c8mr21050786a91.9.1743540416529; Tue, 01
 Apr 2025 13:46:56 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:17 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-6-seanjc@google.com>
Subject: [PATCH 05/12] KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
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
X-CRM114-CacheID: sfid-20250401_134657_889602_83D45CB0 
X-CRM114-Status: GOOD (  17.37  )
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
index 01ae5835c8ba..a33c10bd042a 100644
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
2.49.0.504.g3bcea36a83-goog


