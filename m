Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAACCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrk5fIm3V3FRARvlikIPKelGf1Tql/u2TT8O6cc6xNM=; b=prxCgjdUVukG/HSyTZ5CQprWta
	B4k0FhK+cEvL3HG9c9V5D39OyAhD33l1/zpQPOgtcKzAa0AH5z5ryXAKPWOxCrzyAuJPBm+HWaz69
	tfC+v6EaAQBLy+SPM/ieU0XShgfHnfVSwRZhoELnnBh45WyWnpmnREb2IjTTg+lfGV7GmsHg5/qBq
	/a4yGfnUktaz691Totuv78e0qKvCVvEPmO6vS+nmxomEt+ArD43yhOXtemBSsYcFZ6/qpw5ik43oP
	XZ9nYSIJF1/g0GJflD3tSr6f6W0yvGmDozfVxwcKjZVKglkLRNJnnEJTyZQvwxqHvWk707GjUcEfQ
	iaGM4IrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1rD-00000008qpf-2i8e;
	Fri, 12 Sep 2025 11:22:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1rB-00000008qmV-0EZs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 773BF60240;
	Fri, 12 Sep 2025 11:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC14C4CEF7;
	Fri, 12 Sep 2025 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757676140;
	bh=2Z09lyzr3mlySMGqqjLAI9Q8pohqjxnIJ8nt0XVxnnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L34ZYKvkzUB5+9nv8Ow5OWUHNFysI8goeM6YczMJs91QTuZ9ENhdQBw/sQZxbcqIA
	 GGj0FoaBJlU+Apn+Ir0QqMi0GIx3V2TWDtYMsJruNdyPq6fOqEbAjx7rcQKsBL4eB1
	 ZfAJbaAPcf3GMZbfEsEvUk5Jj0DDZ6JTNOecVh3+BDkQLJjcF773MbmzCwCxMjxqhC
	 TG5dd72VwSu7XRSYD0qKQzSZ+du6M4Hsfpq/uXQ/VcdSndSUevVNIBaR6ryzK3pNld
	 NUkps7GD7ZPpazktK1Lm6xQVSu4UeJVJtUF2+0u/5o0BsfelP33i5UfMQcHxmHzpJO
	 uEEFna+EHHPWQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 12 Sep 2025 10:25:32 +0100
Subject: [PATCH v16 6/6] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-arm64-gcs-v16-6-6435e5ec37db@kernel.org>
References: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
In-Reply-To: <20250912-arm64-gcs-v16-0-6435e5ec37db@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2Z09lyzr3mlySMGqqjLAI9Q8pohqjxnIJ8nt0XVxnnw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoxAJY4+SLnStXXvVFpBNYWlP1+VGHPxHvlmN6M
 z611HojkTCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMQCWAAKCRAk1otyXVSH
 0CORB/97WmwBUUlxAL6LjWlqWHp9V44CpCGTC8Lhk6gOOTvNi+TUCs5aGaKAmuFUa6SKHkaOBSF
 EKWdDn7SfL8jcvcmmZu0fRFASR0rW40r76P/++ZuDCMg1UJhJAtQ8PENu/BIsrwqpjsyVoCsmyJ
 kTsrJZQkxq5KFPxlIVNtb85ZEaLZEV5IN+y5tLS0jVoN7drGvdySNw56qL+pfuwJTmpzfYRahF+
 nkLZR9oDmz6oCZoMui8A5bj0hErIFgI/AHAgYXUULilLRnwZ32rMPmmfSuKzXnt3Gp3A/dWTmHa
 BJHd3LjzUSlDY50YlZs6fq3uO0Jy5Vi7H7qbcCd9ny+3TQuK
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

GCS adds new registers GCSCR_EL1, GCSCRE0_EL1, GCSPR_EL1 and GCSPR_EL0. Add
these to those validated by get-reg-list.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 011fad95dd02..9bf33064377b 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -42,6 +42,12 @@ struct feature_id_reg {
 static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(TCR2_EL1,	ID_AA64MMFR3_EL1, TCRX, IMP),
 	REG_FEAT(TCR2_EL2,	ID_AA64MMFR3_EL1, TCRX, IMP),
+	REG_FEAT(GCSPR_EL0,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSPR_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSPR_EL2,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSCRE0_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSCR_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSCR_EL2,	ID_AA64PFR1_EL1, GCS, IMP),
 	REG_FEAT(PIRE0_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
 	REG_FEAT(PIRE0_EL2,	ID_AA64MMFR3_EL1, S1PIE, IMP),
 	REG_FEAT(PIR_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
@@ -486,6 +492,9 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 0),	/* AFSR0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 1),	/* AFSR1_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 2, 0),	/* ESR_EL1 */
@@ -502,6 +511,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
@@ -740,6 +750,8 @@ static __u64 el2_regs[] = {
 	SYS_REG(PIRE0_EL2),
 	SYS_REG(PIR_EL2),
 	SYS_REG(POR_EL2),
+	SYS_REG(GCSPR_EL2),
+	SYS_REG(GCSCR_EL2),
 	SYS_REG(AMAIR_EL2),
 	SYS_REG(VBAR_EL2),
 	SYS_REG(CONTEXTIDR_EL2),

-- 
2.47.2


