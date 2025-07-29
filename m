Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13ADC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SSy7htSrqmTnWDs8KQ8CPqcAnDaIUsFMxYImLgL19Q=; b=Y3/St8QTG2vAWxrqjxdnTXs7cf
	LqiFkMSUpbNCSjDPR5h1eciT7Xi3JIwuPg+8LYzT6122HmMeC3BbH+1CzgFDp+RIdBslr8cf3aF4d
	qwbeLNIFst2evoD3yDs3xec171Th+rF5+3G1k6cyWRE9Csw+KARZSKS6Wz42BBNnKyGHL9yczYcha
	mVdReccyQx/YW+nZbHrsYojeCbZH4Qp2iePsBy2cCqAHybCOqsoYPo65NYxKm1PmdXnNFh/3X8m8i
	WJBuFr+ih7zNAfFteEneUWijQplELETX1M22CpUuccXIvbfsrpKAGGlZ958DpmjdL8VpmkmLuJgaJ
	LM0cQ6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugu2n-00000000KVe-2Lfj;
	Tue, 29 Jul 2025 23:47:41 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEr-00000000Dv5-0nRq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:06 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2403e4c82ddso18255605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829764; x=1754434564; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2SSy7htSrqmTnWDs8KQ8CPqcAnDaIUsFMxYImLgL19Q=;
        b=GXpQoHU39d+CPylpAHHEpnZEVhGUGH4wYlRMyUVNHsMs2lC8qim3Rh6igHOq8eb6CT
         PTL3PWgoNTWC70klO4YKMgD9ES2h+f28wzTDvMvhxLQmD+6/fhQS0//C3vmwPKndTcp/
         npoRvGMW9LHxZLhcPlb7OZE3DQIEyN4i2kWT+shSmaXcp29L8/eZggUqXafKMvypNaGn
         sWmnL+NMIaMI1iU9Yvy1CSH2nmbOmwTzplS7M/nJ6bfEsar7goHPtfCmi3yE653Vn7hk
         uGXXuLqyPlOod6IzKRR5bWdgr5RvJtkWvtTpk0iTg/UYGNU0SDNAWqddBV1eyRu8/m5C
         pp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829764; x=1754434564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SSy7htSrqmTnWDs8KQ8CPqcAnDaIUsFMxYImLgL19Q=;
        b=OS7uW4FibEYC4FAHzqrO4k12JmQj7uKQBc751VcylpLCol4u6waVI4Wo4qBUoNmUSv
         2q8gX43gO1bwR27p2OE6NMFYyKi5ujAExKObAc+dVnk2QF//lr4XWqdeWum0q/TnHg8F
         7B0Cc00azVfkyImdTgdYVL5rsEXQ1Rk++buAq8zo2oyYKxiIQuTycyXx+6lmyShUGI6m
         Z10BaAvVDIADiZ8+jv5UKQ9ad9Mef3l14ETrDREpJNje80QlMcgbsGc2IdDOkhm7HnvE
         CAeBJSUGsLaEIY5MW0M778UszEYC3yntqx4d0LMGmpJFDtwswOwh+aj6vFjvUJhs1hHj
         pE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfoYNudxUF7rJ5puqJ+SZ93JQD4Zn0/Qi0WBgwdicv6IPOqgI8+yHbohV1yy66KOPnqoTU7f+ilofErrblr7fU@lists.infradead.org
X-Gm-Message-State: AOJu0YxAocbnyWySP9RDDcgmQ5klOzsbxInKnf3K2KyN9QXgAKU3Pu2P
	+xk4HyQXDgtOxo+OQKNfaSICJWEm/kCchEO3x2tpuNYxLS/uJQrdODmTTtgjlBeit1tjFRy1GZh
	RSVnBXw==
