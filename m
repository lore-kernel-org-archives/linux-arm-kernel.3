Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAB4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 22:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37AjqTPC3Cofz5c5D7lHCWd7gT64KCMX7KZ8N6F2Usg=; b=0ydJPP+lx+hzUutG3Q+Ih5+75e
	MuJAh64eQTf7bGMCiZUIVQYoge/6zGYn5p+ZlLZs5sdfh6AnJhWxyiY7YdPKqUYgNCNnvXLFV+YvV
	9raFI/kxm763Z+iln5KU1GDGA303qCC2gQ03sfavaijU4+89YlLiRrrRU8u7ocM4lfgmGCI3DXQB9
	R4fqqRNRKztuWkQBGyaD68ugYa0it52vxmIrV0UNFtwLL41QHa31sbdHcdNugiN62qHGjqABcS3X1
	tuwhYqooVIWLEyG35eMlSllv16vDWPi7fmQ/A4uqIgivnhGw7rSstBv7AalVYwc0AYId44ja9AwcU
	rFwRmjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDZ-0000000Budg-3OBd;
	Fri, 26 Jun 2026 21:36:09 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDP-0000000BuQ0-1zoY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:36:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-37e0a1a4b5fso1532301a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509758; x=1783114558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=37AjqTPC3Cofz5c5D7lHCWd7gT64KCMX7KZ8N6F2Usg=;
        b=htkuiULriB9uaZhlAtFHsQiwQg6p/Fsp1K94zp0XK2iKLttPuQinGPXqc5Kp7D4fK8
         nMwHDa9MoLfslCec1UQQyyH7IqSWqLrN5XcqF6+wEAORks9IWTfQwbCpNFxtYM7tjkiI
         iFxWDYl6ponZ1HZXFMmF1cR0p3X5ohZhbUnD5E3pqCSy+Bi0/uwAf/imKVl79PY/Jx8d
         yA0mPSDQ6TNJ0zjiGriH+0BCn4rBjDIkULHxeDfIufhcPHZm56cBpfA2Jbaqp5z32GII
         Eesz2EnrwOE4ph/+zGbGeTenP8eo4yE1kz3fruf8+AJdADTRKIn1sshr4QV+9kF5SasU
         4f/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509758; x=1783114558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37AjqTPC3Cofz5c5D7lHCWd7gT64KCMX7KZ8N6F2Usg=;
        b=KDarpJ13G0n7DqZ0nPmMXZHXr4GKDihtSJeyR7+pxizHMSXsDZiYL6srlzj4D9NOdR
         J+JiJ1YcdtAa3XrC/zIfwvAWe9H8tXXfACZlSQ4/CvWI6NWS1UEC/NNF5TkBMXafscNJ
         sbSHoJlleOxXskIeaZwbBdTtrqfSkBumZzPPGDi3t7JcBRXCZvw/Te/bk+o+Y2tUJau+
         ZIqP1CAeaI2/nF6nKNBNQYK+wCqtcJkQnWfKWfMTIcFBfxzu47XDd4ddsJVucGmuOZ9r
         YNNGUiVJ7khiubfB7TPS1NRrXbYEc4qwn0uOfzN6jiGsYTBWqCD6iE3khN4F6skhj93R
         1MvQ==
X-Forwarded-Encrypted: i=1; AHgh+RogbRncfC+pMRXJ7tJZ9SHjh2b6QQjfWaYpFbhR0mjI+gu/E/5bULdM3CrMZkjQAGq2rrBMG4Iato37K94cAaQu@lists.infradead.org
X-Gm-Message-State: AOJu0YyrOPhla5jWJtbxxSsytIQTqPju6OAblQnyddxNlBMSdgb3yZyN
	Ivvf7e3sSd8PnzUPH+n7OwqsqBD4w8b4sesz3wno+kA5VtW8TG83a+t0YGPqEXIAltePChL8VAw
	KUHZAdg==
X-Received: from pjyl13.prod.google.com ([2002:a17:90a:ec0d:b0:37d:f8a4:accb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cd0:b0:36b:9daf:1504
 with SMTP id 98e67ed59e1d1-37dfa250f22mr8077365a91.14.1782509758025; Fri, 26
 Jun 2026 14:35:58 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:31 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-19-seanjc@google.com>
Subject: [PATCH v8 18/20] KVM: selftests: Verify vCPU migration during IRQ
 delivery in IRQ test
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
X-CRM114-CacheID: sfid-20260626_143559_523906_0A91D5B5 
X-CRM114-Status: GOOD (  13.46  )
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

Extend the eventfd IRQ test with a '-m' flag to have the test migrate the
target vCPU to a random physical CPU before triggering its interrupt, e.g.
to validate KVM's ability to update device posted IRQ routing.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: pin one vCPU at a time to simplify things, use main()'s affinity]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 48520c6dea69..c0ff6e60b167 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -157,13 +157,14 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-n] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
 	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
 	printf("-d	Use a VFIO device to send MSI-X interrupts instead of manually signaling the eventfd\n");
 	printf("-e	Set empty GSI routing in-between some interrupts\n");
 	printf("-i	The number of IRQs to generate during the test\n");
+	printf("-m	Pin target vCPU to random physical CPU before triggering interrupt\n");
 	printf("-n	Deliver 50 percent of IRQs as non-maskable interrupts\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("\n");
@@ -195,12 +196,14 @@ int main(int argc, char **argv)
 	const char *device_bdf = NULL;
 	const char *iommu_type = NULL;
 	int i, j, c, msix, eventfd;
+	bool migrate_vcpus = false;
+	cpu_set_t available_cpus;
 	bool use_nmi = false;
 	struct iommu *iommu;
 	struct kvm_vm *vm;
 	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "ad:ehi:nt:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ehi:mnt:")) != -1) {
 		switch (c) {
 		case 'a':
 			irq_affinity = true;
@@ -214,6 +217,9 @@ int main(int argc, char **argv)
 		case 'i':
 			nr_irqs = atoi_positive("Number of IRQs", optarg);
 			break;
+		case 'm':
+			migrate_vcpus = true;
+			break;
 		case 'n':
 			use_nmi = true;
 			break;
@@ -248,7 +254,6 @@ int main(int argc, char **argv)
 
 		eventfd = kvm_new_eventfd();
 		irq = -1;
-		irq_cpu = -1;
 	}
 
 	pr_info("Injecting interrupts for GSI %d (guest vector 0x%x) %d times\n",
@@ -256,6 +261,9 @@ int main(int argc, char **argv)
 
 	kvm_assign_irqfd(vm, gsi, eventfd);
 
+	if (migrate_vcpus)
+		kvm_sched_getaffinity(0, sizeof(available_cpus), &available_cpus);
+
 	for (i = 0; i < nr_vcpus; i++)
 		pthread_create(&vcpu_threads[i], NULL, vcpu_thread_main, vcpus[i]);
 
@@ -266,6 +274,8 @@ int main(int argc, char **argv)
 			continue;
 	}
 
+	irq_cpu = -1;
+
 	for (i = 0; i < nr_irqs; i++) {
 		const bool do_set_empty_routing = set_empty_routing && (i & BIT(3));
 		const bool do_use_nmi = use_nmi && (i & BIT(2));
@@ -282,6 +292,9 @@ int main(int argc, char **argv)
 			proc_irq_set_smp_affinity(irq, irq_cpu);
 		}
 
+		if (migrate_vcpus)
+			pin_task_to_random_cpu(vcpu_threads[i % nr_vcpus], &available_cpus);
+
 		for (j = 0; j < nr_vcpus; j++) {
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
-- 
2.55.0.rc0.799.gd6f94ed593-goog


