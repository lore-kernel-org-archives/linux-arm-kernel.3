Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDC7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 00:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=; b=ADpYQCmWw6oEtDsjuMb4XIG4Pt
	LACLszo8eIdJjtheNrxrTzmW0ad4N44mvmWpVN5Jb1NwcFF/fl4a7MbaEIe8aDQHrqTTHrw+8qsg9
	CI7XXq0kuHJ+NoZHo863A9JFfkaO9BjFObgQZrjiEJ9Bw8P1/yXseQ0teIJdbd7PU8i31wsDkuj+T
	+H+IkLbMALPiqfbOE4RSuWUAFOmzvkhsxMk5XTLIwitF0DKa0oAkJmZ2ylTB5S04MXWZvIr5gIKT/
	dn3k+ujVcDUHZNjqBmyy5v8FlyMqJ71St613t55YSI41wQa9vmFdEN4q1A3TIj4ljCw27CN9BizTi
	Iua548fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiUm-0000000FabJ-08ri;
	Tue, 25 Feb 2025 00:08:20 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIo-0000000FY2e-2411
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc404aaed5so16606710a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 15:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441357; x=1741046157; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
        b=Yy10rKFa/lH3k3losNjKOnBCxwJyn0jOvdyl9CDSTBwqyfDBh+iNMZcuwISp4tX8/B
         jji1yMl//Y8LZvN749rzhnS482GMtDtT+Dw46/nSjRgEsaaQjgaOSfPo00iMwbXY+i6M
         k2RJmFwyqr8/vf6MKZz2beMI1dmj2MFZeqVgt8TTxrdAQ6EnLZRLjrQJaFxfOtUQOrBh
         AJGEFAEYQXzoTVlaViMUHBELOOKWLZvNUQ3bjhgH2+NdGjHYQiWSyzCT/AvlPE7Y2HjB
         MLXso27ns115tmsIn6414qRye+0ZTj8rdbDu39t88ZToKB/Idu3epfsmx+VMq/812MfK
         1zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441357; x=1741046157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N18ZDDRfnjFxKJiD7qnA09wciuUkX/DOLJoxqyHk2n8=;
        b=YaldFiJBHkNF7nr+v5EIWWRtIwX72HJJ9GuUaZdogjzRWpmPiZ7MXtsD+EYbnw6cGh
         cNblK+P6jXFVt3WBzPoUZKLLIAoJb8pB/P86wWajFKVXZ9LhwRjqjUYUIQVWmhrm+7M/
         72D0GvJZwuF9G0nkw+EOA6hr4vkQHI9LwPNCD0nTbTG2FpjjdWwQsDrCFsB6L/I1x9ur
         0Xl9k52jv9xROfGgdM1NfiAsDIl2RbGtv7Ak8rHF4qu4gLZfdlSYiXasGmdvJ//dz6tn
         wZII7wRaOCT2OuqL0/q83YYKQg5uiie0K7TDLCbzok6/OhsRZhXD+8WiVhSl2m/n5nQj
         6qzg==
X-Gm-Message-State: AOJu0YwyUCSh6XpiE+378TCIfoRZ1mg2G6ySMhEHHaaG6uo/5dthZ63z
	pVPCdB1FLzsT8ykBVxthkQn7NA7t/qxb4O6VBFr6tt5TP6vg1a8GSE2bSJ8FrPIpThEbWTVsCod
	gkg==
X-Google-Smtp-Source: AGHT+IFBRvTh2AoRMsZzInrrN+gn6icsuEOKduQCozj1AYhvRpYSpNqeaxExZSkYlXTQzmgl2LLloh+gErw=
X-Received: from pjbpb10.prod.google.com ([2002:a17:90b:3c0a:b0:2fc:11a0:c54d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ec6:b0:2ee:70cb:a500
 with SMTP id 98e67ed59e1d1-2fce77a00c5mr23270511a91.1.1740441357604; Mon, 24
 Feb 2025 15:55:57 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:42 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-8-seanjc@google.com>
Subject: [PATCH 7/7] KVM: Drop kvm_arch_sync_events() now that all
 implementations are nops
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155558_536636_5EA84066 
X-CRM114-Status: GOOD (  10.70  )
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

Remove kvm_arch_sync_events() now that x86 no longer uses it (no other
arch has ever used it).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h     | 2 --
 arch/loongarch/include/asm/kvm_host.h | 1 -
 arch/mips/include/asm/kvm_host.h      | 1 -
 arch/powerpc/include/asm/kvm_host.h   | 1 -
 arch/riscv/include/asm/kvm_host.h     | 2 --
 arch/s390/include/asm/kvm_host.h      | 1 -
 arch/x86/kvm/x86.c                    | 5 -----
 include/linux/kvm_host.h              | 1 -
 virt/kvm/kvm_main.c                   | 1 -
 9 files changed, 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7cfa024de4e3..40897bd2b4a3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1346,8 +1346,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
 }
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-
 void kvm_init_host_debug_data(void);
 void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 590982cd986e..ab5b7001e2ff 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -320,7 +320,6 @@ static inline bool kvm_is_ifetch_fault(struct kvm_vcpu_arch *arch)
 
 /* Misc */
 static inline void kvm_arch_hardware_unsetup(void) {}
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index f7222eb594ea..c14b10821817 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -886,7 +886,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
 extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
 			     struct kvm_mips_interrupt *irq);
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 6e1108f8fce6..2d139c807577 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -902,7 +902,6 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_ARCH_WQP
 #define __KVM_HAVE_CREATE_DEVICE
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
 static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index cc33e35cd628..0e9c2fab6378 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -301,8 +301,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
 }
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
-
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 9a367866cab0..424f899d8163 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -1056,7 +1056,6 @@ bool kvm_s390_pv_cpu_is_protected(struct kvm_vcpu *vcpu);
 extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
-static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ea445e6579f1..454fd6b8f3db 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12770,11 +12770,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-void kvm_arch_sync_events(struct kvm *kvm)
-{
-
-}
-
 /**
  * __x86_set_memory_region: Setup KVM internal memory slot
  *
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c28a6aa1f2ed..5438a1b446a6 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1747,7 +1747,6 @@ static inline void kvm_unregister_perf_callbacks(void) {}
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type);
 void kvm_arch_destroy_vm(struct kvm *kvm);
-void kvm_arch_sync_events(struct kvm *kvm);
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 991e8111e88b..55153494ac70 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1271,7 +1271,6 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	kvm_destroy_pm_notifier(kvm);
 	kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
 	kvm_destroy_vm_debugfs(kvm);
-	kvm_arch_sync_events(kvm);
 	mutex_lock(&kvm_lock);
 	list_del(&kvm->vm_list);
 	mutex_unlock(&kvm_lock);
-- 
2.48.1.658.g4767266eb4-goog


