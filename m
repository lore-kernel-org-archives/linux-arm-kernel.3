Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2651C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PurQYqXf08AEX6gtFWKWTzYSPvMtTxS5SqC4IO0OrWI=; b=Amcc3jIOo8/svLNJQp5AyD2q3R
	UKt0iLs3U0PnXeAl9A5sUP5J5TNR7UJ5koZF3FX0N80e+e+yAGIZeIXOQRDzCRoucA6vicFKuf03y
	pVtGbnHPRzMqdInO7Ot633wUNvhw4lzo19aVFrMF99cf/CPGfxriW7LBZjXeJ8VOVqcAe4GOU89pW
	8G1Pvb64dNo3fw7WwvTGhxLVnHmYMd29URFJmg7ALHl6DN0+2jC6bsTTMeEouRCNLRLLWCNHY0A2H
	HPpCTE9FjJ7QaNvE5RmG3rHLeEUqfrxGDRI0+apQ+FN+bVCwKToE+IWCl/eUVuWIWNxECpdH4g418
	j50b4F3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1r7-00000000ewA-096Q;
	Mon, 03 Aug 2026 23:14:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1r4-00000000ete-2KGD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:13:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC2E560A6B;
	Mon,  3 Aug 2026 23:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54921F00ACA;
	Mon,  3 Aug 2026 23:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798837;
	bh=PurQYqXf08AEX6gtFWKWTzYSPvMtTxS5SqC4IO0OrWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PqFyFBEXOtA9ykVatWA7QWgJvfFoCflpRnJCx3zRbm2r+K4GHkvkYSbYke9XHENYP
	 LtlVK3eHuW/9p4/SR2atP0seGGwkT9dihH7Jy7/6Sj2Z4He2aKUFON67t14QLh5/S2
	 UB2PsHUMBcnuBDwoVmG6sZWd2HMD1Ms1twvSTx28hPDgXeAtols2S+ffhaVWO03mku
	 t8kAKK+XRsW1y9cCfl3epCnnCWoXWI/KZRG9M1r9AKlNOKmzaWcYG2ektoZWBIbKhk
	 Hhu2Y/qL4ieSx800MT50dgwzKpMhPpfIAcrkSNShCVfZMzL6UIg7ZUt5dO/AQ5s3Xi
	 uLjL+LGfmmxcA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:49 +0100
Subject: [PATCH v18 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-4-fd8c40f5ad88@kernel.org>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
In-Reply-To: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bEpjQNbOqRXEgxmuuFHddb+wqn5p6+xc/jGJ7dQCByg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCcvNjLB4tkEjb/xUFQG1hdPElFCuRE4NDXo
 PbihH5N34mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgnAAKCRAk1otyXVSH
 0OFhB/94zXmoRtkIdaIqQ0+NWyxasfo5LNxSjiS4EmEjobzqgEto+1z7mMO7w7Yguq02tALAYLQ
 EWuUu6sp+mRa89RJ8KMkWoLzKu6dz5Eyshc3g2V/0yUQOX9WnhU8pwqCaINqdXsdO4xwfMmj1IY
 AvVVrmIxkQuyu9tC2Od4syd6HG8EdRBosoW7ACdTnsOrgk8SDfusTdlGMqqZuY36YlJ2P7ajeEE
 Nan/zyd70GGaIBg3yRyK6v4Usc0HmO2y/8miRxbWQEzLvwcYdldXZuLrvokAPvuzht1zgDsl+QZ
 myqmBEvVh/O9XWzy9fiNfHgIMwm3BLR0AMK7I+Hfdt0cy9Sb
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

In order to allow efficient implementation of GCS implementations are
permitted to do GCS specific caching, with barriers implicit in stack
switch operations and GCSB DSYNC as an explicit barrier.  Since we do
not use GCS in the hypervisor or host kernel the hypervisor cannot rely
on any barriers being present in vCPU context switches other than those
it explicitly inserts.  Add explicit barriers when loading and saving
vCPU state.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/switch.c   | 13 +++++++++++++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f3..fe8727bf2833 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -301,6 +301,12 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	dsb(nsh);
 
+	/*
+	 * Ensure any GCS memory effects are visible to this CPU.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	__kvm_adjust_pc(vcpu);
 
 	/*
@@ -345,6 +351,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	dsb(nsh);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	__deactivate_traps(vcpu);
 	__load_host_stage2();
 
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 2431c18f5792..4594992b008c 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -239,6 +239,13 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	if (vcpu_has_nv(vcpu))
 		dsb(nsh);
 
+	/*
+	 * Ensure any GCS memory effects are visible to the incoming
+	 * vCPU.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	/*
 	 * Load guest EL1 and user state
 	 *
@@ -299,5 +306,12 @@ void __vcpu_put_switch_sysregs(struct kvm_vcpu *vcpu)
 	/* Restore host user state */
 	__sysreg_restore_user_state(host_ctxt);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	vcpu_clear_flag(vcpu, SYSREGS_ON_CPU);
 }

-- 
2.47.3


