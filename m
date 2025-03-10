Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B407CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brnvscY5/4hz68wQmxJ/ReyxdbtxV7LsL8M3EOgnYSU=; b=nIdPTyAqaZgksF44on/8SKYAOH
	r/MiUOl+p+gYtH/QXIlcRYqnV1fwPVP0OuphGxe1zAyso3SZE/KSsFu7yEQtwsD+KcH5ePsyYGQ9r
	fp+oX2w8WDK9vNbCgX0CUkTi/XR69wzEPB+PLblhLwiRdMIbOFSzpusCECMdG6yX7Je+idgnbS+VM
	/WQoUL0E09OpjcLLmuug4VhcR19bDpEBhq28xb3JGXwjCBeeQX8/y4cedfYFgvk0r0TpVqf4+y0oC
	E10MVuXdk3W8DEgD3Ug4WpkaWx3HTmIhr3c/BMMQ+4C8w+rjXAO4agB2Jm8GrzICcZNSErNBYZ5al
	liQVLlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcqF-00000002jIZ-30fI;
	Mon, 10 Mar 2025 13:06:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC3-00000002bU8-41uz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7519D5C62F2;
	Mon, 10 Mar 2025 12:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA7DC4CEEA;
	Mon, 10 Mar 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609514;
	bh=SDUIOlNqQ87i1vijUCJbXLVpQdSsgd/Qp0Xs1seXTZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+holpFNBZd+8pzk2Oi8ozk7KkGBLEMFfAsTVxN7jpZmnvYwa+kjsCy07vaQ1trUH
	 JzJS9jojRkvsEznnpgy2YI2pw++Dx0Z4Mv4xYV23fDvMY4Z91nUTKMmi4BsCEfcuvO
	 89BC8YktDg7n/TcwsbnvvPcKhLaR9HpNp+8BpsrHAt1IGf0QuN2AHanZQSm1eDLv+e
	 FY8bj7+LdsZYQPAlTrxViFfu2jUo92sle/hrJwyFsD6RSQHYDdiPzllplzv1eP+1dq
	 M6xGAeymDm8oGtSXQW6S17vDylgnU4OlXVRaRla2ooYp71/n5NH3jNf1pmYcDYuUcF
	 xO6mYjU33KV9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC1-00CAea-2d;
	Mon, 10 Mar 2025 12:25:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 12/23] KVM: arm64: Unconditionally configure fine-grain traps
Date: Mon, 10 Mar 2025 12:24:54 +0000
Message-Id: <20250310122505.2857610-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052516_112161_903FE857 
X-CRM114-Status: GOOD (  11.35  )
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

From: Mark Rutland <mark.rutland@arm.com>

... otherwise we can inherit the host configuration if this differs from
the KVM configuration.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
[maz: simplified a couple of things]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 39 ++++++++++---------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 927f27badf758..c4e12516f6466 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -107,7 +107,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 
 #define update_fgt_traps_cs(hctxt, vcpu, kvm, reg, clr, set)		\
 	do {								\
-		u64 c = 0, s = 0;					\
+		u64 c = clr, s = set;					\
+		u64 val;						\
 									\
 		ctxt_sys_reg(hctxt, reg) = read_sysreg_s(SYS_ ## reg);	\
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
@@ -115,14 +116,10 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 									\
 		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
 									\
-		s |= set;						\
-		c |= clr;						\
-		if (c || s) {						\
-			u64 val = __ ## reg ## _nMASK;			\
-			val |= s;					\
-			val &= ~c;					\
-			write_sysreg_s(val, SYS_ ## reg);		\
-		}							\
+		val = __ ## reg ## _nMASK;				\
+		val |= s;						\
+		val &= ~c;						\
+		write_sysreg_s(val, SYS_ ## reg);			\
 	} while(0)
 
 #define update_fgt_traps(hctxt, vcpu, kvm, reg)		\
@@ -175,33 +172,27 @@ static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 		update_fgt_traps(hctxt, vcpu, kvm, HAFGRTR_EL2);
 }
 
-#define __deactivate_fgt(htcxt, vcpu, kvm, reg)				\
+#define __deactivate_fgt(htcxt, vcpu, reg)				\
 	do {								\
-		if ((vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) ||	\
-		    kvm->arch.fgu[reg_to_fgt_group_id(reg)])		\
-			write_sysreg_s(ctxt_sys_reg(hctxt, reg),	\
-				       SYS_ ## reg);			\
+		write_sysreg_s(ctxt_sys_reg(hctxt, reg),		\
+			       SYS_ ## reg);				\
 	} while(0)
 
 static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
-	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
 
 	if (!cpus_have_final_cap(ARM64_HAS_FGT))
 		return;
 
-	__deactivate_fgt(hctxt, vcpu, kvm, HFGRTR_EL2);
-	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
-		write_sysreg_s(ctxt_sys_reg(hctxt, HFGWTR_EL2), SYS_HFGWTR_EL2);
-	else
-		__deactivate_fgt(hctxt, vcpu, kvm, HFGWTR_EL2);
-	__deactivate_fgt(hctxt, vcpu, kvm, HFGITR_EL2);
-	__deactivate_fgt(hctxt, vcpu, kvm, HDFGRTR_EL2);
-	__deactivate_fgt(hctxt, vcpu, kvm, HDFGWTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGRTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGWTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGITR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HDFGRTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HDFGWTR_EL2);
 
 	if (cpu_has_amu())
-		__deactivate_fgt(hctxt, vcpu, kvm, HAFGRTR_EL2);
+		__deactivate_fgt(hctxt, vcpu, HAFGRTR_EL2);
 }
 
 static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
-- 
2.39.2


