Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1551CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1Ge4V/cjACONoBs0qgFEJo1LJMRo9yRFlMmYU8swmk=; b=j2zszep9qpFyeIoUgD/ynmHnqj
	/Gv9bl/V/h1aXm1CmXluRV8HNdT2fbdy4EoWGLQhiKTUGIY2HKign6mze3cksUbx/TgRFvh2o1TOh
	0LfpcEeu7r/j1I7NKgrZfMnJHISuC0AIg5BJPelkXddzPN/lbmiYPYRlLcNp67oGUk/jVPA2HDIuR
	bnDWyc93BhGQcf/hETJht1xXOPfNsSUD75ruXl29l8MYKR5rPFPWakpFaacfn/9v4DXaC/Yrg7N6y
	2gujrnMbhP3xsGQna3qj+Ld5cWRb4b4MrFe0oFYbF2zWpPH0DN/QaTJxLOwAT494pY4CWFiggtvRu
	t7zJrEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWgi-0000000BsMO-0dOl;
	Thu, 12 Jun 2025 01:25:04 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEe-0000000BXXH-45H8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so340176a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682076; x=1750286876; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=D1Ge4V/cjACONoBs0qgFEJo1LJMRo9yRFlMmYU8swmk=;
        b=3IDNWrTNOtW3KTFuiWQnTuFcJUXV9y8tdOPZJ5jsp0c8L2GaPERU9ZwlkQ6NQnuE4z
         lVBQNxe/ysforUhw08W35i9hCWsq4KEjKDDxn83phRYAaLos4a00wUlmP43HQmR9sEOU
         4XrjQm02oTUMqGLaG/2NERrU58lLCZIYcqs8dOqU3jb+6m5ZkbRtenPtmhJTspcWnG4z
         +tYDXvW7true+Ko2aAn8Vu6jwK3Y0KCjo/LZUDWDjM8RvQn+vBSoXSJzoYcEGqVwTY/H
         /pUtriSYGg84j8R2jAm8hAJUr7xjFdYsIsuKMbnhfl3hd4L2XEex90JwxFc2WHtyhWFV
         r79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682076; x=1750286876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1Ge4V/cjACONoBs0qgFEJo1LJMRo9yRFlMmYU8swmk=;
        b=kknvGpC7oJNJqTqzxcVc1Sxm7jA9AYgWvjGdyEsVFXncNEZZfxZ/zSQFxBA92c3cJi
         +8HSpVYJR84EAZcP5PN00YQNMCcRdR3Va5F0m+R4IjsIR/SDQcL7skNd8MXM2UdLshSl
         srMf1ZmJDNrQ5sS/BcZlVdcU6lGTUcOXEeyFZ7l1G1tMaf84GLAz69yQBQAoxSqpbQwF
         2Neu4AvaikbIKKQJcD90xnWDb1+at1ayM90eH169SNSOEyg5xz2S9U2QUSDK6Mu95Uoi
         +jI/7oB1u0DFFfv+fS8HdTzsFUIHz1fGali4JrvzBT3EeCig0YYkYJ47y2ElXsK4uecR
         +Xqw==
X-Gm-Message-State: AOJu0YxHG88V1jXj+7jFTPVnoolOqOMVpVq8M63XGLUix98Pgl8d4D/P
	ps4jN73/WbSS30gd8fmRr5WuOp+88dWVu0FTQ8kudew1zZS9w/lyw/lLKoWJbcs2ijjP9vLaN+B
	wxHoCEQ==
X-Google-Smtp-Source: AGHT+IFqa2w2kmXbZWMF8yccOdDvEvpmv9cb25OglMZKL4EfpfzN4NVZljxUxuB5ee0yWW1el6qOh8n1yDU=
X-Received: from pjbsk13.prod.google.com ([2002:a17:90b:2dcd:b0:312:187d:382d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3dc7:b0:311:d670:a10d
 with SMTP id 98e67ed59e1d1-313c08d2876mr905787a91.26.1749682076024; Wed, 11
 Jun 2025 15:47:56 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:38 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-37-seanjc@google.com>
Subject: [PATCH v3 35/62] KVM: x86: Skip IOMMU IRTE updates if there's no old
 or new vCPU being targeted
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154757_016127_DD1536F6 
X-CRM114-Status: GOOD (  12.10  )
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

Don't "reconfigure" an IRTE into host controlled mode when it's already in
the state, i.e. if KVM's GSI routing changes but the IRQ wasn't and still
isn't being posted to a vCPU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 6447ea518d01..43e85ebc0d5b 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -542,6 +542,9 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 			vcpu = NULL;
 	}
 
+	if (!irqfd->irq_bypass_vcpu && !vcpu)
+		return 0;
+
 	r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
 					 vcpu, irq.vector);
 	if (r) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


