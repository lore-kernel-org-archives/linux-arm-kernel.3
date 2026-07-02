Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF4BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyIGlzMp8KtUkHTmmzLTDwn4GTo9DZ59gUjGug7RCBk=; b=vx8AVK6/hIMws/kY9KAEb5ZowU
	wcQ5jlkRqcU+YN1XFBM6ds/RASjZzjiIZCEAgbMbjIS56R9qUKpNmN8UW5vIfp0HY+Yml0VZKyhHE
	o4S2ivFXTpvgN4cshXayUJHl+oOu2vQT74cuzA9j/syp5lyJFp94SCDK22Pu7pM5FfGfbVDxe/JWp
	7sDwn5mCpIsKO2eEm48+Ji67Tveh5RXIff3P29bdofCzpigqvGLDDnyJVZAP0L/Uz4WhNeE3taW6a
	SuPOMAI6yZNLhEq7UwwFMoQS/YxCn7LbFuA39v+v7mljFQ48ZMqqUsnPi6XKawbApc1ig3f4SgJyW
	OiJl6n3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsf-00000004uZF-2ANY;
	Thu, 02 Jul 2026 16:03:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsW-00000004uGH-1ov9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FD024024B;
	Thu,  2 Jul 2026 16:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117011F00A3E;
	Thu,  2 Jul 2026 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008184;
	bh=nyIGlzMp8KtUkHTmmzLTDwn4GTo9DZ59gUjGug7RCBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JD5hKmtZghfO0knt1ar04iDQ0BK0ZwChAAlf02qkU5xV/spae397mpfre7wMfMw8j
	 0+oCnhHOjBb8MMFmrI2P3+/spjp88MSZ2tReBaQYU6kAHSv/89/I0wVGvdDWxvoOOH
	 5beYZzZH1Yjv6tVQMO/1+6t6D2/5WKznHjwfvMSDnC15FpFp5MG/2U8MRM01xwKq8d
	 sK9obBqVbvra6i7Dg/0SoaRBKe+hS8/c6/c+M5nsm3Gh/OS/ce74Hm9vF6XyZZ3K29
	 a2wTRT6YSHgX7hv/DgnGk2h8Qoqjq9guxJ+6yf1LxEN8Cld013BI+eHLWdLJqup1K4
	 3Q9k30ZmhFQPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsU-00000000ojd-1Yzj;
	Thu, 02 Jul 2026 16:03:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 21/28] KVM: arm64: Add NVHCR_EL2 handling to the sysreg array
Date: Thu,  2 Jul 2026 17:02:41 +0100
Message-ID: <20260702160248.1377250-22-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
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


