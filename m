Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D52CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWA2Fs6IkN8QYF6WUbzuWUjUs8h5hPJv0CvZ+fikkRQ=; b=buSxJgVk4GVc8rwRGP0mot4KlU
	Ktw3Slnke0h1GdLdYN/M1hc5bg2F76Y9gtkj3VRZBQJNTAU7OrBa2CTPnY8ng6aZhOkVpbOVDesdK
	/nzq8QYGn7js3II9Vl3sgw3O64kQAK6VjqKxJPiyEsfSNe2XTalAz1NvuQNILAlgOcsO+epTFOMDp
	WL6zON+dbu+O/X++a0isjIjCque2SsMcczNsBc0OgsbQUDxXJqlVLUoPui4JcMkh3n3cFFTtNH5wy
	1M7tgce4olvpNu8l6Yk6g+w5mxffKki6pmhoAGPeEKK3dQkgqNaSmSGg0Jz8DQeBTASX2VzX0Cg9X
	LHBtIRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncU1-00000005eYF-0boj;
	Sun, 17 Aug 2025 12:27:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncMK-00000005e3Z-3tyi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 12:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F389601FD;
	Sun, 17 Aug 2025 12:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11866C4CEED;
	Sun, 17 Aug 2025 12:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755433176;
	bh=RBob3+AvRkvfEfvFXTw/GdVJZ/1+9Wc1qjUp0oWbL8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MicD08+XXo1pVla9xI65WfAi2HmvTpxnN1p3V1haJEKgtZ3Bu/8EECll9IreGSaQA
	 pJxYyA38557tr15fwtpmoLqVHp0rfPH1VCrv0bchLP/4FRKTb+3mhk4+jc+7HnnbGI
	 6aojR+VBxTyYGYYu7lwgi19wX3AyMC5AJ8yy515EFPLq4NPg0QBegCccDTB8EH1sAN
	 gBocqRuiHfmMkNK5f1Yqxj6NpuwzHWRyrpqAq2lrle5R7Ez6Ee4PTuQnt3vdtkCxmD
	 urcKFAgNqPajJMlSgn8RZWeOi/yIcA6eXr5vOYEuouWc69Mgz2475ZdlY9kVgzdkbG
	 IrP8XorUnEK7g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uncME-008L0z-RG;
	Sun, 17 Aug 2025 13:19:30 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 2/4] KVM: arm64: Simplify sysreg access on exception delivery
Date: Sun, 17 Aug 2025 13:19:24 +0100
Message-Id: <20250817121926.217900-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817121926.217900-1-maz@kernel.org>
References: <20250817121926.217900-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, volodymyr_babchuk@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Distinguishing between NV and VHE is slightly pointless, and only
serves as an extra complication, or a way to introduce bugs, such
as the way SPSR_EL1 gets written without checking for the state
being resident.

Get rid if this silly distinction, and fix the bug in one go.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/exception.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 3e67333197ab2..bef40ddb16dbc 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -22,36 +22,28 @@
 
 static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
 {
-	u64 val;
-
-	if (unlikely(vcpu_has_nv(vcpu)))
+	if (has_vhe())
 		return vcpu_read_sys_reg(vcpu, reg);
-	else if (vcpu_get_flag(vcpu, SYSREGS_ON_CPU) &&
-		 __vcpu_read_sys_reg_from_cpu(reg, &val))
-		return val;
 
 	return __vcpu_sys_reg(vcpu, reg);
 }
 
 static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
 {
-	if (unlikely(vcpu_has_nv(vcpu)))
+	if (has_vhe())
 		vcpu_write_sys_reg(vcpu, val, reg);
-	else if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU) ||
-		 !__vcpu_write_sys_reg_to_cpu(val, reg))
+	else
 		__vcpu_assign_sys_reg(vcpu, reg, val);
 }
 
 static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
 			      u64 val)
 {
-	if (unlikely(vcpu_has_nv(vcpu))) {
+	if (has_vhe()) {
 		if (target_mode == PSR_MODE_EL1h)
 			vcpu_write_sys_reg(vcpu, val, SPSR_EL1);
 		else
 			vcpu_write_sys_reg(vcpu, val, SPSR_EL2);
-	} else if (has_vhe()) {
-		write_sysreg_el1(val, SYS_SPSR);
 	} else {
 		__vcpu_assign_sys_reg(vcpu, SPSR_EL1, val);
 	}
-- 
2.39.2


