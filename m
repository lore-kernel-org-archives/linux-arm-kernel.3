Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DA0CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIEUK+DogFzf75Z7pE3uXhelvxdV+RfHwzCn51PC6ew=; b=MmIP22ZrExb9eQ5/K3lASXNQf1
	hy8y6Yj616SRBbHp8zjcYbPR8iRXmYqEGhH2wcacXVt/1eJAwdWKsT3iapE+U/JDR1KebF/xjmyqt
	ZoSPI+eMqy0dUh66IMu23HiqyWsgWCU4oKbyPBQ6YfbDX4d3jQ3vEARdnfryjGlGL8YHWlUv/JwPO
	DJQz9Fv4z1LHwzxX5g/91B/ctoOLxb2Ca6DqiSze9i53sZsS7uzsTEDpDdB+JqQzvdiA4Oi9BWmDt
	TrmeA5M7/LBN03cEKKRX2K07rmQGYxsh2Pufeng1J8nNxmF+AcytCcHgxxwlRXGHeIFtW2ECTo7Zl
	6jRjGxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLu-0000000Cg0s-43AV;
	Fri, 14 Nov 2025 16:08:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLk-0000000Cflp-30kO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PIEUK+DogFzf75Z7pE3uXhelvxdV+RfHwzCn51PC6ew=; b=TYOlSe8u1k9kcj8tRvxfII2WE6
	oS+CwQ/SPX36FDMjulySeveSbtLoYKbFbEpaGf4+MRtfcIVzgM9a1fHgWFXHispEQjuPCWmXmH84Y
	arEDp+njL1kD2/dHfd9K7l+toCCFa02jqq6zgYpL6KjraXd08IL/GoB1H+m23yV+Y7165nH6Yg20I
	rrYF8jF71qg7CfcDU5mchZjn0/gkZfAwL9gB5u2tiu7UOiNz1pH4iASqp8wZgZZHify/t/PqrDY6N
	yZcM2RHw6OZKTXgwHKnNIOZbfnIGiJovfJV3vU8/Efh9bco/OHG1LR0umL0nhHQ1pfgWo31aI/wCO
	TFa7HQFw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvU2-00000002vXZ-1Dp8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:13:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7DB1BCA;
	Fri, 14 Nov 2025 08:08:24 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F7A13F5A1;
	Fri, 14 Nov 2025 08:08:30 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 23/35] KVM: arm64: Allow guest SPE physical timestamps only if perfmon_capable()
Date: Fri, 14 Nov 2025 16:07:04 +0000
Message-ID: <20251114160717.163230-24-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_151306_528098_CA99DF79 
X-CRM114-Status: GOOD (  13.69  )
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

The SPE driver allows userspace to use physical timestamps for records only
if the process if perfmon_capable(). Do the same for a virtual machine.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h |  1 +
 arch/arm64/kvm/spe.c             | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index 077ca1e596b8..a61c1c1de76f 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -13,6 +13,7 @@
 struct kvm_spe {
 	struct arm_spe_pmu *arm_spu;
 	u64 max_buffer_size;	/* Maximum per VCPU buffer size */
+	u64 guest_pmscr_el2;
 };
 
 struct kvm_vcpu_spe {
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 32156e43f454..85a1ac8bb57f 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/capability.h>
 #include <linux/cpumask.h>
 #include <linux/kvm_host.h>
 #include <linux/perf/arm_spe_pmu.h>
@@ -64,6 +65,8 @@ void kvm_spe_init_vm(struct kvm *kvm)
 
 int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
 {
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_spe *kvm_spe = &kvm->arch.kvm_spe;
 	struct kvm_vcpu_spe *vcpu_spe = &vcpu->arch.vcpu_spe;
 
 	if (!vcpu_has_spe(vcpu))
@@ -72,6 +75,12 @@ int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
 	if (!vcpu_spe->initialized)
 		return -EINVAL;
 
+	if (kvm_vm_has_ran_once(kvm))
+		return 0;
+
+	if (perfmon_capable())
+		kvm_spe->guest_pmscr_el2 = PMSCR_EL2_PCT_PHYS;
+
 	return 0;
 }
 
@@ -217,8 +226,11 @@ void kvm_vcpu_spe_load(struct kvm_vcpu *vcpu)
 	local_irq_disable();
 
 	host_pmscr_el2 = read_sysreg_el2(SYS_PMSCR);
-	write_sysreg_el2(0, SYS_PMSCR);
-	/* Host was profiling, synchronize the write to PMSCR_EL2. */
+	write_sysreg_el2(vcpu->kvm->arch.kvm_spe.guest_pmscr_el2, SYS_PMSCR);
+	/*
+	 * Host was profiling, synchronize the write to PMSCR_EL2 with the guest
+	 * value which disables profiling at EL2.
+	 */
 	if (FIELD_GET(PMSCR_EL2_E2SPE, host_pmscr_el2))
 		isb();
 
-- 
2.51.2


