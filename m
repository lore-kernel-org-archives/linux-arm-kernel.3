Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D779CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+B8CgWtXYrJhRkqUat12EDvVB3QBzEo8L7yf27L0qGs=; b=hmdwkIQl8yJJPOfbRK/0/kZqjs
	S3loYWF6YMYqtSWun4zZGf7P1CGF3ujvApvb/CL9MN5FYRKmCAfDWmA9cA+FDj63h1TCFG1htdQwc
	feuwsQuhfxO2HNg8cW2+k/7ho8VXMG+UzB/fy+2Xvd47Im8SJx21r5GbOAvnwf9mTJdMkY1gC3kpQ
	vOcpfLTOEOTiTjvNk/Gji9HJxn7a2pcHfXy4gpaeLhwSNnGxWqWtiBexSIRMVdLhnQTedsH7grkTI
	K0rrFlv/+BYAXeT3kHwSpqcsqiOpdJhV7IOBbkKDikJO+eD3K3mutjt24XhTKRgHe2PkjmvZs3qpJ
	u5mbllKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSIx-0000000FhBA-2O7Q;
	Tue, 16 Jun 2026 11:50:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSIu-0000000FhAp-2ctb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 11:50:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84234c83142so1991137b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 04:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781610603; x=1782215403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+B8CgWtXYrJhRkqUat12EDvVB3QBzEo8L7yf27L0qGs=;
        b=MnJIgKssklnJm6gYpoxPsndidPTqu0sHTIjkmxxTB4J5H1H+ALTd7EZNllkTRQletz
         NRAD74O56qE+PKt4fZ3sYwxDXu58BLZQQB4B/69CAw1D8v/K/2vsGqfp4pbANnNrh/YN
         nMKBJZuWz+6Sk2NLAt8RDDJ+IU12E8YI0+f6EsQlreXSdpgHMJj9qaHr1mjEoTuplmwA
         3YbmoLXXO+ZMmSURzlw4crVfFE2h/jkmhqixXoBiM8um+PsRnEJKZ/i6KG2I3IEu9PWM
         DyCnwtzqNyAMzkJoPpIKhCCRLkG1PR+kUNr20SiNj/jHb1VPrWAmjhmHw/wglCEqn5vQ
         KiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610603; x=1782215403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+B8CgWtXYrJhRkqUat12EDvVB3QBzEo8L7yf27L0qGs=;
        b=qRBGDz3/QoXSppsIpApRFygp4kN4+4CibhaDcXzSWMIgj+vpVCwp4ggKONuz0VuiUA
         179ZyI9SH0sdUm2e3LDgEJpw1SH8vL9DUJ0zVxGZd9INP6wTtBC0ymxFAg8l7AHheuct
         sdoylc8cUGqkCHr1zEDjqDlHuOZwxZ4BdTv9ioVlyhp2yCy+Sis50x00OxuVNFG1w4Hs
         RUDIcu9vzKwPy8BRDDt4As9SpKzBzbW/ztn9hjqg1G88OEuLNB1uXVHSU99s42enN3ug
         57phXFhL7YNJCg1bzIwiHPTAJiU3XLnMW3CfnKbHIQ+Fhn/Pw77KMdGgKoqhbVFDG/qT
         Ytyw==
X-Forwarded-Encrypted: i=1; AFNElJ81L3X0g8AnfJSLRGJuwCCrLxeZ0D3E7SBOv+BMxlsoAxmxCE1uRtOfM53ItSysA7SHSoHNTKZZBU5UDV+5F0X3@lists.infradead.org
X-Gm-Message-State: AOJu0YwpiRLvvMok/LjpuyCTsYr18ZzOWJ9fKvpP1HsUQlXTZwT/CEYA
	P/2vFQu7gJVdXzdftrvseoRjXAuFSk5E+kgntP0PsMVRQ4kbBdmvmo0B
X-Gm-Gg: Acq92OEYMPF4BQhrrIR6FoBd3AKn8R8DCFbjSOyQmnwwT7OSgpwLa4tfUkmcmAzIvHl
	zrTS8xFTcO6rcNBk9RR83GqHnUuraR+nMjEUdJTQG6/HIsz9X9QMGMJjL+v3ErhOabiCLYVQdyG
	aeO5YPQl2Y2423RQpC5iI0egUrPHG1dYRPexdQ6AiaMuwhnWrem7wNT2V0mcrt9gEx8zkvRdfcK
	f9O763IdAF+KDB2LyIGRYGZDTPdMna6DvxAmyq4qiTrheADVvd5RJSKca7ZGCLjf2oEufNDXta6
	UaYjusq3teqYJNRaD0Oj9wKefNK7XQq8U4aJXXxJ8Bc1yiu2KIvrGSo3FZ0TWyKHAhIhTrPgXWa
	ZDLX84KXpZ+NQC5jhbC+Il32hEud0zQ5wP3S32NjcHD+bs73kC9jPECOAzCIs2P1VbP5/szshOD
	T7KoDowVi2HlWyEVnUuS+efx0S2vTLtbpo19qS7hFoxvmbhA/KWo+qT8xsfXpCjDNp5jc4KCGJF
	k9yS0Z0OYug
