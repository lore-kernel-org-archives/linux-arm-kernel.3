Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4259AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1gqXttxxv4I/eM7KF3Ifmi6aCVSqtU7pNc3Bd0EDys=; b=RHqbn26Sf67+mpqaMiSYABgejh
	Tf6tj5nwYAdKl5+NKqQnQyFe2tTNXkzJTM2COIGakC2Jx+E1AOyOuSr8lC0DKPSfn4+wqqpH/QF02
	h3udkDQdthsAoPuFBgLlx7YN6Xk+XFHjfbKNm7pG3hzPnXsNKzKzWdnPBzSrdS3ZpOGOr6t64YsQj
	8lE2s/7eP+1b8qMAG5hBSrK/vIdq36YAKeFnGi5+rq4SoGz6fQvPY47R4oKttHVPNzYY+fvXS/8dA
	Kkgdc+EXYWNlgbtA6hLXTK9GOwMM+A+IqLmWc6Y3QvgVZGiMUglvG2H9z82fsmV+xYA35rrNsm179
	pubVgTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIpa-00000002DyZ-3Wr8;
	Mon, 14 Jul 2025 13:02:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIGc-000000029kb-0K6g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:26:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 57431A57058;
	Mon, 14 Jul 2025 12:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26157C4CEFA;
	Mon, 14 Jul 2025 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752496005;
	bh=FOYwHiBT5QVQJ9jDY0O9ag4nCSvXJIc+wXsyBYpsq6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4jQPYOubPvQLodK8M03GmQQHzEWlUK2ezHkvD7SbVcgN33Q+3kP9yEqojxOkglZh
	 ec0DF45wx1tU7EQcXPGOqjss9DIwOJhH/Iul1V6aDm9GTE27YgIS8EMqExJK76DSaR
	 tGhZV0yzMm+eRfdSYT5uqyoY8QCnIZUGOiHUHX8ajvUJJIBvii+gUxKPzCKa+hHZrs
	 5ovadAhUYNcWBZ+ZyMxBG0MXtr0pokVgyEJKUvwOGqa337D4YGY0XhEv23/JcbcZa6
	 AVnBlTC7qDT3KtmFL9Qj0xfvp1Lcc4voo+/gvU/MEHA/ZEjpyNDYsG4v7PurRLIyUr
	 qMPmQx3HpJUcw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubIGZ-00FW7V-CJ;
	Mon, 14 Jul 2025 13:26:43 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 09/11] KVM: arm64: selftests: get-reg-list: Simplify feature dependency
Date: Mon, 14 Jul 2025 13:26:32 +0100
Message-Id: <20250714122634.3334816-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714122634.3334816-1-maz@kernel.org>
References: <20250714122634.3334816-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, peter.maydell@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_052646_277462_53767440 
X-CRM114-Status: GOOD (  12.81  )
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

Describing the dependencies between registers and features is on
the masochistic side of things, with hard-coded values that would
be better taken from the existing description.

Add a couple of helpers to that effect, and repaint the dependency
array. More could be done to improve this test, but my interest is
wearing  thin...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 .../selftests/kvm/arm64/get-reg-list.c        | 52 ++++++++-----------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index d01798b6b3b47..a35b01d08cc63 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -15,6 +15,12 @@
 #include "test_util.h"
 #include "processor.h"
 
+#define SYS_REG(r)	ARM64_SYS_REG(sys_reg_Op0(SYS_ ## r),	\
+				      sys_reg_Op1(SYS_ ## r),	\
+				      sys_reg_CRn(SYS_ ## r),	\
+				      sys_reg_CRm(SYS_ ## r),	\
+				      sys_reg_Op2(SYS_ ## r))
+
 struct feature_id_reg {
 	__u64 reg;
 	__u64 id_reg;
@@ -22,37 +28,23 @@ struct feature_id_reg {
 	__u64 feat_min;
 };
 
-static struct feature_id_reg feat_id_regs[] = {
-	{
-		ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
-		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
-		0,
-		1
-	},
-	{
-		ARM64_SYS_REG(3, 0, 10, 2, 2),	/* PIRE0_EL1 */
-		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
-		8,
-		1
-	},
-	{
-		ARM64_SYS_REG(3, 0, 10, 2, 3),	/* PIR_EL1 */
-		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
-		8,
-		1
-	},
-	{
-		ARM64_SYS_REG(3, 0, 10, 2, 4),	/* POR_EL1 */
-		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
-		16,
-		1
-	},
-	{
-		ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
-		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
-		16,
-		1
+#define FEAT(id, f, v)					\
+	.id_reg		= SYS_REG(id),			\
+	.feat_shift	= id ## _ ## f ## _SHIFT,	\
+	.feat_min	= id ## _ ## f ## _ ## v
+
+#define REG_FEAT(r, id, f, v)			\
+	{					\
+		.reg = SYS_REG(r),		\
+		FEAT(id, f, v)			\
 	}
+
+static struct feature_id_reg feat_id_regs[] = {
+	REG_FEAT(TCR2_EL1,	ID_AA64MMFR3_EL1, TCRX, IMP),
+	REG_FEAT(PIRE0_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
+	REG_FEAT(PIR_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
+	REG_FEAT(POR_EL1,	ID_AA64MMFR3_EL1, S1POE, IMP),
+	REG_FEAT(POR_EL0,	ID_AA64MMFR3_EL1, S1POE, IMP),
 };
 
 bool filter_reg(__u64 reg)
-- 
2.39.2


