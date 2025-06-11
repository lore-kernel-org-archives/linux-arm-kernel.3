Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A042C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDZohEtmrHKYD6EovcSC8/ZzfIWWO2Pel/+WswkGVp8=; b=Rfgz9Vd9LP1IRJ6vO57RrLAe39
	GAmu4jzIzNIUI5TOTsBN6dFOeqSLJVzG1xilRmCdrc20EO4EqqtekkNwC0aPLnfXUsGkzHg5yc/Ec
	Ny4BzsqfxkvKzJeelGZR3xhVdaEmQ6UHLbzAYICvyLezscGA4luRk/10ukO1Tx/7JwqiTfx8QDpgk
	S0G6nWc9wz2VM6YnkTDdsLF+9sSlpgvS2s8TKnsML0icyMqi9+wWI1W1H0d3XUsbV1oieYvOVGUyD
	T2MLU30yBi8CE+b4x99BJkF2ZktAQAbp0fr9urf+pl4EgXEBvUcHl25ckKp/fecIrcqTnqDR3ixbC
	SdS2/c4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVjv-0000000BmUf-3QA5;
	Thu, 12 Jun 2025 00:24:19 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUDt-0000000BX10-1C2z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:10 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-747d394f45fso254315b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682028; x=1750286828; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tDZohEtmrHKYD6EovcSC8/ZzfIWWO2Pel/+WswkGVp8=;
        b=wlKLvfXt764I6qmRAV6/Xltx5t5AKkNhC2JCpLb8Uxi1V1uuf0kOAhHIefod9GPLg9
         pBtY5M2DSUBpX5ufuF8jvRWGvr7DvLQ0CiTTQmbSez2uk5uIXxLZ4CrCumQbZN/UhsRU
         WatVH5ZDaCtpzdvAkAnOl6ENY99aEeXILuU6fGB3Jy7NfOS3reOIdkZ4HSHUoZLzLAGV
         jIQh1ffHJCo0axo0kWjBKp3O/UXag1j/eIK12wXaf6B2oZjKKuymLpPHaXIJAHnorZb9
         fy2pHd04xWKLztJzxFbNdc+zsFE2eDSwqdo+1JtaLMMUFgAEJUD9xw+LIjLvStGBCCUy
         jtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682028; x=1750286828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDZohEtmrHKYD6EovcSC8/ZzfIWWO2Pel/+WswkGVp8=;
        b=qF7HEkJFa6WmsaInaeMlaanqjJtcnfuXQUARuSKRU7tkv20yJ6i9cq/FbR6s1ReRTb
         U2O6vY3s2LTa4USpIs3KLsPFJ9ZI8yw1Vs50Z1YNo/NZI5USX9SLArJ8w75+gOB8Fu68
         x2eWuqqx3+o0sC2i2nrmV39TaR/eOWWOgRrUFsF8pFNVPQ2sFMljwW+EMxhi1p0wWRXp
         tqohdaFQDK4isgwItoypJRvlGCkQy/7oi8A8881WPp4ZWLVfe2uQJ9dnZy34vVOflJsi
         1j26W6pX6lxfQVS5uTsSqjyYg7Yk4Xhhx8CsZiKL1oBOf2Q+3AhTJ9GgFqrbrzr5x0jJ
         BLBQ==
X-Gm-Message-State: AOJu0YyVkNYw6mRvR0oDpN5RvMAXgJqlNF+BQq0FjiWQdrk241Ks0DND
	6gVK0F0mv9yQFZiEkoLK0NcMKRb7e15VNyqGJs7lsnqgJCY7YyQ8/zLqgSY1siK3ZmcAUlue1Ye
	16M5n2g==
X-Google-Smtp-Source: AGHT+IHgXSfJU2sxyG9OW4VojMH2BSFfhS8bYIS64Jcg4Y6OGr2dvtrGuU93NG67KzexoKMXwohALrIyyio=
X-Received: from pfic6.prod.google.com ([2002:a62:e806:0:b0:746:2117:6f55])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2294:b0:742:a111:ee6f
 with SMTP id d2e1a72fcca58-7487c21ba8bmr1432295b3a.10.1749682028151; Wed, 11
 Jun 2025 15:47:08 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:10 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-9-seanjc@google.com>
Subject: [PATCH v3 07/62] KVM: SVM: Delete IRTE link from previous vCPU
 irrespective of new routing
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
X-CRM114-CacheID: sfid-20250611_154709_322477_F078569C 
X-CRM114-Status: GOOD (  13.33  )
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

Delete the IRTE link from the previous vCPU irrespective of the new
routing state, i.e. even if the IRTE won't be configured to post IRQs to a
vCPU.  Whether or not the new route is postable as no bearing on the *old*
route.  Failure to delete the link can result in KVM incorrectly updating
the IRTE, e.g. if the "old" vCPU is scheduled in/out.

Fixes: 411b44ba80ab ("svm: Implements update_pi_irte hook to setup posted interrupt")
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 4e8380d2f017..c981ce764b45 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -861,6 +861,12 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
 		return 0;
 
+	/*
+	 * If the IRQ was affined to a different vCPU, remove the IRTE metadata
+	 * from the *previous* vCPU's list.
+	 */
+	svm_ir_list_del(irqfd);
+
 	pr_debug("SVM: %s: host_irq=%#x, guest_irq=%#x, set=%#x\n",
 		 __func__, host_irq, guest_irq, set);
 
@@ -883,8 +889,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 
 		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
 
-		svm_ir_list_del(irqfd);
-
 		/**
 		 * Here, we setup with legacy mode in the following cases:
 		 * 1. When cannot target interrupt to a specific vcpu.
-- 
2.50.0.rc1.591.g9c95f17f64-goog


