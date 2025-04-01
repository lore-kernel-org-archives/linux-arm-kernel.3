Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A6FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5N7R+jpPDsp4box9tDn3nxVfOu1tizhXrLdonpwfcQ=; b=3aIMzW+Uk0rYBfx+x7AM0iybjU
	1a/BzDBojjxDP3SosEavnNDeIOTz+045fB9/7Nm0NV9A7RIwm6szd51W9hdczBji0lRm0rlzA3S3P
	ujtth+ecU7UBm8k1GEOqMbjmqiPHkWz9+ujCJC4WxNEJtAEiOrpppS5xSpZH6j6XXkZcTHgaue+pd
	yv4/25Gd8jj6X0sH/nPMdj5LS/+R6oVeC7eTyhBFnCGPyN9UF9Bex6DVctRTPAlGlGMLX2gWMj8LR
	y9BUEfi6czvX/trmBcLXu6h8gk3fOvC+MHIVgw36vHoCaCWPyX8QeMwuGUixG5wnW3ezr0f82ZOKf
	dKHyU1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzinI-00000004OoU-35S2;
	Tue, 01 Apr 2025 21:05:12 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziVk-00000004LGg-0bkg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 20:47:05 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so9883690a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 13:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540423; x=1744145223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A5N7R+jpPDsp4box9tDn3nxVfOu1tizhXrLdonpwfcQ=;
        b=OxXZMxcRNTv0AvNHj4lJUGUkbmJpXzubla1QGfJWg760H8z0oEESMTdH9PYxrupi40
         +FOrUgZD2jED3VZ8nrqbOzdZUIaUNaVEp/NkwMvCMlCQHObFq7Af3zwkgKQ11NjTqaEb
         NQou/x9+Iitf23KOkQy8s619Jf4YdctzdtSJydd5NQJdlOkZthpSK8e7TGwcIFrxDShU
         nLZjZMEb9O0LBPLx1nHN8UFwyNeGDKm/2QpM03caQTIEqYbrOtgXKi0Xu4tNcLnQSjg+
         7ygpr3Acqz+yPqelcG+ENDWJJO6WGX30M7vqoCokxnoF4wZIQ3/yvf1lUr5bVRvpsPCT
         1tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540423; x=1744145223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5N7R+jpPDsp4box9tDn3nxVfOu1tizhXrLdonpwfcQ=;
        b=oF9pYj5Fnr+qVcjSSF9UY4TYGDDwyM/+Zfb8po0lWeV/qhvxyLexbac/YYlWnbaAvk
         sbnLyxMfeFvxwOSSni/n3miz/TO4SqTxYiwDDtnvhnLzsKyPScqJ5DO+0rwrNRolBE3y
         +P2vzxQfunhqsIhj23NG2n43FzPZxxio9DAhUAwVRkJMj9Xr3NJXXVcFQ3BGPtrbavZ5
         zqc06EbwJRZkJhgkrDURA20TMT248VA/K0MGf9cXHtxe4kqsw3x/ByvaKICk6MMRA16r
         OzpcX26ol3KxFrlmXrT3R/M8QGvqwi/HrrduYx4s15rMxq+VI4bp3Bi10XftOZgqlIoK
         eQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcQbqTlXT6aPO/+UE9IXNutvvOuMO/qAOKfNFQzW7pG3MA1Up02mC+MFvXL2ICzT/sGUdIFeBLpwWvOU4Yj1QH@lists.infradead.org
X-Gm-Message-State: AOJu0YyxreovU5Br/Qs3f8ebz+YwEPSTLq+dxOoDPRrBLpcpbRTmn5Hs
	QZ0tYfwKclGBo2DRgNJFKYog+eq7YcvpGBO//wsDuN6D15Hv3hyJSOfDSEkJB/6iWKM7Lr0AXJu
	jRw==
X-Google-Smtp-Source: AGHT+IFKHrxOrTZORfx3j1Hq3t+F6SZMnVAetLumeoCsiYBPEvhoueJg73+pHzxlFtD9cACElqMRzKov8iQ=
X-Received: from pjbsg16.prod.google.com ([2002:a17:90b:5210:b0:2ef:9b30:69d3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a4b:b0:2f5:747:cbd
 with SMTP id 98e67ed59e1d1-305320af2bfmr23155973a91.18.1743540423264; Tue, 01
 Apr 2025 13:47:03 -0700 (PDT)
Date: Tue,  1 Apr 2025 13:44:21 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-10-seanjc@google.com>
Subject: [PATCH 09/12] KVM: Drop sanity check that per-VM list of irqfds is unique
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
X-CRM114-CacheID: sfid-20250401_134704_211556_230E620D 
X-CRM114-Status: GOOD (  12.75  )
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
index 25c360ed2e1e..d21b956e7daa 100644
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
2.49.0.504.g3bcea36a83-goog


