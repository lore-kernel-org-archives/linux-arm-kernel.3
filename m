Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827E0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U67n4UfbuEX1bsU2TttAIgoD+3IlzSc/ZROpiiWy2pQ=; b=jLPgIqkWigfNiji53UhpzvUu+h
	pIaE8ICUzQCVmBgIEyURMDOcmo5T0uTovkSUBJZCeu28xBixyYJc29+MysbxKkTPIYbDI6cdXrOG9
	28MeUUqjBTqeiyj1XMUuLg1IEbeGUqZl3re96NtZC3uuj+4e30kVoqLMypTPrjvOT4Gg4rfNpoohe
	nE6Bxl9aTEOn8zifhD7s7Z4rqa9mP6V/MAdE6+Au4tB0lR7y1egU3D8a3kFDXxLUw01ZW/7WJvI3r
	xjbo+c/PaSF1iS/N0xic3Ib8YwGsAWTfbexdmyBIgItM7ycZJw3iD6BlrmVjA8dg3Xq0A7+WH1GUb
	4Ps0DUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPd-0000000DK1Q-2bTw;
	Wed, 10 Sep 2025 09:46:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPa-0000000DJzr-3UPl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:46:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B44516F8;
	Wed, 10 Sep 2025 02:46:37 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 660793F63F;
	Wed, 10 Sep 2025 02:46:41 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH 2/3] arm64/ptdump: Enable console output in pt_dump_seq_[printf|puts]()
Date: Wed, 10 Sep 2025 15:16:22 +0530
Message-Id: <20250910094623.2356282-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910094623.2356282-1-anshuman.khandual@arm.com>
References: <20250910094623.2356282-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024646_912745_D303D558 
X-CRM114-Status: GOOD (  11.71  )
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
already sets seq file as NULL to avoid all output. Hence let's introduce a
special sentinel named CONSOLE as ((struct seq_file *)-1) which can be used
to identify kernel console output request for early kernel page table dump.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
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


