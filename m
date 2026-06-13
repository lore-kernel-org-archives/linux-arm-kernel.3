Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C9CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIJ8Uf8PcJidyyeBqiFcFwTrdNm0vIWb+NN/Ok5zc0s=; b=HrqmeQDtz6hW1Qn0gWyYEN6pY0
	KddWAAA7MAA5Q/RUBVYEMdsgUVU3XLX0DuYdlSGKbmI/u1Us5pRr2rUlji+4spq6nHeEZwGhKkCkz
	jRxIEzWa9eArpmOIpjz2nERwsHJ7Swneq4FqLdeRm+7Mmgugmwb2Drv4f+CpJ6S9wluvwwIWiklzV
	igpT+hP4R84dgh2pHy5O3CI1yOQ5ziBjvE0svCl2lKmByD8IbuC7ggSWHDyBzz21PX468V5rpZwVT
	ZO3rTzABOo4Hwge94uO3uw9adCyCY2ur+O77P6NYut7UDvc30Fas2Rr5JUI1Mm/y1XgA45NXR4B9d
	OKnX8aQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7V-0000000Bo0d-2OUv;
	Sat, 13 Jun 2026 00:21:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7H-0000000Bnh7-2fOS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:53 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-84235f9b91fso1177886b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310050; x=1781914850; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rIJ8Uf8PcJidyyeBqiFcFwTrdNm0vIWb+NN/Ok5zc0s=;
        b=jwlv6+QY8sPxJhesnvOJQin3J1zQQeQzbCdmzy1ToW/W/ZDFYWuMAh1+sJQO4J3IXV
         kQjiBYUzKEuUji/yf0bamfj3IGfnKghiLEbgogGhfFFEdj1kc7uWcbO6o7oGTo83aFqB
         SHVTIb2nuEC/rqDyLAN4rtzmCwIJR3GLOYNqHAuBFZ8i96Kizs53zKQ+zTbh+YUiZPfc
         cbxbF+rOG5tWQlBFcM1/qZ/RaezEJtG65bZYawMNnD43tRMQuowaNfG+E9BzM4iTI2Me
         ocv+VtjdUs4xPCXS8s89FBj5SyrQ9x+UpMINftx/ajhMkl8vkafsVy9QBUUoZST9OVIR
         Xv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310050; x=1781914850;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIJ8Uf8PcJidyyeBqiFcFwTrdNm0vIWb+NN/Ok5zc0s=;
        b=sY1RPzNwx2vk8N4mec4qodgZtjVyktQcf9HtD+H2oVR1LAI1SamuxUpXPq6lgFnPHD
         zuqdOeBw4iqTjW02dTP/Sfp3zevgyXh2JfPgte3rxqot/aD3sgRjlrz7Yt0JbOCVVdWI
         WcntX67su2QjaqFd/Wb2QvZAy3HXFfnkblNFRZpZD2nf6ixYKpNlH/T+lWIQU/XyN3EH
         ZQ7ZwzAPZ87oUIuf+MMs3cJ842gLUoOqzjJlk0yjQS9TmXeNczfyiywroJeje9XzpgrV
         Ak8TZ37cKF6l9DMrl8kuurC/pLyznPb7WCuOU8b/5ueYqTPfl4G/pMTUQ4V07lK6R1Qr
         DzVg==
X-Forwarded-Encrypted: i=1; AFNElJ80pw7PMUJkzZ4FegjqCvrCzJ1H76+gBzy8slNrWjy+oeFT+WZoy/lfFs58Rh0nXoUso0K608gSnRaDysWUgQeN@lists.infradead.org
X-Gm-Message-State: AOJu0YzRs3plmihrlK3IlyhQu9v8eU7cCFmvpEKOEIjqAPXJuc1253+u
	qbyQvw9B+aUuh8ydv4fzwJ9w2gsmCHIWEfoXcXo3kl6gs3RJKR57k2lu59pUBbSWPA+qNUX6TRq
	Q282fJA==
X-Received: from pghm14.prod.google.com ([2002:a63:f60e:0:b0:c79:87d6:650a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:486:b0:39f:a8fb:3354
 with SMTP id adf61e73a8af0-3b783b9cceemr6105295637.17.1781310050361; Fri, 12
 Jun 2026 17:20:50 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:23 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-13-seanjc@google.com>
Subject: [PATCH v7 12/20] KVM: selftests: Add option to set empty routing
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
X-CRM114-CacheID: sfid-20260612_172051_710563_6659C4F0 
X-CRM114-Status: GOOD (  14.37  )
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
index c01aa313f719..2356912e2272 100644
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
@@ -223,9 +235,13 @@ int main(int argc, char **argv)
 	irq_cpu = -1;
 
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
2.54.0.1136.gdb2ca164c4-goog


