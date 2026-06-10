Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC16ECD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 00:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzhOX8od6JHJiC3xs1cQBCBTU98nABZKFOR7TwpKopY=; b=a8FOSMuGIBswxp/r9cvJCdcs7z
	j0EVl/r/Z4XBW+VZS5xHWUTcGO55TbxvyP91Fq71elyh3eougY88dmvBnGCFooSxJlzXfKMbqUn/z
	yrfQyPa2dY6aJ3oXy7f3KJIQVdMgsY6O0hY7f5B2l316FF2NDDKtzpA46/X9SyAz4EltXK/0aOTXK
	6UiAMkSM/cdYh5cu8AO9bcMAWiISE3OS9VZxbtzsPVnorv/3eKhy87+xQ5FXIc/xTImNO4zN3+X8y
	Z5mGJuDhyfXGWpAu2AjS22zxaZm4LBT4mxmUPLjxgeHkoFvoBqDcYiRuCLFayEf2g/vgvJsN75ymb
	Oe6wTMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7D2-00000006Zzi-0zzl;
	Wed, 10 Jun 2026 00:54:20 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX7Cn-00000006Zf0-37M0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 00:54:06 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-36d8719bae6so5366406a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 17:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781052844; x=1781657644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uzhOX8od6JHJiC3xs1cQBCBTU98nABZKFOR7TwpKopY=;
        b=GoZyI8aC1gIWQkM+xIxI6Hnjm1pthON27pVanfvOLQX9nqsz0bpep2u0e+bEGS6InN
         UEed8UGF3cJtFf4ugvlB6csbRQ3wjYuqwH9hswodrv1cojJn4NjJs+wZ0X8UC5bKNH53
         HAMM5awFglXdNaZFA+XtPbsE6awvZHxcCxCGs1Z0JTjc+TIua68XO4S/tNOfxS36e7wx
         qz6SywyDQWIp4IkaN338CSrKvnXRB5BnpApiGebjvH3zszQGVz7E9v1b9wLhgPCGVx6q
         M2YyZu8CGSlFbR+pc+eIw3ZO3XiYy0wwMObjfliuGSACuMtrHfjz6fEA93oBPuE/9CO8
         F+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781052844; x=1781657644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzhOX8od6JHJiC3xs1cQBCBTU98nABZKFOR7TwpKopY=;
        b=FTSLYJaItb1L9PbZNub4ujnzOd0bSVbYvOcLccb9Nzn2Y4xrGQitP+nnHS9YuWm+c+
         /44k0zw7qD0PRQ5WNjfwkvJ0b01ELyDc57Ube2PhxF/+eZNy1uU/yW6PBpknl2dUCGI3
         kgD97eIL99fD0/l/N6vt/WGcT5eorortQMR8AsWTf91l6WqUjoJVk3UK2JAT6lS7KRMu
         Argg+XLSRxP4AdW/USrV3rhURy9GvRJ/TdvPgVylhHidNm6Gld2+Mm6iqhEDk0Q/dZfQ
         SNS26lzW0My6ryh7nyGX/XvoGOxznzKBwE3dK7meG2r5583I7WrhvPP30/ga6BXO98Nv
         TRKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pI0fpiBg9Y8eqmHNlzDjycyIbPBHtv0SSDvKTGBlekFpCuAjMDBOEjsg1G/04bkcdKj2SIv5i3LfSULdscrZi@lists.infradead.org
X-Gm-Message-State: AOJu0YzjfgycYmtvwzXftb95utBaPNBReEYT+XYpdDn63MiACwt9vwHm
	fvK1SBe2lUrI8OnWSiXPmhClOZie5V6+A1955P/9M4dyQRgKhaQD2eULJd6WskWKiZmDgJ4UEDN
	7SUGRdw==
X-Received: from pfbha13.prod.google.com ([2002:a05:6a00:850d:b0:83f:24a9:a829])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b04:b0:36a:5d1f:7b6
 with SMTP id 98e67ed59e1d1-370ee5444e7mr23400292a91.2.1781052843860; Tue, 09
 Jun 2026 17:54:03 -0700 (PDT)
Date: Tue,  9 Jun 2026 17:53:36 -0700
In-Reply-To: <20260610005338.2967132-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260610005338.2967132-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <20260610005338.2967132-17-seanjc@google.com>
Subject: [PATCH v6 16/18] KVM: selftests: Verify vCPU migration during IRQ
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
X-CRM114-CacheID: sfid-20260609_175405_796204_39032CF9 
X-CRM114-Status: GOOD (  14.27  )
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
index 3fed76c553dd..aeede7937147 100644
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
@@ -244,6 +250,9 @@ int main(int argc, char **argv)
 
 	kvm_assign_irqfd(vm, gsi, eventfd);
 
+	if (migrate_vcpus)
+		kvm_sched_getaffinity(0, sizeof(available_cpus), &available_cpus);
+
 	for (i = 0; i < nr_vcpus; i++)
 		pthread_create(&vcpu_threads[i], NULL, vcpu_thread_main, vcpus[i]);
 
@@ -270,6 +279,9 @@ int main(int argc, char **argv)
 			proc_irq_set_smp_affinity(irq, irq_cpu);
 		}
 
+		if (migrate_vcpus)
+			pin_task_to_random_cpu(vcpu_threads[i % nr_vcpus], &available_cpus);
+
 		for (j = 0; j < nr_vcpus; j++) {
 			TEST_ASSERT(!GUEST_RECEIVED_IRQ(vcpus[j]),
 				    "IRQ flag for vCPU %d not clear prior to test",
-- 
2.54.0.1099.g489fc7bff1-goog


