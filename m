Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E073CC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEqg7VunlhEslY2F0JLU+TRpHug+45n+kFx2sgOCJbc=; b=wRFWctrsND2M4WrcbYm78Vr2K9
	TP8fOAquB+5PHVZt2g7jCtN15BXgrXR4ba8M/0CRkUUa09/g3CuooN4u3pSyDcbp9jiKTtI3thlZ+
	hcsMFRy1g0z0f6vvbys0d0/J/ByoHRGNwkjX4a2U/3DpRMbFTYaVkLTcldK18Do8PdXBw6VWcYmYw
	RDuIiZc8KB4KlbZAwNWepoJZ4TtoWkA/AKEzFGO5728oNMFFQF8ggjumVDFOCMTqr77lXkB6go2Lh
	gi/T++STCVqady2+vCVNO81ghW+MKKk1f0/LPPnZoObb6tkYCjDmoFF5+yIIcBKvz/9DtD4p7hbkN
	buA+1XhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzyU-00000001F8j-2KKY;
	Sun, 26 Jul 2026 14:37:06 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzyK-00000001F5z-3I8k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 14:36:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785076613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEqg7VunlhEslY2F0JLU+TRpHug+45n+kFx2sgOCJbc=;
	b=heo54cw00rT64OTcdLCe8bpGs3jOk1lTBVRHrEeruaTF09tvCqWiHoioNmuxn7sTbZMIL6
	bB5VmIayT2VfE06XJZHz+8TcH31QNuQzAe09fRA8T2WNaFua6C9C2kZph2ulMyW0uz0X8q
	pPJKhC9XlJ3mAHu0YmoAdpCoHM7LeZc=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: [PATCH 2/2] KVM: arm64: selftests: Add a userspace watchpoint test
Date: Sun, 26 Jul 2026 15:36:43 +0100
Message-Id: <20260726143643.303456-3-fuad.tabba@linux.dev>
In-Reply-To: <20260726143643.303456-1-fuad.tabba@linux.dev>
References: <20260726143643.303456-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_073656_960266_F4A2BD72 
X-CRM114-Status: GOOD (  10.03  )
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

debug-exceptions covers guest self-hosted debug and userspace
single-step, but not a userspace (KVM_GUESTDBG_USE_HW) watchpoint,
whose KVM_EXIT_DEBUG reports the accessed address in debug.arch.far.
Add a test that installs a host-directed write watchpoint and checks
that the reported address matches the accessed variable.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/arm64/debug-exceptions.c    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
index 3eb4b1b6682dc..7dc5f0b4f6adf 100644
--- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
+++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
@@ -527,6 +527,46 @@ void test_single_step_from_userspace(int test_cnt)
 	kvm_vm_free(vm);
 }
 
+static void guest_code_wp(void)
+{
+	write_data = 'x';
+	GUEST_DONE();
+}
+
+/*
+ * A userspace hardware watchpoint (KVM_GUESTDBG_USE_HW) must fire and report
+ * the accessed address in debug.arch.far, exercising the watchpoint exit path.
+ */
+static void test_watchpoint_from_userspace(void)
+{
+	struct kvm_guest_debug debug = {};
+	struct kvm_vcpu *vcpu;
+	struct kvm_run *run;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code_wp);
+	run = vcpu->run;
+
+	debug.control = KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_HW;
+	debug.arch.dbg_wcr[0] = DBGWCR_LEN8 | DBGWCR_RD | DBGWCR_WR |
+				DBGWCR_EL1 | DBGWCR_E;
+	/*
+	 * BAS = 0xff (LEN8) requires a doubleword-aligned DBGWVR; FAR still
+	 * reports the exact accessed byte.
+	 */
+	debug.arch.dbg_wvr[0] = PC(write_data) & ~7UL;
+	vcpu_guest_debug_set(vcpu, &debug);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_DEBUG,
+		    "Expected KVM_EXIT_DEBUG, got %u", run->exit_reason);
+	TEST_ASSERT((u64)run->debug.arch.far == PC(write_data),
+		    "Watchpoint FAR 0x%lx != accessed address 0x%lx",
+		    (u64)run->debug.arch.far, PC(write_data));
+
+	kvm_vm_free(vm);
+}
+
 /*
  * Run debug testing using the various breakpoint#, watchpoint# and
  * context-aware breakpoint# with the given ID_AA64DFR0_EL1 configuration.
@@ -600,6 +640,7 @@ int main(int argc, char *argv[])
 
 	test_guest_debug_exceptions_all(aa64dfr0);
 	test_single_step_from_userspace(ss_iteration);
+	test_watchpoint_from_userspace();
 
 	return 0;
 }
-- 
2.39.5


