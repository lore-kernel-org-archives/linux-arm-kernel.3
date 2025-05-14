Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FE2C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPaU6rqs1+LcoYxQsU9r6svewsgP725uz2JN6EbiZ7o=; b=ut1da1LIPrqGMjot5VyqxU45s3
	8+xBrnzwQHOCJuBiBbaGnaMB8CMicHvYb5TIgzFAVbtsraIKOwR5r+1nEiwLWOPwjJSNRsXkXgyUB
	+MqPVfX8zXKTHa7YzbtXqOa9lPhhcXf4UCDY4/KroCSwbIpp2tJp4HdANVZuZY2NIc2fV0fEED+JL
	5ZtUqlEq9PgjZkh+NT3yjy0SZL6gtWiZHsiYnzVQLInF4HDhnNvKefXFf1ywLv7td9cXEiuRTk03e
	IYIUDXa8w1bJ/W6OIia8MULsWASlhLhUvSN0bFTw+hHhEhpheVMt1ozzYXx6eGbSowBA6FfxUszUZ
	KXBLK5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXv-0000000FHB9-2Mrd;
	Wed, 14 May 2025 13:53:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9S8-0000000EnoS-1Zho
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4998A5C5A93;
	Wed, 14 May 2025 10:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CD6C4CEF1;
	Wed, 14 May 2025 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747218907;
	bh=DMiRL11JjPSJeeXI/o7QWutOd3dtKmaSpTXC8NGHW0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZqIAjQm4LERBpt7yKx3yQEdW0wvTl7M6r2AaAPL9LpCc64QorKdx/jOAplEHFuov
	 U2IUkGAVwX+SnYs6tglGEBThxlpCsV6UJ9t+eZBmAh/iD0XNG3UDfyAfwY23NHneso
	 uoxOEUL6nMiv3KfbIGdCQQ66gf/pwpU9xYoE5TNGpsOOafrz9TISBjH1bZCX6RF8Rk
	 pNgx1iUmYMU7MJFZIhInW62HbgDHFZfbZPKPSKICjBlI8BEmnii7LqrsFprA//jlVw
	 YrcMcNmqQRbBH55lXBEVKrLwbMMyY0/mzdzb1iQr1ri6e//HleVXWDqCjF+JC7iPue
	 JONyxDzMdfE5w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uF9S5-00Eos3-Dv;
	Wed, 14 May 2025 11:35:05 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v4 06/17] KVM: arm64: nv: Don't adjust PSTATE.M when L2 is nesting
Date: Wed, 14 May 2025 11:34:49 +0100
Message-Id: <20250514103501.2225951-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250514103501.2225951-1-maz@kernel.org>
References: <20250514103501.2225951-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_033508_534260_F118AA97 
X-CRM114-Status: GOOD (  17.73  )
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

We currently check for HCR_EL2.NV being set to decide whether we
need to repaint PSTATE.M to say EL2 instead of EL1 on exit.

However, this isn't correct when L2 is itself a hypervisor, and
that L1 as set its own HCR_EL2.NV. That's because we "flatten"
the state and inherit parts of the guest's own setup. In that case,
we shouldn't adjust PSTATE.M, as this is really EL1 for both us
and the guest.

Instead of trying to try and work out how we ended-up with HCR_EL2.NV
being set by introspecting both the host and guest states, use
a per-CPU flag to remember the context (HYP or not), and use that
information to decide whether PSTATE needs tweaking.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/hyp/vhe/switch.c   | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e98cfe7855a62..12adab97e7f25 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -654,6 +654,7 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_HAS_TRBE			1
 #define KVM_HOST_DATA_FLAG_TRBE_ENABLED			4
 #define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	5
+#define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		6
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 731a0378ed132..220dee8a45e0d 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -53,13 +53,23 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 	if (!vcpu_has_nv(vcpu))
 		return hcr;
 
+	/*
+	 * We rely on the invariant that a vcpu entered from HYP
+	 * context must also exit in the same context, as only an ERET
+	 * instruction can kick us out of it, and we obviously trap
+	 * that sucker. PSTATE.M will get fixed-up on exit.
+	 */
 	if (is_hyp_ctxt(vcpu)) {
+		host_data_set_flag(VCPU_IN_HYP_CONTEXT);
+
 		hcr |= HCR_NV | HCR_NV2 | HCR_AT | HCR_TTLB;
 
 		if (!vcpu_el2_e2h_is_set(vcpu))
 			hcr |= HCR_NV1;
 
 		write_sysreg_s(vcpu->arch.ctxt.vncr_array, SYS_VNCR_EL2);
+	} else {
+		host_data_clear_flag(VCPU_IN_HYP_CONTEXT);
 	}
 
 	return hcr | (__vcpu_sys_reg(vcpu, HCR_EL2) & ~NV_HCR_GUEST_EXCLUDE);
@@ -568,9 +578,12 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 
 	/*
 	 * If we were in HYP context on entry, adjust the PSTATE view
-	 * so that the usual helpers work correctly.
+	 * so that the usual helpers work correctly. This enforces our
+	 * invariant that the guest's HYP context status is preserved
+	 * across a run.
 	 */
-	if (vcpu_has_nv(vcpu) && (read_sysreg(hcr_el2) & HCR_NV)) {
+	if (vcpu_has_nv(vcpu) &&
+	    unlikely(host_data_test_flag(VCPU_IN_HYP_CONTEXT))) {
 		u64 mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
 
 		switch (mode) {
@@ -586,6 +599,10 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 		*vcpu_cpsr(vcpu) |= mode;
 	}
 
+	/* Apply extreme paranoia! */
+	BUG_ON(vcpu_has_nv(vcpu) &&
+	       !!host_data_test_flag(VCPU_IN_HYP_CONTEXT) != is_hyp_ctxt(vcpu));
+
 	return __fixup_guest_exit(vcpu, exit_code, hyp_exit_handlers);
 }
 
-- 
2.39.2


