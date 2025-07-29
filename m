Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6936C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZ7UUMMTQmKo+oqwpxvtUgE6azYjzXKI1K1HySZjpRM=; b=Hky9m955WxRmJVmNiWl+OE54PH
	CgPbr1wKuNHo395IJi23SXf13mpgjQaw5XIWHx5bM9oqtLR09/0tiQQ6Zz9QEGIpmwlT4ZNfP78sK
	vUM5fA15Jaglk0UdRZE2NRXZK2AFSbap2Oe/lk5wsPi49f+CYyrV3udlP4EBPF8JDWXggRHtsUxaX
	bUQ+ThpkrjV3Rbg4kuq0cW/lj/DTnOZk+n8pmkN0qTtjtzISw1YDBSilQvREYLkzgxdZTlUhXEu8C
	ApUkqOcJAR/ZiR2HHirrwXIIyw5NIJljfk7tmMvnFxmp60x0YPkmGta9eSN0+XHjHR1td5TAwzm0a
	6EZBl3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtt4-00000000JQi-1f7M;
	Tue, 29 Jul 2025 23:37:38 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEk-00000000DsQ-2OXj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:00 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31f2dd307d4so1474361a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829758; x=1754434558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ7UUMMTQmKo+oqwpxvtUgE6azYjzXKI1K1HySZjpRM=;
        b=mmL15cXQSJZ5DWQMapT1R5F+1TWgPi/JWd6NhctTudzuaBgIaD3b8vM2RNj/DSD99M
         EwZ7gDfvuY/AaEU/8RwD+0sg5fGJLRFoLD6TazYIBba/gtiy9GlYH5sCWlmBB8ovzhKn
         T2BRxFVmoKYSw9bX2JwgnMSV+8wNyCey90LUNukbk0OqE8ObzT5BQEEQSnfj60j7xHET
         bSuJxqskU6At8haCu8nWGoIKpcq22A/+Le2EhNOd9Sm7JaXwxKR6jWYAcoTbvAVNGkos
         QT8usjRFEy1KCzfPdKHR72n3zIGfDpNR3EKPZTSQkYQa3X1psDTUmS5r4Vg1SmhOstNP
         1GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829758; x=1754434558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZ7UUMMTQmKo+oqwpxvtUgE6azYjzXKI1K1HySZjpRM=;
        b=wptsCHYe/9hxW8BFYAWJD9HJw2QN2szdLm6IrjT/OLJp+AuPaU76ipw1nUbecU2xiD
         pEppzzV0o6d/YCW91Hqz6HZzgkLe25qJR9iv/nFz955uRjI87EVCMLCHqfAKQSMog8/N
         0iv3vZFIt5wZa6sl8j/OFht1JOw294FthOxZQ1IJAS1/yFsHuG1e3hjLj/AeOIAOO67x
         DaeWTBluzma3KKoSaVpEhcMnG1nZCCAb//6U1kxDoDFmlQzGPlgGeYpUCfs9YPfGWnzB
         uaHTCi2Ag5DdKnMqkyiFoUkQc6mwMIbIZV1uIuA+imGyqsy/gLaG/4Wamqvv0s1h/lmu
         LC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd+KvUuBxA4RKpvL18YrFXMhI49nz/00taOOpzQ+84J4qeGbWALGb17i3PaYHmj3wZnFe11wJpPqtNMJDfwFHY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6HbcYsdrpKvgVxCmPf9e6rlvwRLLmIukUMD3fZ8vdqlkw7+MI
	fiNo6MV+oY2/xNbP8nmiCLUbUVAEI54RZwOD4tLt6tl4nkwenwRzXY+RfHLQaHBal2ODA8Jjpgg
	XqreEsQ==
