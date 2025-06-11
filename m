Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A81C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8u9n7/qtcddPkohDHss1zptLYbY60ll3w/DwpskJQs=; b=fUTJwaXb9mass1FA37bYV/8Ga3
	/KYoM8+GI1bwhrHux+Vouu+JkqSFmuXWfGSbj89csyk5xi49G0AvHiMZ6MwM0BoBEezHW35WWjxKy
	g9pXz4rmPaDRqnYdecz5NhCVf2nZyASCjs1Dz0Wd1izJcOw9oWsm+VDz3X+djon5UW+qGnDQaG33r
	y2vcY6f1v71X/RXFBMtstq8urW2CJ9xmFuEdAgH0seeCVYgHYqMWaZQqyqqAfTu25Tl+BYbXJi/V7
	udqkSYy2jspJLicYHF+A4GsIWbt/A92pi9feTf1vGbvEGJowzpT7eMbJf2X/ZCIEUUhP8zNsZW9rb
	qqzYikIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWxS-0000000BtP8-4B9e;
	Thu, 12 Jun 2025 01:42:22 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEt-0000000BXiu-1EMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:12 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-235dd77d11fso2112085ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682090; x=1750286890; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=d8u9n7/qtcddPkohDHss1zptLYbY60ll3w/DwpskJQs=;
        b=yrz5DJrleii1aCv/wXG+vAqazz3DZDgFTelYlBO8X9rUm1py9glwFIuOg1pKz1Zd4U
         WpSf8nB8DYKhxclFcnHpdpjhQwXAd9lYCL6bJVry8LsEqKuv1HiESR5gidlZqXn4LYY4
         5DYn+hXJ9EKTCBU5etidPcMsmhhUxoJlLBkPu5TgLYlZRDJsbQ8V7mv6hYtdRgYIcpdl
         onmN1lQuMoDKcIlYfzgwPCoSidf2yhDbrm6PnAhm3pKFv26pLBaR0gL0GVQiZ3KeZujr
         bpzzch74IblP+LwfM5p1Z6PYLCbaOQ5PLXHYhenXuCZi3iCnRmqyZ7bQ9CwF7NO6H3Ey
         /vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682090; x=1750286890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8u9n7/qtcddPkohDHss1zptLYbY60ll3w/DwpskJQs=;
        b=wEu+RvzcVCuCZIMH27vX4nEwRVlM0EyZp55TMQtHKYTW0eKZtCNmHdS0cLSYccna9B
         4F1GkDLfQBbaMRcH74D7DH9V0GLCdCh6LocJcenzu1H4cbp64nKxOdkqvFctnPb51u22
         yOcWSdeFy4oraJkvLSsuTqyAZjQZUYIoi63s6J2jdvsH+QxAj8Af+0A6ZfYWLimn0YxS
         XdXKXCrjWzXJiptWWFt4csbr/NA1J1n/+Ivbh3Vkk8c+858C6c+XdfYMIsZPhdrU/wdA
         agHPZ0Qq0X/NEBkWBZ3CvwA1R9k28LTIlC+tiiwUE0jIlq6p1YAI0i2Cy93MBOvP0mqb
         x1fg==
X-Gm-Message-State: AOJu0YwfA0fe/+Jo76iv10JDz5NoNVXdNcmsXaRjxevHG0LOTQWyU3Tc
	f0sVX6gCR/HFiTVbsrHjFJv9XclvAuNs51z8kIHmIGcc9JB/14++j9GeJGj2gF9e0Hu5z3fEh5e
	atyDDGA==
X-Google-Smtp-Source: AGHT+IHWJyMnlyFo6yhSGVaRZ8z5iHrg3t+Cz3M8yTQ7oInJuByhEts6I2Tl4zgp4CW7ntx2+eMqbSXS/nA=
X-Received: from plad20.prod.google.com ([2002:a17:902:e154:b0:234:c8e7:6fe2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c23:b0:234:d7b2:2ab4
 with SMTP id d9443c01a7336-2364c8d18d9mr15462635ad.17.1749682090185; Wed, 11
 Jun 2025 15:48:10 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:46 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-45-seanjc@google.com>
Subject: [PATCH v3 43/62] iommu/amd: KVM: SVM: Add IRTE metadata to affined
 vCPU's list if AVIC is inhibited
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
X-CRM114-CacheID: sfid-20250611_154811_330641_DFE16C58 
X-CRM114-Status: GOOD (  18.22  )
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

If an IRQ can be posted to a vCPU, but AVIC is currently inhibited on the
vCPU, go through the dance of "affining" the IRTE to the vCPU, but leave
the actual IRTE in remapped mode.  KVM already handles the case where AVIC
is inhibited => uninhibited with posted IRQs (see avic_set_pi_irte_mode()),
but doesn't handle the scenario where a postable IRQ comes along while AVIC
is inhibited.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 16 ++++++----------
 drivers/iommu/amd/iommu.c |  5 ++++-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 16557328aa58..2e3a8fda0355 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -780,21 +780,17 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	 */
 	svm_ir_list_del(irqfd);
 
-	/**
-	 * Here, we setup with legacy mode in the following cases:
-	 * 1. When cannot target interrupt to a specific vcpu.
-	 * 2. Unsetting posted interrupt.
-	 * 3. APIC virtualization is disabled for the vcpu.
-	 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
-	 */
-	if (vcpu && kvm_vcpu_apicv_active(vcpu)) {
+	if (vcpu) {
 		/*
-		 * Try to enable guest_mode in IRTE.
+		 * Try to enable guest_mode in IRTE, unless AVIC is inhibited,
+		 * in which case configure the IRTE for legacy mode, but track
+		 * the IRTE metadata so that it can be converted to guest mode
+		 * if AVIC is enabled/uninhibited in the future.
 		 */
 		struct amd_iommu_pi_data pi_data = {
 			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 					     vcpu->vcpu_id),
-			.is_guest_mode = true,
+			.is_guest_mode = kvm_vcpu_apicv_active(vcpu),
 			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
 			.vector = vector,
 		};
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 718bd9604f71..becef69a306d 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3939,7 +3939,10 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 		ir_data->ga_root_ptr = (pi_data->vapic_addr >> 12);
 		ir_data->ga_vector = pi_data->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
-		ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+		if (pi_data->is_guest_mode)
+			ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+		else
+			ret = amd_iommu_deactivate_guest_mode(ir_data);
 	} else {
 		ret = amd_iommu_deactivate_guest_mode(ir_data);
 	}
-- 
2.50.0.rc1.591.g9c95f17f64-goog


