Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41875C54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VBvSn0/1OEly0dhJhpJ5/xbewUf32J5agAZ9eTZnMo=; b=eqYDfHs+qAIrXvaOehKa0Kxe+o
	lyoy7XI50wvlDlqO8Hk1L1hOhXZ/NFVtnj4h3LOr8Mf0+Sol+ooHhXe9YTa6ME8La2iGjfA9xJ+e5
	yp2HKr7JRAqPB2nCoIgGiFLHLmOdQc9OK7mUyAjAIa6qBywqd/U2NLVZNDA5rBg1oy06M/zcXpqqO
	7XuXf/kmlDX6FY7QAnJ8Ti8qRenet1cToS/0/FuGviuh8IftV6GAJ1MF4gsg6gTPy7hIt6RDSjg8V
	Tutl1QLzVWK8xSpclKUBTXMZzL65xOLPSsJGBz9Z57F2ebYjxMOpgzyGcznuAa4eGlM2k8hiMRxzI
	qeXeAH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aV-0000000AIP2-0mkt;
	Mon, 19 May 2025 19:55:51 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5e1-0000000ABMW-1Xtp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:26 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30e9e8d3e85so3209424a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680924; x=1748285724; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+VBvSn0/1OEly0dhJhpJ5/xbewUf32J5agAZ9eTZnMo=;
        b=ZFK2gZiXWKfIvA5w6NEISqmlqGSuZeHif9N/Q6R19bRHv81gsXIK4VEMKnarcqKvg2
         8JgzypVb375W3caBeYhZyd+cKZqc750BeIbkCVvXo6ZJLJHqDRnP3/1/GBbMqbZ8Q110
         ys5TjmQ6G/rrZRssMVNf2JOyzW9pNM+8twPDh/Bjz4SwGDPin45yXsE3xHvTzdq6VhhE
         wbI7fMyQot9jjmcVklnl0W8iED00DuHriN+fgrObp22b09Mr2b+vS1Qzr+3XPeunRlEv
         d3Nk1OiLKPTCnZYQgbDhfKPAlrNC7d7zn5cpMmGknoZc9T0lgDyTO5ZsS7E8Il0F8vlv
         Ndvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680924; x=1748285724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VBvSn0/1OEly0dhJhpJ5/xbewUf32J5agAZ9eTZnMo=;
        b=ttiH5svuB1jXZaUiLb7KRLq7FAKZOgLj5jAvlXLo0KGziXdw81B60LytjTbBq34hMM
         1zA/ld+5qmhxOVOSMONOPxoi5JbkajL/V1x0x6DFNgfQH6QKZZ0yjp5L+4KcAzSZGGOK
         t4PXrspF1bkXrMy2nbIbObr6niTp3L3usSxZVfvDrY37nuEh5orfOSG2K98AHWOXeSk7
         IyRJZY0rzx0M3kAF+eW5PcYW/twjeyI0o1jL90XVC6dHib6cRqemaguagU1CUS/LRH44
         Fe5NZ3G2/NQbmNpg4our/RHjmyUAOpoQZsEZMviFz+J2SlKrsk6TVJulaj9ZdDZbf0a3
         GSUg==
X-Forwarded-Encrypted: i=1; AJvYcCU1AzpUOI6DGYvI5UGSXTaJ2wI/LsHHPXhMvKHP9GwupE8DQkf53uEOKsW1GdRbDkIgY4YQaIx/EY2dEcBMUgBc@lists.infradead.org
X-Gm-Message-State: AOJu0YwYYyVVAEboqbFY5FjpGpZIh81L23lWRaR04ppAoNM58/C4rYfh
	J/XZUJ9s4MDP0cm22SF+bF4uQ/FOUBgHt/UomQnaqEud6hz4gdyg7+xe4+DTfS4STPrT2Nnya8M
	83kpU6g==
X-Google-Smtp-Source: AGHT+IGXg/F9gxTP1pqaycZUwOUHp+ak6N7UkX/Xq88IlBNICngR1I/Ww9ctAKD/SX/RDw3McfSZyBJElK0=
X-Received: from pjg13.prod.google.com ([2002:a17:90b:3f4d:b0:2ea:9d23:79a0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c08:b0:30e:6a10:bb41
 with SMTP id 98e67ed59e1d1-30e7d5a85c1mr21315362a91.27.1747680923944; Mon, 19
 May 2025 11:55:23 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:05 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-4-seanjc@google.com>
Subject: [PATCH v2 03/12] KVM: Initialize irqfd waitqueue callback when adding
 to the queue
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
X-CRM114-CacheID: sfid-20250519_115525_403200_21E4B5BE 
X-CRM114-Status: GOOD (  16.15  )
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

Initialize the irqfd waitqueue callback immediately prior to inserting the
irqfd into the eventfd's waitqueue.  Pre-initializing the state in a
completely different context is all kinds of confusing, and incorrectly
suggests that the waitqueue function needs to be initialize prior to
vfs_poll().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 42c02c35e542..8b9a87daa2bb 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -256,6 +256,13 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
 
+	/*
+	 * Add the irqfd as a priority waiter on the eventfd, with a custom
+	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
+	 * underlying eventfd is signaled.
+	 */
+	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -395,12 +402,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		mutex_unlock(&kvm->irqfds.resampler_lock);
 	}
 
-	/*
-	 * Install our own custom wake-up handling so we are notified via
-	 * a callback whenever someone signals the underlying eventfd
-	 */
-	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-
 	/*
 	 * Set the irqfd routing and add it to KVM's list before registering
 	 * the irqfd with the eventfd, so that the routing information is valid
-- 
2.49.0.1101.gccaa498523-goog


