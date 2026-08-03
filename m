Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2156AC55838
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMu2F6yU/P7jnsdMnWb4spsSAPbWFFNzzR0sAj34cJQ=; b=OOK6RYeQEiembUtL86jQi1dTbB
	uWj4ob55D2KqRswerlT10c1oDFsRgb7JkwP6n2dCJMCuJyLmgZx8i8cE6EHb3fW9jFQ/68rPKJtm5
	B8fKw6hqDeiTRlxEyW2ZnH73XyKUnQ8Bvjran3FBFwin8wV44evNQ0EpQC95eChDPlA/EHhtsWguU
	z37x0+VPJIZ2t3B7aTB1FXvrVNN4TrI7HT4I/MV8bxEz4rPlogV4C0FIcfVO/HVpusmI0G2JVvrsq
	aNY3hi7Dt3tQ7IUjmqUZovvgckeY5BMbdf4jZNitkHaoY/wGXR29AJfjPaDCuXQwZd5XuhBQ/K9vU
	DNSgg9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs0l-0000000H3po-2TSW;
	Mon, 03 Aug 2026 12:43:19 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqs0i-0000000H3lk-3wjN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:43:18 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785760993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oMu2F6yU/P7jnsdMnWb4spsSAPbWFFNzzR0sAj34cJQ=;
	b=BwdAKX8k/SaucyMEo8941hNe5F272UOlaN2FFTS89VfJftw7bC01QuBjWqJ4GvF1rIbQK0
	FT5v8zB4DD9esYz371AefcNcEHwPg58t/7MjbJJoeXL2U0QrsICjqnfSEhNsb8oyrZ7SnP
	OIBnhh3J8OZa2kH3EOFbc5hjrF0PncE=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	alexandru.elisei@arm.com,
	vdonnefort@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	ardb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	tabba@google.com,
	fuad.tabba@linux.dev
Subject: [PATCH v2 09/11] KVM: arm64: Type-check hypercall arguments at the caller
Date: Mon,  3 Aug 2026 13:42:18 +0100
Message-Id: <20260803124220.332248-10-fuad.tabba@linux.dev>
In-Reply-To: <20260803124220.332248-1-fuad.tabba@linux.dev>
References: <20260803124220.332248-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_054317_256039_1F75EEB8 
X-CRM114-Status: GOOD (  19.36  )
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

kvm_call_hyp_nvhe() reduces its target to an SMCCC function number, so
the compiler never sees a callable: arguments that are wrong in number,
type or order are silently marshalled into registers. The kvm_call_hyp()
wrappers only catch this on the VHE branch, and the pKVM-only hypercalls
have no such branch.

Declare each hypercall's signature once in kvm_hcall.h and generate a
typed stub from it, in the mold of the syscall wrappers. Make
kvm_call_hyp_nvhe() resolve to the stub so every caller is checked
against the declared signature; a stale or mistyped call now fails to
compile. The stubs inline to the same SMCCC call the untyped macro used
to make: the compiled callers are unchanged, apart from hypercall
returns now being tested at their declared width.

The stage-2 protection arguments are declared u64 rather than
enum kvm_pgtable_prot, as kvm_pgtable.h includes linux/kvm_host.h and
the enum cannot be completed here.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hcall.h | 168 ++++++++++++++++++++++++++++-
 arch/arm64/kvm/hyp_trace.c         |   2 +-
 2 files changed, 168 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
index d925b2c28a3d8..1c9c182ddcd1b 100644
--- a/arch/arm64/include/asm/kvm_hcall.h
+++ b/arch/arm64/include/asm/kvm_hcall.h
@@ -9,6 +9,7 @@
 #ifndef __ARM64_KVM_HCALL_H__
 #define __ARM64_KVM_HCALL_H__
 
+#include <linux/args.h>
 #include <linux/arm-smccc.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
@@ -16,12 +17,37 @@
 
 #include <asm/barrier.h>
 #include <asm/kvm_asm.h>
+#include <asm/spectre.h>
 #include <asm/virt.h>
 
 typedef u16 pkvm_handle_t;
 
+struct kvm;
+struct kvm_s2_mmu;
+struct kvm_vcpu;
+struct vgic_v3_cpu_if;
+struct vgic_v5_cpu_if;
+
+/*
+ * Hypercall signatures are declared as (type, name) argument pairs.
+ * __KVM_HCALL_MAP() applies a macro to each pair, in the mold of __MAP()
+ * in <linux/syscalls.h>. The ladder is indexed by list entries, two per
+ * argument; __KVM_HCALL_MAP_N() takes that count explicitly.
+ */
+#define __KVM_HCALL_MAP2(m, t, a, ...) m(t, a)
+#define __KVM_HCALL_MAP4(m, t, a, ...) m(t, a), __KVM_HCALL_MAP2(m, __VA_ARGS__)
+#define __KVM_HCALL_MAP6(m, t, a, ...) m(t, a), __KVM_HCALL_MAP4(m, __VA_ARGS__)
+#define __KVM_HCALL_MAP8(m, t, a, ...) m(t, a), __KVM_HCALL_MAP6(m, __VA_ARGS__)
+#define __KVM_HCALL_MAP10(m, t, a, ...) m(t, a), __KVM_HCALL_MAP8(m, __VA_ARGS__)
+#define __KVM_HCALL_MAP12(m, t, a, ...) m(t, a), __KVM_HCALL_MAP10(m, __VA_ARGS__)
+#define __KVM_HCALL_MAP_N(n, m, ...) CONCATENATE(__KVM_HCALL_MAP, n)(m, __VA_ARGS__)
+#define __KVM_HCALL_MAP(m, ...) __KVM_HCALL_MAP_N(COUNT_ARGS(__VA_ARGS__), m, __VA_ARGS__)
+
+#define __KVM_HCALL_DECL(t, a)	t a
+#define __KVM_HCALL_ARGS(t, a)	a
+
 #ifndef __KVM_NVHE_HYPERVISOR__
