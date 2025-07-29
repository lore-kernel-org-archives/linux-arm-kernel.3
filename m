Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B461C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTad4J8Qg1Nlv10PcvZ871whY+Aaj9TjlMyj9Irid8k=; b=JxgbTEg6uuwktbKiTRo/kz1Z6u
	eLWz+jBsngFmJOAGQCwH65FwgUL+A/9ifQhPIj2lmP/6u0awpO75QdrFcMCeYk0+yHUINhv9/s6Fv
	7NLkYF9jkMLamcnpQ7aetQgGBqUDV1jJcN2fYemPX7E8E/OhY/XdiIa8hXpKCso/rvH0L8Lq2D2Q0
	cNpiZYF1Td05oFzxVBxXfjlgR6TCKHynDqzkFendSJAsNGA9PZmvC+6bJYVa+c4xPktDvUy689onb
	nUrCqGcPAc9xipvCCeJ34rT/ZfkPi5KhHDk35qIM+FBv9+OfzRtu5ELyygaorMKhjBz1I90GemEJ8
	nwF9xP1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtll-00000000Iff-4C7I;
	Tue, 29 Jul 2025 23:30:06 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEf-00000000Dpj-1JJt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-23638e1605dso48051985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829752; x=1754434552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jTad4J8Qg1Nlv10PcvZ871whY+Aaj9TjlMyj9Irid8k=;
        b=NpAA7oeJUOb71HnAQLczWJjBoK1hPHgDoxK9wPdE71x7haAW9seEDhZwrZIB0/MqBt
         lD9Mos75ivCXBq7WlV1G3kwWbhITjPIEkxOLdEIu0LsoJ3/0Oxh7VJvxON3qH5xvvJmJ
         UcyhOCW+pgDeSisxD9mRkhMWuziwi0telFEzluXH/6Wvny+7BBcqWNw7oE0QmT6zasaE
         1cdHtDvoG/CwK1x9eTLSxthlFOXY+UA0iRtIUO/yvjfKExdw+cjMuQNCky9H8vtKWA/2
         SHafiL16G6SUDXO+NNZOy7fpSRxfd08OwlTFsum6ytzA+aZu5DgRtU0MbhyDcpBCMY6r
         rTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829752; x=1754434552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTad4J8Qg1Nlv10PcvZ871whY+Aaj9TjlMyj9Irid8k=;
        b=rKd/woWHW1044HEIfOgQ2OB3+4/EeWMa204hwxRDeEUu4PdRr3725awHycrpJgsuaZ
         9JKQdTZxZ0VpY90UqnVLcGHb2voh5BRJr2kG19xs/sp6O5Gt9C14hNqDRSVPrhBe911S
         KuHvLsKcNIJjM09O+vePU70omAaf2QSm1Yr7P24adEI9lqvW0XkDQbbSAkNg19zHJhK+
         tkU9QQMYFF28b0F0eOzsm1hqt0CoICnR2hu0Gquf7Pjso7O//iV1I7Huc88Fdy1gEXxM
         2aSSMSalRcU7EIBm6G6Qpiay98tma9IqwM+UTygV6S+0Gyjfi/T2Qski/Re+H6tdkVDA
         SE0A==
X-Forwarded-Encrypted: i=1; AJvYcCX6A0h47DSd4s2KsJqbHXHUCDhY3XbUgj4/Iunv+t9yJeq8OG3Bh54YR63uGNSBNpyfgZBeVNMrrq21TbmF8Kwv@lists.infradead.org
X-Gm-Message-State: AOJu0YyBUjive8MY5NCCIKggxthAXKabcV1kuXNudZa3uXXMsH/AGrKl
	sTjgrOFF9QO8h5ClV3tAqTNIQsGhM6OBx1BKI3QCtj/WR1bOOdOZiTdF3lxm22wskIQUeB4SnNG
	2NHb1cA==
X-Google-Smtp-Source: AGHT+IE+WmeXckPv5tF/SBSQrHY4ZKYybHI52HgzkPQNumcR9r+UIJ3cQitNOL7pJonSsZZzG7kXKsvAgds=
X-Received: from plblc3.prod.google.com ([2002:a17:902:fa83:b0:240:3906:c827])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d547:b0:234:8e78:ce8a
 with SMTP id d9443c01a7336-24096bfd5e2mr13095805ad.48.1753829752170; Tue, 29
 Jul 2025 15:55:52 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:43 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-13-seanjc@google.com>
Subject: [PATCH v17 12/24] KVM: x86/mmu: Rename .private_max_mapping_level()
 to .gmem_max_mapping_level()
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
X-CRM114-CacheID: sfid-20250729_155553_362999_FFC89C66 
X-CRM114-Status: GOOD (  14.44  )
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

From: Ackerley Tng <ackerleytng@google.com>

Rename kvm_x86_ops.private_max_mapping_level() to .gmem_max_mapping_level()
in anticipation of extending guest_memfd support to non-private memory.

