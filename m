Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC9BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCxHyKXCAbcjE+o5Z6lV8Jfbb+aVzhA7NAAmg+0wfFE=; b=DgzK1pk59vYtpGVDLszw4Bb7PC
	rF0bvPwMAaquikqUMyIk/HAQBJiAIIxCoIe4oLMoIcYQtQ7lQ6G+6wjctH2Px/+qA9I3IjW2JZ2+c
	7F1ZNPwSTeZNNF9zIS9H3jt8wjifRDLeY768NYOpgwGsjT85sQ+p8urTZyX/3ckqNjMA/N81Ql1sB
	oViF7R9IGNxwZySmGbPUi5GX0oov0++LRH8FrnGRx9p8eeymbkiwa95EPX6BvsBPN17s81TAo01d3
	U+iGzzisE2vlWAzPGsSIK/URej+DDVYdbX4O3b1N/6207YolU1XuAEejG2HN06dpwTh3+ziWxGmKF
	pmTwynHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI93B-00000004EAk-1KCL;
	Sun, 09 Nov 2025 17:18:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91t-00000004CAQ-1nT3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 512F6446FB;
	Sun,  9 Nov 2025 17:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEB6C16AAE;
	Sun,  9 Nov 2025 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708601;
	bh=I5APLz+GD8a1KVLow3b+A72ufSgd/FLpBeo0S8g/E18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e5E4TOH4WjKmNvTONUKp/Ec1MOy7OqSQ4IdnjTTFEKaYsRQ6FmiqyNMFfPFXSmEhb
	 jkosMB9W50mruh3QGqzwmKNI63m4emU6t5Qj1jRZkbwsOGXihEJ7kNZlL00gu+qtjp
	 cuTcHWTwHXZ80DbyxIBhv3xQQ2bxAn/JM1KCZOMnhU3kLGBrrh9+dyzvNns66WZSnC
	 uC5eXumgCg4km02qB5r7d+VCWGe7NG6gJx7FDZ/WAKqyYylturE1xp9qaYg1wbLhLp
	 ZAXrHJGLY9B898QiOiSb8QCltIdcRxWbn4LCa461FhMWJm/5zHA7RbmQeLt9eGU43R
	 3HoaDsaVDcOtw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91r-00000003exw-05Ib;
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
Subject: [PATCH v2 44/45] KVM: arm64: selftests: vgic_irq: Add Group-0 enable test
Date: Sun,  9 Nov 2025 17:16:18 +0000
Message-ID: <20251109171619.1507205-45-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251109_091641_510251_FF6450AA 
X-CRM114-Status: GOOD (  13.91  )
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

Add a new test case that inject a Group-0 interrupt together
with a bunch of Group-1 interrupts, Ack/EOI the G1 interrupts,
and only then enable G0, expecting to get the G0 interrupt.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index a53ab809fe8ae..ff2c75749f5c5 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -846,6 +846,54 @@ static void guest_code_asym_dir(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+static void guest_code_group_en(struct test_args *args, int cpuid)
+{
+	uint32_t intid;
+
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(0);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+	/* SGI0 is G0, which is disabled */
+	gic_irq_set_group(0, 0);
+
+	/* Configure all SGIs with decreasing priority */
+	for (intid = 0; intid < MIN_PPI; intid++) {
+		gic_set_priority(intid, (intid + 1) * 8);
+		gic_irq_enable(intid);
+		gic_irq_set_pending(intid);
+	}
+
+	/* Ack and EOI all G1 interrupts */
+	for (int i = 1; i < MIN_PPI; i++) {
+		intid = wait_for_and_activate_irq();
+
+		GUEST_ASSERT(intid < MIN_PPI);
+		gic_set_eoi(intid);
+		isb();
+	}
+
+	/*
+	 * Check that SGI0 is still pending, inactive, and that we cannot
+	 * ack anything.
+	 */
+	GUEST_ASSERT(gic_irq_get_pending(0));
+	GUEST_ASSERT(!gic_irq_get_active(0));
+	GUEST_ASSERT_IAR_EMPTY();
+	GUEST_ASSERT(read_sysreg_s(SYS_ICC_IAR0_EL1) == IAR_SPURIOUS);
+
+	/* Open the G0 gates, and verify we can ack SGI0 */
+	write_sysreg_s(1, SYS_ICC_IGRPEN0_EL1);
+	isb();
+
+	do {
+		intid = read_sysreg_s(SYS_ICC_IAR0_EL1);
+	} while (intid == IAR_SPURIOUS);
+
+	GUEST_ASSERT(intid == 0);
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -962,6 +1010,7 @@ int main(int argc, char **argv)
 		test_vgic(nr_irqs, true /* level */, false /* eoi_split */);
 		test_vgic(nr_irqs, true /* level */, true /* eoi_split */);
 		test_vgic_two_cpus(guest_code_asym_dir);
+		test_vgic_two_cpus(guest_code_group_en);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.47.3


