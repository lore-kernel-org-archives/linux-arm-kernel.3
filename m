Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48182C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 00:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgCcXi1lmHYVbCUjIr5w9EjZ1G5EUAljNN15QlkwBdI=; b=sHrZRzbKAhXT3Nq2WXO5qtNyl5
	6Y7bcKqS7kpSAjwVYhtxoS7TyQIdgLzHmIEzlvN5iAjWWzYHezOwcEmNcIgTAwS0b2TrcKfWhibUi
	fri2JGgGM+ZZ80tOiB/VldHhTn8wVL2PmFrZ2V46ffMfEPYIEb2iRU/wLaJNj/JozOTGVD1FpBroF
	LIeyzOS6+G6Xu0l6czu/Fa1G6xi1mmYC2TETICtyLXZ20oIV/J4jGg/gBhu95cPBVK2mXpJMlP0Lt
	AKO0aBM2am7SEQBT5zvpxqZG/C2ZtFsq4xPSFv7EjIOpULjYmTAL1E08v/x7kMGl9TSzuT7Fa7OYG
	VxrKqo2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPW0j-0000000Bo92-0P1r;
	Thu, 12 Jun 2025 00:41:41 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUE7-0000000BX8O-2BSe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:24 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-747d84fe5f8so176805b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682039; x=1750286839; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JgCcXi1lmHYVbCUjIr5w9EjZ1G5EUAljNN15QlkwBdI=;
        b=w9WiWL+ul2cqCAmBe6DoG37vxzfxOdvIg4iwPDJM1t0ZsYnG+Rb53n3XX2Rdth3TeA
         Q5Gz/NAw3bQ70ilvObrfc8wfNq1zIQBEoUiewyBMyuiBXeAManSNp5GrmRNmT0B2+VPF
         QZfmjuOVnQ3uGY3zc2OztluJUmzIFBsM80gLHiVWkwOkqMf3W9F4vRnP23cHmrjyATUQ
         Dbe6jldzZyTQ0Q9LVQqpBGh16wPghuRNlM6aBfMPYokZOLAcusZhRpayWwHyRVDNcZjt
         pk5g27ClUMhNWx+KkqIGpL3gnUcIUDTqW3Im222fVMbrRiEH1pN7ltcyjmjhYMahJ+0i
         HraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682039; x=1750286839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgCcXi1lmHYVbCUjIr5w9EjZ1G5EUAljNN15QlkwBdI=;
        b=cQ/z4VViFvxgVEoBRHzC09RCq2dL+qnKXuQVLdSecGEBp1xyiC1eIDunrOObcLknp2
         I0UPU6+UCgDkwx6NOAPHZi+DZ1jYkbhcDuXgWVAGC7Z7dOyhU5WTMYKlIfe9YlwtetmJ
         AvwGiV2dn2V3DKOOFOZTd7zlxb9MdqLXLdAzsK5v2KoU6e6zeg1CTzSDi6zrhRwvXiIf
         keJQD/3MXeu39exZQ9183PcxlCVGA5VeypPRso75DyD1i6ycxEvo8ywlpoeWJgHT/GgM
         /pfXKoBXLqrZk78MehK2QvdYkK1LPoWyOf1yI8yCIhabRAihQ8rZ/ZRh2EtK2uiJaYVt
         T2Wg==
X-Gm-Message-State: AOJu0YwI13wV+nc6qbjiHm+iLHSF8x7JKO/4AE8KYBh0DJHC33z9RXco
	HcT5saKUPDlgxXNZl3U09OUHK66/eQySY68n+mTIO+Gg2iXlFsRpvuqqAPxJ82hTqtcegm5Z1os
	9vLSzwg==
