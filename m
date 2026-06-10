Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE189CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSOZjviZd40BWOUFk+/WMboICZddvNeGN5s5yOjzJRQ=; b=lP5/8H3wuiOEOy2ZvlDapKbJ9R
	mHFRU+3kVELCdUtEMLat8lpd/aJFnCkny68UW0Uq3c/QJmhltuZydzeGKAjjngOiq1pPIOabcW58B
	Htp+otVXtCzmrh7J/zgX6whYYqd4S2Y1Rq6bVBP64JmIny9JIq1aYsP1UmSfPw16RazWgf5O5xIDe
	QppWTUJ6lKOnHS0OxJkFHQucmA4lE9/HX21EmnH2hEoVem2xXXJfZBOS3e+n5iRO2cTecxV919rrc
	HO1OyyWNzhw7SqHHdnPlqR3K441OA7uTaAY8+LP7gdUscJukEjryE7pI9hunwaYK6ibw182WN10nR
	vwC4F7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Ci-00000006ZZF-0pPQ;
	Wed, 10 Jun 2026 00:54:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cc-00000006ZU3-2iV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:53:55 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2bf08c2a24bso58890395ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052833; x=1781657633; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wSOZjviZd40BWOUFk+/WMboICZddvNeGN5s5yOjzJRQ=;
        b=fRsi6IquFsMyQ/CasO/QSSYTOWySpqwvJli0Xsle83Qxi/LLuM95kt/Y7yniP4tXNR
         Xpfv++uy/WIfpDG+Pw5M6PMmHMYhB4ezvBS2FS2JSu/PQI4JWTSLjjCJdQOPYB7G3b6I
         1nnuXXQx3RJk194IoqNNizOmH7QOXFr0nCFakY8VoTeZLAzTxSaUatOKpjIDdBwzWp/D
         rX0u+L44gu9NEZxaQbaumhRxFZHGtabgA30qdZhB7UsIjo+1RSrZgqR6iCrUFDPDJ2Po
         8CI3ZceKkrJaOu2tFcWPey1LGouhNq3Of5reo70+qmuV2vIoPGXV0ojboV5SpCSmvlg1
         MwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052833; x=1781657633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSOZjviZd40BWOUFk+/WMboICZddvNeGN5s5yOjzJRQ=;
        b=FiHmJZsj5NpqxEQ7dHk2If412DFMfbH2hVmaTEvW2l1OODl5fH6/6yn2OFnPMY7LLP
         TXxJEgyajk+SPQtxR4wHB+5YylBSdaluH08kJjPyIVrG2e1NYThdYz/R/slKrLVpo8Jh
         hIrwdXO2lagImUA8o0J+S5SH66jVBMbsHuMMFWtvXG094xEMUhR8aNN5xJafiRM5zvVZ
         FA/nU4sjCuPCkhqTRLbG8eR4l00bGEGQEKlU3EO3HoYf2XbcXoTLCeM5RIZkjb1OsrE+
         aLJaV4Pvs2cEYvQikDMhI4Ym17iO6fnJIN/wOIWHh62nac+EeTxDw/fEjtD/QEVVVd0i
         8KxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jf0MQsm7l4X4W+g94Lxjpm7p1TNI8fp5nKpPnZSZYBHE6ZEXG0NIw8FehNFxkrjLIvdqrSjPev78iewpBdKkZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwlL6FC0xEsfnLGt8aje9Vg2oex4I54/uESQHFaeX+6KZcGgrma
	1LOS1Pr5fiBsX4C1dpbwvHiVcydzwAal7+5a6STCOMf3Mj7IV88TBPDRZCZD8RdjJpnGWVNV9rz
	ml29aOg==
X-Received: from plbkt16.prod.google.com ([2002:a17:903:890:b0:2bf:2609:e7bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2381:b0:2c2:27be:39a7
 with SMTP id d9443c01a7336-2c2a1c9ac2emr62573145ad.29.1781052833323; Tue, 09
 Jun 2026 17:53:53 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:29 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-10-seanjc@google.com>
Subject: [PATCH v6 09/18] KVM: selftests: Verify interrupts are received when
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
X-CRM114-CacheID: sfid-20260609_175354_714155_3148C70A 
X-CRM114-Status: GOOD (  13.94  )
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
index 6888be54ee4a..9e2287490262 100644
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
@@ -192,7 +198,12 @@ int main(int argc, char **argv)
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
@@ -216,6 +227,11 @@ int main(int argc, char **argv)
 
 		kvm_route_msi(vm, gsi, vcpu, vector);
 
+		if (irq_affinity) {
+			irq_cpu = kvm_random_u64(&kvm_rng) % get_nprocs();
+			proc_irq_set_smp_affinity(irq, irq_cpu);
+		}
+
 		for (j = 0; j < nr_vcpus; j++)
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
@@ -229,8 +245,8 @@ int main(int argc, char **argv)
 			cpu_relax();
 
 		TEST_ASSERT(GUEST_RECEIVED_IRQ(vcpu),
-			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d\n",
-			    vcpu->id, vector, gsi);
+			    "vCPU %d timed out waiting for IRQ (vector 0x%x) from GSI %d (via CPU %d)\n",
+			    vcpu->id, vector, gsi, irq_cpu);
 
 		WRITE_AND_SYNC_TO_GUEST(vm, guest_received_irq[vcpu->id], false);
 	}
-- 
2.54.0.1099.g489fc7bff1-goog


