Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8035CCD98DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1eSMtwb9G7YtnadMLAB7K5SNJIa+tjm/mrc7JGQxkw=; b=gVR17pfoqW4t8cxCxJfD/SNMWx
	qsbSPyKOFTtcHynhfpGMuSHa2Y/MLFHVb+TPYlfqCVU8cXI8a7/unuxhbtTjdouUu1UcCp5ldxnrV
	h+VnJ0DQEQO2VMmENR1Sbx6hsr/5gATXISloBRkvdu9iAiEyozeL993Fxqvy1B+xq1dO8nFF+oBC4
	hibzDwd0p0qRu0VqLk9LULn6QKkH2QXVvtNC9ChO25dxJDTRLCEKafO/M66oFaCe6wV7DLF5u64XO
	VAmXUrDsR+NHYJG2nLfkNG5J73pUMGYQ1wai4dZ07h8HRdb1bGw5pme1837Y47eLOGvIRxDBS21Od
	hxFsYIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7V-0000000Bo1g-3a2I;
	Sat, 13 Jun 2026 00:21:05 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7K-0000000Bnl6-2r9S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:55 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c85a2f19558so802866a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310053; x=1781914853; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=H1eSMtwb9G7YtnadMLAB7K5SNJIa+tjm/mrc7JGQxkw=;
        b=WUfRdFNRq7EmHgDMeuN1FehYWbT8oqHX138gQlQt2IyrGJoIBHZ2lDGDKX+hry4M5j
         G6fA/z6G5AhtQLSNBcG3pPAIBbH6SrWMDkd9nbGH9Sg+6SYRAVfYIL0M7aO3xxHxTpTQ
         wyoXtjKuAtbA/VHrIwkXeSOB9dwA7HSchuNSnoCPSgKx54B+Q2uK4iXnipr6Hyh5l2ul
         AwhVoz/oqGD4gavneSd0VxOa9Jz0oyowoNf1r0h5Ir8IaD4quvxEt5dSaRMdQnEkSr2r
         9Tfu/k8NV7fuuSGhvHpk7R2otB+057RGXkvzXN3IUQVpJA9J49+PTWolbLQ+l6rCTmff
         KGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310053; x=1781914853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1eSMtwb9G7YtnadMLAB7K5SNJIa+tjm/mrc7JGQxkw=;
        b=M7FzbeBD384sDdf9olgwEOPrbMXInkDVmDYhTvIAptCbBOk1OpXPQ/6ugWgCTD/nC5
         Q9Hs02eIZ4xZmOhJFJbUUc6otqKihwMTW1ZI2ceMnXz2FNdVzqXL2bXf1dW8zB7h7ZHq
         D9RzaO3q6ckWJXCh578T16Zpge+Qj7PrHD/muXXfsSW9lwRXBvVrOsqbd9f92Sv+Ui2g
         /82HDVjc8whwQVk+5kvXkXHx+2q0NzZzdwGDtuIsi7zGu7f7yikua/rdYANmwRT9G9RQ
         +UAh91iXijuZdMP+2OKyJ9jDUYKRXgCd5LPq5cFYiEZz9uZEg7jP5px0rGx37oBpW28k
         QQBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uQmFmrzhgi5YpDtMb8viBub+L/GbtIJOfEO+wS3ZJTeHjBXNt8KSyQ9KKusWKsaMc2my/2qb0oT81QmvKfqBy@lists.infradead.org
X-Gm-Message-State: AOJu0YxPrVvegMMbj8gdwQ4ZGq81p5nmIMSpDQ7XmLKAaI5467Pw+1Ht
	lijzNQJ0iQvQ6O8yn8WTIii0QM7V2ymfA4xW8e/BSGbaJDej+jCiEfkokUtoWo1hJ6f6Y70HILl
	dedogpg==
X-Received: from pgar14.prod.google.com ([2002:a05:6a02:2e8e:b0:c82:2dd8:9d48])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b12:b0:3a2:e0d3:37d2
 with SMTP id adf61e73a8af0-3b783fb31efmr5801901637.35.1781310053018; Fri, 12
 Jun 2026 17:20:53 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:25 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-15-seanjc@google.com>
Subject: [PATCH v7 14/20] KVM: selftests: Verify non-postable IRQ remapping in
 IRQ test
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
X-CRM114-CacheID: sfid-20260612_172054_729191_C97A2EB6 
X-CRM114-Status: GOOD (  17.37  )
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

Extend the eventfd IRQ test with an '-n' flag to route a subset of device
interrupts as NMIs (Non-Maskable Interrupts) into the guest using an
alternating pattern of 4 NMIs followed by 4 regular interrupts.

While this adds coverage for NMI injection, the primary goal is to
validate KVM's handling of non-postable interrupt delivery (AMD and Intel
IOMMUs only support posting fixed IRQs targeting a single vCPU).  KVM
has historically bungled handling transitions between posted and remapped
modes.  Use NMIs to stress the transitions, because they are a reliable,
architectural way to force these code paths.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: add GUEST_RECEIVED_INTERRUPT(), massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 48 ++++++++++++++++++++------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 2cfb6c24e8d6..d2d861119854 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -17,11 +17,17 @@
 static u64 timeout_ns = 2ULL * 1000 * 1000 * 1000;
 static bool guest_ready_for_irqs[KVM_MAX_VCPUS];
 static bool guest_received_irq[KVM_MAX_VCPUS];
+static bool guest_received_nmi[KVM_MAX_VCPUS];
 static bool irq_affinity;
 static bool done;
 
 #define GUEST_RECEIVED_IRQ(__vcpu)	\
 	SYNC_FROM_GUEST_AND_READ((__vcpu)->vm, guest_received_irq[(__vcpu)->id])
