Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D210C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lGfz1siIT5q4E2uH8NernSgbLLCtHEciMJJUl+iNLo=; b=BFKoOvmKX/0dxQ1sYJy/7mTWTU
	dSjdfGvq14SMmkKCAOkBjw4Ib4rjlahskKjtwnQ9XEDH9Aam1aKS6S+w2kMSQPZviUKSLYFkwdsAs
	tICYEbg+4/UanEuF1fZ/leuFDZN+OUXrhk2Ue0uG6FYX76ZDc+0kKHbuf8PKbPU4A0QCmMOCQAYe3
	olpFl6Q2pcGT8+1vnKmGjFsmE/YOEFwlrqE42XpvrnL+OoBtv1H+cny9KJpsbxurY4UK/+U9XbbQy
	f4NRkGoudcAoVK6MeCsr/MB+eLpEtHUBVlrlzWP5Lee43RPwzaXfxO4G+hQKmr/RB0q4pLYIRQ+9y
	EP4AU8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Occ-0000000DLKN-2tFd;
	Fri, 18 Sep 2026 02:46:42 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OcZ-0000000DLJe-2XPw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 02:46:40 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469f204f6so167625b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 19:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699599; x=1790304399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lGfz1siIT5q4E2uH8NernSgbLLCtHEciMJJUl+iNLo=;
        b=KzaWi48iMK+StAjy5XHWQbyzMEacERQzprZSLFrharnrJpZD+j78mfohZMVxw0AdFh
         icAYyZuhCILfJajKOUJ3QiBThRH5XnMixMyR2vvOtMsK4B8RJImZzz1t2aZ3c3pyvNNV
         uGQTqO8FKipTy1qm7L0n2SqVWakOERFyWKSWMgugESL3mLidue0qpmYcmiDJpZV+kOQh
         Sbubc21NxG8xxcERxORkRFHfmcgjJ6+5qlYLyWRS2jF6AbQn1u6TRkaJd3pQYGfggxFf
         ZF/gsGnaaiWnLXmx2l7MMM4/wF+3h/9SfXnew2T8keHHGX4pKdbPcrYLm7DvzYnge54L
         gUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699599; x=1790304399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lGfz1siIT5q4E2uH8NernSgbLLCtHEciMJJUl+iNLo=;
        b=lvxY3oEX1y3Ps7PgWltoKk6yRq+tE+rpnnWf7dI5sjoN4biuhCV/3+m6IPEG9ok8mO
         /zfgpKraMdP2pawnrHR3J9c7TfQDySQmnrodELDObBDfCeVuIpbVxNPHs7PiH4y56wSw
         iIWkLq7PFgXJ0S0BmNYqKzJ/EQJvgOInc5kH14ZAvryMfvCgGryKjRNz3uu9mRPeWcuJ
         z0f3IcvGXkWYGUloCnFfaGNoEMrYc1kEK//2NLluWe0n8Nu3jEz/naFhLYmZX5QKkuBF
         ezGdT443g55w4id3mQn9ct7h47mmbqGThMzlqF9VlDKimqGwzeA87ieUrW6fv5PjUjXq
         Vn5w==
X-Forwarded-Encrypted: i=1; AKwUvBxDr+qrqdtYIdcTZyR7t9ogUQpE5TyH/6idniMB79sKAG7Vi+yM11WnyoofD81lDb58/Ak+3N1GWHLjvwmHJjzC@lists.infradead.org
X-Gm-Message-State: AFuF++mT5oBWHDWQHrAN7tlNnyF/X22mlqmpNH0fgmd8REATUPZGipXt
	5qF2/wSyqBXQssvmpaf6czsm0YTOO9rmb2fSXKuLmFn8G22uMg/bDXUj
X-Gm-Gg: AYBFou26WZByTDoiBpzNIFG6oW00bSqsnwHuilHL9jy8NExFfJEJ9YGcuI43fhWmw/O
	91ND1Ckv8rBosZcf/sQ3rKt1GxtNbEpDv/vHo1R9cKpMBxOXCa44erAcVbwR6aogM8M/tp7xVjc
	DVp6PqIp9dFGN5/pt0DspVzbxOWKUKngUDbgZXvzeI0LfmVe98hRnllspTUYY8IJsCQ7VOu3Y9R
	nOnYA1t+aFfUru58SjbHyaboZwgrK0vm/e4eGTRZrfnWWyvl8T6Cdub3agwX867Is5CrHnC+RnE
	6PPINyDtDPRW/NliCohW6pA+ZdzXIvgjwPrV0R5Vqz8FUrFKAciFxpIpQ3AjfLx5feraKi0qwMV
	zvgw/81ShLgxL0tbAbRd8RE9p7/jIH6gG2ykvNq05IZg6c6A7vDd7xjqFUfrZ3P3wvuS1NTTxmj
	XaiRf1VQ6vclQGvmzh2cND2JNVOVjJJxw+5VCUORIdxRQTEEQccrjZMnkB5nAnTOoloXHcUchCR
	m1jRMoHgrk72v4ywudvnxwMtISaR54Edw3/kFQ=
X-Received: by 2002:a05:6a20:cc97:b0:3cc:9288:99aa with SMTP id adf61e73a8af0-3dd8c21565fmr2275776637.0.1789699598611;
        Thu, 17 Sep 2026 19:46:38 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:ec74:2ce6:f939:d0ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287b0293sm349521eec.24.2026.09.17.19.46.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 19:46:38 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] KVM: arm64: vgic: Do not remove in-flight LPIs from AP list on disable
Date: Fri, 18 Sep 2026 10:46:20 +0800
Message-ID: <20260918024620.83869-2-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918024620.83869-1-ndaugoing@gmail.com>
References: <20260918024620.83869-1-ndaugoing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_194639_653752_3AA490D8 
X-CRM114-Status: GOOD (  19.72  )
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
 arch/arm64/kvm/vgic/vgic-v3.c |  3 +++
 arch/arm64/kvm/vgic/vgic.c    | 10 +++++++---
 3 files changed, 13 insertions(+), 3 deletions(-)

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
index 726e20a1da6e..c6eb5d9dca2d 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -155,6 +155,9 @@ void vgic_v3_fold_lr_state(struct kvm_vcpu *vcpu)
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


