Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E474C44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyIGlzMp8KtUkHTmmzLTDwn4GTo9DZ59gUjGug7RCBk=; b=l1tvoy9zbkQ0//U1GjtZQemt0N
	turCtmbwuG+DU2ww+InyMhTaG4gn4/khhgJczNUZp6luQXamUsLcXu49yQJBj2CGnC/aACLefs9kp
	a5CfSgi4t1hv1UZXzRjWAL5siORZsYkkUU2BAidrD5P0RggtCbvU1VEdxh0MWjKDZsvH/KOJWfEmc
	G+0yETdvO6b2nw4fTBEMAIyO/Wc7EmTcecJ2sTwzoizWyBRBJGANEbbToibGM8mb0Nl2VCJy1kQmb
	5hPukUOMpiLJW1F6F87Y6syd8iSvykQbVFeS6dt9BPYzM6iu7/GDu51DNioI9mJlEVnf1bJrxUQUP
	IySCrnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGD-0000000BPKo-45AN;
	Tue, 14 Jul 2026 09:17:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZG1-0000000BP3D-2OlF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E3A561377;
	Tue, 14 Jul 2026 09:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145201F00A3A;
	Tue, 14 Jul 2026 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020613;
	bh=nyIGlzMp8KtUkHTmmzLTDwn4GTo9DZ59gUjGug7RCBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZHP1mi5mJCR/wLH3kKRkx7N3lXLPX27dIPorvyim+L+kbjnSNd1VTknH4JmBLivWc
	 nnUyWgUQoAFaFcgucXLFdYeTLp7RVCpRt+dAbWQuFOCUhTn+Y8i9MoHCXN8YGhFDjk
	 yhEuW0qBBeF4ztcOg9QJ0LCCW5ozdbH7AQkYt/o19eOd2NTcf4s449+LR9XS97u5Au
	 B6C6muz1lKR86reN60s9b7JUgm++JB4V6T3yRWoXa2R1faFD7RHAcyhstVC6+gvu3Q
	 t2S3IRUeu+43xBvw/NycTeq1hxif8AwEh26Gm1hEi2lRe8oo3JN2h33oAJu8Tp0MWC
	 QtOT5fnTvoQyw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFz-00000004ny1-1pHP;
	Tue, 14 Jul 2026 09:16:51 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 21/28] KVM: arm64: Add NVHCR_EL2 handling to the sysreg array
Date: Tue, 14 Jul 2026 10:16:34 +0100
Message-ID: <20260714091641.1970822-22-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714091641.1970822-1-maz@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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


