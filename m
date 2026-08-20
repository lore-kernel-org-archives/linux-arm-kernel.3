Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DB3C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIY2AhPPQzV0SpGVac6m1vEhtgYyPU90RiUZoPMOP+0=; b=rMP9vXNQkoxfzPMB3QHk+AyAbo
	oy5564AY6RDr+R6uqJhdVcQhxTE6N0E/HoMzyeUPdyVFK3y6hLKE7q6ROdYQBUU9Aa0/RCY5pWwd+
	7hpXZQNKljfwwb0DbCCkoo0i5QvNiyLZSGWrPBg033SJeUSDlIUbN2XD5p6lSam7beM8+0k8FEogF
	ap9zE/nOVDAvvN1ntIQydu2+7t5rejrluMHsFwmZE0As0s2KCDqPqJEdVa1tiMFaHQbxygF/7ThUI
	wZztlOXKT7rJVCypFMIyaolT0MJPy+274eOHRrnb/IzJQJVpBCb/xtTfN2eJlKVVPkdErbCIk3+aK
	rgh85xFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFe-0000000CLdj-1k0f;
	Thu, 20 Aug 2026 23:32:50 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFY-0000000CLbg-3XsF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:32:46 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so494855a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268763; x=1787873563; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIY2AhPPQzV0SpGVac6m1vEhtgYyPU90RiUZoPMOP+0=;
        b=D+NaLvXUWlWZVcgg1SoLNbkktq+lE5j2E2fO+zGlcS10Ntpn4z6UeKmuFPz3RWQvC+
         GY1IXh7Xjtilkix6U6OU2k4ptvvGbL5gqT3fcHKmkW8jcAsR7ugX9BrS3c3LRfVrUSGb
         LJzCeBgw3HE6jsNhPjt2o1A6dHzBcDvOCpFqwo0VBIBgbgtE+UVy42uIsLHwUnGCbM9r
         cpZuMjMSoqI/IAKL4Xz/yjRMIMZxjbYL7OBn7c4Ao4au3QZWY4fKt6bGVzI6EmkrSJWm
         0oOCO3eqbu+ruQA1iT4NJB3+AmWozPs9+RQYbn0WADtdQ77I0JV8dRDTwd7DuBIjms02
         r0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268763; x=1787873563;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIY2AhPPQzV0SpGVac6m1vEhtgYyPU90RiUZoPMOP+0=;
        b=AschKXBGTAU2CG26gvJFagNs8QNvfmRrZ0GO/3QvfXo+MMnZzey/Tm9/qbhN6822rQ
         a1vZ7wvquikqeG9s3Vxu1U6Pg4A0Cwd3maOuBOqO2Pf71JQIRzZ5vbxfj6OIeN++m0eX
         OOEoLYQYv8N7BJ89KxobXJ2aQRO+pbI5snItWt14YgMmn1KVgac2X8BUEFIJoww102xv
         IMY70o9UJ4tezorT6A9utQyL6268vOSUgZtQ8E2gwWBMGmedND9EzzHkZNK+a1FtUWNX
         rmc604j7JFcMUw1DVEIoolIwWxqggsYy57WKlLVh6632UIVnEcdsvsayYxVr7bKLGO5U
         gI8g==
X-Forwarded-Encrypted: i=1; AHgh+Rpb8UJoohP8CegdPQtyvl94EnjBkgIUmaFrDhm319PVSfNKXi6yaCNKfXE1QnBg1xD4TpZQuHrLVcwLRwUX5GP4@lists.infradead.org
X-Gm-Message-State: AOJu0YyxyziM3O2uIRiuQI8D3kcLuDO/ws37abPVqae/mSPI29pVUPhZ
	3v9oA8Fkl7XCaP6q9Fta+dS0aNaxdWV+NOa9ltJ/y/k4V90YM+UBUvmsC0dbMhYOyC68KjXMhyY
	YuLIyXC02GHYRE5fT1GDzdS24AQ==
X-Received: from pgbdn2.prod.google.com ([2002:a05:6a02:e02:b0:cc1:577a:be35])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3511:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3cd30060d76mr4159740637.11.1787268763335;
 Thu, 20 Aug 2026 16:32:43 -0700 (PDT)
Date: Thu, 20 Aug 2026 23:32:35 +0000
In-Reply-To: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
Mime-Version: 1.0
References: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787268758; l=4467;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=gmGK5vSp2T3AX5rxyH8TZSoWy4Yohm1Gq2bGrUFDfX0=; b=uZp0bfS9zqFoFKgb9NG/wM0fl/ZiJb3zgvRPUCdq8MfxfHKHAx6mFHPHhfUBhuv0P/o7ih6Az
 Be0oeIuNnL1BRBWOzUneSjBWLU2ui04EGXoIzvLkwmam2EaiBS3N1/F
X-Mailer: b4 0.16.0
Message-ID: <20260820-gmem-no-return-page-v3-2-3bf8f80a7b4d@google.com>
Subject: [PATCH v3 2/4] KVM: SEV: Drop page refcount early during RMP fault handling
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
X-CRM114-CacheID: sfid-20260820_163244_896285_A1035E6F 
X-CRM114-Status: GOOD (  18.93  )
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
holding it across the entire handler, and adopt the KVM MMU invalidation
protocol.

To avoid wrongly warning about not finding an assigned RMP entry if an
invalidation had taken place, check for invalidations before warning.

When the RMP level is 4K, the function exits. That doesn't need checking
for invalidations, since if it is 4K and there was an invalidation, not
psmashing and not zapping is the right thing to do.

If the RMP level is 2M (the only other option), use the invalidation
protocol before attempting to psmash. This ensures that if the page is
truncated and freed, and then re-allocated to another SNP VM (the RMP entry
is now assigned, but to another SNP VM), psmashing would be correctly
skipped.

A later patch will follow up with completely not returning refcounted pages
from kvm_gmem_get_pfn().

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Michael Roth <michael.roth@amd.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 47 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b2738362a928b..563870342a2ba 100644
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
@@ -5030,18 +5031,26 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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
-		pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
-				    gpa, pfn, ret);
-		goto out_no_trace;
+		guard(read_lock)(&kvm->mmu_lock);
+
+		if (!mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
+			pr_warn_ratelimited("SEV: Unexpected RMP fault, no assigned RMP entry found for GPA 0x%llx PFN 0x%llx error %d\n",
+					    gpa, pfn, ret);
+
+		return;
 	}
 
 	/*
@@ -5069,27 +5078,31 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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
2.55.0.766.g2966f0265a-goog


