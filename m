Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8825CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY+e1mAGHb41+7xCbtmLzdLOkVHMnLMl9/0yWN/6Ji8=; b=HHLi8sMUl0jwEFNmavnKol7CKE
	EAlbl7g2osfm2ADk1SKmroypxC0SAZQoxgO0fRpcTVbxJCzOZJ7mAlUWD6QAmFcTYjJMtvh+oqTzz
	+1I36VItrc2Vqt6ctHLWdgpnOGjVuAdrzuGwlIdLln+UvkvBk0wijNq4UdRvBOEgD+VXN8aJJa12h
	SZ7Lxt677+hgXcKKZ+Mbm6se7GkuAW5jHFRWOQWLGyEGNOyETpGLU627qhMqxfM4c3yrR1k7pOxKW
	p4d5F+QUPyAzocuo0U76rbEndOU7Ofll0y/43DBQN0l3zQnZQ22DM2hVPJLBneeNTn5bC50eOZeOz
	YGixTGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNb-00000002uGC-1XEC;
	Mon, 29 Sep 2025 16:05:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN9-00000002tuS-1SKo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B2E048BC1;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA67C4CEF4;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161906;
	bh=FYkTMaNMt2gav9jtrgpiFbBiAEdFV/eKHpXBBf6r0zI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QYk1Jx3C9g/vRs0glnODl3QGMP5q04jeBbuom1x5rZAzaSmTNgIRrKxL+hogX/iTV
	 PbnPqQp37JzMUk4Qhw5fyrjdvQO9MHz/bOHLxxH/HXxO0LUAXuNapWtPuII7liqktX
	 1TcmW4+czUMy9gf+peGJL8bL8X5oG5Di4WXmQ5y1PtrzyTHo3/UOUdQjP+dqoQOQwY
	 vGtF370TQ1kH48zonUFxHHZ2wNzrUqbRIqJh4seY6lP9iQlbvEK3N6xzKPYGMZ8xF9
	 wmDLMCtXlEoJOrucz6rIGtAH2w+3xE5kRWduBq9zgLecprKOtuB7s1Uwv8WWcgGmfE
	 MrMFgcBHan8pg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN6-0000000AHqo-3IjN;
	Mon, 29 Sep 2025 16:05:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 06/13] KVM: arm64: Move CNT*_CTL_EL0 userspace accessors to generic infrastructure
Date: Mon, 29 Sep 2025 17:04:50 +0100
Message-ID: <20250929160458.3351788-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250929160458.3351788-1-maz@kernel.org>
References: <20250929160458.3351788-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090507_451045_E643A092 
X-CRM114-Status: GOOD (  13.94  )
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

Remove the handling of CNT*_CTL_EL0 from guest.c, and move it to
sys_regs.c, using a new TIMER_REG() definition to encapsulate it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/guest.c    |  4 ----
 arch/arm64/kvm/sys_regs.c | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 16ba5e9ac86c3..dea648706fd52 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -592,10 +592,8 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
 }
 
 static const u64 timer_reg_list[] = {
-	KVM_REG_ARM_TIMER_CTL,
 	KVM_REG_ARM_TIMER_CNT,
 	KVM_REG_ARM_TIMER_CVAL,
-	KVM_REG_ARM_PTIMER_CTL,
 	KVM_REG_ARM_PTIMER_CNT,
 	KVM_REG_ARM_PTIMER_CVAL,
 };
