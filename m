Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385ABCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDDm+a34EvcRId8lWDE4aHYbVSzH6REPnYRckEl93Ck=; b=l0CK9CDfiYikiR35bokt1OM836
	1o6DByyqIDAD61ayznf82o13wpRPHKZWlohoQSI7zqhowJUs8/wANzdEAz64dtWZgbVgpoiXJqIBR
	l58DwhQc3EfzRCsrSYeR+yWRCAA62dk2FEspgHkq5Y6Q16ktoeEfo4sp/3YKTEJoyGbPmoMrkfcJ1
	R5DUCLgZ0uMCjwufJJKua2LzMoJgm+PLHlqHhQ3nVXPwRX6C45NT1Q+6YrXtrXFYWf4v39C7VTdHO
	QXdT74a0pvc1I2W2Ssdy6iuQ2bB/fnu+nfQLr9iIdMGKPCeF+3HIrK1LzkIvCG1x1E0kJpgol6Xyd
	otYgGI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Bs-00000007J1R-43m3;
	Wed, 30 Sep 2026 21:50:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2BD-00000007Ibg-2SAq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 57FCA434D6;
	Wed, 30 Sep 2026 21:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96771F00898;
	Wed, 30 Sep 2026 21:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804975;
	bh=NDDm+a34EvcRId8lWDE4aHYbVSzH6REPnYRckEl93Ck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=C2pFgqxrKa6EaED+HUjuk1CfGE7aanUWw7cRzx7JtgwVkd6AKu5IKzTK6W1DMZ9ty
	 BAMZCTPiCZKQIKGgoK8vcbm4f1KnD2CaJ27Cxqw/m/74pxgak++v4jHVJ9DCdn6LxE
	 aR5f9Jl15zV6yXkZONFKUcnQWX1qAeovLcMLrNJFMnuQHQCO0UgRe6H7AoJyz7Slcw
	 TYhHWV5oCbcjMnDsDy7mg4V9KO7HSMBqpH1rBTnHSEPDQTsLbsqv0xTbOUL2u9Yp6z
	 i1Rgo0FKUDM2N3nMl/lbNo9zWptd6gWTi4J78diwyTv/3Qd28SqvwrATb8aslnDS+5
	 z8CW7ZK2jzPCA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:21 +0100
Subject: [PATCH v21 11/15] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-11-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412; i=broonie@kernel.org;
 h=from:subject:message-id; bh=72ACJI/cJk1wqzghWVp8GJhHfQXGaj1gc2q43XRzx90=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO8zdfdjgisAjpwzhRQStgXuo4X2zVSo+4tL
 889ySYMMKmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DvAAKCRAk1otyXVSH
 0Kl4B/4yq1siA8k8JbouKK1Q3ZhTDAE1elUgMuFxC2MOs3Ql20vli7wPsgRftQ9LjpNZk3T2yN8
 umyuArJUwy620EfsG1E3kQjk4xtI0s8uDtQDu8jWf2BJ8uLQjvcCoTAm4gfJi/zf/OQ2KlF8pwq
 71nVllCsd6dXttzyHGpfDz1d4h72noQRYm629RLbIa3rhHl+0PWKh/1w9CHNwCGxJiYgeTQpz01
 RJ5D1zejGqMAp8LG+fz9Q+RaHgmjhYgqu/sqDINPKJNnM46vxnwi7J69+B3JP9cPOYp2bbZFm+x
 LO2wOYWGZaHz7Xib7aoA3KX3ksYSuvlBA1XHpP3JFYb+8iG0
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

GCS adds new registers GCSCR_ELx, GCSCRE0_EL1 and GCSPR_ELx. Add
these to those validated by get-reg-list.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 533994687b5d..b895d2ba387d 100644
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
@@ -503,6 +509,9 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 0),	/* AFSR0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 1),	/* AFSR1_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 2, 0),	/* ESR_EL1 */
@@ -519,6 +528,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
@@ -740,6 +750,8 @@ static __u64 el2_regs[] = {
 	SYS_REG(VTTBR_EL2),
 	SYS_REG(VTCR_EL2),
 	SYS_REG(VNCR_EL2),
+	SYS_REG(GCSCR_EL2),
+	SYS_REG(GCSPR_EL2),
 	SYS_REG(HDFGRTR2_EL2),
 	SYS_REG(HDFGWTR2_EL2),
 	SYS_REG(HFGRTR2_EL2),

-- 
2.47.3


