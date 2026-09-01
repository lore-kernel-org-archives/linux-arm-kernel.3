Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF67CC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fj4vrNQ21jKyEN8C+M0EPHFYiUjplhkBiYKiFQgk64A=; b=OORUbUJStz/pG2bxlsE5qy8K4l
	BXtUrQMAWdBu7uOM0yrOhGUMX/LhYBdtFEATdorni1a6ekoOoB3tu0jHXpOUqDu5BzDZOPuBtxC3X
	FigOxRu9eNOP+50ikGRSZzVwO8jyhI0v7b4Je5B4lPgr3AGM3gyXBU55no2QoDpx383H4j7PwJU7s
	J19BNZRoKvLGGBVwn/dU6e/NhThbptExUfwsoZFFFi/fJA9Omy2layLaGGLT5oJc3gGlxd97FVbLr
	QzG2ApamQ8ItOaGwmiTivu7B3O1shur3DX1Lo6k5AP+nGBKVaF8GtiVC2eR6QPKBu1N2+/+D85j0L
	cEYjtMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5V-0000000CGuR-2AQc;
	Tue, 01 Sep 2026 14:03:45 +0000
Received: from out-137.mta0.migadu.com ([2001:41d0:1004:224b::89] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P5T-0000000CGtF-2GHL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:03:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Xa6Kq1v4hXNOqZBVImzJqeYJPb/TLqmgh6LUUUVzTz0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788271421; v=1; x=1788876221;
 b=kAkv1oalOozkUy+YKVq7fbszCcBvNpxgzII7f0ummXHgRLgCU/wzRRT4Ts7jHnH7sF+h5qX2
 0D7FULNR3aqpdi8xWPXvIK0YfkMoDdHIhO1iwJPwYaiuPx7QBolqS4jMMxjj+82znqT4HdRGnxy
 e7rYw8JSMvEahAucqLXya4ts=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3bdfeb0c7760ac87;
	Tue, 01 Sep 2026 14:03:41 +0000
X-Mizu-Trace-ID: 3bdfeb0c7760ac87
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v4 02/11] KVM: arm64: nVHE: Share the stacktrace per-CPU declarations with EL2
Date: Tue,  1 Sep 2026 15:03:17 +0100
Message-Id: <20260901140326.3812068-3-fuad.tabba@linux.dev>
In-Reply-To: <20260901140326.3812068-1-fuad.tabba@linux.dev>
References: <20260901140326.3812068-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_070343_718311_0AE44079 
X-CRM114-Status: GOOD (  11.79  )
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

Reviewed-by: Marc Zyngier <maz@kernel.org>
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


