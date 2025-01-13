Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DBEC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 18:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGYajx9YbzBJh1rfcaFIrYhAItBdQB2zL8GP3JAshTE=; b=zs3UQ5URqWeMx6oMpmqMJFwOOL
	ExloGp9JkgTYPetroBzaggepIqCQPBzWVdQWQIPArBl5OAel6mfrPLQJjnVNHJ+uPPyzmIlw/5kr1
	s2nKIv7amHaCgqeTtHDa1LHQAPgdgrc6zgaO6kswTgbuoHSjpoNQ11j1VX69iqVm3uRQKu/XZZnqR
	4a8x9Aj1rFwNtYDFBIzHtFQtEqOvCkRRWFHPUghh5zyAE9LMLmIh/FJE2OeAVAzrOYm4T9m1ldWp6
	y0NaX9HPJVx0DBf93UEofuJhPQHenejOqwPJOyfGWhBFA9/q+rigOoZT+JeqeLE/XbiMGt2ATZSf8
	BRB86t4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPOA-00000006FbG-1fdr;
	Mon, 13 Jan 2025 18:42:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXPHh-00000006Du9-3Cer
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 18:35:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A736EA41315;
	Mon, 13 Jan 2025 18:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9694BC4CEE7;
	Mon, 13 Jan 2025 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736793332;
	bh=FxSEF13doFBA5tcFBO38sDSI4idMSRIXn0Z6Kg1HPZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTgnG9QD5vnDKxODxCoH7fbFNQeLf0nb3kMJ8hz+5cNtS8XIB9gQizK+GgU9E1nSU
	 jYSc7vKxma5FnzO4uSqb7scNlsDiiog2iHA2jkmy1LyHAvAd9sJ/HdFWKqZI/1qHBN
	 3tOEsGv9MUh1bZmN8jn14lh6Ioj/ZjN2gy2lO+C/HhB+87Rnjb3L44qzqIOmqGfnh0
	 1vn8hTMuaRtZ2dbBQWuRJoXbtit0DHZ2y7XX4516IZky+hncBirh2iAUhVfwF5QGAj
	 2I7aLRLVYq5ZONszt6SqPeYwORq+eR+Qjc7vM3+eJg/BcqmOjenE+qxDl1qsypu2bC
	 +A00iNnAxbvFw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tXPHe-00BjrF-M5;
	Mon, 13 Jan 2025 18:35:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC PATCH 3/4] KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
Date: Mon, 13 Jan 2025 18:35:23 +0000
Message-Id: <20250113183524.1378778-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250113183524.1378778-1-maz@kernel.org>
References: <20250113183524.1378778-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_103533_931338_F6E0663D 
X-CRM114-Status: GOOD (  13.01  )
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

We are about to prevent the use of __vcpu_sys_reg() as a lvalue,
and getting the address of a rvalue is not a thing.

Update the couple of places where we do this to use the __ctxt_sys_reg()
accessor, which return the address of a register.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 4 ++--
 arch/arm64/kvm/fpsimd.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index f404690a3ab4f..0e29958e20187 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -774,7 +774,7 @@ static void kvm_timer_vcpu_load_nested_switch(struct kvm_vcpu *vcpu,
 			if (vcpu_el2_e2h_is_set(vcpu))
 				offs->vcpu_offset = NULL;
 			else
-				offs->vcpu_offset = &__vcpu_sys_reg(vcpu, CNTVOFF_EL2);
+				offs->vcpu_offset = __ctxt_sys_reg(&vcpu->arch.ctxt, CNTVOFF_EL2);
 		}
 	}
 }
@@ -1065,7 +1065,7 @@ void kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu)
 	if (vcpu_has_nv(vcpu)) {
 		struct arch_timer_offset *offs = &vcpu_vtimer(vcpu)->offset;
 
-		offs->vcpu_offset = &__vcpu_sys_reg(vcpu, CNTVOFF_EL2);
+		offs->vcpu_offset = __ctxt_sys_reg(&vcpu->arch.ctxt, CNTVOFF_EL2);
 		offs->vm_offset = &vcpu->kvm->arch.timer_data.poffset;
 	}
 
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 76bde6f489fbc..686ea04cc3497 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -135,8 +135,8 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		fp_state.sve_state = vcpu->arch.sve_state;
 		fp_state.sve_vl = vcpu->arch.sve_max_vl;
 		fp_state.sme_state = NULL;
-		fp_state.svcr = &__vcpu_sys_reg(vcpu, SVCR);
-		fp_state.fpmr = &__vcpu_sys_reg(vcpu, FPMR);
+		fp_state.svcr = __ctxt_sys_reg(&vcpu->arch.ctxt, SVCR);
+		fp_state.fpmr = __ctxt_sys_reg(&vcpu->arch.ctxt, FPMR);
 		fp_state.fp_type = &vcpu->arch.fp_type;
 
 		if (vcpu_has_sve(vcpu))
-- 
2.39.2


