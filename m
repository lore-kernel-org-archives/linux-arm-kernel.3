Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B95FCD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4JpkxXanGmrcDhm8+OuLX2LEo2GMxbk1wO2svPpVp4=; b=og3DxwLRNIW3N8iR/IM35Yac2K
	Zt2aT+OUlN6Emx1VbzSo9RRCC3qGxffd13br3AZzGgmW4yMyPOp0zRd+F3fthOq9UgWLzCWglrHES
	UXoS1Jr5xWIYbqRg1Sg13yrf5zBOrzbShlTnU7ozyenYJyw8WcIpozlDYgUrFCBiw0Q80mOjQfZzs
	QOaA+zwh6OfPaanp4PIAZ/Gs0qc7FDGggh0LYKeAeazG3NksY112DcdcyU5XszJx0msQ9gZYCVM8p
	8W+ntdrfZuTeAS6B9qY7vpDJL76jDVBlj1H7lbql8r4oDXh99qBulMtqMmyZ+WJZjAETk8z2nAYIc
	/VleAUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7D2-00000006a0V-2nQU;
	Wed, 10 Jun 2026 00:54:20 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cq-00000006ZiY-15zX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:54:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so4261605a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052847; x=1781657647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=q4JpkxXanGmrcDhm8+OuLX2LEo2GMxbk1wO2svPpVp4=;
        b=Y9scfiSNuAkcg2RREKsw2XmgdI+L8k6UvogKtPJ3xVSjGF63YdAVny1qO4N0HHCwW0
         JAD36HMe8VB3BRnLSX/8l6Ki+ufF/eqJkgj/pkaUr3WAh+TvBi/jNtt+yaddHXfK+7FS
         gMRuIUC/WRoQoz/y5vx9IJJk4aljYPq48ofbkHb2pXAoIdnV+ai0+QAV7cB7YH/Paf46
         QLqCAGK2SjE5CgFEPcm6JkzbXvh2Xg+MWhOwkWIwnLEtfJWLngxNy9DX1Itq0SecFpgK
         1HJdjNOycJ0OcSq0pRsicn9WUrCbnbv5Lks6WQqB0oiXgSvH+FO1G6gZ+xf2L4U5P9cD
         ypEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052847; x=1781657647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4JpkxXanGmrcDhm8+OuLX2LEo2GMxbk1wO2svPpVp4=;
        b=ZkFdJxtOhvRBlGwv3MaR8Rw/vfeUPb+Tw4nSKe/RZYCz5W5R6jRaUoeJnSSWyeWc5A
         4MJkcViH1oq20TzSuRTzyJg3JmnWBjOfMvOYMQSPoN/EUCT0HtQrz56soWHz2aa60wb9
         jexBSwR84B+hDZi+1GdXSFhYptNQxTteo9YSVA7zw9vdmJHljGWAFzUTTo8oxOuN0ltJ
         tQI3e0UG2FxwJ4wQbj1f3zJTZI1EquBpg8K1cUG+CpuSeBphTaWsAzpY6IC/7MqJUNKY
         dLPzLQT4SfZksGaS8/oSTg8jjdlUK3QOztG5bl+FNHbhZUwkEOu9Jtiobsfp8uZ0yxrw
         nE3g==
X-Forwarded-Encrypted: i=1; AFNElJ8rkuMJMJGqNmaPlXg7TAFVS1jT3NE7tU0y35paivtC3RRk5mG1H1mor65/g7hSf0/TzYZPRaTIk+C7rJvH4Uwu@lists.infradead.org
X-Gm-Message-State: AOJu0YwYyrIBibJ2gPVzVf0886Rzjl/6KxM7u2SQoCZXCkp5TpmnwODP
	f5pslWzdxJXEYYLPHQcIRAW85momDLwwO6UC2OgGLAiSsWWd2aE34qWC/8I49u5aegkUKiIxrBZ
	NI/tYFg==
X-Received: from pjbiq21.prod.google.com ([2002:a17:90a:fb55:b0:36b:7f07:6fcd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc7:b0:36d:cf58:b79
 with SMTP id 98e67ed59e1d1-375211ae901mr6245033a91.19.1781052846605; Tue, 09
 Jun 2026 17:54:06 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:38 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-19-seanjc@google.com>
Subject: [PATCH v6 18/18] KVM: selftests: Add xAPIC support in eventfd IRQ test
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
X-CRM114-CacheID: sfid-20260609_175408_333704_B75F330A 
X-CRM114-Status: GOOD (  16.70  )
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
index 7d64fd29ea8b..2b6fc0335d38 100644
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
 
@@ -146,7 +156,7 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
@@ -157,6 +167,7 @@ static void help(const char *name)
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("-v	Number of vCPUS to run\n");
+	printf("-x	Use xAPIC mode instead of x2APIC mode in the guest\n");
 	printf("\n");
 	exit(KSFT_FAIL);
 }
@@ -193,7 +204,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ehi:mnt:v:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:mnt:v:x")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -221,6 +232,9 @@ int main(int argc, char **argv)
 			TEST_ASSERT(nr_vcpus <= KVM_MAX_VCPUS,
 				    "KVM selftests support at most %u vCPUs", KVM_MAX_VCPUS);
 			break;
+		case 'x':
+			x2apic = false;
+			break;
 		case 'h':
 		default:
 			help(argv[0]);
@@ -236,6 +250,11 @@ int main(int argc, char **argv)
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
@@ -260,6 +279,8 @@ int main(int argc, char **argv)
 
 	kvm_assign_irqfd(vm, gsi, eventfd);
 
+	sync_global_to_guest(vm, x2apic);
+
 	if (migrate_vcpus)
 		kvm_sched_getaffinity(0, sizeof(available_cpus), &available_cpus);
 
-- 
2.54.0.1099.g489fc7bff1-goog