No functional change intended.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h | 2 +-
 arch/x86/include/asm/kvm_host.h    | 2 +-
 arch/x86/kvm/mmu/mmu.c             | 2 +-
 arch/x86/kvm/svm/sev.c             | 2 +-
 arch/x86/kvm/svm/svm.c             | 2 +-
 arch/x86/kvm/svm/svm.h             | 4 ++--
 arch/x86/kvm/vmx/main.c            | 6 +++---
 arch/x86/kvm/vmx/tdx.c             | 2 +-
 arch/x86/kvm/vmx/x86_ops.h         | 2 +-
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 18a5c3119e1a..62c3e4de3303 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -145,7 +145,7 @@ KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
 KVM_X86_OP_OPTIONAL(get_untagged_addr)
 KVM_X86_OP_OPTIONAL(alloc_apic_backing_page)
 KVM_X86_OP_OPTIONAL_RET0(gmem_prepare)
-KVM_X86_OP_OPTIONAL_RET0(private_max_mapping_level)
+KVM_X86_OP_OPTIONAL_RET0(gmem_max_mapping_level)
 KVM_X86_OP_OPTIONAL(gmem_invalidate)
 
 #undef KVM_X86_OP
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 50366a1ca192..c0a739bf3829 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1922,7 +1922,7 @@ struct kvm_x86_ops {
 	void *(*alloc_apic_backing_page)(struct kvm_vcpu *vcpu);
 	int (*gmem_prepare)(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
 	void (*gmem_invalidate)(kvm_pfn_t start, kvm_pfn_t end);
-	int (*private_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn);
+	int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index fdc2824755ee..b735611e8fcd 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4532,7 +4532,7 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	if (max_level == PG_LEVEL_4K)
 		return PG_LEVEL_4K;
 
-	req_max_level = kvm_x86_call(private_max_mapping_level)(kvm, pfn);
+	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
 	if (req_max_level)
 		max_level = min(max_level, req_max_level);
 
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 7744c210f947..be1c80d79331 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4947,7 +4947,7 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
 	}
 }
 
-int sev_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
 {
 	int level, rc;
 	bool assigned;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d9931c6c4bc6..8a66e2e985a4 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5180,7 +5180,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.gmem_prepare = sev_gmem_prepare,
 	.gmem_invalidate = sev_gmem_invalidate,
-	.private_max_mapping_level = sev_private_max_mapping_level,
+	.gmem_max_mapping_level = sev_gmem_max_mapping_level,
 };
 
 /*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 58b9d168e0c8..d84a83ae18a1 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -866,7 +866,7 @@ void sev_handle_rmp_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code);
 void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu);
 int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
 void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end);
-int sev_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
+int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
 struct vmcb_save_area *sev_decrypt_vmsa(struct kvm_vcpu *vcpu);
 void sev_free_decrypted_vmsa(struct kvm_vcpu *vcpu, struct vmcb_save_area *vmsa);
 #else
@@ -895,7 +895,7 @@ static inline int sev_gmem_prepare(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, in
 	return 0;
 }
 static inline void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end) {}
-static inline int sev_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+static inline int sev_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
 {
 	return 0;
 }
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index dbab1c15b0cd..dd7687ef7e2d 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -831,10 +831,10 @@ static int vt_vcpu_mem_enc_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	return tdx_vcpu_ioctl(vcpu, argp);
 }
 
-static int vt_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+static int vt_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
 {
 	if (is_td(kvm))
-		return tdx_gmem_private_max_mapping_level(kvm, pfn);
+		return tdx_gmem_max_mapping_level(kvm, pfn);
 
 	return 0;
 }
@@ -1005,7 +1005,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.mem_enc_ioctl = vt_op_tdx_only(mem_enc_ioctl),
 	.vcpu_mem_enc_ioctl = vt_op_tdx_only(vcpu_mem_enc_ioctl),
 
-	.private_max_mapping_level = vt_op_tdx_only(gmem_private_max_mapping_level)
+	.gmem_max_mapping_level = vt_op_tdx_only(gmem_max_mapping_level)
 };
 
 struct kvm_x86_init_ops vt_init_ops __initdata = {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 66744f5768c8..b444714e8e8a 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3318,7 +3318,7 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp)
 	return ret;
 }
 
-int tdx_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
+int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
 {
 	return PG_LEVEL_4K;
 }
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 2b3424f638db..6037d1708485 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -153,7 +153,7 @@ int tdx_vcpu_ioctl(struct kvm_vcpu *vcpu, void __user *argp);
 void tdx_flush_tlb_current(struct kvm_vcpu *vcpu);
 void tdx_flush_tlb_all(struct kvm_vcpu *vcpu);
 void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int root_level);
-int tdx_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
+int tdx_gmem_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn);
 #endif
 
 #endif /* __KVM_X86_VMX_X86_OPS_H */
-- 
2.50.1.552.g942d659e1b-goog


