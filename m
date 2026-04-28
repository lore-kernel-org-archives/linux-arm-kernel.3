Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199D3FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xE/iPxwYzw+NNX7wEA81VsFDw/XB5o3T+Ctb9g0a1xk=; b=1dlo3UKLowVW/eOu8jBZoep7LP
	i4Fsou780iprdFxbaQmjABRFDA6uHIWRhuybeVRKzW7OIDWD4vn+dNSAadxo+jIvX5VPrpKsryVbd
	l5Qc+45kClXr0I/59izQ9tzT4XJfOlncw/mUYadmUOBUpJJZfjsXO0O2nMW5PFjkMgUVUbDqareJ9
	qmUoshm3S4/jEFWm6P88KF1yXcGylQRNHhcuHsiM/jiq5iLqq2HrfXksOPQZKRhYDGCTksDksDwKv
	8FyE/nqGTp1IJE/GzdvScDaHLnJRCSJibHmPHyN/TACnza7jSO7XFA1PFSJO3JRYCo337abSIqOxj
	oRfv87ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhr-00000001Ajq-16im;
	Tue, 28 Apr 2026 10:30:19 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhm-00000001AfZ-2Nbu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:15 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b9ca1ef3403so977949966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372212; x=1777977012; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xE/iPxwYzw+NNX7wEA81VsFDw/XB5o3T+Ctb9g0a1xk=;
        b=igxm/YlCfoFDq7THj4mmsdlF66bJa6b/8NHS1BLzc88Iq3wjU6RKl45H2XoYTHytfz
         emGxZaeayFc7W2/lLJ+54zT3RjOMKQ7MkApSK21X87Jc0VKB2EzzSh5KxMcgeuRDzKMs
         BDs1/AohNxY69RGmt/Lzbs+8ewCx1z9yoEH8lO/th92jlGakDgOTF35gdrP3H4/CMyqi
         AHu15K7g6myjie5Oq+okNSXdiSbghsiOiWFx/I6Q9rewEuuRHezML5CsTtxfWtul41oG
         t8vPLc3DJTsMj3CSXAR3/phJt3olB+Yv2I5A+uATXHnGJegXz4OzoppOjFbBBt2Xte7q
         Wazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372212; x=1777977012;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xE/iPxwYzw+NNX7wEA81VsFDw/XB5o3T+Ctb9g0a1xk=;
        b=Wsf90q05i0/34CAAFTjYGq6miLqSYNl6n20ndyJGjJCYkepLGY4T2csyUGrqutz/MT
         5TgDLC4OY0zj7YsZAUxyULWbZsQyAuh8eW2H/NYqfRDk7S5WHAhlBlKbhoPE3v6DNcnl
         2TKrkqQuVLb7oEQEHKYbqTZOM12SqsCLo5o8xTYLHoZohlzOXvbXshpNRWvXZAqG8gIq
         DVH+BlTq7HprdoGVo9R3UcxMiXBYSoBALh88wNwotDj/a/FvbIP0yXOyJhL2EPQ3u9c8
         cwjoF9wqaKDvpkUN4QLpe8rS8RrPanDea9/TOdv84kl/ksNsqlx5sH/ZmBhBtYizugJ+
         VGzA==
X-Forwarded-Encrypted: i=1; AFNElJ/BxYEuIV2mPjkzSs7a5k/anmobEsoqBSfcacHKWWX/Cztr9MMouB3cL/0rDnQYOF7kEsHfbA8tgAYKGNq7UXwy@lists.infradead.org
X-Gm-Message-State: AOJu0YzGb/0X9gaLF8ThEr4sdUXfxK6D9NhXymjj51jHutUjqpOgxmdF
	+aF08J2h3ZrPl9O8102kBsaFByG+nJSWJc1hZrdoSrLIbue4ZLH+wjF0N3J8ByaSe3AqQ2v2k8s
	wFA==
X-Received: from ejchp42.prod.google.com ([2002:a17:907:3e2a:b0:b9e:2534:71c9])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:5194:20b0:bae:656b:2953
 with SMTP id a640c23a62f3a-bb8022c28ebmr102260866b.11.1777372211619; Tue, 28
 Apr 2026 03:30:11 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:02 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-3-tabba@google.com>
