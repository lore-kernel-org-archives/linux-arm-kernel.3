Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2588C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuyKkic3LG8prk2hzqTBzKdxaSLkUa8zFIKnG1Vnzms=; b=mt2illnHzkHOX40lg4KuaqcRMl
	iJlSQSdtc60IG+xfJPsKdFzKJzfWT/+q2RZcuKtvyxadSlbIlaymmwL305oEfs7zDDcbfpTKjcB8c
	DSpQKawzG0/2ns1TmFdf8T2uHhWfg6IBAcAFWINIPrnhHVytCv8+HRBZ/v/7cJW0/nFhQB5gRx/Bo
	zrhPKEyOFes91VTs2xJpCYCYaEnzQQx3/dYGg3sXED79jgle39PSKUlt1pY5YNQM8undb0ry/lMGS
	RrBkpbTX2C5TyjP9TTbKdl9Dq9t8l4sT83TzkkM1jm0opjQgqRRDiit8ftJKKoQt7/dtTJJ9XkLnh
	s6CFHXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWmz-0000000Bsfg-18PW;
	Thu, 12 Jun 2025 01:31:33 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEk-0000000BXb1-2dKR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:03 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7394772635dso247847b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682081; x=1750286881; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UuyKkic3LG8prk2hzqTBzKdxaSLkUa8zFIKnG1Vnzms=;
        b=arHL+xTKLtVFoLoiCeEloG/QHIWk9XHE/GybcOdiFHKG8CcY+SRqEOePzsJZUA7G7r
         YrvXWTytdzeIK0OfhV0YYBlMnwQ4GH046SONS6CadrphdErL9hMZ/5vzHaWEnXkijMNI
         6/+Zz7P0x5f3493G5OrJ9PebHM+YLZJzWaN0VoUsqGzs5yZW+2lWQIBSBMdLILENUzMB
         J/kBE2VGpjkDYbKz5AtB00hrZvfzpm6OvKpMjKoYRWKftFABivUxJAR3x3BsAJLo58pq
         YXhTQJu/Hn6e5bXlyJx07MwpYAp/wifpuys9YIxgiSkTHF+jGzDCMrw/mXGl0PYnFgRj
         Z/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682081; x=1750286881;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuyKkic3LG8prk2hzqTBzKdxaSLkUa8zFIKnG1Vnzms=;
        b=xFhtd71V7rHYX8owx1I+jbA2vrNAXQjKPf45YxrTniSTg9sU3o1BvRJsrLg9GKNmuu
         I7bzAOSrcteaDFmxfbVg+k7EkANwQvjVtmSQ4vjyK3ZwQOPIM4NQK9f/yP9H8SzhAD07
         bjLlgeSI1I2sA1fNnlxf+LLNLuwtM5E5j1rdHTEMNuSC0JUs2X2spmg4MxphTeeiZt4+
         43weN6T4e4E7y28tw4hCSBH1xHoGIz2LF8sGDyr7RwewK37y4Kk5JIzBAqz/3rzvI7le
         CrBSjlu7PJsx8XOZk3FdbkHbRZRVpRn88pyoTq4hFHgR41T0OyQkVEoJclOYkur7mslh
         +L7w==
X-Gm-Message-State: AOJu0YxffujiPwM8R/6zzjBw4Y9El887zPPp5EaPuU6x7vO2zLYlpH6v
	vV2FPEZNSeFDaV0bWBMeFR/aOUS8P7XjUVGCw4ChaxXR6MiDvyV/IJEHBbnQ2HK+gsi1xV6x4CY
	/8lqUwA==
X-Google-Smtp-Source: AGHT+IH6Bg4QxP54+67PeSK08rS7fAvMkGbt5o6MmB1679Zom5LQy5Ttbbd7/GIAhTEMvGP3EkZo+NqlUao=
X-Received: from pfbhe19.prod.google.com ([2002:a05:6a00:6613:b0:746:19fc:f077])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:b90:b0:1f5:7eb5:72dc
 with SMTP id adf61e73a8af0-21f97752d70mr2227346637.3.1749682081378; Wed, 11
 Jun 2025 15:48:01 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:41 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-40-seanjc@google.com>
