Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C6BCFD37A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/4uaHnvh3JDOLG2eKuPK4fI7L5KcPVFOBARYbt3dUQ=; b=T6EQpvmICrhKaWSnLLmEm3LCLH
	aP1oAnd+cSa4NZglyjIKgn7g6E05ZZCtbPcZzouncXZ2VpUsq6OUodjfmT9CDjj8KHjV9p9B1F7qY
	LmF+q8+meXoN5pD4j+dIFkT9kXPx9uSFm/+35HNzedv5AKvGwAdiTvsHJFH3Xkpk0khR+yprbAha/
	coPUTgYwSHZzYaCNR1O5DhQxPaTm9Zmi1cBmL6Pntc72wXPMjdF7cJWM7rzpnDyLF07spowkNGBKs
	E+pfKOEAHmcGP98H6J5wIvTFW1A5IosuXaxb/6DIQqaWBWNJo8lLJc+1+6DnoGOwwHPSmBsSwl2mD
	dVLBRJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq27-0000000D6Vh-2RE0;
	Tue, 25 Nov 2025 10:12:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNq23-0000000D6UQ-1c7R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:12:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 380C714BF;
	Tue, 25 Nov 2025 02:12:15 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 173B53F86F;
	Tue, 25 Nov 2025 02:12:20 -0800 (PST)
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
Subject: [PATCH v2 1/2] KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user
Date: Tue, 25 Nov 2025 10:12:06 +0000
Message-ID: <20251125101207.1492580-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125101207.1492580-1-ben.horgan@arm.com>
References: <20251125101207.1492580-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_021223_459102_3F129683 
X-CRM114-Status: GOOD (  13.21  )
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
define. As there are no more users, ARM64_FEATURE_FIELD_BITS is removed
from the arm64 tools sysreg.h header. A separate commit removes this from
the kernel version of the header.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v1:
Remove ARM64_FEATURE_FIELD_BITS from tools header instead of the kernel
header
---
 tools/arch/arm64/include/asm/sysreg.h           | 2 --
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index 65f2759ea27a..0f60b68eac1b 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -1078,8 +1078,6 @@
 #define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
 					       GCS_CAP_VALID_TOKEN)
 
-#define ARM64_FEATURE_FIELD_BITS	4
-
 #ifdef __ASSEMBLY__
 
 	.macro	mrs_s, rt, sreg
diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 5e24f77868b5..5fbcf5d1f168 100644
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


