Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100B8CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRnVKRSeVHE8C4mveHZ7BQt7/PAYY6Y/vufRbYFKpcE=; b=YdWrCTSneh1JrkM1RUu5qEqF0J
	uItHj0k+DXhOKH0sQsxj06tOlFEYOFa2Ux6YVLPQ+UsSs7t7Au6e0jzdUp81nV3D4tVFyMKV1++g7
	zWv+uyZkNaY6r1ixHpa/CIX5pjn2mEUp2STsdXDIoKX19VeeNQfBAaaMZPKPayDFu1onrmVSCye4A
	+bSzIg9eNMSuhohP7McYG672qMEspuzGJRCRd/Wk9ppKsgW39TBLdHccO6qUBrxIceM/rJfFj3kY4
	7oqAlLiI56qD/K9r3C5Y1YCmg0a2cOdmrXHQaIDGoJBc5nJEcdhg0+ieo3OFQrw333W/TIoMFqnok
	/opRZbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7X-0000000Bo4p-0399;
	Sat, 13 Jun 2026 00:21:07 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7R-0000000Bnts-0OxC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:21:02 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-84235f9b91fso1177933b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310060; x=1781914860; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iRnVKRSeVHE8C4mveHZ7BQt7/PAYY6Y/vufRbYFKpcE=;
        b=MSy2tHuNp6L+TNfGBUSLv16UK3CITENjoezVuMa5Q8R+ryPHIp4jPOZ4LeqTcHCvkf
         LZRwBDdqEVUCysPUccC0MemOf3eH0vHkKg/+Dfep821L28lXpPX8iD1Rt/UI9RGyW2Rr
         1KCUgq+avKlMPOqoW6VvNdyVgzUFik4Fbg9IdwcAOo2gwvwVMGqWvLxfDdaB0pvRB5um
         mgA+ZpcLcuNR1tLhivjdbhcUxzn8twt9ATB2dSG5LCVurtBQsyceA9F9tDLRP6d1zjXY
         WvM2vNXCQKdjaohfDibD5/YQxzlg+1KQbzYj1tWwvNL2SUs62dnuOZ5T7W/dSTSlu4YT
         h6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310060; x=1781914860;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRnVKRSeVHE8C4mveHZ7BQt7/PAYY6Y/vufRbYFKpcE=;
        b=eI1pjD6/TOlKIlsJgjnD3PWGPUuA3gb6Ee3dqzt4jFkuYgZ66FM0DQqEkS8G46hV/x
         tDf5xnGO02Kjwi7m2ME25yCH/4Qr+2Ndfo93XpwtJv1ic73dyECUm32l3NW+D8pT8Tms
         V8IxLYDwKgGJs69zbXqewPfrHH/w5gkKljvcUK/C3FQzEabKbURfqi+nMRRS3xwlEaRH
         APXyjKr45AaBmsE7mUfKdwwhfowPCyy/8NYTKqdoRsbpO9Uuyh3I0JI3T+GpavdbvjN5
         lm9x20kYyBRmYF+RcD4G4/ZHFRgLcCA3uP/LyOK3pRWpB+aVBUbKYuRFMrGpOvuMp2KK
         S2pg==
X-Forwarded-Encrypted: i=1; AFNElJ+qR8CaIXedO9DsShZ0Ko1bRgJHi7tW7YM/F8PmWEx5FlIcXz13CgY1zAsAGmNtDJciseLq+ocgHBH1CIk39fqo@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZxMXUmgbkZivakaKV0DcIfGx7HOr8Gz2PglyLCs1z7/pLBGZ
	HKCQLNam07Mv6Dv8s6uEOiEjHxVuURkCcHgkBWS9oY2nrw7h19LcTqeiEVW8dLk4lqsKhnkJat7
	BFMeVMw==
X-Received: from pfms4.prod.google.com ([2002:aa7:8284:0:b0:842:6fe1:8620])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1483:b0:842:4612:55f4
 with SMTP id d2e1a72fcca58-8434ce824d3mr5497594b3a.31.1781310059290; Fri, 12
 Jun 2026 17:20:59 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:30 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-20-seanjc@google.com>
Subject: [PATCH v7 19/20] KVM: selftests: Make number of vCPUs configurable in
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
X-CRM114-CacheID: sfid-20260612_172101_146104_1C0F6C84 
X-CRM114-Status: GOOD (  13.24  )
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

Extend the eventfd IRQ test with a '-v' flag to allow the user to
configure the number of vCPUs to create and run (versus only ever using a
single vCPU).

Update the routing logic to play nice with 32 bit IDs, enable x2APIC format
in KVM (to enable 32-bit ID routing), and disable KVM's x2APIC broadcast
quirk so that targeting vCPU 255 doesn't blast the interrupt to all vCPUs
when in x2APIC mode.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 5049cb69cd95..dfdb9f8e398c 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -112,7 +112,8 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
 		.entry = {
 			.gsi = gsi,
 			.type = KVM_IRQ_ROUTING_MSI,
-			.u.msi.address_lo = 0xFEE00000 | (vcpu->id << 12),
+			.u.msi.address_lo = 0xFEE00000 | (vcpu->id & GENMASK(7, 0)) << 12,
+			.u.msi.address_hi = vcpu->id & GENMASK(31, 8),
 			.u.msi.data = use_nmi ? NMI_VECTOR | (4 << 8) : vector,
 		},
 	};
@@ -145,7 +146,7 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
@@ -155,6 +156,7 @@ static void help(const char *name)
 	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
+	printf("-v	Number of vCPUS to run\n");
 	printf("\n");
 	exit(KSFT_FAIL);
 }
@@ -191,7 +193,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ehi:mnt:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:mnt:v:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -214,6 +216,11 @@ int main(int argc, char **argv)
 		case 't':
 			iommu_type = optarg;
 			break;
+		case 'v':
+			nr_vcpus = atoi_positive("Number of vCPUS", optarg);
+			TEST_ASSERT(nr_vcpus <= KVM_MAX_VCPUS,
+				    "KVM selftests support at most %u vCPUs", KVM_MAX_VCPUS);
+			break;
 		case 'h':
 		default:
 			help(argv[0]);
@@ -223,6 +230,9 @@ int main(int argc, char **argv)
 	TEST_REQUIRE(kvm_arch_has_default_irqchip());
 
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	vm_enable_cap(vm, KVM_CAP_X2APIC_API, KVM_X2APIC_API_USE_32BIT_IDS |
+					      KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK);
+
 	vm_install_exception_handler(vm, vector, guest_irq_handler);
 	vm_install_exception_handler(vm, NMI_VECTOR, guest_nmi_handler);
 
-- 
2.54.0.1136.gdb2ca164c4-goog