Subject: [PATCH v3 38/62] KVM: SVM: Take and hold ir_list_lock across IRTE
 updates in IOMMU
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
X-CRM114-CacheID: sfid-20250611_154802_674268_73C38378 
X-CRM114-Status: GOOD (  17.13  )
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

Now that svm_ir_list_add() isn't overloaded with all manner of weird
things, fold it into avic_pi_update_irte(), and more importantly take
ir_list_lock across the irq_set_vcpu_affinity() calls to ensure the info
that's shoved into the IRTE is fresh.  While preemption (and IRQs) is
disabled on the task performing the IRTE update, thanks to irqfds.lock,
that task doesn't hold the vCPU's mutex, i.e. preemption being disabled
is irrelevant.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 55 +++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index f1e9f0dd43e8..4747fb09aca4 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -769,32 +769,6 @@ static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
 	spin_unlock_irqrestore(&to_svm(vcpu)->ir_list_lock, flags);
 }
 
-static void svm_ir_list_add(struct vcpu_svm *svm,
-			    struct kvm_kernel_irqfd *irqfd,
-			    struct amd_iommu_pi_data *pi)
-{
-	unsigned long flags;
-	u64 entry;
-
-	irqfd->irq_bypass_data = pi->ir_data;
-
-	spin_lock_irqsave(&svm->ir_list_lock, flags);
-
-	/*
-	 * Update the target pCPU for IOMMU doorbells if the vCPU is running.
-	 * If the vCPU is NOT running, i.e. is blocking or scheduled out, KVM
-	 * will update the pCPU info when the vCPU awkened and/or scheduled in.
-	 * See also avic_vcpu_load().
-	 */
-	entry = svm->avic_physical_id_entry;
-	if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
-		amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
-				    true, pi->ir_data);
-
-	list_add(&irqfd->vcpu_list, &svm->ir_list);
-	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-}
-
 int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			unsigned int host_irq, uint32_t guest_irq,
 			struct kvm_vcpu *vcpu, u32 vector)
@@ -823,8 +797,18 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
 			.vector = vector,
 		};
+		struct vcpu_svm *svm = to_svm(vcpu);
+		u64 entry;
 		int ret;
 
+		/*
+		 * Prevent the vCPU from being scheduled out or migrated until
+		 * the IRTE is updated and its metadata has been added to the
+		 * list of IRQs being posted to the vCPU, to ensure the IRTE
+		 * isn't programmed with stale pCPU/IsRunning information.
+		 */
+		guard(spinlock_irqsave)(&svm->ir_list_lock);
+
 		ret = irq_set_vcpu_affinity(host_irq, &pi_data);
 		if (ret)
 			return ret;
@@ -839,14 +823,19 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			return -EIO;
 		}
 
-		/**
-		 * Here, we successfully setting up vcpu affinity in
-		 * IOMMU guest mode. Now, we need to store the posted
-		 * interrupt information in a per-vcpu ir_list so that
-		 * we can reference to them directly when we update vcpu
-		 * scheduling information in IOMMU irte.
+		/*
+		 * Update the target pCPU for IOMMU doorbells if the vCPU is
+		 * running.  If the vCPU is NOT running, i.e. is blocking or
+		 * scheduled out, KVM will update the pCPU info when the vCPU
+		 * is awakened and/or scheduled in.  See also avic_vcpu_load().
 		 */
-		svm_ir_list_add(to_svm(vcpu), irqfd, &pi_data);
+		entry = svm->avic_physical_id_entry;
+		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
+			amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
+					    true, pi_data.ir_data);
+
+		irqfd->irq_bypass_data = pi_data.ir_data;
+		list_add(&irqfd->vcpu_list, &svm->ir_list);
 		return 0;
 	}
 	return irq_set_vcpu_affinity(host_irq, NULL);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


