Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEACCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt1ps/VgcZbcaFL/V6+KlJQ1+YC3be/p+vD9RlIaKSg=; b=2oYkH2UQ0YM/oLZJtTv3XLDgHA
	3NrKylFACGlDYpibd2ZFa7Kz/7Vt+W38Cf5I3OPVV41zeI0lVZAUDfdcgbLpnj6KtQZZvI/k9Luyx
	goQ4H8ZJ8wN35uEBk613j2pd/Z262kM7ROtSAqxVcMgB8sZmHcjnDYMdXeBzN03K0JPui0Y+p1okq
	u2+xr7yqL9LRDjYG3HtTkELozgSaCcFlH7O6PeuxVUBAj68W6nYOwSH/HYfYLTYWfO2gm1z3qh1oS
	ABFdXFKPDP4XkrSW68z7JkP1WYyUF7xYgYJeu+16/ZMwAdcIDi/zSeOrEMeQ8G8kK0ahhazUjaKLR
	EmLaaiUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03j5-00000005qUd-0Vtc;
	Sat, 20 Sep 2025 19:58:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03j1-00000005qSW-1pPo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 19:58:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26C2B44CE7;
	Sat, 20 Sep 2025 19:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA457C4CEEB;
	Sat, 20 Sep 2025 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398307;
	bh=orK/rxMSHEqI9JzhhkIKyObIXyhNnpoojzfzCXkiSJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IGwwqtVPIQi2VQkNfYuTHsXktRxPjwCCszOKuTTGYejxWYA448m6clFU6KYa2twqE
	 3LfWQhb/R2bVrlVyhy+3JnzhKYLmL4lqC1k8YD5sutx4ZLWX3P+QmYii2lol/dbtkQ
	 1DrBY4W8cTE9ggL9T8WG3TLsp6YV/wz/zk0uhz54Yn1J8rX9ExPoSthg5tIAdvlnGo
	 IyOXK6O4uoPcCRJbw+xOwN9JEWp6BeVIP6oyxklMN67WR7S0is2H9Zmd6V/o+L6p7Q
	 iJRpTiVRLKw3J6No4WAI0hrk8cXYK1mUia/bLjx1/PHeBWoIektrnd1QHxqOWy6uWZ
	 q0Hwm3D0oPFjA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 20 Sep 2025 20:52:00 +0100
Subject: [PATCH 2/2] KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in
 set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-kvm-arm64-id-aa64isar3-el1-v1-2-1764c1c1c96d@kernel.org>
References: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
In-Reply-To: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930; i=broonie@kernel.org;
 h=from:subject:message-id; bh=orK/rxMSHEqI9JzhhkIKyObIXyhNnpoojzfzCXkiSJc=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhozz7FF1gnFzGo5dqztrUXrEL71JrXbSCzuBXlZ5hwXZ2
 Ru2z2bsZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAm0pPGwdA4s3zroZU6R9IU
 Xk/4Y2Zmdzp5w8esjpUnI473VIS0iHNcvfrKTla6Unx+wXLBs0rvvkt/Uq+Sy9bmN5oSvTol2EY
 vUCyRg2fW55nF7p/0nM+onP8lqGGo8Z3RWWF+UX85T6zXrTNnnZZrPTBKPrvB++XZENect8kKtg
 2Vm/3NF+YYsVgnmM9rC9dgExZQO/XO/939TlPulV+1DA89WVJm1m/orat5TD2mPGH+3biJny6Ja
 Kr+Urf/dKP/1Sr1nw/+lbq8jfmx36zZzmjajxfxoqai9yrqm49wTGevK3Ln/7GQXeEE24zF1fvE
 81y2ykfGnUv3flont3u92209rW39f/8y7P26pbVgbcIuAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_125827_515635_C410742F 
X-CRM114-Status: UNSURE (   8.12  )
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

We have a couple of writable bitfields in ID_AA64ISAR3_EL1 but the
set_id_regs selftest does not cover this register at all, add coverage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index bfb70926272d..c7c38b1a1f10 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -125,6 +125,13 @@ static const struct reg_ftr_bits ftr_id_aa64isar2_el1[] = {
 	REG_FTR_END,
 };
 
+static const struct reg_ftr_bits ftr_id_aa64isar3_el1[] = {
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, FPRCVT, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, LSFE, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64ISAR3_EL1, FAMINMAX, 0),
+	REG_FTR_END,
+};
+
 static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, CSV3, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, CSV2, 0),
@@ -221,6 +228,7 @@ static struct test_feature_reg test_regs[] = {
 	TEST_REG(SYS_ID_AA64ISAR0_EL1, ftr_id_aa64isar0_el1),
 	TEST_REG(SYS_ID_AA64ISAR1_EL1, ftr_id_aa64isar1_el1),
 	TEST_REG(SYS_ID_AA64ISAR2_EL1, ftr_id_aa64isar2_el1),
+	TEST_REG(SYS_ID_AA64ISAR3_EL1, ftr_id_aa64isar3_el1),
 	TEST_REG(SYS_ID_AA64PFR0_EL1, ftr_id_aa64pfr0_el1),
 	TEST_REG(SYS_ID_AA64PFR1_EL1, ftr_id_aa64pfr1_el1),
 	TEST_REG(SYS_ID_AA64MMFR0_EL1, ftr_id_aa64mmfr0_el1),
@@ -239,6 +247,7 @@ static void guest_code(void)
 	GUEST_REG_SYNC(SYS_ID_AA64ISAR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ISAR1_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64ISAR2_EL1);
+	GUEST_REG_SYNC(SYS_ID_AA64ISAR3_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64PFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
 	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);

-- 
2.47.2


