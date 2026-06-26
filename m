Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4CFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C+wq0VK0ghddVns1kN4nyVNDsu3kjVzVymKqfTzcVg=; b=L223zxD7sMA8vXuhyPXmdAgqib
	VTvUBtbomIrBbl2LdJg8y9UoFij1b6Xu3n9gIGThmkqoDXMN+ewadvtygZKoax3Q0BlZXU99Uglv1
	3jHd1EqFZcRmbJ9CwcRw2lhsOBRt1fAlXAT/AESRfZcp4+CFGrBQTGbJgaoLGwtr5i0bU9DsJevzH
	E/q85I+SWT0LUTFqMVYAiHUn2mDMTFTVD0aHM4n7qb7ncsYUqa8bEUuX0iTc+eg9PVRieGWA3v0nU
	xFJDiGUFgKWYj8o9Q/1fn3IJxDd5b7IClUU/8Q8DJVZne/12umCBqlQyQSSMlH73PiL1vXKdHhTyS
	VE+Lpe3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDa-0000000BueV-0C6s;
	Fri, 26 Jun 2026 21:36:10 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDR-0000000BuRR-12vE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:36:02 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c79e5de32cso11232825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509760; x=1783114560; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4C+wq0VK0ghddVns1kN4nyVNDsu3kjVzVymKqfTzcVg=;
        b=uoKXDwE/La5PGCWH+Pgbf7++hLf+FBZpgDqQLPpu4k30765PpmaDEwiHQUsfyY/lSH
         isjLN1uuVIAtIXt/ilGjydGrFROz49OMnm57TqhX8ksdCkE5hTF6NLxm5JPmQqgj+3cp
         h2y7JTxKhqd6xoLxj/I+hjI5UeOaI3GV/FTo/ctPqHsmIwtkn7mouTtAXp0gBCtzo9CT
         iTZLrb/9NZm2UTedEW9WK2nISAIbnGLwuNGpvAhQdliupzmNzqDwyHaxsD3hDkEygShE
         1mIBvwumD8rYWkyrsygegPuuWXufy/AlTc7y0ZVWJNWA0Wfbd4RHOyxSsXHewfypTnpl
         O0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509760; x=1783114560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4C+wq0VK0ghddVns1kN4nyVNDsu3kjVzVymKqfTzcVg=;
        b=oMQlb2U3/x3wwEE/2n4SAf55RE1ZxElysVic8OuNFkOzkcogWLI7mwtSc9gd9cbIKc
         4dOKXl8FRD/qSRxUHfx9PMb/pkKp9zdFPqMr9W19tJ54x4wpmJbtby7RKflUd4+WmSV3
         engZt+wnP6lZSKxqA+57uHcgcL6XpIRIeVw1PqWZM968HHKzfnA3knqKdAC1u5TTZJsc
         L1ekAFbGG/kCSovjLf674S/yXynExm/SQQ+9D6OA8ZdlCxK9Reo7r78UEzGor5xvRvsZ
         Wvsk0LHiTutDYrYni/VZoy3HUoFDNg16g1GWah8e7UiGkguOU01WsSCJmd+8zrlx7IU2
         KrGA==
X-Forwarded-Encrypted: i=1; AFNElJ/0E1J2L+JvV2AHGJkbhOnjo7lm1GxhHV4Jinj83D4GA24DjI8WYk+k93Gg+TKklkEqLxe+xafYAvsZ4kAvQoLW@lists.infradead.org
X-Gm-Message-State: AOJu0YxHgt7c1WruGMKms8FhczfFhiI1sof+K1cBzp41wkj3/fS/rhVS
	F7O439g3PVYQjp44JNhUyHdLlxbpyiU8cc7YLwv8ezuLcPY28AZmtNJ0gQH8HycFqcNDttKdwoS
	NM8rlPQ==
X-Received: from pgdr9.prod.google.com ([2002:a63:9b09:0:b0:c86:1628:53b3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d81b:b0:3bf:6c08:2b30
 with SMTP id adf61e73a8af0-3bf6c084b2fmr1584091637.56.1782509759266; Fri, 26
 Jun 2026 14:35:59 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:32 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-20-seanjc@google.com>
Subject: [PATCH v8 19/20] KVM: selftests: Make number of vCPUs configurable in
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
X-CRM114-CacheID: sfid-20260626_143601_297195_7E65B0F2 
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
index c0ff6e60b167..d2c745c54960 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -124,7 +124,8 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
 		.entry = {
 			.gsi = gsi,
 			.type = KVM_IRQ_ROUTING_MSI,
-			.u.msi.address_lo = 0xFEE00000 | (vcpu->id << 12),
+			.u.msi.address_lo = 0xFEE00000 | (vcpu->id & GENMASK(7, 0)) << 12,
+			.u.msi.address_hi = vcpu->id & GENMASK(31, 8),
 			.u.msi.data = use_nmi ? NMI_VECTOR | (4 << 8) : vector,
 		},
 	};
@@ -157,7 +158,7 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
@@ -167,6 +168,7 @@ static void help(const char *name)
 	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
+	printf("-v	Number of vCPUS to run\n");
 	printf("\n");
 	exit(KSFT_FAIL);
 }
@@ -203,7 +205,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ehi:mnt:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:mnt:v:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -226,6 +228,11 @@ int main(int argc, char **argv)
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
@@ -235,6 +242,9 @@ int main(int argc, char **argv)
 	TEST_REQUIRE(kvm_arch_has_default_irqchip());
 
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	vm_enable_cap(vm, KVM_CAP_X2APIC_API, KVM_X2APIC_API_USE_32BIT_IDS |
+					      KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK);
+
 	vm_install_exception_handler(vm, vector, guest_irq_handler);
 	vm_install_exception_handler(vm, NMI_VECTOR, guest_nmi_handler);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


