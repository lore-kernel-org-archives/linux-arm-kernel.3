Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF89CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5oHTfXMBdClQrZ4tUCiIh2PRbirp3RVnp/XkqMdpO/4=; b=m/xHF8xQkUO4JbdLfXCoQ/mHXq
	lwqUR/N0C3mrIy0DRdmGWI+m/Qekqu2h9xTyqde5wLGxWopSM/Ph1b9Yfmv6P7jFEA0BjdTaEgDTm
	nAhgkdsEVnnk07A0VCnwI1ZojjzFP22HU/Zhw0ODW+wx7629WXsxjqr9UmEPiU7t3QVkq+xZf5jzI
	VCyPI/9dhNs2s5D4I6jI3CHslst88lJW4kqA1iPXgjLlCDSDQn+BFKOU1ZPtCTvBIEbKYRenRGYRz
	flUhyo97dpdz3QdRaKacWkEaXP9aZxVpbKJ7z+Gh+nVN1x89VkFfOIUaMOuUTCJ8VrOPBprTbnOto
	q49mlYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7X-0000000Bo5v-2FuB;
	Sat, 13 Jun 2026 00:21:07 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7S-0000000Bnw8-2jFj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:21:03 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-8428384f31fso1184472b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310061; x=1781914861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5oHTfXMBdClQrZ4tUCiIh2PRbirp3RVnp/XkqMdpO/4=;
        b=usi7tAbrINjDP5gpXfCG263XATOugy7Gada9XSFD+8qJtmesqbckreb1vTMqO5Cc3T
         8WfkGBIN1qTsuDPqhGSS27lu9xey8PzatKhLZOFsmbDFJS2e2sZG52VEEOFYDkf6W/BV
         JxfekOseSEZq1QdZ/H7tH7vszxQdJDw+oYE1BNSy1hxEmp36P14ywJUkpz2vmri55XxH
         UXmgVgXZj3c3+/f3XxRsyvx1dSG7+RG6r+N2t/PFJGulqu7GBal7NrBD1OkENrFQ8QlM
         +B382n1RFcAp37lJk0h+GenjOHUhsyasqCNur+mbDNCQNbMTJLJvrFD6lutRm5mxkvq/
         X0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310061; x=1781914861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oHTfXMBdClQrZ4tUCiIh2PRbirp3RVnp/XkqMdpO/4=;
        b=pGWOaPy563IhexW7vjgXy92xTstZ2YkVwOMr7ZtC+nUy7gQXXZjuhcOlWhNn2hr+do
         D4UhExMjIm1BRAVx0lUu9VJR7a4qrPh8OZA6S0FKM666oXM3d18zhM2UFp8juJCIEPv/
         Cb3atRgvFjT84lJ/LMQj9PGAYxfKp7eM2/p2nAgXdJVzsfFsUxN+dNPR5O44tz8FJtmW
         idBuXRwCMyblXbg/pN/FcutBZcHn+7jwASxHJua4nuhSzQIrFm92Z7hJHbq94nLAWZpx
         FdBVFcvvbA50Xby6lIu17e3fsqJiG5NnHkd7q2zD5TxwUs8wmR//5MtLrDPd+eth+MhR
         H5GQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CXjlXxn1ZL0vSAljnBXEIB3/I5YkiRPozJWdNkE902TjzbAI/opPNGG6tqO6sZE2In9OxhzuB2LEE289JjqlJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwDxsrnjapyWAEVMRDDbjyFQ7yJC32lQlzc2hr8ADmE4Qzuhbqf
	vlUmxci0vVcKcf65T7YI0XS/UQGLWONWvGHJGbG7DEnSwlKuoXCDAkLQZHX8nQcSBGjIwafJgqA
	ClxtBFg==
X-Received: from pfnz25.prod.google.com ([2002:aa7:85d9:0:b0:83f:1851:35f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:399f:b0:842:2382:a0ea
 with SMTP id d2e1a72fcca58-8434cd2592cmr5324202b3a.14.1781310060965; Fri, 12
 Jun 2026 17:21:00 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:31 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-21-seanjc@google.com>
Subject: [PATCH v7 20/20] KVM: selftests: Add xAPIC support in eventfd IRQ test
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
X-CRM114-CacheID: sfid-20260612_172102_711570_022491F5 
X-CRM114-Status: GOOD (  16.23  )
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
index dfdb9f8e398c..a17e274c9b4a 100644
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
@@ -259,6 +278,8 @@ int main(int argc, char **argv)
 
 	kvm_assign_irqfd(vm, gsi, eventfd);
 
+	sync_global_to_guest(vm, x2apic);
+
 	if (migrate_vcpus)
 		kvm_sched_getaffinity(0, sizeof(available_cpus), &available_cpus);
 
-- 
2.54.0.1136.gdb2ca164c4-goog


