Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2CCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnOwvJzchK4FfYVRhLUd9M/CfdcZF8IWyQ377aEQXH0=; b=tugBV82UV1Cfbdu8n1FD5q3fqP
	CR1qFNQVHujRDq0FoVXf/LdLsxRBK4uCdK5lXBWGFxbL5IvS7oSyoIwH3DWEXHTbCdlso7EJVYD0e
	svAChwAJbhqINe7IT73VOI1Y9PLJ5k1Cb7iliwSz4pZ1eflHYC2bXFqzMX3R74ww2r0FMoarHhPrj
	IV6uPhCckxaBWfY/6D6mj5BY/mHEJUnU5FT5baJinh6LeWYzEo9u3+CCFLdYpEhTZoHuFX7u5KHUG
	2Y3X77WWmLIioOuATqkLWD0QD6+zBb+S0wNZM5c4m7qtfbmSYpe015sd6nKefx0G+R8faSLE3KbAr
	j00vK8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDY-0000000Buaa-38JN;
	Fri, 26 Jun 2026 21:36:08 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDK-0000000BuNa-1Wch
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-37c6916c768so1750449a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509753; x=1783114553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LnOwvJzchK4FfYVRhLUd9M/CfdcZF8IWyQ377aEQXH0=;
        b=N3HWk2oPuxINKwYYCubG4xFM7Vy618juM8j6XLVrjYAmne76Lni97cbCYbm6ZNNNVJ
         rDbUhCmdstOoNmkK2lOBBsQdZloX7D2W/Gx9tDgxD1RjklxzwUXuqClkfAC9hFBluA0y
         Nl3aS6bB4bEzz1GQGw06H6NL8+eIfKAETGPdwPwM5NLcgLzDrrXe+p+QxCrZDcL+HtfH
         kODtdCV8LAczsd85DHsvl1H6Pdp4upbvANEtYlJwTBxygp5R5l4SNIz9vm6sDobBC7RT
         HJ+/FgOxYSrX291+jRLG7Z6AcCBCYJ+pm1urkjcRlDXfdYa2PC+67bALn+LHwRbytUay
         I1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509753; x=1783114553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnOwvJzchK4FfYVRhLUd9M/CfdcZF8IWyQ377aEQXH0=;
        b=U4m2Lanfx40cZOO9LZyGshMsXei7JCK5OsLhfpjPZcLHLBK8XUpSoo/yBVhvrRLrDI
         nVt+LqN1SctQmugz6hoJ99oCJqQVLAuew3MK0wdnoPdhekeVcj7iX946I/3rRICC/Qm4
         zBqTmdGvmnhCXf26+jdZCe8JRopmgbSuEVKNhyPQxgSako4ndGQzBVdNKzqddrhp6A/J
         0gpeCCgubP5NA2vvRwDRKZY6ncofzItwXo8NMD1W7J2mXS8kBBYOb7e9cpJeTbTA6hJf
         b4nHlPESFvjo6k8IdY1SnFUiFzZoANOs9v9Ovs+q7AHsl1R6voHJ8ISRVlIbPSkz/58c
         xfnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX+KoXMC+z8ZMoyy/vNPbSNxozppMkx0hg1pucSxq/5WBlzzrPIgukYwYak6kgqEH1kX1oasO2q2B0iaF4hMn+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/mwzZHqd1DS4ohWPWS/tmvI6f7Qx34Y0BM4CExxmDO8JO6mHx
	qib4AGs7qj+2/Xkyadp/AkzOIXjE5qqyBMz9T1n4P0J/PRhb9/8P5r022ngzTU+vyKEOms/rQ2B
	63Aj1ow==
X-Received: from pgge9.prod.google.com ([2002:a63:db09:0:b0:c85:62f4:f188])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28cc:b0:37e:a09:2432
 with SMTP id 98e67ed59e1d1-37e0a0936b9mr5335064a91.4.1782509753021; Fri, 26
 Jun 2026 14:35:53 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:27 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-15-seanjc@google.com>
Subject: [PATCH v8 14/20] KVM: selftests: Verify non-postable IRQ remapping in
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
X-CRM114-CacheID: sfid-20260626_143554_410654_30E1DA0D 
X-CRM114-Status: GOOD (  17.45  )
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
index bb20bb81e930..48520c6dea69 100644
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
@@ -103,7 +114,7 @@ static void trigger_interrupt(struct vfio_pci_device *device, int eventfd)
 
 
 static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
-			  u8 vector)
+			  u8 vector, bool use_nmi)
 {
 	struct {
 		struct kvm_irq_routing header;
@@ -114,7 +125,7 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
 			.gsi = gsi,
 			.type = KVM_IRQ_ROUTING_MSI,
 			.u.msi.address_lo = 0xFEE00000 | (vcpu->id << 12),
-			.u.msi.data = vector,
+			.u.msi.data = use_nmi ? NMI_VECTOR | (4 << 8) : vector,
 		},
 	};
 
@@ -146,13 +157,14 @@ static const char *probe_iommu_type(void)
 
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
@@ -183,11 +195,12 @@ int main(int argc, char **argv)
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
@@ -201,6 +214,9 @@ int main(int argc, char **argv)
 		case 'i':
 			nr_irqs = atoi_positive("Number of IRQs", optarg);
 			break;
+		case 'n':
+			use_nmi = true;
+			break;
 		case 't':
 			iommu_type = optarg;
 			break;
@@ -214,6 +230,7 @@ int main(int argc, char **argv)
 
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
 	vm_install_exception_handler(vm, vector, guest_irq_handler);
+	vm_install_exception_handler(vm, NMI_VECTOR, guest_nmi_handler);
 
 	if (device_bdf) {
 		if (!iommu_type)
@@ -251,36 +268,45 @@ int main(int argc, char **argv)
 
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
2.55.0.rc0.799.gd6f94ed593-goog