X-Received: by 2002:a05:6a00:1309:b0:842:6fec:1296 with SMTP id d2e1a72fcca58-844e193a3f7mr15072267b3a.4.1781610602893;
        Tue, 16 Jun 2026 04:50:02 -0700 (PDT)
Received: from SLSGDTSWING002.tail0ac356.ts.net ([129.126.109.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm13255838b3a.7.2026.06.16.04.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:50:02 -0700 (PDT)
From: Weiming Shi <bestswngs@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>,
	Xuanqing Shi <shixuanqing.11@bytedance.com>,
	Weiming Shi <bestswngs@gmail.com>
Subject: [PATCH] KVM: arm64: nv: Translate vEL2 PSTATE to EL1 in kvm_hyp_handle_mops()
Date: Tue, 16 Jun 2026 19:49:44 +0800
Message-ID: <20260616114943.81188-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045004_812306_52B03604 
X-CRM114-Status: GOOD (  14.05  )
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

When a nested virtualisation guest is running its virtual EL2 (vEL2),
fixup_guest_exit() rewrites vcpu_cpsr() to the guest's virtual exception
level: a hardware PSTATE.M of EL1{t,h} is presented as EL2{t,h}. The
hardware, however, executes vEL2 at EL1.

kvm_hyp_handle_mops() runs on the fast guest re-entry path, where it
clears the single-step bit and restores SPSR_EL2 directly from
vcpu_cpsr():

	*vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);

For a guest hypervisor this writes the vEL2 view (PSTATE.M == EL2h) into
the hardware SPSR_EL2 without translating it back. The fast path re-enters
the guest via __guest_enter()/ERET without going through
__sysreg_restore_el2_return_state(), so neither to_hw_pstate() nor the
"return to a less privileged mode" safety check there (which would set
PSR_IL_BIT) is applied. The ERET therefore restores PSTATE.M = EL2h and
re-enters the guest at the real EL2 with a guest-controlled ELR, escaping
stage-2 and the guest/host boundary.

This is reachable on a kernel with FEAT_MOPS running a KVM nested guest
(kvm-arm.mode=nested): KVM sets HCRX_EL2.MCE2, which the guest hypervisor
cannot clear for its own context (is_nested_ctxt() is false), so a vEL2
MOPS exception is taken to the host and dispatched to kvm_hyp_handle_mops()
with VCPU_IN_HYP_CONTEXT set.

Translate EL2{t,h} back to EL1{t,h} before writing SPSR_EL2, mirroring
kvm_hyp_handle_eret(). For non-nested guests vcpu_cpsr() never holds an
EL2 mode, so the translation is a no-op and behaviour is unchanged.

Fixes: 2de451a329cf ("KVM: arm64: Add handler for MOPS exceptions")
Assisted-by: Claude:claude-opus-4-8
Reported-by: Zhong Wang <wangzhong.c0ss4ck@bytedance.com>
Reported-by: Xuanqing Shi <shixuanqing.11@bytedance.com>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e9b36a3b27bbc..a6b7963ddbf0b 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -448,6 +448,8 @@ static inline bool __populate_fault_info(struct kvm_vcpu *vcpu)
 
 static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
+	u64 spsr, mode;
+
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	arm64_mops_reset_regs(vcpu_gp_regs(vcpu), vcpu->arch.fault.esr_el2);
 	write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
@@ -457,7 +459,26 @@ static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
 	 * instruction.
 	 */
 	*vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
-	write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
+
+	/*
+	 * For a guest hypervisor, vcpu_cpsr() holds the vEL2 view
+	 * (PSTATE.M == EL2h) installed by fixup_guest_exit(), but vEL2
+	 * runs at EL1. Translate it back before restoring SPSR_EL2, as in
+	 * kvm_hyp_handle_eret().
+	 */
+	spsr = *vcpu_cpsr(vcpu);
+	mode = spsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
+	switch (mode) {
+	case PSR_MODE_EL2t:
+		mode = PSR_MODE_EL1t;
+		break;
+	case PSR_MODE_EL2h:
+		mode = PSR_MODE_EL1h;
+		break;
+	}
+	spsr = (spsr & ~(PSR_MODE_MASK | PSR_MODE32_BIT)) | mode;
+
+	write_sysreg_el2(spsr, SYS_SPSR);
 
 	return true;
 }
-- 
2.43.0


