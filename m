Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFAFC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 03:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEBvV9gjKrbuABjrjbq9iRE3PsX+PTSdkrbdKxkE1G4=; b=ttuu1bP5Hw5c4wimRtmrge6wL2
	IVGdRKPaHKTf7wU5sH/hygCXEoqQSdOj4aght+VNc2ZOGhdxCy4CyovcWeM7dFqTCH9CmEQxszuX6
	XwGZkD5YVs9gLOou2yuGI6FNj5Y1c+rNDHycRBW4lz66Etj0sFYBtuDYprYyEGH62boUM0GJDK6ZQ
	wigeLUYDQ+5i2PJUqhlGCbtHUsQjvH674IUBbAxrol5Nw2YvNw8nMDLP/i/0DdG//4JdziXlG902n
	BNAAZmUXAW1HentjuSoJtxgr3o104JLdLm1b74xzvrqKrDlZjkrW7lg9zQg8Wrb14HQL1MloVPdTm
	MYAt/RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QON-00000005o3Y-0yNh;
	Mon, 07 Sep 2026 03:51:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3QOA-00000005nxP-1j5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 03:51:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16E41BA8;
	Sun,  6 Sep 2026 20:51:16 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9999D3F7B4;
	Sun,  6 Sep 2026 20:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788753080; bh=Qb+7E8NXipxvoAEHwL2Au3g/XDt1GmXueAfBnPSqsJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lKEnAII+5BcNq0/1T2NrvYL3H4zsr6jbJe17vY4vHbGtC5Ka7nzO99iXt8eHS5Maf
	 DUh3npYqcQW/MG/QV9gj8aGR+OWVu2/7LIT0nnrpnjXk7rBdDRVbBdyr+CQYOu3SFr
	 xyxdDNO5/m6NQtaItwuz7F+PRbFHlpCj5q5LgVLM=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com
Subject: [PATCH V2 12/14] arm64/mm: Relax KASAN shadow alignment for FEAT_D128
Date: Mon,  7 Sep 2026 09:20:27 +0530
Message-ID: <20260907035030.2839978-13-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907035030.2839978-1-anshuman.khandual@arm.com>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_205126_152504_79905E20 
X-CRM114-Status: GOOD (  12.87  )
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

D128 reduces the number of descriptors in each translation table, causing
some VA size and page granule combinations that use two page table levels
with D64 to now require three levels.

For three-level page tables, the PUD level is folded while the PMD level
remains a real translation level. Hence, PUD_SIZE represents a root-level
span. With D128, some configurations have a KASAN shadow region smaller
than this span, making it impossible for both KASAN shadow boundaries to
satisfy the existing PUD_SIZE alignment requirement.

The KASAN initialization code on arm64 already supports shadow boundaries
which are not root-level aligned, by installing or cloning the next-level
table as required.

Similarly for three level D128 page tables, relax SHADOW_ALIGN to PMD_SIZE,
which corresponds to the first non-folded level below the root level. Keep
the existing alignment requirements unchanged for all other configurations.

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: kasan-dev@googlegroups.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/kasan_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index f61f5bc09467..e12abea6ad15 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -178,7 +178,9 @@ static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
 	} while (pgdp++, addr = next, addr != end);
 }
 
-#if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
+#if defined(CONFIG_ARM64_D128) && CONFIG_PGTABLE_LEVELS == 3
+#define SHADOW_ALIGN	PMD_SIZE
+#elif defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS > 4
 #define SHADOW_ALIGN	P4D_SIZE
 #else
 #define SHADOW_ALIGN	PUD_SIZE
-- 
2.43.0


