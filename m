Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4B0CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CljSiDbhHb9XTrRXJBWNdQogfmC8HGLrtGvjQowOzCs=; b=jYZcvLNNnJITi/
	sOYWspwnAARXRvNqioFqlUlSczAUE1D+g7eanPeedOiaRg9NtYwU0Mx9aT7Eo6EzN2Aq/I4saf7vH
	D32tCs28tVSXP5e89EZVBkTkDXR7n8BGzvx3lSqzkAmZ0zXQbN2L0YpwJMB/KwWomrJFLINjbyylW
	IFVPIJ55kZ/+iYEhtkUlnXzYiXTwIz3K/mC+ioS/yqjSSFWh0Ofs9icMV6fU612sfuj6adNarlPrf
	zc5ZSqEHZamzHZip74HRUkHMgvMzAtxwyXegEBUtjlLZ+t5uVWE3fBENlSz5ta7ZHKFEzDq0762JA
	TFUYZlokWrkSFY9n11Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5L-00000003S7V-0bFD;
	Fri, 16 Oct 2026 16:47:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5F-00000003S4k-3jI0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E466E1477;
	Fri, 16 Oct 2026 09:47:01 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F63B3FBF5;
	Fri, 16 Oct 2026 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169225; bh=nXw/6iDHjEohi9yDRYJ7TIMg35EP3knrRAshEW40adY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ax1bszOzXYKbx1wLrKgkitvuxnmCkC66sKbllmn8vWGmwqSb951Ud6pshwCyG1+AY
	 /wB2ulEsPKCVFxLiFen8wfOSM7kBSgpItUG8ptvhlq1xsMIgON8vbPRYukzuWHcoDX
	 CRgsVck1olCiNkSjn8gZi7NByX7X+yRfJFbLQunA=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] arm64: insn: fix system register inconsistencies
Date: Fri, 16 Oct 2026 17:46:46 +0100
Message-ID: <20261016164648.251258-3-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016164648.251258-1-ada.coupriediaz@arm.com>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094706_021062_5455F1AA 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Barry Song <baohua@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Lucas Wei <lucaswei@google.com>, Mark Brown <broonie@kernel.org>, Andre Przywara <andre.przywara@arm.com>, Tejun Heo <tj@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Two registers in `enum aarch64_insn_special_register` are defined
incorrectly :
 - SPSR_IRQ is named SPSR_I*N*Q
 - SP_EL2's encoding is incorrect and does not correspond to ant register

Fix those issues and re-order the registers by value.
Update `enum aarch64_insn_system_register` values and order to be in line
with `enum aarch64_insn_special_register`, so that we can make
`aarch64_insn_gen_mrs()` use the same mask as
`aarch64_insn_extract_system_reg()` while we're here.

This does not change the behaviour, as `aarch64_insn_encode_register()`
always masks the lower bits and the top bit of registers are always set.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 12 ++++++------
 arch/arm64/lib/insn.c         |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index c91a8431c961e..2e45f6e80d15f 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -119,27 +119,27 @@ enum aarch64_insn_special_register {
 	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
 	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
 	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
-	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
 	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
+	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
 	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
 	AARCH64_INSN_SPCLREG_DSPSR_EL0	= 0xDA28,
 	AARCH64_INSN_SPCLREG_DLR_EL0	= 0xDA29,
 	AARCH64_INSN_SPCLREG_SPSR_EL2	= 0xE200,
 	AARCH64_INSN_SPCLREG_ELR_EL2	= 0xE201,
 	AARCH64_INSN_SPCLREG_SP_EL1	= 0xE208,
-	AARCH64_INSN_SPCLREG_SPSR_INQ	= 0xE218,
+	AARCH64_INSN_SPCLREG_SPSR_IRQ	= 0xE218,
 	AARCH64_INSN_SPCLREG_SPSR_ABT	= 0xE219,
 	AARCH64_INSN_SPCLREG_SPSR_UND	= 0xE21A,
 	AARCH64_INSN_SPCLREG_SPSR_FIQ	= 0xE21B,
 	AARCH64_INSN_SPCLREG_SPSR_EL3	= 0xF200,
 	AARCH64_INSN_SPCLREG_ELR_EL3	= 0xF201,
-	AARCH64_INSN_SPCLREG_SP_EL2	= 0xF210
+	AARCH64_INSN_SPCLREG_SP_EL2	= 0xF208,
 };
 
 enum aarch64_insn_system_register {
-	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0x4684,
-	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0x6682,
-	AARCH64_INSN_SYSREG_SP_EL0	= 0x4208,
+	AARCH64_INSN_SYSREG_SP_EL0	= 0xC208,
+	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0xC684,
+	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0xE682,
 };
 
 enum aarch64_insn_variant {
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 5c37f3a4c402b..94ee1aae2f5b7 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -1566,7 +1566,7 @@ u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
 {
 	u32 insn = aarch64_insn_get_mrs_value();
 
-	insn &= ~GENMASK(19, 0);
+	insn &= ~GENMASK(20, 5);
 	insn |= sysreg << 5;
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
 					    insn, result);
-- 
2.43.0


