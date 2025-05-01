Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 18:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Lw9e35AP6cuG/BYqlla58mVH5tnNAEDTlbyWnNVWY=; b=QAt4qor7o84JJQcYhUnu7aXb4c
	TWRVp1NNXgBNA1Mm+eSdzZcFBwwBrdmsLh1adG7/Ss34ho6Duwr23N8RPf1mr3RYUCw2bNAvP6RhV
	wlYKxfaHp4xyKuoR7bh5bfgtNVO4ZM03P3XxQr0b/5s5UfcEE2WrEVnwmzzooTr/88eS3SJSP0dbe
	K6VpaMEuxT6WfKQ0N+DV7muGNXCqycqI1hK0k8JZQ2YT2HJu+TV7mjAFsLZVapZtkPePf1/QWGU2g
	4a4WbCF4sBNTeg/LckyQloF3/850dUSJ5oK9ne2lqxNnI/xwueT4eeOJVbB4e/ZscUD5ZWVRZGwh+
	eHG1539A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYvx-0000000GPan-3cYY;
	Thu, 01 May 2025 18:46:57 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAYiu-0000000GN2A-3AAd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 18:33:31 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22651aca434so10604975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124408; x=1746729208; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Lw9e35AP6cuG/BYqlla58mVH5tnNAEDTlbyWnNVWY=;
        b=mdoubjNGK/qSx34cYmvjZ0KOYJ86D9IDY/51O8foRdbFhl9Vag1j/HYIEQc8uSu/lt
         wUbXdAOva7TwBqkfayMg3r525BGpItxOj4FN3f1IPJUOeyIYFsrnwE1QIju68l38FhmD
         2HyrhH4Iq8qRopUg1+SSaPandrlSw9dCTgah3veDEE2yI7+QKhEnZYeXtPmaLH96Jrft
         U2dvL7a42ebLx1Jm1o8melYscfptM6WGPf7lPG+Qp7dMpAYHJ0Sviesw5reNibjGH5RW
         I/QVIcJ+vlctlApdmb2M+TYRngkcG2UqPFMmNj89iaE9a39ZpMFVkPnIDPV0uFvbOcpq
         Aj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124408; x=1746729208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+Lw9e35AP6cuG/BYqlla58mVH5tnNAEDTlbyWnNVWY=;
        b=YCFydB1+ML1quXcLxkyBdRqDV8tqUDbJMTYl7Q+wPetLkeDU5rW2+j2/EdGR/zBfVY
         fYmUL6lt1Vv14nIr+hZywngSpIdVnBq5hqCNHM0MH2piypHqvPi6gtzpjKC6V+gKiPHJ
         9mKzRnpTKj3JwcVDm20LqnSL0nED1pIwljkDkYygjUE//ycBXiS2gW8X3gzsYvR+siau
         tc4zy9kqerQlAqUmtIiTNfnRrEniokRNouRk9PwTijsWEeHuI3pD3PcZGApzc/wte/tC
         JmMyXZas3yN+df8Ho5yi6bWmKXz+s4w91RwoklUaX5k5HtDR0f3maoRZAt9Fp2MCfobX
         04ow==
X-Forwarded-Encrypted: i=1; AJvYcCUSLiSEek0Elj1UOpbXGeQaToShZnOnk7hfbsDPRs72tjErwzooyCNwXAFOef7HHQYH5fuUvvAepbNSDSVexPSg@lists.infradead.org
X-Gm-Message-State: AOJu0YxPejGtlncWGLR5hScvksUI3o9KDDCT/w2L2sBEJcj24Wzen1T0
	bTd0/2clfCFssd8//suCbdsRCSFCa5YlHZXfVTzgEGQ+1MrNANbTVBP0et6p4ysvvM+f3VTzvic
	zMZ42zuuD9g==
X-Google-Smtp-Source: AGHT+IH23l8mHomym09l3yyaMcl5o4hv6VKPsknqhlAhbMRCh/1gV+1G3dxU04rVj+szDTVJBsT9q4PzN7k03g==
X-Received: from plje13.prod.google.com ([2002:a17:902:ed8d:b0:21f:af4a:5cee])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef0b:b0:223:6657:5003 with SMTP id d9443c01a7336-22e103899d1mr1139575ad.32.1746124407598;
 Thu, 01 May 2025 11:33:27 -0700 (PDT)
