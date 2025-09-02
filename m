Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A8CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTVo8M1T6UdpqtDguJT6JF2v4XCJaslKjfXHViH4zjI=; b=D0fdbiTx+n7sSqOUSRJkUiCriG
	1/l4F83LvMTSNvE+f9gp4iSGkI9IqL5DFGfU+AODZ1kQ3Jvz/gKsKiZtRs0OC9tFHV9j9VR85kH+l
	S2QvAQHD4uwnQUjOV9N02toQSJ4W3kw4psf3jg5B9QGr3xD5/c3vvsM5FLLD8wuWyOVruIwe5GaJs
	F83x2BtpTLqrgQjpRgxjNMJTg5SIoAwayxHF4OvntDXHe+um7vMfvELn/WDTvYqmRFZbQ06EKv+ER
	ihE1x+GU3UGnwwXg978lXAO+lf3W8KzI72ujDQlJXTlos6A0RLBmf4IaRkOri3jPAMUHhBKdRFYTv
	kl+nRo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRB5-000000005Kk-1ak8;
	Tue, 02 Sep 2025 13:36:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPRb-0000000Gynr-1oLx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13A3A43857;
	Tue,  2 Sep 2025 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7AC4CEF7;
	Tue,  2 Sep 2025 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813498;
	bh=ZG4fxyvl+fJjEtNXLvLt23cYfT+WmIeEoPP0DgaTqa0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eia4wU0m9xg4EvTo7aFBbY8yYebfjj5jR1h5o1hy2Jf3tRdg3i/5cnqqTe2kELgFo
	 c40Eb2ufXtdwL3Hiw/WCvLQiwu7PX2DN6ZDN2kH+q8iCCxSXSRKDr07ktwhJUCbqUa
	 vpmYEwQt4L16gcge0vbi4jaAlwXgDMNFAIrdr6m+tCJoXGK4TTmZ3eZXweJbI3g8Il
	 sDciLua1yjnYcZ2ZJzVhuFaktklIgVEgYbwKC7eijDGMKyyk3BKpsCbIM7CrnhP7yo
	 kazC8NoH53xSqsYWsW6dtzn2KfAsXPLRZTgI29kPSZwcT5Ksq6I231OCHy2Sa3y8Yy
	 twp8dc72tO55A==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:12 +0100
Subject: [PATCH v8 09/29] KVM: arm64: Move SVE state access macros after
 feature test macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-9-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZG4fxyvl+fJjEtNXLvLt23cYfT+WmIeEoPP0DgaTqa0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiAa5JvxgG0URYLkAdE3e1wR5kq07dyBcx8i
 ynF7f4rKKyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYgAAKCRAk1otyXVSH
 0JesB/0UtIZpn6yk/kUasJvMR/f+f+jq1DUI8iOVHrDqUNrfo8I/IQ/aZIQUOacwLyD8O0lohpg
 ib5n7N2Q9AGT1GJ8IxFSPrAslVi2kaYqbPQn+qiy0E14o/TvuztarwxeGc64RMV2t0a16kwQmR6
 KLZUVyt70irxOHilX1lyc2doFOkpovMfvtAITwTZb/jfwgytDugfEG8Im9NFkr1fPCpcdj+GG1q
 YxdQzbzLtckzk57D/1FSfgQWspap4MLk/6xMNI5DFHZ2hlSt75ysY6Y6fAQYRAnoiBw+jjaUJTZ
 MwBsM5AjhilE+PdjnWauLn/H8qJs2ooJwKZo4wN5mvkDZAVC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044459_517359_1CBE07A1 
X-CRM114-Status: GOOD (  13.32  )
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

In preparation for SME support move the macros used to access SVE state
after the feature test macros, we will need to test for SME subfeatures to
determine the size of the SME state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 50 +++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b501c2880ba2..8f48c2a488f7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1045,31 +1045,6 @@ struct kvm_vcpu_arch {
 #define NESTED_SERROR_PENDING	__vcpu_single_flag(sflags, BIT(8))
 
 
-/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
-#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
-			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
-
-#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
-
-#define vcpu_sve_zcr_elx(vcpu)						\
-	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
-
-#define sve_state_size_from_vl(sve_max_vl) ({				\
-	size_t __size_ret;						\
-	unsigned int __vq;						\
-									\
-	if (WARN_ON(!sve_vl_valid(sve_max_vl))) {			\
-		__size_ret = 0;						\
-	} else {							\
-		__vq = sve_vq_from_vl(sve_max_vl);			\
-		__size_ret = SVE_SIG_REGS_SIZE(__vq);			\
-	}								\
-									\
-	__size_ret;							\
-})
-
-#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
-
 #define KVM_GUESTDBG_VALID_MASK (KVM_GUESTDBG_ENABLE | \
 				 KVM_GUESTDBG_USE_SW_BP | \
 				 KVM_GUESTDBG_USE_HW | \
@@ -1105,6 +1080,31 @@ struct kvm_vcpu_arch {
 
 #define vcpu_gp_regs(v)		(&(v)->arch.ctxt.regs)
 
+/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
+#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
+			     sve_ffr_offset((vcpu)->arch.sve_max_vl))
+
+#define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
+
+#define vcpu_sve_zcr_elx(vcpu)						\
+	(unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
+
+#define sve_state_size_from_vl(sve_max_vl) ({				\
+	size_t __size_ret;						\
+	unsigned int __vq;						\
+									\
+	if (WARN_ON(!sve_vl_valid(sve_max_vl))) {			\
+		__size_ret = 0;						\
+	} else {							\
+		__vq = sve_vq_from_vl(sve_max_vl);			\
+		__size_ret = SVE_SIG_REGS_SIZE(__vq);			\
+	}								\
+									\
+	__size_ret;							\
+})
+
+#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
+
 /*
  * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
  * memory backed version of a register, and not the one most recently

-- 
2.39.5


