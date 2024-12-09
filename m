Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC93E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 03:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1i/wIz8FENk4pqEi5FCZIFTT2WSlImyB3FNpDT2Te+Y=; b=KUMF7Eig02xGNL4kKII0WpRoGv
	RfulN0gRxtGVCZZ3IFnagHEdBMvYYom60G2gveUCymaRakDqfu71nj8P9xWkEf6LpAu6FvafAK0vA
	+OzfzLsYEu5DMRmmrpnbnV7IVcDkkwb4oe1SR6uILbMnbtgSwMO0VNQC/pfUtS9LY5pf+sUUN09RP
	RLxdLGL/leqK8e4e39Xl/JzBWFiHA5xNU2uA5gjzg6cstgx339GiILZ9nRftkq+ZRa0VsSOK+HvDt
	U1MHtv/F1h7JNOr7mcZSe1SVPp6tvna/xnCM2mhlKnHxqZ1QV6Kh3qSoYQUsJNvOUrw2EBCLSeJNU
	PNFJ9ZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUDn-00000006Gbg-1aQ3;
	Mon, 09 Dec 2024 03:14:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKUCk-00000006GRn-3oIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 03:13:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30181143D;
	Sun,  8 Dec 2024 19:13:27 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98D073F58B;
	Sun,  8 Dec 2024 19:12:56 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on EXECMEM
Date: Mon,  9 Dec 2024 08:42:51 +0530
Message-Id: <20241209031251.515903-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_191303_011579_97B8F6B7 
X-CRM114-Status: GOOD (  10.61  )
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

Late initialisation of EXECMEM inherently requires EXEMEM itself, and hence
this dependency should not be left with the subscribing platforms.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.13-rc1

 arch/Kconfig       | 1 +
 arch/arm64/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 6682b2a53e34..17716f32dc44 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1058,6 +1058,7 @@ config ARCH_WANTS_MODULES_DATA_IN_VMALLOC
 
 config ARCH_WANTS_EXECMEM_LATE
 	bool
+	depends on EXECMEM
 	help
 	  For architectures that do not allocate executable memory early on
 	  boot, but rather require its initialization late when there is
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5479c8b454c..b146372bc365 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -113,7 +113,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
-	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
+	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
 	select ARCH_HAS_UBSAN
-- 
2.30.2


