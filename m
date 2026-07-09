Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB59AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtcnrXFl497MbNiDmG6YtjsX3UvVcVkWIKWEezq1fBQ=; b=sgttvlOUQRL2yIqxm0fCAdb23h
	HhKsc6oNyjYXypDTL6hY7vi9U2v6oQ8JIQdpbGP/snJATw4IPB4vICYvdgvFqo7fh116epSIfdHfe
	/duwLbIzrAY7ZGp/ahQMfR+A6VlogJniNl8QPIPJdRbX++lDnIaIfs9aoEN8Wm2oR4Oom8SeagtUe
	+uWrbMrjWU86HtDJbFNzrr3LDEp0zYLfr5I9LCMQVHBnxV5hdu8gU9YlxZj9pKW8ag4/nZzM6pfCS
	2YZqxpXwP1JuZs+e2vWVDpxa9aVxYBcEucDrm43+Guj5hCjS7t+n7hXIpb/tPzCBz8HUyrh8RMaJX
	1KRna5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneM-00000002LJT-3O1R;
	Thu, 09 Jul 2026 12:14:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whne3-00000002Kan-2RFF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D47471476;
	Thu,  9 Jul 2026 05:14:18 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BE4D3F66F;
	Thu,  9 Jul 2026 05:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599263; bh=z+PCiuFnC/mi2/Rf9i0B/XKVCKtt87mySnCGC4cnpKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQhtEy8r4wkTEPLjbyQ9CO0p8FifCAJgNzXSfb22+ypawJpax4/Q9fkxDqeOL/pYS
	 Sm0CzD015IjxW1HGFPPuqT/K3uv9mliyKhusSLncTd0L3Lo8JEYxAnRlb6Z34IH+hl
	 klrVnHhcOMFuK3ygJxHqlo4MJbWK1O6wFpx7kSyc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 20/36] arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
Date: Thu,  9 Jul 2026 13:13:17 +0100
Message-Id: <20260709121333.23507-21-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051423_678331_A4C6C541 
X-CRM114-Status: GOOD (  11.30  )
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
---
 arch/arm64/include/asm/irqflags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 62f047702493..585d3ce15d80 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -47,7 +47,7 @@ static __always_inline void __daif_local_irq_enable(void)
 
 static __always_inline void __pmr_local_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
@@ -76,7 +76,7 @@ static __always_inline void __daif_local_irq_disable(void)
 
 static __always_inline void __pmr_local_irq_disable(void)
 {
-	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
 		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
-- 
2.34.1


