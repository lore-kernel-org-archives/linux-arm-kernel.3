Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904EFC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJUovYaxFJgcXRp1TDFKS/NrFefgEp1AkGzEV1OM9Zc=; b=ZreLb9p3CFyX3IJZFuoiIyZXMH
	a3mqIla6Luqgb8zIhmh+21BmUtmmUcN4BhxP5O3GLrBT+ZLp2UEGxTiVeDOFNPaI5eLxa58rUIqI6
	GwfqiU3v7+8dSpzW4JzINQsxFXJVxZd/CkKfANL/vvHksLAm19x3Wez4xfRXyunb1uMaokwZNwRsG
	FsJKOWni6bv+eg+lc+MQMldEVN3txyrD+Sud6RSHheCgildUMWpAtgYHdWcvsuUaS/6fP5DWuLGR+
	yGRxvgsVmx0xCA9RP2t7p0DeI0Dc7hRl7e+yxd+BS94eaiNPa2J02pgmA9sjH3T3dXFnhu7aeat40
	my+dYmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIG8m-00000002ZpY-1F8J;
	Fri, 23 May 2025 00:20:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFib-00000002Vum-0pnl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 May 2025 23:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pJUovYaxFJgcXRp1TDFKS/NrFefgEp1AkGzEV1OM9Zc=; b=EsiImkzrmjnDadfPqknSdJ5jQv
	H107yd2sjKZteRvRMhVJd3Gs19tDx6Eq8L3oFKG17UiXtbXnH0532MhjlFlJf2CVt1eQ7WT9bPxDj
	RXeuGYZpVpd9KCroMA5wvcsR2Zi6P3DvdlxCoHg4IUu2+l6pGa0w9EryY3mcPBK6xXLMl2/BsH8uL
	90FiUP0tY48pkLINA8isC95LeBzpL+tUwHv0EoYbuNEe9pHZZzhzkeJHPsYvH5K0m39k6y4EzTElN
	lME6Sr6hvY7wpONCGysjDxhhACMNLsypEXAkLZx1H5BqvRbAQcq5rCnwDuTeia7Vr5AGYXqJMpOz5
	9ZVz1Luw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIFiW-000000016cN-3ikd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 23:52:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-30e6980471cso6916034a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 16:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957971; x=1748562771; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pJUovYaxFJgcXRp1TDFKS/NrFefgEp1AkGzEV1OM9Zc=;
        b=RR+WLsDKsQv1hVnMBR2Xubou92Mo2pr1GpML4NxTL0SObLyUthaoYJOCaRuyrpJ2GH
         ua1CkUMBg0Ran1KiS0qhqQrCnhepbhuvsRR0WRRaHyn907ohW75C3p38X4Je8SXpmT8X
         3EZ6YWmQVGBAL4LPhjpWlCd0+wtjeFZY+nfJ+oRla0qkwzPJiP1DstXp/VX/lz/J0YWS
         TDbuUMo9Ot9JciEug+3PQfj+vyh6TVQ3EEu1KPJe4ZITfHnDwIEvRefBZGkOSGenILJG
         f7ywkcOTMLU/yS+0Wmi1D0IUDsCt9snu8ZnJdJ7NAjphzQu9EU4NAvJtDAZ8YCjpN5Qj
         P0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957971; x=1748562771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJUovYaxFJgcXRp1TDFKS/NrFefgEp1AkGzEV1OM9Zc=;
        b=Wq43F4VMrDaoy61FQLjXXTPK7AfBxB1xcOHVxzhPdG7PymFkiXoPQCSPb5UFCahcdG
         7qr6kJoeXrVRNS4wjTmrL+WW2jNt2yhJvjIs/a8Qvw18bmIwz2DtxodqThRt9hsI/PNh
         5oNsL+B7C4X5YffHrRrXVPNlxZxTCEZEtEtuLM/n6mWY5iQ+wOjm0basfr9U+l3aIuQ2
         B9FD1B97cEtkNZOvA35b0oFZczArF4mbgQzpDu5E/GH69yX77dCRrJPmSh8R6RZPv6Wd
         ZFLM7Bv20Zz8jTN2ZBJgHDYgEV909WSzz/go1MsLCNfJWuF9VZD+IC8uEZpRQ9R9Otok
         sCNw==
X-Forwarded-Encrypted: i=1; AJvYcCWr6XbdvGptFOEiNGzAvaHAXwdYdWtLYzSd3HEHKP3RHq9//iZRF6Ru7rq53qKlijMFOEaSniDVOi9i5aBKXG9J@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv3HExzSJ9a0ufBArPMdUYvUUPQ80EqmV2n8feMc6REdVd9AwM
	LE2RXDYgW8AdFakLxjLP1xnZGu+K2tyKhvHW4TOgo5H9cIem6twpfoCEcnS/Vf4GOY2rd4JHoJm
	bu2HWJA==
X-Google-Smtp-Source: AGHT+IEDndqxTWcCtq5oGwy52YECfaW+Ize1PqvGwCK7FSF7/oiShVYNO6fCIsKX/sBpVCvd/V18cyz4IiY=
X-Received: from pjx8.prod.google.com ([2002:a17:90b:5688:b0:30a:31eb:ec8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c2:b0:2ee:edae:780
 with SMTP id 98e67ed59e1d1-30e7d548c90mr43873310a91.15.1747957970976; Thu, 22
 May 2025 16:52:50 -0700 (PDT)
Date: Thu, 22 May 2025 16:52:20 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-11-seanjc@google.com>
Subject: [PATCH v3 10/13] KVM: Drop sanity check that per-VM list of irqfds is unique
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
X-CRM114-CacheID: sfid-20250523_005253_074385_35DEF3A8 
X-CRM114-Status: GOOD (  12.13  )
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
2.49.0.1151.ga128411c76-goog


