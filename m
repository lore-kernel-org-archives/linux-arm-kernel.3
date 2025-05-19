Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC571C54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ID0K77cu4OHC+wFfljvoyA4ejd82lVYZb+u9j8jbS6w=; b=qtNsl1DwdgS7cMB1WpShGFwKXU
	Tgyiy95yEZZCWKkokaR3PRNEDDIFeRnlyO1ooA8RwVf5rRrazuAbNucIFdsudFS5bBH7gYbDNe/zh
	cfsg9qxaNMYOixEUfk9vfdYgdJcjrB21Tvt1RViSGlrVSGG31PCvOwOaAxhKWPebtVenuwsvaH2G4
	XfDdghkp3K074HGcTeCjk8FRB2idsw72ATBbYznB7A02zcbeXts0IC4b8EKvlVJin1Jm9mJtlY/Px
	g6ZfZuzWZmnKLe+/rqUGjUpnmc3LvRALSpUlzfOK4JTxfGn0ZkrCEiqo2Ka1o4+57VtGys5G2i3Bh
	dJ/anu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aT-0000000AILN-1vDR;
	Mon, 19 May 2025 19:55:49 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5dx-0000000ABKv-0o6N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:22 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-af9564001cbso3104543a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680920; x=1748285720; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ID0K77cu4OHC+wFfljvoyA4ejd82lVYZb+u9j8jbS6w=;
        b=JtgiCVi9ZN4ifIQ+nFn0NrXuaEnSv6Lib+GShqa8e0hv7c9+T2kAXxsGU7TVKyanbe
         qB8w7hvjb1ZH5e4WGHfNkrI4BDQxhe9r5EIcBTnQmfZy7ZKITp9COlv0RgIzAg2OLZvn
         JGZ304ywSwFnnx3SlM1cCj3v/iiJh7hVV1A4wia1qNRtB8Sa0wfdxRew7pJVyYkuduff
         TYbFB6qM4z8+pWdi/ypSkZQpdu3mlZ5e7dibiGuvYpM9k+ScJZbWAGVTAEk9QQnu/b5X
         bD3lR0IcgaVWkfeEXmaQ6tD75jQr/K7Kfk+n1IgFfCMPIFym8nWp/Lzcqkliad/wxIg+
         J3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680920; x=1748285720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ID0K77cu4OHC+wFfljvoyA4ejd82lVYZb+u9j8jbS6w=;
        b=Ph52qmkDVMCem7jr0rVfK3vVrwJpolf6e7RPdO5Q6ldUhjIZhMtJF7HvoI4R0byK7p
         sZJCbzLH9HUtahZKVDumTTENp5HgGQkME71uE5oSiOXN4Hzk0MhNLi/0/p7jnJwo7lET
         imKVdoaHj7MBQZ2ISiWh766h337OueH7Gfg0bPVFRpDqzoXlA4rhcM3r8XZTC+YE/sf2
         iIBxYniJLhUsAgI7sxC/XVed3OnAnd059BHNKATN0+vJU1hrIjO9+cPfvJGtjjM0/XlI
         C57xOLQUWbyOC0wOjfbxssPLmOWLGCXZ7Nl8QjR2oaB6lqBydWxjQ8FXTR5f73dnPuOa
         lnKg==
X-Forwarded-Encrypted: i=1; AJvYcCU2RXAkSZGu9QsqCQg8EURUii8Om68UZD8Ou7V0Z1+w0Rhip8Gxyl05COyzjwtQPnE3xwb4cwufzJuWr5CmRPTY@lists.infradead.org
X-Gm-Message-State: AOJu0YypF3xcso+F8cAS4RPFBsmUPLx9HBGWCkLsqBRzeXm+j2IzAE8M
	ZlAataWsIjS+x5GDjIxn7q/d2jyNtCRibnKpLrJ4HyAaEj1QtZB4SuID8ImqYzKS/OrlYIA2FVC
	xRqyGaA==
X-Google-Smtp-Source: AGHT+IEaLF1s48wE5AIuvexHP+HKA2rzrNNO6wCebHCQJZafvZj5yhtA+uxhZqD9qAgjgxLgy4Xu2cmiqA0=
X-Received: from pjtu3.prod.google.com ([2002:a17:90a:c883:b0:2ff:6e58:8a0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d604:b0:30a:9316:75a2
 with SMTP id 98e67ed59e1d1-30e7d52adcfmr23209313a91.10.1747680920311; Mon, 19
 May 2025 11:55:20 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:03 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-2-seanjc@google.com>
Subject: [PATCH v2 01/12] KVM: Use a local struct to do the initial vfs_poll()
 on an irqfd
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
X-CRM114-CacheID: sfid-20250519_115521_229297_456FDF6E 
X-CRM114-Status: GOOD (  16.93  )
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

Use a function-local struct for the poll_table passed to vfs_poll(), as
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
index 11e5d1e3f12e..39e42b19d9f7 100644
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
2.49.0.1101.gccaa498523-goog


