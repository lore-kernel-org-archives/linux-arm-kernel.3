Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F15C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=; b=kpU4ZAiTpEWc9EYyRrWnXRdWoO
	Jtz1xUR+D3wwvswQrD7nm8/4fX1KnRVJavhMpn1EouOeyAxySM3VkHcIMWow/Ojf8XBCGTEDafy5b
	+F7+Rp4V9tTBcDBht4z71lxGZpF0yOzyWTSmW58FPc2hKm6DO1USeqLgDV3pTNfN1r1xv2B7sttco
	o9Cm+deNTC5w+WoBZBk3fZIBE0Jpd2tujWnCnxkOyAWdd7vu6zSmZM6vWbXCpkr7SyJ+G1QuxTwr0
	1bixHUXUuh7+8C1TOtJ8LvnIpjT3D/QvFXjONk62Lg4iXAmiSC/l4Zdr40CNFfEHR8fLgfN/l6J2T
	LUGq9W6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFmR-00000002WwX-0AVn;
	Thu, 22 May 2025 23:56:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiK-00000002VoS-37Rd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=; b=VvvzGS4zzeh+juLjhQhkZ4wviZ
	eL5uP3ENweNJhq2HPBMBpk4vIToE8L272pz41lEJX+XSXn1Jv/VKI/9rAgTf9A3lyxJNchs5il1/A
	pG7511K+74CvPktZQyJG2fu2n19yDwDyjMzAb7fy4AfThsZvG/MBY61s++NoXk6pYEUOjR0wnu4bH
	m2ZI7hQDl/TPZi4CcOlZmhcoGEf3znkMBPd+WqG/n97DuoD7OUlMXELc/HS042phhXoTukx1qX24Z
	9szXWxbebUHYoSiSzXgf3rtkMELdtmJMX6aNOci5Qe6nSyYH22rcqEfFl/bpT2nwq5uJXbPD32ndm
	0eliCOwQ==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiH-000000016WW-2uiO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:39 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso5492477a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957956; x=1748562756; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=;
        b=IaYv3rTxq2TBxpP8UxgFP9PtGe5OCfItW5FysddaLmaRpq1Q7AMJx2KOtB6+yEpzkB
         Yk9gSln7aMI76C+9OOn+kyyKIuNQMD2RDBh/hNYcWNLDQb1Ag1tsi7BjHirF5+Jx/xjr
         noHGq9JLYug68tIXaZSiH3/Roqilj1mPaCtGvPoE2YUD+kCckH5rd2D4f0lfcOj7eIEh
         ScWCDeQD8M9eIFWpXMgrJ8jAN00NVKf8tvY62z/vNC9bM7S+4L5kb7w+NSkV6qf2Ev1W
         HogRARL4PF4TOv7SLAcCCEndOcT3N6jtrDyfvfeNwgnhH+YiafnFWgG+n9P2rVWSlxhr
         Pp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957956; x=1748562756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=;
        b=KncPi0AO5JAaijj5FxcDIxHQyy6TKuLRv2ke9cOXvMufPsQgAwnFIX3L9wK0l+13K1
         bSHUtuNI1/LH6FQ9KSU/zfhHOApzdknxDoyo+PoeMljR5May//SZ3a6dZ2trSJuN/JBD
         f/uWu3fLnoQWIIh1HRQ2OSNrQBVdd6Wjrr1pMbMnrNpoBotmVz6LCxEygsTZxgu18ULJ
         4yXJ/8BiapbSYFFJPH89I0JHkiIeWrFS4Fvog5jqJYy6lF1tsUpahSVI/85uCRYvPb+c
         TjI4sBlmpgnz0LglacUFLjt5VWI0Y49vmieQqYbRZIDyGPDy7phCdkymELFFFOmb+yVC
         NR/g==
X-Forwarded-Encrypted: i=1; AJvYcCXl/uRwPMX7O8hntOcIFyEhUbnFh1dVAUjUSvx84Qlayy8e2MiGF3c6rMTFmUC3DFR3tk7qpTXYt7MW7y47w93O@lists.infradead.org
X-Gm-Message-State: AOJu0YzVPMvsTC/obElmucG/kdy++9i5+QOEch3ZrpVelivuFleSK+hg
	VelPnZtcW0mSTBk+osSDjkdcyOKy7mRvka5UXip89q6dTKtxPUEMCt6rhvlZMmQg44wZJo2Eeuq
	K9PhYbA==
X-Google-Smtp-Source: AGHT+IHgxAzddO6m+7e1Ux4Efuqi1mCB//KSOWWOaHVhE0t5XleZFmJZnVv1KlYKH2ltYJauaNiIFWTKLOM=
X-Received: from pjbqo12.prod.google.com ([2002:a17:90b:3dcc:b0:2ea:3a1b:f493])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a50:b0:2fa:157e:c790
 with SMTP id 98e67ed59e1d1-30e7d4fe8c3mr35719761a91.5.1747957956077; Thu, 22
 May 2025 16:52:36 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:11 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-2-seanjc@google.com>
Subject: [PATCH v3 01/13] KVM: Use a local struct to do the initial vfs_poll()
 on an irqfd
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
X-CRM114-CacheID: sfid-20250523_005237_952730_269D00FA 
X-CRM114-Status: GOOD (  16.19  )
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
2.49.0.1151.ga128411c76-goog


