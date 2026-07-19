Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852F5C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBGo8J9fHQYp9Dr1R4CvmQH4U2pyd2XsXoly5P/hfh8=; b=dWPJwMAGLCQHWDD2UUbrsv88Yq
	P1zzFyA/kSDZVOHEzEz+PdBVo2RGgfqOwM8vDP6IEiTtUMlyAekO4k6OwjvsBGL7qXxRMeQK2V8b4
	NgoKARbCpy47w01Gm3xBU19OEVyjAAhF0ysxHaxuI1zZqD2UWjWjDWOEmBAOdxf/MwIyUeo8acWHP
	lRkR6KoEXLrPKEn/7nDzfuSefiZsB1ANpmqjxVaehpPWvlpZMs14vQFXMs7NaQmoadHRe7wUsEYak
	EYr6Fam+Skfx+bGGXn/IkFCyEJThEofF+CuC7ylxqf30IDDXLqpvuRDh1xAxq1bUJmCW+5lMbW4SS
	+7yhU1XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaer-00000005Sln-0FP8;
	Sun, 19 Jul 2026 23:10:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaej-00000005SeW-2I2W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:10:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F873436AC;
	Sun, 19 Jul 2026 23:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3981F00A3A;
	Sun, 19 Jul 2026 23:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502645;
	bh=LBGo8J9fHQYp9Dr1R4CvmQH4U2pyd2XsXoly5P/hfh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IfHDFrQBLNpytDktGMnouQN8B1XFyV+D+AvTPpuL1AknmQ/Ci1yEQf1yxgPxOo8iz
	 vXHeUEmy4NqNAdmCtDEJ6i5q+mIYqK1+7QZoKXzhKIHpO91nWWDeaLWk2Yo+DIywlb
	 w6G8tcwYa1h7nmeLeMvVMZzXO6ii057LkC9cbI7yx2VGqaKh8sFkii9zrHGea/SY8d
	 bNiBpcXbzTpnf+iO1mh5tTEjlW5+Klud2QuT5Kxb75I+wiq5/Orq7pYZ6gyaau72Rj
	 6wP320xoiZdrgQHOSSgNW9gL4HlbP+3d53WxyKuhnb+ibM+o/VNRvvqCQAe+s/+A7r
	 tEHikMQoNUQzg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:38 +0100
Subject: [PATCH v13 11/32] KVM: arm64: Remove special case for FP state
 loading from ZCR_EL2 traps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-11-d9abd3ffa245@kernel.org>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
In-Reply-To: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Jean-Philippe Brucker <jpb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261; i=broonie@kernel.org;
 h=from:subject:message-id; bh=01MOCCSmzfiDMZ4P33yBk6+tJ6PaDO0mQnR5AsHR3Mw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVkwVVmjUITqV+2fMkyW3FbqdCcZlHZbvTxH/
 gMFed0EwvOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZMAAKCRAk1otyXVSH
 0AdyB/9fjpYwqxCrDAwM14AF8+P6b1/+CNObcTxTKwn07ZLl68QIk+6o8eGvdh28nPIRGmww+cb
 MKbQJkFS2P0ga0f4v5qX1YOlMCFRt6ZU9V6rKkUQGWMYVBN89ZHzKXTIpX1js7zTq9xrs0zOLWs
 NEVXnyOozKzghDsdLaf8xjBadaHoGzqUb9LchV/86GGjxdOdajY66xxJNDJYpyGYhcltjH8Rme1
 e3F/mUAELIwvDhwbdnfCCVay5O7zdEvIkrtj0gyt4KHHPS+SatqTxwm923tnYblATk94CY19ZEv
 ri+md7EkG78lofrPA6FDRP3Uio3mKUim4JgvSpqXGr607oI0
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

As part of adding the nested virtualisation support commit 0cfc85b8f5cf3
("KVM: arm64: nv: Load guest FP state for ZCR_EL2 trap") added code
which handles access to ZCR_EL2 from a guest as a SVE access trap.
While the reasoning for this was not specifically articulated in the
commit log it was part of the lazy switching mechanism that we used to
have for ZCR_ELx.  Since commit 59419f10045bc ("KVM: arm64: Eagerly
switch ZCR_EL{1,2}") this mechanism has been removed.  We now switch
ZCR_EL2 in the hypervisor when transitioning between guest and host,
meaning that we no longer need the special casing.

Remove the redundant special casing, this simplifies the code and will
make the implementation of SME support (which architecturally follows a
similar pattern to SVE) easier.  Accesses to ZCR_EL2 from a nested EL2
will use the standard system register access handling path which works
with the in memory copy, and if the FP state is not yet loaded any
floating point operations will cause an access trap which we handle by
loading the state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h |  4 ----
 arch/arm64/kvm/hyp/vhe/switch.c         | 27 ---------------------------
 2 files changed, 31 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 18131e395e24..b4680baffc6e 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -601,10 +601,6 @@ static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 		if (guest_hyp_fpsimd_traps_enabled(vcpu))
 			return false;
 		break;
-	case ESR_ELx_EC_SYS64:
-		if (WARN_ON_ONCE(!is_hyp_ctxt(vcpu)))
-			return false;
-		fallthrough;
 	case ESR_ELx_EC_SVE:
 		if (!sve_guest)
 			return false;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index bbe9cebd3d9d..625fe81a20b1 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -458,30 +458,6 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return true;
 }
 
-static bool kvm_hyp_handle_zcr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
-{
-	u32 sysreg = esr_sys64_to_sysreg(kvm_vcpu_get_esr(vcpu));
-
-	if (!vcpu_has_nv(vcpu))
-		return false;
-
-	if (sysreg != SYS_ZCR_EL2)
-		return false;
-
-	if (guest_owns_fp_regs())
-		return false;
-
-	/*
-	 * ZCR_EL2 traps are handled in the slow path, with the expectation
-	 * that the guest's FP context has already been loaded onto the CPU.
-	 *
-	 * Load the guest's FP context and unconditionally forward to the
-	 * slow path for handling (i.e. return false).
-	 */
-	kvm_hyp_handle_fpsimd(vcpu, exit_code);
-	return false;
-}
-
 static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (kvm_hyp_handle_tlbi_el2(vcpu, exit_code))
@@ -493,9 +469,6 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
 	if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
 		return true;
 
-	if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
-		return true;
-
 	return kvm_hyp_handle_sysreg(vcpu, exit_code);
 }
 

-- 
2.47.3


