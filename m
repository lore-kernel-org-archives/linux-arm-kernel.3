Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99DFCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5afyGOaJyq9CevIdZmRRpqkHwf2vc2Y8qETwTrW3LI=; b=d+Q8GWTH4lO0X1
	4Fcy9PAAVREYLxLb4xW3S5p8g4BFHzGI7MCLL5Yq+MX7bCX7IWfSmzf2P1+HOJyu6XBTSJwJxu9AR
	iEykvbujeZx8mDnFFQwHHX5tfh1ljGpL+xtPOyIL4ZAc8juIIZcoTGUxg12M+4Kw256E4p2Vgo/sf
	+JhQg8a2hKJuZ4V7O5EXQh0xPsjCttrk8PF9tQivH0fZrVZvMV6U7FsSKt7YG/waojxffsaT/wa/1
	QMOIWX1UdWU6TPEcblQnRCYh/7l/usdPp57Iog0hQ5EF6tfy1kBUZM6TZVDUf3Zj4f5qYBc5OjV1Y
	O8feJ3R2/OaZPf9qWazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBS0-00000000ee1-1rvc;
	Mon, 28 Sep 2026 13:31:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBRf-00000000eWi-3jDZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:31:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5100D1A00;
	Mon, 28 Sep 2026 06:30:59 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.11.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95FBC3F763;
	Mon, 28 Sep 2026 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790602262; bh=+O6Tl9b69MkMyFBSEOllG+6tt1OIQl/oGSm3JuuUX7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPpp8pGhmm2pdSxvx6sCRkPI99h37ScguHIcPcMn1jIiYeviQAzMgYyxgPohEsevD
	 M3fpanWGq42fVrXs9HLQFwboTfsqV0X+zhjb0pqEjAkWWrJAX6DcsXDi1amM17yfW/
	 DOK5ukaGkb6VaBRoqabJaAw9IcHsZNbWx3WHPbrA=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] arm64: insn: operate on MSR/MRS sysreg field via defines
Date: Mon, 28 Sep 2026 14:30:33 +0100
Message-ID: <20260928133034.243541-6-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928133034.243541-1-ada.coupriediaz@arm.com>
References: <20260928133034.243541-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_063104_017756_4248CBE6 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Oliver Upton <oupton@kernel.org>, James Morse <james.morse@arm.com>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Lucas Wei <lucaswei@google.com>, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Replace the few instances of hard-coded system register offset and masks
used to operate on MSR/MRS instructions with defines.
This will allow re-use in future commits while making the connection
between those values more explicit.

While we are here, mark `aarch64_insn_extract_system_reg()` `noinstr`
so it can be safe to use in alternative pacthing callbacks.

Changing the mask used in `aarch64_insn_gen_mrs()` to exclude
the lower bits does not change behaviour,
as `aarch64_insn_encode_register()` already clears the bits
used to encode the target register.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 3 +++
 arch/arm64/lib/insn.c         | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 40f13d28a5fd7..03620f67a3e47 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -753,6 +753,9 @@ static __always_inline u32 aarch64_insn_gen_dsb(enum aarch64_insn_mb_type type)
 	return insn;
 }
 
+#define AARCH64_INSN_SYSREG_OFFSET	5
+#define AARCH64_INSN_SYSREG_MASK	GENMASK(19, 5)
+
 u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 			 enum aarch64_insn_system_register sysreg);
 
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 5c37f3a4c402b..2edc5a9c0a9c8 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1362,9 +1362,9 @@ u32 aarch64_insn_adrp_set_offset(u32 insn, s32 offset)
 /*
  * Extract the Op/CR data from a msr/mrs instruction.
  */
-u32 aarch64_insn_extract_system_reg(u32 insn)
+noinstr u32 aarch64_insn_extract_system_reg(u32 insn)
 {
-	return (insn & 0x1FFFE0) >> 5;
+	return (insn & AARCH64_INSN_SYSREG_MASK) >> AARCH64_INSN_SYSREG_OFFSET;
 }
 
 bool aarch32_insn_is_wide(u32 insn)
@@ -1566,8 +1566,8 @@ u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 {
 	u32 insn = aarch64_insn_get_mrs_value();
 
-	insn &= ~GENMASK(19, 0);
-	insn |= sysreg << 5;
+	insn &= ~AARCH64_INSN_SYSREG_MASK;
+	insn |= sysreg << AARCH64_INSN_SYSREG_OFFSET;
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
 					    insn, result);
 }
-- 
2.43.0


