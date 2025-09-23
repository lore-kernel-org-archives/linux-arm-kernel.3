Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BB9CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6JbDICqugtb9qT9yEa3DWWYK2mJcztKgaMSZgbVh4w=; b=dgmhSUpBo6RZzT
	nurxo6xCRj0GyKdxt2NyOu8iS/BeyEqLLGnbP8usLh/QWhTuJr2KS+zKfMH7HLE8O1zGJLN2tAjkY
	H+q4A3v6n4xNgeTkwtH1HIwTXjUlln5bEEaapDXhXBz/w3jcZxBXXEH9gfEEes7XH3VLg2rGAWKtI
	JuxuZrTBrQGbhMjfgs9NydMFPviyCwX7Oi+hxlrUcqTZUWo4L8v+8uPpy3IhJXtbf6ueYOQbQH6KM
	3sX9T9uqMqo1i28DenZDI0xaHgZ2k2KTRnaxtdtyzURF+3EIYEm+cQH9N3d+lJ+mvLgLBWYS8oA50
	2mpAmSyS378alSpFwSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179d-0000000ESBv-3PkY;
	Tue, 23 Sep 2025 17:50:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v179Q-0000000ERzF-10gQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 17:50:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66942497;
	Tue, 23 Sep 2025 10:49:55 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.30.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F2973F5A1;
	Tue, 23 Sep 2025 10:49:59 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 12/16] kvm/arm64: make alternative callbacks safe
Date: Tue, 23 Sep 2025 18:48:59 +0100
Message-ID: <20250923174903.76283-13-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923174903.76283-1-ada.coupriediaz@arm.com>
References: <20250923174903.76283-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_105004_604451_06E7F078 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Alternative callback functions are regular functions, which means they
or any function they call could get patched or instrumented
by alternatives or other parts of the kernel.
Given that applying alternatives does not guarantee a consistent state
while patching, only once done, and handles cache maintenance manually,
it could lead to nasty corruptions and execution of bogus code.

Make the KVM alternative callbacks safe by marking them `noinstr` and
`__always_inline`'ing their helpers.
This is possible thanks to previous commits making `aarch64_insn_...`
functions used in the callbacks safe to inline.

`kvm_update_va_mask()` is already marked as `__init`, which has its own
text section conflicting with the `noinstr` one.
Instead, use `__no_instr_section(".noinstr.text")` to add
all the function attributes added by `noinstr`, without the section
conflict.
This can be an issue, as kprobes seems to only block the text sections,
not based on function attributes.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
This is missing `kvm_patch_vector_branch()`, which could receive the same
treatment, but the `WARN_ON_ONCE` in the early-exit check would make it
call into instrumentable code.
I do not currently know if this `WARN` can safely be removed or if it
has some importance.
---
 arch/arm64/kvm/va_layout.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/va_layout.c b/arch/arm64/kvm/va_layout.c
index 91b22a014610..3ebb7e0074f6 100644
--- a/arch/arm64/kvm/va_layout.c
+++ b/arch/arm64/kvm/va_layout.c
@@ -109,7 +109,7 @@ __init void kvm_apply_hyp_relocations(void)
 	}
 }
 
-static u32 compute_instruction(int n, u32 rd, u32 rn)
+static __always_inline u32 compute_instruction(int n, u32 rd, u32 rn)
 {
 	u32 insn = AARCH64_BREAK_FAULT;
 
@@ -151,6 +151,7 @@ static u32 compute_instruction(int n, u32 rd, u32 rn)
 	return insn;
 }
 
+__noinstr_section(".init.text")
 void __init kvm_update_va_mask(struct alt_instr *alt,
 			       __le32 *origptr, __le32 *updptr, int nr_inst)
 {
@@ -241,7 +242,8 @@ void kvm_patch_vector_branch(struct alt_instr *alt,
 	*updptr++ = cpu_to_le32(insn);
 }
 
-static void generate_mov_q(u64 val, __le32 *origptr, __le32 *updptr, int nr_inst)
+static __always_inline void generate_mov_q(u64 val, __le32 *origptr,
+				 __le32 *updptr, int nr_inst)
 {
 	u32 insn, oinsn, rd;
 
@@ -284,15 +286,15 @@ static void generate_mov_q(u64 val, __le32 *origptr, __le32 *updptr, int nr_inst
 	*updptr++ = cpu_to_le32(insn);
 }
 
-void kvm_get_kimage_voffset(struct alt_instr *alt,
+noinstr void kvm_get_kimage_voffset(struct alt_instr *alt,
 			    __le32 *origptr, __le32 *updptr, int nr_inst)
 {
 	generate_mov_q(kimage_voffset, origptr, updptr, nr_inst);
 }
 
-void kvm_compute_final_ctr_el0(struct alt_instr *alt,
+noinstr void kvm_compute_final_ctr_el0(struct alt_instr *alt,
 			       __le32 *origptr, __le32 *updptr, int nr_inst)
 {
-	generate_mov_q(read_sanitised_ftr_reg(SYS_CTR_EL0),
+	generate_mov_q(arm64_ftr_reg_ctrel0.sys_val,
 		       origptr, updptr, nr_inst);
 }
-- 
2.43.0


