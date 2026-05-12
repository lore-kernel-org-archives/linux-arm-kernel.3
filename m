Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F57CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDBmjuJ+rWa0IDhvw3r57tfbWDtrJcWqibH33Xm9FGo=; b=fO5wP784i3SvWfp5LJVzsfVh5x
	BUAXQVpt2rYQ74X4Sk75LEKkTzPkl78hg4FpiY8X7ObrK9R5C+B9fP70hciLvXiNE/fi45AU+BGkB
	TNLEA6D4zZX5BgTyBQGFIdnbjvCc42rnpTXTbkBZvGRPaT0yBkMtLByW02PnpTHzm4jM3vveQK0Nk
	Y4keml49oVtwBVJrMcvQ4S9CPD0m8QJsYLbdN2nc3/av2+U1WPAoqGmvlkR3EvP8RjRlFjLHJXb+a
	9l0BFaGW1ZixmeQRb7OUZy+vKVFEdLOIGx6u15TAJHFLpYctm4TnfxAly/MkQqUnzqqhCc5Vihtzv
	lHFcH0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnmI-0000000Gxkz-2yuA;
	Tue, 12 May 2026 14:08:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnmH-0000000Gxk0-1vTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0C6C62C28;
	Tue, 12 May 2026 14:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810BAC2BCB0;
	Tue, 12 May 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594884;
	bh=dd7f49n2CrdKm/TzWKQya8Il4PnSU0oNmHb+Bd1Oj/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rp0iIc0vbaZYGiuK/U8xzISaEaxxI8Tg1FrSEygBhe0adHjrNsWj2JyYFQWGLS4cG
	 +AiibQcXotwOSY0sYokVyqWjHqZGMmdu85Zz0TtS0nokHMYDrWDGcQ+k0+QPK+ZU5m
	 YxQ3NXlx9FqkIMGBGZd6eZNJqrHFh+/ZaU9wy2UtBfVMbbnKumG4ILKj/TtQecA4vt
	 xjJ/1TUgs5+AoC0IjmqzEq3/2IvROzr0qXxyrUhKBTyPYQdJtnlO/EO2RSEsWdpZah
	 Lil4or1GrJxJe+uyHsP2A3AO64Zm3LThBFUJxKxOUXOoY4TGRP28tM+m0AyBSkI336
	 0kxWvPnRP1xiQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wMnmE-00000001Zsc-1sqQ;
	Tue, 12 May 2026 14:08:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 1/2] KVM: arm64: nv: Track L2 to L1 exception emulation
Date: Tue, 12 May 2026 15:07:54 +0100
Message-ID: <20260512140755.3676306-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512140755.3676306-1-maz@kernel.org>
References: <20260512140755.3676306-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, mark.rutland@arm.com, will@kernel.org, tabba@google.com
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

While we currently track that we are emulating a nested ERET from
L1 to L2, we currently don't track the reverse direction (an exception
going from L2 to L1).

Add a new vcpu state flag for this purpose, which will see some
use shortly.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 3 ++-
 arch/arm64/kvm/emulate-nested.c   | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 65eead8362e0b..c79747d5f4dd1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1112,7 +1112,8 @@ struct kvm_vcpu_arch {
 #define IN_NESTED_ERET		__vcpu_single_flag(sflags, BIT(7))
 /* SError pending for nested guest */
 #define NESTED_SERROR_PENDING	__vcpu_single_flag(sflags, BIT(8))
-
+/* KVM is currently emulating an L2 to L1 exception */
+#define IN_NESTED_EXCEPTION	__vcpu_single_flag(sflags, BIT(9))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index dba7ced74ca5e..15c691a6266d5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2862,6 +2862,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 
 	preempt_disable();
 
+	vcpu_set_flag(vcpu, IN_NESTED_EXCEPTION);
+
 	/*
 	 * We may have an exception or PC update in the EL0/EL1 context.
 	 * Commit it before entering EL2.
@@ -2884,6 +2886,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	__kvm_adjust_pc(vcpu);
 
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
+	vcpu_clear_flag(vcpu, IN_NESTED_EXCEPTION);
+
 	preempt_enable();
 
 	if (kvm_vcpu_has_pmu(vcpu))
-- 
2.47.3


