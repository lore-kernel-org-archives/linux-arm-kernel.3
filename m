Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5558FCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cKvUgF9aEo/LoEwdPMR+iUYk9h9pBrQbVTXEbhkSEo=; b=fTirSWgH9Z5yrNiVgP2jEji2uZ
	MzhWhTIJRVHCifbULRVzpR4tJLWhDpfvMZRSRzFjSVdRqECObkuBLn2PIu9+tl4ODuNDOxiDVEG52
	WkQvxlZc1GxmtSiQuUw6q7yzdyqxcuje+1uDGN2zXV6HkX1SlEnlGev6XcsYC0+H5zz7VYgdRZMeV
	PB7Epzd9RrNtRKTzUPdvwEKAmI+f8/b0h+jKx9o+AdEo5JVdoxRY/w7ewclhL5BcdUr9e2iuTb28A
	OAOW158dKyHvQK6hlo0GXBoKO+mEDQHRcd8HgTMPjOFX8+fr3EXgGBIJ7sWKcZI1J68/wge5Rpmkx
	I5WjaBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7D2-00000006a03-1VYM;
	Wed, 10 Jun 2026 00:54:20 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Co-00000006Zge-41wG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:54:08 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so5900955a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052845; x=1781657645; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6cKvUgF9aEo/LoEwdPMR+iUYk9h9pBrQbVTXEbhkSEo=;
        b=BTvxs3dNT0EOZtZtYW6cd56D/B4dJ+hm/Cjr1hnmT46IE4GRWW0pZPM6nUaPOo3IJO
         Bcg6Zh+AuTqwBG3LlD5bTtVcXwsVUlQW1/neXItomTNPf96oes1huiBDUwbRuB1+ylQp
         yiSJPc5SKC29O4KSaGyIgslwjg7YUXn4FYUEA2zsRnaWrzm1+oRxWWi/Qecb1Qyxi5al
         d7eWMFmPFPE9GULLgeWVJo7vZ8KWHA+o0OHzQweHHH7u44kubB/qIk7FiO1YVgFybtoU
         3bDhGMa6Bab6d/NZPh7q9AryWXWPW5wJyi07/YK1Z7twwOILFzoaaB9Hs0LCW9a61Ndh
         X6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052845; x=1781657645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cKvUgF9aEo/LoEwdPMR+iUYk9h9pBrQbVTXEbhkSEo=;
        b=OJGjT7+20COG6VPAr25uyL3E6+YmQb7tqPVdYOTTULcDEfwOgp5AN+Z6iAG4sVw6az
         fMkGKvwLLhvqBUD5gtyD3Kw0J+6HHjd/iVyhDB3ExgojBOVRSeS8v5kv4lx+329IYY8Z
         6yoUW7cl+mO8qpg1+cmT6CFCRqrv5GpX7uZmp1LrlxnT4Wja7QPqSwlu2Iea1x9FSkjC
         d/UVkAxdT0FnoFylkmN85k3OQh/avi3PToV9e0aeegUBJ4fr6L42x7qxHyNg0Ly0ViR+
         uTdAY7aCtTb0fQc7bIBzgdEtk6K9h8+njf0fCRwL1cdTSfSa2kFnYXLvP2sQn8hOhkQH
         qFOA==
X-Forwarded-Encrypted: i=1; AFNElJ+4p6tg8iFPVDgVCO3T+eglHI/gbcYSu4dLzS/LaLIVdXLPOCl+Gt1s5huwhfgOFfIsG4seIGuK4onny3Ik1hBS@lists.infradead.org
X-Gm-Message-State: AOJu0YwFGunS0zlG2W+EgTtJzSFUhErg4PvFH8mDCIeIpJCiaduEp3Zc
	5Hbmc98IWvQfakmNjDW55QYNCEmZljiEYWzpc/hZ5QMxwX2CSD6J/ppC9DKXPgfPA4hULQWn4Uw
	56x2kTQ==
X-Received: from plbkx6.prod.google.com ([2002:a17:902:f946:b0:2bd:99a8:49c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540c:b0:36d:b680:3036
 with SMTP id 98e67ed59e1d1-370ee447882mr23877534a91.4.1781052845496; Tue, 09
 Jun 2026 17:54:05 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:37 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-18-seanjc@google.com>
Subject: [PATCH v6 17/18] KVM: selftests: Make number of vCPUs configurable in
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
X-CRM114-CacheID: sfid-20260609_175407_012754_048661CE 
X-CRM114-Status: GOOD (  13.72  )
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
index aeede7937147..7d64fd29ea8b 100644
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
2.54.0.1099.g489fc7bff1-goog