Date: Thu,  1 May 2025 11:33:02 -0700
In-Reply-To: <20250501183304.2433192-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20250501183304.2433192-1-dmatlack@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501183304.2433192-9-dmatlack@google.com>
Subject: [PATCH 08/10] KVM: selftests: Use u16 instead of uint16_t
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	David Matlack <dmatlack@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, James Houghton <jthoughton@google.com>, 
	Colin Ian King <colin.i.king@gmail.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_113328_822916_D21EA026 
X-CRM114-Status: GOOD (  19.38  )
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

Use u16 instead of uint16_t to make the KVM selftests code more concise
and more similar to the kernel (since selftests are primarily developed
by kernel developers).

This commit was generated with the following command:

  git ls-files tools/testing/selftests/kvm | xargs sed -i 's/uint16_t/u16/g'

Then by manually adjusting whitespace to make checkpatch.pl happy.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../selftests/kvm/arm64/page_fault_test.c     |  2 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  2 +-
 .../testing/selftests/kvm/include/x86/evmcs.h |  2 +-
 .../selftests/kvm/include/x86/processor.h     | 58 +++++++++----------
 .../testing/selftests/kvm/lib/guest_sprintf.c |  2 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  8 +--
 tools/testing/selftests/kvm/lib/x86/ucall.c   |  2 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     |  4 +-
 tools/testing/selftests/kvm/s390/memop.c      |  2 +-
 .../selftests/kvm/x86/sync_regs_test.c        |  2 +-
 10 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/page_fault_test.c b/tools/testing/selftests/kvm/arm64/page_fault_test.c
