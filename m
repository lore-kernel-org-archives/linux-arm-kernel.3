Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C545CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oJJKQjQWJKJna3KtJkNjB8DVyWbsU4VXlvPjkVvw7Q=; b=qnvrLZWvVNt3O/
	bWvj6klKcRm2tm+F2l9GY2yl/F4CRoATkLGmdbmxMug6DDTU7hOvFPWrI/4zJkmPT8oxKWjC0oMac
	Otjt9NZoZ+iB6xx+EpSQ55US3rQkxAsh+xvAalPjtsiECPg7MzvIFy7khFtHSZsCgR13fLAEmaZQz
	zYaHvBqra5HG2t/452PBBe4hUlc2Z7NyZlFL6Z7SrDO4ooeyFKuM5JpGWyCqSS/rqmgrljTX9dpus
	bKk1EvqkxoezhEwlJlcrKySNVppHrN+C4TI7r4WMnTrcgcTpeehi2f0dpoquXvZmjKhwsNY1aBVID
	tgKnAeuPhZsjskDjXMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlA9-00000003T1S-0om7;
	Fri, 16 Oct 2026 16:52:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlA0-00000003Sz0-2Vva
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:52:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C1931477;
	Fri, 16 Oct 2026 09:51:55 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F36EE3F7B4;
	Fri, 16 Oct 2026 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169518; bh=o/Fc9Dj0uXK9GaHV4FTmUUEUF5qCX1ZduGdJXm40pyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FIk5DsfjrgMksbrnghHxscwJUO3EQPCFMDvNBlRMlwtI9qLsLMhWdMSruBDQkxt8d
	 izS7f9Iiz0cmORzIptGoPFYXKmJLz5jyO2zpNtCg1E4aNh2dKZJufCfTgG0IzLG4Qj
	 HPKU5h0S3swbN3Sqzm8+zrPA8v6eBHORePkJvapg=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64: insn: clean-up memory barrier types
Date: Fri, 16 Oct 2026 17:51:39 +0100
Message-ID: <20261016165140.254791-2-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016165140.254791-1-ada.coupriediaz@arm.com>
References: <20261016165140.254791-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095200_720696_B2C18EB7 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Replace magic-numbers for offset and mask with shared defines.

Re-order the types enum by value, matching the Arm ARM, and
define them with their proper values, simplifying their use.

Arm ARM DDI 0487 version M.c[0] deprecated a number of types
used as options for the DMB and DSB instructions, with no change
in behaviour.
The deprecated types are not used in the kernel, so remove them
from our instruction generation framework and add the missing
`AARCH64_INSN_MB_OSH` case in `__get_barrier_crm_val()`.

This simplifies the switch-case and now covers all the enum types,
which allows for making the DSB and DMB generation non instrumentable
in a follow-up commit.

[0]: https://support.arm.com/documentation/ddi0487/mc/
     (See C6.2.150, C6.2.152)

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 22 ++++++++----------
 arch/arm64/lib/insn.c         | 44 ++++++++++++-----------------------
 2 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 1ce75a442638..2d19f48aab81 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -7,6 +7,7 @@
  */
 #ifndef	__ASM_INSN_H
 #define	__ASM_INSN_H
+#include <linux/bits.h>
 #include <linux/build_bug.h>
 #include <linux/types.h>
 
@@ -297,19 +298,16 @@ enum aarch64_insn_mem_order_type {
 	AARCH64_INSN_MEM_ORDER_ACQREL,
 };
 
