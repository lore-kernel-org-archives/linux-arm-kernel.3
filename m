Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B854CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JB3rFF/TfYIMFzTMx1USjmdHmsIPs/5+U8L7g7nSl1U=; b=uWX3MciK3y4gs/yPfS7OtsuHAq
	AYIrKA41UX3F245pqGEfAc3/uE2rH0e5BuwGIP/zeVunITyqt0P5CI9RiKMntgeANJUIwUE2hnm0M
	IZwk3q57SRjWpUCzys2BKuJU1dpiZg04v8V5bk74BACbXK2lhjpoh0+NvMfx7PqzF1xZGCs85kg2D
	CBbWn4vOChph0Q+GvG6PUcQJhwaDk/vW/OXtIYOW18KLZTuwIjrFsOApBHaOG1mfKCyx/0HL4O69z
	aSAcWnrPkfLFVwBlLFGnuTiTIvUzQcfFkNWt4orpwmbwEsy6M02T9WYKJzo7L/TkbClgJEhOOproh
	iyLCja1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNA-00000002two-2a0q;
	Mon, 29 Sep 2025 16:05:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN8-00000002tte-3n39
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AEE6625C9;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1147C4CEF4;
	Mon, 29 Sep 2025 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161905;
	bh=vM2LsAfY9nrvp2BkddcX72dJdqZ7gW3wqW7BXtGgiIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mkUoQwcrtyBt9lrr7rqDlQ/M6DrrpdxDFoGWd5jlWOiNzlc1U7/a2anrvbOOcHySE
	 TgnOOdEpwuk9vSUDb4UJrWzil4xu69lrJoprxm4nJnbZS3deolPSO6oD6ZNMflIZDv
	 pxEgPWlYo6kk/fijdj6kh2BjRs/yLIId9gt4N4w9fiEIBPeaESIHzre9t5jScpYbSV
	 1qRKOgkHRABQg82eaFoz4RlbjYyJiWtxTvchJcTSHYiqvJND/17GakZjogTPH2WO/d
	 OxQHjxBoql1IScTOVKA/MC0xFYp11iQjAV1RnLwHARZWB4f8iqlZJY1NaizjqQ8Yju
	 /PtQkSrIIGPsw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN5-0000000AHqo-1kXi;
	Mon, 29 Sep 2025 16:05:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 01/13] KVM: arm64: Hide CNTHV_*_EL2 from userspace for nVHE guests
Date: Mon, 29 Sep 2025 17:04:45 +0100
Message-ID: <20250929160458.3351788-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Although we correctly UNDEF any CNTHV_*_EL2 access from the guest
when E2H==0, we still expose these registers to userspace, which
is a bad idea.

Drop the ad-hoc UNDEF injection and switch to a .visibility()
callback which will also hide the register from userspace.

Fixes: 0e45981028550 ("KVM: arm64: timer: Don't adjust the EL2 virtual timer offset")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ee8a7033c85bf..9f2f4e0b042e8 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1594,16 +1594,6 @@ static bool access_arch_timer(struct kvm_vcpu *vcpu,
 	return true;
 }
 
-static bool access_hv_timer(struct kvm_vcpu *vcpu,
-			    struct sys_reg_params *p,
-			    const struct sys_reg_desc *r)
-{
-	if (!vcpu_el2_e2h_is_set(vcpu))
-		return undef_access(vcpu, p, r);
-
-	return access_arch_timer(vcpu, p, r);
-}
-
 static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
 				    s64 new, s64 cur)
 {
@@ -2831,6 +2821,16 @@ static unsigned int s1pie_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, s1pie_visibility);
 }
 
+static unsigned int cnthv_visibility(const struct kvm_vcpu *vcpu,
+				     const struct sys_reg_desc *rd)
+{
+	if (vcpu_has_nv(vcpu) &&
+	    !vcpu_has_feature(vcpu, KVM_ARM_VCPU_HAS_EL2_E2H0))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static bool access_mdcr(struct kvm_vcpu *vcpu,
 			struct sys_reg_params *p,
 			const struct sys_reg_desc *r)
@@ -3691,9 +3691,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(CNTHP_CTL_EL2, access_arch_timer, reset_val, 0),
 	EL2_REG(CNTHP_CVAL_EL2, access_arch_timer, reset_val, 0),
 
-	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_hv_timer },
-	EL2_REG(CNTHV_CTL_EL2, access_hv_timer, reset_val, 0),
-	EL2_REG(CNTHV_CVAL_EL2, access_hv_timer, reset_val, 0),
+	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_arch_timer, .visibility = cnthv_visibility },
+	EL2_REG_FILTERED(CNTHV_CTL_EL2, access_arch_timer, reset_val, 0, cnthv_visibility),
+	EL2_REG_FILTERED(CNTHV_CVAL_EL2, access_arch_timer, reset_val, 0, cnthv_visibility),
 
 	{ SYS_DESC(SYS_CNTKCTL_EL12), access_cntkctl_el12 },
 
-- 
2.47.3


