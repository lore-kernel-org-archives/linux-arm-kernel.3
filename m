Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70586CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 01:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxxrfMGS0zaiu+w3muh1AaxqaJx6GaJWf2ySi/7JstM=; b=R7Jtw+ko0E+bCa9eQtxjUyUpYW
	OADoxyOs+o83sHxf0gyUWYKr2MGWBLI9hLZUcmbpoUsJDXskwIQ7QEQzz6qWX2hafoZ4LCm4xUelR
	ajFDXZas1MfEUUizpgxQUfi6IsM+Pc3WFHpEw7PyqIJhO4i1/1JAswfQh9OwiNTJYpou9AaaMQ8xx
	1gjeKm5+tzu8GcccGqH2f4l6Am11dGemXYNDNDS5ZeHs4If0id3087H6461WzCvlrLHRuH5NiEl08
	TV3aJbmVkv0kQdOxGy413DIMZnbccaEWqJYcJK9h3dXbWaCmzHfWnsXdypkC4f251m5ODFuPPO2JC
	sbb/mq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ci-00000006ZZR-1KNz;
	Wed, 10 Jun 2026 00:54:00 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ce-00000006ZUs-24ft
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:57 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36d97955899so5805497a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052835; x=1781657635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FxxrfMGS0zaiu+w3muh1AaxqaJx6GaJWf2ySi/7JstM=;
        b=jx/RFQzLYjht7siktvOSazNDJf1Ci/DGXhTfNdBqf2qn9g3hVmxAzN0RULJ+aHs2Jq
         ph/XFmbXaPlt0iXQieVj6PfuoRYwVF9obXNNKRJ81mBwo1APawa+xJPwAVxQT+BEmdS0
         0aUwuwFQhd7LVoxUPS0sXxBLLsl5AdbwEilsAa7ara22HW1suX+smyl845D/bN+FOgcM
         sRGOo97Nb9RXZSB3GQ/GpcbqQ0PtfAdXs1PFqdH1iL9RnfxGCmrZr+0q6DR1WljKwZNv
         oHo0l84K5fuCM9P9LYgwZTutXaIe+N+WU1co4Z708282XvodmlG/OyMIZqL3bl5dpTTG
         dtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052835; x=1781657635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FxxrfMGS0zaiu+w3muh1AaxqaJx6GaJWf2ySi/7JstM=;
        b=JoecJlfEXA2gFRr3gXTMu+IyBL+/MHJPn0bjKE5/0qlP/3dftl4pFbuIlPrzSVzGHO
         qZEMrvomoL8JrPSw8Bc8xNSBxF5KJ7wWRyOWmT2pBOW/mtZIyWcxwRxNdELNdLUXWMKP
         fbMAHLIHd0lL0zpByFK86WyuF982IAiH/IMZzrOJoZIcdUl/V5z3LOg4qh41pCGAcZ1p
         z/52HaPq5r6hVKtkIwkwWZ6MC031av1ZTMx3egbZcwPCnSQtmyecoQ5Mb9RjAF1KU4nb
         jfx8yOyPA101x3bcx/VTgQMbhHM1zgiz0eBUiSOvDWchr/a4e3Zceievgd1Liwzp9Ewy
         sKsg==
X-Forwarded-Encrypted: i=1; AFNElJ8csdmNKC1k+8gLS82GOE9CaMFDN8FRr03bvxGGcd31lXf3OI0skrwdNILCp5vJXjQlY+WHcCzps7lYe18a/LJq@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBhbzgfQPK6WMW7mCDZzCGEmPVhlRDp5mSqCfcXDH+V8NTps8
	pzE7/OSaBa35zQWWMGSc8VNopxEdZ30lq0+tkAdebaaniCWOTADB8yrx8yR8NkQLGRnKO3NNhl/
	efdNiyA==
X-Received: from pjbfv16.prod.google.com ([2002:a17:90b:e90:b0:36b:7407:9b72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:50cf:b0:35e:d015:d675
 with SMTP id 98e67ed59e1d1-3751f843387mr6325275a91.7.1781052834478; Tue, 09
 Jun 2026 17:53:54 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:30 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-11-seanjc@google.com>
Subject: [PATCH v6 10/18] KVM: selftests: Add option to set empty routing
 between IRQs in eventfd IRQ test
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
X-CRM114-CacheID: sfid-20260609_175356_726954_D2FC7EBC 
X-CRM114-Status: GOOD (  14.82  )
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

Extend the eventfd IRQ test with an '-e' flag to set empty GSI routing
between interrupts.  Clobbering the GSI routing table verifies that KVM
correctly handles CPUx => NULL => CPUy transitions, not just CPUx => CPUy
transitions, and verifies that KVM can "rebuild" an entire routing setup.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: '-e' for "empty" instead of '-c' for "clear", massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 9e2287490262..2ad9efd9abc7 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -109,6 +109,13 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
 	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing.header);
 }
 
+static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
+{
+	struct kvm_irq_routing routing = {};
+
+	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing);
+}
+
 static const char *probe_iommu_type(void)
 {
 	int io_fd;
@@ -127,11 +134,12 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-h] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-t iommu_type]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
 	printf("-d	Use a VFIO device to send MSI-X interrupts instead of manually signaling the eventfd\n");
+	printf("-e	Set empty GSI routing in-between some interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("\n");
 	exit(KSFT_FAIL);
@@ -158,6 +166,7 @@ int main(int argc, char **argv)
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 	struct vfio_pci_device *device = NULL;
 	int nr_irqs = 1000, nr_vcpus = 1;
+	bool set_empty_routing = false;
 	const char *device_bdf = NULL;
 	const char *iommu_type = NULL;
 	int i, j, c, msix, eventfd;
@@ -165,7 +174,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ht:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:eht:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -173,6 +182,9 @@ int main(int argc, char **argv)
 		case 'd':
 			device_bdf = optarg;
 			break;
+		case 'e':
+			set_empty_routing = true;
+			break;
 		case 't':
 			iommu_type = optarg;
 			break;
@@ -222,9 +234,13 @@ int main(int argc, char **argv)
 	}
 
 	for (i = 0; i < nr_irqs; i++) {
+		const bool do_set_empty_routing = set_empty_routing && (i & BIT(3));
 		struct kvm_vcpu *vcpu = vcpus[i % nr_vcpus];
 		struct timespec start;
 
+		if (do_set_empty_routing)
+			kvm_set_empty_gsi_routing(vm);
+
 		kvm_route_msi(vm, gsi, vcpu, vector);
 
 		if (irq_affinity) {
-- 
2.54.0.1099.g489fc7bff1-goog


