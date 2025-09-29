Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F03CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvoNIPundCsSjp59u4kDUMeVcNfH/TkPT3frtABbkg4=; b=v8+UTBcb+fhj3liUAD6/6/SxKY
	HyIXmvwl53fClcbHpGfa3LXya/6V8Q6YUrjYcOxf0P2wZZ8Cp6GFufwXQja3nMZiOMOA8WjowC2KN
	2+gXw9mI6VYmzxyYVMVVKHzFisVlIgwLdunLNl6ZTN/5T3Jbh9WrRIZzz5rP+szsdamy+esv3bKPb
	KHsaV4C9gO5Lgj3XJl7mI4ioDWHsPUsJLXdd/8kKjAW4ix4vSZWv0UGeE9sP8xl352xkc+D5YyPCd
	ImMyhJjN6Z1zxIQKb0AArYXTtqR1crLXiWvjA+N9v6STPQTPeKu25YUgO1gWM8wrRAyYq402x/nWQ
	8AzqLtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GNb-00000002uFp-0JM0;
	Mon, 29 Sep 2025 16:05:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GN9-00000002tti-0Ll6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 16:05:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41E8B48B3A;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F654C116C6;
	Mon, 29 Sep 2025 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759161906;
	bh=FKuPiW6IwnxqxPKqIfxCB1Qt99lPKm+h9WG+rzcIo24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJWMTT15dVS+Z3DZKn5HMUzuY8o73xiarWH6QUyCjklPais1zMtBq3Xn/+SqDTCpz
	 J8rv/qscZH//bLNHviA+6Dd4Od0siwg19qmZjF92fhljFyrPCoQcLI5dGCsVT4dRZP
	 pPwsxPkEFghc3YQ7sCpA6FO6KITDHjg+0SANlDzk6qZKFIvX2ic2pKkEEXCBJMjbLp
	 eUzEs+7BQXt/+Z8/TPuS0R06N6fvJq392ZsZA9XYByX+vdL+CEZ8hV5YyHinTFS6hS
	 LS06luUN6Q6kj5QbpR3kmn23uM0sZZvqSJQPm6grWVzyCPSB+SNYRSGYhIpErlqwNm
	 PHmANDXr7LIvA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v3GN5-0000000AHqo-3caT;
	Mon, 29 Sep 2025 16:05:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 03/13] KVM: arm64: Replace timer context vcpu pointer with timer_id
Date: Mon, 29 Sep 2025 17:04:47 +0100
Message-ID: <20250929160458.3351788-4-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250929_090507_190393_C98181CB 
X-CRM114-Status: GOOD (  15.23  )
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

Having to follow a pointer to a vcpu is pretty dumb, when the timers
are are a fixed offset in the vcpu structure itself.

Trade the vcpu pointer for a timer_id, which can then be used to
compute the vcpu address as needed.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c  |  4 ++--
 include/kvm/arm_arch_timer.h | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index e5a25e743f5be..c832c293676a3 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -149,7 +149,7 @@ static void timer_set_cval(struct arch_timer_context *ctxt, u64 cval)
 static void timer_set_offset(struct arch_timer_context *ctxt, u64 offset)
 {
 	if (!ctxt->offset.vm_offset) {
-		WARN(offset, "timer %ld\n", arch_timer_ctx_index(ctxt));
+		WARN(offset, "timer %d\n", arch_timer_ctx_index(ctxt));
 		return;
 	}
 
@@ -1064,7 +1064,7 @@ static void timer_context_init(struct kvm_vcpu *vcpu, int timerid)
 	struct arch_timer_context *ctxt = vcpu_get_timer(vcpu, timerid);
 	struct kvm *kvm = vcpu->kvm;
 
-	ctxt->vcpu = vcpu;
+	ctxt->timer_id = timerid;
 
 	if (timerid == TIMER_VTIMER)
 		ctxt->offset.vm_offset = &kvm->arch.timer_data.voffset;
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index d188c716d03cb..d8e400cb2bfff 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -51,8 +51,6 @@ struct arch_timer_vm_data {
 };
 
 struct arch_timer_context {
-	struct kvm_vcpu			*vcpu;
-
 	/* Emulated Timer (may be unused) */
 	struct hrtimer			hrtimer;
 	u64				ns_frac;
@@ -71,6 +69,9 @@ struct arch_timer_context {
 		bool			level;
 	} irq;
 
+	/* Who am I? */
+	enum kvm_arch_timers		timer_id;
+
 	/* Duplicated state from arch_timer.c for convenience */
 	u32				host_timer_irq;
 };
@@ -127,9 +128,9 @@ void kvm_timer_init_vhe(void);
 #define vcpu_hvtimer(v)	(&(v)->arch.timer_cpu.timers[TIMER_HVTIMER])
 #define vcpu_hptimer(v)	(&(v)->arch.timer_cpu.timers[TIMER_HPTIMER])
 
-#define arch_timer_ctx_index(ctx)	((ctx) - vcpu_timer((ctx)->vcpu)->timers)
-#define timer_context_to_vcpu(ctx)	((ctx)->vcpu)
-#define timer_vm_data(ctx)		(&(ctx)->vcpu->kvm->arch.timer_data)
+#define arch_timer_ctx_index(ctx)	((ctx)->timer_id)
+#define timer_context_to_vcpu(ctx)	container_of((ctx), struct kvm_vcpu, arch.timer_cpu.timers[(ctx)->timer_id])
+#define timer_vm_data(ctx)		(&(timer_context_to_vcpu(ctx)->kvm->arch.timer_data))
 #define timer_irq(ctx)			(timer_vm_data(ctx)->ppi[arch_timer_ctx_index(ctx)])
 
 u64 kvm_arm_timer_read_sysreg(struct kvm_vcpu *vcpu,
-- 
2.47.3


