Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FAAC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohYf1XvtMCeR2pp1iNho8B7oyFZ/zgS/g8G2hAtOeWM=; b=AchtasJrV17m4uBJf7fTK2dJmQ
	ni8tO1dtWv2/m6uL+ZOZfaX9I7YqBGcLXQZ8w3xtFlfW74670WR02jVJv63L+lCiGSsd/f6Mq7wt5
	Kyott8dFdlVnOMmNTnOYnnVNNVm7ux3AL6b8GaVolXXkJuxMMcnByWgys68iIOU2Hi62V5tIUOYCT
	y/NXpbq1gr/GOt63alwt33ic/qk33eyV7khqpfqGdexJgR89hYtdIc8nfT+zbHjwVSvjgB2xJQWuC
	50XBfI+72CGkaqkoE75rmfbWZgLTp6/1X33a4mevV0AZeTe8CRexnGK1cd9b1cEa8LpokS9+zG1od
	Zb2luw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ohy-00000008fxK-39wL;
	Wed, 23 Sep 2026 15:16:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ohx-00000008fvh-1hW1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:16:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E8F5F40372;
	Wed, 23 Sep 2026 15:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB641F00899;
	Wed, 23 Sep 2026 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790176588;
	bh=ohYf1XvtMCeR2pp1iNho8B7oyFZ/zgS/g8G2hAtOeWM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TX83m2a5ihaN8AA6SgsfKyiWX3o4AzsbmqBQy1/23gbkmXBUzNb3hIsXdZqAw7aED
	 L3dCsZvzhtyWabP2O9siUu8OedxVHnmidmolwexgWoV9S9lSOoH+lQ7RSwUXB2ALi/
	 Rps0skkdnYO15xoUBm28l2qBZtpJJo4NsSRw7iaj7nyS7loxYJdjiG0iw8n46WAopl
	 pMaIPTNp6dnOR6qgUdhnr+TxxjNw7gfmOQhFuxgHuTFBcHwdR3aYh9e7vKeWXZQ+op
	 q5P2zeOqJXeugOlvQHjORXsALDil3bRoYqOMphSQrybTQEbQMo8ukVeQZL6DcRZSBv
	 73WIl/O7m/jvw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 16:15:45 +0100
Subject: [PATCH v4 02/14] arm64: Add ESR fault helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-kvm-arm-prefault-v4-2-d4b0b4dfa8c3@kernel.org>
References: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
In-Reply-To: <20260923-kvm-arm-prefault-v4-0-d4b0b4dfa8c3@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 linux-s390@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524; i=ljs@kernel.org;
 h=from:subject:message-id; bh=CrKeLvuwUnfStnYfIX5SaSTXH36Ss6uiAa8UepVZb3I=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI2v9WJFBIqqMxftTCC49yZIBWP+rbJ367f2mA/26Pp4
 7XVZw0cO0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRnY6MDJ3PK102y8e0nrgx
 jf+y+jl3vrPlKdu71dOMVFY+Cqt5p8bwV3p9pt45P3fbdbH5NSfjP3C+zs84+O3r3Sq1xqqzpyO
 COQA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Add helper functions which operate directly on an ESR value rather than
trying to access the register itself.

These mirror equivalent KVM vCPU wrappers in kvm_emulate.h and allow those
wrappers and KVM's stage-2 fault handling to operate on a plain ESR value.

This is needed to later generate a synthetic fault for the stage-2 page
table pre-faulting mechanism.

No functional change intended.

Reviewed-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/include/asm/esr.h         | 29 +++++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_emulate.h | 10 ++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index f816f5d77f1a..86756fc9bb5a 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -437,6 +437,35 @@
 #ifndef __ASSEMBLER__
 #include <asm/types.h>
 
+static __always_inline bool esr_trap_is_iabt(unsigned long esr)
+{
+	return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
+}
+
+/* Always check for S1PTW *before* using this. */
+static __always_inline bool esr_dabt_is_write(unsigned long esr)
+{
+	return esr & ESR_ELx_WNR;
+}
+
+static __always_inline bool esr_dabt_is_cm(unsigned long esr)
+{
+	return esr & ESR_ELx_CM;
+}
+
+static __always_inline bool esr_abt_is_sea(unsigned long esr)
+{
+	switch (esr & ESR_ELx_FSC) {
+	case ESR_ELx_FSC_EXTABT:
+	case ESR_ELx_FSC_SEA_TTW(-1) ... ESR_ELx_FSC_SEA_TTW(3):
+	case ESR_ELx_FSC_SECC:
+	case ESR_ELx_FSC_SECC_TTW(-1) ... ESR_ELx_FSC_SECC_TTW(3):
+		return true;
+	default:
+		return false;
+	}
+}
+
 static inline unsigned long esr_brk_comment(unsigned long esr)
 {
 	return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index a3c1928bdf74..654e8c1b4461 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -336,6 +336,16 @@ static __always_inline u64 kvm_vcpu_get_esr(const struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault.esr_el2;
 }
 
+static __always_inline bool esr_abt_is_s1ptw(unsigned long esr)
+{
+	return esr & ESR_ELx_S1PTW;
+}
+
+static __always_inline bool esr_abt_is_exec_fault(unsigned long esr)
+{
+	return esr_trap_is_iabt(esr) && !esr_abt_is_s1ptw(esr);
+}
+
 static inline bool guest_hyp_wfx_traps_enabled(const struct kvm_vcpu *vcpu)
 {
 	u64 esr = kvm_vcpu_get_esr(vcpu);

-- 
2.55.0


