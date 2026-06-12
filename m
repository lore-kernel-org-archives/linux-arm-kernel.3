Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E485ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow6Lcgf/RFgv5jAm1y7NuVlWFYYd0/JrOjI+zfS6dAY=; b=MagfKSrYewe3txSglnZikV0Fqb
	KAiM+nn/12rH9Ck3tuoB10BatQUgCbr13hfUzRl38fI227QU4FoWlk/lnU49CHLNHzubiKOYZhUPR
	UEmZe3wHY60GU0tBoSk5sZdwhUfD2Yz50jdQPn7TmNJUHEn2yc8JauwXct3ipvGAHfbCvH45lEjZZ
	OGGt6LwzJNUVpADAYpCoz064Gh53rcZCW8RhCwOzbDQ5zR2p9hYm082syS8G14oUdqNVd2FTZ0RKR
	GCVz8/01MJBto2u8+dhiVxG9JCmHbXw5xN0sYrGAnn2DKCZ5k/5PkwnICV1jU7Kieg0tFBoO562Qu
	oFI5l83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4gI-0000000BGaa-1Rpe;
	Fri, 12 Jun 2026 16:24:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4g9-0000000BGSE-1ylQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 16:24:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso14041725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781281459; x=1781886259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ow6Lcgf/RFgv5jAm1y7NuVlWFYYd0/JrOjI+zfS6dAY=;
        b=JJ80jNnFBUy3tJ7b6whMLVyL7GnunQNC0dj8qD/3IGqI4485LwuZLGadj6fVdVo0Tb
         EQL276qwlx6SW+Ya5mCf+1Ao0/IqmWJMm8eobCfD4mcWfTvyf5A40zjEimwjeb20HXST
         98MrPqf6+KjUshaDN01vv2b/zIMBLEmqpTmb6gn0X++VpUn1GFj3LegAjAehRCzMHHav
         FfyPdTADEb/ec+oryBCr8DO0R+h6Y9CakvqMLk7fQAN+U3QMLL12D/pvJ5Alm/nN/Aem
         ew/t7q4ZqPXqBpM7LrhxT0AXI7sAjR0rKyNijfglUSJIxGk2kg/06MjvwzarBD5sr3tM
         XtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281459; x=1781886259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ow6Lcgf/RFgv5jAm1y7NuVlWFYYd0/JrOjI+zfS6dAY=;
        b=Ux1OTTVJ3+UbBfB4AFh3oceU0hUiBw4bG64Hd/ZwGW8rWbJgZcfheVtrvUsz8m0Vaq
         kkPkZxFkLjkDcQPgAIgJYhS6fSqY+3KKJfqiYdAx5aTSz1KH5TbCRL0awjj4t8a+TyBe
         scR6yloaKhcjMmSHqeZKh8cykKZc0npa1L80+t1xl5q9Uk3qF9l4k+8+cy8XVUES5yNc
         n4K8+eSln/pMx1J2BSB8suL/PDL4GGDaXOF6/bGldNdVWQ1qdpXwSvJQogWgl0cpBs/g
         NERtRRrDa58RNH9ReynP1da7ykUZpuHVKDukWwtBsBDDX7ODe7WUL7MbaIPfBghwKBah
         e+MA==
X-Forwarded-Encrypted: i=1; AFNElJ+e5wCdNY2IAC/Fp/Ux8l+NZsg6XUCqknHMrolZS6QH5cepQAdNAMlPzwgx2dhfHFItDMoysS3PEOwAGDBQH3Fq@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQ574xD1AW+fyJfmZgN+DA/GicX+GqMc1AO1dX+iNaFLy3uOP
	RpreMF+TZtsIuE5bRI9bKOdePAi24Sq58BpmN0SaTSnBXku1WnfEBCdh
X-Gm-Gg: Acq92OGZANsfI32Gdaw8mo8r6/1+3Yv2Sf9OAfcI83WEJ5zgW7px0Q6KxnKmMlswbGT
	CvakWp0ct0Jq4sZITaGc2YvjLsNz1KBQU5fwhUKf7i4KgtdgyU6c9vJsHzn9dYASWXuxXUv64vf
	kS7XJsqdEOYgFdaaypAi3ugVTfp5GK0EqkjLa9l4eazKwnAN2mJxr/wiS8BaDuSOU8p+iraqArm
	NW7eFXkLXP4+rsfPHDwHk1deaKfLjWp46b/FxArTF+2bmm4Rbdrx71uY0CN7j09twk8RjWSXK6t
	gWAFAKI7kCLCxXnvamCZfPWqES3Os+nk1DPPbzVvTPCBKu0kMA6Cb9BxfHMBztdJusZjo2QeJru
	+CtP0E90W586uScsDMVkTyL3/rtFEPMlzIzTGgSQ0dqlPO0veu2wR4BHmQ+kTSz0s5pcbykJKxV
	XJaTt52L4seilgOuTugQ9MzkYu7n8grQrilkHORxihYk98QklPw/5Or+duQRgKxw==
