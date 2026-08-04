Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03632C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbmwUYRMkOEfVhoKhlo/B+eCrpuKcZd9NIaZ5Zet0iU=; b=FW8064vn0gqiJMTJSwYxdkvM8V
	Q77DhVrXkyIaJJufw4nwp9PToZACpt3e3OAH7hg5/2S6x0NG5YQtIymk6zBrU6tL8roh0KXd8Kgh4
	D5qWlMT/CdorisL+Q4wvxJyrb/CrAhTKKE9eBDFm5jbv4umwYvkfrA1JaeJSJBo9PhStsT7OWNPzH
	J7hqC8ps3m+G4JpWCgTImwRL6bcz/ZDIFFfDaq9xYCg7SspcBGMPmK6vq3gP0uXeIAryjyaYOF79Q
	AQRuB8Zjx4U4pW6f55Whdd99B6dHlWNAA3B/RaP1yDiUdhLVWa5YGaybDCnD4GYcPChsX7rUd3FMU
	0iCIIyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDFb-00000001fm3-3NFb;
	Tue, 04 Aug 2026 11:24:03 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDFZ-00000001fkY-01wo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 11:24:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785842638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbmwUYRMkOEfVhoKhlo/B+eCrpuKcZd9NIaZ5Zet0iU=;
	b=eDqoRqm1YK9dMdPjeIr4nXnu2t6bsxrSU6Bfbh2YpnUq/3GDsSfWY2kXxOdu4Hf7CcLkAJ
	/VhPJovzgYhCypxUVb6icuVSsP+il7RdpLJnDWrEuWc0VpdPPYw0QALZXYPmxJVi6kFsEW
	3bYfUYCpp7flF+XculerxD75tMmdgZQ=
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
Subject: [PATCH v3 02/11] KVM: arm64: nVHE: Share the stacktrace per-CPU declarations with EL2
Date: Tue,  4 Aug 2026 12:23:08 +0100
Message-Id: <20260804112317.1937387-3-fuad.tabba@linux.dev>
In-Reply-To: <20260804112317.1937387-1-fuad.tabba@linux.dev>
References: <20260804112317.1937387-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_042401_181156_623BE119 
X-CRM114-Status: GOOD (  11.08  )
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

The declarations for overflow_stack, kvm_stacktrace_info and
pkvm_stacktrace are only visible to the host (the first two sit in the
host-only section of stacktrace/nvhe.h, the last is private to
kvm/stacktrace.c), so the definitions in nvhe/stacktrace.c compile
with no declaration in sight and sparse suggests making them static.
DECLARE_KVM_NVHE_PER_CPU() resolves to the right symbol name on both
sides of the build: move the declarations where both can see them and
include the header from the EL2 side unconditionally.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/stacktrace/nvhe.h | 10 ++++++++--
 arch/arm64/kvm/hyp/nvhe/stacktrace.c     |  3 +--
 arch/arm64/kvm/stacktrace.c              |  3 ---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace/nvhe.h b/arch/arm64/include/asm/stacktrace/nvhe.h
index 171f9edef49fc..a631a577cbe5d 100644
--- a/arch/arm64/include/asm/stacktrace/nvhe.h
+++ b/arch/arm64/include/asm/stacktrace/nvhe.h
@@ -37,6 +37,14 @@ static inline void kvm_nvhe_unwind_init(struct unwind_state *state,
 	state->pc = pc;
 }
 
+DECLARE_KVM_NVHE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
+DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
+
+#ifdef CONFIG_PKVM_STACKTRACE
+DECLARE_KVM_NVHE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)],
+			 pkvm_stacktrace);
+#endif
+
 #ifndef __KVM_NVHE_HYPERVISOR__
 /*
  * Conventional (non-protected) nVHE HYP stack unwinder
@@ -45,8 +53,6 @@ static inline void kvm_nvhe_unwind_init(struct unwind_state *state,
  * (by the host in EL1).
  */
 
-DECLARE_KVM_NVHE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
-DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_stacktrace_info, kvm_stacktrace_info);
 DECLARE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
 
 void kvm_nvhe_dump_backtrace(unsigned long hyp_offset);
diff --git a/arch/arm64/kvm/hyp/nvhe/stacktrace.c b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
index 7c832d60d22bb..11fadbebbf1d6 100644
--- a/arch/arm64/kvm/hyp/nvhe/stacktrace.c
+++ b/arch/arm64/kvm/hyp/nvhe/stacktrace.c
@@ -8,6 +8,7 @@
 #include <asm/kvm_hyp.h>
 #include <asm/memory.h>
 #include <asm/percpu.h>
+#include <asm/stacktrace/nvhe.h>
 
 DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
 	__aligned(16);
@@ -35,8 +36,6 @@ static void hyp_prepare_backtrace(unsigned long fp, unsigned long pc)
 }
 
 #ifdef CONFIG_PKVM_STACKTRACE
-#include <asm/stacktrace/nvhe.h>
-
 DEFINE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)], pkvm_stacktrace);
 
 static struct stack_info stackinfo_get_overflow(void)
diff --git a/arch/arm64/kvm/stacktrace.c b/arch/arm64/kvm/stacktrace.c
index 9724c320126b7..69377195e18b7 100644
--- a/arch/arm64/kvm/stacktrace.c
+++ b/arch/arm64/kvm/stacktrace.c
@@ -198,9 +198,6 @@ static void hyp_dump_backtrace(unsigned long hyp_offset)
 }
 
 #ifdef CONFIG_PKVM_STACKTRACE
-DECLARE_KVM_NVHE_PER_CPU(unsigned long [NVHE_STACKTRACE_SIZE/sizeof(long)],
-			 pkvm_stacktrace);
-
 /*
  * pkvm_dump_backtrace - Dump the protected nVHE HYP backtrace.
  *
-- 
2.39.5


