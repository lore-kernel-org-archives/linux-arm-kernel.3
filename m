Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26273C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSc6nvEfNa3Mk9v70O2GwrdpOydgfEuVH7IGLa1xnl8=; b=kT1/g4qcamw5fST6qeF9cs2Ttu
	oKx0TCjuqNXLSoAkHc1Ec1WKowMjn4eM/cQpx7bsui/y2JpEJUe5Nl2mn7eszGURIWK053gKE19Ar
	pWdZ6iXsTQmljmu3IL+hp8/vSFpmBvjFlhte7tAr71t0BePF0W9gIW6KplHvygWcLnA83cavKyUoV
	StjIpseRGUXUjlMuKO2FKJ3MxKMuWPQFRSENZRC71tJQ96FkTwq4joxU7CRqep4DJqn/TqOp/eSaP
	Wv9C9t7Z/Ge3WeGeSM/I3VKTSae/5tVzLJ9M3SG2w2yhGnYOt8Ho5kTCqrLOxQA6ALwJKBSnOIHWP
	5DlyCWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFwc-00000002YaO-3bvj;
	Fri, 23 May 2025 00:07:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiT-00000002VrJ-0qL3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MSc6nvEfNa3Mk9v70O2GwrdpOydgfEuVH7IGLa1xnl8=; b=gy/thXy/5OYmL2gYy9aTGDQ8E9
	2LRpTMIXgc1mYiHm23AnfXDUpWAbkkuc7BIMCD0CzXYn4ns7BRGDxNjgLzkiJkNE/aUlHA5r5AzR2
	5qM04GZxzCiVwLsxncwGYwSmECAC4n2Bb9W2RDTWL1NijqhVXZuB0pquabA98c9KSLn2iaZXKugOL
	k3fc5OH8ZdgqrpD/4yQmFN6tOaeiLREACy8WTD2kkk8mNiq9/2Z+/EpbT533MOokCzbnE6lG3PAE4
	Dk6/NlKdxq45doOXt0vCaP+6XxdWrKS53MRmueUslEObLqmcA2mi0RvxAlecWJEZy8HRTeMPF8czh
	yc+VJk3w==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiQ-000000016ZO-0Oiq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:47 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30ed0017688so4752429a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957964; x=1748562764; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MSc6nvEfNa3Mk9v70O2GwrdpOydgfEuVH7IGLa1xnl8=;
        b=AGaa6ZTf0hToz47X1xwo+0/k0UnyFwLyQq/fDnXSx1H1VsJnn0Hbxo13+8vfGVKfgp
         5ZfwCIcmUTS77T1O49s3q3OC9Nt+3DV7uQ6l4GyW/eC/wKG7oKWkkQ860cYVGFuG9YPJ
         jm0RPZcom+Z6tQKc3T2tdqPVike95bVjVF2ueNHgEUhqHCgevou08iBIfPTMWA7qJQ1p
         nIlf5WRpDkqv2OK6WcMPJMuF4L4bjDNR2/fyfKv9rmrozNs0mtSb4V1Sc31/r2Nvc9jo
         mEvSCmiAxtf3HBvwQ6QDQ5n3cRwlIl5qpqZqcWFsGXCSr9m6ewMxlwDuJjfn+nv2lvHq
         opFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957964; x=1748562764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSc6nvEfNa3Mk9v70O2GwrdpOydgfEuVH7IGLa1xnl8=;
        b=RUwbqLLPeio6iLyDllAfg0TPS0F3q3oLjsRs8qEpX77TGEEZeE/EF5tmoY32swmrfP
         kX8lwrChtxBS1d6BGJtWK5y3vSRYmMlcvS0DeWvaScWOJwvFw/MUmUBVbKXfV7x77+vf
         5xs7mVc0k65+MTzepjDpcg/dSlrFJOrqM+ee1N/lTf1BCqOPPaMjjkz+K9hDZESiVgmE
         Nf40wOTGvLfoBe44/iPRs/DKF8ARIFV4kk/CkGgshkpebsUfJ1tUmb/IlNydi6BLO28h
         xYYmx9xIRlj8C2JgRxAtQp5LLi+RmT+fEHU0UgiZdTHoAAMP93tJ0RcmwrIuQrW5Whth
         d1bA==
