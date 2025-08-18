Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B72CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLI5FFrwHrRVFwt70Od2AtCtUkMo42gKgLZArSKR55M=; b=NZNyVjar26ipsS6jcV31doI4cW
	DWZc4eW5DyG4+wSW9U/4+/y+6ZOAo8u89D+5kWttvxa7HuTjyXxoE0oT4td7bMMyA6ensJHoqxzJ9
	Jpezn6v45rOGsdkN1jsgwuhTOjlesQ67JwcQJbcG2OwfDq+eBf/0lVFH1aE+srjRV06pgXjkcGthZ
	yGOauISFwg+BXRtzSffLqxHjyz2rBHS7fGwWRnt16gVXa/crZ4NbH3uPZvLFbDZqPyFB1X0BCoqCP
	2dFhsb2Mu+z6Jw187YwTaRQULsl27aSLI0TrrRlT1loj/AF5TZJySWfw/hW+Km5i2puzNFXymBdg9
	hIXXfwcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo05s-00000007YND-0bNK;
	Mon, 18 Aug 2025 13:40:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvx4-000000071tt-2YvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:14:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A996A1762;
	Mon, 18 Aug 2025 02:14:41 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D2DC3F58B;
	Mon, 18 Aug 2025 02:14:47 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC 2/3] arm64/ptdump: Enable console output in pt_dump_seq_[printf|puts]()
Date: Mon, 18 Aug 2025 14:44:35 +0530
Message-Id: <20250818091436.938517-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818091436.938517-1-anshuman.khandual@arm.com>
References: <20250818091436.938517-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_021450_695488_241DCB61 
X-CRM114-Status: GOOD (  10.93  )
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

Enable console output in pt_dump_seq_[printf|puts]() in order to dump early
kernel page tables when required. CONFIG_DEBUG_WX enabled ptdump_check_wx()
already sets seq file as NULL to avoid any output. Hence just introduce a
special sentinel named CONSOLE as ((struct seq_file *)-1) which can be used
to identify kernel console output request for early kernel page table dump.

Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/ptdump.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 7c42be62898b..c78e6b496dea 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -25,17 +25,26 @@
 #include <asm/pgtable-hwdef.h>
 #include <asm/ptdump.h>
 
-
-#define pt_dump_seq_printf(m, fmt, args...)	\
-({						\
-	if (m)					\
-		seq_printf(m, fmt, ##args);	\
+#define CONSOLE ((struct seq_file *)-1)
+
+#define pt_dump_seq_printf(m, fmt, args...)		\
+({							\
+	if (m) {					\
+		if (m == CONSOLE)			\
+			pr_cont(fmt, ##args);		\
+		else					\
+			seq_printf(m, fmt, ##args);	\
+	}						\
 })
 
-#define pt_dump_seq_puts(m, fmt)	\
-({					\
-	if (m)				\
-		seq_printf(m, fmt);	\
+#define pt_dump_seq_puts(m, fmt)		\
+({						\
+	if (m)	{				\
+		if (m == CONSOLE)		\
+			pr_cont(fmt);		\
+		else				\
+			seq_printf(m, fmt);	\
+	}					\
 })
 
 static const struct ptdump_prot_bits pte_bits[] = {
-- 
2.25.1


