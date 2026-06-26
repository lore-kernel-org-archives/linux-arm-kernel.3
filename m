Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D3CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jjdh/fhaNd2JbtrBCobPcqX80InnjRHE8TkDXBPMD4=; b=3qUzIBL36+4rtcvNtcuW71638q
	GJDZcpECtYUmeuLwfayYo76aQzcy4MSh9HEAuf4Tvl6t5Qb1Xn9JGO9fJIBJUmjM46AyzCK42D/+o
	heNqN62LuyNAshTiYHJxVMbcs30f/mAw8KCKpeCq77qBPRAuNKm4Xj5B7xgP0/sNpdbcgNdYHZw/o
	fP3H8ojeoR2GMhay8A79iZR757MMsZwb2Q3YJFnuqh/vDiMA6Xtrf4a71IIlB4Lb6pmnjCjdgDfPn
	OqxrX2qEPZbSJcOMrnTw7bY4n5WSCs18ehHKJdsm9UtuzQ6ezdeVai+3Y8PTzALSWlkI6wpxNd2m/
	QWUPxfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDX-0000000BuYN-3KZA;
	Fri, 26 Jun 2026 21:36:07 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDH-0000000BuJx-3YEE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c80f89b64bso18558605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509750; x=1783114550; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jjdh/fhaNd2JbtrBCobPcqX80InnjRHE8TkDXBPMD4=;
        b=it5q/CDhRfpbwCz005Vj+QfqxfCj9t8/A9EUzU5CHhMbMZKh9ihdDfxY8YcoGR6oGS
         yHilWW0FMyGgp7nKhwN86gBvq3x7eoZhA96LNQ0pAsIAwIKu14nvduMozKrGKyP4tBHE
         aPAx+Ka/lTJidoDer0YrAijNNnRgLeJkU9UGHyBG4JCT8FOz4af/XwKeQF9AyY0uNOiq
         YvHoQdA2ox0p0fwYrH/l3yXPZqeamnkTT6QPgt6FtR20rpgZrSqdMLTQcJr4/f63CIUw
         1SwitIRu0Ey2jSP0TJfcdm672Wqcino62edsg5ydFV6MTPXz6O+vXBij3hGXZITyNbrB
         DEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509750; x=1783114550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jjdh/fhaNd2JbtrBCobPcqX80InnjRHE8TkDXBPMD4=;
        b=ZgaZ4rtZEv7v8FhcockkDqJNa1q1iOZ7aGlG/MyK7RXY3MwoYkrtGaYBt/YPhMYCzu
         Pp0S17mup2jwGutCznNGpugI5hG7s6OvKnAe6zXF3Dqp9BrjdfvKsrqV/g0NjiXsevIX
         r+eU8oxGNxWXC0OIA75swqYuv/rmIqtlU9fMhStq3LffbtQv6fk0Za4mgUN9wCIqHlGc
         17x78jS0U29Of+edXqrfE8f91XgI7Mif2/sItx50wTCOIhcmDYOV42I0+4QaG0DeqDO5
         1Mzsy29riVdhMh/vZkREnL/FV5pIT/U6OdtkBmjBFJtu6i6Fam9slLKi1fZS0k8EqgSa
         +9WQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzCXYqhNN1UR4s3NBQ9izhUyT7kH7F8ZUxAs+EJ5zhnX0r4FbR7wpCjnkSDlOrIHoScogngDNQHxHTR6Ca6DJF@lists.infradead.org
X-Gm-Message-State: AOJu0YzgnFK0N+mhX/pq+1wb7gkwMgKQBx4R9Md1KVTOiTPIsU+x6blo
	GYVnaf85Gh3mfZtdIzphB7GIBbXs51GgJ52K4Pjfx7jIWhL+5X/3GPFRcissXvoaNuJAqx08iSx
	14laWBg==
X-Received: from plxx12.prod.google.com ([2002:a17:902:e04c:b0:2c7:6c19:9ae9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b08:b0:2c6:937a:249
 with SMTP id d9443c01a7336-2c7fc8a2889mr83480545ad.29.1782509749463; Fri, 26
 Jun 2026 14:35:49 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:24 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-12-seanjc@google.com>
Subject: [PATCH v8 11/20] KVM: selftests: Verify interrupts are received when
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
X-CRM114-CacheID: sfid-20260626_143551_906072_507E6C2B 
X-CRM114-Status: GOOD (  13.26  )
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
 tools/testing/selftests/kvm/irq_test.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index 70b2c9cac279..fd386e3e9ac3 100644
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
@@ -137,9 +139,10 @@ static const char *probe_iommu_type(void)
 
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
@@ -172,10 +175,13 @@ int main(int argc, char **argv)
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
@@ -204,7 +210,12 @@ int main(int argc, char **argv)
 		printf("Using device %s MSI-X[%d] (IRQ-%u)\n", device_bdf, msix,
 		       irq);
 	} else {
+		TEST_ASSERT(!irq_affinity,
+			    "Setting IRQ affinity (-a) requires a backing device (-d)");
+
 		eventfd = kvm_new_eventfd();
+		irq = -1;
+		irq_cpu = -1;
 	}
 
 	pr_info("Injecting interrupts for GSI %d (guest vector 0x%x) %d times\n",
@@ -228,6 +239,11 @@ int main(int argc, char **argv)
 
 		kvm_route_msi(vm, gsi, vcpu, vector);
 
+		if (irq_affinity) {
+			irq_cpu = kvm_random_u64(&kvm_rng) % get_nprocs();
+			proc_irq_set_smp_affinity(irq, irq_cpu);
+		}
+
 		for (j = 0; j < nr_vcpus; j++)
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
@@ -241,8 +257,8 @@ int main(int argc, char **argv)
 			cpu_relax();
 
 		TEST_ASSERT(GUEST_RECEIVED_IRQ(vcpu),
-			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d\n",
-			    vcpu->id, vector, gsi);
+			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d (via CPU %d)\n",
+			    vcpu->id, vector, gsi, irq_cpu);
 
 		WRITE_AND_SYNC_TO_GUEST(vm, guest_received_irq[vcpu->id], false);
 	}
-- 
2.55.0.rc0.799.gd6f94ed593-goog


