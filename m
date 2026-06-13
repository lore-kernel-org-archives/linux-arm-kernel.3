Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF5ECD98DD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szhm3cLvTGIMVFhVv0doCPKOe4ubDZorg2py5w134gs=; b=HLGg1ovCr/CAtFJ2xkDyY/Dihe
	mRNk2yfEt0F9r9C4g6GARjdHSkgSxZc9C0xganFiJkMaLzYNwJ3jMJCeXibKzdVD9N7xf/043lqxq
	VXV7rGGiO/1K8LLKrO8jWpYpcjH2JZ5rgGb0vGjia4dhm4zPXKs1DvYLYR9CxDY9kAbwl3kj0PQJL
	23uzrQToBCR4ObaixBx4gGYrP9SJ+RPiK+7qczQ9IleujElI3t21qw1Bz9Husa/8Jnesbq/reNJI4
	BQbSAcNVmnHHAiOU7ezfER6AYOTqbu+Bby11BcMBE7sPWAXwEljL5ZQIPGtJtrBxTx2V13nfDmcMJ
	uZ9/KLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7W-0000000Bo44-2yXR;
	Sat, 13 Jun 2026 00:21:06 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7P-0000000BnsX-3GNe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:21:00 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c8611b27631so1455444a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310058; x=1781914858; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=szhm3cLvTGIMVFhVv0doCPKOe4ubDZorg2py5w134gs=;
        b=MdsczEIOuLxlBg81WOj8CuzNGKrLpaweGBFIuspK4KEiwm/vuPzcATnUNXQh2BCRYV
         dV48361NQblGmzNgg/1SrM05tD1iVmnckgAwyOAxryQBdtp4qJzeCyRgMgcWR8l42W4t
         MTOxCKjy75G+u66y0M4Ir5DSk1K2r9Yp5vgaJrIVn4XJYITm7tPzFl+OTfmZRcBMcaHm
         mdsOABLj+kMm1c7HmVqmJKEHOMR+1IXEjFWv8ROe00FsAIls302GGKZtDKt9vgU4D5Jp
         Cy+DWd2qHi/r762toQ460Nr/VgDZ8RRcgr4g76KP3WPBkueNv/B+z2tPtUQxVyea4zwt
         /9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310058; x=1781914858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szhm3cLvTGIMVFhVv0doCPKOe4ubDZorg2py5w134gs=;
        b=K5rrkbqtvv2op5uZ8NW+MVw5GzSC8WX/ypG4CaBSnq6fB3Ggqe/m9emDCMNh8OuWKn
         EN306KChxUA9IhTOZcjlWm9AI1GlB/YjXosMeXQdlctIXKgSQLNdJomr9nQ5Qp/hunx1
         k1IujFA4zvHAl8FgghNQc2WnRwXPE4WjbuTErVaHdtBNeA/1fNwzsO1Tl5WMktoRd04N
         /lWzZgy614xIDTeHyv3MJwMcOeA57pX0RQa6K5zihhoFfzoh9els1001nppCoaXFiNoK
         bgAk4XQNplsnibYgBjew1f4MDZ/dtIVvQNsDLx0QwgjG9Z92EXiP2gNPvKcxbpicKJ2N
         RjzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jBUPw5W7ce3xnE4SEae8/R5cxWDvJF+wEWNGrkKAej100hgGIgmHSIW7UIZA30GmBLZPEMb4tUlCDrdjZw3rH@lists.infradead.org
X-Gm-Message-State: AOJu0YwTwMWeLedUJVZLjXqeG0NPTN/DI6ktSlDG3vRj1QoJq0A8FRbf
	tzE1Mw7+l+aq009G6pI+QT6VXbjMT7YDp5pe5HO+4SpbxhPiCrexcM3/PzBsjnop0gmVi3CUur5
	sH56dvA==
X-Received: from pga4.prod.google.com ([2002:a05:6a02:4f84:b0:c7c:4b52:febd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:e545:b0:3b4:b259:74e3
 with SMTP id adf61e73a8af0-3b78166f338mr4771279637.31.1781310058103; Fri, 12
 Jun 2026 17:20:58 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:29 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-19-seanjc@google.com>
Subject: [PATCH v7 18/20] KVM: selftests: Verify vCPU migration during IRQ
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
X-CRM114-CacheID: sfid-20260612_172059_830892_1DE27D04 
X-CRM114-Status: GOOD (  13.67  )
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
 tools/testing/selftests/kvm/irq_test.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index d2d861119854..5049cb69cd95 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -145,13 +145,14 @@ static const char *probe_iommu_type(void)
 
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
@@ -183,12 +184,14 @@ int main(int argc, char **argv)
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
@@ -202,6 +205,9 @@ int main(int argc, char **argv)
 		case 'i':
 			nr_irqs = atoi_positive("Number of IRQs", optarg);
 			break;
+		case 'm':
+			migrate_vcpus = true;
+			break;
 		case 'n':
 			use_nmi = true;
 			break;
@@ -243,6 +249,9 @@ int main(int argc, char **argv)
 
 	kvm_assign_irqfd(vm, gsi, eventfd);
 
+	if (migrate_vcpus)
+		kvm_sched_getaffinity(0, sizeof(available_cpus), &available_cpus);
+
 	for (i = 0; i < nr_vcpus; i++)
 		pthread_create(&vcpu_threads[i], NULL, vcpu_thread_main, vcpus[i]);
 
@@ -271,6 +280,9 @@ int main(int argc, char **argv)
 			proc_irq_set_smp_affinity(irq, irq_cpu);
 		}
 
+		if (migrate_vcpus)
+			pin_task_to_random_cpu(vcpu_threads[i % nr_vcpus], &available_cpus);
+
 		for (j = 0; j < nr_vcpus; j++) {
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
-- 
2.54.0.1136.gdb2ca164c4-goog


