Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6277FCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0kYOwQBOze81/dkpFN6Tvr6xYXJCfIzivhCNow8vms=; b=iJbS2vPvfN0NexQEf+PTA9ByIz
	OqDXRBYV1lRauFMWRJ2+n/ya9+kZjU5oUfzuHbgEXasoDxSFaC3DhdP7AvQFH66QcbY5NnB8MheLd
	kMkAIA5hIAyT0vzZQI1QMi+VGImuggpbeEn0RaQgUcjv8nlxKR5W0BkRgA1Yh+J7R1JdsSDJxu7p6
	PDDgiGz4AvA+uJLe0FZ+S/H5iSCmFfElihNPexCUhgJWPuhBSw3A0C2xxPXZb1oVEJJ4sSLD6ewpo
	1G782o3lrrYfGsEJNXA3kDUrlJyNYM0uOrN7zR9owot3zlJeSqVxoJmSGB/cUn2yB47fQ3iaX1QtP
	uo3AEsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI93E-00000004EEl-0cw3;
	Sun, 09 Nov 2025 17:18:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91t-00000004CD2-32aP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99A9D446DA;
	Sun,  9 Nov 2025 17:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747DCC19421;
	Sun,  9 Nov 2025 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708601;
	bh=Ztm8vFx9rv1rEKhzOuokkcS00uXfV2CgOqJXj5pGoyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOds3juvKRkaaweP1L1mc7M0J33F+wC+TgTOw9t8D+kWZCUR+PJ6VcHpfp0wH8iAM
	 pumfEGwk2S4RS75IUTxxGtKUiTRTJBcWevuKDnNod8r4c/bar6Blv/ErIjZKVdL67Z
	 Lv59BigHiKtPm3HMV9/g/htE/b2gF6ZQC+zoUBIbsXUZ0a4vIEzfC1KEQoewTTKPHO
	 rn/nr8fKYBjw73WS+xF86uFonlpJGw0nzTeim4HTF3lXA1Y+LlrxYwuRYErrxm2uMb
	 prUubEA9OvJdknakpRzeUpyervRHHV7ICNwei/UrDoCUnqzj59tnbHyr04Zq9uK9OG
	 AHKLmKDzdOgRw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91r-00000003exw-13dv;
	Sun, 09 Nov 2025 17:16:39 +0000
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
Subject: [PATCH v2 45/45] KVM: arm64: selftests: vgic_irq: Add timer deactivation test
Date: Sun,  9 Nov 2025 17:16:19 +0000
Message-ID: <20251109171619.1507205-46-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091641_818679_3CA57658 
X-CRM114-Status: GOOD (  12.61  )
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

Add a new test case that triggers the HW deactivation emulation path
when trapping ICV_DIR_EL1. This is obviously tied to the way KVM
works now, but the test follows the expected architectural behaviour.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 65 ++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index ff2c75749f5c5..9858187c7b6ea 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -894,6 +894,70 @@ static void guest_code_group_en(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+static void guest_code_timer_spi(struct test_args *args, int cpuid)
+{
+	uint32_t intid;
+	u64 val;
+
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(1);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+
+	/* Add a pending SPI so that KVM starts trapping DIR */
+	gic_set_priority(MIN_SPI + cpuid, IRQ_DEFAULT_PRIO);
+	gic_irq_set_pending(MIN_SPI + cpuid);
+
+	/* Configure the timer with a higher priority, make it pending */
+	gic_set_priority(27, IRQ_DEFAULT_PRIO - 8);
+
+	isb();
+	val = read_sysreg(cntvct_el0);
+	write_sysreg(val, cntv_cval_el0);
+	write_sysreg(1, cntv_ctl_el0);
+	isb();
+
+	GUEST_ASSERT(gic_irq_get_pending(27));
+
+	/* Enable both interrupts */
+	gic_irq_enable(MIN_SPI + cpuid);
+	gic_irq_enable(27);
+
+	/* The timer must fire */
+	intid = wait_for_and_activate_irq();
+	GUEST_ASSERT(intid == 27);
+
+	/* Check that we can deassert it */
+	write_sysreg(0, cntv_ctl_el0);
+	isb();
+
+	GUEST_ASSERT(!gic_irq_get_pending(27));
+
+	/*
+	 * Priority drop, deactivation -- we expect that the host
+	 * deactivation will have been effective
+	 */
+	gic_set_eoi(27);
+	gic_set_dir(27);
+
+	GUEST_ASSERT(!gic_irq_get_active(27));
+
+	/* Do it one more time */
+	isb();
+	val = read_sysreg(cntvct_el0);
+	write_sysreg(val, cntv_cval_el0);
+	write_sysreg(1, cntv_ctl_el0);
+	isb();
+
+	GUEST_ASSERT(gic_irq_get_pending(27));
+
+	/* The timer must fire again */
+	intid = wait_for_and_activate_irq();
+	GUEST_ASSERT(intid == 27);
+
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -1011,6 +1075,7 @@ int main(int argc, char **argv)
 		test_vgic(nr_irqs, true /* level */, true /* eoi_split */);
 		test_vgic_two_cpus(guest_code_asym_dir);
 		test_vgic_two_cpus(guest_code_group_en);
+		test_vgic_two_cpus(guest_code_timer_spi);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.47.3


