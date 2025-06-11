Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E270C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWHk4g1Vwy67+s92oAAb3P4JIkRwWseZejUTZj9H+ss=; b=Ds2AJzwy1dqitHVCjnuj3+TFx6
	c9DM/9nagN2T3NeHrmAF2dGaFmC+diymzIVTSV18FkSKWWbOMeWjuNyLUEwX1t/aZoIXbIkgH4UCi
	7MTJOibJzsO1m72Vx2RVYaLFUKJIv9sNfx8x9YtThlkpZr1zyJZJPO8+zRLkBghWZK0B6QtMP6ffb
	zW6Elmfp7FtozyfoH/9NpTtPiJRw01KtO7ERySazYxc9Xk9LmClMH1XPsbcdaqkpdb2Xb3VgPIKio
	TDGnkZbjz2DcqQ792SoJi5KThnyBfq7AfuVfrs3ioMkcsKt+PifINxeEMjkTiX1ej0kooAFLr4DuZ
	lw/12bEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWPv-0000000BrAF-1lXp;
	Thu, 12 Jun 2025 01:07:43 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUER-0000000BXOq-2Gkb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:45 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-740270e168aso253718b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682062; x=1750286862; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hWHk4g1Vwy67+s92oAAb3P4JIkRwWseZejUTZj9H+ss=;
        b=gNz0d9Z72qx/ukUv7Cu+6Yu+waP+FZMqaMWbNCXdjQZUgOf8Z/7jvuXqJUl9YvVPtE
         DI9vftpIdhb/87q8uiZr7LN2sad9t0ajRh7DomAx2iZSp1mJcHwK8Pp3KOVHAe/LKHOV
         2Vwt3L1LnLL2i6JIxc4FnR8aSt5f9JG88w/vUtTjs1ibop3WUzgYfYRfv/M+xsDd9zs6
         7aCd0ff2449koMZwviHoAXzNBmi/ovgJKGJEnPaCTjI9WT5tfVI+oV8JHoU200YeMe3N
         iTonM4wt+DlQhQWzwgfrIS74/G5PzsS1sGZjUb3D/49xEgLS4KGZh+qmZbUygpb2UGLB
         DkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682062; x=1750286862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWHk4g1Vwy67+s92oAAb3P4JIkRwWseZejUTZj9H+ss=;
        b=mGzM7Opcb8YElz56ojKtaj8rrWj7ZW4JJajr3VHEu8+D3/F/jjvatS0gCdbKs3iO54
         vpOaGgEFNasvtZudm+w+3mmVBadTZii6hsy2FZ7W2c19gLFoOKBxerm0H0kUQk8yhclH
         jxEH3bBuMhryWjLhuKC64XFWECJ2SLniOiZ55pGfqLhSy4Ww5mBgZWqNp/6HbcRmsG1I
         IDSHb75nUhFIZOgukvOIHpblcE0QJopRQDIr4t0yE8hXRGIcxGi6/JKtosksBHnz60XH
         4KT54IU2xlv0ByXV89flBO4zPyTyoHUbOTUH5GVfsysrNeWNSJzMoQebogJUaU4ba5dd
         OGjg==
X-Gm-Message-State: AOJu0YyWtFSEmdrI1EWScxP6eoT0TOato0ufyZ+AH02QzFKwKECqScg4
	titH97/pjtj6VKBTpwntTAEt2wb53lUmWAM8tnbNLEfJJzrw092nWDuaLgksuvkzOq1/lkIOym5
	IiGtadQ==
X-Google-Smtp-Source: AGHT+IFmVhbjucYXuzMglz700r5SKDcVNbLOfHQ/SQsr3MFTg4okaXCI4Ylw5BtYSrn3coqW+U0cp+uUzfA=
X-Received: from pfbhe19.prod.google.com ([2002:a05:6a00:6613:b0:747:a305:836a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a89:b0:748:2e1a:84e3
 with SMTP id d2e1a72fcca58-7486cb4a9famr8199641b3a.8.1749682062215; Wed, 11
 Jun 2025 15:47:42 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:30 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-29-seanjc@google.com>
Subject: [PATCH v3 27/62] KVM: x86: Nullify irqfd->producer after updating IRTEs
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
X-CRM114-CacheID: sfid-20250611_154743_592417_4E632158 
X-CRM114-Status: GOOD (  11.13  )
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

Nullify irqfd->producer (when it's going away) _after_ updating IRTEs so
that the producer can be queried during the update.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index b9d3ec72037c..09f7a5cdca7d 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -549,7 +549,6 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 	 * KVM must relinquish control of the IRTE.
 	 */
 	spin_lock_irq(&kvm->irqfds.lock);
-	irqfd->producer = NULL;
 
 	if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
 		ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
@@ -558,10 +557,10 @@ void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *cons,
 			pr_info("irq bypass consumer (token %p) unregistration fails: %d\n",
 				irqfd->consumer.token, ret);
 	}
+	irqfd->producer = NULL;
 
 	spin_unlock_irq(&kvm->irqfds.lock);
 
-
 	kvm_arch_end_assignment(irqfd->kvm);
 }
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog


