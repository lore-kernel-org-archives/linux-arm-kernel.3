Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95761CF65EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3R80F2x108r5oDW3ErAbFC9ZSy61IlodbX+E9srE6Ns=; b=CDOaioFDOmhIt4ZpQacuMWC7Zv
	rO3Pi1xqPxiBrmGhEMV5bL3nLEf4xSwFolyPxi8tErJhNy7xV0w+ubHeEP7q8bronCIwAi5Y0e/qK
	o7xVGqvqyhtMTlwUUcqMIsq2/DB/SVTJ/a6wpdrn66BOKKUX+ZYEDoJMXvSikbY7XeiCSEg+sB6Os
	B+UEL5n5O/f+2zq8MGC5VOenQlUtp2aUhwP8yrrS384EuG23P/vlFsGI0q/mTPan5OE+9fUI61SfX
	bJ/OqgGQNXCy25dxsSiTeLGlZ+bQbMEij9WGw/MCl/p7GK/gLr3pjvwuhlPTBUO3mpKZGm6HykOpu
	4+PLcV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXS-0000000CV1b-0Fii;
	Mon, 26 Jan 2026 12:17:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXE-0000000CUsI-1OrK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 143104435C;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E798DC19425;
	Mon, 26 Jan 2026 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429855;
	bh=EHbYIfAX/AaecDmPp7DQIoSfrWZDbSrWEFdMI2Cgg6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fa5J6m9pZxBan6agmM1EwLNX0adQteWrHkWqyvg9XelbNOjizRQ9fztC9eClXZ4ry
	 Gvf5V3nvNLTTMTt3ZCj1exc55HuBu29a/2rZof+DeIfAiAtCgl+zU7Yfv86ChWu5cM
	 UByja+Us/QfJXQKhSoKm7Nvm1eIjASh73tnbeI1vq+BcHzOGc6yrIpj2x5sc1lBAo2
	 Ojt0xOj9CAoF7x5ADTaw+nNJ5/qN2MN8wY9rzCTBfoK6a71sHmz5stKjC8BO145VQu
	 kG+GFcbNFlq9zwkw8KkP7NzPT6c6G2W3LMXn14J4h9kSARKwXmlEK3hjwxb1XseWgW
	 Qqw7ocgtkBUNw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXA-00000005hx6-3ILP;
	Mon, 26 Jan 2026 12:17:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 05/20] KVM: arm64: Extend unified RESx handling to runtime sanitisation
Date: Mon, 26 Jan 2026 12:16:39 +0000
Message-ID: <20260126121655.1641736-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041736_429735_4B4D4D4C 
X-CRM114-Status: GOOD (  15.79  )
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

Add a new helper to retrieve the RESx values for a given system
register, and use it for the runtime sanitisation.

This results in slightly better code generation for a fairly hot
path in the hypervisor.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 13 +++++++++++++
 arch/arm64/kvm/emulate-nested.c   | 10 +---------
 arch/arm64/kvm/nested.c           | 13 ++++---------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a7e4cd8ebf56f..9dca94e4361f0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -635,6 +635,19 @@ struct kvm_sysreg_masks {
 	struct resx mask[NR_SYS_REGS - __SANITISED_REG_START__];
 };
 
+#define kvm_get_sysreg_resx(k, sr)					\
+	({                                                              \
+		struct kvm_sysreg_masks *__masks;			\
+		struct resx __resx = {};				\
+									\
+		__masks = (k)->arch.sysreg_masks;			\
+		if (likely(__masks &&					\
+			   sr >= __SANITISED_REG_START__ &&		\
+			   sr < NR_SYS_REGS))				\
+			__resx = __masks->mask[sr - __SANITISED_REG_START__]; \
+		__resx;							\
+	})
+
 #define kvm_set_sysreg_resx(k, sr, resx)		\
 	do {						\
 		(k)->arch.sysreg_masks->mask[sr - __SANITISED_REG_START__] = resx; \
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 774cfbf5b43ba..43334cd2db9e5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2427,15 +2427,7 @@ static enum trap_behaviour compute_trap_behaviour(struct kvm_vcpu *vcpu,
 
 static u64 kvm_get_sysreg_res0(struct kvm *kvm, enum vcpu_sysreg sr)
 {
-	struct kvm_sysreg_masks *masks;
-
-	/* Only handle the VNCR-backed regs for now */
-	if (sr < __VNCR_START__)
-		return 0;
-
-	masks = kvm->arch.sysreg_masks;
-
-	return masks->mask[sr - __SANITISED_REG_START__].res0;
+	return kvm_get_sysreg_resx(kvm, sr).res0;
 }
 
 static bool check_fgt_bit(struct kvm_vcpu *vcpu, enum vcpu_sysreg sr,
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c5a45bc62153e..75a23f1c56d13 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1669,16 +1669,11 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
 			     enum vcpu_sysreg sr, u64 v)
 {
-	struct kvm_sysreg_masks *masks;
-
-	masks = vcpu->kvm->arch.sysreg_masks;
-
-	if (masks) {
-		sr -= __SANITISED_REG_START__;
+	struct resx resx;
 
-		v &= ~masks->mask[sr].res0;
-		v |= masks->mask[sr].res1;
-	}
+	resx = kvm_get_sysreg_resx(vcpu->kvm, sr);
+	v &= ~resx.res0;
+	v |= resx.res1;
 
 	return v;
 }
-- 
2.47.3