X-Google-Smtp-Source: AGHT+IHj/510Mv9kPU5X6CNDct4tYO3yblGBJUqMpY3W6X6yaMqYIgXW779LIryKFKVtTEcES1VIMsFWj3M=
X-Received: from pjbsh18.prod.google.com ([2002:a17:90b:5252:b0:31e:cee1:4d04])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e541:b0:240:7c39:9e4e
 with SMTP id d9443c01a7336-24096b56cd4mr15158665ad.44.1753829764046; Tue, 29
 Jul 2025 15:56:04 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:50 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-20-seanjc@google.com>
Subject: [PATCH v17 19/24] KVM: arm64: nv: Handle VNCR_EL2-triggered faults
 backed by guest_memfd
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155605_228964_1B2A0E00 
X-CRM114-Status: GOOD (  15.44  )
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

From: Fuad Tabba <tabba@google.com>

Handle faults for memslots backed by guest_memfd in arm64 nested
virtualization triggered by VNCR_EL2.

* Introduce is_gmem output parameter to kvm_translate_vncr(), indicating
  whether the faulted memory slot is backed by guest_memfd.

* Dispatch faults backed by guest_memfd to kvm_gmem_get_pfn().

* Update kvm_handle_vncr_abort() to handle potential guest_memfd errors.
  Some of the guest_memfd errors need to be handled by userspace instead
  of attempting to (implicitly) retry by returning to the guest.

Suggested-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/nested.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dc1d26559bfa..b3edd7f7c8cd 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1172,8 +1172,9 @@ static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
 	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
 }
 
-static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
+static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 {
+	struct kvm_memory_slot *memslot;
 	bool write_fault, writable;
 	unsigned long mmu_seq;
 	struct vncr_tlb *vt;
@@ -1216,10 +1217,25 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
 	smp_rmb();
 
 	gfn = vt->wr.pa >> PAGE_SHIFT;
-	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writable, &page);
-	if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
+	memslot = gfn_to_memslot(vcpu->kvm, gfn);
+	if (!memslot)
 		return -EFAULT;
 
+	*is_gmem = kvm_slot_has_gmem(memslot);
+	if (!*is_gmem) {
+		pfn = __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
+					&writable, &page);
+		if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
+			return -EFAULT;
+	} else {
+		ret = kvm_gmem_get_pfn(vcpu->kvm, memslot, gfn, &pfn, &page, NULL);
+		if (ret) {
+			kvm_prepare_memory_fault_exit(vcpu, vt->wr.pa, PAGE_SIZE,
+					      write_fault, false, false);
+			return ret;
+		}
+	}
+
 	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
 		if (mmu_invalidate_retry(vcpu->kvm, mmu_seq))
 			return -EAGAIN;
@@ -1292,23 +1308,36 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 	if (esr_fsc_is_permission_fault(esr)) {
 		inject_vncr_perm(vcpu);
 	} else if (esr_fsc_is_translation_fault(esr)) {
-		bool valid;
+		bool valid, is_gmem = false;
 		int ret;
 
 		scoped_guard(read_lock, &vcpu->kvm->mmu_lock)
 			valid = kvm_vncr_tlb_lookup(vcpu);
 
 		if (!valid)
-			ret = kvm_translate_vncr(vcpu);
+			ret = kvm_translate_vncr(vcpu, &is_gmem);
 		else
 			ret = -EPERM;
 
 		switch (ret) {
 		case -EAGAIN:
-		case -ENOMEM:
 			/* Let's try again... */
 			break;
+		case -ENOMEM:
+			/*
+			 * For guest_memfd, this indicates that it failed to
+			 * create a folio to back the memory. Inform userspace.
+			 */
+			if (is_gmem)
+				return 0;
+			/* Otherwise, let's try again... */
+			break;
 		case -EFAULT:
+		case -EIO:
+		case -EHWPOISON:
+			if (is_gmem)
+				return 0;
+			fallthrough;
 		case -EINVAL:
 		case -ENOENT:
 		case -EACCES:
-- 
2.50.1.552.g942d659e1b-goog


