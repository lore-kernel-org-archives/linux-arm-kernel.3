Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344AFE6B261
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 01:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQPjYFjbIcAmw/vy47XjvylGbXgKpoMyOES+M/yVDZc=; b=Wn00NVTKinucSlwua6HgUdlxIh
	+d5zVivLUqtd9yatDyyuwvMuZ3bmFReX/slkEJoCqWIRghKwKM2MZGY8YboqtGAo2bJvoZfXQRIDf
	USbOtoRMY3RnftSNXEPfyIqAj2wGEe7k16WuPb2Wywy8ZG1iIjZ3ZuxszkygNAmL2gIz7KIe0NZir
	6XeLziRWp8VMAWskY4kf6RXD/npV6T7DJE/arArqo4Fae8fJy9xU2FzdnANJzC3CtNTxCHxC6oaOj
	yMZ30SzsDXcl9kDwrK+JFpHzrICDVseJa5iO/puKKB3rNMDFb8fyhemgwd/tpQh3EJFqQOIblVM8y
	zGEFXoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7v-0000000EN95-1zU4;
	Tue, 23 Dec 2025 01:23:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXr7p-0000000EN2p-0QxN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 01:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xQPjYFjbIcAmw/vy47XjvylGbXgKpoMyOES+M/yVDZc=; b=lqEXUEK1M7JQatoN6lA8FK4Suh
	KIlfObSCrLD67IUaDjxYzR2kKdH48DBhePs2vUkvK2TaZ5zxmZkThPvqCz8QTrWiqIldLF4h9tS0o
	NjEYJmPW00yCkD1iAsaFGMrQI6rJngYF4WWsNqw5v09pZiJzbPadVFERzSBD/WReDmqBCZq9i0tiR
	Ofx4rsurB/zytyDdWKwS442pF75DQR6ux7hDahtzArFWsxwf1XuTYUgjN9r0qFzzb8GZDN/IHOzId
	oxKQqppNrLYuFij2NTfSXryH74ZwLXrzrjiUd0/veFNjNHl4rYiH0wHDZuHkmDmxTSbBxWhXgiIy0
	zea6YdHg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXqGK-0000000Fskf-2FAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 00:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DE5C444D2;
	Tue, 23 Dec 2025 01:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35919C116C6;
	Tue, 23 Dec 2025 01:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766453020;
	bh=I21JH58CR/AbSnYTHYyjog9l03x/hS5CLetpI7AAePU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TDI63LLK1Dd1BykFPpVc3P1jymgU0gE7V7Jfq79W8nXBVnryoXik9MiSeHISYJWso
	 iqEKTBpNSpTY8vUe1lMC7M3DqFprUaOCoghpDgRcaQ/apQHkwkEhtSSCKPwjYSPAjV
	 Q6oa3MzIbx34D1ijUlfgrZ3+pt6SaxE/svxtaVLffBOGZ9J/sEK1h1bVE5lH+SXT6Y
	 ItLdWd3XzoCmoyA8NA96k8dppgPXtTVypxXkHlWVhG3sbDZ8/5gUUB3x4OuUmsz8lF
	 RLUs/9RWms61xzLBp2sYKMs1nTdyT6CWO/IATP6khzWzRaAZf2RQzvBKjxgW73VJXc
	 oUJotCBGyqs3w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 23 Dec 2025 01:21:23 +0000
Subject: [PATCH v9 29/30] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-kvm-arm64-sme-v9-29-8be3867cb883@kernel.org>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
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
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018; i=broonie@kernel.org;
 h=from:subject:message-id; bh=I21JH58CR/AbSnYTHYyjog9l03x/hS5CLetpI7AAePU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpSe6ZT3WxDFPfEe4BoCZZTNsMTuw5J7xSE+tTa
 Kmv0qg+FySJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaUnumQAKCRAk1otyXVSH
 0MA/CACCkH772PTG/2cJD7n0eyuJAn8ayWPMc6UNVuPIbnw1VvkAHXSJua/tE7V2+I1eNywUt2e
 pA231uFEmuh9U2Y6d0sb5W9L9K+Oy8kjQefNK/pbaZF2e0R5oEWc+jHgWcPzNj5z9r6qaz5Ne+c
 6+UEzIJyvS6TIop3jGeSrcXeqptOr8td52Z2M0WWURsA03BIDpd1xNd+yVw4aHi6qTphgsODZ1s
 6OZeAxZhqrHu4y5N3ssTpQjiGFesV+2QhchBxbA+8aiumfc4ci18jbU9OXKN2qZWMEl9Vwk/+BK
 DhKMtrPx1XA/2ePHIWanby31qExFiyZ1phJO8hFZGjQr5Ylh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_002828_943797_057DF49A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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


