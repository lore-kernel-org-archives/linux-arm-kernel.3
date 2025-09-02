Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CFDCA100B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hpJCP4Yb9jJ5TtpK55O7RZCN5fRjMcmPpd3/oJGfRI=; b=daInEFd1RNndgramLwZOvB/+Z4
	tSDCReA06Tac+8Ntsu8lnnjFzJrB3cKYVdGZibf/784zUfA2cpychNTNEb8tTNlueaKmVAWwcOYqv
	bdEZTykQZxeZT2AHYjwD3gVumGtp46QRlORmsIbtyvfE+PJ/4NSfIsQBK31Mujz0TaBe/v6CsgrPf
	icrgLhrWQ8SLXqv04JYu8fmsKmI40sL1oW2hS4I6GmNYzy3Qtdlk4SnRIGYFV4VVWk0kfjy17mZav
	frUNsgA2UDM42gMN/cdxEH4t9WYU92bhdBFD0Q+CyR79wqguw560L1UviqyX1tDmU0QIQXuoqIdor
	7Jj+aZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utS3o-00000000NJR-0rBS;
	Tue, 02 Sep 2025 14:32:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPSz-0000000GzUZ-09J6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:46:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8FBD41906;
	Tue,  2 Sep 2025 11:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89B9C4CEF7;
	Tue,  2 Sep 2025 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813584;
	bh=ZvTUw7NPQ0p4ee6PuzgOvjpUagMHBpEvC3cvgofAwS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bc4vHW5j0aU/ug6ixQ7oHK3aJua06rmW47TykIiel63W16Bgpu/Nz3UjG7O3D+mKW
	 4S3KTeIVDTzSiFnmdW4lRV1eM5vNKOC0JO9LJmQNOJxyZgfCflIaT+d8ijeM+KSXVx
	 KWTAZgMzk216ydJLEuq0Y0Cig3EhRZgTGmrZ0o1hfDul4TIncooiTq97n5GOrCvzPO
	 RgohlY77yiPyp6spAJaxj7eGqUHqH89ZxkF6zZi5X+LOKe1vXAZ1TSZAOOER4+zvDV
	 t7wTB9Q2BDciSM6r+xyfYfG4KgrcZ1Tf+Nu+Oha2kxP4u4PKnGQFpxRMFJ/G277pUc
	 2DBw2R4k0IVog==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Sep 2025 12:36:31 +0100
Subject: [PATCH v8 28/29] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-kvm-arm64-sme-v8-28-2cb2199c656c@kernel.org>
References: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
In-Reply-To: <20250902-kvm-arm64-sme-v8-0-2cb2199c656c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZvTUw7NPQ0p4ee6PuzgOvjpUagMHBpEvC3cvgofAwS0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBottiP+BCS2rKN2diVP5zrkIThPt+KUFpUrWdiS
 H6AIXh56HqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaLbYjwAKCRAk1otyXVSH
 0CvVB/9qsmPU1KQh+8uEw3/lbl3fbYfi9MErtSdNtzyMMXbTaIqDlW6l+ODst140lnzuCkHERh2
 oJbA+C+/peIm/+8m+uutO0tjlR7nBhhnrQoon8jaojMtb+PgSgJmJe+yTnAWbxjwScE3Z2sf85H
 udBrYF3KTFxZo+XuxcwnwciDYsC9Alep1/mz5sVZ/lrhXaIlaSYKhByM0L1+mhEAORzJ6o9muro
 ZzSIb73EJ9KeB32TzlRcLi9n5Mg14s7nXzEEMk3+aiwZ8sY6Xo/Pw8NGAzNOlurSxBGlSztfHIy
 5q6+uISsTSpYJIq90iWXBobce9Ngb3+F8vgYCBKEx8RxTRaB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_044625_114265_8FD8A300 
X-CRM114-Status: GOOD (  10.60  )
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
index 011fad95dd02..54b371330f57 100644
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
 	REG_FEAT(VDISR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
 	REG_FEAT(VSESR_EL2,	ID_AA64PFR0_EL1, RAS, IMP),
@@ -351,6 +357,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 0, 0, 0),	/* MIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 0, 0, 6),	/* REVIDR_EL1 */
 	ARM64_SYS_REG(3, 1, 0, 0, 1),	/* CLIDR_EL1 */
+	ARM64_SYS_REG(3, 1, 0, 0, 6),	/* SMIDR_EL1 */
 	ARM64_SYS_REG(3, 1, 0, 0, 7),	/* AIDR_EL1 */
 	ARM64_SYS_REG(3, 3, 0, 0, 1),	/* CTR_EL0 */
 	ARM64_SYS_REG(2, 0, 0, 0, 4),
@@ -482,6 +489,8 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 1, 0, 1),	/* ACTLR_EL1 */
 	ARM64_SYS_REG(3, 0, 1, 0, 2),	/* CPACR_EL1 */
 	KVM_ARM64_SYS_REG(SYS_SCTLR2_EL1),
+	ARM64_SYS_REG(3, 0, 1, 2, 4),	/* SMPRI_EL1 */
+	ARM64_SYS_REG(3, 0, 1, 2, 6),	/* SMCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 0),	/* TTBR0_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
@@ -502,9 +511,11 @@ static __u64 base_regs[] = {
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
@@ -713,6 +724,8 @@ static __u64 el2_regs[] = {
 	SYS_REG(HFGITR_EL2),
 	SYS_REG(HACR_EL2),
 	SYS_REG(ZCR_EL2),
+	SYS_REG(SMPRIMAP_EL2),
+	SYS_REG(SMCR_EL2),
 	SYS_REG(HCRX_EL2),
 	SYS_REG(TTBR0_EL2),
 	SYS_REG(TTBR1_EL2),

-- 
2.39.5


