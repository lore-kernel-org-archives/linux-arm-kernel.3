Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5EBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKKZ5rz2i6PaCor4UKmEcaNxM7iiatpyK73wR1jQwFs=; b=ih4hme1aEIXvxTCJeUbjrFOHNz
	ZMCNfAVmwE7uL3l3alv2M/So66BqgOMGrG+nPW94ksnLz5vachg+6EA+xpO5bZs9zwWLTZu/DKW1+
	0Q4fRx6EizOdBdZKv6jw1CcaQofD8ZH7C8mIy6vWJu01+EULNeSbTw34zoc7RguKgh9k9rRYkTog9
	V2HtrUWckGpfGJlJZ5hCxkIDMG6jOfkTw2GYvmMJAHOWbc90DGe7ufh0jVj54y7P9Wjsw/jNQx9GN
	lNjdMTvLc9W7tdXqnqMP4TIHhQn47t4glGFN9nCiiup1UAbq7tXjBE4exCRL0451J3JQb0P1UrZdN
	MRUQOBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1til9G-0000000DIeK-1qXd;
	Fri, 14 Feb 2025 02:09:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til15-0000000DFCF-3RJb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C51A85C5D28;
	Fri, 14 Feb 2025 02:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6129EC4CED1;
	Fri, 14 Feb 2025 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498479;
	bh=3PQifWZa0PYzxsXTtYT3uqYK+qICLHgWCa2IqwMJGYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jzBV85hbxeD88bGgqVz/W8uuHG/uvPe4kuWarE+38Oq82dsMUNSwtlEj6A0taOsG8
	 k4YZebjgAB98FHJU8CnRKLBe9MFgtkCa11zm5/BtEQKxMjH9FQZaGkFh03Y+EnRKp0
	 WAdtdDQ3Gt31mfyqB6jhPgwuBfUsTK9DBKEThDSmTZH3pYpNAZmLsRv3enC3HtW9EO
	 lOl0MVhWSgmZvJaR95/dpDF1JjJf5d8NoxVD6iOkOk+0n5n10Sn8Wcxngmv8a678In
	 u2t6tTS8n0Hj9XVPV4ivDUAZxvjRbwsHsKqmVuoO7DRoOryJcpwXqWbWojfkhJ8sL+
	 vKqpNlBFElZkg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:48 +0000
Subject: [PATCH v4 05/27] KVM: arm64: Introduce non-UNDEF FGT control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-5-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
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
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=2905; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3PQifWZa0PYzxsXTtYT3uqYK+qICLHgWCa2IqwMJGYI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPEnFldtuIWxcKKrLml22ik1aL0J2nPamYq3D8M
 bIdk56qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jxAAKCRAk1otyXVSH0K1aB/
 4t3+9jnwdck95RN7cJPA29m7VB8XNVNBH7EtfLO6PAzqjz7YMptZ6PJ2ceu5gO8JaXh2oQy7xe/clC
 G05wYyaIwOzkWIzP01yKpIs+BHtkTP2taZBfzFaGmI90aTBC9EgOUMy9vD/9UDliG6NZFYU9Qv8gUC
 o3mq+fciqKvLtYvDls8jrQQCh9i/Z8KBmcKyjlBV4pe/vLoNOzTyf7cz6ZFAUsu8eU2U3XMV0qk6Nt
 RAGPr3OaTzIl8Eu9d7bxgMzmgOeSoPiesFrDx89cepZ9zPpqNTA0RarQTia9eem07otBf/ieM8DtaW
 ZCiGLzwtJeqS10OXuju9M55meoz6Nj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180119_950752_85937B7D 
X-CRM114-Status: GOOD (  16.02  )
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

We have support for determining a set of fine grained traps to enable for
the guest which is tied to the support for injecting UNDEFs for undefined
features. This means that we can't use the mechanism for system registers
which should be present but need emulation, such as SMPRI_EL1 which should
be accessible when SME is present but if SME priority support is absent
SMPRI_EL1.Priority should be RAZ.

Add an additional set of fine grained traps fgt, mirroring the existing fgu
array. We use the same format where we always set the bit for the trap in
the array as for FGU. This makes it clear what is being explicitly managed
and keeps the code consistent.

We do not convert the handling of ARM_WORKAROUND_AMPERE_ACO3_CPU_38 to this
mechanism since this only enables a write trap and when implementing the
existing UNDEF that we would share the read and write trap enablement (this
being the overwhelmingly common case).

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 6 ++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 7 ++++---
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c77acc99045764cf5230f84ef5c9f8432c7d983e..64f2885cd4a87e9807fbbbbe6de937ed304ab917 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -289,6 +289,12 @@ struct kvm_arch {
 	 */
 	u64 fgu[__NR_FGT_GROUP_IDS__];
 
+	/*
+	 * Additional FGTs to enable for the guests, eg. for emulated
+	 * registers,
+	 */
+	u64 fgt[__NR_FGT_GROUP_IDS__];
+
 	/*
 	 * Stage 2 paging state for VMs with nested S2 using a virtual
 	 * VMID.
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index f5e882a358e2d6e6805d112ed646a112455012e8..c24e418cec101433f7484eb4f7af788c474eda3a 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -98,9 +98,9 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		id;							\
 	})
 
-#define compute_undef_clr_set(vcpu, kvm, reg, clr, set)			\
+#define compute_trap_clr_set(vcpu, kvm, trap, reg, clr, set)		\
 	do {								\
-		u64 hfg = kvm->arch.fgu[reg_to_fgt_group_id(reg)];	\
+		u64 hfg = kvm->arch.trap[reg_to_fgt_group_id(reg)];	\
 		set |= hfg & __ ## reg ## _MASK;			\
 		clr |= hfg & __ ## reg ## _nMASK; 			\
 	} while(0)
@@ -113,7 +113,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
 			compute_clr_set(vcpu, reg, c, s);		\
 									\
-		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
+		compute_trap_clr_set(vcpu, kvm, fgu, reg, c, s);	\
+		compute_trap_clr_set(vcpu, kvm, fgt, reg, c, s);	\
 									\
 		s |= set;						\
 		c |= clr;						\

-- 
2.39.5


