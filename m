Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32C6C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsPt5mg15Oj99hJ3f/oZG/2r0/ISQ2OwxSu7NKxi9WQ=; b=19o7LViCG0rVMHRs/1+V/S3a2g
	jAHYvCbvrGzKA0jfy8AMhar4HsZYMpskCT0NZdYRtMGrQOKEdDFy3KMvqAYCR/nBEspmAAzHRulev
	ivpGft8mxnI5UIEzOdhb2ERwndBIGNy0x63DPA0XYtBurSGGCcTQYwQLjB5UuCU2JpXYFYpAcCfVB
	LWLNwsm/RUZIXnsPjtxZoDEGz3sz7rHwgqnh2uMfQK1zZ6GUesqvO96CirNhSAzBoRJX2Ibs/HoZD
	0x9Z7USn3FrXZ5QVj0MbWk+HtHTpgm2rfRXeXbs7wm+7rSvOwvJkuD2yc5L1Bdk4Fr3Gm1viiLGEc
	Utj5V1cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDa-0000000BufL-1VI9;
	Fri, 26 Jun 2026 21:36:10 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDR-0000000BuSN-3Bds
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:36:02 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-845ba254a4fso933080b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509761; x=1783114561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NsPt5mg15Oj99hJ3f/oZG/2r0/ISQ2OwxSu7NKxi9WQ=;
        b=d9mhQoaqobcNE928JAt/YI3iUnWoLZnmRCgMec42MrBLo/4WXS90LJ/6R9DHMVLX5C
         x43mJG6+XS9Pj6wBzVWljJ3tw6hnCBxmF1qx3qPYyecnrfujLST+6AIGxeiYMGzj+3jD
         mnit/oDKWfbsbZMURh6Q5sz647Ncjir10/AoodRlkZ9NPrkvMQggrV8NDnkzUE2bQGFr
         GXP56doOHbz899l/6SVD9MZkVKWQeUHHV7pL/z0nISOEQBtEg+EajCM2DgMCGnlQoQMu
         2XcY6GOuJN6Hi3z0PMTMX2eo/s+foZ/hYd/DpyB2S7KYDo4+7Q7CG+qob5CkNSKJeT6x
         GACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509761; x=1783114561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsPt5mg15Oj99hJ3f/oZG/2r0/ISQ2OwxSu7NKxi9WQ=;
        b=hdalj8VDuBU7XoUibPzXQUbBFcQTnGm/veaBHCAwxFQTvXD7htDYwsenhn0efGLWkf
         BX1NUrZuVwhPkswYp76Ocpw7jrX+z3JbDO6Auye65SprzlkpPHgjf03JMqFtVMO8xEZL
         u0sONC4wQv1Xr4lvSmIVHYl/tIl63UjGO3aMK+xkAe0XmrRfPb32qHP3caj5OvawwSGj
         6UlZlst5ftpzCdH4Q69M9AdVCNd03eZK17mVvW9y3N3roFk5DrIXcrB6Sryr4wsr2YpB
         rlrGxsqe4iBpcBFK6PIz2GsMV6XOvUIpQTqPP1bf/tlUjtnRPOZllghkL1pKJWea3No9
         g1QA==
X-Forwarded-Encrypted: i=1; AHgh+RoB1XRUXGwbIEgVc8HVnq+ql3poA65nJsTeoD0ofyd2jSsL379DW0H+xKotp1gMHiP1AItYieR4tZmnDsw5zfK4@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPMeT92t4HYMK7F/6ypRyZ0oZVNSJsL5A6Vsl0J9+dPnd+zUI
	DtvHuOYtYP7WeFJuK/aZ+7Lu7VmFNjmOcqo6RLbjT3UB8PNvgFJr567xiLXMpLiHzpAERaBOKEv
	BtOknLQ==
X-Received: from pfblu3.prod.google.com ([2002:a05:6a00:7483:b0:842:3b3a:5198])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:140d:b0:842:1ffc:55b4
 with SMTP id d2e1a72fcca58-845b3ac63abmr8607670b3a.36.1782509760452; Fri, 26
 Jun 2026 14:36:00 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:33 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-21-seanjc@google.com>
