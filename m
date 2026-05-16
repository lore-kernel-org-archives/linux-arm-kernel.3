Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F8FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 18:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA1o8fF1GixqyXSdTMSIkMLiiIC/0B7xQ7MYkapwRhQ=; b=RrHSmLKecsVZPDSCOuV+1XQo23
	U/YlUArWQ6E3scknrds2Yyj6Uf3464civLl+Q453Kx11qlC5ieosgrL9ZNcRtwoAi2SCDRAX9/NOu
	N812Y6nDBohA1UOevWTqORPLFRCpE2LN4uG0U8Ko8FqOols2potvDVzL1xGnWz8tOTaSX/9k89TgX
	RPv87ZOznzSZVZ7KFysj+7cg9UjG5QR4XkjipvmWR3oNdcb5kFhHIrwVBEWgp1AV1EyAEY9Xx8cU1
	ByRzbYhRjWRL8wOt50lRrSj03pC8H/mYOgn1cL1fWbjqSGLyW7uuoqSmNoTHxfRT1DIBcc4hdKTJP
	T9q9fsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJms-0000000BCIN-49RX;
	Sat, 16 May 2026 18:30:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOJmq-0000000BCH9-1TKf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 18:30:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D272D91;
	Sat, 16 May 2026 11:30:49 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09DDD3F85F;
	Sat, 16 May 2026 11:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778956254; bh=oes1Zq1kjZJVeEfVMd7tTaCf/godZJPRNpOF8x60M7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZzMsjZUeF9Y1iEIsRLrVrIagU7XwyK43VIstkh2KG+3ABw923pUruQwifyGeFF/t6
	 TPz2TgwwMQhlZarcQX1ZPQKx06U0z2DfxbsU3zRlN0JuKCgLv3puU0HV5t/SrG3N1S
	 B7xc0tXkNsiRhhppG7HQHZMxVCOEByclbF2+kUZc=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 2/9] KVM: arm64: selftests: Add helpers for guest hypervisors
Date: Sat, 16 May 2026 19:29:56 +0100
Message-ID: <20260516183003.799058-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516183003.799058-1-weilin.chang@arm.com>
References: <20260516183003.799058-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_113056_469253_D8CB1A1C 
X-CRM114-Status: GOOD (  12.02  )
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

Add helpers so that guest hypervisors can run nested guests. SP_EL1
save/restore is added to allow nested guests to use a stack.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 .../selftests/kvm/include/arm64/nested.h      | 17 +++++++
 tools/testing/selftests/kvm/lib/arm64/entry.S |  5 ++
 .../testing/selftests/kvm/lib/arm64/nested.c  | 46 +++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/nested.h b/tools/testing/selftests/kvm/include/arm64/nested.h
index 86d931facacb..30e626e427da 100644
--- a/tools/testing/selftests/kvm/include/arm64/nested.h
+++ b/tools/testing/selftests/kvm/include/arm64/nested.h
@@ -21,8 +21,17 @@
 
 extern char hyp_vectors[];
 
+enum vcpu_sysreg {
+	__INVALID_SYSREG__,   /* 0 is reserved as an invalid value */
+
+	SP_EL1,
+
+	NR_SYS_REGS
+};
+
 struct cpu_context {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
+	u64 sys_regs[NR_SYS_REGS];
 };
 
 struct vcpu {
@@ -37,9 +46,17 @@ struct hyp_data {
 	struct cpu_context hyp_context;
 };
 
+void prepare_hyp(void);
+void init_vcpu(struct vcpu *vcpu, gpa_t l2_pc, gpa_t l2_stack_top);
+int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data);
+
+void do_hvc(void);
 u64 __guest_enter(struct vcpu *vcpu, struct cpu_context *hyp_context);
 void __hyp_exception(u64 type);
 
+void __sysreg_save_el1_state(struct cpu_context *ctxt);
+void __sysreg_restore_el1_state(struct cpu_context *ctxt);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* SELFTEST_KVM_NESTED_H */
diff --git a/tools/testing/selftests/kvm/lib/arm64/entry.S b/tools/testing/selftests/kvm/lib/arm64/entry.S
index 33bedf5e7fb2..df3af3463c6c 100644
--- a/tools/testing/selftests/kvm/lib/arm64/entry.S
+++ b/tools/testing/selftests/kvm/lib/arm64/entry.S
@@ -3,6 +3,11 @@
  * adapted from arch/arm64/kvm/hyp/entry.S
  */
 
+ .globl do_hvc
+ do_hvc:
+	hvc	#0
+	ret
+
 /*
  * Manually define these for now
  */
diff --git a/tools/testing/selftests/kvm/lib/arm64/nested.c b/tools/testing/selftests/kvm/lib/arm64/nested.c
index 06ddaab2436f..f6c24beb01d0 100644
--- a/tools/testing/selftests/kvm/lib/arm64/nested.c
+++ b/tools/testing/selftests/kvm/lib/arm64/nested.c
@@ -4,7 +4,53 @@
  */
 
 #include "nested.h"
+#include "processor.h"
 #include "test_util.h"
+#include <asm/sysreg.h>
+
+void prepare_hyp(void)
+{
+	write_sysreg(HCR_EL2_E2H | HCR_EL2_RW, hcr_el2);
+	write_sysreg(hyp_vectors, vbar_el2);
+	isb();
+}
+
+void init_vcpu(struct vcpu *vcpu, gpa_t l2_pc, gpa_t l2_stack_top)
+{
+	memset(vcpu, 0, sizeof(*vcpu));
+	vcpu->context.regs.pc = l2_pc;
+	vcpu->context.regs.pstate = PSR_MODE_EL1h | PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
+	vcpu->context.sys_regs[SP_EL1] = l2_stack_top;
+}
+
+void __sysreg_save_el1_state(struct cpu_context *ctxt)
+{
+	ctxt->sys_regs[SP_EL1] = read_sysreg(sp_el1);
+}
+
+void __sysreg_restore_el1_state(struct cpu_context *ctxt)
+{
+	write_sysreg(ctxt->sys_regs[SP_EL1], sp_el1);
+}
+
+int run_l2(struct vcpu *vcpu, struct hyp_data *hyp_data)
+{
+	u64 ret;
+
+	__sysreg_restore_el1_state(&vcpu->context);
+
+	write_sysreg(vcpu->context.regs.pstate, spsr_el2);
+	write_sysreg(vcpu->context.regs.pc, elr_el2);
+
+	ret = __guest_enter(vcpu, &hyp_data->hyp_context);
+
+	vcpu->context.regs.pc = read_sysreg(elr_el2);
+	vcpu->context.regs.pstate = read_sysreg(spsr_el2);
+
+	__sysreg_save_el1_state(&vcpu->context);
+
+	return ret;
+}
 
 void __hyp_exception(u64 type)
 {
-- 
2.43.0


