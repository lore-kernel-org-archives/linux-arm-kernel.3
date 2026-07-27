Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EECC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34l5IydSvPd0kp8dctCV81Y7uZ7k60loP8u9mh3rlHA=; b=G1rupxqjHWVqXfO5u5MFJPihDb
	OYlKWXTTH/2X4I+8xJ60VVWEepxQDmZwW7MyB4c8hwDAE7ncnfJgFCm89krC3mTfduWo24xtVpSkM
	/SNJ5vbluHj+WsZtz5km+qH90/I5VFGnka5ZLAYhA6GMsgTS+9b4r7sxbXqGC5dCft1kIJssCpnWK
	WxlkF6ebYdLlTBkGsDrfNJ2y7To/oCsOB6s2Scu2ngP30WUo9XpCS8Y9/wVbG3k0cVjSv2egy0L7+
	snRlepbzDWi5PHbbwDtzVJIisJbFOlfWLKZ69fKMgwamK+Z9+ZtpdJ10ujWj9FR9VLjxxTtjkZUXc
	ZD9d58vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKn-00000003OIi-3Eyv;
	Mon, 27 Jul 2026 16:37:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIw-00000003Mjl-0Jv5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7D711758;
	Mon, 27 Jul 2026 09:35:44 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DD2B3F86F;
	Mon, 27 Jul 2026 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170149; bh=7LsUYRR54THMEFBnPSeqIDM0boZAZdtAMx+9znUlnYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oH76g5wJyLs/bSlsdaldih9Tz86pU3TJbv+GsjHNBtwWRg98yJT7evUwu5dzrhOT8
	 vcQZl6LnJsSe/LNiDYNl1rE+cRyWxZPLwLuhvzRtMYGfajAsfuSr9Eeh/em4cQT1sg
	 xPQSIYbApG0Ib5q2q/e17HWgbLzYRJFn/bRDFUSI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 23/45] arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
Date: Mon, 27 Jul 2026 17:34:31 +0100
Message-Id: <20260727163453.7969-24-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093550_244974_0AE37CE2 
X-CRM114-Status: GOOD (  11.31  )
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
index 50720a01bde4..03cfcd915e62 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -48,7 +48,7 @@ static __always_inline void __daif_local_irq_enable(void)
 
 static __always_inline void __pmr_local_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
@@ -77,7 +77,7 @@ static __always_inline void __daif_local_irq_disable(void)
 
 static __always_inline void __pmr_local_irq_disable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
-- 
2.34.1


