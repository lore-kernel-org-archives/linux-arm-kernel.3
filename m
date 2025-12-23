Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4922AE6B261
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZY2ScmbYPT07jCEDx9Ax8+p/WTKhTCSS/exmiQPSko=; b=LfcRMyJmJ8KqIpklJfb3TjLpsI
	ZFnVXK+aWBU3hLM8fC+5FUgd3ZZdKAEtfPBDo0ajkLJxmbE7qPUT4iOYW7UebaZBD7OD9ZoJrXMLk
	kDLMwy0vvW0+p2c51PYUaIwb3lzez7AifJ806QUv1a2STM3oU5BBYRYOGW+x1Ox6LZA1x1OodW+9R
	npUmlvMZ3RKg8YsXkOFRNg+8ms+GkFVFKAleZkq86kp9//usxrxHpgjqb4giIpYgWyQlJfH6g7jpi
	0pcTAZbZQq4T3kaFlO2wRDMZUBfntw7cAAr5WulkhCN+uY3Iaq+doBUejVQvAMIvQgamx8QoVxcMZ
	IOLX5Tyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr77-0000000EMIy-0KQ5;
	Tue, 23 Dec 2025 01:23:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr74-0000000EMGI-1oAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 01:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCCB26018C;
	Tue, 23 Dec 2025 01:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F451C19422;
	Tue, 23 Dec 2025 01:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766452977;
	bh=QalGDOMHjOiQjvBbbedaaYeF4HQ2DEwgjsr/uOC9S0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DZraqkfX93bL3Xevfi+qsnXNb9OcIWXRZQqAiD/HWbASFR2KJ7RdKD1rEv7n7MbM1
	 VQaiOHb+FuPb2T/w8k0YpWl1k0JSjS+jIv7aPB0q0msMJ3/uEwTG1fCHrKViOkXZ3w
	 PwgG97CyAeYu9nxQjl6JuX6xjRH4n4qLAVvp+duMIaUe/3QQ0nW4ICDp7iBtJocvFF
	 lhQxOM96DR/WzMJ49v1HYaqDuuZFE8hLF+NuEyxowNv1tG8D6zppzXmyZsUMKL2ysz
	 MCkgjGZuzUMIvqVx0ikJ1gUxPFcGAPu9JhKsl/8mKULjtNs8dpS1wXUvsIZpBanlwK
	 Vt/tO9EKzucgg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:13 +0000
Subject: [PATCH v9 19/30] KVM: arm64: Provide assembly for SME register
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
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
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QalGDOMHjOiQjvBbbedaaYeF4HQ2DEwgjsr/uOC9S0E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6Rm6UAk60DHDfEFq1PtHTHsczXqVLJt7lIW
 mXsBgcMvg2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnukQAKCRAk1otyXVSH
 0IcHB/42RHGmQOW7bcb0Ca/kXpI+DpixoJ3o82LwO+zziSgSoIRMBGxX2S3DE8strN3QI33ylPX
 HvYQ0PrSI7IyZa9DMk2bIQzKIOKyg2tDb9maQm6iPGySwTUIKxmMM4Io3f8cY7+mz/KAL+5NnfL
 o+XpSaXuu9W1cqk10ObSgPh+ohdHbOkP2Sl10iVeEITpcgUEDtmeW9aBkeUSAccNqbyrBRSHSGk
 MjvN4/GST/Ef9J/mFebLrus44Zo6fFqTIgURWE8DwoMiogYmpMjGAOlaMLEYI/E3PUTjXxl1XC0
 jZphq6h63+BpNT4S0/vSe2f4sYCVmZimpIx8Q709gUoNRcWs
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
 arch/arm64/include/asm/kvm_hyp.h |  3 +++
 arch/arm64/kvm/hyp/fpsimd.S      | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 0317790dd3b7..1cef9991d238 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -116,6 +116,9 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
 void __fpsimd_restore_state(struct user_fpsimd_state *fp_regs);
 void __sve_save_state(void *sve_pffr, u32 *fpsr, int save_ffr);
 void __sve_restore_state(void *sve_pffr, u32 *fpsr, int restore_ffr);
+int __sve_get_vl(void);
+void __sme_save_state(void const *state, bool restore_zt);
+void __sme_restore_state(void const *state, bool restore_zt);
 
 u64 __guest_enter(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/hyp/fpsimd.S b/arch/arm64/kvm/hyp/fpsimd.S
index 6e16cbfc5df2..44a1b0a483da 100644
--- a/arch/arm64/kvm/hyp/fpsimd.S
+++ b/arch/arm64/kvm/hyp/fpsimd.S
@@ -29,3 +29,29 @@ SYM_FUNC_START(__sve_save_state)
 	sve_save 0, x1, x2, 3
 	ret
 SYM_FUNC_END(__sve_save_state)
+
+SYM_FUNC_START(__sve_get_vl)
+	_sve_rdvl	0, 1
+	ret
+SYM_FUNC_END(__sve_get_vl)
+
+SYM_FUNC_START(__sme_save_state)
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


