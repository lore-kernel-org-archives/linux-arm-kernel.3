Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9465DC88E6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhOz7b7vcCNNPzFClOpRl9pC07gB9YENZ2jbJEaJE7k=; b=F9Pc2em25iqN7AMubE79gLqN6S
	LpksJ0U29VqDxPVxWVVb0wKym7j5aAdC1QDeqDrzoaPh7cqWkFDjwJqBmYjuTVN3bpEeMvshhbzti
	N85g3a1b/MW02pshhGSufY/WT2VCYOBDNLU2DrytbRc7QILt+57Ca1jh6pLrViOlbqlRj255pp2TZ
	X+vGC7/x/fuCphP0gBbLs4RlqRtQdM/nWTSUJMJdLOReq7dlUARVp6tt+RkN/rRHCjv4+ahaUIwmw
	8x3QBR9SG+6CQ8hEMfD6rfb/Tazq2LZ/2h0hQmu4Te1HIA9gIHz43ilyT3YgclxsjldR5uxs6aB91
	Sp89yUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pT-0000000365W-0HJk;
	Mon, 14 Sep 2026 10:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63oq-000000035Rt-1yhg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:21:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A67D1576;
	Mon, 14 Sep 2026 03:21:44 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CAA973F7B4;
	Mon, 14 Sep 2026 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381307; bh=iE7NSU2S85o9rTD0sQeImnasBC/5jscUeumEgGw5/zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilx1XVvB3QsqmIY7VgaATVU8z53lrsAwM9mpy4l+jDc35xrowVXfSZcrbdZpCxtto
	 McFiHtwdDH0YrReNjY0/bE1ZBXuhcQm4k3SjmrlyW6Y34UacvryfVUWKyZr95EFVUZ
	 G7EeioYWxTGKD+5pqMJAjaAoZoHE9wbg7UNTbOCI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 14/38] arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
Date: Mon, 14 Sep 2026 11:20:38 +0100
Message-Id: <20260914102102.68597-15-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032148_586683_1057C161 
X-CRM114-Status: GOOD (  10.92  )
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

All exception state debug logic now lives under the generic
CONFIG_DEBUG_IRQFLAGS. Move the two remaining cases from the dedicated
config option to CONFIG_DEBUG_IRQFLAGS as well, keeping all related
debug logic under a single configuration option.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 9f5c774cbe68..eedbdf7358e6 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -49,7 +49,7 @@ static __always_inline void __daif_local_irq_enable(void)
 
 static __always_inline void __pmr_local_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
@@ -78,7 +78,7 @@ static __always_inline void __daif_local_irq_disable(void)
 
 static __always_inline void __pmr_local_irq_disable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
-- 
2.34.1