Subject: [PATCH 2/8] KVM: arm64: Synchronise HCR_EL2 writes on the guest exit path
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033014_629577_3DE0C6D4 
X-CRM114-Status: GOOD (  14.82  )
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

MSR HCR_EL2 is not self-synchronising. Per ARM DDI 0487 M.b K1.2.4
(p.K1-16823) and B2.6.1 (p.B2-297), a Context Synchronisation Event
is required between an HCR_EL2 write and any subsequent direct
register access at the same EL that depends on the new value being
in effect.

On the entry path, the HCR_EL2 write in __activate_traps is followed
by further EL2 sysreg work (MDCR_EL2, CPTR_EL2, VBAR_EL2, and on the
speculative-AT errata path SCTLR_EL1/TCR_EL1) before ERET into the
guest. None of those intervening accesses depend on the new HCR_EL2
value, and ERET is a CSE per ARM DDI 0487 M.b D1.4.4.1 rule RBWCFK
(p. D1-7209) conditional on SCTLR_EL2.EOS=1, which is set
unconditionally by INIT_SCTLR_EL2_MMU_ON (see the prerequisite patch
in this series). The requirement is therefore satisfied implicitly
on the activate path.

The deactivate path is different: after write_sysreg_hcr() in
__deactivate_traps() further EL2 sysreg work runs before any natural
CSE - on nVHE, __deactivate_cptr_traps and the VBAR_EL2 write; on
VHE, the timer context save which reads CNTP_CVAL_EL0 under the new
TGE/E2H, and the EL1 sysreg restore. Add an explicit isb() at each
of the two deactivate sites.

The practical impact today is bounded: HCR_EL2.E2H does not toggle
in either path, and the trap bits being changed primarily affect
EL1&0 behaviour. But the architectural rule should be honoured.
Note that write_sysreg_hcr() itself already issues isb() on the
Ampere errata path (sysreg.h), confirming the architectural
expectation; the fast path optimises that away.

The fix is at the call sites rather than inside write_sysreg_hcr()
because the macro has many users (e.g. the activate path, at.c,
hardirq.h, ptrauth alternatives) where the immediately-following
code either reaches ERET or has another CSE; making the macro emit
an unconditional ISB would impose unnecessary cost on those
well-formed users.

Fixes: 9404673293b0 ("KVM: arm64: timers: Correctly handle TGE flip with CNTPOFF_EL2")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 11 +++++++++++
 arch/arm64/kvm/hyp/vhe/switch.c  | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 8d1df3d33595..9d7ead5a5503 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -105,6 +105,17 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	__deactivate_traps_common(vcpu);
 
 	write_sysreg_hcr(this_cpu_ptr(&kvm_init_params)->hcr_el2);
+	/*
+	 * MSR HCR_EL2 is not self-synchronising. Per ARM ARM K1.2.4 p.K1-16823
+	 * and B2.6.1 p.B2-297, a Context Synchronisation Event is required
+	 * between an HCR_EL2 write and any subsequent direct register access at
+	 * the same EL that depends on the new value being in effect.
+	 * The activate_traps path falls through to ERET (a CSE), but the
+	 * deactivate path still executes further EL2 sysreg work (CPTR/VBAR
+	 * writes below) before any natural CSE, so make the synchronisation
+	 * explicit.
+	 */
+	isb();
 
 	__deactivate_cptr_traps(vcpu);
 	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 9db3f11a4754..140d3bcb5651 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -149,6 +149,17 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	___deactivate_traps(vcpu);
 
 	write_sysreg_hcr(HCR_HOST_VHE_FLAGS);
+	/*
+	 * MSR HCR_EL2 is not self-synchronising. Per ARM ARM K1.2.4 p.K1-16823
+	 * and B2.6.1 p.B2-297, a Context Synchronisation Event is required
+	 * between an HCR_EL2 write and any subsequent direct register access at
+	 * the same EL that depends on the new value being in effect.
+	 * The activate_traps path falls through to ERET (a CSE), but the
+	 * deactivate path still executes further EL2 sysreg work (CPTR/VBAR
+	 * writes below) before any natural CSE, so make the synchronisation
+	 * explicit.
+	 */
+	isb();
 
 	if (has_cntpoff()) {
 		struct timer_map map;
-- 
2.54.0.545.g6539524ca2-goog


