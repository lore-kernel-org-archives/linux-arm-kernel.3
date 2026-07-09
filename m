Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16829C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQPjYFjbIcAmw/vy47XjvylGbXgKpoMyOES+M/yVDZc=; b=XQbb41wvE9OlCBMa3parpuKefy
	irRhuXzjvE5xV1zoF8gX3dNwlRXRrpOxztQ5/o3GxIhMjxZb54ympn1/E3eB87FykocXWAeiJrnnu
	yNWag1v+J8T1nR5Mk/jzlR0Te38xdx3tCVhws6v6X84KS4gNf/biMChs+rnvtpoSVJx1E/cjrP+27
	bBeeM00G8rEdcCey6q4krFiXEBC31IsVmwQm4/aiWwSb26lWSs+0dWZ1Ff/s9zSbJO/lfoX1lSZn6
	K9QnDCglCj2zMgxGcFiy69B1pOfRxQVenY4onmoHyUtEebToQbLpPkRfsN6S+pA1tsuvtsLdihxnF
	iChiVnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthO-00000003HEK-3uh7;
	Thu, 09 Jul 2026 18:42:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whthN-00000003HD4-48I6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B37B042E7B;
	Thu,  9 Jul 2026 18:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8D21F00A3A;
	Thu,  9 Jul 2026 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783622533;
	bh=xQPjYFjbIcAmw/vy47XjvylGbXgKpoMyOES+M/yVDZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mp2e3TOyU0qf8B0utPd31uLKeDkSJAopKBFAr7y9816HDNRy++VF3Xw6hawK3Vhry
	 oCqyqtRLIf41Xi3eLVRW0eh4LmjB+QbLkX7/jAJxoKMwFdZIr1En/K9kcHJ8/DlIMa
	 oG0N8MK/MlOmX2D5rYoZOYhKO/WBGdlCelDgNpYId+UQCTr3xwxtWqOri2rSLGf2Vj
	 mf+DZ1fj/uV3iV6BNRzm2gTvr9ewEIDRfiqTA7j1SIi1nw1BT5jtiQoTbyW7BGpW8N
	 GI+gPXu2U0mLGkPxjl4x5+dSzRhQuH4qMEKxW4jCWodGDtUC5Qs9Efn2yPyTDq4PwK
	 5GBzJLCHV3BiQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2026 19:27:49 +0100
Subject: [PATCH v12 28/29] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-kvm-arm64-sme-v12-28-d0301d79ef58@kernel.org>
References: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
In-Reply-To: <20260709-kvm-arm64-sme-v12-0-d0301d79ef58@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018; i=broonie@kernel.org;
 h=from:subject:message-id; bh=I21JH58CR/AbSnYTHYyjog9l03x/hS5CLetpI7AAePU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT+sAMVuyitVIErsyHz8wft0/Wir8nS9UXHxOl
 yYG/UokqK6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak/rAAAKCRAk1otyXVSH
 0PPyB/0WSEKAeDdFKHMTED/YdtTHZkRiC3h/jR+8I+KrktMWuG59XltiylEFmja1/wONl+CgIk/
 5Qs70H1b9OQtgqdsn/x3rG6WSgvBe2ZJyGbWSbWfiPUG1nnoE4ZgnT/0vu3TR+Y2m27EYGkYXYL
 LSgE7FUXiFqyFSpJB8Jdssn7ler/gxhUxz4l3knVkOPFAvKYaJ3BeFvk2tvdmKM2EUL7BY0EsmH
 9MOg+DZPlrG184g9njSs9j/bJADhoF3D3NEGWrpepfkD37YveYDUpM1Y8iW4Lubi5GGT6Q7/4Ub
 EegUhTx+9MN7ytSoIjmS+v9yjtvoOwlZ4AM42VMc+bHcbKse
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


