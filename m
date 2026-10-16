Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278DACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWYxG6mMET8scWeXD3S5KRH4lNa28oiyUsb/b6VE+Os=; b=Zbq6mSWKsdOUfR
	DrqDSvNDgmDS81A8eC+lA9GkGVk8dKX2oFf9hK7g8HCs2LxyIYlp6KPa7VuAqFtuwtQMJPLnSgLwg
	uSq+Rl1nRlp0cUeXf9k2K902OxntVg3TCxRQRQPJu5cAjlKpCqEx/7OyGnZFIJkWkFooGLwmySQFm
	uiY0C1JnxpsNtVujb/tdncKvktMimZMNNKtO/4mtNJexenGbJwPewvpgaGlUtn+UEWjX8UTnfg9cc
	nAQg++um8sio+uX/BIH6X9K1+KuW3mtIUs4K0TeCKxEc2ztdMAWlLSRoWDRmPUy0JkuvnKzTMFI/h
	qYceaLggWCZxhUXhFTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5T-00000003SCt-2cxR;
	Fri, 16 Oct 2026 16:47:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl5J-00000003S6O-1ZDn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:47:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 135321516;
	Fri, 16 Oct 2026 09:47:05 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.15.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C1853F7B4;
	Fri, 16 Oct 2026 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169228; bh=qxjS6dKzZLiq4TD0bBS9pSJz2FeT0WCy5NYNOw1SyQo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6qbOsAgfC1uNDVT0hl6FhpJyUhp7yCtS2oTeBly0k23eBhAxVXVJ94R/qbu2QRWl
	 J7sYgInkuwWXkdpYaFvKq5i9hIpTJxU2PMU3ef/eFUyyRWcF376bkeMy8Sd810WE3L
	 3f6ARxRcTJ0jZxULpth3sjKMEIGelKg3yXZjHXGc=
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: insn: operate on MSR/MRS sysreg field via defines
Date: Fri, 16 Oct 2026 17:46:47 +0100
Message-ID: <20261016164648.251258-4-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016164648.251258-1-ada.coupriediaz@arm.com>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094709_456816_CAA25251 
X-CRM114-Status: GOOD (  12.61  )
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

Replace the few instances of hard-coded system register offset and masks
used to operate on MSR/MRS instructions with defines.
This will allow re-use in future commits while making the connection
between those values more explicit.

While we are here, mark `aarch64_insn_extract_system_reg()` `noinstr`
so it can be safe to use in alternative pacthing callbacks.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
---
 arch/arm64/include/asm/insn.h | 3 +++
 arch/arm64/lib/insn.c         | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 2e45f6e80d15f..e020f9d8b83c2 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -113,6 +113,9 @@ enum aarch64_insn_register {
 	AARCH64_INSN_REG_SP = 31  /* Stack pointer: as load/store base reg */
 };
 
+#define AARCH64_INSN_SYSREG_OFFSET	5
+#define AARCH64_INSN_SYSREG_MASK	GENMASK(20, AARCH64_INSN_SYSREG_OFFSET)
+
 enum aarch64_insn_special_register {
 	AARCH64_INSN_SPCLREG_SPSR_EL1	= 0xC200,
 	AARCH64_INSN_SPCLREG_ELR_EL1	= 0xC201,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index 94ee1aae2f5b7..2edc5a9c0a9c8 100644
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
 
-	insn &= ~GENMASK(20, 5);
-	insn |= sysreg << 5;
+	insn &= ~AARCH64_INSN_SYSREG_MASK;
+	insn |= sysreg << AARCH64_INSN_SYSREG_OFFSET;
 	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
 					    insn, result);
 }
-- 
2.43.0


