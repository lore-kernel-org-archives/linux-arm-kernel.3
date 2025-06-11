Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A43AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBmMQxjdJ9cFQvfjWX4n11ei39HpxV6UN/bk9QZ1bLc=; b=mueFzS6sQkAEoapqFFsMLVoH7n
	CuLgWtPizKxIE8dsFlvPOG35wwHpydJUtCKJZguUNh+NbuSym46SDJ8M/pgYA59a9pDsrTVKGXGu1
	n73oD3HrrlQUyHD774XdMKlvUs4EEF4H/8OVurl/SDXriGjetuaAigqma2EPg3dYQSXX//pAJgX9L
	Ao3/ljUwbupvumwIhvhMHaCQ9ZK8ALJNzMHDmzyNBw+V3CRC/dq1eV/34Kmci4zJuqa1N88FyM++7
	FbmpTFuHF6ZqlsLg0lJgzdJvBbey0xqt61k+Rx9O7GWntcjYWiSwagwBYmYRgCeJ2JOK82kWIIylO
	saL+DPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPX7x-0000000BurJ-3ohR;
	Thu, 12 Jun 2025 01:53:13 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUF2-0000000BXnE-05tC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-742c03c0272so396953b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682099; x=1750286899; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PBmMQxjdJ9cFQvfjWX4n11ei39HpxV6UN/bk9QZ1bLc=;
        b=2QNtwyMZyJD7IlcDrkQy/ulyunFE7hGcMuEVpG/yS1y3s8LPFMLSnEPS/9g7S8VI7z
         mPrxsOINf9Oql2dcgFH12PTMAV+Yudrsepgr5QvfjckbGFBRJ+goaQuIo1F5S+jC7Npt
         0QgbHzpprb015+GSUl5Dqntm0hS3igh83pwsTiuBlJoNE8eVQG8L8pS2+/eRMEMzgpg4
         3gmoCvIzqoNesc3T8smpVo96FzsRkiYDAzMoX7+mAF7scCP2lAHuUYwmrbaTOkehZSXX
         63dkHmjeyQLfUiJomAPoNOIEQnCu+bY8MjvT3zMAoGBZZhtWXV7xgiegr6dVbrPbd71d
         rN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682099; x=1750286899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBmMQxjdJ9cFQvfjWX4n11ei39HpxV6UN/bk9QZ1bLc=;
        b=j5TY2oTHnQetr0Rz1F87FsYKWSKEMPfVeW/ZSiZt/3/eOz7756W7Lc1/Qgt6Nn1PKn
         9RFOH/9JVM2FXS35G2sAIzoxgZBOJfhmxDJl2Ut2/NoGbX/RhVv5CO7BJihQs+67RgGP
         T/NbtK5t/yO6MlZ4VLwP4EsRMu00p3guXpPP6MgAPT4yX9onhe0/pHSHjOuEjSpMI+nJ
         x99jmQrMhINDz/e1RNzU4j6iDEpjgqTiDTSktEk2NyOjRSm4aSVgYbMy6yh3AsIIFdTd
         OYk0J4DNzU4C+wxnrKNZ7JR7cDNyl9bRHJIh62jjLyu54wCkfrtJShFeAt1GL0u7V/xR
         gnEA==
X-Gm-Message-State: AOJu0YyP6SDrHmlJwweV3lllBrUFBbhpcOQb2BwpOiQKIAlwWlhVIwq8
	JxCRYhFHN/F2nN290NdlGH4cmqvQ4n6I3w/6+LSWjovHJE1UBQlDMb+N/Y50d41GFM4geWfH9p0
	01gZnqQ==
X-Google-Smtp-Source: AGHT+IEBM47Uz2X6xS0CCAIos8ahR8hfvX5maaZpinfB8zlXBAyKSgRG4LiJD4Zyz26rgc00CLciKxSYoFk=
X-Received: from pfbk13.prod.google.com ([2002:a05:6a00:b00d:b0:746:21fd:3f7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1387:b0:73e:30dc:bb9b
 with SMTP id d2e1a72fcca58-7486cb721aemr6046845b3a.2.1749682098847; Wed, 11
 Jun 2025 15:48:18 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:51 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-50-seanjc@google.com>
Subject: [PATCH v3 48/62] KVM: SVM: WARN if updating IRTE GA fields in IOMMU fails
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
X-CRM114-CacheID: sfid-20250611_154820_059827_FB318FF1 
X-CRM114-Status: GOOD (  11.89  )
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

WARN if updating GA information for an IRTE entry fails as modifying an
IRTE should only fail if KVM is buggy, e.g. has stale metadata, and
because returning an error that is always ignored is pointless.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 24e07f075646..d1f7b35c1b02 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -834,9 +834,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
 
-static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
+static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
 {
-	int ret = 0;
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
 
@@ -847,12 +846,10 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 	 * interrupt remapping table entry targeting this vcpu.
 	 */
 	if (list_empty(&svm->ir_list))
-		return 0;
+		return;
 
 	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list)
-		ret = amd_iommu_update_ga(cpu, irqfd->irq_bypass_data);
-
-	return ret;
+		WARN_ON_ONCE(amd_iommu_update_ga(cpu, irqfd->irq_bypass_data));
 }
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


