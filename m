Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887AAFCB637
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OUbQom3M6QxN9q/HDMi9rRq/1kcdBWytFk0zzWia8CE=; b=KC+v6298/e1VF1/uZ3WQY5WGy+
	AjLfy3NTABtkxI+fH08ikzUrr8/QFds1N6RHF53Oh3NFNWIsPuWJDO3ftm+cfOW/U31iwTUWQEMP3
	yOwH895gtz3A3U/BPpvKCXMpfvSLBbU1cW2jfR/Bt9yEGD3NVJ7kh6L887jLNQQisH6aaq+gz1hxL
	fj8RAzKPWwwUq1f1nLFqdB1g3GKl/EysDndW2TiZyTIhb9n1qrCbmj4y/vWSio527PQ8e8Vw5LBsC
	SdZ2yzRkUzeYdL/7M46hGmPvZMpFcJsnzWiXRwnLd9xR6kpC6FA48NPvXn2+drOBwQ/hXe55WY1jt
	MMOFDMgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgu-00000004DFi-2IBW;
	Fri, 06 Mar 2026 17:10:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYgt-00000004DDs-11Mu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E9F760053;
	Fri,  6 Mar 2026 17:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4396EC2BCB4;
	Fri,  6 Mar 2026 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817018;
	bh=SitDXA7jb0eoqcSylSxaCT4VSP66th+kAnfyQu7Nc1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fSrKxZ1mn4TB92F4Z8i2TjQDAatmhXKaGzMsk10XHve+BT9Gc7pWwH6zjGaZjBJww
	 43yDwO0yAVKXa3jNyuKCXl/VFWAkVrIo6NvnRIxWwgyXsyfT+HhJB2DrYt8XGGNq1N
	 1lpw2HrdsBYxaUMSOSXEWPgd2mGuj6K/4chXuE/R4usQRpNeDXAF3fi9ZkQ5LtRtci
	 CfLH7iL6jwEROuKO6qt4rprIgYKOe2+vSEy6oU+wzz8m9qMDOwmiO4PfjITY/KjwqM
	 jJ/12ylm0toV/nHPoYj/Lhnq+eXUZROTKeEny8gTR5rGgfQXr9ONxHrSmXrQhPMOR5
	 6EgTziWKj5pLQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:04 +0000
Subject: [PATCH v10 12/30] KVM: arm64: Factor SVE code out of
 fpsimd_lazy_switch_to_host()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-12-43f7683a0fb7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2820; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SitDXA7jb0eoqcSylSxaCT4VSP66th+kAnfyQu7Nc1I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpqwoxdwx4Vs/wp9I109pAepIICp+QdG104WOgX
 gOWCAZyCpKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaasKMQAKCRAk1otyXVSH
 0FTMB/9uU5zLItDNiBtK37m3TP/Yc+l7e1bbazjTwvbRJ6dAx2Z2GlrdJBP5i7GzM38ITDX6AxZ
 8134rzDXSHwdwOX8vJhzS4bIPix2W6p/r8UUaGuPSemYfxfV2ldLLXY0VF+J2lT0c8fPQb6fPu7
 Rht8Qdn1wN0vYofqvlIxC0yBZb7xtpOPTsENy+1ihB+xGhRglmF22fjIbfXkmCZl0/qa6Jj0sIB
 kLj58WvCeJX4kgBs9huxif4FY9sJpP/zQs16gUMuZnwfMhB4YN+d3KivkQAXkwYw9Qll9mycSXF
 YfeQIA9FmEsIJcliJxS/PjvyiFvSdjss6sUi/IY+fziQ/3JD
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 46 +++++++++++++++++++--------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 4e38610be19a..5b99aa479c59 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -483,11 +483,11 @@ static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
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
@@ -498,29 +498,35 @@ static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
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
 
-			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
-			write_sysreg_el1(zcr_el1, SYS_ZCR);
-		}
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
 	/*

-- 
2.47.3


