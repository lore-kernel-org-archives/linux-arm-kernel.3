Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D19CF539E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flq+Kg0yjRgqYgsW55gdL+GAo5fIdizB5p706tTYebg=; b=FmZXRX5CRYawMvX/ml7Zhyiiuo
	eA4KOxvnJCE+38Wg3AZdPz0qDnlH4tIfkDt2sZl3FaWK34COHa/onXSM7MXjX2Ki6L9wefwU7yQGL
	FUQA6v4tUpYLQKYqtncldmXIDe+FPeNp7VMZqbmAG6TNf14R4KkvBO07mtKmH5K1+lQyNgGMpFulv
	M9UtARUp4paUeqtUZm+ADonriy8FH2Bp8tFzYfAicjTY/DxM8hM7c3TSvlIdMsgRv2wH9jjzK1hqk
	CQSrgjkmVOLXhX/E1F2iy8Je+CbWMVWmxi1dDiPrQi7C/h6CYwkxbsVJeKizmJqKFJbU5+jKfsYgD
	Cw3wZJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3czM-0000000EtVA-0G73;
	Wed, 23 Oct 2024 15:09:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckE-0000000EpJ8-3woU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 093B3A45013;
	Wed, 23 Oct 2024 14:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0F6C4CEEA;
	Wed, 23 Oct 2024 14:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695232;
	bh=OpE1g1dXxLnO5r+wMmDCsiL9pglyj4L3QL+7VK1XQcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pLY9y0HZDVBCHlMKE1/lmPlw7TDpuyoy6w6eXfNDPLlp+Ojh8scPg7jaIAmAt9Ogk
	 sXpWannjN/2WmZtad+xMRQ3wq188JPrQSexpqshjlDTbKlPPm4iE6dLmfmhix1PeDB
	 kyb0+IaXsXMsrIGalOuS9BNxnHo0eH+gZtkJ3tAEx3p8GPHKSxNLaICoSkGYMicoHN
	 R/YfXllqu6KUY9r83iXk7lBj6Z4aANpFr9897T2sW1OEf7qQM+MdIrfcR22Fw3zvMV
	 DVrhYEf9nA8YfTgI4lu+R+NTxqcqoNyd32GIke8sbKtVjN4qrrKaERN/5Ae5DTHJ80
	 Xnn/uCIaZfvBA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckA-0068vz-M9;
	Wed, 23 Oct 2024 15:53:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 06/37] KVM: arm64: nv: Handle CNTHCTL_EL2 specially
Date: Wed, 23 Oct 2024 15:53:14 +0100
Message-Id: <20241023145345.1613824-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075355_299807_21A57FFE 
X-CRM114-Status: GOOD (  14.41  )
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

Accessing CNTHCTL_EL2 is fraught with danger if running with
HCR_EL2.E2H=1: half of the bits are held in CNTKCTL_EL1, and
thus can be changed behind our back, while the rest lives
in the CNTHCTL_EL2 shadow copy that is memory-based.

Yes, this is a lot of fun!

Make sure that we merge the two on read access, while we can
write to CNTKCTL_EL1 in a more straightforward manner.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c    | 28 ++++++++++++++++++++++++++++
 include/kvm/arm_arch_timer.h |  3 +++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 3cd54656a8e2f..932d2fb7a52a0 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -157,6 +157,21 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 		if (!is_hyp_ctxt(vcpu))
 			goto memory_read;
 
+		/*
+		 * CNTHCTL_EL2 requires some special treatment to
+		 * account for the bits that can be set via CNTKCTL_EL1.
+		 */
+		switch (reg) {
+		case CNTHCTL_EL2:
+			if (vcpu_el2_e2h_is_set(vcpu)) {
+				val = read_sysreg_el1(SYS_CNTKCTL);
+				val &= CNTKCTL_VALID_BITS;
+				val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
+				return val;
+			}
+			break;
+		}
+
 		/*
 		 * If this register does not have an EL1 counterpart,
 		 * then read the stored EL2 version.
@@ -207,6 +222,19 @@ void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
 		 */
 		__vcpu_sys_reg(vcpu, reg) = val;
 
+		switch (reg) {
+		case CNTHCTL_EL2:
+			/*
+			 * If E2H=0, CNHTCTL_EL2 is a pure shadow register.
+			 * Otherwise, some of the bits are backed by
+			 * CNTKCTL_EL1, while the rest is kept in memory.
+			 * Yes, this is fun stuff.
+			 */
+			if (vcpu_el2_e2h_is_set(vcpu))
+				write_sysreg_el1(val, SYS_CNTKCTL);
+			return;
+		}
+
 		/* No EL1 counterpart? We're done here.? */
 		if (reg == el1r)
 			return;
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index c819c5d16613b..fd650a8789b91 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -147,6 +147,9 @@ u64 timer_get_cval(struct arch_timer_context *ctxt);
 void kvm_timer_cpu_up(void);
 void kvm_timer_cpu_down(void);
 
+/* CNTKCTL_EL1 valid bits as of DDI0487J.a */
+#define CNTKCTL_VALID_BITS	(BIT(17) | GENMASK_ULL(9, 0))
+
 static inline bool has_cntpoff(void)
 {
 	return (has_vhe() && cpus_have_final_cap(ARM64_HAS_ECV_CNTPOFF));
-- 
2.39.2


