Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E10C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuS9O11vr193qDv9HWb04MHk5U9f4uvrgo/7abqfaWM=; b=cDwEPmva/kQJbEmjuwJzrCqfxD
	EcfG1Xiy23mvijsIQqztZLlfQkIQZ84aOOootSLBkw88+or5FAWt19tnZDjRg+MMLngbly9m8Qrj1
	CELKgZVwnFww6kpxbGIOjJNiK7kQO848qu8tJJkJpfC3g2o8Q+wJwcIWH1etM7L8kBhMJ6L+WQr4v
	vqj3TBToAJ+nLVSMTu8lfEltFqPyiaSUkYZ+5qse50lybyy21QEwOo2tQWnN9ddpF8jfHbN8fLDkA
	2QNH9AcDEsUt3UczE0weRgVRRFCEHzEw9hN57ES6Myarfyoxc1/VcxVblvXP2kLq+tmwY940tPUmw
	wro69MtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WP-000000028DQ-2eGA;
	Wed, 26 Aug 2026 09:02:13 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WJ-000000028AO-23w2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:08 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1292766a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787734926; x=1788339726; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuS9O11vr193qDv9HWb04MHk5U9f4uvrgo/7abqfaWM=;
        b=PI7g09RRSg580+ceZ0T8pKBWIdHUorjcOph4abGUClzPlpmlLpRuxpVIODDCOm4pTM
         jlXe/81Ly/0hjWRlA3myRADYd2aXNyvpZ4zi0U/HHXqAIPtoaj+svR3WN/apeNaDvOCG
         YWQ8Nxc1Xa7sEGcViRAyUSDr3niH4X6SB9c+4wG1xyEic341dLm5RhxFwCZuG+vQYieg
         iKo9zz8hVfy0F9fOGnEkiZdGRgz4d+JrYLUs5ZTUcpSIujeztCP6VSuJAM8sp7TKVjIF
         iBfN5weW1jfSDDlxkZq4Q1pJBt0QzzczcncxcNjn6puzOyhxXtOML3DqDkJo+ZvxqHQA
         XbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734926; x=1788339726;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuS9O11vr193qDv9HWb04MHk5U9f4uvrgo/7abqfaWM=;
        b=MD18hvXP6tLdzfRMszJIaYDnLIuJOTLKEf/1a6Rdidl+OhWB/XqMEgjgPXJihg4xpq
         BlsVaeXB7r5SeW5GZ/SRHmXlMy4AaeksDhkCb5VoZkzAEnffNXT3LwWkj9t5HS1AHlTX
         vqpWJqjP+r5H5gZ2urHvdyY3a2yeKxvtz/I9YYmgdaZS6Vf2hJSrXpIv0QaJpQLHanb7
         DTbfH68hBNO97soIjwxCamOvu6XhLt0gaT3MHlPe0tFvMLWdp0lTe+QerKZWK1uethSK
         6G1+SUGQjzH/MJHXvLvviBtUDXXFSCAXT5io7czBhtLc7oiupFNB7rVDKY74YDrDHh4C
         D8oQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHTDN3HCY21sgmS4DeXXlL5Rd7Mj72HXa2+iwR3jJGc+zQq7wmArEP9zVtotOgEHW2ITsrHE7bpwOsj+5K8rcx@lists.infradead.org
X-Gm-Message-State: AFuF++nIKBtLXVDflc/3gcOuWtrdjVaoJvVIQ81krnZB91r8wARkzSbA
	Iq8cz7BdxXOpVFqbNSYNx62UgRZOgcI9t9fImYA1zvwIc/VVamIS6aHtgg0UoLXkkhqQ6iZi6zs
	/bWNhWUOOHuXxyp2EMybKbiXppw==
X-Received: from plbmz15.prod.google.com ([2002:a17:903:350f:b0:2cc:6063:a658])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e70e:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3966d4503ccmr11876759a91.13.1787734925365;
 Wed, 26 Aug 2026 02:02:05 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:01:47 +0000
In-Reply-To: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
Mime-Version: 1.0
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787734920; l=3858;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=ifBAzXs8dlmanG/v8Acwb5QccjLKb55JHzRk/esPfm4=; b=kJMdcnrib7/3q/fmH14PIC5RislnUwwDuforS4mPsCFG6U4RlmpkwZgDuAO6oLG+VTfDnsS8p
 VAKOV4a6zA9BcErbmRbTF6QWV2iI5gPuSe8RTZJyLl6TjYx7ftseQ1s
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-no-return-page-v4-2-3bb9c1ddb4e3@google.com>
Subject: [PATCH v4 2/5] KVM: SEV: Drop page refcount early during RMP fault handling
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020207_545776_A74550E1 
X-CRM114-Status: GOOD (  16.11  )
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

Rework KVM's handling of RMP faults to rely on MMU invalidation logic for
safety, instead of the current approach of holding onto a folio reference
until the RMP operations are complete.  I.e. drop the reference gifted by
guest_memfd immediately after getting the PFN, and instead do RMP updates
under mmu_lock, after checking for relevant MMU invalidations.

This will allow dropping guest_memfd's reference gifting entirely, which is
ideally how KVM would operate for all "follow PFN" operations (GUP has many
more complications, which is why KVM holds a reference across page
faults *on top* of the standard MMU invalidation logic).

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Michael Roth <michael.roth@amd.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index e198469eb074c..0d027cff734cf 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -5019,6 +5019,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 	struct kvm_memory_slot *slot;
 	struct kvm *kvm = vcpu->kvm;
 	int order, rmp_level, ret;
+	unsigned long mmu_seq;
 	struct page *page;
 	bool assigned;
 	kvm_pfn_t pfn;
@@ -5046,18 +5047,22 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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
@@ -5085,27 +5090,31 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
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
2.55.0.887.g758fc8c411-goog


