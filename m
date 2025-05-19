Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE0FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABmmeW4kIHS5pR1wBXW3o3AUaaWLHITX4FAWMNC72BE=; b=WEBZ9aTjD5ds4J1rmUK9WeiucV
	wDCM/Jtgpgl7yAwIXOdVnv9uA3SiV5tfaUMoD/6hUAfMdWxa0ZLv5Cj/G77mHW9quOfK1A0mAM6na
	kLrGw4a24AO7VyaMX1p2UKHjDAiN8cgWZqv+9KeUxuiuE/Km6HMaRvnn4RwJGlQB6qDBnZf5ODbaF
	kscqN3MJat0+AWgxYdBLQPLwR+IEfZNMa1PYq/+nfvMpDW6nq1qlWSULx8AceZmg6kWM60RvTyrLj
	VKlre/NTcFgwZltG03lRrEirBh+KdhVsCbKbSR0SBkyh9U4AmzHJgEd1WpHs3zJ7uWf+BVpMBXkJO
	wSJ2rpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6ai-0000000AIoq-41UH;
	Mon, 19 May 2025 19:56:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5eB-0000000ABSn-2l79
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:36 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b269789425bso5151404a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680935; x=1748285735; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ABmmeW4kIHS5pR1wBXW3o3AUaaWLHITX4FAWMNC72BE=;
        b=NiacG6kEqSpVG4jU+2DnvmpP90UKspgAyE/7kjfTRrv33S1JWh5tZUK+QOQXUSUVqB
         jWvJEVBeaHM79zPEKY7HK9WI7nie/VsSROy5cOKqv7tqVekPZp4ZYkDhofGXRPjBT6RM
         GrAyUBYMaSIhazdQS3RwYcIVSCp4uKiDC6/bbZQs5I/fGiGRr8qStpK9JS+f0QATSMpC
         NiXFWDEh+dwqwUTxJj4bjOjPX/zH28rTgvZiGGwQKWb+VfnebO0zHxGkMrQs5sNQZ9Rl
         jvTOnXWhcLLH7DAIZOFRR/Y4yHsNM9nsV6dOfqApRHBt+bzsgjtKRc+Xly7LTR560uGa
         Cvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680935; x=1748285735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABmmeW4kIHS5pR1wBXW3o3AUaaWLHITX4FAWMNC72BE=;
        b=ulzzCp5viqnofR6wb3nSm1epf2kB1ZKLQz4aRSqUoxkxP5BapV/lzcWaX35DM10QIh
         vKkLh/vVFmPUy7o6iLkJHAEvrHo2OuNA4lxm2Q2MfpjnJRKd5KSPiWjDXWQk/bUrobTm
         x99shBmDHf2mKckCf0lRcmiOksV/jsAMTyzxxhi0osmYY/sZy1NsVeE77KfwICS3gavC
         8hTGtmRLwDpV9vLxKcmFCSckMsEDwRLz5SSl8a50SIrJo8YvqZx0+V3ItRhmFVW8bL8Y
         Cmw5Q+RzHVzO9ZcWX9Z0AQXGFAJgssfCPbOBHmLrRMeZLEkU70lcXjGoJtG/+XDEAr9a
         4Yfg==
X-Forwarded-Encrypted: i=1; AJvYcCWy4L8CBAj7z223rxo35C/cMfI6GKlkSHNmIVeayefx8LemYDNKCFBncFEJwxGP910Ar8/L14E0cq7tYW0QQJiU@lists.infradead.org
X-Gm-Message-State: AOJu0YyWnrHKqxSFAIk+9aiccVJTwSozhiKvAzUQ79frNjJl8CBR0xhN
	w+ewRGOmtmjABd49eNfjHcqldb1rhm9SlbO6zBKmpE0XuqHUzjqmsSGS5pElk3tAnc2LyO9rzdo
	tXY4iwQ==
X-Google-Smtp-Source: AGHT+IGEDc8FYs1ZWMzAv83wv6CIh5ESvR5WonpbBxgCgbPhV7/dILR6EKy6bxcesw6aCw28e8kHIpmzU9Y=
X-Received: from pjbsn4.prod.google.com ([2002:a17:90b:2e84:b0:2fc:11a0:c549])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a50:b0:301:98fc:9b5a
 with SMTP id 98e67ed59e1d1-30e7d500953mr20784074a91.6.1747680934698; Mon, 19
 May 2025 11:55:34 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:11 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-10-seanjc@google.com>
Subject: [PATCH v2 09/12] KVM: Drop sanity check that per-VM list of irqfds is unique
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
X-CRM114-CacheID: sfid-20250519_115535_695274_E84E6A63 
X-CRM114-Status: GOOD (  12.69  )
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

Now that the eventfd's waitqueue ensures it has at most one priority
waiter, i.e. prevents KVM from binding multiple irqfds to one eventfd,
drop KVM's sanity check that eventfds are unique for a single VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 7b2e1f858f6d..d5258fd16033 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -288,7 +288,6 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 {
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
-	struct kvm_kernel_irqfd *tmp;
 	struct kvm *kvm = p->kvm;
 
 	/*
@@ -328,16 +327,6 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	if (p->ret)
 		goto out;
 
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-
-		WARN_ON_ONCE(1);
-		/* This fd is used for another irq already. */
-		p->ret = -EBUSY;
-		goto out;
-	}
-
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
 
 out:
-- 
2.49.0.1101.gccaa498523-goog