X-Google-Smtp-Source: AGHT+IF4EOTklxmbKRQMt1i+V76Dzg8HGe7ggrexZxq1G9OoEFFOTzeyCP2Mfh9kf82SvgKjm1r87uoXRu8=
X-Received: from pfbna4.prod.google.com ([2002:a05:6a00:3e04:b0:746:2ae9:24a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8882:0:b0:73d:ff02:8d83
 with SMTP id d2e1a72fcca58-7486cb21c08mr7745118b3a.3.1749682037122; Wed, 11
 Jun 2025 15:47:17 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:15 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-14-seanjc@google.com>
Subject: [PATCH v3 12/62] KVM: SVM: Inhibit AVIC if ID is too big instead of
 rejecting vCPU creation
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
X-CRM114-CacheID: sfid-20250611_154723_549996_CED55C71 
X-CRM114-Status: GOOD (  18.35  )
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

Inhibit AVIC with a new "ID too big" flag if userspace creates a vCPU with
an ID that is too big, but otherwise allow vCPU creation to succeed.
Rejecting KVM_CREATE_VCPU with EINVAL violates KVM's ABI as KVM advertises
that the max vCPU ID is 4095, but disallows creating vCPUs with IDs bigger
than 254 (AVIC) or 511 (x2AVIC).

Alternatively, KVM could advertise an accurate value depending on which
AVIC mode is in use, but that wouldn't really solve the underlying problem,
e.g. would be a breaking change if KVM were to ever try and enable AVIC or
x2AVIC by default.

Cc: Maxim Levitsky <mlevitsk@redhat.com>
Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  9 ++++++++-
 arch/x86/kvm/svm/avic.c         | 14 ++++++++++++--
 arch/x86/kvm/svm/svm.h          |  3 ++-
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 2a6ef1398da7..a9b709db7c59 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1314,6 +1314,12 @@ enum kvm_apicv_inhibit {
 	 */
 	APICV_INHIBIT_REASON_LOGICAL_ID_ALIASED,
 
+	/*
+	 * AVIC is disabled because the vCPU's APIC ID is beyond the max
+	 * supported by AVIC/x2AVIC, i.e. the vCPU is unaddressable.
+	 */
+	APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG,
+
 	NR_APICV_INHIBIT_REASONS,
 };
 
@@ -1332,7 +1338,8 @@ enum kvm_apicv_inhibit {
 	__APICV_INHIBIT_REASON(IRQWIN),			\
 	__APICV_INHIBIT_REASON(PIT_REINJ),		\
 	__APICV_INHIBIT_REASON(SEV),			\
-	__APICV_INHIBIT_REASON(LOGICAL_ID_ALIASED)
+	__APICV_INHIBIT_REASON(LOGICAL_ID_ALIASED),	\
+	__APICV_INHIBIT_REASON(PHYSICAL_ID_TOO_BIG)
 
 struct kvm_arch {
 	unsigned long n_used_mmu_pages;
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ab228872a19b..f0a74b102c57 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -277,9 +277,19 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	int id = vcpu->vcpu_id;
 	struct vcpu_svm *svm = to_svm(vcpu);
 
+	/*
+	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
+	 * hardware.  Immediately clear apicv_active, i.e. don't wait until the
+	 * KVM_REQ_APICV_UPDATE request is processed on the first KVM_RUN, as
+	 * avic_vcpu_load() expects to be called if and only if the vCPU has
+	 * fully initialized AVIC.
+	 */
 	if ((!x2avic_enabled && id > AVIC_MAX_PHYSICAL_ID) ||
-	    (id > X2AVIC_MAX_PHYSICAL_ID))
-		return -EINVAL;
+	    (id > X2AVIC_MAX_PHYSICAL_ID)) {
+		kvm_set_apicv_inhibit(vcpu->kvm, APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG);
+		vcpu->arch.apic->apicv_active = false;
+		return 0;
+	}
 
 	if (WARN_ON_ONCE(!vcpu->arch.apic->regs))
 		return -EINVAL;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 1585288200f4..71e3c003580e 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -722,7 +722,8 @@ extern struct kvm_x86_nested_ops svm_nested_ops;
 	BIT(APICV_INHIBIT_REASON_PHYSICAL_ID_ALIASED) |	\
 	BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED) |	\
 	BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED) |	\
-	BIT(APICV_INHIBIT_REASON_LOGICAL_ID_ALIASED)	\
+	BIT(APICV_INHIBIT_REASON_LOGICAL_ID_ALIASED) |	\
+	BIT(APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG)	\
 )
 
 bool avic_hardware_setup(void);
-- 
2.50.0.rc1.591.g9c95f17f64-goog


