Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685BAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfGxV+xN5MQJzo1OxAcNftwHJizNMsItpsF+xT3GCNY=; b=LdVEnp6vrMsbXRfcwUCqdiUPBk
	J8H/WDH1v1cvIw8YeCSbXMlDKJqdwzCL4lKVK9hnmpgEbxjgAnNfmAaXAz6xMBL241A1ogMc6+wyN
	iulI1hEiN7Ek0c+XHFURjFTK+dN2Dxuax6SJavR6fMdxaOLoxNoxM4sna2dzLp3zAggZJQT4qUkz2
	K892OUZO+MBxDF42yZpdKzrFrPY2xu4mleaAId8SS/ZT6G9HCTrBG69rFGJqtZHILqZ2Z1EPkgpW9
	OhtaylihGCmT7rapjcpvRQX0v1/XvadYPk6Zbt7HP5YX9VNsnZn+cDCe8Y8i18eMBuwXp3Ywk3oh7
	HCenb9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDX-0000000BuYe-3r7O;
	Fri, 26 Jun 2026 21:36:07 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDI-0000000BuKk-3tTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:54 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c80907fdc6so12000745ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509751; x=1783114551; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BfGxV+xN5MQJzo1OxAcNftwHJizNMsItpsF+xT3GCNY=;
        b=p1rSMwH98jPWMmd5EEMK4n6SbcehJnEHQcOn6W5ws+obXPuDMyYfx8sWK5dPU7xviQ
         2AZn+OyAOYVqPoRO5IW3ypHOtf+BTSXunjnFy0F4gKAjYMGPLmhYfURO/fwkQpLD8sH/
         DOlp9OUYYtUWVkhN1jKvbLDPr6GmyTa/UA2wUvstaNyAbFxU4NM6+v0S30iUbvY7J6eh
         7I576zBzs+iqMW1ydBFGSBDGmXpxo0XmNmjPLTbNpwDVgLXfnZiKZlceQDNU71b9O2hv
         b3cDcbNdWFVy7CgOZu7lGEUwPybuENyxm2DFXchPWUspdY+1OI+we8siBPkNmoZNmLsR
         VnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509751; x=1783114551;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfGxV+xN5MQJzo1OxAcNftwHJizNMsItpsF+xT3GCNY=;
        b=CV7q3pna6anVxeqMsqt6+Tsp4P8Xw/rDnrfHq8J+Kfq3eu/r/OEl70PcMIF4q2yLBV
         6xdjn44yDy++c+M1+EwJ/6SFLdQ7TVE2yyQ+viK0SUQk8j6rGAe3XZ/8dMMjPesb6NUW
         AippcXxRxeYBjG01ebuMFfeTVNHd/tf/5go8UFvar++t+mhqUKQ6QxxuI0fBZknokQoc
         G8qwF9L2shkoOXWaII/b3LmKpG0qqnj7fDR/VDeCLxiobC4eRV3WQp1wNQN3QMYCd4mG
         NCZN8/a29Po/njStcgmylA/13gL5x68OcKgz5NXNtf2wMzRN++lXMo0dpf86ElSBgYBt
         4N9g==
X-Forwarded-Encrypted: i=1; AHgh+RqtU0aeqJxSwUhDTSu71ODneASF+LQeiV6SZfjzKvWJES418LLcuXxTVb6TveQI8UBVXmDKvKi9ej2rXWRvo6Pz@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh81txT+SyhZuS8zKHJbjpr6wddzgj/b0aKELqjTIbRpW7k/UD
	gm1ug9l1QpY24ZciL+WL0ETILbsF1X2FCWzFczegeJvsLdMCR6BjKe7C+xJCB4XxWJoG1Uy2rBY
	C4SdB6Q==
X-Received: from plbmj7.prod.google.com ([2002:a17:903:2b87:b0:2c7:f558:fbb4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f786:b0:2c0:bb2d:a30b
 with SMTP id d9443c01a7336-2c7fc754bebmr76656145ad.32.1782509750610; Fri, 26
 Jun 2026 14:35:50 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:25 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-13-seanjc@google.com>
Subject: [PATCH v8 12/20] KVM: selftests: Add option to set empty routing
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
X-CRM114-CacheID: sfid-20260626_143552_974816_5999601B 
X-CRM114-Status: GOOD (  14.35  )
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
index fd386e3e9ac3..fd03ec940362 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -121,6 +121,13 @@ static void kvm_route_msi(struct kvm_vm *vm, u32 gsi, struct kvm_vcpu *vcpu,
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
@@ -139,11 +146,12 @@ static const char *probe_iommu_type(void)
 
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
@@ -170,6 +178,7 @@ int main(int argc, char **argv)
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 	struct vfio_pci_device *device = NULL;
 	int nr_irqs = 1000, nr_vcpus = 1;
+	bool set_empty_routing = false;
 	const char *device_bdf = NULL;
 	const char *iommu_type = NULL;
 	int i, j, c, msix, eventfd;
@@ -177,7 +186,7 @@ int main(int argc, char **argv)
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ht:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:eht:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -185,6 +194,9 @@ int main(int argc, char **argv)
 		case 'd':
 			device_bdf = optarg;
 			break;
+		case 'e':
+			set_empty_routing = true;
+			break;
 		case 't':
 			iommu_type = optarg;
 			break;
@@ -234,9 +246,13 @@ int main(int argc, char **argv)
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
2.55.0.rc0.799.gd6f94ed593-goog