X-Forwarded-Encrypted: i=1; AJvYcCVOxRF82aP51gO693PeMBLggpvAKTBRNhuZmFzsr1WGP7lGX3KYwPa3HLI9mDNwEQH1dff89zpRVW2YcFPESOU3@lists.infradead.org
X-Gm-Message-State: AOJu0YxuBeg2aHXQ7juJ9ovCElK/H/WLD2qfKlHuKESX2KfOvMHXRraf
	ErnG5+V0aUv+tFdIjT3KiLa4t0L/TiziHwtVnkLW6spBUekWSKJBCi4vDJU26MHNZ8qtv1LRUmo
	S8Rpo9Q==
X-Google-Smtp-Source: AGHT+IFtihXA1ixlkcjuYPXGi/3nyMcTJqsYkMUIphzCaA6DcRFEslloczpIHH8OqTcj441vz3MgX+UAWJI=
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:2fe:800f:23a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c02:b0:2fe:80cb:ac05
 with SMTP id 98e67ed59e1d1-310e96c946emr1657552a91.9.1747957964380; Thu, 22
 May 2025 16:52:44 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:16 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-7-seanjc@google.com>
Subject: [PATCH v3 06/13] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
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
X-CRM114-CacheID: sfid-20250523_005246_233148_440D975A 
X-CRM114-Status: GOOD (  18.90  )
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

Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and
instead have callers manually add the flag prior to adding their structure
to the queue.  Blindly setting WQ_FLAG_EXCLUSIVE is flawed, as the nature
of exclusive, priority waiters means that only the first waiter added will
ever receive notifications.

Pushing the flawed behavior to callers will allow fixing the problem one
hypervisor at a time (KVM added the flawed API, and then KVM's code was
copy+pasted nearly verbatim by Xen and Hyper-V), and will also allow for
adding an API that provides true exclusivity, i.e. that guarantees at most
one priority waiter is in the queue.

Opportunistically add a comment in Hyper-V to call out the mess.  Xen
privcmd's irqfd_wakefup() doesn't actually operate in exclusive mode, i.e.
can be "fixed" simply by dropping WQ_FLAG_EXCLUSIVE.  And KVM is primed to
switch to the aforementioned fully exclusive API, i.e. won't be carrying
the flawed code for long.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_eventfd.c | 8 ++++++++
 drivers/xen/privcmd.c     | 1 +
 kernel/sched/wait.c       | 4 ++--
 virt/kvm/eventfd.c        | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_eventfd.c b/drivers/hv/mshv_eventfd.c
index 8dd22be2ca0b..b348928871c2 100644
--- a/drivers/hv/mshv_eventfd.c
+++ b/drivers/hv/mshv_eventfd.c
@@ -368,6 +368,14 @@ static void mshv_irqfd_queue_proc(struct file *file, wait_queue_head_t *wqh,
 			container_of(polltbl, struct mshv_irqfd, irqfd_polltbl);
 
 	irqfd->irqfd_wqh = wqh;
+
+	/*
+	 * TODO: Ensure there isn't already an exclusive, priority waiter, e.g.
+	 * that the irqfd isn't already bound to another partition.  Only the
+	 * first exclusive waiter encountered will be notified, and
+	 * add_wait_queue_priority() doesn't enforce exclusivity.
+	 */
+	irqfd->irqfd_wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
 }
 
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 13a10f3294a8..c08ec8a7d27c 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -957,6 +957,7 @@ irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 	struct privcmd_kernel_irqfd *kirqfd =
 		container_of(pt, struct privcmd_kernel_irqfd, pt);
 
+	kirqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &kirqfd->wait);
 }
 
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 51e38f5f4701..4ab3ab195277 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -40,7 +40,7 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 {
 	unsigned long flags;
 
-	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+	wq_entry->flags |= WQ_FLAG_PRIORITY;
 	spin_lock_irqsave(&wq_head->lock, flags);
 	__add_wait_queue(wq_head, wq_entry);
 	spin_unlock_irqrestore(&wq_head->lock, flags);
@@ -64,7 +64,7 @@ EXPORT_SYMBOL(remove_wait_queue);
  * the non-exclusive tasks. Normally, exclusive tasks will be at the end of
  * the list and any non-exclusive tasks will be woken first. A priority task
  * may be at the head of the list, and can consume the event without any other
- * tasks being woken.
+ * tasks being woken if it's also an exclusive task.
  *
  * There are circumstances in which we can try to wake a task which has already
  * started to run but is not in state TASK_RUNNING. try_to_wake_up() returns
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 04877b297267..c7969904637a 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -316,6 +316,7 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
 	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
+	irqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &irqfd->wait);
 	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
 
-- 
2.49.0.1151.ga128411c76-goog


