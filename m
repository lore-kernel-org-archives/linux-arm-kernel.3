Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61A4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHIf+c90E7y3SFrSqtGUpe0CRM2cdrMuvDnBkk7f4PY=; b=xhHiy/7xfnzbjO+s4pYREBEhlM
	vBOjT3/ZDB3EmYKqCT3radyK6Vhynl+EOugvjnZIwc3RxCpebKhNxQlgCuhfYhpKjE5Qv8ubaSyUU
	eIkvaV9rITfnpIV+TJgjPJQFrPxZqjBmHVpmi/3LvpQd0x79bU5l5ASi6A5TvzTQ3PVFwk10K1Kdl
	6Cvm31Mf87V42N/W+s8qj61uwctpdtS4h1oWNf59PVwzLleAEqRVgzC6BcaKgRTLS1gaDAPpjzQq2
	oJZdR3MEawhtbljsOfMVq8Ve9JVuwT/gsaBWIg/tfsxKKecUOirJmRg2zdBAqLPsNrZzzsuw/pJLS
	C+dNNjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXKY-0000000BvzM-20zU;
	Thu, 12 Jun 2025 02:06:14 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUFC-0000000BXuC-25fF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:31 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2f5cb0c101so158274a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682109; x=1750286909; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DHIf+c90E7y3SFrSqtGUpe0CRM2cdrMuvDnBkk7f4PY=;
        b=Pvv//8VGcnAqGs/Ef10aPUo9Kk7lz3pIRDrVu7r05vlJZzC+18q20j6Q3UvOkozgnx
         hk7qaTqBDYQF6Us1vp0aZSc9A+EJyOuob89XWJwozmBSUl1+c0vTh5DJyaGCEUaW1wiy
         MAs/LOP9WiJGn84MkQQGY4Xp08YsVFI57vVN0oRJ3hlGslAFcCL95NQTm2xk0AJs6+yv
         HqcYy+5wJvimUeiQ++Dz5jOJE/YGbKekM6fqBzDjNpjodQcmWOoRzmej3x3gT3JDGyR4
         nCkY1IqEtb6h8JpZpkenCUmEObvaHl3UMXozeWZc0C5KArcNKpuWlFW+s+78s4MfiYX5
         sFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682109; x=1750286909;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHIf+c90E7y3SFrSqtGUpe0CRM2cdrMuvDnBkk7f4PY=;
        b=EVFy9JrUDvqF/TdJ7YSOaseMw933g1bKCaKHtd7Km2ck5ZuLA4aBanI119Lm5wOKNm
         6rBqYtKV8i+QRaFjGk2H61RvrhZyMI+E6qEvzCtcX8iaFG5L6fVxYZAZCX+PpifzPrGC
         2fhJlcWC3s9p521yudgwpQujeteugY5TAqKc/G0kRusLHbQw1EiMgmBCXRQDQ1s5jYqv
         /emyjNSahe6RgzzxKN+9Rt5R5fakkRUW5LqKhLj9e2EyY6DwFjzy4PfNzs/J5taSFlwM
         /G1PkyGHruTji5+7mBZDIGmiEWTEXfkUAZlim+6hYyoqRzkSO4cPQEyzBumZ0VkmiEf7
         uJ9A==
X-Gm-Message-State: AOJu0YytM9xBW5iDoYOsLrcUlNbbisJ12Pe4ZCe+Hohqthn1aNx4T8Co
	ZuirNlAOmhUW0JrTFkoEV9aBciWnqL0LmZGElr+j2kldH2sbFgBK+TNpM92KRjXEjBIbv7qdDEr
	LBBgNhw==
X-Google-Smtp-Source: AGHT+IFtBQrCrRoK6BL9Dz+IQ2aeYDyw9D2RNz8zXlEmSFnG0/dQfadG1s0WIBiR2YE1o9tnTCGC7rDXtkk=
X-Received: from pjbpq18.prod.google.com ([2002:a17:90b:3d92:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c08:b0:312:db8:dbd1
 with SMTP id 98e67ed59e1d1-313c0667c29mr974887a91.5.1749682109408; Wed, 11
 Jun 2025 15:48:29 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:57 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-56-seanjc@google.com>
Subject: [PATCH v3 54/62] KVM: VMX: WARN if VT-d Posted IRQs aren't possible
 when starting IRQ bypass
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
X-CRM114-CacheID: sfid-20250611_154830_539465_1304248D 
X-CRM114-Status: GOOD (  12.09  )
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

WARN if KVM attempts to "start" IRQ bypass when VT-d Posted IRQs are
disabled, to make it obvious that the logic is a sanity check, and so that
a bug related to nr_possible_bypass_irqs is more like to cause noisy
failures, e.g. so that KVM doesn't silently fail to wake blocking vCPUs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 5671d59a6b6d..4a6d9a17da23 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -296,7 +296,7 @@ bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
  */
 void vmx_pi_start_bypass(struct kvm *kvm)
 {
-	if (!kvm_arch_has_irq_bypass())
+	if (WARN_ON_ONCE(!vmx_can_use_vtd_pi(kvm)))
 		return;
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_UNBLOCK);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


