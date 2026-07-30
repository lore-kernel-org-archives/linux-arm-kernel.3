Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF098C55166
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyIGlzMp8KtUkHTmmzLTDwn4GTo9DZ59gUjGug7RCBk=; b=2RdaF9s3KbsdhOnvkjhdTnn3zn
	1Slh965mHxAqv25o5cutSG+FNR3iHnZLzI5RtG+Q79aVEU55dOF83L8R5nry8n3xAe5RuYcXVQxcr
	zMA2EFlNutAXDedeUtyZ150zmNfWfgv8TzxF/tzRXx4vn8bM9El00PFBou4YgT9I6GH+VyaG0CRp8
	BmY7ti1LEtxfQGZKQt4k/NritY7D7GbyyVfEHwMidPbwmdLdtLb9xTRPMu2ld1fnwzhIcBI2SwI/M
	b84rACda27vjE814muQmm27OUHGjquPmsAEGEVxdbMBO0CZtjHplMwd8hFdmuT4KQpvKLgoJT0rFW
	hs2z8/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKva-00000009gkQ-3qWK;
	Thu, 30 Jul 2026 07:11:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKus-00000009gNU-39xa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A761F40AAE;
	Thu, 30 Jul 2026 07:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898621F0155F;
	Thu, 30 Jul 2026 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395454;
	bh=nyIGlzMp8KtUkHTmmzLTDwn4GTo9DZ59gUjGug7RCBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RGr7vw+T41uqCaXxsaoPdQR+aOs1OBcAXAatKBrNpXTCyEO7mgZ6bAl/WI+ZkbS7k
	 YWjkgq5EsQnh79Ocs5UuD1cM7JIBaaiASwPobLVrkKRibOqmGkYGDEr+HeUJuH+2m8
	 33xDAGsjdd3GMeKoPgdxs1v5rCHAFtdF/lyPeukBnl7yDcBKEeYCemBVL4W0/pqWV8
	 rVNWrAgPVdkkiAJUty4wi8R4ny3k2FSkgJFkgwDQe7ZPl3wPyDB+b/LenowxZeaijv
	 ODauhJUWEkjVSlwo0AQIfIHxo8l4nDwXAepnSxMkPQSKkqahZL2Bu5mLdBFvoVWcjT
	 2RpJBJ/JlpcRw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKuq-0000000AOpW-3qi1;
	Thu, 30 Jul 2026 07:10:52 +0000
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
Subject: [PATCH v4 21/29] KVM: arm64: Add NVHCR_EL2 handling to the sysreg array
Date: Thu, 30 Jul 2026 08:10:14 +0100
Message-ID: <20260730071022.296811-22-maz@kernel.org>
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

Expose NVHCR_EL2 to userspace, and treat the direct access as UNDEF,
as that would only outline a bug in our exception routing.

The generic accessors are also updated to deal with the relatively
uncommon location of that register.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 9439c5b2b1fe8..0aeb2e736fde3 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -221,6 +221,20 @@ static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
 		if (is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu))
 			loc->loc = SR_LOC_SPECIAL;
 		break;
+	case NVHCR_EL2:
+		/*
+		 * Yes, NVHCR_EL2 maps to itself when loaded in nested
+		 * context. If you feel like the architecture is double
+		 * backing on itself upside down, you're not alone.
+		 */
+		WARN_ON_ONCE(!kvm_has_nv3(vcpu->kvm));
+		if (is_hyp_ctxt(vcpu)) {
+			loc->loc = SR_LOC_MEMORY;
+		} else {
+			loc->loc = SR_LOC_LOADED | SR_LOC_MAPPED;
+			loc->map_reg = NVHCR_EL2;
+		}
+		break;
 	default:
 		loc->loc = locate_direct_register(vcpu, reg);
 	}
@@ -260,6 +274,7 @@ static u64 read_sr_from_cpu(enum vcpu_sysreg reg)
 	case DACR32_EL2:	val = read_sysreg_s(SYS_DACR32_EL2);	break;
 	case IFSR32_EL2:	val = read_sysreg_s(SYS_IFSR32_EL2);	break;
 	case DBGVCR32_EL2:	val = read_sysreg_s(SYS_DBGVCR32_EL2);	break;
+	case NVHCR_EL2:		val = read_sysreg_s(SYS_NVHCR_EL2);	break;
 	default:		WARN_ON_ONCE(1);
 	}
 
@@ -298,6 +313,7 @@ static void write_sr_to_cpu(enum vcpu_sysreg reg, u64 val)
 	case DACR32_EL2:	write_sysreg_s(val, SYS_DACR32_EL2);	break;
 	case IFSR32_EL2:	write_sysreg_s(val, SYS_IFSR32_EL2);	break;
 	case DBGVCR32_EL2:	write_sysreg_s(val, SYS_DBGVCR32_EL2);	break;
+	case NVHCR_EL2:		write_sysreg_s(val, SYS_NVHCR_EL2);	break;
 	default:		WARN_ON_ONCE(1);
 	}
 }
@@ -2861,6 +2877,16 @@ static unsigned int vncr_el2_visibility(const struct kvm_vcpu *vcpu,
 	return REG_HIDDEN;
 }
 
+static unsigned int nvhcr_el2_visibility(const struct kvm_vcpu *vcpu,
+					const struct sys_reg_desc *rd)
+{
+	if (el2_visibility(vcpu, rd) == 0 &&
+	    kvm_has_feat(vcpu->kvm, ID_AA64MMFR4_EL1, NV_frac, NV3))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static unsigned int sctlr2_visibility(const struct kvm_vcpu *vcpu,
 				      const struct sys_reg_desc *rd)
 {
@@ -3774,6 +3800,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 			 sve_el2_visibility),
 
 	EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
+	EL2_REG_FILTERED(NVHCR_EL2, undef_access, reset_val, 0,
+			 nvhcr_el2_visibility),
 
 	EL2_REG(TTBR0_EL2, access_rw, reset_val, 0),
 	EL2_REG(TTBR1_EL2, access_rw, reset_val, 0),
-- 
2.47.3


