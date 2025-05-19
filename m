Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14596C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbVEyigtTpYBUfAmA+RROb1PjlOCwyJF/+KZ2DppXv0=; b=HBLTs0x54mGCYRLPYmi3csU+OS
	ntJ4dppwKbf+4M32k7RJwTP0SkG1saCvHkkBGbs0yC5L6jLN7fjXsbBeMVO3GgqqXvqEDNaKlZNH6
	aL8HcymbEFS+ln29wim40Li72Lq+Ejkb90y4Thpcvfci1PKsoEBCtmqbCpeeLOwN5Z62DiQC8dbs+
	jA9z4BEDb8wRwbULymvz8Rh1gCgRMTlNdLmwJDA9vrv6LNhOdD0lGQ7vLc/nAK7w0E2TKQBokUrG1
	WB7JjcFNrHuRIE5MR46VJ+qI+PGfmEbi1QugyhMA/2PRnY2zsfQYrp1vG215CMDruTRgekP+vCN9b
	hb6zHuew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aW-0000000AIRO-0bVv;
	Mon, 19 May 2025 19:55:52 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5e3-0000000ABNF-1DZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:28 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30e895056f0so4178961a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680926; x=1748285726; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zbVEyigtTpYBUfAmA+RROb1PjlOCwyJF/+KZ2DppXv0=;
        b=IFMOtkag5GvQQEfaRdBVRDPk3p2SstyPdda7LCVsaAkslB5QTd11OnigxRl6/UxYUR
         o/fz49tlSuBw51s7dY9DdqvmnUwpKkCJkf83OyFCYAATAy/mLTnuirhJIKjZSPl58P9P
         uX8+TMHqPiXWhZuVvoO8p/XO4BysZ/lQ1P5TbRgATWnYdmu51y1ZFjo1mm9InNZMHjX1
         +Tyg5wYPqP/C2KwJIfgXID5is65yYIortR0jv9h+E1Bca+czhWFXwwRtN+XSJoIzg+br
         CtMTBdbMWb+BmVjAz2pXp4Cm8wBXKbtISwGL/wgFz6zr3AE2ip5xRBkNYIOY+4FogdzP
         OyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680926; x=1748285726;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbVEyigtTpYBUfAmA+RROb1PjlOCwyJF/+KZ2DppXv0=;
        b=SO48i4Nms3LOijDgW1O0bo5Mso0B0luCiqtcDB4nBdhY7L8K2XS5RblBqVYGCIiGxy
         30Gy52JJgozDC1qCh2KL2IFSQ4Evs+rrZ0tVZQ+zCRTrmPNB5O3mySGrmNRzm/jShEVd
         ChCyMNxfvcpbyd1UQ8qCbSzjVNW78FCouypvNiO0GWQ5QnznwHo/FX/xisq9nNfVwEgH
         yVV12y3QOWxKn2Xco9iZQW0kMD2IjMxFO632gZkHE5B5/WpbY2Sdnb92QXMV19O39i6t
         idJtnyJjUFl0uM4sJH62AkULYiw1oZ0Azx0UQMFvhd6d2PB49BJteGxmeiunDsjSd6+M
         660g==
X-Forwarded-Encrypted: i=1; AJvYcCVLuoXM1FaxP5v/OyMr1cnQvANyz0DF5WtFhsns/5fXAsSg+UMtVn+9Y0mKMig1Op8ywtYLqb5ZX+A0ns3BN8I8@lists.infradead.org
X-Gm-Message-State: AOJu0YyMI5oHgH7KJPH6P0ZjIOYSoLKsG8lm0CmexMrPoAj3lmaueej5
	+4N8JX28QaGUG1SpD6M6J8RAciSw4Rw4pRD1tanstIfly+jJPMUuGVdjllN0QsrjbWs+JSe/Zz7
	8PEjzZg==
X-Google-Smtp-Source: AGHT+IEwiAdRCUO6qDinbIwLc5KCjzKO7bUCCiwRhiB03/PtedWpTPViBkBaCXXTF0g4MeChAnr+N8qhDr0=
X-Received: from pjbpv17.prod.google.com ([2002:a17:90b:3c91:b0:30c:4b1f:78ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c05:b0:301:6343:1626
 with SMTP id 98e67ed59e1d1-30e7d4f91ccmr18659853a91.1.1747680926230; Mon, 19
 May 2025 11:55:26 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:06 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-5-seanjc@google.com>
Subject: [PATCH v2 04/12] KVM: Add irqfd to KVM's list via the vfs_poll() callback
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
X-CRM114-CacheID: sfid-20250519_115527_328478_78A073B1 
X-CRM114-Status: GOOD (  20.73  )
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
2.49.0.1101.gccaa498523-goog


