Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1C4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hf3ZnwbaPwB7JWA6xLw/d7mljky+WZ0YaL8vLXxrCY0=; b=QgsH92Noz7ZXhm91XoLWEajGgi
	8kpr8BLR20mAS+K6XNFxPfPcTuY2gwWqjGvK9LUIvK52qXPt4n7oUX+Ie0APs939aNH1wrWshsET6
	XanUK3P0l2ZrrYv6X/M/630zmpFxs+uNkLjK7YiFtm5tq04jGfd+lzDowUrvg3wx5HYPtJGUvqgl8
	MlL3mniYniksOfrOTuK2hH8ZRovi+tztNeqI5R3ZWlycV/lnMK0Tbhnvu2zg9m60xIvzznwxn1+Oa
	xS0rpGLZ6BFgGw7s9tB6lUMnGoelqSk6Db7ZmFRDPZi2TL4z0Y8AG6zKK8oM8H90fkqlMst4g8Zim
	jYXafVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd19-00000000h1F-1PVi;
	Thu, 09 Jul 2026 00:53:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whd18-00000000h0M-3Y45
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4827D61375;
	Thu,  9 Jul 2026 00:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1157E1F000E9;
	Thu,  9 Jul 2026 00:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783558410;
	bh=Hf3ZnwbaPwB7JWA6xLw/d7mljky+WZ0YaL8vLXxrCY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lnJag7uhXSbc6gAqfsNjUOEEOISSi4+UVgi9JC4SFD0jTvHaLnTPevSB8a8tUZQDH
	 kvsjr9kE+4qwi65wBBZYesCrZAEfXJ0tAAf200yVQ2i5T9w+F+UGSNhiS1wjf0T0w6
	 xhJXU+zu9z2nq48aFpU6poHXxfzy2Q5Y8lPHJihhtoCNYhex7f4z//pamuHGg53daB
	 tmqjEJ40jtJhkNLWGyaWOSU9XM7gIbE11IbkUpuKoEwAs9ogyLw7GWakjwWUNYymjU
	 pQ0U7ahs/SqweQe+Fjw+LFJk1tGQ/bIdNr5i78WY23qNxO1iqlzUGDU0NKwp+Xa4/x
	 91v6uqBL1M4PA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 01:51:49 +0100
Subject: [PATCH v11 12/29] KVM: arm64: Factor SVE code out of
 fpsimd_lazy_switch_to_host()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v11-12-32799f66db9d@kernel.org>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zkAz4EpB+oD/CW01W7HnqzjEzUv3OlXONmLnbiTh4s0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqTvDD7/Xx9ta5CrALzJXJKvg31N6RsWrYUX7GP
 L1W5TbJcHeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak7wwwAKCRAk1otyXVSH
 0BssB/9aKKli2QQoBIvu8+/YCT5VzaRd5S15Yar5jA128wd/Q1sa9UZPZIjcTi4Rg+1AIcpdmY+
 BPbvEYAPsMsgYY9O4mm392WpF/hLKYOYxxxDGmuIXYpQlyHRc4btkuvHkOBuyl5nUjWwR+L42oM
 GEtLs7Vqq2qt+r88BeyIFOesWfTCn6X+l2RymzdLejcAUuLf9YyUYCtQswNVJpHeLANJ57WYD51
 kuMs7vFqX2YISlEoiNUEy2a88lI7TraWj0hst55SBWC8z8/0hD5YhRG6T7GG083J9y+AkmQclHE
 fqZNXn8Rl98ESs75QbY6FJk8bj+tkjTWJuI1EeWKM3OFFThi
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

Since the function will grow as a result of adding SME support move the
SVE code out of fpsimd_lazy_switch_to_host(). No functional change, just
code motion.

Reviewed-by: Jean-Philippe Brucker <jpb@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 48 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 33729e218c0a..e444f0a94dcf 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -519,11 +519,11 @@ static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
 	}
 }
 
-static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
+static inline void sve_lazy_switch_to_host(struct kvm_vcpu *vcpu)
 {
 	u64 zcr_el1, zcr_el2;
 
-	if (!guest_owns_fp_regs())
+	if (!vcpu_has_sve(vcpu))
 		return;
 
 	/*
@@ -534,29 +534,35 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
 	 * synchronization event, we don't need an ISB here to avoid taking
 	 * traps for anything that was exposed to the guest.
 	 */
-	if (vcpu_has_sve(vcpu)) {
-		zcr_el1 = read_sysreg_el1(SYS_ZCR);
-		__vcpu_assign_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu), zcr_el1);
+	zcr_el1 = read_sysreg_el1(SYS_ZCR);
+	__vcpu_assign_sys_reg(vcpu, vcpu_sve_zcr_elx(vcpu), zcr_el1);
 
-		/*
-		 * The guest's state is always saved using the guest's max VL.
-		 * Ensure that the host has the guest's max VL active such that
-		 * the host can save the guest's state lazily, but don't
-		 * artificially restrict the host to the guest's max VL.
-		 */
-		if (has_vhe()) {
-			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
-			write_sysreg_el2(zcr_el2, SYS_ZCR);
-		} else {
-			zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
-			write_sysreg_el2(zcr_el2, SYS_ZCR);
-
-			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
-			write_sysreg_el1(zcr_el1, SYS_ZCR);
-		}
+	/*
+	 * The guest's state is always saved using the guest's max VL.
+	 * Ensure that the host has the guest's max VL active such
+	 * that the host can save the guest's state lazily, but don't
+	 * artificially restrict the host to the guest's max VL.
+	 */
+	if (has_vhe()) {
+		zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
+		write_sysreg_el2(zcr_el2, SYS_ZCR);
+	} else {
+		zcr_el2 = sve_vq_from_vl(kvm_host_max_vl[ARM64_VEC_SVE]) - 1;
+		write_sysreg_el2(zcr_el2, SYS_ZCR);
+
+		zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
+		write_sysreg_el1(zcr_el1, SYS_ZCR);
 	}
 }
 
+static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
+{
+	if (!guest_owns_fp_regs())
+		return;
+
+	sve_lazy_switch_to_host(vcpu);
+}
+
 static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);

-- 
2.47.3


