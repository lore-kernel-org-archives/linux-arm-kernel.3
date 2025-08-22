Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8A6CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XpubcDJNCn2/knVN0OUqvGBE9VDF3lHvgMz0DGE5UY=; b=3uyg0/EShTJoSD7iyXUAbrhaEH
	DtZdDHFQLIfLgNwsHpkseOEysDLmYwT85ktnelGuTHKdMuAmHJNKiUUfkxps8oRHTCLS6K2kn/Uyd
	5HJLxZGDICu8WXsqZp6ZDooaw3aN8NaNMnyDiFF6b9IMiii+SFuvaKv8qropRDMgmSgtai1g+mEKk
	mMDEe87O2zXEmLu9953wcBcTq+TWag1zV920+V2u6r8Xk7eUPxCn2HhuPzgXp1mwPJcLBKK+hLYsM
	WhnrETTWZSUqtAsv0hi5JYUyYjldeop6+SiH1WT2pqmrfEju5Ix2ezzJjFFBONbVag0c4eF97iyif
	c2Ypc7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upM6q-00000001o3r-1jRh;
	Fri, 22 Aug 2025 07:22:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH0b-00000001Br1-3ggH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 01:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3XpubcDJNCn2/knVN0OUqvGBE9VDF3lHvgMz0DGE5UY=; b=ilr5jn69YnZiXq3ydICy+Y9FuP
	IM61WKIwqtHImCuoWcqdXMv7O4A6GNozhizuoJiNi5knR2eXgx1ChGWMA65E66luAooBWShC6nUDQ
	DKaTgcTY10E33eIBVsAAdM+A8pdp9yrsPGpSXBHHaFES3z7GBzdJ3gST/IFg8ryS/uxf0/Ruobh46
	kZALMum+gaXFvxkym/L33VtAe0hd6Kb8KZaiE2WN/1WIKFYZAD71aX9/ye99K2kFg7vI7yZcfu8Qo
	hFmBtbOLthzQElU7RYLnPFYgAK0IVH8ACDKiiVQWtFympB1FQHo544V5SUssGcrIcO4jbgWpeY9ji
	ATM1UFkg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH0K-00000000jss-018c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3CF444C7A;
	Fri, 22 Aug 2025 01:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C82BC113D0;
	Fri, 22 Aug 2025 01:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827742;
	bh=eko0M/1IoNzmkVmBa1f5aR4hGKuIltnrGwhCOTIwAnI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S2+QZuHpH6eDMNPX0FRylkbgWM9BVxPu0FszJe82QsLIqdG4OpnJKpN74QrkOt6e2
	 A61hNPAoEClh879pkGje4WXMFKztvuFAu+qzOfj50Av9Q+7SHTwGmm/t1JyuhOE3F1
	 TUP6uLPEpjqQWFBzWtRVWPe/wdYzDudikj7pi7Zg8l15XWLjEkzGukcAwaS45gJAC2
	 /fygnpvEkGkTMJDIx0HmbG56C9f2kyan6G5nro4wEKANozOV7/woRJQ79iHWhD9KS9
	 li5pFbkMW66PXHhPR/kl01TwgEmJfhlxqVnFdI8NsRsuQS08o4qRhWE0gxFpsAUfH6
	 LqS8hJO+FKh8A==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:49 +0100
Subject: [PATCH v7 20/29] KVM: arm64: Provide assembly for SME register
 access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-20-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eko0M/1IoNzmkVmBa1f5aR4hGKuIltnrGwhCOTIwAnI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop83I+IndHAqLMki3155WeFFGLW5uEdsLLqc8X
 Ls4dDo7JIiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNyAAKCRAk1otyXVSH
 0Fr5B/95xLO97ePuVChS1XQAhqSMl+jf/Cdb+OuygtjCY9ba7d8h39WXZZJbUb4pXLSlqVm5uJw
 0WkQ4a/IbbKwJaI4NnVtO3pBZtJvGnqn8lGAEGgXoBO7MOH7Z30uzt8mOMBjXQLPTXkZ5OiIEh9
 A+j7eugheVEU2xth82Lgvr5lCX0v17pHomg68+D/YnGx0VL120/Wg0K3D3+i/x1CxZi7pMpPFqr
 mONxfpY2l5V1rKP4S2tD7WIAdOuh426oG5YfR7d6H7ux/+1ej1Ept7b658CWwxtLa7BDiqgj+xW
 I8X51+VFH0i52BYefy3WzyFKdlHLXwBCIS9nmmvw593Q5hpj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_025554_651742_D5D7E4FB 
X-CRM114-Status: GOOD (  10.75  )
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
index 0ad5a66e0d25..1c31d8b26aa9 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -115,6 +115,9 @@ void __fpsimd_save_state(struct user_fpsimd_state *fp_regs);
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
2.39.5


