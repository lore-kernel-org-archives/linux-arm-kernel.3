Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B230C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASPiUwzN5kjU3W6WOJLbXZXMVfwQVHXCJcUJ2aI/sZE=; b=z3FSsrR/UIFIvzLHBi+vtvqSOk
	6AJ9hK6KB3PMJKH0rOXVaJ3swEosYI9OEu07EEuIhTKljUaAJr8v8rsdAUtYZw/K0CJ/9rhoWl4t1
	P/vUF7MBGydwW7hu7nXXz+HTpRH4kO25tmKh4YU8K/Gz9dMlpEFYikb4QWXFq1Py3Ew9qf5zHtI4Z
	NGgsOKXyCvW8nY2XhU5/RQkZoK0WA4HhKTqORLEk+LtzT/8BSHtpE4vQp96N1Cdo7vipf9g4UvVre
	Nt+OOQJOOZnMLqqpeOS/ooHRItoZW2+rUILtvcDt/nJ6dxpjY82WFckxIYz+f42G79j+8Sx8F/Yc2
	al4xvQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLnZ-0000000A4gp-1YQM;
	Tue, 03 Jun 2025 07:11:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLlM-0000000A4G5-1oEs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 07:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D26E344F40;
	Tue,  3 Jun 2025 07:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC85C4CEF2;
	Tue,  3 Jun 2025 07:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748934523;
	bh=XSlrAD6eyPaKQGafnPNm8VS+FmjidUjCnfXdHTIONEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AG+D50/e3WXsN6isYoc9HVo3lceMSpHFdH7bqwhbPokZqDOQXiXblLeUz0eIgixv1
	 zvUVvXo5ppBaZ/iTswyz4Kbse10q3HtnDLGYBjP0lHGuUSL5mEEqP+KuIbAUe65O69
	 rBk9mE5Vy/yxbvfsWXSIdbUqOHzHm5SmykCxMmhN05gRaIYgcHj1qCKwDvirAgVBRI
	 XZrZfu+KkLN0jJPgMRBkxhRjWwlmNcKEfsA0BSRwKoWl+baDlY2iSUWMafv+HTj/b9
	 j+kXdRAexgvYWtRk97Y8HWDHczKT4EjIOg7B+N2qlDcv2tqdhKfmeSsMniFmL7VXOr
	 g7FVvjrdvOOWQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uMLlJ-002isr-OB;
	Tue, 03 Jun 2025 08:08:41 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 3/4] KVM: arm64: Don't use __vcpu_sys_reg() to get the address of a sysreg
Date: Tue,  3 Jun 2025 08:08:23 +0100
Message-Id: <20250603070824.1192795-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250603070824.1192795-1-maz@kernel.org>
References: <20250603070824.1192795-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_000844_498363_5A4775E3 
X-CRM114-Status: GOOD (  13.95  )
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
 arch/arm64/kvm/arch_timer.c | 2 +-
 arch/arm64/kvm/fpsimd.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 5a67a6d4d95b7..c6b4fb4c8e08f 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1036,7 +1036,7 @@ void kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu)
 	if (vcpu_has_nv(vcpu)) {
 		struct arch_timer_offset *offs = &vcpu_vtimer(vcpu)->offset;
 
-		offs->vcpu_offset = &__vcpu_sys_reg(vcpu, CNTVOFF_EL2);
+		offs->vcpu_offset = __ctxt_sys_reg(&vcpu->arch.ctxt, CNTVOFF_EL2);
 		offs->vm_offset = &vcpu->kvm->arch.timer_data.poffset;
 	}
 
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 7f6e43d256915..8f6c8f57c6b9c 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -103,8 +103,8 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
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


