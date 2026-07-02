Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA3C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4295tykVcUmOhUIFRdTHsRo0fGF1FYPbLW1hKxstTA=; b=o5bP+XSdCuBXRs/Cmi6XAkI9qs
	ORaTHizIP6Nzpj8YpYqU1YIEVG87segAxkl4E8c98eoonQzb0W08TPdim0Glsf0q40AfeOCi144Bb
	Gm1qoVVvR/hyE0A9wNm1caFEk+aMcIqY4/PrPDHBFOQKd2M2DVbrRo0kHuuYx/WinVaEGZ9zxe7O1
	wnADzv6QPbjTZ/2XDl6sEgQWctSPo5RQ+cK/4GKfVEYa+U1aXJm4FKrT0oYGj6dXs/KyiBT7A3MGk
	8LZDSl/Fo173668st6mujIiR+iQzWwwHg9R9+QmVkoT8MPiGjJLvxXtG9QPdh7b0giyA49zZvHCJj
	VYfi6m6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsd-00000004uT5-30bU;
	Thu, 02 Jul 2026 16:03:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsV-00000004uCr-20Hp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 50825601F2;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B0D1F01559;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008183;
	bh=h4295tykVcUmOhUIFRdTHsRo0fGF1FYPbLW1hKxstTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NtdHDAdHF+5VBiYhaIYgCwFUjF1/KA2q/TP3+2l79LjpjJHEyJeNRRdYkhzxcQr7o
	 BCDrz8qZgg1mVRNHDoQ2M4B+D38awPW8byeEcwQZIAzYxUJ098URS2sYsBvcqT7Ic/
	 kXl49N3CntHCt5g0hKyENIbP9EH/+qXYLefHsblvB0fpITkVFkEt3jCIo9TobY9IQ2
	 l4kvu9yrr0imYvX01x32UTHfqK9/jeYheCVnQiMww0q1qz6CkgmhJJKgkKvkh4neHd
	 XYq6vmkDAxvF57WJEZwceBn93ot1j2km8Qcrd7b3nxDQOIqK2ERIrG4hpA7ZP14XO0
	 l8PhTwVnm+ZTg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsT-00000000ojd-1TPr;
	Thu, 02 Jul 2026 16:03:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 16/28] KVM: arm64: Split NV-specific exit fixups from the non-NV handling
Date: Thu,  2 Jul 2026 17:02:36 +0100
Message-ID: <20260702160248.1377250-17-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

In order to facilitate further changes, move the NV handling of
early fixups in its own helper. This also makes the code slightly
simpler to parse.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 361d3f8344dd8..8268779df4fa9 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -537,18 +537,15 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 	[0x3F]				= kvm_hyp_handle_impdef,
 };
 
-static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
+static void fixup_nv_guest_exit(struct kvm_vcpu *vcpu)
 {
-	synchronize_vcpu_pstate(vcpu);
-
 	/*
 	 * If we were in HYP context on entry, adjust the PSTATE view
 	 * so that the usual helpers work correctly. This enforces our
 	 * invariant that the guest's HYP context status is preserved
 	 * across a run.
 	 */
-	if (vcpu_has_nv(vcpu) &&
-	    unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
+	if (unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
 		u64 mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
 
 		switch (mode) {
@@ -565,8 +562,15 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 	}
 
 	/* Apply extreme paranoia! */
-	BUG_ON(vcpu_has_nv(vcpu) &&
-	       !!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
+	BUG_ON(!!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
+}
+
+static bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	synchronize_vcpu_pstate(vcpu);
+
+	if (vcpu_has_nv(vcpu))
+		fixup_nv_guest_exit(vcpu);
 
 	return __fixup_guest_exit(vcpu, exit_code, hyp_exit_handlers);
 }
-- 
2.47.3


