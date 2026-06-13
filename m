Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5386BCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZ0eZe4fkiDCH3zVpYK4NQsEFBnaL8FaPs5jLK/npco=; b=REkjiOiuvTz6Qr6W6rBZl9WOMx
	9rR/YqY04QIRGLV4yChC3O+WExxQUGwGIq3mZtp8pJ47vyFvfH5taPtqEes4IFs/yjJYZ+XjPxRPZ
	TNbcKkhTnP89Mp6rLlqtEczmr3rEbK3wo2pczWUwjeeivAu0pfpOJwdLhzdn4B7CqClEby8xUom8L
	cgSL7lpI9QQD0FK0ftFmtpQmCoNlORV25Tuq11gZ27D8vfRoQWqcgjK9QRY0qgpISlMaw0kmnfMhN
	P/sYNG6Quh0BlDsYmW5urttqq0Gh/yFGGg9h5bjjli8tjvazknKaagAA0/lrKIPxoZsK3Y4pyyUNc
	97hjJZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7V-0000000Bo0P-1ubD;
	Sat, 13 Jun 2026 00:21:05 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYC7G-0000000Bnep-2LAH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:20:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so1100139a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781310049; x=1781914849; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xZ0eZe4fkiDCH3zVpYK4NQsEFBnaL8FaPs5jLK/npco=;
        b=Na5QWX9aCULRub2y84k30+V+5Hl2HKJZhYHkX85GdTnjs9aKeZ+zJ0Br71ipMQvlpj
         cumP+9U9kVpahCZdTscO16x0YE01g0ui3uP0rLW7v+oNSJcfZ1+g00jg8uoFUdboKs4q
         V0imt6hLLKxJBCRm2ibAqtDvkUH7ZKlc/dqNhcCyGfSKpKSnUI0qUV1cPaaLU/stWeXD
         vNtTLdhc0gygVfsDhiKzahgTsOZu9yorocUJskUKP3Xw0tnGyOE4J+kAObr89Pd9emzS
         72V/jjVF6GWI8fuRHuUx8Aw3JUiZfWuJm29mUjqXpcEuyt0PWCOzZ9GA4GZwz+Q1SXNi
         X4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310049; x=1781914849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZ0eZe4fkiDCH3zVpYK4NQsEFBnaL8FaPs5jLK/npco=;
        b=mgKJOwy9RDcBK5sIM0qBAA4Aj1LsN3DRtR4PqSGYuFX2+2CGjwOMMi7BtRLOqoLv6H
         IgYyB/Z2ubSrdiJnU06lzvqkTYzLFFQI9yvH1lH6DeDhWytgufK9UB5jvkfh+bWotOAQ
         GRmZrNmWIvukADa0jqMQwdC4i0q52mweHXrq+vtxYeslxnMLbsRkqwe/AZbhcntrJQ08
         eAFnnvUMdPMERlzcdOaEyJyXPOkV8yz2BWzrd8gu0LXyPC9/JLP4HsOUW7DOus3Vef7l
         uvB/w/Dk0L4Kj6+HGsJG29booPAnN1OmuF8oj89tezuaIjzuS9efT4157hJ+GUUfWkuv
         sZYA==
X-Forwarded-Encrypted: i=1; AFNElJ8u+X/X3q5MRtarfsO8a1wkI/i3+fkPyb1xgZx0aapgeljvovXx8RYvXozZdmcii4fV8xzD5rUx94QNs+WgPLOU@lists.infradead.org
X-Gm-Message-State: AOJu0YwfUqVOuxH4fdGxLhNjLb/2DOPFAiFDtwOkAZ8D755KQBuoJTTl
	++l2XqVUaCJ/dMyzNjq93JSKG2br6kXl1HRv564vakhOFhDMQlwjJqUE2aYy9WAtly+4z7rranB
	guZz6uw==
X-Received: from pjty19.prod.google.com ([2002:a17:90a:ca93:b0:369:bec6:fd63])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8e:b0:368:ac5f:d31b
 with SMTP id 98e67ed59e1d1-37a040b3ec6mr5340250a91.24.1781310049202; Fri, 12
 Jun 2026 17:20:49 -0700 (PDT)
