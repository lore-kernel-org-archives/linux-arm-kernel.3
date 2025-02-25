Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049AEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Raa+xM6sthb3/7PRCr5ZwQZWNe15UoSvPC3VoY1zs3A=; b=4ruT/OQMBayZEyKGcf0FGMvJGg
	gODyqiWDBY+e2Dyk2Q1y+czEhFNzNVIlfRl+pzK5CQEAY3oiTcTeV3SgfC129NfYL+/Q/6O76OdML
	Y+MUvgpqaRVyzf6606I4GTRrqQBsauSvUxvw8h8TvWKi/Lqz7lZ4oLS8yGftjUKmyHKj235yL1XgX
	z30nGFQMkVFgK2hjsEfRzE/+6DgnIGMAByWkgSoa4fgRtQ8h+ZoUZhE9BdVP1JDGiN/AFS8oDLxz/
	RJucjvgA7kSonaPMnLbKjYG1aae0b6UNT4+uxGoG1TtZBrndlL/732g+gPD5AoevGG68G7pBcB5ue
	9lqazGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2g5-00000001afX-1nuZ;
	Tue, 25 Feb 2025 21:41:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2ad-00000001ZnI-1kH7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06F2E5C5471;
	Tue, 25 Feb 2025 21:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33E7C4CEDD;
	Tue, 25 Feb 2025 21:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740519342;
	bh=XJj6XvkQZvZnU7KV6XAood8YWkTdHu5c0H1A7ovBxzA=;
	h=From:To:Cc:Subject:Date:From;
	b=W4QWIyo+ORQaPhjAKpxtAyBeafgO/6U/xTq6EytlUr0Uz8heSzfshCaIyL7vU+tJR
	 WQtV1sSGREk12FhQJOIxuU4gW2pzest2Qzjgd74VM7dUbAbHL/oCN7GrzVq8RN3MXW
	 pPfKHUdTym7mzGyeRVIoChmJ3uu+xmW7o24EaPzgIDie2n9GHzouLYoQAAkBIPHJuL
	 rS9FL4fB6jgthJtfTSPJDs7Hx/fJcHfj1YSFtOBxoPy9cri7yCNJk1aBhBK2whcPqq
	 kN6q2tVKUXUDtvAbBEiwnG1hEp6wL8wrjo+OZZe9F+9mJ7onV46DrisiMzc0rKOvVE
	 DjsTZXG/0KZ8g==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: fixmap: make __end_of_early_ioremap_region an enum value
Date: Tue, 25 Feb 2025 22:35:34 +0100
Message-Id: <20250225213539.3236070-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_133543_498972_27AC7E30 
X-CRM114-Status: GOOD (  11.21  )
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

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows warnings for the __end_of_fixed_addresses
definition:

    In file included from mm/early_ioremap.c:18:
    arch/arm/include/asm/fixmap.h:39:35: error: '__end_of_fixed_addresses' defined but not used [-Werror=unused-const-variable=]

Move the calculation slightly up in the file into the enum that
contains __end_of_fixmap_region and __end_of_early_ioremap_region.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/fixmap.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
index 707068f852c2..90e0bd79b180 100644
--- a/arch/arm/include/asm/fixmap.h
+++ b/arch/arm/include/asm/fixmap.h
@@ -33,12 +33,11 @@ enum fixed_addresses {
 
 	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
 	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
-	__end_of_early_ioremap_region
-};
+	__end_of_early_ioremap_region,
 
-static const enum fixed_addresses __end_of_fixed_addresses =
-	__end_of_fixmap_region > __end_of_early_ioremap_region ?
-	__end_of_fixmap_region : __end_of_early_ioremap_region;
+	__end_of_fixed_addresses = __end_of_fixmap_region > __end_of_early_ioremap_region ?
+				   __end_of_fixmap_region : __end_of_early_ioremap_region,
+};
 
 #define FIXMAP_PAGE_COMMON	(L_PTE_YOUNG | L_PTE_PRESENT | L_PTE_XN | L_PTE_DIRTY)
 
-- 
2.39.5


