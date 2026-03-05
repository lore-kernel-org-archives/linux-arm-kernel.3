Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A849DF33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gY0Wgm7H9R/g35RcCB9Ue6jWZ3non5frh9Jru4VXWxM=; b=rZc+23r7bLq8bRP4MDSH0ECm0M
	I5srlWBamQ1SVY4a4idVxxu+AtY198Gz+gbkUmNpqGXf5rp8SenGHM+Jkep5qmyKeVRHSn40dj5T4
	Rem/6r5fxCsKcIFy/cjRuGDVOUHclREshseR9V3gSRaMrrzJLr58r5ztudjCKF2HJRao7+kYpuAWy
	+qzfq5X27G1I3pff15d7VadCJPHAMVcc65ZOvlVic1glaa1I5d80q7FqpvmhGDkRTUitFkATHgZBE
	Hx/Ub5ngWFVLmyYUSQRcTWUW7a55jIzjtBdtv7Y8oFjOJITOe6utM3tu+tgOBadU7A9Csh9k2Ja/u
	rVlGaeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9x2-00000002218-2rB5;
	Thu, 05 Mar 2026 14:45:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9x1-000000021yM-1FI1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gY0Wgm7H9R/g35RcCB9Ue6jWZ3non5frh9Jru4VXWxM=; b=mXsTxCiSiWGU4St4zU6+Z2VdBn
	a8o7gn7TpvVVK2qv0hFeAASxDCCnlu9J6E1Y7szbAVuN2NiAPuDbv3FdOfrP8iV6rgIhDDzWOXoDQ
	yvnKY+52bxqDRpNzISFkMD6T2ye9aDpK9drn3VfFXdDkgUvjg0+f1XAd+tDyZPGR+tsCbQJlkHoG1
	qdFxeKYfrH1f9Bj+hQtmD9Lvm9VuaKvxXkeLt9xrJ3PWdRX6BwIxKrvLPOe4RNDPk0dwOdn4W97yz
	7jD9tmpVB+DTGgAr2gdDlGn5sL2KZQyCG5IYrBUQXnRlhorTkJqUqhEpgf5N5NG6pJUtKNer8/YVW
	Q7+D8ZjA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9ww-00000006yJY-3kIL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E40543649;
	Thu,  5 Mar 2026 14:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D595C2BC9E;
	Thu,  5 Mar 2026 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721913;
	bh=UkCoLH1y0Fdpy6NDuesWGah04WOm1Qx14uAjVSe9gyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqBiaYh5VU8eYBlwYb4haKMMGCfdOryKJHqX2dg5znI/WP/odcSYGSxUQ4Waux71Q
	 oABcuMQjFSbg/wDsPcaOzenOdBsa1SxOpSjO2GF19OE3vAlhxTHCX6GFpYJjhGpoQ0
	 0vNPHdOqWtv4hMTiw3NbPn0XfSFApwbZbKLs5dH3lhRVUZgB2c/TqT1h1cfH/ADNBo
	 LEu5mCH8ENqXCIchCVjO2+VSVCU8nK3WAZz7bP++zrte+swDGlGP0kDhmNpgLyVrLl
	 0gquN0L9QSj6KzpPCDB6YtonovHwCjkRuwrV/ft7++eNmH8/jssZijgKHt1O3FJ2NJ
	 5HHzk5JnBu5Ng==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 18/36] KVM: arm64: Inject SIGSEGV on illegal accesses
Date: Thu,  5 Mar 2026 14:43:31 +0000
Message-ID: <20260305144351.17071-19-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144515_428326_62600597 
X-CRM114-Status: GOOD (  20.88  )
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

From: Quentin Perret <qperret@google.com>

The pKVM hypervisor will currently panic if the host tries to access
memory that it doesn't own (e.g. protected guest memory). Sadly, as
guest memory can still be mapped into the VMM's address space, userspace
can trivially crash the kernel/hypervisor by poking into guest memory.

To prevent this, inject the abort back in the host with S1PTW set in the
ESR, hence allowing the host to differentiate this abort from normal
userspace faults and inject a SIGSEGV cleanly.

Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 37 +++++++++++++++++++++++++++
 arch/arm64/mm/fault.c                 | 22 ++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 31b6a52e5e4c..0dc1d6fc546c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -18,6 +18,7 @@
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
+#include <nvhe/trap_handler.h>
 
 #define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_AS_S1 | KVM_PGTABLE_S2_IDMAP)
 
