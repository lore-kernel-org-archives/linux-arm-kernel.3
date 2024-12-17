Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLEejoKg7ZzB0CDe+b/h/vQQ+cGKoAXZ0Zqql/x4s88=; b=cLhg0UZ7kmkmHuaPopAv3Sc1WI
	/TGwBFmhqWDsQP/irYaKE6yxkVzeCttGIwu/26G1QbpyIQAdy8paeH42Xr2/phO23x3TRb1qkalql
	35+P+Q2J0U+aWX/lskEGouS6C5NXLwgRZUHIaxKo7j1CxXzzeBoLTi1lqkSW1PWQ/PMQYZhg0SDpr
	2dL0byt87lSUUUesQF6TQDJdNRvbzu7T12+k5KuwKsGfvYNMWD0gqSeAfkKEFE3n/wp/MdSpYYH8f
	xELCgXF40PIr1TYnGT8KHWQV8HRS1+Q4UNCEsmBqZ58iD3G5Tn0SgJ2WNXq8snrnOj1TZV58P4j+L
	1/c1k1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYaH-0000000Dl3k-3QqA;
	Tue, 17 Dec 2024 14:30:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYU0-0000000DjZ2-2QiS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Dec 2024 14:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nLEejoKg7ZzB0CDe+b/h/vQQ+cGKoAXZ0Zqql/x4s88=; b=JbUv7v/46Y/g3iqsJXywf8v+XS
	Kj8hZlUyh4c9LB1I4ZYBvnBJ6WRB6LNQlwxJAi6eIWIvKpeYw9su5hjHsUwrBv5mAhO4KH4Ih4F47
	ifY6ZQ+8RMOaqwNJy0sMEEJB5S5iEMoMvqXG3Jb8U8lN8Nn2YKdnJlGLxk9npSR0vKuzRu5oPFm15
	SDcmW4EIj1jiwwNbmbCrylD3e1h4ziP0rO0y+kxr4mJGlRdOt6vc9lAkUOSMTQE1TBlv56yyEgUUK
	sJ0HmmUcplvRJ4wPM7cK/ZNlyYmRA4S67+FEeq9tmjCpqvyreKQmURAJ8s4o0K0/I7I4NG+plZybT
	hfUV9yHg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYTx-000000055Wr-0oWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 015BD5C5882;
	Tue, 17 Dec 2024 14:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AD0C4CED4;
	Tue, 17 Dec 2024 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734445406;
	bh=nt83Bx4IHnA3dzdKS/0K9IvUZKFruxfW2Pr7Afn3zv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQIynE8QpmGUpRjsK5ottqArt6PSiSqa0XjRb0tbaXVre7Yd+6dYg8jkxM2Hp3Cgg
	 OFT9dcfOltxZ9eADuStA2C1CPfqxsGvCixmyIFbC9Q6AbBqMp+TzT+PH4W12QDAsIp
	 gK9vpCq+zmD9J0eaNRh1FmOV/lU5atCpY+A0Cfkf1HTUbIU/5WvXLf3blwmRr4we+8
	 OiRULy6rmgKBw1tM/Sp0LCQiepPxp7mAeBD+rBTVCUbfjtOD+9a7VU4cVLaDZODtqQ
	 /aUmno6TAFShy0lkpk3y3MZ19pRilri3uqKr9gpdz5ZxzY3mVAL80TOSjV7pfLmtsW
	 LNZKQYTo7HshA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tNYTs-004aJx-U5;
	Tue, 17 Dec 2024 14:23:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Chase Conklin <chase.conklin@arm.com>,
	Eric Auger <eauger@redhat.com>
Subject: [PATCH v2 03/12] KVM: arm64: nv: Publish emulated timer interrupt state in the in-memory state
Date: Tue, 17 Dec 2024 14:23:11 +0000
Message-Id: <20241217142321.763801-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241217142321.763801-1-maz@kernel.org>
References: <20241217142321.763801-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andersson@kernel.org, christoffer.dall@arm.com, gankulkarni@os.amperecomputing.com, chase.conklin@arm.com, eauger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_142329_743492_49F56E0D 
X-CRM114-Status: GOOD (  15.89  )
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

With FEAT_NV2, the EL0 timer state is entirely stored in memory,
meaning that the hypervisor can only provide a very poor emulation.

The only thing we can really do is to publish the interrupt state
in the guest view of CNT{P,V}_CTL_EL0, and defer everything else
to the next exit.

Only FEAT_ECV will allow us to fix it, at the cost of extra trapping.

Suggested-by: Chase Conklin <chase.conklin@arm.com>
Suggested-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 21 +++++++++++++++++++++
 arch/arm64/kvm/arm.c        |  2 +-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index ee5f732fbbece..8bff913ed1264 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -441,11 +441,30 @@ void kvm_timer_update_run(struct kvm_vcpu *vcpu)
 		regs->device_irq_level |= KVM_ARM_DEV_EL1_PTIMER;
 }
 
+static void kvm_timer_update_status(struct arch_timer_context *ctx, bool level)
+{
+	/*
+	 * Paper over NV2 brokenness by publishing the interrupt status
+	 * bit. This still results in a poor quality of emulation (guest
+	 * writes will have no effect until the next exit).
+	 *
+	 * But hey, it's fast, right?
+	 */
+	if (is_hyp_ctxt(ctx->vcpu) &&
+	    (ctx == vcpu_vtimer(ctx->vcpu) || ctx == vcpu_ptimer(ctx->vcpu))) {
+		unsigned long val = timer_get_ctl(ctx);
+		__assign_bit(__ffs(ARCH_TIMER_CTRL_IT_STAT), &val, level);
+		timer_set_ctl(ctx, val);
+	}
+}
+
 static void kvm_timer_update_irq(struct kvm_vcpu *vcpu, bool new_level,
 				 struct arch_timer_context *timer_ctx)
 {
 	int ret;
 
+	kvm_timer_update_status(timer_ctx, new_level);
+
 	timer_ctx->irq.level = new_level;
 	trace_kvm_timer_update_irq(vcpu->vcpu_id, timer_irq(timer_ctx),
 				   timer_ctx->irq.level);
@@ -471,6 +490,8 @@ static void timer_emulate(struct arch_timer_context *ctx)
 		return;
 	}
 
+	kvm_timer_update_status(ctx, should_fire);
+
 	/*
 	 * If the timer can fire now, we don't need to have a soft timer
 	 * scheduled for the future.  If the timer cannot fire at all,
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index fa3089822f9f3..bda905022df40 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1228,7 +1228,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
 			kvm_timer_sync_user(vcpu);
 
-		if (vcpu_has_nv(vcpu))
+		if (is_hyp_ctxt(vcpu))
 			kvm_timer_sync_nested(vcpu);
 
 		kvm_arch_vcpu_ctxsync_fp(vcpu);
-- 
2.39.2


