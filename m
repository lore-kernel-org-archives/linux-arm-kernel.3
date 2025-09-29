Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF863CCA46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/hZtUu9wU3Wz40sa7UB70k+seMxCGZTAupTcYjD4lA=; b=vsFaOZxddmX9ebJ5ppKlxAFTLn
	+a1GZquRjpFyeP/nd7r+z0GpgA5MIE/wBFrJJKGiz5xpPWkVFZyu0HK3Lw8+1tTHFr+1kNb3QU3Md
	ViQCmkD/++hLbbUKZEDSvBb24NVgOzmx/1SO5AmQd3+2d7nY1p4wNTu6J8BP1oBIpBxydl7fbRo2E
	x2ubI7PraGts0zQLSqqzUSZcpEZ3TQ7aqXEs12FWjWYbvkR2eg6lci4/EuvBfeLKVhBGazhEoBN16
	hK+jMjHXp/Jc9VCaY2Xw09OuclYWtGX1a3hzIVKTWuSZoFt7EVOHtpCgEiPhLY4LUYhZ2A0BNjYNm
	B4ecBFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNb-00000002uGW-2r8g;
	Mon, 29 Sep 2025 16:05:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN9-00000002tup-2kUi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 582A148BC7;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A72CC4CEF4;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161907;
	bh=l+H5Z+otL/wcs/vzwPMAF3OWoHvg6UJ42LI358e1qcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLSnMbRbkVfBINQ2qteCNrqEidcv7LWJL7o2GAMNpwrka7dEX86CneOAk48nZ7NB6
	 MwHC2gUTAix72z4uykC0uQZ73OHjIBr/XynRO3ZQuWHWYQgx99e6OAS0bYXZ/co2mB
	 +yzQ/IuMWqIE55wp9fDjQE9vYtgg9PehMXCskXQ20wTncJDwk/eXRv1ub0X/JzWIip
	 vRxhN6FPSaj6Ulg0OLVZnzPO+uy62OytYzOrTVMDrLb1qq6N740ZhINmJYE3YueXeS
	 e3bq1HbHk+nb6klCfZ8e7TdNSZEkAY36fbpYsaI0/XSb0WCLVpl9q11QzrOy2XLx6k
	 jMh54S8yD7Fzg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN7-0000000AHqo-0tsR;
	Mon, 29 Sep 2025 16:05:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 08/13] KVM: arm64: Move CNT*CT_EL0 userspace accessors to generic infrastructure
Date: Mon, 29 Sep 2025 17:04:52 +0100
Message-ID: <20250929160458.3351788-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090507_759955_ADB5F5C6 
X-CRM114-Status: GOOD (  13.54  )
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

Moving the counter registers is a bit more involved than for the control
and comparator (there is no shadow data for the counter), but still
pretty manageable.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/guest.c    |  7 -------
 arch/arm64/kvm/sys_regs.c | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index c23ec9be4ce27..138e5e2dc10c8 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -592,19 +592,12 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
 }
 
 static const u64 timer_reg_list[] = {
-	KVM_REG_ARM_TIMER_CNT,
-	KVM_REG_ARM_PTIMER_CNT,
 };
 
 #define NUM_TIMER_REGS ARRAY_SIZE(timer_reg_list)
 
 static bool is_timer_reg(u64 index)
 {
-	switch (index) {
-	case KVM_REG_ARM_TIMER_CNT:
-	case KVM_REG_ARM_PTIMER_CNT:
-		return true;
-	}
 	return false;
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 68e88d5c0dfb5..e67eb39ddc118 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1605,12 +1605,38 @@ static int arch_timer_set_user(struct kvm_vcpu *vcpu,
 	case SYS_CNTHP_CTL_EL2:
 		val &= ~ARCH_TIMER_CTRL_IT_STAT;
 		break;
+	case SYS_CNTVCT_EL0:
+		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
+			timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read() - val);
+		return 0;
+	case SYS_CNTPCT_EL0:
+		if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags))
+			timer_set_offset(vcpu_ptimer(vcpu), kvm_phys_timer_read() - val);
+		return 0;
 	}
 
 	__vcpu_assign_sys_reg(vcpu, rd->reg, val);
 	return 0;
 }
 
+static int arch_timer_get_user(struct kvm_vcpu *vcpu,
+			       const struct sys_reg_desc *rd,
+			       u64 *val)
+{
+	switch (reg_to_encoding(rd)) {
+	case SYS_CNTVCT_EL0:
+		*val = kvm_phys_timer_read() - timer_get_offset(vcpu_vtimer(vcpu));
+		break;
+	case SYS_CNTPCT_EL0:
+		*val = kvm_phys_timer_read() - timer_get_offset(vcpu_ptimer(vcpu));
+		break;
+	default:
+		*val = __vcpu_sys_reg(vcpu, rd->reg);
+	}
+
+	return 0;
+}
+
 static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
 				    s64 new, s64 cur)
 {
@@ -2539,7 +2565,7 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 
 #define TIMER_REG(name, vis)					   \
 	SYS_REG_USER_FILTER(name, access_arch_timer, reset_val, 0, \
-			    NULL, arch_timer_set_user, vis)
+			    arch_timer_get_user, arch_timer_set_user, vis)
 
 /*
  * Since reset() callback and field val are not used for idregs, they will be
@@ -3506,8 +3532,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	AMU_AMEVTYPER1_EL0(14),
 	AMU_AMEVTYPER1_EL0(15),
 
-	{ SYS_DESC(SYS_CNTPCT_EL0), access_arch_timer },
-	{ SYS_DESC(SYS_CNTVCT_EL0), access_arch_timer },
+	{ SYS_DESC(SYS_CNTPCT_EL0), .access = access_arch_timer,
+	  .get_user = arch_timer_get_user, .set_user = arch_timer_set_user },
+	{ SYS_DESC(SYS_CNTVCT_EL0), .access = access_arch_timer,
+	  .get_user = arch_timer_get_user, .set_user = arch_timer_set_user },
 	{ SYS_DESC(SYS_CNTPCTSS_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTVCTSS_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
-- 
2.47.3


