Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64228D78339
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tO5cOp0Dfmc6YCbgkN3BmmoUDlvZGxIKPn3R/Y+mT4=; b=B6mHX5SGkg9CblkT6gdU6Atv3R
	9P0ece/2s9R+d0xG+n0n0kN2M9EHbrk4YiVDfn5d1Xq4TgBBYYpPLUhtjo9i24jl8y9ANZxDBNda7
	49H6FYkDfTMN5OTROtPsbl8NOtnX5ooGPSg9tX0Fy+LH5vqeaBwOyViuQtU/89HgHoUoOKUEl5Ji4
	8H097th05RMAM8K2kWqez5kSV3S4Z2WkrWPRqVHuXDZzpqlIrEOXiWPovEzy/vtHDfXwq3Z3bzE/g
	vfsQhnx8zMQnqdM6dfckIlt9kNSjmY5Ik8pbC4oCtcppczQYroS0zT96kbbEKS5JLNebUEQh79tpy
	q8II0v9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIABe-000000070UV-2biA;
	Mon, 02 Dec 2024 17:26:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7u-00000006zzc-1mCf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+tO5cOp0Dfmc6YCbgkN3BmmoUDlvZGxIKPn3R/Y+mT4=; b=ondcMuH5L6xsD11MB+sSOeyWp1
	4uW+IEfVhbt6NrVpDYlbmycA3ZCTug54NiwxC0E3nDUicA4fmI+tDtDklpBImS+73IwXB9U1jpPpp
	p/wszw9lUF0Uv0agMgeMpgkaghQ0QD2r+J4etxQSxg9pta+MWrgOIuvJhzNRLYq8bJAeSROYFhk/f
	vJp3r9aZU7OzGHerWYZbqAB64J1+vNrRpVFrFDIVDua84MEDIdAxzQmAZ0DaY06rRWpqA+1FjxZHX
	n9AnMPueq2lhhfbhNfDQw8HtPSoH6PQH8B++s7h50JTJa6v0EMM6mTzXI7xt0gPjA9VmKPAAHLyYh
	CmKc8WlQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIA7q-00000002D6v-0ojw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 17:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C79DEA4103E;
	Mon,  2 Dec 2024 17:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D15C4CEE1;
	Mon,  2 Dec 2024 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160139;
	bh=HmEk0RAxHAj5K5OGiepCVArlYvZ8T1KHJ8vERxPf9yQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kf0VHJ8iDQjtz83w10Wm8bbChUEcKiR4XCQQdhTXoK9kNWIUVGhG65cax0AuXfoqa
	 LPqOz0uqAAAfQOkjPduyGKu06ycbgXWKIgvPZ54XfuTKrwJCC/h+Xdahpzwmtm0bjT
	 pD2iBlHQfSLD7raP2j/G8MzXJRyFM2clA0KZEKh+yJ27cCMysjvZNSDnVZgMVv7SJE
	 L9IRb5ZfPu0HJysaRHgbP50jZyPgtSjq9cZaAxpAmDmLYAYT4e7TYDkde887yac8dI
	 AUkW3r58XWaAzL5Mhj8cuM+ID/gpidhnzrE8Bs6owSApvXbEA70ht9SH8Da96MwBcv
	 QpzEBgMPFfo2g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tIA7l-00HQcf-5H;
	Mon, 02 Dec 2024 17:22:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH 07/11] KVM: arm64: Handle counter access early in non-HYP context
Date: Mon,  2 Dec 2024 17:21:30 +0000
Message-Id: <20241202172134.384923-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202172134.384923-1-maz@kernel.org>
References: <20241202172134.384923-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172222_499251_D8A263E3 
X-CRM114-Status: GOOD (  14.03  )
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


