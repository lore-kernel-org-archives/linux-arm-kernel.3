Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ACFC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DtVGJXTI5NZcLSNxUulZl3FS9wdQHA/Njni8dB9YZ8=; b=FKcgkqE2fLjXP8O8SFgtgsi0WM
	5YhhlpURIaNFyUKotcBjOXe9+32lxd3rxs2LYttbfnkejSQ3Iqt/nnBgFdeTIADO/F1O2kUwIMe+h
	Wn7kEv2FgBaJZgrXcfB86mvMpZxWlvF7bzoAnA7+xQYETfUVHI0M5e4PCwbHIlfizneKW9RTy5sRA
	fPzgvNCPWsp5+7KOl92G8+m0WL//53d8pfIFxi+JTChBzTFSptKhDZqweOkWUYhTYJUs+bna6sQ56
	WMIHkKt/JNZCftwartNNFVy9kmgJ2DJNvcFnoNcu8hZg6KBdMdBMtjpaRLOTWJ0gvFXGZysnbjOXB
	tJXdV2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPWWD-0000000BrYB-2Gvo;
	Thu, 12 Jun 2025 01:14:13 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUEW-0000000BXRt-1yMH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:47:49 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so154590a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682067; x=1750286867; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+DtVGJXTI5NZcLSNxUulZl3FS9wdQHA/Njni8dB9YZ8=;
        b=tqB3sOoNxiITYBJVXSuNq5XD3yQSkg15DbmvKeBRPHDcz4X/wDaRVpU2MBTHJF3ElR
         YnNoAdLKbmrnEhIufWdRLXgarpxDG8bbBahEsgN0H3P2bwTr+IYqZY3pwGYt/2YZBKop
         InGGV2eG8SH7UgrKKPBeL4ahMDzsDxzJbJphmV1LH/50HPFOtWs7A2gAiFROyik+Vmcg
         fEr+3vj/xwQ3vBNs5pBw5MFt4gCDFQAgrfdz9b3ISFFrAEcUbMnyRJ8tbhs/SR3Eye82
         UYNaQoyGeo6yXROZVXpqBgUcANMgmhaO5xA49yH03O1aAKScgI9vsyPLlM3YcR0QbpSG
         sdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682067; x=1750286867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DtVGJXTI5NZcLSNxUulZl3FS9wdQHA/Njni8dB9YZ8=;
        b=ji1W84eSyxjf4VMbeHV5oC65s/Z4viiydHslw5Ck+/DtTzBinp7EGOf0BTHX0weC0K
         XV8/ZgWQ5N6F/0QOyMCWNEg38XVDEwlXYN+oB9lIuC8cZW07XClvYHRWWPlp/4Dzswd7
         aj67RQmG51A5ctoItmERmNFI1BhJRQ9S76gWd3iwryidXh4WqbHO1V2efa6d9vQW3CH5
         jASOOuouNe1Ivmlf0plCEokBVkpSnTMjbnnJgHyL8f0gkEpaJ1W+kHg1i6cK4dGfD6uA
         q6hjXYewxgbE4EZZ0MnrORzAiJyVAkStMTueDxElspfjfoMVixnsfTVfGC1UkucnTWtY
         SddQ==
X-Gm-Message-State: AOJu0YxLLr2wM9DveYMgV5JGc2bK0FvcZlGkgYJ5B2tuOsTbqS342meG
	piTPVlEAaaYZhYixa9pQoBFWXcqNM4MlwMvtPfzzpoc4nbicxqRkO0gfOZXc+i7YSVSAHzg3mg5
	Y4FYpKg==
X-Google-Smtp-Source: AGHT+IFyGDdeorUwj3sAfzICdRUEdg2fKYugNVe8KlRyB4tgk6PAyMC59w8WcXLbD69NI4qphVBoJu3KIY4=
X-Received: from pflc8.prod.google.com ([2002:a05:6a00:ac8:b0:746:1e60:660e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2589:b0:21f:53a9:b72c
 with SMTP id adf61e73a8af0-21f86754dbemr7156966637.38.1749682067486; Wed, 11
 Jun 2025 15:47:47 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:45:33 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-32-seanjc@google.com>
Subject: [PATCH v3 30/62] KVM: SVM: Clean up return handling in avic_pi_update_irte()
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
X-CRM114-CacheID: sfid-20250611_154748_565479_FF5D6900 
X-CRM114-Status: GOOD (  13.13  )
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

Clean up the return paths for avic_pi_update_irte() now that the
refactoring dust has settled.

Opportunistically drop the pr_err() on IRTE update failures.  Logging that
a failure occurred without _any_ context is quite useless.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index d8d50b8f14bb..a0f3cdd2ea3f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -807,8 +807,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			unsigned int host_irq, uint32_t guest_irq,
 			struct kvm_vcpu *vcpu, u32 vector)
 {
-	int ret = 0;
-
 	/*
 	 * If the IRQ was affined to a different vCPU, remove the IRTE metadata
 	 * from the *previous* vCPU's list.
@@ -838,8 +836,11 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			.is_guest_mode = true,
 			.vcpu_data = &vcpu_info,
 		};
+		int ret;
 
 		ret = irq_set_vcpu_affinity(host_irq, &pi);
+		if (ret)
+			return ret;
 
 		/**
 		 * Here, we successfully setting up vcpu affinity in
@@ -848,20 +849,9 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * we can reference to them directly when we update vcpu
 		 * scheduling information in IOMMU irte.
 		 */
-		if (!ret)
-			ret = svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
-	} else {
-		ret = irq_set_vcpu_affinity(host_irq, NULL);
+		return svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
 	}
-
-	if (ret < 0) {
-		pr_err("%s: failed to update PI IRTE\n", __func__);
-		goto out;
-	}
-
-	ret = 0;
-out:
-	return ret;
+	return irq_set_vcpu_affinity(host_irq, NULL);
 }
 
 static inline int
-- 
2.50.0.rc1.591.g9c95f17f64-goog


