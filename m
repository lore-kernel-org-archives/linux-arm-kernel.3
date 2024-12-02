Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF2AD4979B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 04:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WH7yyk/D1VzjqlEKTTzTOx5WE0eay+EqaqUF/uaQQPk=; b=pXNRnw3nqS/Q5p8zGeFTkz3/TQ
	Ip6Eq7BnPTmGp7YNomCw4HD9ktcpnpzQvNGPl9Y3ahCgYhBL/Qi6auamYj5h0PNANCq4e7cTe7Hhp
	c5LS+N5jLT7kQqXObs6zLJ6lqz8O4AnuYbOObCgDBQj8sj53za2jv/9esUV7OLFz3UyrrMXwXRy6c
	zrmzXBzoAT7lGNFPwSM9NHBQXLQogLauEEileByofhKwKX0mQLPeMDnR3jC7H4guYax7Gc3XdCr5B
	3vFI1ZA3TG3z0ZJq2DkNOCtkc/35jL0N+Yi7EJsaXBwqAAVhMrH+r24CLTTia6QBf72ny9s6YlGZr
	Jl8hVRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyBL-000000053Oh-0Ju0;
	Mon, 02 Dec 2024 04:37:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyAJ-000000053HH-3sXh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:36:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E32E106F;
	Sun,  1 Dec 2024 20:36:30 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 222283F58B;
	Sun,  1 Dec 2024 20:35:58 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop INIT_MM_CONTEXT()
Date: Mon,  2 Dec 2024 10:05:53 +0530
Message-Id: <20241202043553.29592-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_203608_004794_5F8EA4C3 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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

Platform override for INIT_MM_CONTEXT() is redundant because swapper_pg_dir
always gets assigned as the pgd during init_mm initialization. So just drop
this override on arm64.

Originally this override was added via the 'commit 2b5548b68199 ("arm64/mm:
Separate boot-time page tables from swapper_pg_dir")' because non standard
init_pg_dir was assigned as the pgd. Subsequently it was changed as default
swapper_pg_dir by the 'commit ba5b0333a847 ("arm64: mm: omit redundant
remap of kernel image")', which might have also just dropped this override.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.13-rc1

 arch/arm64/include/asm/mmu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 2ec96d91acc6..662471cfc536 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -109,8 +109,5 @@ static inline bool kaslr_requires_kpti(void)
 	return true;
 }
 
-#define INIT_MM_CONTEXT(name)	\
-	.pgd = swapper_pg_dir,
-
 #endif	/* !__ASSEMBLY__ */
 #endif
-- 
2.30.2


