Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367D8C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GYqiFSBk6xbMl7ANfKl+0h07k1nsbqa00/KuNdgbGU=; b=SOlZh0nxPp8C6SkzFOejtts8Ln
	fHpm59+tYoekzzc5ReEls0mIiScBluCz+Q1dzAQRCo5RvMGqhNqwkcOe+W8emjhjLT47fDV3L414D
	v2akWJTYcJhAeuzu2FSOpX1yhCfmTa5wzVX5hQ4NVO+GSU5SyVYbuOxYiERDf+OuG3Js0xZJ+DEgS
	OwnvfNHo2UQZVMMICPYMY7Q0YVqLp1vNH7qKsSmvbGaFgic2/rgSThGoDt64bngd1iRk2z2R+SiD4
	cR05Q3avtF/vCAWlJxpCSKhTeJjpThNHHV9KSZcMYUbj29poLqZjADGebfkaa+IOnpNepy4ZwlOsa
	xiiL6RQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQa-0000000ERUd-3WER;
	Sat, 22 Aug 2026 09:54:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQS-0000000ERQ3-0e80
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:54:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso3079874a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392446; x=1787997246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GYqiFSBk6xbMl7ANfKl+0h07k1nsbqa00/KuNdgbGU=;
        b=CIbEAsxOnshmEcYYXqAiqhYJVmd3r7z+seYK7zcPoIJRaAbE/JLMf8UXd0P76LCclr
         fWCQVHfeqjoFPOzpUBwkIM1OLaxxQ86lKo+p2UFbSp5Dta+vCEoCWDFFJHSpp0846lbg
         khJ3MGVpg1UwPiYvnbWz3qxGEnPpJXNRbi02anCtHFbqJoLCDqSG4A2Lq2KOb7viMMQc
         XpGkiTeB4HUGEEtqzUCfz0t0WzxzdpaW15GKjYL9yorTUCM/lIh1OH+h8lrDDoQzJKJk
         4F2H/0llQ/vuQU6UXCe8OUMtSlfI46Bn4035xUNTopk5+m1NCeV548LG+Gd+0boSVldc
         6xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392446; x=1787997246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GYqiFSBk6xbMl7ANfKl+0h07k1nsbqa00/KuNdgbGU=;
        b=PlPdZgkRacKrVY7kqCNOfEjNiDrdOj+Y0qZUd7LzhmiiOqno4PfGuJ/DNXIoYV7YZ5
         /i4x2zqsE8sTVdEAQKSiOcbJkwQGHg6eJN9ESHgbtT7rv8ipPEIq9xpt+eIrts8o8UUv
         qOV85eWOrPpFrThasdbEbvVsXxrhHZ//NBV31hovV/EY7vvTwJt5SfeT4wrf84nNLnZH
         rdb7EY35E10/djRPMoyf6mo0tmW4/12SAO/5/z62FGJ7DOIQBNOtOI3D0f74rGXm3EYK
         9kJwkoG5heMFKZpCfwU+NgdHwxN4u9utZYmy7J6VCNFQ3k66c/tp0KFlFO6jKFC56wsO
         ZcvA==
X-Forwarded-Encrypted: i=1; AHgh+RoENRu+1Uo8WeulSx/pvVtPvxP+V0XHRb6NRhUI/5gd4oXpHaMeheimTtHFw6f5T0WWgQ/vKQgjd3ggXubf4DHu@lists.infradead.org
X-Gm-Message-State: AFuF++lOiCPpnRRN2ENzoz9MqFVwYDoJrQekCWPAcdKnF7ODeBZyZHte
	WPVu8M/quWdhuaY1T71YFDvIoBHwGEiQ2cdKw6IExEPZEV2mldbBi9lv
X-Gm-Gg: AR+sD13MXfazUJEtrakygqwTYT6evvsh4Ub4Qd7cfamUM/FhjfYLGuUoGEFkrkUFaDR
	3JqIBcWCt7/ABvlVdMqAockegRKa+732fpAzL91cTqmV4t8T86ka9z3zMBbydBQi4+wB0KtfU5+
	11CfeYPHi/9Pp46x+8Y/fhn5NbSEALsafYKLaEEgoSqqIJX6bSeqH5l3T9sWVVAg+Fn0bga4Xor
	uc8El9tpbrP6UUwwucGb608MalzGVomnORnzKWenmlU0CoBeOuImoXD/NP5MjhKDa3l0/jD+qLx
	iiaf+vfe39iUgsrALLCzuHBNQm4sfR5tPWFBVDOaZRDGNeh8vuXOdjuTH8sEWR4R/NY8XKV1kyA
	Z6yIltPBaG4BgrQEhW52xO3Z/cEkPBnCTZ4lKiKYkxCuc3M3CVqWiTnqUo5lQs/kH2rOs212QdG
	nsIELHn8QEja0qpahI+fHCG8TMlwEf4SRw/IQyldw7PUv2ySD+AmPlIcQtIsc/BReizgG82LCqz
	O+ebkIfH+r8UJ1zIOb+fJFR39KtF66++PQ4NMcR+1Im/PgxnoBng4cHwlCT798rh2qO39abQzCx
	vzaqOuCTiOYlwJXx7vEcpY4kPJ00yUEMXht5FIlJ7mzAjmv4FXgVVvGxl5p+woxvn6TO
X-Received: by 2002:a05:6402:42c4:b0:6a3:e813:8457 with SMTP id 4fb4d7f45d1cf-6a42f1f9e90mr13698572a12.12.1787392446101;
        Sat, 22 Aug 2026 02:54:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.54.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:54:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
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
Subject: [PATCH v3 5/5] KVM: arm64: selftests: Test VGICv3 redistributor region retry
Date: Sat, 22 Aug 2026 11:53:46 +0200
Message-Id: <20260822095346.53882-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025408_239489_A1F5D696 
X-CRM114-Status: GOOD (  16.78  )
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
 tools/testing/selftests/kvm/arm64/vgic_init.c | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 84aa97204b7f..5a30f3cb039b 100644
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
@@ -65,6 +75,23 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
+static void guest_check_redist_retry(void)
+{
+	unsigned int i;
+
+	/* The first three redistributors span adjacent regions 0 and 1. */
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
@@ -462,6 +489,70 @@ static void test_v3_new_redist_regions(void)
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
@@ -986,6 +1077,7 @@ void run_tests(u32 gic_dev_type)
 
 	if (VGIC_DEV_IS_V3(gic_dev_type)) {
 		test_v3_new_redist_regions();
+		test_v3_redist_region_retry();
 		test_v3_typer_accesses();
 		test_v3_last_bit_redist_regions();
 		test_v3_last_bit_single_rdist();
-- 
2.39.5 (Apple Git-154)


