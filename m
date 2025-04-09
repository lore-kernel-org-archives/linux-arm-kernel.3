Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EFFC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Raa+xM6sthb3/7PRCr5ZwQZWNe15UoSvPC3VoY1zs3A=; b=H4osL+tqeqvLnDSlbHZXDRTljG
	s+NhLBXiimPN4kDaJMdap2JxM1q2Fk7VzcGKH1GawvY5j13j/6jXZF0UVExIa2YtNkzDK+dacsLAg
	pkbNRBTgkN4ZiARS6lgJuh6sS+kfZh28L1ZdeQxQAnFwvgQlvw0W6jmJAGYd2XHrrklEDDNyQqaD7
	iflLpgeX/sa2ZIWvDxFpLdls8K/e3rVUr4utPgDMO13egNyLE3L1hE+uiGPT/Ni/T+g1J8Gj1h48x
	TZkb25m4xbdnWELd1mEvWYA4XHDOeQHZUcKfjTh5OQJm4jnWjj3tLNaHURPjtk5MtyfE33lcUbjSu
	nCLcDnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UYC-000000079F1-0XWi;
	Wed, 09 Apr 2025 12:29:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UTY-0000000784i-0Bxm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E1DAA493F8;
	Wed,  9 Apr 2025 12:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6EAC4CEE3;
	Wed,  9 Apr 2025 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201454;
	bh=XJj6XvkQZvZnU7KV6XAood8YWkTdHu5c0H1A7ovBxzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sxjtqdOSL8gQo9pk7SGNQNxZ1USKpj5+Yb60+jIhvZbCOUYIUyA88o8l8lqpbdsWK
	 cImwUtDd0rdcTiLUNpzPimLgwg2QKtBE4nDvfARDGB3cDQGiG9W4eJsaNANZGtu0XI
	 UGlWeOqF6IOoSrANDCqqJX7pwel8+imi9xsqnnYi35cBB7h55BcpypcztP03M97gO7
	 UHQDu56P8q3pWYCt/jMIDZpfW1i1vYp9ctiPsO6hQ9Mbxl3NWl25RvdB9PVin1xpKw
	 lVbdZk0B9zekRXM4nOlWc6gx72hg4J992cY3LuA7SI5ll1CXeR23K9q2g3E/847CTn
	 1eKvNqrB26dvQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] [RESEND] ARM: fixmap: make __end_of_early_ioremap_region an enum value
Date: Wed,  9 Apr 2025 14:22:59 +0200
Message-Id: <20250409122314.2848028-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_052416_147547_1E81655B 
X-CRM114-Status: GOOD (  11.61  )
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