Date: Fri, 12 Jun 2026 17:20:22 -0700
In-Reply-To: <20260613002031.745413-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260613002031.745413-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613002031.745413-12-seanjc@google.com>
Subject: [PATCH v7 11/20] KVM: selftests: Verify interrupts are received when
 IRQ affinity changes in IRQ test
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
X-CRM114-CacheID: sfid-20260612_172050_625125_5EF29B45 
X-CRM114-Status: GOOD (  14.73  )
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

Extent the eventfd IRQ test with a '-a' flag to randomly affinitize the
device's host IRQ to different physical CPUs throughout the test.  This
stresses the kernel's ability to maintain correct interrupt routing and
delivery even as the underlying hardware IRQ affinity is changed
dynamically via /proc/<irq>/smp_affinity{,_list}.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Josh Hilke <jrhilke@google.com>
Signed-off-by: Josh Hilke <jrhilke@google.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/irq_test.c | 27 +++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 6888be54ee4a..c01aa313f719 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -12,10 +12,12 @@
 #include <unistd.h>
 #include <pthread.h>
 #include <sys/eventfd.h>
+#include <sys/sysinfo.h>
 
 static u64 timeout_ns = 2ULL * 1000 * 1000 * 1000;
 static bool guest_ready_for_irqs[KVM_MAX_VCPUS];
 static bool guest_received_irq[KVM_MAX_VCPUS];
+static bool irq_affinity;
 static bool done;
 
 #define GUEST_RECEIVED_IRQ(__vcpu)	\
@@ -125,9 +127,10 @@ static const char *probe_iommu_type(void)
 
 static void help(const char *name)
 {
-	printf("Usage: %s [-d <segment:bus:device.function>] [-h] [-t iommu_type]\n", name);
+	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-h] [-t iommu_type]\n", name);
 	printf("\n");
 	printf("Tests KVM interrupt routing and delivery via irqfd.\n");
+	printf("-a	Affine the device's host IRQ to a random physical CPU\n");
 	printf("-d	Use a VFIO device to send MSI-X interrupts instead of manually signaling the eventfd\n");
 	printf("-t	Override the IOMMU type to use (vfio_type1_iommu or iommufd)\n");
 	printf("\n");
@@ -160,10 +163,13 @@ int main(int argc, char **argv)
 	int i, j, c, msix, eventfd;
 	struct iommu *iommu;
 	struct kvm_vm *vm;
-	int irq;
+	int irq, irq_cpu;
 
-	while ((c = getopt(argc, argv, "d:ht:")) != -1) {
+	while ((c = getopt(argc, argv, "ad:ht:")) != -1) {
 		switch (c) {
+		case 'a':
+			irq_affinity = true;
+			break;
 		case 'd':
 			device_bdf = optarg;
 			break;
@@ -192,7 +198,11 @@ int main(int argc, char **argv)
 		printf("Using device %s MSI-X[%d] (IRQ-%u)\n", device_bdf, msix,
 		       irq);
 	} else {
+		TEST_ASSERT(!irq_affinity,
+			    "Setting IRQ affinity (-a) requires a backing device (-d)");
+
 		eventfd = kvm_new_eventfd();
+		irq = -1;
 	}
 
 	pr_info("Injecting interrupts for GSI %d (guest vector 0x%x) %d times\n",
@@ -210,12 +220,19 @@ int main(int argc, char **argv)
 			continue;
 	}
 
+	irq_cpu = -1;
+
 	for (i = 0; i < nr_irqs; i++) {
 		struct kvm_vcpu *vcpu = vcpus[i % nr_vcpus];
 		struct timespec start;
 
 		kvm_route_msi(vm, gsi, vcpu, vector);
 
+		if (irq_affinity) {
+			irq_cpu = kvm_random_u64(&kvm_rng) % get_nprocs();
+			proc_irq_set_smp_affinity(irq, irq_cpu);
+		}
+
 		for (j = 0; j < nr_vcpus; j++)
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
@@ -229,8 +246,8 @@ int main(int argc, char **argv)
 			cpu_relax();
 
 		TEST_ASSERT(GUEST_RECEIVED_IRQ(vcpu),
-			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d\n",
-			    vcpu->id, vector, gsi);
+			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d (via CPU %d)\n",
+			    vcpu->id, vector, gsi, irq_cpu);
 
 		WRITE_AND_SYNC_TO_GUEST(vm, guest_received_irq[vcpu->id], false);
 	}
-- 
2.54.0.1136.gdb2ca164c4-goog


