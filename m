Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEEDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 23:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uIaB06tZng9peZX4GAyF9EMCE3RvorRheB3h8LExDA=; b=Bxpve+j3jfM3X+4VlmJ3ktSSs1
	TqtNr4x57i0XmoW4ZBtfNK3n4reNrKVJ9VhHE3cSAziQrkujyB4FCGpsmSeoM9ElWt51ktH2jmJDo
	TDm1M4uXdoQhZOATXnJMdB6OXq5zQ+0L7y3nC7eKjosOcSazdQljHnIdfxIlyY86nBYnRhOnhDeID
	TSBb7VJygHMXOD+wOBvBgPagsB9wpPGqx43pu0VFSZQCp8s1ZKS2X6pq1YyYPXi93cHpaLTyXB6PK
	g0wuQY53igaAV0pfVaND3SUoSVe9RwYV34vq7tEpklGtoLmiO322rw26NYWTSUAN4gcmWWbgv/wG1
	rD0hajDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaf7-00000005T3R-3zIK;
	Sun, 19 Jul 2026 23:11:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlaf0-00000005Swa-3vpI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 23:11:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A363B436AC;
	Sun, 19 Jul 2026 23:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914CC1F00ADF;
	Sun, 19 Jul 2026 23:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784502662;
	bh=9uIaB06tZng9peZX4GAyF9EMCE3RvorRheB3h8LExDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=glRgAns12r4ZtTb+IfvaIncB3CwZ8YtWt5cAQQi1og/rYhiVyWW01tUPMW4S+GdYO
	 Y/29w6lrklV3fHrCoYQHLO6H3wn4EV+x2rqhzixo5jSIC+8ZzB8wmmBwEfY0K9xcA1
	 fh5FwteBF8zc8E1WxwBh1PNz/8pbKxbaxXq86I1rQdQ+OUlG9wlsTsO62Ox6uNajO3
	 ZKHNr/Cz2dR3ie63Zirs/ctbqgD2H+D8MgcyCepuyCCtzllQwz4MbXlYcgrIRiHbDd
	 yqG+Om8RiJWWWF4EQ1fawxb108WcznoXZEfH/EwYEhl1JmJRAM1MGlj3kFt/qkusZv
	 FRIp0UrrG/+Cw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 20 Jul 2026 00:07:42 +0100
Subject: [PATCH v13 15/32] KVM: arm64: Factor SVE code out of
 fpsimd_lazy_switch_to_host()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kvm-arm64-sme-v13-15-d9abd3ffa245@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bJ6/1BPMmH6cmZPVFQnhedk6wX18ttIgJVNhwPNun9Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqXVkzHZ4fRCHElMqfCb5+rQ+Li82PCjHzy8RfL
 AW6xr2OGaKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal1ZMwAKCRAk1otyXVSH
 0HJdB/9MAtlVIPjFw6KwuvU2d3bKxxeGEzGE+PLj2Jxi4YenzXTNyLkRRvrTSujosJY6u/vRjQ+
 6zDxvphe0kxQoQGbM4hd531iZYT34MLqIKyj4IY2zxCHJO6EE8Nm4Abhv4SEb6GuYdD/zGHoA1q
 7BwB7pD/11LyRyYQgs87Yic/LQI2SFTXwyKZAeopVQrcuqL0qJiYoVItpu0FhgO7yxLe6GPdAeP
 Av6teNKTLsokTL9QyrG2QBUEDO/qpSNKC1jI8W37ws+GLFECXhgbrJZpQoJs5BLwsYXwVxqnFfb
 L6SkEBdAvLxHesavtPF6ffpAK8RoXoPlgZx+iLjvGZlobFdz
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
index 35e8d952c7b6..ce586110c226 100644
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