+#define AARCH64_INSN_MB_TYPE_OFFSET 8
+#define AARCH64_INSN_MB_TYPE_MASK GENMASK(11, AARCH64_INSN_MB_TYPE_OFFSET)
+
 enum aarch64_insn_mb_type {
-	AARCH64_INSN_MB_SY,
-	AARCH64_INSN_MB_ST,
-	AARCH64_INSN_MB_LD,
-	AARCH64_INSN_MB_ISH,
-	AARCH64_INSN_MB_ISHST,
-	AARCH64_INSN_MB_ISHLD,
-	AARCH64_INSN_MB_NSH,
-	AARCH64_INSN_MB_NSHST,
-	AARCH64_INSN_MB_NSHLD,
-	AARCH64_INSN_MB_OSH,
-	AARCH64_INSN_MB_OSHST,
-	AARCH64_INSN_MB_OSHLD,
+	AARCH64_INSN_MB_OSH	= 0b0011 << AARCH64_INSN_MB_TYPE_OFFSET,
+	AARCH64_INSN_MB_NSH	= 0b0111 << AARCH64_INSN_MB_TYPE_OFFSET,
+	AARCH64_INSN_MB_ISH	= 0b1011 << AARCH64_INSN_MB_TYPE_OFFSET,
+	AARCH64_INSN_MB_LD	= 0b1101 << AARCH64_INSN_MB_TYPE_OFFSET,
+	AARCH64_INSN_MB_ST	= 0b1110 << AARCH64_INSN_MB_TYPE_OFFSET,
+	AARCH64_INSN_MB_SY	= 0b1111 << AARCH64_INSN_MB_TYPE_OFFSET,
 };
 
 #define	__AARCH64_INSN_FUNCS(abbr, mask, val)				\
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index e70ac0238515..fa61a631d687 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1561,60 +1561,46 @@ u32 aarch64_insn_gen_extr(enum aarch64_insn_variant variant,
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RM, insn, Rm);
 }
 
-static u32 __get_barrier_crm_val(enum aarch64_insn_mb_type type)
+static bool __is_valid_barrier_type(enum aarch64_insn_mb_type type)
 {
 	switch (type) {
-	case AARCH64_INSN_MB_SY:
-		return 0xf;
-	case AARCH64_INSN_MB_ST:
-		return 0xe;
-	case AARCH64_INSN_MB_LD:
-		return 0xd;
-	case AARCH64_INSN_MB_ISH:
-		return 0xb;
-	case AARCH64_INSN_MB_ISHST:
-		return 0xa;
-	case AARCH64_INSN_MB_ISHLD:
-		return 0x9;
+	case AARCH64_INSN_MB_OSH:
 	case AARCH64_INSN_MB_NSH:
-		return 0x7;
-	case AARCH64_INSN_MB_NSHST:
-		return 0x6;
-	case AARCH64_INSN_MB_NSHLD:
-		return 0x5;
+	case AARCH64_INSN_MB_ISH:
+	case AARCH64_INSN_MB_LD:
+	case AARCH64_INSN_MB_ST:
+	case AARCH64_INSN_MB_SY:
+		return true;
 	default:
 		pr_err("%s: unknown barrier type %d\n", __func__, type);
-		return AARCH64_BREAK_FAULT;
+		return false;
 	}
 }
 
 u32 aarch64_insn_gen_dmb(enum aarch64_insn_mb_type type)
 {
-	u32 opt;
 	u32 insn;
 
-	opt = __get_barrier_crm_val(type);
-	if (opt == AARCH64_BREAK_FAULT)
+	if (!__is_valid_barrier_type(type))
 		return AARCH64_BREAK_FAULT;
 
 	insn = aarch64_insn_get_dmb_value();
-	insn &= ~GENMASK(11, 8);
-	insn |= (opt << 8);
+	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
+	insn |= type;
 
 	return insn;
 }
 
 u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
 {
-	u32 opt, insn;
+	u32 insn;
 
-	opt = __get_barrier_crm_val(type);
-	if (opt == AARCH64_BREAK_FAULT)
+	if (!__is_valid_barrier_type(type))
 		return AARCH64_BREAK_FAULT;
 
 	insn = aarch64_insn_get_dsb_base_value();
-	insn &= ~GENMASK(11, 8);
-	insn |= (opt << 8);
+	insn &= ~AARCH64_INSN_MB_TYPE_MASK;
+	insn |= type;
 
 	return insn;
 }
-- 
2.43.0


