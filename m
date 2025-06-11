Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4252DC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGf99uYfCeKKIiWjOntmH0IBPd07aaYxxPMUaWxgCJ4=; b=bgLwV6XpzAoL/LstXkDxj1jcaM
	jcG/fOmAjFHt0EcWA67huVZMEBy3twRlE+7W2SETR3rhz6VRuOmTbkDj79PYaQ/q2GTIK4rQhIdPF
	aPtSbE/N5ojeTeu3TOnCykGmSHo8iqbrzIag9h1TcIfnhlYj0ll6ypooNEEkKjwi9mzBIMWWyjLUU
	3DRIHUFFgNlqqaceaOWcnO3bXrESVraZe9AEcf5zWEN7DamOORr804UzSmnMIWWzU7ysWFvKkLF0w
	8iR+FYcC8bc9gtAR0fqw5Ocho4kjCNUV58utSB9suU/5RP2LH7P2Hq8Y/6GtOPHoPwZ3cvOxTp3ia
	v2+1Htow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXGM-0000000BvgX-4BtZ;
	Thu, 12 Jun 2025 02:01:55 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUF8-0000000BXrG-3s5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:28 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so418313a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682106; x=1750286906; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IGf99uYfCeKKIiWjOntmH0IBPd07aaYxxPMUaWxgCJ4=;
        b=J8vNj1dFP0OHPg94OkhRl9EyLIFpEgIDyp8PS6EqtNAFDTNCOZG98u3b1GzyOD/TeC
         ZgJOQF/2hdIjCb9fsNN43cSrPUQhD4DxRgvTMyiAKMEVcdUwrsQtPOwwwwwKKg/opsQC
         8GYiSmIZ4bfuZABk+Up78GtumxI2fcoUVyuK8I9KaLlKPQBBq7t63mz3lTQm+8VTjZqC
         Plo5fcrzi0868k0dy2RG7vmuualelz6GzKnICEqwop2ZXhUtz9eWBU1jaPnr3pZKXw4A
         ver8C9Pgnf7Fbf0cF2cZGBq/GmaMCe7PXmmUBpVBkR9//tGz7pl9ih58BN5LwypmRH2N
         TB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682106; x=1750286906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGf99uYfCeKKIiWjOntmH0IBPd07aaYxxPMUaWxgCJ4=;
        b=tZ4JDXX27SjrcMVJdttbhDxaL/7HWeabyQC2LJCR1qDqBFkVt65ubdNOSwgnMxvuCX
         3VwaugcanmNospFajmdHh3NCzhv5wcfB4u6lTtPU54Pe3ZzNJ6KVSjffR2wYAv1MpCfq
         KUSE1gTNAxTeUHobN/LdMB59xD/aan3iPB2+nckMUaxw8uUsqPIElLywEYHEOmKpa6lP
         T1nPfrCoc3bAPAoJAMCteBcG3Un5wnVcq5BmWf/baZ65qJ1WTXkQ5/9lb5KbbmuzAQWq
         l6QMBWfznKFl8eIINv048B1CP6kJc6MsWQIVDMYbIsXia/ZRnjDav6nJVHdGf1UufN41
         r9iA==
X-Gm-Message-State: AOJu0YxNyDqQzZ+wR3N7ewZZPjry55iIek2NSgqYADCT4FKuNrc9BPtM
	4EHZNDqLeR5zcLyxAz88ZO3VGWhsWy66r8iByDWlqrPK4hcxdNM9qYwAAuNJyfLlLMcfgIQ9vnV
	ZuyI3FA==
X-Google-Smtp-Source: AGHT+IGG/WcYDrf0RYZY38gj5X+aWB3PmGw41sTQaNqsS8Agp4VOiMJxViIe5RHbEl0OLW/p9vLLmH6GAsE=
X-Received: from pjee8.prod.google.com ([2002:a17:90b:5788:b0:313:285a:5547])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3510:b0:308:7270:d6ea
 with SMTP id 98e67ed59e1d1-313af22d60bmr7017390a91.30.1749682105816; Wed, 11
 Jun 2025 15:48:25 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:55 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-54-seanjc@google.com>
Subject: [PATCH v3 52/62] KVM: SVM: WARN if ir_list is non-empty at vCPU free
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
X-CRM114-CacheID: sfid-20250611_154826_958002_DAC2E496 
X-CRM114-Status: GOOD (  13.26  )
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

Now that AVIC IRTE tracking is in a mostly sane state, WARN if a vCPU is
freed with ir_list entries, i.e. if KVM leaves a dangling IRTE.

Initialize the per-vCPU interrupt remapping list and its lock even if AVIC
is disabled so that the WARN doesn't hit false positives (and so that KVM
doesn't need to call into AVIC code for a simple sanity check).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 5 +++--
 arch/x86/kvm/svm/svm.c  | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index d1f7b35c1b02..c55cbb0610b4 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -704,6 +704,9 @@ int avic_init_vcpu(struct vcpu_svm *svm)
 	int ret;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 
+	INIT_LIST_HEAD(&svm->ir_list);
+	spin_lock_init(&svm->ir_list_lock);
+
 	if (!enable_apicv || !irqchip_in_kernel(vcpu->kvm))
 		return 0;
 
@@ -711,8 +714,6 @@ int avic_init_vcpu(struct vcpu_svm *svm)
 	if (ret)
 		return ret;
 
-	INIT_LIST_HEAD(&svm->ir_list);
-	spin_lock_init(&svm->ir_list_lock);
 	svm->dfr_reg = APIC_DFR_FLAT;
 
 	return ret;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 56d11f7b4bef..2cd991062acb 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1497,6 +1497,8 @@ static void svm_vcpu_free(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
+	WARN_ON_ONCE(!list_empty(&svm->ir_list));
+
 	svm_leave_nested(vcpu);
 	svm_free_nested(svm);
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog


