Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EA0CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXoOtdmnob+YnMth1qvSHm903lQEMfykmhDcceAz8kQ=; b=Yqt5W5WKP24FV80XbsEnWw2RKn
	WCORsZ0VPR2IUVd/pSKCIakeAEPwVz/AFUPj2LgowfHUJ4OhXwh4XaRd4Q2I5YkYV5QKUI2JM2xi0
	nFl5DwBST9VVOtiFqJp53RYBBgrdzreccroK4alBAesfQkzMUkRdGxzRu4G9mEGakBQy3EHa+wWvn
	5OTd/JZF+hkvmmcCfJ/j6rBOGUZty2C63Q1V9XLn2FYqBvCoUDYTdgm3mV6hOFvGhwApi/pM+pASC
	QuJjmJUrtojchz9I1JTKo4sFwmwH+oMyjg1D6AfftqufYBbRricjNyaJiNjguA2rmTg6MP5G/TMp/
	hcZ7CVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvQk-0000000F3fT-1amb;
	Wed, 14 Oct 2026 09:37:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvQd-0000000F3Zm-2Nxz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sXoOtdmnob+YnMth1qvSHm903lQEMfykmhDcceAz8kQ=; b=Yc5CeZNG5aAYR48ONbY1zF+tAG
	r6yyvZ5hxD9wiGY0jc9wXCFFDLpY6UcEXG3tWqIbmZ6eGNaJ2Chs3lQgalTC+eEsd/VIbv79gD+pl
	VBKeNO/pwhUSEVb8mJA34myFZZ+HED/4cFTg2u3zSdtHzmpYOjCpFL9a+LWkocuaWzJjN9UIfuBG8
	CP3xkDEUkLu2P1ykzdHvt6dANVwrJZTFJja8T0gn4yJuKamdMrAbfBnhOworI7U6UgfuRaP7o4pSl
	mUiOX0WxjfUg1CppWoVLPz3X8uII92AjKybdiZbEbCoexqUM/OseydVaE6HxpYnsoOBooJXzp5axb
	fAh9xHXw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvQZ-0000000GZTL-3jM1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:37:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48deeadb3fdso249350f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970658; x=1792575458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXoOtdmnob+YnMth1qvSHm903lQEMfykmhDcceAz8kQ=;
        b=pG7KBlanUYt6C/h01w/3jJwFL4XBZZu9tkLn7F22TpD0tRkbiHzPkMRw8ssJ3Tpu82
         AGRlLoiFXtUXes1QIT9tFPyH4ufY9vqbrYmAYIJMhNFG+kWivwLAom/Rj4J2iBQRgWZJ
         bW/QJ08ULkk8zR4pjKFOq2ZgI868JTrhlkpJJMc/2WCo2f3Gn/PCJe9GNtF7UYgzkr47
         yvgfU1UC2BjTuDHDUP1Q/DwpB0DIr8lbLHlG6B2oCfIC5F0z5U+kS8/K78SswVep0UQj
         /UjqZP0zix/NiUX8gSslnd4jcEY7x2nItaM99BeRS0boLG+l9BRKSX808B9UESvPSwl1
         GgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970658; x=1792575458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sXoOtdmnob+YnMth1qvSHm903lQEMfykmhDcceAz8kQ=;
        b=XnSEMOFp5OfZwHcz2piM5akmVnlHcIJaKgmvvWVG12VH9BVXAntIT+GQbyYjbYBcBo
         yOO5HsirgxYLv7px0pLSTsr54lRot/VQbaygsnyTVMYh21EImI64imzoMoah9sBqZun9
         tz/WEiD+U+YlA4vclMpVsDBUaEJHnElU9e0ojDr4ZuRiuS4IcahLs2nVTwNxLQMxlm2x
         zM5y/syp6F00JD7T6Cc8xoytnrUQ0Kb6waWv7AwgWGpafVgehkbrC/g3alssAhjFKbzs
         EFxmxiuOanDpGpCX6PNIEvYLud85NPbjX1y/tUORWoak42zBwSVIBR5G2KGXDDANFUMv
         jwxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzay7KkZtDDYgTpHwxzx9ZWHtlDyt8Jit0881k9MyetAX0pt3JhrJUu2Zpk2L6GADCPsKpZFw1wQxFoqYHrWNjz@lists.infradead.org
X-Gm-Message-State: AFq9FYLS3Ai2vUw1O5jq8R1NbsSDZwbfJzKwyl1wHjacrJbDOkUhwIEg
	/SNtHnahFDKJDpB43qCJCi2uVJcFvOzkzbxcnI+tCrslRKkJL8kyz5D+
X-Gm-Gg: AYBFou1iD91jcUsNPaUhMcf6Ta33HrRpp8G4Tn/JVOE2m7AxtX9lmLqTScZ6tqiXq9c
	ZzVBkDxAnQa5UkApY6TEJe7BNgQ4eDZoepDVmkHgP9+ZfoFRC6U7nFhftfFPqfJAUdh/MOvc85w
	ApCRyefMQk3LuZqpBsjIBcydr6XWjytbXuNYVXQeWCxCIv2sX6JsNL2sQjB3Ql+VTLPbSoSIkoG
	asodFoThGUD9JAE0hD69amxYP4G7o+/qnlkVrSHp8ZXgOqaioT0qMmGw14hSyr+Ti1akZoxfHPs
	Ksaz2mD9OV6TtUXM3ie1CQkTT5xBcqW2/Ezmndi82Fq6Uym+zPELcdMty7qGvOi/QZmkEyuJ6zl
	q+y5mau2+WfLCIChUbhi6/UVImz3TlfiuyFgg8kZL02NwHdyDvq9zMbYPDVSm7MmiWpo4IP6l29
	C+dz+7Y2Mx/Ni7FjeH5H6gKu5Maj1imjtqgK+2z4gEcBKC8e3UElUsYYJYys0ivzVXofGAYxviz
	dKamrLcN81FRvNCetYUj6iv47pMoy9n40RzgbJCgrRqhFdfkJuPz9se/N4zRebcWxnnqdeUhmvf
	TV4DSasdNp/OM6v1cHkMxdtwjre9cQx3AOZYEvJjMY5C1g==
X-Received: by 2002:a5d:4381:0:b0:48c:7d67:8ee9 with SMTP id ffacd0b85a97d-48dbacec815mr21345295f8f.19.1791970658161;
        Wed, 14 Oct 2026 02:37:38 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm9365477f8f.35.2026.10.14.02.37.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:37:37 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 02/11] KVM: guest_memfd: Let get_pfn() report read-only pages
Date: Wed, 14 Oct 2026 09:37:24 +0000
Message-ID: <20261014093733.90312-3-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014093733.90312-1-griffoul@gmail.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_103740_271538_A2A1BCA2 
X-CRM114-Status: GOOD (  29.78  )
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

A guest_memfd backing cannot map a page read-only for the guest:
get_pfn() returns only a frame, and KVM_MEM_READONLY is refused on
guest_memfd slots. So a hypervisor cannot give a guest a page it may
read but not write.

get_pfn() gets a writable output, which it may clear. The x86 and arm64
fault paths then map the page without write permission, and a guest
write exits with KVM_EXIT_MEMORY_FAULT. A read-only answer applies to
the whole block that max_order allows.

Callers that hand the page to something that writes it must refuse a
read-only page: the arm64 VNCR page and the SEV-SNP VMSA. populate() has
no writable output, so a backing cannot report read-only state through
it. The output does not cover KVM's own writes through the slot's host
address.

The memory provider backing, later in this series, is the first user.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 arch/arm64/kvm/mmu.c     | 13 ++++++++-----
 arch/arm64/kvm/nested.c  | 16 ++++++++++++----
 arch/x86/kvm/mmu/mmu.c   | 18 ++++++++++++++++--
 arch/x86/kvm/svm/sev.c   | 13 +++++++++++--
 include/linux/kvm_host.h | 16 +++++++++++++---
 virt/kvm/guest_memfd.c   | 21 ++++++++++++++++-----
 6 files changed, 76 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..32e591edc69d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1607,7 +1607,7 @@ struct kvm_s2_fault_desc {
 
 static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
-	bool write_fault, exec_fault;
+	bool write_fault, exec_fault, writable;
 	bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
 	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_SHARED;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
@@ -1641,14 +1641,17 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
 	/* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
 	smp_rmb();
 
-	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL);
-	if (ret) {
+	ret = kvm_gmem_get_pfn(kvm, s2fd->memslot, gfn, &pfn, &page, NULL,
+			       &writable);
+	if (ret || (write_fault && !writable)) {
 		kvm_prepare_memory_fault_exit(s2fd->vcpu, s2fd->fault_ipa, PAGE_SIZE,
 					      write_fault, exec_fault, false);
-		return ret;
+		if (!ret)
+			kvm_release_faultin_page(kvm, page, true, false);
+		return ret ?: -EFAULT;
 	}
 
-	if (!(s2fd->memslot->flags & KVM_MEM_READONLY))
+	if (!(s2fd->memslot->flags & KVM_MEM_READONLY) && writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
 	if (s2fd->nested)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index fb54f6dad995..fa86705df949 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1411,11 +1411,19 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
 			return -EFAULT;
 	} else {
-		ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL);
-		if (ret) {
+		ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL,
+				       &writable);
+		/*
+		 * The VNCR page is always written, so a read-only page cannot
+		 * back it.  Exit on the first access, even a read, rather than
+		 * map it read-only and fault on the next write.
+		 */
+		if (ret || !writable) {
 			kvm_prepare_memory_fault_exit(vcpu, vt->wr.pa, PAGE_SIZE,
-					      write_fault, false, false);
-			return ret;
+					      true, false, false);
+			if (!ret)
+				kvm_release_faultin_page(vcpu->kvm, page, true, false);
+			return ret ?: -EFAULT;
 		}
 	}
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 234d0a95abf5..f689ef5c2b46 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4612,6 +4612,7 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
 				    struct kvm_page_fault *fault)
 {
+	bool writable;
 	int max_order, r;
 
 	if (!kvm_slot_has_gmem(fault->slot)) {
@@ -4620,13 +4621,26 @@ static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
 	}
 
 	r = kvm_gmem_get_pfn(vcpu->kvm, fault->slot, fault->gfn, &fault->pfn,
-			     &fault->refcounted_page, &max_order);
+			     &fault->refcounted_page, &max_order, &writable);
 	if (r) {
 		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
 		return r;
 	}
 
-	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY);
+	/*
+	 * get_pfn() may clear writable, on top of the memslot's read-only flag:
+	 * a read-only page is mapped read-only, and a guest write to it exits to
+	 * userspace rather than being installed.
+	 */
+	fault->map_writable = !(fault->slot->flags & KVM_MEM_READONLY) &&
+			      writable;
+	if (fault->write && !fault->map_writable) {
+		kvm_mmu_prepare_memory_fault_exit(vcpu, fault);
+		kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
+				 true, false);
+		fault->refcounted_page = NULL;
+		return -EFAULT;
+	}
 	fault->max_level = kvm_max_level_for_order(max_order);
 
 	return RET_PF_CONTINUE;
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 427229347876..e121441bc89c 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3988,6 +3988,7 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 	struct vcpu_svm *svm = to_svm(vcpu);
 	struct kvm_memory_slot *slot;
 	struct page *page;
+	bool writable;
 	kvm_pfn_t pfn;
 	gfn_t gfn;
 
@@ -4025,9 +4026,17 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 	 * The new VMSA will be private memory guest memory, so retrieve the
 	 * PFN from the gmem backend.
 	 */
-	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
+	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL,
+			     &writable))
 		return;
 
