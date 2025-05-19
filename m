Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3D9C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GosnGkQOmy9sXouNtT7tWd/cC5UULc5QRQ9laeft/XQ=; b=PemXAYl+IlWWNOj0Mg3vh4GyWe
	UBWayQt11VjyX7e47n4MGBfTiuGB64zSFTTsXjPLEw9NIzTs893H8drLqIPqseehBrURPBciWHnxR
	6Cp2Lqvv9lz/hZ1HTppANlYcX875sPranGwEZqjYwD4GYi7URFFSP6xyRe+s13puV5Lckw7nMccvU
	ua8X3oFoSuseZI6tNfdxai6Ia5oPJz58ywCWt6y+gJSdWdl3Jaugjh3UkW/5lHNXU6mYfuY7ZNsTd
	QkHtslOQkYPg13sMfKM0MTIS8/iPKYrjaezurz7VE5a2EC/hySjqZ5mU8WUes5MeFOa8dtTLJcpnd
	q/y8bT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6ac-0000000AIei-2rpf;
	Mon, 19 May 2025 19:55:58 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5eA-0000000ABRe-1N23
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:36 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso3003190b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680933; x=1748285733; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=GosnGkQOmy9sXouNtT7tWd/cC5UULc5QRQ9laeft/XQ=;
        b=F32fwXQo4fHRQ9o+qGa3cojGS+QbBZj1hB8A+oQv1okZnZH+3CXKPdHqq7XfhJ7csy
         7ltFouScnIkxV9Gn4v8BWNHXcL2tppfjuBwBmSooKPmyeqrDrm7g5GJfqdspM/akCcvN
         jV6DWTo9p8jJf0f04z+dPAzG8vmQ9g0ETIC4Vp9i4DUeuc67wSGMxq2g3GQOAmNwOhM+
         /lnzPDOk7EkPj6v2ZlIfWGzfm1z0Sa66MVLk5Zc72N9AmSvWDv6jus/IFyFg4PBPieuQ
         0vomlhjbZ2dD+ot/IRiK7/mMSf7ry6rAdFhpzMRvCb5a5WFqND/Fx7y5Es2NhIdEHi4P
         v9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680933; x=1748285733;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GosnGkQOmy9sXouNtT7tWd/cC5UULc5QRQ9laeft/XQ=;
        b=JjtsaZ/FXQlFHf16sYiyB0zusMg5fubcYu1BCUIq2p3T2ozRs/66uT73LSHu1IuwEf
         1/89WZRBu3b3/MF+KO5V/a+sq6U+eWfBmRYwzQ8Yt2Z34d8E6zDwJSmbXTdkP+mVt12B
         yxnyqL/M2ukuabXcXQ9FhEhN0PUboqqqX0bQ0OzixmchDzxGOnsxB9s3jyaaIMvFDQqX
         ogkxhYFPMOkkqdBGGv3fv5a28qmHGyENdTHrsvbpSHQseRYoOXkCm+Mm5QeU9qY+RTS7
         ltShn6od8eSwJmBCk6JzxdUp4T+/fwA+X9zKPjmp5kaffp7sdUT0/Em21jDnTW5NpEat
         3VHw==
X-Forwarded-Encrypted: i=1; AJvYcCX0Wr3SbjJUs7tYlzxpYzVK4lRM5FTHIE6UloP3XcU3ZrzJFVuxQwZ7iKxsp4wM0G6p4jbKY4A8b3ITAVCM/wyD@lists.infradead.org
X-Gm-Message-State: AOJu0YwoBg7V8mieeCCBDtVmXAOq9iAPRNeJ4CwmTLoiGqTpGY7L4vUn
	OE25YwskhxfSUI45DVKIQ3qXx6IZstmFCjvujzqFHnmIQZLsWumX3YrXD07cPvtEgB+jwoXeEkt
	YMpDzuQ==
X-Google-Smtp-Source: AGHT+IF5OGdkKzCp0nPm0pKGJ5Cn3yYZjvTFKZ+Ma7nDq38yX66bRfuqL3GsDOCYJOnomMI2NGvjW+Q4CXU=
X-Received: from pjbdy14.prod.google.com ([2002:a17:90b:6ce:b0:2fc:1356:bcc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a89:b0:215:d9fc:382e
 with SMTP id adf61e73a8af0-2170cc5f59bmr19216538637.13.1747680932959; Mon, 19
 May 2025 11:55:32 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:10 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-9-seanjc@google.com>
Subject: [PATCH v2 08/12] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
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
X-CRM114-CacheID: sfid-20250519_115534_373071_608BA9CF 
X-CRM114-Status: GOOD (  14.82  )
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

Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() to
differentiate it from add_wait_queue_priority_exclusive().  The one and
only user add_wait_queue_priority(), Xen privcmd's irqfd_wakeup(),
unconditionally returns '0', i.e. doesn't actually operate in exclusive
mode.

Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/sched/wait.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 03252badb8e8..b8f6502372b0 100644
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
@@ -82,7 +82,7 @@ EXPORT_SYMBOL(remove_wait_queue);
  * the non-exclusive tasks. Normally, exclusive tasks will be at the end of
  * the list and any non-exclusive tasks will be woken first. A priority task
  * may be at the head of the list, and can consume the event without any other
- * tasks being woken.
+ * tasks being woken if it's also an exclusive task.
  *
  * There are circumstances in which we can try to wake a task which has already
  * started to run but is not in state TASK_RUNNING. try_to_wake_up() returns
-- 
2.49.0.1101.gccaa498523-goog