index 235582206aee..cb5ada7dd041 100644
--- a/tools/testing/selftests/kvm/arm64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/arm64/page_fault_test.c
@@ -148,7 +148,7 @@ static void guest_at(void)
  */
 static void guest_dc_zva(void)
 {
-	uint16_t val;
+	u16 val;
 
 	asm volatile("dc zva, %0" :: "r" (guest_test_memory));
 	dsb(ish);
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index d76410a0fa1d..271d7a434a4c 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -185,7 +185,7 @@ struct vm_shape {
 	u32 type;
 	uint8_t  mode;
 	uint8_t  pad0;
-	uint16_t pad1;
+	u16 pad1;
 };
 
 kvm_static_assert(sizeof(struct vm_shape) == sizeof(u64));
diff --git a/tools/testing/selftests/kvm/include/x86/evmcs.h b/tools/testing/selftests/kvm/include/x86/evmcs.h
index 3b0f96b881f9..be79bda024bf 100644
--- a/tools/testing/selftests/kvm/include/x86/evmcs.h
+++ b/tools/testing/selftests/kvm/include/x86/evmcs.h
@@ -10,7 +10,7 @@
 #include "hyperv.h"
 #include "vmx.h"
 
-#define u16 uint16_t
+#define u16 u16
 #define u32 u32
 #define u64 u64
 
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 8afbb3315c85..302836e276e0 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -398,8 +398,8 @@ struct gpr64_regs {
 };
 
 struct desc64 {
-	uint16_t limit0;
-	uint16_t base0;
+	u16 limit0;
+	u16 base0;
 	unsigned base1:8, type:4, s:1, dpl:2, p:1;
 	unsigned limit1:4, avl:1, l:1, db:1, g:1, base2:8;
 	u32 base3;
@@ -407,7 +407,7 @@ struct desc64 {
 } __attribute__((packed));
 
 struct desc_ptr {
-	uint16_t size;
+	u16 size;
 	u64 address;
 } __attribute__((packed));
 
@@ -473,9 +473,9 @@ static inline void wrmsr(u32 msr, u64 value)
 }
 
 
-static inline uint16_t inw(uint16_t port)
+static inline u16 inw(u16 port)
 {
-	uint16_t tmp;
+	u16 tmp;
 
 	__asm__ __volatile__("in %%dx, %%ax"
 		: /* output */ "=a" (tmp)
@@ -484,63 +484,63 @@ static inline uint16_t inw(uint16_t port)
 	return tmp;
 }
 
-static inline uint16_t get_es(void)
+static inline u16 get_es(void)
 {
-	uint16_t es;
+	u16 es;
 
 	__asm__ __volatile__("mov %%es, %[es]"
 			     : /* output */ [es]"=rm"(es));
 	return es;
 }
 
-static inline uint16_t get_cs(void)
+static inline u16 get_cs(void)
 {
-	uint16_t cs;
+	u16 cs;
 
 	__asm__ __volatile__("mov %%cs, %[cs]"
 			     : /* output */ [cs]"=rm"(cs));
 	return cs;
 }
 
-static inline uint16_t get_ss(void)
+static inline u16 get_ss(void)
 {
-	uint16_t ss;
+	u16 ss;
 
 	__asm__ __volatile__("mov %%ss, %[ss]"
 			     : /* output */ [ss]"=rm"(ss));
 	return ss;
 }
 
-static inline uint16_t get_ds(void)
+static inline u16 get_ds(void)
 {
-	uint16_t ds;
+	u16 ds;
 
 	__asm__ __volatile__("mov %%ds, %[ds]"
 			     : /* output */ [ds]"=rm"(ds));
 	return ds;
 }
 
-static inline uint16_t get_fs(void)
+static inline u16 get_fs(void)
 {
-	uint16_t fs;
+	u16 fs;
 
 	__asm__ __volatile__("mov %%fs, %[fs]"
 			     : /* output */ [fs]"=rm"(fs));
 	return fs;
 }
 
-static inline uint16_t get_gs(void)
+static inline u16 get_gs(void)
 {
-	uint16_t gs;
+	u16 gs;
 
 	__asm__ __volatile__("mov %%gs, %[gs]"
 			     : /* output */ [gs]"=rm"(gs));
 	return gs;
 }
 
-static inline uint16_t get_tr(void)
+static inline u16 get_tr(void)
 {
-	uint16_t tr;
+	u16 tr;
 
 	__asm__ __volatile__("str %[tr]"
 			     : /* output */ [tr]"=rm"(tr));
@@ -625,7 +625,7 @@ static inline struct desc_ptr get_idt(void)
 	return idt;
 }
 
-static inline void outl(uint16_t port, u32 value)
+static inline void outl(u16 port, u32 value)
 {
 	__asm__ __volatile__("outl %%eax, %%dx" : : "d"(port), "a"(value));
 }
@@ -1164,15 +1164,15 @@ struct ex_regs {
 };
 
 struct idt_entry {
-	uint16_t offset0;
-	uint16_t selector;
-	uint16_t ist : 3;
-	uint16_t : 5;
-	uint16_t type : 4;
-	uint16_t : 1;
-	uint16_t dpl : 2;
-	uint16_t p : 1;
-	uint16_t offset1;
+	u16 offset0;
+	u16 selector;
+	u16 ist : 3;
+	u16 : 5;
+	u16 type : 4;
+	u16 : 1;
+	u16 dpl : 2;
+	u16 p : 1;
+	u16 offset1;
 	u32 offset2; u32 reserved;
 };
 
diff --git a/tools/testing/selftests/kvm/lib/guest_sprintf.c b/tools/testing/selftests/kvm/lib/guest_sprintf.c
index 768e12cd8d1d..afbddb53ddd6 100644
--- a/tools/testing/selftests/kvm/lib/guest_sprintf.c
+++ b/tools/testing/selftests/kvm/lib/guest_sprintf.c
@@ -286,7 +286,7 @@ int guest_vsnprintf(char *buf, int n, const char *fmt, va_list args)
 		if (qualifier == 'l')
 			num = va_arg(args, u64);
 		else if (qualifier == 'h') {
-			num = (uint16_t)va_arg(args, int);
+			num = (u16)va_arg(args, int);
 			if (flags & SIGN)
 				num = (int16_t)num;
 		} else if (flags & SIGN)
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index e3ca7001b436..7258f9f8f0bf 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -334,7 +334,7 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 		"addr         w exec dirty\n",
 		indent, "");
 	pml4e_start = addr_gpa2hva(vm, vm->pgd);
-	for (uint16_t n1 = 0; n1 <= 0x1ffu; n1++) {
+	for (u16 n1 = 0; n1 <= 0x1ffu; n1++) {
 		pml4e = &pml4e_start[n1];
 		if (!(*pml4e & PTE_PRESENT_MASK))
 			continue;
@@ -346,7 +346,7 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 			!!(*pml4e & PTE_WRITABLE_MASK), !!(*pml4e & PTE_NX_MASK));
 
 		pdpe_start = addr_gpa2hva(vm, *pml4e & PHYSICAL_PAGE_MASK);
-		for (uint16_t n2 = 0; n2 <= 0x1ffu; n2++) {
+		for (u16 n2 = 0; n2 <= 0x1ffu; n2++) {
 			pdpe = &pdpe_start[n2];
 			if (!(*pdpe & PTE_PRESENT_MASK))
 				continue;
@@ -359,7 +359,7 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 				!!(*pdpe & PTE_NX_MASK));
 
 			pde_start = addr_gpa2hva(vm, *pdpe & PHYSICAL_PAGE_MASK);
-			for (uint16_t n3 = 0; n3 <= 0x1ffu; n3++) {
+			for (u16 n3 = 0; n3 <= 0x1ffu; n3++) {
 				pde = &pde_start[n3];
 				if (!(*pde & PTE_PRESENT_MASK))
 					continue;
@@ -371,7 +371,7 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 					!!(*pde & PTE_NX_MASK));
 
 				pte_start = addr_gpa2hva(vm, *pde & PHYSICAL_PAGE_MASK);
-				for (uint16_t n4 = 0; n4 <= 0x1ffu; n4++) {
+				for (u16 n4 = 0; n4 <= 0x1ffu; n4++) {
 					pte = &pte_start[n4];
 					if (!(*pte & PTE_PRESENT_MASK))
 						continue;
diff --git a/tools/testing/selftests/kvm/lib/x86/ucall.c b/tools/testing/selftests/kvm/lib/x86/ucall.c
index 1af2a6880cdf..e7dd5791959b 100644
--- a/tools/testing/selftests/kvm/lib/x86/ucall.c
+++ b/tools/testing/selftests/kvm/lib/x86/ucall.c
@@ -6,7 +6,7 @@
  */
 #include "kvm_util.h"
 
-#define UCALL_PIO_PORT ((uint16_t)0x1000)
+#define UCALL_PIO_PORT ((u16)0x1000)
 
 void ucall_arch_do_ucall(gva_t uc)
 {
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 8d7b759a403c..52c6ab56a1f3 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -44,7 +44,7 @@ struct eptPageTablePointer {
 };
 int vcpu_enable_evmcs(struct kvm_vcpu *vcpu)
 {
-	uint16_t evmcs_ver;
+	u16 evmcs_ver;
 
 	vcpu_enable_cap(vcpu, KVM_CAP_HYPERV_ENLIGHTENED_VMCS,
 			(unsigned long)&evmcs_ver);
@@ -399,7 +399,7 @@ void __nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 {
 	const u64 page_size = PG_LEVEL_SIZE(target_level);
 	struct eptPageTableEntry *pt = vmx->eptp_hva, *pte;
-	uint16_t index;
+	u16 index;
 
 	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K, "Attempt to use "
 		    "unknown or unsupported guest mode, mode: 0x%x", vm->mode);
diff --git a/tools/testing/selftests/kvm/s390/memop.c b/tools/testing/selftests/kvm/s390/memop.c
index fc640f3c5176..2283ad346746 100644
--- a/tools/testing/selftests/kvm/s390/memop.c
+++ b/tools/testing/selftests/kvm/s390/memop.c
@@ -485,7 +485,7 @@ static __uint128_t cut_to_size(int size, __uint128_t val)
 	case 1:
 		return (uint8_t)val;
 	case 2:
-		return (uint16_t)val;
+		return (u16)val;
 	case 4:
 		return (u32)val;
 	case 8:
diff --git a/tools/testing/selftests/kvm/x86/sync_regs_test.c b/tools/testing/selftests/kvm/x86/sync_regs_test.c
index 8fa3948b0170..e0c52321f87c 100644
--- a/tools/testing/selftests/kvm/x86/sync_regs_test.c
+++ b/tools/testing/selftests/kvm/x86/sync_regs_test.c
@@ -20,7 +20,7 @@
 #include "kvm_util.h"
 #include "processor.h"
 
-#define UCALL_PIO_PORT ((uint16_t)0x1000)
+#define UCALL_PIO_PORT ((u16)0x1000)
 
 struct ucall uc_none = {
 	.cmd = UCALL_NONE,
-- 
2.49.0.906.g1f30a19c02-goog


