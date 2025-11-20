Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67536CF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ne90VXkAuHuAZPGFKoR5peNIgH9YHRoxbeu7r95ucy8=; b=YFWkHc6/tC8oPwmN/ugQ+GBIob
	wEaW1MMo8aNiJRbJ012NXXs1e/NgdRIUKuojQgLgGOn531Tc2YweXKFo8oILdxpClSaWBdv7pAxTL
	DU2PohyqkYmU66rT8BNkNed6llBcKPdB5oiTiKNQ3CR1AdaN12M8Fw10mO14U3fQc9+yYDPbsNSQq
	+EqVEEXNQqgGH3NF2UjvszLeRgc9TD+WI3Rw3Vod7rJFj70zxbNL6RzsyrzsXz2DpAAkVNe8bm8AL
	dSx+w6JhhPSv9eRUP8dGcw1kI2W5u/18/NujPPc9glPi0ScZFJDmFcSXh9SzGFKIr5GGuZtrq+TqB
	QBbXPxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Qb-000000076go-0UCr;
	Thu, 20 Nov 2025 17:26:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q3-000000075ig-2xYW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28BC160213;
	Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35DBC19422;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659566;
	bh=4r+H0thzKzjKCkutDHmNhHhIj5eL7J+n27WRZWbkIdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mz+TV+5LX9C/fnWx7xKLxDpg6rfVax1/Zlqqy/UqMJypZ+NZNdBvz9U8vyIyYwxdK
	 2cabdAK9FCWALczvt/PVZWC7+vws+PoYmwPwr5KcU0Phi4Vk7EcNBUeGIGXuEo0jAU
	 nF1/M4vObWbJPk0qzbtTYB2jhQj87PkNs8TZckW3SVE3N5V1uNtTyuLrKIkf2WpJ0b
	 nUFx95H77O1d9BxPaMBWP36SF76DASd3i04jZ6MgUKnpejwwKDHrnXKnDdVVEVp1Rz
	 VWAUR69Pj67UT/+WfSDo+u1vK33IwzaEfbsWPAJ9VQaWcO4OU5TL6XYEou6Xw9gmNH
	 /whUS8bBest5A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Q1-00000006y6g-0Rb0;
	Thu, 20 Nov 2025 17:26:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 44/49] KVM: arm64: selftests: vgic_irq: Exclude timer-controlled interrupts
Date: Thu, 20 Nov 2025 17:25:34 +0000
Message-ID: <20251120172540.2267180-45-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The PPI injection API is clear that you can't inject the timer PPIs
from userspace, since they are controlled by the timers themselves.

Add an exclusion list for this purpose.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 31 ++++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index a8919ef3cea2e..b0415bdb89524 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -359,8 +359,9 @@ static uint32_t wait_for_and_activate_irq(void)
  * interrupts for the whole test.
  */
 static void test_inject_preemption(struct test_args *args,
-		uint32_t first_intid, int num,
-		kvm_inject_cmd cmd)
+				   uint32_t first_intid, int num,
+				   const unsigned long *exclude,
+				   kvm_inject_cmd cmd)
 {
 	uint32_t intid, prio, step = KVM_PRIO_STEPS;
 	int i;
@@ -379,6 +380,10 @@ static void test_inject_preemption(struct test_args *args,
 	for (i = 0; i < num; i++) {
 		uint32_t tmp;
 		intid = i + first_intid;
+
+		if (exclude && test_bit(i, exclude))
+			continue;
+
 		KVM_INJECT(cmd, intid);
 		/* Each successive IRQ will preempt the previous one. */
 		tmp = wait_for_and_activate_irq();
@@ -390,6 +395,10 @@ static void test_inject_preemption(struct test_args *args,
 	/* finish handling the IRQs starting with the highest priority one. */
 	for (i = 0; i < num; i++) {
 		intid = num - i - 1 + first_intid;
+
+		if (exclude && test_bit(intid - first_intid, exclude))
+			continue;
+
 		gic_set_eoi(intid);
 		if (args->eoi_split)
 			gic_set_dir(intid);
@@ -397,8 +406,12 @@ static void test_inject_preemption(struct test_args *args,
 
 	local_irq_enable();
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
+		if (exclude && test_bit(i, exclude))
+			continue;
+
 		GUEST_ASSERT(!gic_irq_get_active(i + first_intid));
+	}
 	GUEST_ASSERT_EQ(gic_read_ap1r0(), 0);
 	GUEST_ASSERT_IAR_EMPTY();
 
@@ -442,14 +455,20 @@ static void test_preemption(struct test_args *args, struct kvm_inject_desc *f)
 	 * number of concurrently active IRQs. The number of LRs implemented is
 	 * IMPLEMENTATION DEFINED, however, it seems that most implement 4.
 	 */
+	/* Timer PPIs cannot be injected from userspace */
+	static const unsigned long ppi_exclude = (BIT(27 - MIN_PPI) |
+						  BIT(30 - MIN_PPI) |
+						  BIT(28 - MIN_PPI) |
+						  BIT(26 - MIN_PPI));
+
 	if (f->sgi)
-		test_inject_preemption(args, MIN_SGI, 4, f->cmd);
+		test_inject_preemption(args, MIN_SGI, 4, NULL, f->cmd);
 
 	if (f->ppi)
-		test_inject_preemption(args, MIN_PPI, 4, f->cmd);
+		test_inject_preemption(args, MIN_PPI, 4, &ppi_exclude, f->cmd);
 
 	if (f->spi)
-		test_inject_preemption(args, MIN_SPI, 4, f->cmd);
+		test_inject_preemption(args, MIN_SPI, 4, NULL, f->cmd);
 }
 
 static void test_restore_active(struct test_args *args, struct kvm_inject_desc *f)
-- 
2.47.3


