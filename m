Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34248CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yox7L63o1aAkRDM05QvKW2de39iEsbwTh/h8gTUA+SQ=; b=EFg/k5LCpWJMo/BSeWd6VEzCi6
	Qce8pviO/I/Iby/+Bb4s/9Sin6EKDoPKKH74vZy+at1ibvqXxVVx+g/IXqa5497jYPRnNAul4pjBH
	W8h5z5KYU/ZPFjkuhP7uKA8W7hd+mBatVsH8tGC3jlFpjKhSW7XM7QlDL5HkwTioYEasvXxzGRZVZ
	P79jhr97N2d7AhcXasf7L7PRpKFO2L9hkvKRc3boQGANl+a3zPthLsvk+vNVdA0E6AX4kerQZHUQl
	C0VXiLCXdlYS8l7zsJzkryK037tOhOhkObOyAPu61mshqD/MvwWJuKFG6SY9bdwmq9h7cpuZw52+d
	MkxCfSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI93G-00000004EIS-377n;
	Sun, 09 Nov 2025 17:18:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91t-00000004CC3-0LGf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE24F43F15;
	Sun,  9 Nov 2025 17:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34D3C4CEF7;
	Sun,  9 Nov 2025 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708600;
	bh=xc89zgOjmWN37MQ958dqM5lCxQ+sj0EtpjgG+2nlipQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eHUuWBhRzKoaIgzxifPHIyGyVIFmPLWCKBE9D+C865M/hzCNOoh8bQrXfBCwGiNbZ
	 x9mbZi/J02yUSaumbBWWxdh7mgCmGvnYKBEAU0AhZh8gmMBw92mm0sFGoAZ6TIEZHy
	 ddt0OVLmd2TNHSpXF0cE+R8tsjRVMrI5dR2JRpKUF9qGR3UEXlbcqTH5RXiGcXGO6f
	 qmA/3/e+2eSy/FW8CuuyAull9qIrrGN9S+xzxiaWJlCU5wfMHoDpSIo4z6z0VmJqRv
	 qUEOWPWEIszqtjZ6js6puWNEh7HsGsWcuT5si2cHrs2NwR99dRIFj8HvzdS4Y75Hj8
	 UtJ3EuC/kWLyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91q-00000003exw-3Kxj;
	Sun, 09 Nov 2025 17:16:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 43/45] KVM: arm64: selftests: vgic_irq: Add asymmetric SPI deaectivation test
Date: Sun,  9 Nov 2025 17:16:17 +0000
Message-ID: <20251109171619.1507205-44-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091641_170403_320C6897 
X-CRM114-Status: GOOD (  16.62  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a new test case that makes an interrupt pending on a vcpu,
activates it, do the priority drop, and then get *another* vcpu
to do the deactivation.

Special care is taken not to trigger an exit in the process, so
that we are sure that the active interrupt is in an LR. Joy.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 105 +++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 72f7bb0d201e5..a53ab809fe8ae 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -29,6 +29,7 @@ struct test_args {
 	bool level_sensitive; /* 1 is level, 0 is edge */
 	int kvm_max_routes; /* output of KVM_CAP_IRQ_ROUTING */
 	bool kvm_supports_irqfd; /* output of KVM_CAP_IRQFD */
+	uint32_t shared_data;
 };
 
 /*
@@ -801,6 +802,109 @@ static void test_vgic(uint32_t nr_irqs, bool level_sensitive, bool eoi_split)
 	kvm_vm_free(vm);
 }
 
+static void guest_code_asym_dir(struct test_args *args, int cpuid)
+{
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(1);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+
+	if (cpuid == 0) {
+		uint32_t intid;
+
+		local_irq_disable();
+
+		gic_set_priority(MIN_PPI, IRQ_DEFAULT_PRIO);
+		gic_irq_enable(MIN_SPI);
+		gic_irq_set_pending(MIN_SPI);
+
+		intid = wait_for_and_activate_irq();
+		GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+		gic_set_eoi(intid);
+		isb();
+
+		WRITE_ONCE(args->shared_data, MIN_SPI);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) == MIN_SPI);
+		GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+	} else {
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != MIN_SPI);
+
+		gic_set_dir(MIN_SPI);
+		isb();
+
+		WRITE_ONCE(args->shared_data, 0);
+		dsb(ishst);
+	}
+
+	GUEST_DONE();
+}
+
+static void *test_vcpu_run(void *arg)
+{
+	struct kvm_vcpu *vcpu = arg;
+	struct ucall uc;
+
+	while (1) {
+		vcpu_run(vcpu);
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_DONE:
+			return NULL;
+		default:
+			TEST_FAIL("Unknown ucall %lu", uc.cmd);
+		}
+	}
+
+	return NULL;
+}
+
+static void test_vgic_two_cpus(void *gcode)
+{
+	pthread_t thr[2];
+	struct kvm_vcpu *vcpus[2];
+	struct test_args args = {};
+	struct kvm_vm *vm;
+	vm_vaddr_t args_gva;
+	int gic_fd, ret;
+
+	vm = vm_create_with_vcpus(2, gcode, vcpus);
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpus[0]);
+	vcpu_init_descriptor_tables(vcpus[1]);
+
+	/* Setup the guest args page (so it gets the args). */
+	args_gva = vm_vaddr_alloc_page(vm);
+	memcpy(addr_gva2hva(vm, args_gva), &args, sizeof(args));
+	vcpu_args_set(vcpus[0], 2, args_gva, 0);
+	vcpu_args_set(vcpus[1], 2, args_gva, 1);
+
+	gic_fd = vgic_v3_setup(vm, 2, 64);
+
+	ret = pthread_create(&thr[0], NULL, test_vcpu_run, vcpus[0]);
+	if (ret)
+		TEST_FAIL("Can't create thread for vcpu 0 (%d)\n", ret);
+	ret = pthread_create(&thr[1], NULL, test_vcpu_run, vcpus[1]);
+	if (ret)
+		TEST_FAIL("Can't create thread for vcpu 1 (%d)\n", ret);
+
+	pthread_join(thr[0], NULL);
+	pthread_join(thr[1], NULL);
+
+	close(gic_fd);
+	kvm_vm_free(vm);
+}
+
 static void help(const char *name)
 {
 	printf(
@@ -857,6 +961,7 @@ int main(int argc, char **argv)
 		test_vgic(nr_irqs, false /* level */, true /* eoi_split */);
 		test_vgic(nr_irqs, true /* level */, false /* eoi_split */);
 		test_vgic(nr_irqs, true /* level */, true /* eoi_split */);
+		test_vgic_two_cpus(guest_code_asym_dir);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.47.3