@@ -612,6 +613,39 @@ static int host_stage2_idmap(u64 addr)
 	return ret;
 }
 
+static void host_inject_mem_abort(struct kvm_cpu_context *host_ctxt)
+{
+	u64 ec, esr, spsr;
+
+	esr = read_sysreg_el2(SYS_ESR);
+	spsr = read_sysreg_el2(SYS_SPSR);
+
+	/* Repaint the ESR to report a same-level fault if taken from EL1 */
+	if ((spsr & PSR_MODE_MASK) != PSR_MODE_EL0t) {
+		ec = ESR_ELx_EC(esr);
+		if (ec == ESR_ELx_EC_DABT_LOW)
+			ec = ESR_ELx_EC_DABT_CUR;
+		else if (ec == ESR_ELx_EC_IABT_LOW)
+			ec = ESR_ELx_EC_IABT_CUR;
+		else
+			WARN_ON(1);
+		esr &= ~ESR_ELx_EC_MASK;
+		esr |= ec << ESR_ELx_EC_SHIFT;
+	}
+
+	/*
+	 * Since S1PTW should only ever be set for stage-2 faults, we're pretty
+	 * much guaranteed that it won't be set in ESR_EL1 by the hardware. So,
+	 * let's use that bit to allow the host abort handler to differentiate
+	 * this abort from normal userspace faults.
+	 *
+	 * Note: although S1PTW is RES0 at EL1, it is guaranteed by the
+	 * architecture to be backed by flops, so it should be safe to use.
+	 */
+	esr |= ESR_ELx_S1PTW;
+	inject_host_exception(esr);
+}
+
 void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 {
 	struct kvm_vcpu_fault_info fault;
@@ -635,6 +669,9 @@ void handle_host_mem_abort(struct kvm_cpu_context *host_ctxt)
 	addr = FIELD_GET(HPFAR_EL2_FIPA, fault.hpfar_el2) << 12;
 
 	switch (host_stage2_idmap(addr)) {
+	case -EPERM:
+		host_inject_mem_abort(host_ctxt);
+		fallthrough;
 	case -EEXIST:
 	case 0:
 		break;
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index be9dab2c7d6a..3abfc7272d63 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -43,6 +43,7 @@
 #include <asm/system_misc.h>
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
+#include <asm/virt.h>
 
 struct fault_info {
 	int	(*fn)(unsigned long far, unsigned long esr,
@@ -269,6 +270,15 @@ static inline bool is_el1_permission_fault(unsigned long addr, unsigned long esr
 	return false;
 }
 
+static bool is_pkvm_stage2_abort(unsigned int esr)
+{
+	/*
+	 * S1PTW should only ever be set in ESR_EL1 if the pkvm hypervisor
+	 * injected a stage-2 abort -- see host_inject_mem_abort().
+	 */
+	return is_pkvm_initialized() && (esr & ESR_ELx_S1PTW);
+}
+
 static bool __kprobes is_spurious_el1_translation_fault(unsigned long addr,
 							unsigned long esr,
 							struct pt_regs *regs)
@@ -279,6 +289,9 @@ static bool __kprobes is_spurious_el1_translation_fault(unsigned long addr,
 	if (!is_el1_data_abort(esr) || !esr_fsc_is_translation_fault(esr))
 		return false;
 
+	if (is_pkvm_stage2_abort(esr))
+		return false;
+
 	local_irq_save(flags);
 	asm volatile("at s1e1r, %0" :: "r" (addr));
 	isb();
@@ -395,6 +408,8 @@ static void __do_kernel_fault(unsigned long addr, unsigned long esr,
 			msg = "read from unreadable memory";
 	} else if (addr < PAGE_SIZE) {
 		msg = "NULL pointer dereference";
+	} else if (is_pkvm_stage2_abort(esr)) {
+		msg = "access to hypervisor-protected memory";
 	} else {
 		if (esr_fsc_is_translation_fault(esr) &&
 		    kfence_handle_page_fault(addr, esr & ESR_ELx_WNR, regs))
@@ -621,6 +636,13 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 					 addr, esr, regs);
 	}
 
+	if (is_pkvm_stage2_abort(esr)) {
+		if (!user_mode(regs))
+			goto no_context;
+		arm64_force_sig_fault(SIGSEGV, SEGV_ACCERR, far, "stage-2 fault");
+		return 0;
+	}
+
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
 	if (!(mm_flags & FAULT_FLAG_USER))
-- 
2.53.0.473.g4a7958ca14-goog


