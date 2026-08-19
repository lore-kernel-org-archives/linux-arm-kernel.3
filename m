Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E817C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yRbZXjon4rpFYxflr/N9botiLzLz0TZjPgpbneMm6g=; b=B0SUeda8q39cxlhM3idFYz52E7
	aX/kp+ZxSM2AOfNA/7TnDGgubvmnSdppXnMLCjsQbu064ZthWvbkitV9kHBy6E9D+iRIo+BrQY73H
	d5Mp9RXgGdnFe9xNuDCDAXDZ87xJNWS4nKMAQHQqD6y8drQyGykfn52EJM9onZJKuWldPmEem5ral
	0qqI6x8OqNtWbTF8/XOwyDxB4B3Vc5Jmt2PnEiPIezo5fdgz5UTeDAbhLwFvKHKUx2oYG0Agwfswy
	3W/z5vnq1vuu/59WlK+ls+4WkiuoC02pbYyZGP+B/W8wi/2hqvqlUtybw41pi3tXAF42ILYZ/nbNM
	MPqlwwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwp0C-0000000AccH-0zXO;
	Wed, 19 Aug 2026 22:43:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwp04-0000000AcY5-49jo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:43:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-472326ca506so1045480f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179391; x=1787784191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yRbZXjon4rpFYxflr/N9botiLzLz0TZjPgpbneMm6g=;
        b=jED/GDIY8aMM+AYPAh3s9+RZLhD1XKg3iQkgmPLsHEZE+jCpUPSoCT9RBt9f43LWI/
         8btwFax3KhHyUBdqZS4wgbm2FNF+Hzko9uAUSD/JjawtC/EMJvr8dnIfGvy6XqYSL3yh
         UxGAfbVzwTg0GiFws7391rQbuWEPi1J2FJAhZ8K7K/S+bzfZ+R7riCzYft5Y1R38InhK
         9MDJphA8rGJzixok/WPjJGibRNyAH4YB8Ou6rzmmGx/VNcxN+ezyUqy9fr2MsUNQwTWI
         dNfA1lxe2y5Xkd5A82I4u5maYOe1q/B/sxIxyDBBWLb6axDGKiQ/FoEM23LU5+sRhV+p
         u4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179391; x=1787784191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8yRbZXjon4rpFYxflr/N9botiLzLz0TZjPgpbneMm6g=;
        b=hY65gFThhkSyYAWhudIN0hReXgg4wnmhEAjc5UcQUbmZr8vZ6pvZNNcoasULce1lZa
         tKKdMPKtPNFvqRPNNe6VPSEpsmZZoeRIUvjJ9mbGOwNl7W1DR3wvaud2gO1z4sXnc0Bo
         MSDNv7oIGCZc/qCujD6s7abmPGdthMMJ71RURqNp4WRl1VMw65g7mOFjKTcR4DCj8oxt
         lwHbvIxR44dZkq6xoKSTzSbPSNQZ/fkSu4KEcdPFyuX9FMR/CO+ZO23PhYp5xLAaGfKe
         dPWTJ8+KjHcWVZly2US4YvWasWAURSMSfd/dKzIMEbbUIgkAwSE4DVlT5rU9+DYtFY37
         VW3A==
X-Forwarded-Encrypted: i=1; AHgh+RqClDvHUyIvg0zMA/3Qk0/nOirIgzzJlxCAlVJlgh25uxw+Ccr/yXF7Zu5gVGxzyJDJ6tfEPgYVAggupphEtXSL@lists.infradead.org
X-Gm-Message-State: AFuF++mMMYjS23d1gAF/nFMENGJynpFFwF7hIOnWIdeumr+qGQiNMq3r
	4/OFhG+/4oac7cr2rXYI8EFQtxD8/nxNTngWH74EE1pSTiBSxb2hUgXi
