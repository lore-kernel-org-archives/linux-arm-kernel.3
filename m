Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99914C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 21:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQmknzoF3ICHUr70oVd8f7EMHGfpYPVKhLH22fzysYA=; b=vnypmjrZfinHr3VU5xcZpanDqi
	MfA++Iiv3Y5Zacc/p1bpMs5gnnJmKwVjrKWSqpsky2BLOcVCJe/F/0UPtDkLAYLvOdSoh1EyP6uai
	qIzmmb0KtpAkL8PbkN37V15KUBxKS+CFx75K9lGMKDOHaSZ5SH4xFfgp7Zis3UWh0Gp6X/EjkAHgh
	bUzVrPWlApMY4O7TlaQc92pIj+YBTnvWvrkXWYMnESRwYYIykvgU3S1i6psdLA7Lv/KGJxQYtQXmi
	8bZcAZmxycAhIMMV4untnjszk7u4NBn8G9IxK1M75O3oG/J830HqjlCvNOJO6+1wBs8C0UF9NBeKj
	BTn9jk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P7D-00000000Sm7-4Be3;
	Sun, 20 Sep 2026 21:30:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8P6k-00000000SKp-1Fwk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 21:30:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E7DC1650;
	Sun, 20 Sep 2026 14:29:54 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 05BCA3F632;
	Sun, 20 Sep 2026 14:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789939797; bh=z6o75vDBsMZwi/biTfE7PGIB4lI6WnxqwAzwyQx6OWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oHwuhnMJQ/RB5zLTLW0Rnq8rr2V8U3gJt6tgtP5foA9uBMM/4+uWhbhlT2ycD3fir
	 xKyTXItdnYOr2L4DTO8yCNGhtCJNmaUEygVQsqq4u+lRk17ZU2O01oqw0e62vc8qRZ
	 xX8DmqFf+64wTZfCPWAHV/69qkYjMESzqeyG3HJk=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v19 18/20] KVM: arm64: CCA: Support timers in realm RECs
Date: Sun, 20 Sep 2026 22:28:43 +0100
Message-ID: <20260920212845.707-19-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920212845.707-1-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_142958_445802_05AAF71E 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Steven Price <steven.price@arm.com>

The RMM keeps track of the timer while the realm REC is running, but on
exit to the normal world KVM is responsible for handling the timers.

A later patch adds the support for propagating the timer values from the
exit data structure and making sure the values are in sync for KVM.

Also, RMM doesn't support injecting virtual interrupts backed by Physical
interrupts. So, use the existing software resampling mechanims for Realm
timer interrupts.

Signed-off-by: Steven Price <steven.price@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arch_timer.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 226cd5a495c8b..83c13bbdcc777 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -56,11 +56,25 @@ static unsigned long kvm_arch_timer_get_irq_flags(void)
 	return kvm_vgic_global_state.no_hw_deactivation ? VGIC_IRQ_SW_RESAMPLE : 0;
 }
 
+static unsigned long kvm_realm_timer_get_irq_flags(void)
+{
+	/*
+	 * RMI_REC_ENTER rejects LRs with the HW bit set, so use the existing
+	 * software resampling mechanism for Realm timer interrupts.
+	 */
+	return VGIC_IRQ_SW_RESAMPLE;
+}
+
 static const struct irq_ops arch_timer_irq_ops = {
 	.get_flags	 = kvm_arch_timer_get_irq_flags,
 	.get_input_level = kvm_arch_timer_get_input_level,
 };
 
+static const struct irq_ops realm_timer_irq_ops = {
+	.get_flags	 = kvm_realm_timer_get_irq_flags,
+	.get_input_level = kvm_arch_timer_get_input_level,
+};
+
 static const struct irq_ops arch_timer_irq_ops_vgic_v5 = {
 	.get_input_level = kvm_arch_timer_get_input_level,
 	.queue_irq_unlock = vgic_v5_ppi_queue_irq_unlock,
@@ -1617,8 +1631,12 @@ int kvm_timer_enable(struct kvm_vcpu *vcpu)
 
 	get_timer_map(vcpu, &map);
 
-	ops = vgic_is_v5(vcpu->kvm) ? &arch_timer_irq_ops_vgic_v5 :
-				      &arch_timer_irq_ops;
+	if (vcpu_is_rec(vcpu))
+		ops = &realm_timer_irq_ops;
+	else if (vgic_is_v5(vcpu->kvm))
+		ops = &arch_timer_irq_ops_vgic_v5;
+	else
+		ops = &arch_timer_irq_ops;
 
 	for (int i = 0; i < nr_timers(vcpu); i++)
 		kvm_vgic_set_irq_ops(vcpu, timer_irq(vcpu_get_timer(vcpu, i)), ops);
-- 
2.43.0