+#define GUEST_RECEIVED_NMI(__vcpu)	\
+	SYNC_FROM_GUEST_AND_READ((__vcpu)->vm, guest_received_nmi[(__vcpu)->id])
+
+#define GUEST_RECEIVED_INTERRUPT(__vcpu, __nmi)	\
+	((__nmi) ? GUEST_RECEIVED_NMI(__vcpu) : GUEST_RECEIVED_IRQ(__vcpu))
 
 static u32 guest_get_vcpu_id(void)
 {
@@ -35,6 +41,11 @@ static void guest_irq_handler(struct ex_regs *regs)
 	x2apic_write_reg(APIC_EOI, 0);
 }
 
+static void guest_nmi_handler(struct ex_regs *regs)
+{
+	WRITE_ONCE(guest_received_nmi[guest_get_vcpu_id()], true);
+}
+
 static void guest_code(void)
 {
 	x2apic_enable();
@@ -91,7 +102,7 @@ static void trigger_interrupt(struct vfio_pci_device *device, int eventfd)
 
 
 static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
-			  u8 vector)
+			  u8 vector, bool use_nmi)
 {
 	struct {
 		struct kvm_irq_routing header;
@@ -102,7 +113,7 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
 			.gsi = gsi,
 			.type = KVM_IRQ_ROUTING_MSI,
 			.u.msi.address_lo = 0xFEE00000 | (vcpu->id << 12),
-			.u.msi.data = vector,
+			.u.msi.data = use_nmi ? NMI_VECTOR | (4 << 8) : vector,
 		},
 	};
 
@@ -134,13 +145,14 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-n] [-t iommu_type]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
 	printf("-d	Use a VFIO device to send MSI-X interrupts instead of manually signaling the eventfd\n");
 	printf("-e	Set empty GSI routing in-between some interrupts\n");
 	printf("-i	The number of IRQs to generate during the test\n");
+	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("\n");
 	exit(KSFT_FAIL);
@@ -171,11 +183,12 @@ int main(int argc, char **argv)
 	const char *device_bdf = NULL;
 	const char *iommu_type = NULL;
 	int i, j, c, msix, eventfd;
+	bool use_nmi = false;
 	struct iommu *iommu;
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ehi:t:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:nt:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -189,6 +202,9 @@ int main(int argc, char **argv)
 		case 'i':
 			nr_irqs = atoi_positive("Number of IRQs", optarg);
 			break;
+		case 'n':
+			use_nmi = true;
+			break;
 		case 't':
 			iommu_type = optarg;
 			break;
@@ -202,6 +218,7 @@ int main(int argc, char **argv)
 
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
 	vm_install_exception_handler(vm, vector, guest_irq_handler);
+	vm_install_exception_handler(vm, NMI_VECTOR, guest_nmi_handler);
 
 	if (device_bdf) {
 		if (!iommu_type)
@@ -240,36 +257,45 @@ int main(int argc, char **argv)
 
 	for (i = 0; i < nr_irqs; i++) {
 		const bool do_set_empty_routing = set_empty_routing && (i & BIT(3));
+		const bool do_use_nmi = use_nmi && (i & BIT(2));
 		struct kvm_vcpu *vcpu = vcpus[i % nr_vcpus];
 		struct timespec start;
 
 		if (do_set_empty_routing)
 			kvm_set_empty_gsi_routing(vm);
 
-		kvm_route_msi(vm, gsi, vcpu, vector);
+		kvm_route_msi(vm, gsi, vcpu, vector, do_use_nmi);
 
 		if (irq_affinity) {
 			irq_cpu = kvm_random_u64(&kvm_rng) % get_nprocs();
 			proc_irq_set_smp_affinity(irq, irq_cpu);
 		}
 
-		for (j = 0; j < nr_vcpus; j++)
+		for (j = 0; j < nr_vcpus; j++) {
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
 				    vcpus[j]->id);
+			TEST_ASSERT(!GUEST_RECEIVED_NMI(vcpus[j]),
+				    "NMI flag for vCPU %d not clear prior to test",
+				    vcpus[j]->id);
+		}
 
 		trigger_interrupt(device, eventfd);
 
 		clock_gettime(CLOCK_MONOTONIC, &start);
-		while (!GUEST_RECEIVED_IRQ(vcpu) &&
+		while (!GUEST_RECEIVED_INTERRUPT(vcpu, do_use_nmi) &&
 		       timespec_to_ns(timespec_elapsed(start)) <= timeout_ns)
 			cpu_relax();
 
-		TEST_ASSERT(GUEST_RECEIVED_IRQ(vcpu),
-			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d (via CPU %d)\n",
-			    vcpu->id, vector, gsi, irq_cpu);
+		TEST_ASSERT(GUEST_RECEIVED_INTERRUPT(vcpu, do_use_nmi),
+			    "vCPU %d timed out waiting for %s (vector 0x%x) from GSI %d (via CPU %d)\n",
+			    vcpu->id, do_use_nmi ? "NMI" : "IRQ",
+			    do_use_nmi ? NMI_VECTOR : vector, gsi, irq_cpu);
 
-		WRITE_AND_SYNC_TO_GUEST(vm, guest_received_irq[vcpu->id], false);
+		if (do_use_nmi)
+			WRITE_AND_SYNC_TO_GUEST(vm, guest_received_nmi[vcpu->id], false);
+		else
+			WRITE_AND_SYNC_TO_GUEST(vm, guest_received_irq[vcpu->id], false);
 	}
 
 	WRITE_AND_SYNC_TO_GUEST(vm, done, true);
-- 
2.54.0.1136.gdb2ca164c4-goog


