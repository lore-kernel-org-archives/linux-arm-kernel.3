Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EBAC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDICa5WTmVXA7/3rA0NTJ4yy9CZEkUFa94J2IXsemd0=; b=eAj/ocK8KCGFMZzL0gnDRDAg1p
	er/pfOEPjARudtx0yC/r2K7k5tlV26avHdEMkXeW1y6x+rIQLvtSUHzX6xHGhF/PhrHQOXn3mXN51
	2/3FXvV/dw/XPCdsuKEQglwR/r97YbmEMIBnp11ABKNDqm/7O+HKHdi5Uer3PSEQ1oH2jvhkwAmX7
	6377WvjaheSfohBgpXIhCAG2OQwyHZzw1ehUAvucUyfZ3ycnelsMmsGv6sdSvyHmhc8L4selfFEcV
	a4CKi8eQBOOmMQPC953C/0+v+2URLMwIWhx/l3vtOjP2ALyAqRfwS7/rwd1x/sWBpiV4pQrkMWZC5
	L0MCntnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvY-00000009geU-0IMe;
	Thu, 30 Jul 2026 07:11:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKup-00000009gKb-354h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E8CB43F9A;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511AD1F00ACA;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395451;
	bh=IDICa5WTmVXA7/3rA0NTJ4yy9CZEkUFa94J2IXsemd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZncKKVKBgdGDuAA5R9/5zizxhJny8dAuCiJhnDZjyig7Na7FGqENnHIELevj9i1xV
	 0cpoCAf79iS7i7iBH4OiIx67zOEo1XLmrNZzDh9zg+rRfRJLvOj7AFCFnbBSYBGiuP
	 dbipo/PcHOJRtFs29i0pe7ZZxr3z0h1cjHhOJMIxGJfPuPkJN9Oz3ckpXjZBGaYPu4
	 FML5JArs76yrEtjR8bjJZGgYsCuCd0wkDmTpD/uOLMveV6slJ4S78fyXfhdBXE6ASG
	 +YzMBOT0d17EPsh2PPk8ovEdbFsSkToLNGZSEdKZOBtwqEjguRIWPewmAxIoqwoj46
	 FjSmfRfvIWMZw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKun-0000000AOpW-2f78;
	Thu, 30 Jul 2026 07:10:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 06/29] KVM: arm64: Classify CPTR_EL2 as a SR_LOC_SPECIAL register
Date: Thu, 30 Jul 2026 08:09:59 +0100
Message-ID: <20260730071022.296811-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
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

It may not be obvious unless you look at it closely, but CPTR_EL2
is treated very differently from other registers. It is one the
registers that, despite looking very similar between EL1 and EL2
when E2H==1, have RES0 bits that get in the way.

Make it clear that CPTR_EL2 is odd by classifying it as SR_LOC_SPECIAL,
just like CNTHCTL_EL2 (and for the same reasons). This makes it
possible to use vcpu_read_sys_reg() with it, and will be necessary
once we support FEAT_NV2P1.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h |  2 +-
 arch/arm64/kvm/sys_regs.c            | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5bf3d7e1d92c7..9831166695186 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -617,7 +617,7 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
  */
 static inline u64 vcpu_sanitised_cptr_el2(const struct kvm_vcpu *vcpu)
 {
-	u64 cptr = __vcpu_sys_reg(vcpu, CPTR_EL2);
+	u64 cptr = vcpu_read_sys_reg(vcpu, CPTR_EL2);
 
 	if (!vcpu_el2_e2h_is_set(vcpu))
 		cptr = translate_cptr_el2_to_cpacr_el1(cptr);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5d5c579d45790..6b47d936efb32 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -183,8 +183,6 @@ static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
 	switch (reg) {
 		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
 				  translate_sctlr_el2_to_sctlr_el1	     );
-		MAPPED_EL2_SYSREG(CPTR_EL2,    CPACR_EL1,
-				  translate_cptr_el2_to_cpacr_el1	     );
 		MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
 				  translate_ttbr0_el2_to_ttbr0_el1	     );
 		MAPPED_EL2_SYSREG(TTBR1_EL2,   TTBR1_EL1,   NULL	     );
@@ -210,6 +208,19 @@ static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
 		loc->loc = ((is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu)) ?
 			    SR_LOC_SPECIAL : SR_LOC_MEMORY);
 		break;
+	case CPTR_EL2:
+		/*
+		 * CPTR_EL2 is just as special, and needs a certain amount
+		 * of handholding. It always lives in memory, due to being
+		 * heavily trapped thanks to CPACR_EL1.TCPAC being RES0.
+		 * FEAT_NV2p1 fixes this.
+		 */
+		locate_mapped_el2_register(vcpu, CPTR_EL2, CPACR_EL1,
+					   translate_cptr_el2_to_cpacr_el1,
+					   loc);
+		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
+			loc->loc = SR_LOC_SPECIAL;
+		break;
 	default:
 		loc->loc = locate_direct_register(vcpu, reg);
 	}
@@ -314,6 +325,8 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 			val &= CNTKCTL_VALID_BITS;
 			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
 			return val;
+		case CPTR_EL2:
+			return __vcpu_sys_reg(vcpu, reg);
 		default:
 			WARN_ON_ONCE(1);
 		}
@@ -359,6 +372,9 @@ void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
 			 */
 			write_sysreg_el1(val, SYS_CNTKCTL);
 			break;
+		case CPTR_EL2:
+			write_sysreg_el1(val, SYS_CPACR);
+			break;
 		default:
 			WARN_ON_ONCE(1);
 		}
-- 
2.47.3