-#define kvm_call_hyp_nvhe(f, ...)					\
+#define __kvm_call_hyp_nvhe(f, ...)					\
 	({								\
 		struct arm_smccc_res res;				\
 									\
@@ -33,6 +59,43 @@ typedef u16 pkvm_handle_t;
 		res.a1;							\
 	})
 
+/*
+ * Generate a typed stub for each declared hypercall. kvm_call_hyp_nvhe()
+ * resolves to the stub, so a call with the wrong argument count or types
+ * fails to compile instead of being silently truncated to an SMCCC function
+ * number and a pile of registers. The stub inlines to the same SMCCC call
+ * the untyped macro used to make.
+ */
+#define DECLARE_KVM_HOST_HCALL(ret, name, ...)				\
+	static __always_inline						\
+	ret nvhe_hvc_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__)) \
+	{								\
+		return (ret)__kvm_call_hyp_nvhe(name,			\
+			__KVM_HCALL_MAP(__KVM_HCALL_ARGS, __VA_ARGS__));\
+	}
+
+#define DECLARE_KVM_HOST_HCALL_VOID(name, ...)				\
+	static __always_inline						\
+	void nvhe_hvc_##name(__KVM_HCALL_MAP(__KVM_HCALL_DECL, __VA_ARGS__)) \
+	{								\
+		__kvm_call_hyp_nvhe(name,				\
+			__KVM_HCALL_MAP(__KVM_HCALL_ARGS, __VA_ARGS__));\
+	}
+
+#define DECLARE_KVM_HOST_HCALL0(ret, name)				\
+	static __always_inline ret nvhe_hvc_##name(void)		\
+	{								\
+		return (ret)__kvm_call_hyp_nvhe(name);			\
+	}
+
+#define DECLARE_KVM_HOST_HCALL0_VOID(name)				\
+	static __always_inline void nvhe_hvc_##name(void)		\
+	{								\
+		__kvm_call_hyp_nvhe(name);				\
+	}
+
+#define kvm_call_hyp_nvhe(f, ...)	nvhe_hvc_##f(__VA_ARGS__)
+
 /*
  * The isb() below is there to guarantee the same behaviour on VHE as on !VHE,
  * where the eret to EL1 acts as a context synchronization event.
@@ -63,6 +126,109 @@ typedef u16 pkvm_handle_t;
 #define kvm_call_hyp(f, ...) f(__VA_ARGS__)
 #define kvm_call_hyp_ret(f, ...) f(__VA_ARGS__)
 #define kvm_call_hyp_nvhe(f, ...) f(__VA_ARGS__)
+
+#define DECLARE_KVM_HOST_HCALL(ret, name, ...)
+#define DECLARE_KVM_HOST_HCALL_VOID(name, ...)
+#define DECLARE_KVM_HOST_HCALL0(ret, name)
+#define DECLARE_KVM_HOST_HCALL0_VOID(name)
 #endif /* __KVM_NVHE_HYPERVISOR__ */
 
