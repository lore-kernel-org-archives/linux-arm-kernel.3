Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF83C02197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7y2eDrBDRI4a+OHvHnnrYxC4PNBcgJ33NtHtNjDkbI=; b=M7uyxA/jCzSPYbCDjdfXv6l8bh
	bG/BN/Kp3DlfbPDxTzZEH2GpvgO4lqeH4oacXv40bvEh2w8KB1HnqZFoudurEVOGr00OEhmEymBtw
	YTBl8/5cx6f/GoTKsbIRDR/aWeoMlQgxSKfbrvVKK+0hdx7l1SivTWY4hJtzDQQN8dwi/J32Mc9nd
	1ns7ybpgpuRPdnQ72mTNiQ05BEeVyUcBaIAVKrrRqkdqul8VSHfNIDWqteGdlLyBb6lSFqr/QTpAh
	kFz6i97ttTI7aYy0Z091qLQ2KQ3oZ43ZZ7vp1Heqh+pUWVFK3qLVaz1DU5Pgwe96BWUuVn5ZGBc6M
	dOJ11JmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGiR-00000000DOt-0eUG;
	Tue, 04 Feb 2025 11:03:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGfp-00000000D9M-1ydk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:00:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 266185C625A;
	Tue,  4 Feb 2025 11:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7836C4CEE6;
	Tue,  4 Feb 2025 11:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738666856;
	bh=SWdSwKO7kx1FsE9ReQpkXv30FO82J4DEVhTE8BQrNzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1TnF8JPxkV1AXv2+8Vz5MN4lQePtv7U+qBGff31zNjlw139mk3GnSI7zdOc2ecXi
	 E/kHPFxZVZoVTQ3WE+gIEC/CKjjmdDa+yJYV3aJY0ruvLDf3RTstAYRBP5iCAU4jl4
	 aVMSeAxUBpyjz1xNV2zlM0RMwr+bz/zmu78PKurBLJBlbzHw3NxXJz6NgpLRzsOAok
	 bCHkzv1lyA1XZeJZ1tyLMDG+SQSRyLcNVPdPYasbdfXWFnSgQqdnY0PDJj/QPXDjI8
	 C/fCZl++AtTJtu6d7LENn7LVe86nf+MwCZmHGt7hezQ60NRb6OFPkfaq+p7Q5nK/M2
	 wcdsj92J8s4hQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tfGfm-000OVe-Ne;
	Tue, 04 Feb 2025 11:00:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Dmytro Terletskyi <Dmytro_Terletskyi@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 3/3] KVM: arm64: timer: Don't adjust the EL2 virtual timer offset
Date: Tue,  4 Feb 2025 11:00:50 +0000
Message-Id: <20250204110050.150560-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250204110050.150560-1-maz@kernel.org>
References: <20250204110050.150560-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, r09922117@csie.ntu.edu.tw, Volodymyr_Babchuk@epam.com, Dmytro_Terletskyi@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_030057_595368_B5DCF6A7 
X-CRM114-Status: GOOD (  16.07  )
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

The way we deal with the EL2 virtual timer is a bit odd.

We try to cope with E2H being flipped, and adjust which offset
applies to that timer depending on the current E2H value. But that's
a complexity we shouldn't have to worry about.

What we have to deal with is either E2H being RES1, in which case
there is no offset, or E2H being RES0, and the virtual timer simply
does not exist.

Drop the adjusting of the timer offset, which makes things a bit
simpler. At the same time, make sure that accessing the HV timer
when E2H is RES0 results in an UNDEF in the guest.

Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 15 ---------------
 arch/arm64/kvm/sys_regs.c   | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index e59836e0260cf..231c0cd9c7b4b 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -759,21 +759,6 @@ static void kvm_timer_vcpu_load_nested_switch(struct kvm_vcpu *vcpu,
 					    timer_irq(map->direct_ptimer),
 					    &arch_timer_irq_ops);
 		WARN_ON_ONCE(ret);
-
-		/*
-		 * The virtual offset behaviour is "interesting", as it
-		 * always applies when HCR_EL2.E2H==0, but only when
-		 * accessed from EL1 when HCR_EL2.E2H==1. So make sure we
-		 * track E2H when putting the HV timer in "direct" mode.
-		 */
-		if (map->direct_vtimer == vcpu_hvtimer(vcpu)) {
-			struct arch_timer_offset *offs = &map->direct_vtimer->offset;
-
-			if (vcpu_el2_e2h_is_set(vcpu))
-				offs->vcpu_offset = NULL;
-			else
-				offs->vcpu_offset = &__vcpu_sys_reg(vcpu, CNTVOFF_EL2);
-		}
 	}
 }
 
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 526d66f24e34a..7968bee0d27ea 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1452,6 +1452,16 @@ static bool access_arch_timer(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool access_hv_timer(struct kvm_vcpu *vcpu,
+			    struct sys_reg_params *p,
+			    const struct sys_reg_desc *r)
+{
+	if (!vcpu_el2_e2h_is_set(vcpu))
+		return undef_access(vcpu, p, r);
+
+	return access_arch_timer(vcpu, p, r);
+}
+
 static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
 				    s64 new, s64 cur)
 {
@@ -3099,9 +3109,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(CNTHP_CTL_EL2, access_arch_timer, reset_val, 0),
 	EL2_REG(CNTHP_CVAL_EL2, access_arch_timer, reset_val, 0),
 
-	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_arch_timer },
-	EL2_REG(CNTHV_CTL_EL2, access_arch_timer, reset_val, 0),
-	EL2_REG(CNTHV_CVAL_EL2, access_arch_timer, reset_val, 0),
+	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_hv_timer },
+	EL2_REG(CNTHV_CTL_EL2, access_hv_timer, reset_val, 0),
+	EL2_REG(CNTHV_CVAL_EL2, access_hv_timer, reset_val, 0),
 
 	{ SYS_DESC(SYS_CNTKCTL_EL12), access_cntkctl_el12 },
 
-- 
2.39.2