X-Gm-Gg: AR+sD10aOXzc39y7e10OwDIMmm88Hk70/5khFnF6d4knlA6FrthftAXj7rmJZJ/Jtv2
	tjS8IrlNk+wUmlq/iYDIOI7FjKC27vg3OAie0kpR569cftAFgixdZReZoxBm2Zo0SdEeRWj4eCk
	wpgadVDjVd8aFRmY68/GcoBpQzTvIm7nnTUu4Ehun10VQoSQXo3/xB2JMCCLcvsAAdSRGMZyeEQ
	lOW71btolpKc5XK42/YQy9VfKBPa83lDDQ6lREuClDdINBwl8vyWlhSeMnAz6SxkoqY4207TY9u
	MKaWX0+v58c0u34r/QC8bqS40ZR0lTRhysVGEQqr1O7MAeC9t/XIwddH0qxqEN+zO7DR/mvT7Eb
	gmKKVYulrZdhD4ftIQAT29eLr+2nMG8HmtteMRLqhzv2ehhu/X73ttEd87HLPAZ4eIP3aJut4qb
	+s6XmE8R8JpQPNFX7YuZm2KL69XBUwjMUkwoLIRrM2/mnUYOB3VYglNpYOyFJQGzffCrAzxhI3L
	TVm1iSn6tMjhC2L4liCXzfo3tg9CeNzBky7kRGKOtr1WaG38A1n6O5lNTdWWI1sqmh+01atsfTt
	Gt3PE8bSi17r/KyGACgIOPMVjY7WepLQY1o94y5XNqpjfS9luJRm8HeQG5tluuiCvIs=
X-Received: by 2002:a05:6000:715:b0:47f:86d5:d1d7 with SMTP id ffacd0b85a97d-482b1e957b9mr16809030f8f.6.1787179391108;
        Wed, 19 Aug 2026 15:43:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.43.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 5/5] KVM: arm64: selftests: Test VGICv3 redistributor region retry
Date: Thu, 20 Aug 2026 00:42:29 +0200
Message-Id: <20260819224229.82948-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_154313_062983_2F16F053 
X-CRM114-Status: GOOD (  17.24  )
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

A failed REDIST_REGION write can remove redistributor iodevs without
clearing their cached vCPU assignments. A retry then skips those
assignments and leaves the redistributors absent from the MMIO bus.

Create two partial regions, reject a third region that overlaps the
distributor, and retry at a valid address. After initializing the VGIC,
have the guest read GICR_TYPER from all four redistributors and check their
processor numbers. This verifies the final configuration without assuming
that assignments survive the failed write.

Keep the redistributor IPAs outside the guest RAM memslot and install only
the stage-1 mappings needed for the MMIO accesses. If an iodev is missing,
KVM_RUN therefore exits with KVM_EXIT_MMIO. Without the fix, the first
redistributor access exits at 0x8030008.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 91484fd4f786..6d9998c764bc 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2020, Red Hat, Inc.
  */
 #include <linux/kernel.h>
+#include <linux/sizes.h>
 #include <sys/syscall.h>
 #include <asm/kvm.h>
 #include <asm/kvm_para.h>
@@ -13,12 +14,21 @@
 
 #include "test_util.h"
 #include "kvm_util.h"
+#include "gic.h"
 #include "processor.h"
 #include "vgic.h"
 #include "gic_v3.h"
 
 #define NR_VCPUS		4
 
+#define REDIST_RETRY_REGION0_BASE	GICR_BASE_GPA
+#define REDIST_RETRY_REGION1_BASE	\
+	(REDIST_RETRY_REGION0_BASE + 2 * KVM_VGIC_V3_REDIST_SIZE)
+#define REDIST_RETRY_DIST_BASE		\
+	(REDIST_RETRY_REGION1_BASE + KVM_VGIC_V3_REDIST_SIZE)
+#define REDIST_RETRY_REGION2_BASE	\
+	(REDIST_RETRY_DIST_BASE + KVM_VGIC_V3_DIST_SIZE)
+
 #define REG_OFFSET(vcpu, offset) (((u64)vcpu << 32) | offset)
 
 #define VGIC_DEV_IS_V2(_d) ((_d) == KVM_DEV_TYPE_ARM_VGIC_V2)
