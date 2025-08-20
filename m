Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB8ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLq6o814WCIATMbGtdf3+y5YGs+8+ONQY7oSHzMfIYs=; b=wxZLcu8M99hdI45AsWIOi3jtcV
	++A6NFV9zbYVOiiq9Zad7HcRvq3ECx/KYaKpzqWl16n5twbM0PJjB4hWy7/hv1HrctSbW1yp7l77P
	yWGY/LI8O2/QIvF7iD7a9oaZeg0StdDSlDR6QVW7W3OorTWwiubM67ykLkpoovUIASE2hdgKCuO0G
	/iJPjGB/6Hf87qs5PXi1wU3fAs7l2j3lt8OGbGUBiutn0x1k43mpb8zYQmjlz2EVWwpXrluOljr6s
	2YNQH/PC+zA/HrcxG0hpIUg9n90BtSHv/0++Gsd4nAfUwoGHVXNL1a3JpW5VlD0N61cS3HY0MllTR
	SSq6FGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uol2D-0000000EId7-3NFc;
	Wed, 20 Aug 2025 15:47:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojbE-0000000DzGE-06RS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:15:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 759E66141A;
	Wed, 20 Aug 2025 14:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD10C116B1;
	Wed, 20 Aug 2025 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699334;
	bh=XqW9QBgR4CO7JeWk2qq6fqCcQ8Tlv6hAbg0b3Fasmt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vCwpma3JIbrl27GHSb4cgxBnxXzWGcgbBXnp4Re99GnN6+gSCkCCNgm+qthDWFflp
	 t3h8uJC555VPrSBsf9bU9rcyJW9lQ6a18h/PrtHcoaxMQV88d3WTx9uBcJbUvXrzp2
	 3fzVrmlTCIk59kd92DXAjgqARsCPUPgh3ySCYIJsn+b2UoYVseHA8eRNDEhKvn83H2
	 alhAhdh3pCJSrzzHAedbpwZEaPrUJytt0YE2TbCD9sWqyoJ3f38lPhVzRkUMLSf+5j
	 93JFlIa2c52vKFZsgthtBvkvfKFD3tzFz4ZXUVOfB6B6CRs4paTm8SXfN9Ex0expN6
	 KYdf2gX4yTLNQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 15:14:44 +0100
Subject: [PATCH v15 4/6] KVM: arm64: Set PSTATE.EXLOCK when entering an
 exception
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-gcs-v15-4-5e334da18b84@kernel.org>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
In-Reply-To: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2724; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XqW9QBgR4CO7JeWk2qq6fqCcQ8Tlv6hAbg0b3Fasmt0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBopdhxAZ4L+7YVt+YSme0YvQpLtyjywwn/lGMy4
 cGWlmL3oQeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKXYcQAKCRAk1otyXVSH
 0Du4B/0RDICVNAmNTsMAD3fmXlzD8V7yZ3k1cuhEFKlFN3oWsTwuBbYnsPFpMWpfvytpIh5+PDJ
 kjY3j1Q5tPoC85EtQyaC3sRJV0vN8adm+jbTs7czxbRfjZjHjMq28vnTMznqQ+/MbnJIktcjIVN
 i6ZxKpdt9HiX1JpDq2q4QWFcEueIZFZY06vYCaKn5BbXafIwHPczDloB0+Pv8pIPr8ZUCvNKYGj
 qvhgeZpFb17ejFruJ03OF1jH2rxGGhWKi4nR+/y3I+nWsJRBYqW0IY3VXUheN1C0xiIjLHBuQLf
 9XmyV3waTjLQddrme1VsAnKUz5p/FiEqcBD8hMTxtEIVJmin
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

As per DDI 0487 RWTXBY we need to manage PSTATE.EXLOCK when entering an
exception, when the exception is entered from a lower EL the bit is cleared
while if entering from the same EL it is set to GCSCR_ELx.EXLOCKEN.
Implement this behaviour in enter_exception64().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/uapi/asm/ptrace.h |  1 +
 arch/arm64/kvm/hyp/exception.c       | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/uapi/asm/ptrace.h
index 0f39ba4f3efd..f2fb029fb61a 100644
--- a/arch/arm64/include/uapi/asm/ptrace.h
+++ b/arch/arm64/include/uapi/asm/ptrace.h
@@ -56,6 +56,7 @@
 #define PSR_C_BIT	0x20000000
 #define PSR_Z_BIT	0x40000000
 #define PSR_N_BIT	0x80000000
+#define PSR_EXLOCK_BIT 0x400000000
 
 #define PSR_BTYPE_SHIFT		10
 
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 95d186e0bf54..46e1d0c3038c 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -73,6 +73,38 @@ static void __vcpu_write_spsr_und(struct kvm_vcpu *vcpu, u64 val)
 		vcpu->arch.ctxt.spsr_und = val;
 }
 
+static unsigned long enter_exception64_gcs(struct kvm_vcpu *vcpu,
+					   unsigned long mode,
+					   unsigned long target_mode)
+{
+	u64 gcscr;
+
+	if (!kvm_has_gcs(kern_hyp_va(vcpu->kvm)))
+		return 0;
+
+	/* GCS can't be enabled for 32 bit */
+	if (mode & PSR_MODE32_BIT)
+		return 0;
+
+	/* When taking an exception to a higher EL EXLOCK is cleared. */
+	if ((mode | PSR_MODE_THREAD_BIT) != target_mode)
+		return 0;
+
+	/*
+	 * When taking an exception to the same EL EXLOCK is set to
+	 * the effective value of GCSR_ELx.EXLOCKEN.
+	 */
+	if (vcpu_is_el2(vcpu))
+		gcscr = __vcpu_read_sys_reg(vcpu, GCSCR_EL2);
+	else
+		gcscr = __vcpu_read_sys_reg(vcpu, GCSCR_EL1);
+
+	if (gcscr & GCSCR_ELx_EXLOCKEN)
+		return PSR_EXLOCK_BIT;
+
+	return 0;
+}
+
 /*
  * This performs the exception entry at a given EL (@target_mode), stashing PC
  * and PSTATE into ELR and SPSR respectively, and compute the new PC/PSTATE.
@@ -162,6 +194,11 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 	// PSTATE.BTYPE is set to zero upon any exception to AArch64
 	// See ARM DDI 0487E.a, pages D1-2293 to D1-2294.
 
+	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
+	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
+	// exception level.  See ARM DDI 0487 RWTXBY, D.1.3.2 in K.a.
+	new |= enter_exception64_gcs(vcpu, mode, target_mode);
+
 	new |= PSR_D_BIT;
 	new |= PSR_A_BIT;
 	new |= PSR_I_BIT;

-- 
2.39.5


