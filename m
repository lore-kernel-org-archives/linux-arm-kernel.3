Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7089CC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 23:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAZka5nPnl0zzhBog63136UQG1pDC/RMIYFF12/LKjA=; b=mr9XhWGPIk/iIlizuR7e6BaHyR
	iwEVMSn9UmnNSH5AroqDi1NxpQ1MyjxsYV/rk4VMuteAWOMsJdT3FPt53RZUCOxb8Nco18d7hAK0t
	DpeEIPod7Jc+ISmkf0QY6tO0OG/6CVCBDuOSfa2pAmnr1dbJqxFe35M2Ng0MiRar3YRpOslMcRPFT
	guqycZIIHm0lenDb6U/OC0hy+NtqOBsSTxVL8YO+ski5B2Dtwqtq3fElxI+UVFGwUiJlJhpDDXzy4
	CuArkYWHg1H0H/krD635D+clMN4SUl2cvlEX5M/gaA7m4inAhrmR94y7DxmcpklX0e3Hbt1TwwDvR
	uWc+wbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFoT-00000002XRL-3OSQ;
	Thu, 22 May 2025 23:59:01 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFiK-00000002VoO-3ZYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:41 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3108d5156e8so3364601a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957959; x=1748562759; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xAZka5nPnl0zzhBog63136UQG1pDC/RMIYFF12/LKjA=;
        b=Ga+FET6h0LuVgRTkES/EyqDfs3xIIU9COjBnaLgx8+CT0T+A9DA9qMVzgI1GSnudF5
         Um+c9lUEwwu6xiwMTv2NudZdJowI3ihaib964EW2c6OFQv12ibVmPtO5ow89LxYhXbJa
         V7VLVrk7JEZnBQ8J4lUKsYP8/ZJTYX5x3qqeEHoA8C1mb1icJE7votgoduSv+zRj2LkJ
         pDIu9cL+8fK9a0uIXEALqgJYGOKppAgYZTHF2hqwTSkizEtAvLRO0hGKKjQ+5B7mH94u
         spcjUPS2Jt+9gYgndujUHIVgfnVHQ61i3JiRnYgdNdlzetjpHMebp4g75u8AiX4Ktpci
         YdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957959; x=1748562759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAZka5nPnl0zzhBog63136UQG1pDC/RMIYFF12/LKjA=;
        b=L+MaGuwqYCXRkw3vGYFarraftM1FdOe4QuM0Jfe4XKSfrQn5PXMr0suipwNke2nRcm
         R7FZsddD7eokU3x2MrH0F4ZahKnhSE3T3yWMNzO+Kk1bC/xwNE7lCilYqw5sfpM9ndX8
         wotMs9PcqugxOtFVD5xd+W68x/PSijTVJ2tM88tk0uGHG5jAJJqSsO/yl0BWXxFHS/yw
         w4uTyZwZ8M3D3k53ek+V0tymI/8QR/0Jop+GIQNSqkAZXSvfbMM0WYkFeT9nBia4q85G
         qUFwRVtok8P4o99/lNa27kz9j7gLSjWmnZdvU2ERYefRgtSuer/uPMYZ89RWSwFNXvKJ
         6hpg==
X-Forwarded-Encrypted: i=1; AJvYcCX/rL9BcfrYMbLP0be0FRKTpm6VIiCI0fzZ2z4A0Gmkx6lxJcS9gvfuw5jRnelapgKAIO8v+drCVosHJIR+R8VI@lists.infradead.org
X-Gm-Message-State: AOJu0YynXN/wZB9txxM8fbEugviyb6aszBTT6S3Lrn9TY6JMYexXsiLQ
	4kjvd9GNe0ZnGeHBdndKsbj870OFPIWpXqgyZzsh19SnLAE6F4xdfjouBq1gWXfFgtgQUGqdrzI
	+aBHbtw==
X-Google-Smtp-Source: AGHT+IFTlML74x7TQE+fmnLc60J6Zc3gXJFbZA8aAHEiRQLh+dPZA/uq2RIsrb3gSzl5/rJlFLqbanul+U8=
X-Received: from pja13.prod.google.com ([2002:a17:90b:548d:b0:2ef:786a:1835])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51cb:b0:2ee:fa0c:cebc
 with SMTP id 98e67ed59e1d1-310e96e87e5mr1351003a91.20.1747957959540; Thu, 22
 May 2025 16:52:39 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:13 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-4-seanjc@google.com>
Subject: [PATCH v3 03/13] KVM: Initialize irqfd waitqueue callback when adding
 to the queue
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
X-CRM114-CacheID: sfid-20250522_165240_890283_1785A477 
X-CRM114-Status: GOOD (  15.55  )
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
2.49.0.1151.ga128411c76-goog