+/* Hypercalls that are unavailable once pKVM has finalised. */
+DECLARE_KVM_HOST_HCALL(int, __pkvm_init,
+	phys_addr_t, phys, unsigned long, size,
+	unsigned long *, per_cpu_base, u32, hyp_va_bits)
+DECLARE_KVM_HOST_HCALL(unsigned long, __pkvm_create_private_mapping,
+	phys_addr_t, phys, size_t, size, u64, prot)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_cpu_set_vector,
+	enum arm64_hyp_spectre_vector, slot)
+DECLARE_KVM_HOST_HCALL0_VOID(__kvm_enable_ssbs)
+DECLARE_KVM_HOST_HCALL0_VOID(__vgic_v3_init_lrs)
+DECLARE_KVM_HOST_HCALL0(u64, __vgic_v3_get_gic_config)
+
+DECLARE_KVM_HOST_HCALL0(int, __pkvm_prot_finalize)
+
+/* Hypercalls that are always available and common to [nh]VHE/pKVM. */
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_adjust_pc,
+	struct kvm_vcpu *, vcpu)
+DECLARE_KVM_HOST_HCALL(int, __kvm_vcpu_run,
+	struct kvm_vcpu *, vcpu)
+DECLARE_KVM_HOST_HCALL0_VOID(__kvm_flush_vm_context)
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa,
+	struct kvm_s2_mmu *, mmu, phys_addr_t, ipa, int, level)
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_ipa_nsh,
+	struct kvm_s2_mmu *, mmu, phys_addr_t, ipa, int, level)
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid,
+	struct kvm_s2_mmu *, mmu)
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_tlb_flush_vmid_range,
+	struct kvm_s2_mmu *, mmu, phys_addr_t, start, unsigned long, pages)
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_flush_cpu_context,
+	struct kvm_s2_mmu *, mmu)
+DECLARE_KVM_HOST_HCALL_VOID(__kvm_timer_set_cntvoff,
+	u64, cntvoff)
+DECLARE_KVM_HOST_HCALL(int, __tracing_load,
+	void *, desc_hva, size_t, desc_size)
+DECLARE_KVM_HOST_HCALL0_VOID(__tracing_unload)
+DECLARE_KVM_HOST_HCALL(int, __tracing_enable,
+	bool, enable)
+DECLARE_KVM_HOST_HCALL(int, __tracing_swap_reader,
+	unsigned int, cpu)
+DECLARE_KVM_HOST_HCALL_VOID(__tracing_update_clock,
+	u32, mult, u32, shift, u64, epoch_ns, u64, epoch_cyc)
+DECLARE_KVM_HOST_HCALL(int, __tracing_reset,
+	unsigned int, cpu)
+DECLARE_KVM_HOST_HCALL(int, __tracing_enable_event,
+	unsigned short, id, bool, enable)
+DECLARE_KVM_HOST_HCALL_VOID(__tracing_write_event,
+	u64, id)
+DECLARE_KVM_HOST_HCALL_VOID(__vgic_v3_save_aprs,
+	struct vgic_v3_cpu_if *, cpu_if)
+DECLARE_KVM_HOST_HCALL_VOID(__vgic_v3_restore_vmcr_aprs,
+	struct vgic_v3_cpu_if *, cpu_if)
+DECLARE_KVM_HOST_HCALL_VOID(__vgic_v5_save_apr,
+	struct vgic_v5_cpu_if *, cpu_if)
+DECLARE_KVM_HOST_HCALL_VOID(__vgic_v5_restore_vmcr_apr,
+	struct vgic_v5_cpu_if *, cpu_if)
+
+/* Hypercalls that are available only when pKVM has finalised. */
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp,
+	u64, pfn)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_unshare_hyp,
+	u64, pfn)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
+	u64, pfn, u64, gfn)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_guest,
+	u64, pfn, u64, gfn, u64, nr_pages, u64, prot)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_unshare_guest,
+	pkvm_handle_t, handle, u64, gfn, u64, nr_pages)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_relax_perms_guest,
+	u64, gfn, u64, prot)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_wrprotect_guest,
+	pkvm_handle_t, handle, u64, gfn, u64, nr_pages)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_test_clear_young_guest,
+	pkvm_handle_t, handle, u64, gfn, u64, nr_pages, bool, mkold)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_host_mkyoung_guest,
+	u64, gfn)
+DECLARE_KVM_HOST_HCALL0(int, __pkvm_reserve_vm)
+DECLARE_KVM_HOST_HCALL_VOID(__pkvm_unreserve_vm,
+	pkvm_handle_t, handle)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vm,
+	struct kvm *, host_kvm, void *, vm_hva, void *, pgd_hva)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_init_vcpu,
+	pkvm_handle_t, handle, struct kvm_vcpu *, host_vcpu,
+	void *, vcpu_hva)
+DECLARE_KVM_HOST_HCALL0(int, __pkvm_vcpu_in_poison_fault)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_force_reclaim_guest_page,
+	phys_addr_t, phys)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_reclaim_dying_guest_page,
+	pkvm_handle_t, handle, u64, gfn)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_start_teardown_vm,
+	pkvm_handle_t, handle)
+DECLARE_KVM_HOST_HCALL(int, __pkvm_finalize_teardown_vm,
+	pkvm_handle_t, handle)
+DECLARE_KVM_HOST_HCALL_VOID(__pkvm_vcpu_load,
+	pkvm_handle_t, handle, unsigned int, vcpu_idx, u64, hcr_el2)
+DECLARE_KVM_HOST_HCALL0_VOID(__pkvm_vcpu_put)
+DECLARE_KVM_HOST_HCALL_VOID(__pkvm_tlb_flush_vmid,
+	pkvm_handle_t, handle)
+
 #endif /* __ARM64_KVM_HCALL_H__ */
diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 9644c424819b7..44937e257375a 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -269,7 +269,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 	if (ret)
 		goto err_free_buffer;
 
-	ret = kvm_call_hyp_nvhe(__tracing_load, (unsigned long)desc, desc_size);
+	ret = kvm_call_hyp_nvhe(__tracing_load, desc, desc_size);
 	if (ret)
 		goto err_unload_pages;
 
-- 
2.39.5


