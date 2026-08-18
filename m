Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B46CC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCv+HQzJkkz/c+dZ9BRl+4th0Zm+hBhcY2bGeDdOzyc=; b=xqT3c9hAzWxFnPOtz4suu97wI7
	mJSQqeeA70Pf8XSzy0wFRFI4fC5ZEUmBnjAY96f7S5rmujDWCH00+YeqVmYXWXAex+kp5XJKrxFrZ
	BYQW3c/CVCnQEs8y23LnHghLLBbvW1zl35rH/iEC90mGlPuXlBIJU3Uoc2T/aVkY7R80024Xh5Nhb
	x/CIfv+HgtxQ5ZD74/29v1NFX5EgA6NhrofGQMP3/mCEhfjocS89zTKLREzZjYQHsfmXkvSOkqcas
	lGCw3vBxqO6E/9Ye4/QAfnlP1Xd8SoHZXEG/5QQt1JzNsT+SytP7NIdPgH7E+9OGeTkpA218Zbs+r
	BC7flx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvT-00000007aEs-0zq4;
	Tue, 18 Aug 2026 09:16:07 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvP-00000007aBO-43EF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:16:05 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so3474873a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787044562; x=1787649362; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCv+HQzJkkz/c+dZ9BRl+4th0Zm+hBhcY2bGeDdOzyc=;
        b=hKuL6yIO5qA2Hm9DPdJGnM6xZ1LZWL3rVkZX+bxq8MGBljlHZVR/JWOPxnCJa/2F8c
         Gwq9fUXWxNnjk5I6OBGhicouNOR4J+ofNeQlwwuE/ppmHsKOpbbyI8g53P/IQB3s6mko
         VGaV3bATjBYOdqCgudhopfKlXqrO4LTXWk1pIg1Y6U8cuDuaQlqL9fbvd++XLLHSbR92
         y4Or7OrU0rdVmV9Y0/lwU8Cfeubrwr7yTdyAZmV/oC1ZTLP2JHOHksjYSo6LEmwKHZnv
         //AXxzh8PFbYqAGh4fXPDdFuoMJWEzPnWPMmOiIb4cnrVFg75UoTW6B7I6ZiyVJ3S1fS
         DL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044562; x=1787649362;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCv+HQzJkkz/c+dZ9BRl+4th0Zm+hBhcY2bGeDdOzyc=;
        b=f7SGXMyCYD6vRAmFiVWOIs68loydRADLY+88tncuYt+IRPDMTfl+J2/qkbc5yz6Qp2
         6WSuA8HrhGhhCh0fmI2k/+0+IvwJUJrTv9BWu+smC/KBuFLyzUdkZ0EjQu8FgMUVLBk+
         SGmVyPi+clkUt64siQz3ve2kzCMRFZU0H8Yo7LMMj/AWKIcupgh1j4ZnSPonM9vUgzV7
         1p0zXXoB3fJ+nsIHv8jJCrpJs/fL/XXMKaRSRCxWADzerzpdPtAUfYGvQcayGUUMOoSd
         mZDf6osBhgiS7BqfKYgCrtPZZQtd92ckwCQmo+eS35y41/lHIf1BnKgTfVLa8ezbPjus
         zznw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2ZGkhse/hVsnfB+cz3iE/aCh5cn+DZNFGRuEylXNeEdxlSDVefwAizxmWe6bgnSckncFK/94D35bx4Vubn1u1@lists.infradead.org
X-Gm-Message-State: AOJu0YweSE7Q/PzVHyZGKur84cqSD8sqHwiRMmbVhuoTE+SV/DWDKy9v
	F3OiXM5eFBesTN06MBefCe4R80lCuXc+VkP2UdTI4oxoPF3W9ioVNuN2T6Ivr4sXwU2eGVvodn2
	FjWsdeQMRq9RtqK92xUtS+Fj5MA==
