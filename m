Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B39C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLHxgWDH6NZEUyidyM1IgI1xUcXj8vFEb1hVxsczrbo=; b=Vb1YQWOzKaXz6zUb9jwzbxJW//
	IO8YB8gIbB2AqZDnTxwnHCjXUw1MI44TGIYj8GfSZsqi5ZA0sJClHuNNtRksbvjdzkXiIzB0kbkEL
	MJDm9qpM2lg+zv2UgWn9cgZHKVfR4b0VRXZGQ2TVcqVJ2oqwzUsMJCTLUi4HwyRaNaVupvlLM03C0
	SmusG1uEhqaRV8ZbwXhi25z5oZC6UbMbjS3Ax+1tlIDYyYCDv2j9GfWgqgDHDD/WIoAcA0+4FuWrY
	C/+iDXY3Fqsd21GZZ45OGUCc9iihhDAWUT3i6OlPgzb4SkMHc9FzPjV+vvgN9xHPZ6P2xKWRSCG2A
	zpjsHQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Po0-0000000DQZV-1ARu;
	Fri, 18 Sep 2026 04:02:32 +0000
Received: from mail-oa2-x2a.google.com ([2607:f8b0:4864:30::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Pnw-0000000DQY5-0CwF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:02:29 +0000
Received: by mail-oa2-x2a.google.com with SMTP id 586e51a60fabf-483c65c2fa7so240525fac.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789704147; x=1790308947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLHxgWDH6NZEUyidyM1IgI1xUcXj8vFEb1hVxsczrbo=;
        b=HXEIPvz12yJTka3ZYj39dnFNQ1sMo/xq+VQ2CCeqLlvq9+uf1YhPyQ+/LAv9ySa1QW
         VEMOrJ/Vg8SLGOTqtLZUohh9oKI419i3zffOHPRX6VVY8kBeTaC9aL6CdsnrORygTOkP
         hyH2gmE5UHxs8xvWRkvtyKuFtSFPzd9NSi0j/1PJ44lWZ4BS0hmuaXYr2ZQ3ZJwvBJZg
         693EthK3azV01qyS80IjXTJLsrJACsoafiEYDYayQUJlDh57VFal8xu2Y80pCxrhVSfX
         HYoZ40E9dxVEF3gLfZPsmFqaW9Q4aR1ZLRE5kKReeMhEMLD5WoxtMr6s5XoNVkKYmmKB
         2zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704147; x=1790308947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLHxgWDH6NZEUyidyM1IgI1xUcXj8vFEb1hVxsczrbo=;
        b=2N4o+fy6KCqq+T9S1NzfaXNlaIlFQHKgPyRhkn+Ugv2V/m51T5xAqgIvm5MbAqF9KL
         zfFXYdOxErX4sbnMpR7C5yCVMI5kjJF1VJgbK5Xb3N91CLaQJgEfIHN0q2K15z35/gzQ
         fcQzBSJgpV6d3dXghoh3uE3CRIhaXbBRmA405njNNIraJhGwBcOeY1k5ksc1+rzn/JJL
         RGkzdy2t4Rwq1xEmXm2ZHkZ/01IEnNVCsmt8EEjmm67RYDHbxbOPn8XwEEvIMMAUR7N0
         rgEVTPgHpjZq5Eb30f40jAGnnakXcLAlrWO+u4QAHoB2YZuix2gWsebBL+I5MPKsUFA4
         UoGg==
X-Forwarded-Encrypted: i=1; AKwUvBwIRvNI7Vf7r70QRhN90cbm1t5rreG22gL70s7U1CoobdbxU5oV5T04wHTWBJeNvYMREYnnMYdKjMy18Td2IAux@lists.infradead.org
X-Gm-Message-State: AFuF++lnZwPs+9UkPJo6Fu0O67swqTHBba21oHjsuMT/gnlitUgdxrbm
	v5zFp+99LyYEDWo0xs/EROnIC19RXU+qhqFcb5j6poyh3laX6KBg+Sr0
X-Gm-Gg: AYBFou2SIbnbVrAgZcSYDsTGUTPMC/1LkipHmP1DkMJ+PEE0QUuYr7pfOm4Q+7hvcnV
	0oDPnIoa5+rsMGPs27AAwED07DutCHS6PJn1+az1A4Tkc7WaiLT5tivDGwIuwiOua5nmd90tRaU
	XbXo2PAc8gTe0IHx6wfSScrr8xfnS2+wmcrr8XA9Q55CLK4IKPTjIB+fdmjXKe8kc1a5nbBMzXq
	DOeWd0VYGKxNQ6TjJcN3kEyM/71xLlJZDpcqUd7LgKGH5UP1hxlju+SStYJdlZutoUxpIdQtsky
	Vl19BmPBV1uCIkAjuWRYKNXwTnrZgvDK8Nlu4co3PWniymHJy1WIBkyQWlTGaFkEoNVno8HYUgL
	Xs2OsJdabVO7pCmkLf8gGc30aoG+oLd/6aY+/f4aHic5Szf7p+Ch5xOFcb4JdBmlKBBIYDDi+oH
	WfaIQgBHgMfjUMpyZceLQX251+6cnBxLIYYvG0PgUGK0eg+W2FbJWJYK/GlQSw46Cx9xIxhlMIM
	MuOKHb7RepggChLNgXGI41qwkcef5ZT2E9T6yQ=
X-Received: by 2002:a4a:edc7:0:b0:6bd:f333:7b83 with SMTP id 006d021491bc7-6ca9a44dc18mr1362602eaf.16.1789704146860;
        Thu, 17 Sep 2026 21:02:26 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:608a:778a:c473:ac82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287be968sm719908eec.26.2026.09.17.21.02.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 21:02:26 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from AP list on disable
Date: Fri, 18 Sep 2026 12:02:14 +0800
Message-ID: <20260918040214.85580-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918040214.85580-1-ndaugoing@gmail.com>
References: <20260918040214.85580-1-ndaugoing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_210228_107293_2B20CF02 
X-CRM114-Status: GOOD (  23.10  )
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

From: Yuchao Zhang <ndaugoing@gmail.com>

By code inspection, a race condition and potential Use-After-Free/crash
exists between remote LPI disabling and local LR folding when EOImode==0.

Commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount deactivations from
AP-list tail") introduced tracking the last interrupt placed in a List
Register in per-CPU host data (*host_data_ptr(last_lr_irq)) and traverses
the remaining ap_list via list_for_each_entry_continue() in
vgic_v3_fold_lr_state().

However, an interrupt loaded into an LR can be an LPI. While vCPU-B is
running the guest, another vCPU-A can write to vCPU-B's redistributor
GICR_CTLR to clear EnableLPIs, which dispatches vgic_flush_pending_lpis().

vgic_flush_pending_lpis() unconditionally removes all LPIs from ap_list
without checking whether the interrupt is currently in an LR
(irq->on_lr):
- It calls list_del(&irq->ap_list), setting ap_list.next to LIST_POISON1,
  and drops the AP-list reference.
- If the LPI is unmapped or its translation cache was invalidated, the
  vgic_irq refcount drops to zero and the object is freed via RCU.
- Meanwhile, vCPU-B's per-CPU *host_data_ptr(last_lr_irq) cannot be
  cleared by remote vCPUs and is left dangling.

When vCPU-B subsequently exits the guest:
1. vgic_v3_fold_lr_state() resumes using the unlinked last_lr_irq.
2. list_for_each_entry_continue() unconditionally evaluates
   list_next_entry(irq, ap_list) during loop initialization, accessing
   LIST_POISON1 (or freed memory).
3. If eoicount > 0, it attempts guard(raw_spinlock)(&irq->irq_lock) on
   the poisoned address, leading to an immediate host kernel panic.

Fix this by:
1. In vgic_flush_pending_lpis(), do not remove LPIs that are currently
   in-flight in an LR (irq->on_lr == true). They will be naturally pruned
   by the owning vCPU's vgic_prune_ap_list() after LR folding.
2. In vgic_fold_state(), clear *host_data_ptr(last_lr_irq) after folding
   so that no stale pointer survives past guest execution.
3. In vgic_v3_fold_lr_state() and vgic_v2_fold_lr_state(), bail out
   immediately if eoicount is zero, avoiding unnecessary list_next_entry()
   evaluation.
4. In vgic_v3_fold_lr(), do not resurrect the pending state of an edge
   LPI folded while the redistributor has LPIs disabled.
   vgic_flush_pending_lpis() cannot remotely clear the LRs of a running
   vCPU, so such an LPI would otherwise be requeued and re-injected
   while GICR_CTLR.EnableLPIs is 0, violating the flush semantics (and
   the architecture, which gives no expectation of the pending state
   being retained across a disable).

Note: this closes the primary race (the last_lr_irq node itself is no
longer unlinkable while in-flight), but the fold traversal can still
race with a remote flush unlinking a subsequent non-LR node in the
ap_list tail. Fully closing that window needs the fold side to take
references before dropping locks (in the spirit of the prune-side fix
in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
interrupt affinity change and LPI disabling")) and is left as a
follow-up.

Fixes: 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount deactivations from AP-list tail")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-v2.c |  3 +++
 arch/arm64/kvm/vgic/vgic-v3.c | 14 ++++++++++++--
 arch/arm64/kvm/vgic/vgic.c    | 10 +++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 7182f63fc938..7b6cd05ce32d 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -122,6 +122,9 @@ void vgic_v2_fold_lr_state(struct kvm_vcpu *vcpu)
 	for (int lr = 0; lr < vgic_cpu->vgic_v2.used_lrs; lr++)
 		vgic_v2_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
+	if (!eoicount)
+		return;
+
 	/* See the GICv3 equivalent for the EOIcount handling rationale */
 	list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
 		u32 lr;
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 726e20a1da6e..dd1314f4543d 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -96,9 +96,16 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
-		/* Edge is the only case where we preserve the pending bit */
+		/*
+		 * Edge is the only case where we preserve the pending bit.
+		 * Do not resurrect the pending state of LPIs once the
+		 * redistributor has them disabled: vgic_flush_pending_lpis()
+		 * has discarded them, and the LRs of a running vCPU cannot
+		 * be remotely cleared.
+		 */
 		if (irq->config == VGIC_CONFIG_EDGE &&
-		    (val & ICH_LR_PENDING_BIT))
+		    (val & ICH_LR_PENDING_BIT) &&
+		    (irq->intid < VGIC_MIN_LPI || vgic_lpis_enabled(vcpu)))
 			irq->pending_latch = true;
 
 		/*
@@ -155,6 +162,9 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
 	for (int lr = 0; lr < cpuif->used_lrs; lr++)
 		vgic_v3_fold_lr(vcpu, cpuif->vgic_lr[lr]);
 
+	if (!eoicount)
+		return;
+
 	/*
 	 * EOIMode=0: use EOIcount to emulate deactivation. We are
 	 * guaranteed to deactivate in reverse order of the activation, so
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index b25303d9919f..0d7d75c3ac93 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -205,10 +205,12 @@ void vgic_flush_pending_lpis(struct kvm_vcpu *vcpu)
 		if (irq_is_lpi(vcpu->kvm, irq->intid)) {
 			raw_spin_lock(&irq->irq_lock);
 			irq->pending_latch = false;
-			list_del(&irq->ap_list);
-			irq->vcpu = NULL;
+			if (!irq->on_lr) {
+				list_del(&irq->ap_list);
+				irq->vcpu = NULL;
+				deleted |= vgic_put_irq_norelease(vcpu->kvm, irq);
+			}
 			raw_spin_unlock(&irq->irq_lock);
-			deleted |= vgic_put_irq_norelease(vcpu->kvm, irq);
 		}
 	}
 
@@ -873,6 +875,8 @@ static void vgic_fold_state(struct kvm_vcpu *vcpu)
 		vgic_v2_fold_lr_state(vcpu);
 	else
 		vgic_v3_fold_lr_state(vcpu);
+
+	*host_data_ptr(last_lr_irq) = NULL;
 }
 
 /* Requires the irq_lock to be held. */
-- 
2.53.0