@@ -65,6 +75,22 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
+static void guest_check_redist_retry(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < NR_VCPUS; i++) {
+		u64 base = i < 3 ? REDIST_RETRY_REGION0_BASE +
+				       i * KVM_VGIC_V3_REDIST_SIZE :
+				       REDIST_RETRY_REGION2_BASE;
+		u64 typer = readq((void *)(unsigned long)(base + GICR_TYPER));
+
+		GUEST_ASSERT_EQ(GICR_TYPER_CPU_NUMBER(typer), i);
+	}
+
+	GUEST_DONE();
+}
+
 /* we don't want to assert on run execution, hence that helper */
 static int run_vcpu(struct kvm_vcpu *vcpu)
 {
@@ -462,6 +488,70 @@ static void test_v3_new_redist_regions(void)
 	vm_gic_destroy(&v);
 }
 
+static void test_v3_redist_region_retry(void)
+{
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	struct vm_gic v;
+	struct ucall uc;
+	u64 addr;
+	int ret;
+
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_check_redist_retry, vcpus);
+
+	addr = REDIST_REGION_ATTR_ADDR(2, REDIST_RETRY_REGION0_BASE, 0, 0);
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION, &addr);
+
+	addr = REDIST_REGION_ATTR_ADDR(1, REDIST_RETRY_REGION1_BASE, 0, 1);
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION, &addr);
+
+	addr = REDIST_RETRY_DIST_BASE;
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_DIST, &addr);
+
+	addr = REDIST_REGION_ATTR_ADDR(1, REDIST_RETRY_DIST_BASE, 0, 2);
+	ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+				    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION,
+				    &addr);
+	TEST_ASSERT(ret && errno == EINVAL,
+		    "register redist region colliding with dist");
+
+	addr = REDIST_REGION_ATTR_ADDR(1, REDIST_RETRY_REGION2_BASE, 0, 2);
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION, &addr);
+
+	virt_map(v.vm, REDIST_RETRY_REGION0_BASE, REDIST_RETRY_REGION0_BASE,
+		 vm_calc_num_guest_pages(v.vm->mode,
+					 3 * KVM_VGIC_V3_REDIST_SIZE));
+	virt_map(v.vm, REDIST_RETRY_REGION2_BASE, REDIST_RETRY_REGION2_BASE,
+		 vm_calc_num_guest_pages(v.vm->mode,
+					 KVM_VGIC_V3_REDIST_SIZE));
+
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+
+	vcpu_run(vcpus[0]);
+	switch (get_ucall(vcpus[0], &uc)) {
+	case UCALL_DONE:
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT(uc);
+		break;
+	case UCALL_NONE:
+		if (vcpus[0]->run->exit_reason == KVM_EXIT_MMIO)
+			TEST_FAIL("Unexpected MMIO exit at 0x%llx",
+				  vcpus[0]->run->mmio.phys_addr);
+		fallthrough;
+	default:
+		TEST_FAIL("Unexpected ucall %lu, exit_reason %u",
+			  uc.cmd, vcpus[0]->run->exit_reason);
+	}
+
+	vm_gic_destroy(&v);
+}
+
 static void test_v3_typer_accesses(void)
 {
 	struct vm_gic v;
@@ -986,6 +1076,7 @@ void run_tests(u32 gic_dev_type)
 
 	if (VGIC_DEV_IS_V3(gic_dev_type)) {
 		test_v3_new_redist_regions();
+		test_v3_redist_region_retry();
 		test_v3_typer_accesses();
 		test_v3_last_bit_redist_regions();
 		test_v3_last_bit_single_rdist();
-- 
2.39.5 (Apple Git-154)