X-Received: by 2002:a05:600c:4e48:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-4922005e235mr2153615e9.7.1781281459529;
        Fri, 12 Jun 2026 09:24:19 -0700 (PDT)
Received: from f4d4888f22f2.ant.amazon.com.com ([15.248.2.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c51dsm57620935e9.1.2026.06.12.09.24.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 12 Jun 2026 09:24:19 -0700 (PDT)
From: Jack Thomson <jackabt.amazon@gmail.com>
To: maz@kernel.org,
	oupton@kernel.org,
	pbonzini@redhat.com
Cc: joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net,
	vladimir.murzin@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	isaku.yamahata@intel.com,
	Jack Thomson <jackabt@amazon.com>
Subject: [PATCH v5 5/5] KVM: selftests: Add nested pre-fault test for arm64
Date: Fri, 12 Jun 2026 17:23:53 +0100
Message-ID: <20260612162354.73378-6-jackabt.amazon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260612162354.73378-1-jackabt.amazon@gmail.com>
References: <20260612162354.73378-1-jackabt.amazon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092421_570636_AAE2CF10 
X-CRM114-Status: GOOD (  23.00  )
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

From: Jack Thomson <jackabt@amazon.com>

Add an arm64 nested-virt selftest for KVM_PRE_FAULT_MEMORY. The guest
enters vEL1 and exits to userspace with a nested/shadow stage-2 MMU as
the vCPU's last-run context.

Before prefaulting, userspace enables HCR_EL2.VM and points VTTBR_EL2 at
an empty nested stage-2 root. A prefault implementation that incorrectly
treats the userspace GPA as an L2 IPA will fail the ioctl; the correct
path swaps to the canonical stage-2 and succeeds.

Restore the original nested state before resuming the guest, then touch
the prefaulted range to check that vEL1 still runs correctly.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/arm64/nv_pre_fault_memory_test.c      | 200 ++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 4609d8f23e38..63d79245b47d 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -170,6 +170,7 @@ TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
 TEST_GEN_PROGS_arm64 += arm64/hello_el2
 TEST_GEN_PROGS_arm64 += arm64/host_sve
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
+TEST_GEN_PROGS_arm64 += arm64/nv_pre_fault_memory_test
 TEST_GEN_PROGS_arm64 += arm64/external_aborts
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
diff --git a/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c b/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c
new file mode 100644
index 000000000000..2bbd5540599c
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/nv_pre_fault_memory_test.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * nv_pre_fault_memory_test - Test KVM_PRE_FAULT_MEMORY on a vCPU whose
+ * last-run context is nested.
+ *
+ * The guest starts at vEL2, mirrors its EL2 translation regime into the
+ * real EL1 registers, drops HCR_EL2.TGE and ERETs to vEL1, then exits to
+ * userspace from vEL1 so that the vCPU's last-run context selects a
+ * shadow stage-2 MMU. Userspace then enables an empty nested stage-2
+ * before prefaulting. Prefaulting must target the canonical stage-2,
+ * regardless of the vCPU's nested state.
+ */
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+#include "ucall.h"
+
+#include <asm/sysreg.h>
+#include <linux/sizes.h>
+
+#define TEST_MEM_SLOT		10
+#define NESTED_S2_ROOT_SLOT	11
+#define TEST_MEM_SIZE		SZ_2M
+#define TEST_MEM_GPA		SZ_1G
+#define NESTED_S2_ROOT_GPA	(TEST_MEM_GPA + TEST_MEM_SIZE)
+
+struct nested_s2_state {
+	u64 hcr_el2;
+	u64 vttbr_el2;
+};
+
+static void guest_el1_code(void)
+{
+	u64 offset;
+
+	GUEST_ASSERT_EQ(get_current_el(), 1);
+
+	/* Exit to userspace with the vEL1 (nested) context live. */
+	GUEST_SYNC(1);
+
+	/*
+	 * Touch the prefaulted range. vstage-2 is disabled, so the shadow
+	 * stage-2 is a 1:1 view of the canonical IPA space.
+	 */
+	for (offset = 0; offset < TEST_MEM_SIZE; offset += SZ_4K)
+		READ_ONCE(*(u64 *)(TEST_MEM_GPA + offset));
+
+	GUEST_DONE();
+}
+
+static void guest_code(void)
+{
+	u64 sp;
+
+	GUEST_ASSERT_EQ(get_current_el(), 2);
+
+	/*
+	 * Mirror the EL2 translation regime into the real EL1 registers so
+	 * that vEL1 runs on the test's stage-1 page tables. With E2H=1, the
+	 * _EL1 accessors read the EL2 registers, and the _EL12 accessors
+	 * write the real EL1 registers.
+	 */
+	write_sysreg_s(read_sysreg(sctlr_el1), SYS_SCTLR_EL12);
+	write_sysreg_s(read_sysreg(tcr_el1), SYS_TCR_EL12);
+	write_sysreg_s(read_sysreg(ttbr0_el1), SYS_TTBR0_EL12);
+	write_sysreg_s(read_sysreg(mair_el1), SYS_MAIR_EL12);
+	write_sysreg_s(read_sysreg(cpacr_el1), SYS_CPACR_EL12);
+
+	/* Run vEL1 on the same stack. */
+	asm volatile("mov %0, sp" : "=r"(sp));
+	write_sysreg(sp, sp_el1);
+
+	/*
+	 * Drop TGE so that vEL1 is a nested context rather than host EL0.
+	 * KVM backs it with a shadow stage-2 MMU even though vstage-2 is
+	 * disabled (HCR_EL2.VM=0).
+	 */
+	write_sysreg(read_sysreg(hcr_el2) & ~HCR_EL2_TGE, hcr_el2);
+	isb();
+
+	write_sysreg(PSR_MODE_EL1h | PSR_F_BIT | PSR_I_BIT | PSR_A_BIT |
+		     PSR_D_BIT, spsr_el2);
+	write_sysreg((u64)guest_el1_code, elr_el2);
+	asm volatile("eret");
+
+	GUEST_ASSERT(false);
+}
+
+static void pre_fault(struct kvm_vcpu *vcpu, u64 gpa, u64 size)
+{
+	struct kvm_pre_fault_memory range = {
+		.gpa = gpa,
+		.size = size,
+	};
+	int ret;
+
+	do {
+		ret = __vcpu_ioctl(vcpu, KVM_PRE_FAULT_MEMORY, &range);
+	} while (ret < 0 && errno == EINTR);
+
+	TEST_ASSERT(!ret, "KVM_PRE_FAULT_MEMORY failed, ret: %d errno: %d",
+		    ret, errno);
+	TEST_ASSERT_EQ(range.size, 0);
+}
+
+static struct nested_s2_state enable_empty_nested_s2(struct kvm_vcpu *vcpu)
+{
+	struct nested_s2_state state = {
+		.hcr_el2 = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2)),
+		.vttbr_el2 = vcpu_get_reg(vcpu,
+					   KVM_ARM64_SYS_REG(SYS_VTTBR_EL2)),
+	};
+
+	TEST_ASSERT(!(state.hcr_el2 & HCR_EL2_TGE),
+		    "vCPU should be in nested/vEL1 context");
+
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2),
+		     NESTED_S2_ROOT_GPA);
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2),
+		     state.hcr_el2 | HCR_EL2_VM);
+
+	return state;
+}
+
+static void restore_nested_s2(struct kvm_vcpu *vcpu,
+			      struct nested_s2_state *state)
+{
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_HCR_EL2), state->hcr_el2);
+	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_VTTBR_EL2),
+		     state->vttbr_el2);
+}
+
+int main(void)
+{
+	struct nested_s2_state s2;
+	struct kvm_vcpu_init init;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	u64 npages;
+
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
+
+	vm = vm_create(1);
+
+	kvm_get_default_vcpu_target(vm, &init);
+	init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
+	vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	npages = TEST_MEM_SIZE / vm->page_size;
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_MEM_GPA,
+				    TEST_MEM_SLOT, npages, 0);
+	virt_map(vm, TEST_MEM_GPA, TEST_MEM_GPA, npages);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    NESTED_S2_ROOT_GPA, NESTED_S2_ROOT_SLOT,
+				    1, 0);
+
+	/* Run the guest until it has ERET'd from vEL2 to vEL1. */
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_SYNC:
+		TEST_ASSERT_EQ(uc.args[1], 1);
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	default:
+		TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
+	}
+
+	/*
+	 * The vCPU's last-run context is vEL1, backed by a shadow stage-2
+	 * MMU. Enable nested stage-2 with an empty root so that the ioctl
+	 * fails if it tries to interpret the userspace GPA as an L2 IPA.
+	 * Prefault in two halves so that the second ioctl exercises a
+	 * repeated shadow-MMU attach and canonical stage-2 swap.
+	 */
+	s2 = enable_empty_nested_s2(vcpu);
+	pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE / 2);
+	pre_fault(vcpu, TEST_MEM_GPA + TEST_MEM_SIZE / 2, TEST_MEM_SIZE / 2);
+	restore_nested_s2(vcpu, &s2);
+
+	/* Resume at vEL1 and touch the prefaulted range. */
+	vcpu_run(vcpu);
+	switch (get_ucall(vcpu, &uc)) {
+	case UCALL_DONE:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	default:
+		TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
+	}
+
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.43.0


