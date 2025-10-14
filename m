Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3834CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpHcbtFezdPzkqZNo1+mJ4rzXgNu7F4+tZHPcjjfx1Y=; b=FeBUORxaFwmBrPk0/TgGM3iiTy
	XkTWgATf63Wy3TSz4w2qqidDwZarhvqgvzB5vJJDddrWNlY7/KVvwZkChmlIJzqDDg6yDKiO5szEN
	ZP4QiPnSBrp3WekDPysNM/spga682zxlmJvWMyCigEQaUhIuqlaZysC9ayGpXztMSZWv/0G8b6ZMK
	M2mWNjt8meCWj3zjVmYKbGUlY0ElEB67c2a/fogV55riLFMMFnHRyG0NIBX1BcH9DoIb05hD2Jtac
	I5z6Jwvf5ZLvgCJVGK5AN6T8X1OrYe1iDB34hbZvkntHoQipa9nAshfKqAOARz9ab8Wq+l5ux+Uny
	ZwPBtIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9o-0000000Fug2-3twH;
	Tue, 14 Oct 2025 10:21:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9m-0000000Fuec-1PeS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:21:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3A6D1BB2;
	Tue, 14 Oct 2025 03:21:17 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC99C3F6A8;
	Tue, 14 Oct 2025 03:21:23 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	shuah@kernel.org
Cc: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 2/3] KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user
Date: Tue, 14 Oct 2025 11:21:07 +0100
Message-ID: <20251014102108.2442391-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014102108.2442391-1-ben.horgan@arm.com>
References: <20251014102108.2442391-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_032126_474938_A87730A1 
X-CRM114-Status: GOOD (  10.90  )
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

ARM64_FEATURE_FIELD_BITS is set to 4 but not all ID register fields are 4
bits. See for instance ID_AA64SMFR0_EL1. The last user of this define,
ARM64_FEATURE_FIELD_BITS, is the set_id_regs selftest. Its logic assumes
the fields aren't a single bits; assert that's the case and stop using the
define. As there are no more users, ARM64_FEATURE_FIELD_BITS is removed.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/include/asm/sysreg.h                 | 2 --
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 6455db1b54fd..d9aa76d08e13 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1129,8 +1129,6 @@
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
 
-#define ARM64_FEATURE_FIELD_BITS	4
-
 #ifdef __ASSEMBLY__
 
 	.macro	mrs_s, rt, sreg
diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 6878ee23310e..a0b81b627037 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -268,7 +268,9 @@ static void guest_code(void)
 /* Return a safe value to a given ftr_bits an ftr value */
 uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 {
-	uint64_t ftr_max = GENMASK_ULL(ARM64_FEATURE_FIELD_BITS - 1, 0);
+	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
+
+	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
 
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
@@ -320,7 +322,9 @@ uint64_t get_safe_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 /* Return an invalid value to a given ftr_bits an ftr value */
 uint64_t get_invalid_value(const struct reg_ftr_bits *ftr_bits, uint64_t ftr)
 {
-	uint64_t ftr_max = GENMASK_ULL(ARM64_FEATURE_FIELD_BITS - 1, 0);
+	uint64_t ftr_max = ftr_bits->mask >> ftr_bits->shift;
+
+	TEST_ASSERT(ftr_max > 1, "This test doesn't support single bit features");
 
 	if (ftr_bits->sign == FTR_UNSIGNED) {
 		switch (ftr_bits->type) {
-- 
2.43.0


