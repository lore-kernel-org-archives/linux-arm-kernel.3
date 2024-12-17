Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCB0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tO5cOp0Dfmc6YCbgkN3BmmoUDlvZGxIKPn3R/Y+mT4=; b=qDAQxyfOA3jkD2d4egiDb3lF+M
	ac5hxh1Mfe+DAXsYVLh4iVh6dAYPuNEnrDvNlNv9RQCQqJb/gfjjH0Am8PHxBI5qc/ISX3HP6NEN3
	hpqBwy7iIikTLUCr1Cj1FZJ8NM7j+A3b2UkoY+mHt8TxX4qwuS6hegRVjWAYBHyKnzi4Uodj2VEU2
	yYCFP4cHbEExAYX83YdMfIInzfTDoCW1T+KqbYavLL8jOUHdbx/IDkxpNb9IulQzIJd4RWz+H97Vn
	ErU9iJBSzZE550CWxlZxroG68lIrCcPsfLI1RW8IDQ+hUMBVgfQmOt7uWO2o/LSWPwI7cgUwwR8Ds
	Z7DGJY2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYeW-0000000Dlsi-1nHZ;
	Tue, 17 Dec 2024 14:34:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYU2-0000000DjZJ-0Yjc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 14:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+tO5cOp0Dfmc6YCbgkN3BmmoUDlvZGxIKPn3R/Y+mT4=; b=A+Lq+jmPZJYN/dwslvTyMv0i/P
	uh4mMSX2yI30dGFDVgmpfhpjrFFjjGb/Gpies9NvxE6fyPHJZon+fmeDeq9eyZY4njCjAMxJMNiik
	+3K809lLBUjCtKc+yxhMjNkej642wMqrg9A5YBPUmzxsUY/CFywS7sbXi8oOCThlhFeiELvjylyPf
	SmOaOfn1OpvWGs1KFA7CSOxIooxbH38yIOi+Y4R7itMJFlehTb0oZA3SmiStEZhhMjvMa4tAP3CwV
	W00gAp/RYoFz5X4M3WwJ4OvKtD8kIkEcHAdp2bVtGyxkn/sS4zaLZvcD3fS6Q2BQIC9AUo7pveUpt
	P8be6XVA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTy-000000055Wv-266a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5FD05C58E4;
	Tue, 17 Dec 2024 14:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09A2C4CEE0;
	Tue, 17 Dec 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445407;
	bh=HmEk0RAxHAj5K5OGiepCVArlYvZ8T1KHJ8vERxPf9yQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORJI/C3+dbM94aDl7Gch8yLKTEWVFjFWqC2OXdxvWLfuHOGJI9cb5ccGNUCCtEX3B
	 ZJd7kUE4pPVJrlUm0fVFMPGCn08B1K2i91lhHXFxyi7mygCR1YsXuvHtziZ5FS0i3k
	 UUYzL8wKBkhu9excXML7vXUo+jajqATUQmAz/5D5MuumLUKZYAwvaMunY5sCtWDtCn
	 Dk7sSEZSRPaeddPgpmObock4+0d4+RQTkKKzMKobycllVl+YK4CGilHK3KeBQSZ2KM
	 b+k6zIZph5/0n9mSslcqrxqKhMmlpUcfPpvmRbUdhiYs4HHw9i+QafBuO4kMfqQ4g8
	 8tpGG+lEb4WVw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTt-004aJx-V7;
	Tue, 17 Dec 2024 14:23:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 07/12] KVM: arm64: Handle counter access early in non-HYP context
Date: Tue, 17 Dec 2024 14:23:15 +0000
Message-Id: <20241217142321.763801-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_142330_834565_0C67DCB9 
X-CRM114-Status: GOOD (  13.82  )
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

We already deal with CNTPCT_EL0 accesses in non-HYP context.
Let's add CNTVCT_EL0 as a good measure.

This is also an opportunity to simplify things and make it
plain that this code is only for non-HYP context handling.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 34 +++++++++++++++----------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 30e572de28749..719479b42b329 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -506,7 +506,7 @@ static inline u64 compute_counter_value(struct arch_timer_context *ctxt)
 	return arch_timer_read_cntpct_el0() - timer_get_offset(ctxt);
 }
 
-static bool kvm_hyp_handle_cntpct(struct kvm_vcpu *vcpu)
+static bool kvm_handle_cntxct(struct kvm_vcpu *vcpu)
 {
 	struct arch_timer_context *ctxt;
 	u32 sysreg;
@@ -516,18 +516,19 @@ static bool kvm_hyp_handle_cntpct(struct kvm_vcpu *vcpu)
 	 * We only get here for 64bit guests, 32bit guests will hit
 	 * the long and winding road all the way to the standard
 	 * handling. Yes, it sucks to be irrelevant.
+	 *
+	 * Also, we only deal with non-hypervisor context here (either
+	 * an EL1 guest, or a non-HYP context of an EL2 guest).
 	 */
+	if (is_hyp_ctxt(vcpu))
+		return false;
+
 	sysreg = esr_sys64_to_sysreg(kvm_vcpu_get_esr(vcpu));
 
 	switch (sysreg) {
 	case SYS_CNTPCT_EL0:
 	case SYS_CNTPCTSS_EL0:
 		if (vcpu_has_nv(vcpu)) {
-			if (is_hyp_ctxt(vcpu)) {
-				ctxt = vcpu_hptimer(vcpu);
-				break;
-			}
-
 			/* Check for guest hypervisor trapping */
 			val = __vcpu_sys_reg(vcpu, CNTHCTL_EL2);
 			if (!vcpu_el2_e2h_is_set(vcpu))
@@ -539,16 +540,23 @@ static bool kvm_hyp_handle_cntpct(struct kvm_vcpu *vcpu)
 
 		ctxt = vcpu_ptimer(vcpu);
 		break;
+	case SYS_CNTVCT_EL0:
+	case SYS_CNTVCTSS_EL0:
+		if (vcpu_has_nv(vcpu)) {
+			/* Check for guest hypervisor trapping */
+			val = __vcpu_sys_reg(vcpu, CNTHCTL_EL2);
+
+			if (val & CNTHCTL_EL1TVCT)
+				return false;
+		}
+
+		ctxt = vcpu_vtimer(vcpu);
+		break;
 	default:
 		return false;
 	}
 
-	val = arch_timer_read_cntpct_el0();
-
-	if (ctxt->offset.vm_offset)
-		val -= *kern_hyp_va(ctxt->offset.vm_offset);
-	if (ctxt->offset.vcpu_offset)
-		val -= *kern_hyp_va(ctxt->offset.vcpu_offset);
+	val = compute_counter_value(ctxt);
 
 	vcpu_set_reg(vcpu, kvm_vcpu_sys_get_rt(vcpu), val);
 	__kvm_skip_instr(vcpu);
@@ -593,7 +601,7 @@ static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 	    __vgic_v3_perform_cpuif_access(vcpu) == 1)
 		return true;
 
-	if (kvm_hyp_handle_cntpct(vcpu))
+	if (kvm_handle_cntxct(vcpu))
 		return true;
 
 	return false;
-- 
2.39.2


