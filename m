Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9ADFCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RB3ZNNjnI7f997Icb3VMmtai4KwltnX8GOMdpaFZuG4=; b=3qSIRqI0RTmJCLq9PO6DW6BRsp
	29KAvHPGaOs79u3sKtlrCH0DK2xx4EwB4YNNAxE7sGA7BSF9yK9Q2LzRDH52gfja/ii+BKs0Mm+nY
	4LXUMsvh5SlESzd7A3I7LTaT1oy6/Ecrt1Uq1d3ai5dJJZzCAw5WcnL3oHAJbxaZFCCBRajpijZnJ
	1QM4hiOipn3WBFPcbFNbPims20dA4e1GkDuutOGBdjf+4o+RKatMQJMc59oUfOH+L5TJ71EfdcFs4
	bWDEg1bHYh+QnGxNVm2c2e1hvTnAXrhtl/ofR1hS6bmGJPnT50c4EfCQar4KaySw5lLcbFCCTRrmE
	mkw19wPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhQ-00000004Dq2-2571;
	Fri, 06 Mar 2026 17:10:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYhO-00000004Dmt-0j0g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C0CE60018;
	Fri,  6 Mar 2026 17:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A08C2BC86;
	Fri,  6 Mar 2026 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817049;
	bh=FRT5fvZBAIjhBya7YWT00dc/V832oYejWRmRw40AVzI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ur84VoZDL/fO63PzSYfda/mG6D0R5ZDsnoNC2C9NQ5WzePtWOzgSLqbZXUnWChUD+
	 BR4CZipry7nSHfZ3gjPzLXwMeCFkuaozJ1H+Js4v/GOqifoWmeQjQwK/86c3enOyL3
	 Y+wm9xMgOJi3K/8R7Dtlygt4699GcO9rWNAHv6vmu7SDYmkegudPSXtzfUOiIeu0o/
	 GdCL3ANPzvYhj/+OVxFNlCgYSwrq9CIgoBf1ZXy/zLhkDy0Lq4wmt9KXFK0mX/Vpuw
	 aVZe95boI/eA5KqOtWzOJHdegAdKrIPFhvqRB8OOS5RrkAaVp/Exj/ZcePtud6ucnU
	 qc+DgFQazSYJg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:11 +0000
Subject: [PATCH v10 19/30] KVM: arm64: Provide assembly for SME register
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-19-43f7683a0fb7@kernel.org>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
In-Reply-To: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-6ac23
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FRT5fvZBAIjhBya7YWT00dc/V832oYejWRmRw40AVzI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwo3M4fBMa89wgAteKP42mDicIN04q1U64tmn
 W/8erSVjL+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKNwAKCRAk1otyXVSH
 0DUlB/sGo724WMwO3Na+9JbUGzTipVpyGlj5U0MlKsI71IC0IicVW7UL0M+cgKnxRHbhm5Wl0C+
 2e0A4I/aGK9tDVOAeoC6E9V0lVAnStY5fKeh1MFNJMJbwtoj4GrnqvCnwWbUd4Sh0ZNsmwryXq2
 M9oPODPl4I4EF9AKnOZ4kUZe98wYJwhlrTkn40wtgovae6Gfhhazz0UULOJDn1ViaFAlT3oKQ45
 qDfwhb2Ypd7zyJznPNyFJ5yfdjRFbInqX03T3Ihr3RM/sdtZqGkd5VPLUAo3coZF98leTkkwqQo
 zvWL/HLwAz7M/Nt5qinv/vbvZZ3eovGqftUWamBmLU9tcA0q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Provide versions of the SME state save and restore functions for the
hypervisor to allow it to restore ZA and ZT for guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_hyp.h |  2 ++
 arch/arm64/kvm/hyp/fpsimd.S      | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 0317790dd3b7..9b1354d1122c 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -116,6 +116,8 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
 void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
 void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
 void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
+void __sme_save_state(void const *state, bool save_zt);
+void __sme_restore_state(void const *state, bool restore_zt);
 
 u64 __guest_enter(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index 6e16cbfc5df2..18b7a666016c 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -29,3 +29,26 @@ SYM_FUNC_START(__sve_save_state)
 	sve_save 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)
+
+SYM_FUNC_START(__sme_save_state)
+	// Caller needs to ensure SMCR updates are visible
+	_sme_rdsvl	2, 1		// x2 = VL/8
+	sme_save_za 0, x2, 12		// Leaves x0 pointing to the end of ZA
+
+	cbz	x1, 1f
+	_str_zt 0
+1:
+	ret
+SYM_FUNC_END(__sme_save_state)
+
+SYM_FUNC_START(__sme_restore_state)
+	// Caller needs to ensure SMCR updates are visible
+	_sme_rdsvl	2, 1		// x2 = VL/8
+	sme_load_za	0, x2, 12	// Leaves x0 pointing to end of ZA
+
+	cbz	x1, 1f
+	_ldr_zt 0
+
+1:
+	ret
+SYM_FUNC_END(__sme_restore_state)

-- 
2.47.3


