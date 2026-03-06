Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE3FFCB638
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQPjYFjbIcAmw/vy47XjvylGbXgKpoMyOES+M/yVDZc=; b=fKLZHpT52jynS23OGgMQRIfi3U
	qoCozfr10FEOet6Wuk0SyjmAVVA198WhDjicsE4u82q15qKcvFsaBXNYo3uDPcn2fdVQD7ORNA26L
	vImOKcWgt79HEg5w6hmdLbLnYM3t9qNDlXmcTfRUq3F18gt/ujfa4fMZzOI01CPmEj9aS1eGYE/wU
	4i+YGmDYcra29SO8gw3w9cs+L4opzfrW85QEwMBM34+CFtdm2iZRprwJWndyU9LNopXXkLSt5TdQo
	rADSaOGwdQIOXuSajuAIkQwuSGfd2FrASAnnv2bEVES7daSsFvtTQtGfykT/sUxv+378k29SGR99+
	GH2ixJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYi7-00000004Edp-3LSW;
	Fri, 06 Mar 2026 17:11:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYi6-00000004Ebf-1c82
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:11:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF9D860018;
	Fri,  6 Mar 2026 17:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C454C2BC9E;
	Fri,  6 Mar 2026 17:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817093;
	bh=I21JH58CR/AbSnYTHYyjog9l03x/hS5CLetpI7AAePU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N7YLlyNLgtbaiW7ha3XjAdlD7VpU7NJTF2zcfcdtTPovQYADqIGwE1eVGSIaVw+Ye
	 kXMOf150yVkaJ9QTcSvmcukEDgxsilq4V/w/nWKSLqtBG2p5ECq1OVL8MGQaMPcBMa
	 oTlw35ew8wmnExdd9SRYTSfU5WUmkMpA+3qFuD00xEXeq4MTEiU7jmAT7SOMvtAmi/
	 wL1EOz3HQoVevFFTY6FVLlnpt+/jwTfmNxsPMSgJpSoyaJvKB7l0IyJxnpaOEAQ02L
	 rNQTrtYLq+/zopfv/EegX7P1Zd7kWoeVGcKtj8Zk7bv3TG28y3EpUBPYldLb3Vqn1S
	 r5c/P52HypuEQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Mar 2026 17:01:21 +0000
Subject: [PATCH v10 29/30] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-kvm-arm64-sme-v10-29-43f7683a0fb7@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018; i=broonie@kernel.org;
 h=from:subject:message-id; bh=I21JH58CR/AbSnYTHYyjog9l03x/hS5CLetpI7AAePU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhszVXPYxP0vPWJerJQp1NrPbO5dFf7Jn4H+kHO3etesJQ
 +GzhYadjMYsDIxcDLJiiixrn2WsSg+X2Dr/0fxXMINYmUCmMHBxCsBEVtxh/++W7jfFv8hL8ceL
 /DDmgOrMo7eZXzwwmPN54/H1mflcaiHWZmfS6i7xLtg2m1/WoWvLqiiZ+sXHpN/Fs7rnsm2P32n
 vHBz7IXb/r2PhsXn6h+8rygSqbKzYJe9q8fdzckrmplDDuUseGfwSN92ZZH69+kWDri7f6tajT9
 3cX9jHKoikvuP52VbRFLHM+8+MHWrME55qOsWJOKn/UDlqWvOzv+RJub1e6uOVNceL7vY9Tpv5+
 UOBn7iFkKX+pZtnPF6z2Hkd3C3r+E/tc91cNt01rJa8kdX5wdXq7qqclt+WHG7I/bPC8dDmnX7C
 sTdk+HWtJ150DZ6iz/506rab2/NVk27o5TcEtrb9PMMHAA==
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

SME adds a number of new system registers, update get-reg-list to check for
them based on the visibility of SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 0a3a94c4cca1..876c4719e2e2 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -61,7 +61,13 @@ static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(HFGITR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
 	REG_FEAT(HDFGRTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
 	REG_FEAT(HDFGWTR2_EL2,	ID_AA64MMFR0_EL1, FGT, FGT2),
-	REG_FEAT(ZCR_EL2,	ID_AA64PFR0_EL1, SVE, IMP),
+	REG_FEAT(SMCR_EL1,	ID_AA64PFR1_EL1, SME, IMP),
+	REG_FEAT(SMCR_EL2,	ID_AA64PFR1_EL1, SME, IMP),
+	REG_FEAT(SMIDR_EL1,	ID_AA64PFR1_EL1, SME, IMP),
+	REG_FEAT(SMPRI_EL1,	ID_AA64PFR1_EL1, SME, IMP),
+	REG_FEAT(SMPRIMAP_EL2,	ID_AA64PFR1_EL1, SME, IMP),
+	REG_FEAT(TPIDR2_EL0,	ID_AA64PFR1_EL1, SME, IMP),
+	REG_FEAT(SVCR,		ID_AA64PFR1_EL1, SME, IMP),
 	REG_FEAT(SCTLR2_EL1,	ID_AA64MMFR3_EL1, SCTLRX, IMP),
 	REG_FEAT(SCTLR2_EL2,	ID_AA64MMFR3_EL1, SCTLRX, IMP),
 	REG_FEAT(VDISR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
@@ -367,6 +373,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 0, 0, 0),	/* MIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 0, 6),	/* REVIDR_EL1 */
 	ARM64_SYS_REG(3, 1, 0, 0, 1),	/* CLIDR_EL1 */
+	ARM64_SYS_REG(3, 1, 0, 0, 6),	/* SMIDR_EL1 */
 	ARM64_SYS_REG(3, 1, 0, 0, 7),	/* AIDR_EL1 */
 	ARM64_SYS_REG(3, 3, 0, 0, 1),	/* CTR_EL0 */
 	ARM64_SYS_REG(2, 0, 0, 0, 4),
@@ -498,6 +505,8 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 1, 0, 1),	/* ACTLR_EL1 */
 	ARM64_SYS_REG(3, 0, 1, 0, 2),	/* CPACR_EL1 */
 	KVM_ARM64_SYS_REG(SYS_SCTLR2_EL1),
+	ARM64_SYS_REG(3, 0, 1, 2, 4),	/* SMPRI_EL1 */
+	ARM64_SYS_REG(3, 0, 1, 2, 6),	/* SMCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 0),	/* TTBR0_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
@@ -518,9 +527,11 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 4, 2, 2),	/* SVCR */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
+	ARM64_SYS_REG(3, 3, 13, 0, 5),	/* TPIDR2_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 0, 1),	/* CNTPCT_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 2, 1),	/* CNTP_CTL_EL0 */
 	ARM64_SYS_REG(3, 3, 14, 2, 2),	/* CNTP_CVAL_EL0 */
@@ -730,6 +741,8 @@ static __u64 el2_regs[] = {
 	SYS_REG(HFGITR_EL2),
 	SYS_REG(HACR_EL2),
 	SYS_REG(ZCR_EL2),
+	SYS_REG(SMPRIMAP_EL2),
+	SYS_REG(SMCR_EL2),
 	SYS_REG(HCRX_EL2),
 	SYS_REG(TTBR0_EL2),
 	SYS_REG(TTBR1_EL2),

-- 
2.47.3


