Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF744C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgxKhL7A1XKhNVrAX+Ck+KuNZ6TSYMACVM9Vad6BlYI=; b=X3xJY1GQNvq6fIkHNuSKWIr6kO
	PLP8bEymmlc89s4CeFs5pf0ES73osJg6yBEmfyWH0uS+o1KiyJb7I6H6YUJCusf+L11KV9x3cD66O
	o9G+9zNMrGtX7OV/o5hb1pp7iA2I0RgjoLHOf6Egf4kQ/CVJSeR87MRgDDY6GOvIeGKUGBbcOZ9bf
	GxJr8IasvhHG7tFwyVzRgqOsiw+cD7X388JVvnxEDdmMHlwt6uM+IIC4OHwjUYw1GL2klE4FmSghl
	uarLE3fLI4nguSuLmE8vZJkDypJUQQAvtJGAPXWw7TVJ4riB3r4fq9TyqeuSbYfJaIsa906kpKJhy
	FoodzjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x66-00000008nhg-174D;
	Mon, 31 Aug 2026 08:10:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x63-00000008ngB-20UX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:10:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so36102765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163826; x=1788768626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgxKhL7A1XKhNVrAX+Ck+KuNZ6TSYMACVM9Vad6BlYI=;
        b=Dm3DTq5siDlp7YviF6e8vei2XP6IbDjeKwN3baZSNW+zwsVYfsXxgftlAnHDJrd3cu
         ayZ/f7g0uKHVHEFYxwzJk5nZl55u/0odAQtUlWRTs1qPvCm+3K170Hi3yuhOc4ZgAyUF
         n+huSSCikVYzkuyp+naC1FKedEO4rqRHoHjSEKLEZXfigJO4cMzD+3YFEZCRj1VCY2Gk
         SPVF0iGHaOW5ZFydYonMAJCjBBZ2M3z9aQTFrXsKdzB1Qr3SvpcUO8aflpeVMlE+RMkp
         dGh/Cs/ErWcrHBNViQ08+rj5mHx2HnoM/PZ3xX7BKEjWFZJ4iu3Dae1kJe9NxXxnWBCG
         q52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163826; x=1788768626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgxKhL7A1XKhNVrAX+Ck+KuNZ6TSYMACVM9Vad6BlYI=;
        b=OwPQZoTHX6Tgi1SnqeTcfENokI6cEgVVqfVDzcVEwLe0hdMJ57QAhGR593qCzFIXyj
         vSh1E1zFwtmYU7PqBIz6tAvumTIbzLb3t+pJyaNXwnWux9owu/Nf6sWneLD0JlGP7UrR
         sTk6S0BbDf5AuP4FeWBfUBXC6koBAXa3+UgtkyYCfhmwLVNwEQLNCIWq26eEp70vaSQr
         +lHuQgGC4YGK+GXX/L2OcZ/rWJJF5nSfBg7KQnF1Fe1c13f0yKi86+PDMpCBDdllTi9u
         UEG3WRHi+eoOuUxVjc2FfYV6esW3GzYVz6wDNlN35xWbgvQ/f0kVOPPi1r4KHUsKqmI6
         LG2w==
X-Forwarded-Encrypted: i=1; AHgh+RpS4i/6Il78pkUY/GJrDoSlW/17ftyZfeePyIM8vUo/UhVY/Z65r1PdD9t738gcgQS+rWdsvCFySWueJVmJTiGX@lists.infradead.org
X-Gm-Message-State: AFuF++ngt2xSsELIUX+GT3vZS7XEQksrj8Fz9ej+cQV9qA2dW2Mo24qo
	XORL+LyAZn7VWaoGPZmKTG/QeLj3BJXCBQmadGOrPWakRm332Ipr8nRi
X-Gm-Gg: AR+sD112AG1GFQFNJ2r8B19rDvbp+ociVOX3niH/GE6efWBlAJ8LVZSZ8WYFP055Upq
	rmvOMi1XJQVMPmNx7zwkZizuhttEZEiF7SqcJaV7djnHHTd+nqWHqjFxJmWNmSSFvWybrxpqCMR
	Yhu9DO4rvm1Rrr+KLLDXbOSPhpEB+ISc5JjHiSUHJJYukCs/IkNzV7PB2UblH/sEe1AKFh65JPM
	PcRs1Vfu6E/oY5FG6L6y7PVSSY9hwBSu0waTiBqAGTXaW8G1FbK/XBSLi3ZTLdSSC3jvuZ/a55u
	BiP5y6l/WH5B2FckPjNKtD4ULzFyerW0RCMMvq8TIdvwT2PtQNbOwwhDwPgNpNenKZonsNaN/Kz
	i8Jsl8NpA9LnYXtD8p5HbEppu+GsL7SF3ZZc0Cra+2rZ+bGC8tTKBPEbp4a8xgmFJJDsy3LPBWD
	vWOoEsWOvh2oMeCcstziNA/Mbcv5ACMhXvRBx28wuxTciyHqQTnZapY7mNAffNKDSV58tCHoHeb
	O1nBaJCb+rZ2zSIUOPZNnVHmapurwB6j0kUUaR6prmyqzhhA88i4AARyX/ZbXGlQwSJ/PPjNyJ1
	ci0gYBvxj8fxWH1WzC6eWWWqz6T1NPpOTSldaZTBp23XDRQZRpeXcsCRqJXoyzEVV0Px1ac=
X-Received: by 2002:a05:600c:3155:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b91c3dcb4mr350375865e9.9.1788163825607;
        Mon, 31 Aug 2026 01:10:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:24 -0700 (PDT)
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
Subject: [PATCH v4 4/4] KVM: arm64: selftests: Test VGICv3 redistributor region retry
Date: Mon, 31 Aug 2026 10:10:04 +0200
Message-Id: <20260831081005.41346-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011027_553785_38529DC9 
X-CRM114-Status: GOOD (  16.80  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
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

