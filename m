Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FCCC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FnMVkTP7732/rGDqsdkPg9eAdht5jy1QJRhPQZX9sI=; b=V2gDQVOGwkbW2T3U6yUxeyFwnO
	N/xj2j732XGRlchqJU7I4TW+4yTlkXQ41bp1jRFjgaTaC4lbAmlhuXhrhVgXrmVkYOLNMbr6e0eN3
	Oz9a23uiIZBPWZhMxhU7StPpRADdk0AS1+ggtJtw9xZJCwE537aecgu9GZuWbcnco+P/jVh9xcaFO
	xlCvmZvD5O5vsrDSdslVfK6e0XkBJtxUegxEw7dFS1BF7YNJyx9ybTkC/KKHZD9AcATqCoyec2cNw
	5LJw3jcTWl/oidD0UtXhkkYXc1hknUSyppRyZhoVl5yliYyTA40Sd26Xt9L9OBKLra+NJLzmF2Son
	3/oZifUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPX3m-0000000Bud9-1rmH;
	Thu, 12 Jun 2025 01:48:54 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEy-0000000BXlY-2UeK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:48:17 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so522489b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682095; x=1750286895; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8FnMVkTP7732/rGDqsdkPg9eAdht5jy1QJRhPQZX9sI=;
        b=2jmtDAasEJpmqMW+jcwywIl45MX0udV6HA+05lY7lfigeqFI3SEXBQzFmfLuznRJEr
         ub35xiZ66aD5e1DHhWkgHJiCl/FrpyyFl4Sek+qU8Rsgj0OrFfeJbfvR4x/A3/FjSy76
         Ixvcmc+ZLjMrPHKhxrpyDjWJhdI2Nt+rnesahOCNnIMZeR4cny6Dr+HgCWtZO3l44pH+
         U8oOFuDPX4RPc/qxSacMbvRM354CG4cPyY4wUAXShSKziDUVW6fTERAIUOmrQDU7T6hg
         T3eJVfV0KiOnKP9wOjlZzD8X+pVZeunhplpSr68Uh3hHs5wpbpOXjwP9LXCbxJDKiwEk
         2xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682095; x=1750286895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FnMVkTP7732/rGDqsdkPg9eAdht5jy1QJRhPQZX9sI=;
        b=H/kkrA1Bevnp9dvLLDgUKIY9NdF8N8ADYY/X4AV8+H/mhEoB9O/7+2yYBKkk80D9B7
         FqFp+etITpXRjIUoBTnHkDv6kiPZIeH4/QAhJc+SbQXByIA1x9gx340veZwQIj3vKD/4
         Y+QlaQxyf9JJMCkJaerlTQOMYsUB/Z8tMhZ18+rHDcfwCqwotOc5E7+T4ydV2fkbAQpj
         QF/Dw7GnyVTzJs7j7aZs1SPVlRH2yEv8hVPGzIJGZDmUB5MABQuWzPK8ghji2pSjFJWb
         he3rPqhBLpjrd7csNedwoUdmQ6JvgM/EA4EsiN3/bl5yFvtHmecU0hzyO3aBbEt26gwD
         YPFg==
X-Gm-Message-State: AOJu0YyPmEFUVArl8z27PIwt695x1aImHTslmG5nquAo3HTj7Aw2EpNh
	fGjtS4b7xhh7pNdtng9Y7jBjnRsOAcjshsICA0wZKnfIhx/aee0vGWP9vC8/7Pk2ESAIWM+RgZe
	tA+ZPaQ==
X-Google-Smtp-Source: AGHT+IEkxrCdp03yXvohQUC5aX3+y16xZeqjkREhnIK0pQh5uO/LXqt4ZRF8KMwqJnvnYQVw6yQOWD1N5g8=
X-Received: from pgbfp15.prod.google.com ([2002:a05:6a02:2cef:b0:b2e:c392:14f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:32a4:b0:204:4573:d854
 with SMTP id adf61e73a8af0-21f9b6b34afmr672683637.9.1749682095254; Wed, 11
 Jun 2025 15:48:15 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:49 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-48-seanjc@google.com>
Subject: [PATCH v3 46/62] KVM: SVM: WARN if (de)activating guest mode in IOMMU fails
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
X-CRM114-CacheID: sfid-20250611_154816_631122_E014EBB1 
X-CRM114-Status: GOOD (  11.77  )
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

WARN if (de)activating "guest mode" for an IRTE entry fails as modifying
an IRTE should only fail if KVM is buggy, e.g. has stale metadata.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ab7fb8950cc0..6048cd90e731 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -724,10 +724,9 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 	avic_handle_ldr_update(vcpu);
 }
 
-static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
+static void avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 {
 	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
-	int ret = 0;
 	unsigned long flags;
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_kernel_irqfd *irqfd;
@@ -742,16 +741,15 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 		goto out;
 
 	list_for_each_entry(irqfd, &svm->ir_list, vcpu_list) {
+		void *data = irqfd->irq_bypass_data;
+
 		if (activate)
-			ret = amd_iommu_activate_guest_mode(irqfd->irq_bypass_data, apic_id);
+			WARN_ON_ONCE(amd_iommu_activate_guest_mode(data, apic_id));
 		else
-			ret = amd_iommu_deactivate_guest_mode(irqfd->irq_bypass_data);
-		if (ret)
-			break;
+			WARN_ON_ONCE(amd_iommu_deactivate_guest_mode(data));
 	}
 out:
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
-	return ret;
 }
 
 static void svm_ir_list_del(struct kvm_kernel_irqfd *irqfd)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


