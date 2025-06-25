Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2179C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 15:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue6+FixdrFyBzX8QXPsjkSPLMUt2cQa/tif1X632Abs=; b=ujK3khia6wdOnhNK3A1KaVv8Gk
	3IP8i0tBu2Y2TaQ+7DeUDmtUwvD0EgLQ/zaqgYw7i9p2P4/2ldqRveZ8w1R6nCbJYUg1WSbTkZhx8
	VVIbe7uCUuJeWXTYyK7roX+z4NG90njulrF8CdADfSjSfKpaQlSThPOIfJPEUdI027ALi9BtrpBdZ
	zOClUKVVnmf2YBw0cV3U9dJ7SRFhzbMV1TqPpzYJl10+QvoGt1Cm0sAE77MnsMdp/Vy+R3OItKuiM
	sUmhAE830oVwkLuiBhEGUdoZqwdG/+P5KK3FylB7EC8wQcfOLbQghQAvtWtq8+4w1+/y5gfSPBPiu
	swxLq5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURt6-000000095iy-2Wkj;
	Wed, 25 Jun 2025 15:18:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOFd-00000008Sky-0tJH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F03BA43615;
	Wed, 25 Jun 2025 11:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EE8C4CEF0;
	Wed, 25 Jun 2025 11:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850712;
	bh=5KQ/uA0hy051leNLiXTP5XwOLFD/icV/voTuvRYqa4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PO1hEUGi0nlAwKAsRCYafdzk1/NGodptkEJCJaqNlSTtjsivkuXozroklYTQNuu+/
	 J4wH6r0AxMBq27rSbuUHz8kZlY/qONSRZ0WQWEt64TE2hgGruHICgvs5nQD/UGzr1B
	 v7GErkbJF1qekvWXI4GEB5kiMrG8snGsCVPiImUofoO0jDi6NRva4+SQEAWIXi9w2b
	 pOKFPcmBT7iXhUNvPXIzx46rJ4OwZEthqu/d08WRODEX/M6zMaVN5trEP5JIp6Gaww
	 ZMILndZuOJycqLX3lO1pjDJCbJ4pZ3SoWnGiTQz1S7cD+p1ohJGrWgPMVEoNFAbi7B
	 q0BsYgK51W/6g==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:47:58 +0100
Subject: [PATCH v6 07/28] KVM: arm64: Pull ctxt_has_ helpers to start of
 sysreg-sr.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-7-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=3287; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5KQ/uA0hy051leNLiXTP5XwOLFD/icV/voTuvRYqa4Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9xq77abeYmWzYh1ixIGSLYhTa3EsGyGplz4b
 Y3EOIigCCqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcagAKCRAk1otyXVSH
 0K6uB/4jocGqwscsrFl0qZ1apw4XJeekVIwNuamhYQbwZqQOdOv9r0jUj+dd+kAVMx6sEKHWqZC
 LyBjhO6fCqhybuVg6DVXV/wUkf8tPyUR8bOXDJGjoGfxvxDYnPDgXXwfWBV2XN3uHMMVyALjYbI
 LSMh/HqebTJYqaEHm95lgOG558YT7BXdcMTFHi4mPD1Da6XhrzCVg2+NNJzy56vM7eiLBrn1Nil
 e//mIWPclFEdeQxlatub0npZW5q+SQsBwsL8Odzj8OD9AtT2IGozafFtxFWXiXuCZ13giBE7EVR
 uCIseD+HW1fznJrDZTeOZVMCjwLq1Urh9mLGDfksQNp6l05m
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_042513_323873_4B285C65 
X-CRM114-Status: GOOD (  11.60  )
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

Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
pull all their definitions to the top of sysreg-sr.h so they're all
available to all the individual save/restore functions.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 82 +++++++++++++++---------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 4d0dbea4c56f..223819e95405 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -16,8 +16,6 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
-
 static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
@@ -28,6 +26,46 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
 	return vcpu;
 }
 
+static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
+
+	return kvm_has_mte(kern_hyp_va(vcpu->kvm));
+}
+
+static inline bool ctxt_has_s1pie(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!cpus_have_final_cap(ARM64_HAS_S1PIE))
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_s1pie(kern_hyp_va(vcpu->kvm));
+}
+
+static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!cpus_have_final_cap(ARM64_HAS_TCR2))
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_tcr2(kern_hyp_va(vcpu->kvm));
+}
+
+static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
+{
+	struct kvm_vcpu *vcpu;
+
+	if (!system_supports_poe())
+		return false;
+
+	vcpu = ctxt_to_vcpu(ctxt);
+	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
+}
+
 static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
 {
 	return host_data_ptr(host_ctxt) != ctxt;
@@ -69,46 +107,6 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
 	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
 }
 
-static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
-
-	return kvm_has_mte(kern_hyp_va(vcpu->kvm));
-}
-
-static inline bool ctxt_has_s1pie(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu;
-
-	if (!cpus_have_final_cap(ARM64_HAS_S1PIE))
-		return false;
-
-	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_s1pie(kern_hyp_va(vcpu->kvm));
-}
-
-static inline bool ctxt_has_tcrx(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu;
-
-	if (!cpus_have_final_cap(ARM64_HAS_TCR2))
-		return false;
-
-	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_tcr2(kern_hyp_va(vcpu->kvm));
-}
-
-static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt)
-{
-	struct kvm_vcpu *vcpu;
-
-	if (!system_supports_poe())
-		return false;
-
-	vcpu = ctxt_to_vcpu(ctxt);
-	return kvm_has_s1poe(kern_hyp_va(vcpu->kvm));
-}
-
 static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 {
 	ctxt_sys_reg(ctxt, SCTLR_EL1)	= read_sysreg_el1(SYS_SCTLR);

-- 
2.39.5


