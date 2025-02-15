Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF79AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wxa1NEmkHNZdnvigK+LG91Nu0vtbIXiclL94yHdqg+s=; b=WZrBw3e6fix/vixQMdhfPFp54f
	sZbPbDZm8az4It36BIDCDjV6ZhI6vLn2dulqBmYqR8Cu2LchC37JH0/GHLsjwbcPQ1HVbUUQOZ9Hy
	TFwWZlVJ4RlOMA/slG0+vIdw1r86YM+yXXxQ28KKpmqo+M2x/wtcaqmPcbO7/jyKtKAYK6ClR4zwN
	ux8wHqiTrRBe6mYoEtOHXRzdotjaM+QhefxoxPUOeTAcO4f5lMhoBSphs4Oz0k7Uzih0JyK/tXoeG
	5OXKv0mYf1lCDBAcm3zfIpnCQ8wb4+QknE1iWg1Wf9su92QX934sMqLlBiFyAezi8lJ4blTw7yej+
	JJe3Vuag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJuQ-00000000ItJ-46ps;
	Sat, 15 Feb 2025 15:16:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgE-00000000H3F-1SZW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 56CE35C5419;
	Sat, 15 Feb 2025 15:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A8AC4CEE9;
	Sat, 15 Feb 2025 15:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631723;
	bh=zkHr3vkzDC1kIdGLI1aElkjYHYfjk/IsB6KkkSw5XXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nrUd42OyfvCH1SC3wCEszYBngm0+i3DA9zYt4hGbMtC7fjSETBHv0m+6lVKJoHGVG
	 cPxsQSv1Z9LGKCob2niUx6AhNCFj4Pbrpell6ZUENOPCpdhnCQgK55Ix5LOM4lJ2/O
	 ZVtxj1WZzR4DEujiGCixM3MWBG2d7dSlSFlrJmp4uJVzZ4MF9KKzNuXoYSiz/l/WSQ
	 1fxhWnPWv3CIwf+drsXxnb42G/sv5MYEDo+LIPDqWdklRgbjwd1vH63COLRKhTvpSg
	 XeTEMgmW0qQZpcwoICNscctf/Wg4m8GC/D771W2Lpm6P/wfQYaMuL6Ly6CESBrbCqc
	 rV7+uMKi/wMvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJg9-004Nz6-Om;
	Sat, 15 Feb 2025 15:02:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 08/14] KVM: arm64: nv: Add userspace and guest handling of VNCR_EL2
Date: Sat, 15 Feb 2025 15:01:28 +0000
Message-Id: <20250215150134.3765791-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215150134.3765791-1-maz@kernel.org>
References: <20250215150134.3765791-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070206_475343_D0913B84 
X-CRM114-Status: GOOD (  12.77  )
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

Plug VNCR_EL2 in the vcpu_sysreg enum, define its RES0/RES1 bits,
and make it accessible to userspace when the VM is configured to
support FEAT_NV2.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/nested.c           |  3 +++
 arch/arm64/kvm/sys_regs.c         | 24 +++++++++++++++---------
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index dd287ccaffdb7..9b91a9e97cdce 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -551,6 +551,8 @@ enum vcpu_sysreg {
 	VNCR(HDFGWTR_EL2),
 	VNCR(HAFGRTR_EL2),
 
+	VNCR(VNCR_EL2),
+
 	VNCR(CNTVOFF_EL2),
 	VNCR(CNTV_CVAL_EL0),
 	VNCR(CNTV_CTL_EL0),
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 6ae5ec43ddeaa..aed25a003750d 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1371,6 +1371,9 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= GENMASK(11, 8);
 	set_sysreg_masks(kvm, CNTHCTL_EL2, res0, res1);
 
+	/* VNCR_EL2 */
+	set_sysreg_masks(kvm, VNCR_EL2, VNCR_EL2_RES0, VNCR_EL2_RES1);
+
 out:
 	for (enum vcpu_sysreg sr = __SANITISED_REG_START__; sr < NR_SYS_REGS; sr++)
 		(void)__vcpu_sys_reg(vcpu, sr);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 24eaff9379e75..cf1243dd04548 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2234,15 +2234,6 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 			"trap of EL2 register redirected to EL1");
 }
 
-#define EL2_REG(name, acc, rst, v) {		\
-	SYS_DESC(SYS_##name),			\
-	.access = acc,				\
-	.reset = rst,				\
-	.reg = name,				\
-	.visibility = el2_visibility,		\
-	.val = v,				\
-}
-
 #define EL2_REG_FILTERED(name, acc, rst, v, filter) {	\
 	SYS_DESC(SYS_##name),			\
 	.access = acc,				\
@@ -2252,6 +2243,9 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	.val = v,				\
 }
 
+#define EL2_REG(name, acc, rst, v)			\
+	EL2_REG_FILTERED(name, acc, rst, v, el2_visibility)
+
 #define EL2_REG_VNCR(name, rst, v)	EL2_REG(name, bad_vncr_trap, rst, v)
 #define EL2_REG_REDIR(name, rst, v)	EL2_REG(name, bad_redir_trap, rst, v)
 
@@ -2407,6 +2401,16 @@ static unsigned int sve_el2_visibility(const struct kvm_vcpu *vcpu,
 	return __el2_visibility(vcpu, rd, sve_visibility);
 }
 
+static unsigned int vncr_el2_visibility(const struct kvm_vcpu *vcpu,
+					const struct sys_reg_desc *rd)
+{
+	if (el2_visibility(vcpu, rd) == 0 &&
+	    kvm_has_feat(vcpu->kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
+		return 0;
+
+	return REG_HIDDEN;
+}
+
 static bool access_zcr_el2(struct kvm_vcpu *vcpu,
 			   struct sys_reg_params *p,
 			   const struct sys_reg_desc *r)
@@ -3054,6 +3058,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 			 tcr2_el2_visibility),
 	EL2_REG_VNCR(VTTBR_EL2, reset_val, 0),
 	EL2_REG_VNCR(VTCR_EL2, reset_val, 0),
+	EL2_REG_FILTERED(VNCR_EL2, bad_vncr_trap, reset_val, 0,
+			 vncr_el2_visibility),
 
 	{ SYS_DESC(SYS_DACR32_EL2), undef_access, reset_unknown, DACR32_EL2 },
 	EL2_REG_VNCR(HDFGRTR_EL2, reset_val, 0),
-- 
2.39.2


