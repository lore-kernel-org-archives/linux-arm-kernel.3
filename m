Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C70CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZDjrpFpYVySP1qG18TQmFwiQFRFXP/emGTeJrv3NCA=; b=HPZvj2XIXoM8FedW28DO96bkf9
	OiP6eIm2klzJ8gCsoawHcbpLP6SXIncqlx8Os412tCugSiJzrNr9sEd+EWHSezW4yeS2WL7af635y
	OGK+RNmtPiCVjSS74ATusyeZVHYOCxPqLFfhv9EfZpMQj+h7ay7YxpffMN0QTTxe2ed5S+XTitRS1
	Vc7h1TE6xeWYcJA4LPCW9KvfgzqYYbtP+6Df6DukkIPzaPDX/0pdhZUgADhly6ETKsixRLUBpzgVw
	I40C01TAWXRT/O9FCNGR9gVibMA9X0qJM9EM5p/0zG3RdOXBq2eFK34uuMKYfKvlsd6vcLtfn6+u1
	nywDU7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNc-00000002uHk-1M8F;
	Mon, 29 Sep 2025 16:05:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN9-00000002tuT-1YmM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B30B48BC2;
	Mon, 29 Sep 2025 16:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD56C4CEF7;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161906;
	bh=u6G8PNKp2xjKEJAmhCH+1Uo0BopwqaufjMccdpUo0cg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iAO8IrxgkAahyJbHN8LOOj963a09cpU8UCioFH5LVgL0zSNVJ0OUcPqT9jw9WTkOL
	 mc9jC+MucvIQE8jhnVinyGzz39Q4MZRW3sfM8UiACn5Kw13DK5bGjaz1jMKmRZWtOO
	 +KJ9vpBtkSF9vQ17gUEl9T26++18/t+Pf2eybQV51Ow1mFnQHfEurYABgzIf9l5pxe
	 gP5R3zU1JBkaoiP03vCNQZe0q2s66az866Voy4zSZ1u2VR0r82CunrBdgbLoC/bB7q
	 u3BCqiSvovee0hPsKKuKHV+SUzps/zbm2/HpryCP4+8PRF6ndLS0jvHxLbAEFYdYPY
	 s7SYg+uNciFMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN7-0000000AHqo-06KI;
	Mon, 29 Sep 2025 16:05:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 07/13] KVM: arm64: Move CNT*_CVAL_EL0 userspace accessors to generic infrastructure
Date: Mon, 29 Sep 2025 17:04:51 +0100
Message-ID: <20250929160458.3351788-8-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250929_090507_472097_B89AF357 
X-CRM114-Status: GOOD (  12.03  )
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

As for the control registers, move the comparator registers to
the common infrastructure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/guest.c    | 4 ----
 arch/arm64/kvm/sys_regs.c | 8 ++++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index dea648706fd52..c23ec9be4ce27 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -593,9 +593,7 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
 
 static const u64 timer_reg_list[] = {
 	KVM_REG_ARM_TIMER_CNT,
-	KVM_REG_ARM_TIMER_CVAL,
 	KVM_REG_ARM_PTIMER_CNT,
-	KVM_REG_ARM_PTIMER_CVAL,
 };
 
 #define NUM_TIMER_REGS ARRAY_SIZE(timer_reg_list)
@@ -604,9 +602,7 @@ static bool is_timer_reg(u64 index)
 {
 	switch (index) {
 	case KVM_REG_ARM_TIMER_CNT:
-	case KVM_REG_ARM_TIMER_CVAL:
 	case KVM_REG_ARM_PTIMER_CNT:
-	case KVM_REG_ARM_PTIMER_CVAL:
 		return true;
 	}
 	return false;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index d97aacf4c1dc9..68e88d5c0dfb5 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3512,11 +3512,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_CNTVCTSS_EL0), access_arch_timer },
 	{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
 	TIMER_REG(CNTP_CTL_EL0, NULL),
-	{ SYS_DESC(SYS_CNTP_CVAL_EL0), access_arch_timer },
+	TIMER_REG(CNTP_CVAL_EL0, NULL),
 
 	{ SYS_DESC(SYS_CNTV_TVAL_EL0), access_arch_timer },
 	TIMER_REG(CNTV_CTL_EL0, NULL),
-	{ SYS_DESC(SYS_CNTV_CVAL_EL0), access_arch_timer },
+	TIMER_REG(CNTV_CVAL_EL0, NULL),
 
 	/* PMEVCNTRn_EL0 */
 	PMU_PMEVCNTR_EL0(0),
@@ -3715,11 +3715,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(CNTHCTL_EL2, access_rw, reset_val, 0),
 	{ SYS_DESC(SYS_CNTHP_TVAL_EL2), access_arch_timer },
 	TIMER_REG(CNTHP_CTL_EL2, el2_visibility),
-	EL2_REG(CNTHP_CVAL_EL2, access_arch_timer, reset_val, 0),
+	TIMER_REG(CNTHP_CVAL_EL2, el2_visibility),
 
 	{ SYS_DESC(SYS_CNTHV_TVAL_EL2), access_arch_timer, .visibility = cnthv_visibility },
 	TIMER_REG(CNTHV_CTL_EL2, cnthv_visibility),
-	EL2_REG_FILTERED(CNTHV_CVAL_EL2, access_arch_timer, reset_val, 0, cnthv_visibility),
+	TIMER_REG(CNTHV_CVAL_EL2, cnthv_visibility),
 
 	{ SYS_DESC(SYS_CNTKCTL_EL12), access_cntkctl_el12 },
 
-- 
2.47.3