+	/* The CPU writes the VMSA on every VMRUN: a read-only page cannot be one. */
+	if (!writable) {
+		if (page)
+			kvm_release_page_clean(page);
+		return;
+	}
+
 	/*
 	 * From this point forward, the VMSA will always be a guest-mapped page
 	 * rather than the initial one allocated by KVM in svm->sev_es.vmsa. In
@@ -4958,7 +4967,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code)
 		return;
 	}
 
-	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order);
+	ret = kvm_gmem_get_pfn(kvm, slot, gfn, &pfn, &page, &order, NULL);
 	if (ret) {
 		pr_warn_ratelimited("SEV: Unexpected RMP fault, no backing page for private GPA 0x%llx\n",
 				    gpa);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b33d2f475042..a15abd0f7fb7 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -649,6 +649,15 @@ static inline bool kvm_slot_has_gmem(const struct kvm_memory_slot *slot)
  *    is responsible for put_page() after use.  If *page is left NULL the PFN
  *    is treated as non-refcounted, and its lifetime is owned by the
  *    implementation across bind()/unbind().
+ *  - *writable, when the caller passes it, is true on entry.  Clear it to
+ *    have KVM map the page read-only; a guest write then exits as a memory
+ *    fault.  It covers the whole block that *max_order allows, so that block
+ *    must be all writable or all read-only.  It applies to stage-2 mappings
+ *    only, not to KVM's own writes through the memslot's host address.  A
+ *    caller that hands the page to hardware that writes it passes @writable
+ *    and refuses a read-only page.  Only a caller that never writes the page
+ *    itself passes NULL.  populate() has no writable result, so KVM cannot
+ *    learn read-only state through it; it is used only to fill a page.
  *
  * Memory intended to back guest RAM MUST be reported as E820_TYPE_RAM by the
  * host so KVM maps it write-back (and applies the memory-encryption bit on
@@ -662,7 +671,8 @@ struct kvm_gmem_ops {
 		       struct kvm_memory_slot *slot);
 	int (*get_pfn)(struct file *file, struct kvm *kvm,
 		       struct kvm_memory_slot *slot, gfn_t gfn,
-		       kvm_pfn_t *pfn, struct page **page, int *max_order);
+		       kvm_pfn_t *pfn, struct page **page, int *max_order,
+		       bool *writable);
 	int (*populate)(struct file *file, struct kvm *kvm,
 			struct kvm_memory_slot *slot, gfn_t gfn,
 			kvm_pfn_t *pfn, struct page *src_page, int order);
@@ -2642,12 +2652,12 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 #ifdef CONFIG_KVM_GUEST_MEMFD
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
-		     int *max_order);
+		     int *max_order, bool *writable);
 #else
 static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
 				   kvm_pfn_t *pfn, struct page **page,
-				   int *max_order)
+				   int *max_order, bool *writable)
 {
 	KVM_BUG_ON(1, kvm);
 	return -EIO;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 057f90eb835a..c9595cc9d56e 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -624,7 +624,7 @@ static void kvm_gmem_native_unbind(struct file *slot_file, struct kvm *kvm,
 static int  kvm_gmem_native_get_pfn(struct file *file, struct kvm *kvm,
 				    struct kvm_memory_slot *slot, gfn_t gfn,
 				    kvm_pfn_t *pfn, struct page **page,
-				    int *max_order);
+				    int *max_order, bool *writable);
 static void kvm_gmem_native_release(struct file *file);
 static int  kvm_gmem_native_mmap(struct file *file,
 				 struct vm_area_struct *vma);
@@ -936,7 +936,7 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
 static int kvm_gmem_native_get_pfn(struct file *file, struct kvm *kvm,
 				   struct kvm_memory_slot *slot, gfn_t gfn,
 				   kvm_pfn_t *pfn, struct page **page,
-				   int *max_order)
+				   int *max_order, bool *writable)
 {
 	pgoff_t index = kvm_gmem_get_index(slot, gfn);
 	struct folio *folio;
@@ -964,7 +964,7 @@ static int kvm_gmem_native_get_pfn(struct file *file, struct kvm *kvm,
 
 int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		     gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
-		     int *max_order)
+		     int *max_order, bool *writable)
 {
 	const struct kvm_gmem_ops *ops;
 
@@ -977,7 +977,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		return -EFAULT;
 
 	*page = NULL;
-	return ops->get_pfn(file, kvm, slot, gfn, pfn, page, max_order);
+	if (writable)
+		*writable = true;
+	return ops->get_pfn(file, kvm, slot, gfn, pfn, page, max_order,
+			    writable);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
 
@@ -1028,6 +1031,7 @@ static int kvm_gmem_populate_one(const struct kvm_gmem_ops *ops,
 				      void *opaque)
 {
 	struct page *ignored_page = NULL;
+	bool writable = true;
 	kvm_pfn_t pfn;
 	int ret;
 
@@ -1041,10 +1045,17 @@ static int kvm_gmem_populate_one(const struct kvm_gmem_ops *ops,
 				    src_page, 0);
 	else
 		ret = ops->get_pfn(file, kvm, slot, gfn, &pfn,
-				   &ignored_page, NULL);
+				   &ignored_page, NULL, &writable);
 	if (ret)
 		return ret;
 
+	/* post_populate() writes the page, so it cannot be read-only. */
+	if (!writable) {
+		if (ignored_page)
+			put_page(ignored_page);
+		return -EPERM;
+	}
+
 	ret = post_populate(kvm, gfn, pfn, src_page, opaque);
 
 	/*
-- 
2.47.3