X-Google-Smtp-Source: AGHT+IEi0LT633cR43d7c7trYUUKKhZMYkJ3vVlxY+rv8i3UqXQjtgYGy8SCvBIGqavUrw75WQrf6XchBFs=
X-Received: from pjsh5.prod.google.com ([2002:a17:90a:2ec5:b0:31f:b06:318d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c4:b0:31f:4272:c30a
 with SMTP id 98e67ed59e1d1-31f5de93957mr1400693a91.30.1753829757434; Tue, 29
 Jul 2025 15:55:57 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:46 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-16-seanjc@google.com>
Subject: [PATCH v17 15/24] KVM: x86/mmu: Extend guest_memfd's max mapping
 level to shared mappings
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
X-CRM114-CacheID: sfid-20250729_155558_615214_C12F0A39 
X-CRM114-Status: GOOD (  17.11  )
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

Rework kvm_mmu_max_mapping_level() to consult guest_memfd for all mappings,
not just private mappings, so that hugepage support plays nice with the
upcoming support for backing non-private memory with guest_memfd.

In addition to getting the max order from guest_memfd for gmem-only
memslots, update TDX's hook to effectively ignore shared mappings, as TDX's
restrictions on page size only apply to Secure EPT mappings.  Do nothing
for SNP, as RMP restrictions apply to both private and shared memory.

Suggested-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/mmu/mmu.c          | 12 +++++++-----
 arch/x86/kvm/svm/sev.c          |  2 +-
 arch/x86/kvm/svm/svm.h          |  4 ++--
 arch/x86/kvm/vmx/main.c         |  5 +++--
 arch/x86/kvm/vmx/tdx.c          |  5 ++++-
 arch/x86/kvm/vmx/x86_ops.h      |  2 +-
 7 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c0a739bf3829..c56cc54d682a 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1922,7 +1922,7 @@ struct kvm_x86_ops {
 	void *(*alloc_apic_backing_page)(struct kvm_vcpu *vcpu);
 	int (*gmem_prepare)(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
 	void (*gmem_invalidate)(kvm_pfn_t start, kvm_pfn_t end);
-	int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn);
+	int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 61eb9f723675..e83d666f32ad 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3302,8 +3302,9 @@ static u8 kvm_max_level_for_order(int order)
 	return PG_LEVEL_4K;
 }
 
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
-					const struct kvm_memory_slot *slot, gfn_t gfn)
+static u8 kvm_gmem_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
+				     const struct kvm_memory_slot *slot, gfn_t gfn,
+				     bool is_private)
 {
 	u8 max_level, coco_level;
 	kvm_pfn_t pfn;
@@ -3327,7 +3328,7 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, struct kvm_page_fault *
 	 * restrictions.  A return of '0' means "no additional restrictions", to
 	 * allow for using an optional "ret0" static call.
 	 */
-	coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
+	coco_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn, is_private);
 	if (coco_level)
 		max_level = min(max_level, coco_level);
 
@@ -3361,8 +3362,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
-	if (is_private)
-		host_level = kvm_max_private_mapping_level(kvm, fault, slot, gfn);
+	if (is_private || kvm_memslot_is_gmem_only(slot))
+		host_level = kvm_gmem_max_mapping_level(kvm, fault, slot, gfn,
+							is_private);
 	else
 		host_level = host_pfn_mapping_level(kvm, gfn, slot);
 	return min(host_level, max_level);
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index be1c80d79331..807d4b70327a 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4947,7 +4947,7 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 	}
 }
 
-int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
 {
 	int level, rc;
 	bool assigned;
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index d84a83ae18a1..70df7c6413cf 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -866,7 +866,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code);
 void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu);
 int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
 void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end);
-int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
+int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
 struct vmcb_save_area *sev_decrypt_vmsa(struct kvm_vcpu *vcpu);
 void sev_free_decrypted_vmsa(struct kvm_vcpu *vcpu, struct vmcb_save_area *vmsa);
 #else
@@ -895,7 +895,7 @@ static inline int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, in
 	return 0;
 }
 static inline void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end) {}
-static inline int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+static inline int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
 {
 	return 0;
 }
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index dd7687ef7e2d..bb5f182f6788 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -831,10 +831,11 @@ static int vt_vcpu_mem_enc_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	return tdx_vcpu_ioctl(vcpu, argp);
 }
 
-static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
+				     bool is_private)
 {
 	if (is_td(kvm))
-		return tdx_gmem_max_mapping_level(kvm, pfn);
+		return tdx_gmem_max_mapping_level(kvm, pfn, is_private);
 
 	return 0;
 }
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b444714e8e8a..ca9c8ec7dd01 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3318,8 +3318,11 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	return ret;
 }
 
-int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private)
 {
+	if (!is_private)
+		return 0;
+
 	return PG_LEVEL_4K;
 }
 
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 6037d1708485..4c70f56c57c8 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -153,7 +153,7 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp);
 void tdx_flush_tlb_current(struct kvm_vcpu *vcpu);
 void tdx_flush_tlb_all(struct kvm_vcpu *vcpu);
 void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level);
-int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
+int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
 #endif
 
 #endif /* __KVM_X86_VMX_X86_OPS_H */
-- 
2.50.1.552.g942d659e1b-goog