Subject: [PATCH v8 20/20] KVM: selftests: Add xAPIC support in eventfd IRQ test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_143601_814840_822D803D 
X-CRM114-Status: GOOD (  16.22  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Matlack <dmatlack@google.com>

Extend the eventfd IRQ test with a '-x' flag to let the user run the test
in xAPIC mode instead of the default x2APIC mode.  When using xAPIC mode,
sanity check user input to ensure the test is being run with at most 255
vCPUs, as xAPIC can only address IDs 0-254 (255, i.e. 0xff, broadcasts to
all CPUs).

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: add sanity check on number of vCPUs]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 31 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index d2c745c54960..240f6f0fdbe4 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -18,6 +18,7 @@ static u64 timeout_ns = 2ULL * 1000 * 1000 * 1000;
 static bool guest_ready_for_irqs[KVM_MAX_VCPUS];
 static bool guest_received_irq[KVM_MAX_VCPUS];
 static bool guest_received_nmi[KVM_MAX_VCPUS];
+static bool x2apic = true;
 static bool irq_affinity;
 static bool done;
 
@@ -31,14 +32,20 @@ static bool done;
 
 static u32 guest_get_vcpu_id(void)
 {
-	return x2apic_read_reg(APIC_ID);
+	if (x2apic)
+		return x2apic_read_reg(APIC_ID);
+	else
+		return xapic_read_reg(APIC_ID) >> 24;
 }
 
 static void guest_irq_handler(struct ex_regs *regs)
 {
 	WRITE_ONCE(guest_received_irq[guest_get_vcpu_id()], true);
 
-	x2apic_write_reg(APIC_EOI, 0);
+	if (x2apic)
+		x2apic_write_reg(APIC_EOI, 0);
+	else
+		xapic_write_reg(APIC_EOI, 0);
 }
 
 static void guest_nmi_handler(struct ex_regs *regs)
@@ -48,7 +55,10 @@ static void guest_nmi_handler(struct ex_regs *regs)
 
 static void guest_code(void)
 {
-	x2apic_enable();
+	if (x2apic)
+		x2apic_enable();
+	else
+		xapic_enable();
 
 	sti_nop();
 
@@ -158,7 +168,7 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
@@ -169,6 +179,7 @@ static void help(const char *name)
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("-v	Number of vCPUS to run\n");
+	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
 	printf("\n");
 	exit(KSFT_FAIL);
 }
@@ -205,7 +216,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ehi:mnt:v:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:mnt:v:x")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -233,6 +244,9 @@ int main(int argc, char **argv)
 			TEST_ASSERT(nr_vcpus <= KVM_MAX_VCPUS,
 				    "KVM selftests support at most %u vCPUs", KVM_MAX_VCPUS);
 			break;
+		case 'x':
+			x2apic = false;
+			break;
 		case 'h':
 		default:
 			help(argv[0]);
@@ -248,6 +262,11 @@ int main(int argc, char **argv)
 	vm_install_exception_handler(vm, vector, guest_irq_handler);
 	vm_install_exception_handler(vm, NMI_VECTOR, guest_nmi_handler);
 
+	if (!x2apic) {
+		TEST_ASSERT(nr_vcpus < 256, "xAPIC can only target IDs [0-254] (255 vCPUs)");
+		virt_pg_map(vm, APIC_DEFAULT_GPA, APIC_DEFAULT_GPA);
+	}
+
 	if (device_bdf) {
 		if (!iommu_type)
 			iommu_type = probe_iommu_type();
@@ -271,6 +290,8 @@ int main(int argc, char **argv)
 
 	kvm_assign_irqfd(vm, gsi, eventfd);
 
+	sync_global_to_guest(vm, x2apic);
+
 	if (migrate_vcpus)
 		kvm_sched_getaffinity(0, sizeof(available_cpus), &available_cpus);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