X-Received: from pgbdq25.prod.google.com ([2002:a05:6a02:f99:b0:cbe:4e21:813e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4a81:b0:398:c0ba:9ceb with SMTP id adf61e73a8af0-3ccda4b541fmr9874686637.12.1787044561971;
 Tue, 18 Aug 2026 02:16:01 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:15:53 +0000
In-Reply-To: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787044557; l=3842;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=iohu3wId074IkPEPPtY6DnmeCpNG8GAOrdh78h28Ak4=; b=Wb19M1g6ZtfbPgdd8ony5ekvd8iGMoQ0KEQZ5+a5RnG18bj+rMXmaWB+Cja685bhXr2oOmDTs
 MA3gk+hFS+oB+rGSqrMgBySp2vT+jhO7KjHLgoEcoMFyz6MXPn7e/ST
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v2-2-5298f42d49bb@google.com>
Subject: [PATCH v2 2/4] KVM: SEV: Drop page refcount early during RMP fault handling
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_021604_021538_7958A0BA 
X-CRM114-Status: GOOD (  17.51  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sean Christopherson <seanjc@google.com>

When handling an RMP fault, KVM retrieves the PFN for a private GPA from
guest_memfd.

Drop the page reference immediately after retrieving the PFN instead of
holding it across the entire handler so that the later patch can follow up
with completely not returning refcounted pages from kvm_gmem_get_pfn().

On a first look, existing RMP table handling (psmash and checking for
errors) might seem like it works fine, since truncation of the page from
guest_memfd would have called rmp_make_shared() and removed the PFN from
the RMP table. However, that is insufficient since a freed page may already
be used in a different SNP VM.

Hence, adopt the MMU invalidation protocol to guard committing anything
based on the PFN.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b2738362a928b..b34b11d7f8fad 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5003,6 +5003,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = vcpu->kvm;
 	int order, rmp_level, ret;
+	unsigned long mmu_seq;
 	struct page *page;
 	bool assigned;
 	kvm_pfn_t pfn;
@@ -5030,18 +5031,22 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 		return;
 	}
 
+	mmu_seq = kvm->mmu_invalidate_seq;
+	smp_rmb();
+
 	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
 	if (ret) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
 				    gpa);
 		return;
 	}
+	kvm_release_page_unused(page);
 
 	ret = snp_lookup_rmpentry(pfn, &assigned, &rmp_level);
 	if (ret || !assigned) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
 				    gpa, pfn, ret);
-		goto out_no_trace;
+		return;
 	}
 
 	/*
@@ -5069,27 +5074,31 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	if (rmp_level == PG_LEVEL_4K)
 		goto out;
 
-	ret = snp_rmptable_psmash(pfn);
-	if (ret) {
-		/*
-		 * Look it up again. If it's 4K now then the PSMASH may have
-		 * raced with another process and the issue has already resolved
-		 * itself. If it's not assigned, then this must have raced with
-		 * another process that made this page shared.
-		 */
-		if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
-		    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
+	scoped_guard(read_lock, &kvm->mmu_lock) {
+		if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
 			goto out;
 
-		pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
-				    gpa, pfn, ret);
+		ret = snp_rmptable_psmash(pfn);
+		if (ret) {
+			/*
+			 * Look it up again. If it's 4K now then the PSMASH may
+			 * have raced with another process and the issue has
+			 * already resolved itself. If it's not assigned, then
+			 * this must have raced with another process that made
+			 * this page shared.
+			 */
+			if (!snp_lookup_rmpentry(pfn, &assigned, &rmp_level) &&
+			    ((assigned && rmp_level == PG_LEVEL_4K) || !assigned))
+				goto out;
+
+			pr_warn_ratelimited("SEV: Unable to split RMP entry for GPA 0x%llx PFN 0x%llx ret %d\n",
+					    gpa, pfn, ret);
+		}
 	}
 
 	kvm_zap_gfn_range(kvm, gfn, gfn + PTRS_PER_PMD);
 out:
 	trace_kvm_rmp_fault(vcpu, gpa, pfn, error_code, rmp_level, ret);
-out_no_trace:
-	kvm_release_page_unused(page);
 }
 
 static bool is_pfn_range_shared(kvm_pfn_t start, kvm_pfn_t end)

-- 
2.55.0.699.gb54405d56f-goog