@@ -605,10 +603,8 @@ static const u64 timer_reg_list[] = {
 static bool is_timer_reg(u64 index)
 {
 	switch (index) {
-	case KVM_REG_ARM_TIMER_CTL:
 	case KVM_REG_ARM_TIMER_CNT:
 	case KVM_REG_ARM_TIMER_CVAL:
-	case KVM_REG_ARM_PTIMER_CTL:
 	case KVM_REG_ARM_PTIMER_CNT:
 	case KVM_REG_ARM_PTIMER_CVAL:
 		return true;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 8e6f50f54b4bf..d97aacf4c1dc9 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1594,6 +1594,23 @@ static bool access_arch_timer(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static int arch_timer_set_user(struct kvm_vcpu *vcpu,
+			       const struct sys_reg_desc *rd,
+			       u64 val)
+{
+	switch (reg_to_encoding(rd)) {
+	case SYS_CNTV_CTL_EL0:
+	case SYS_CNTP_CTL_EL0:
+	case SYS_CNTHV_CTL_EL2:
+	case SYS_CNTHP_CTL_EL2:
+		val &= ~ARCH_TIMER_CTRL_IT_STAT;
+		break;
+	}
+
+	__vcpu_assign_sys_reg(vcpu, rd->reg, val);
+	return 0;
+}
+
 static s64 kvm_arm64_ftr_safe_value(u32 id, const struct arm64_ftr_bits *ftrp,
 				    s64 new, s64 cur)
 {
@@ -2496,15 +2513,20 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 			"trap of EL2 register redirected to EL1");
 }
 
-#define EL2_REG_FILTERED(name, acc, rst, v, filter) {	\
+#define SYS_REG_USER_FILTER(name, acc, rst, v, gu, su, filter) { \
 	SYS_DESC(SYS_##name),			\
 	.access = acc,				\
 	.reset = rst,				\
 	.reg = name,				\
+	.get_user = gu,				\
+	.set_user = su,				\
 	.visibility = filter,			\
 	.val = v,				\
 }
 
+#define EL2_REG_FILTERED(name, acc, rst, v, filter)	\
+	SYS_REG_USER_FILTER(name, acc, rst, v, NULL, NULL, filter)
+
 #define EL2_REG(name, acc, rst, v)			\
 	EL2_REG_FILTERED(name, acc, rst, v, el2_visibility)
 
@@ -2515,6 +2537,10 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	EL2_REG_VNCR_FILT(name, hidden_visibility)
 #define EL2_REG_REDIR(name, rst, v)	EL2_REG(name, bad_redir_trap, rst, v)
 
+#define TIMER_REG(name, vis)					   \
+	SYS_REG_USER_FILTER(name, access_arch_timer, reset_val, 0, \
+			    NULL, arch_timer_set_user, vis)
+
 /*
  * Since reset() callback and field val are not used for idregs, they will be
  * used for specific purposes for idregs.
@@ -3485,11 +3511,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CNTPCTSS_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTVCTSS_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
-	{ SYS_DESC(SYS_CNTP_CTL_EL0), access_arch_timer },
+	TIMER_REG(CNTP_CTL_EL0, NULL),
 	{ SYS_DESC(SYS_CNTP_CVAL_EL0), access_arch_timer },
 
 	{ SYS_DESC(SYS_CNTV_TVAL_EL0), access_arch_timer },
-	{ SYS_DESC(SYS_CNTV_CTL_EL0), access_arch_timer },
+	TIMER_REG(CNTV_CTL_EL0, NULL),
 	{ SYS_DESC(SYS_CNTV_CVAL_EL0), access_arch_timer },
 
 	/* PMEVCNTRn_EL0 */
@@ -3688,11 +3714,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG_VNCR(CNTVOFF_EL2, reset_val, 0),
 	EL2_REG(CNTHCTL_EL2, access_rw, reset_val, 0),
 	{ SYS_DESC(SYS_CNTHP_TVAL_EL2), access_arch_timer },
-	EL2_REG(CNTHP_CTL_EL2, access_arch_timer, reset_val, 0),
+	TIMER_REG(CNTHP_CTL_EL2, el2_visibility),
 	EL2_REG(CNTHP_CVAL_EL2, access_arch_timer, reset_val, 0),
 
 	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_arch_timer, .visibility = cnthv_visibility },
-	EL2_REG_FILTERED(CNTHV_CTL_EL2, access_arch_timer, reset_val, 0, cnthv_visibility),
+	TIMER_REG(CNTHV_CTL_EL2, cnthv_visibility),
 	EL2_REG_FILTERED(CNTHV_CVAL_EL2, access_arch_timer, reset_val, 0, cnthv_visibility),
 
 	{ SYS_DESC(SYS_CNTKCTL_EL12), access_cntkctl_el12 },
-- 
2.47.3


