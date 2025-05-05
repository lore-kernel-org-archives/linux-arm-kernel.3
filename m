Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A236DC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OMDkTGh+JlpV10E88Mzeuni0wmWwcanP+qS80xGfzY=; b=rUlujdI1gcZ+aUFQvCyhrDZQQN
	NoybkDG+ypwEAEb4IPIv2CnJky+RwyvhEojFWJ9ClJKQkIoVrXw5q6qL7uxikRAJ1wqLXo/ZXQ9K5
	bUBrG163xAM5vLoh2cJ24cq2dHKRy5GWJwyHThxExDNj21bsQ6E0YeIrnX9pi8jrUUyaSMvZjexxy
	n6dfM158ORy7a8CyHCUetVN4/5R1HYw3hp9wUi6HodGNPiwOZyYH+sbyWjnL+yZYKab410GibynI7
	71a74T8RevE7hwAqXD7ndjpYONT9Be9++PUAoatlcqB73QHRzvJCWzV0VJcMS31xeK8W3v9Xxc9mc
	04Bx8RjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4t4-00000008xG3-2kce;
	Mon, 05 May 2025 23:06:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4BY-00000008jHj-0C4n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:21:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53FF05C464A;
	Mon,  5 May 2025 22:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BE1C4CEED;
	Mon,  5 May 2025 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483675;
	bh=nMybSd9P73GOU9SQXR+ME8+KbTqZTewh6IKdLOvEF6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rtoejkVaXOexgdrfxpiY0JRz6WtwRDYcneYKa88LaYu1u6y4/PkFJmDp2E5S3OLJ7
	 n5K+dHm5Gps5TVeBwJnlch8/S2MT3pSQqLIUXk1x5MLBEONpFc1D58Ub2obWjvmrRD
	 tDORZIuSxJmtKPpozWAQA8vpAdxKpj5Q8xUJqrVl/Q+qw6fLUM1kj1wMpfjBIvMh2G
	 +XwlceUK1PfSP5A7MBjiERa8MfwZNur2tn6zYI8UuF2YmEmIq4LhgoMdNGcyDsSUuh
	 y6W2+v+Bd9Didd/PTiXwEjPQkalKvrLY0BDsf/5wwifXCSyczMg2GSY5yHmrjjriTc
	 SnXMVAr9wN8Ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	akpm@linux-foundation.org,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	ioworker0@gmail.com
Subject: [PATCH AUTOSEL 6.14 173/642] arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
Date: Mon,  5 May 2025 18:06:29 -0400
Message-Id: <20250505221419.2672473-173-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152116_133334_8A1EC645 
X-CRM114-Status: GOOD (  11.72  )
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

From: Ryan Roberts <ryan.roberts@arm.com>

[ Upstream commit bfb1d2b9021c21891427acc86eb848ccedeb274e ]

pud_bad() is currently defined in terms of pud_table(). Although for some
configs, pud_table() is hard-coded to true i.e. when using 64K base pages
or when page table levels are less than 3.

pud_bad() is intended to check that the pud is configured correctly. Hence
let's open-code the same check that the full version of pud_table() uses
into pud_bad(). Then it always performs the check regardless of the config.

Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/r/20250221044227.1145393-7-anshuman.khandual@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index abf990ce175b1..665f90443f9e8 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -805,7 +805,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	pr_err("%s:%d: bad pmd %016llx.\n", __FILE__, __LINE__, pmd_val(e))
 
 #define pud_none(pud)		(!pud_val(pud))
-#define pud_bad(pud)		(!pud_table(pud))
+#define pud_bad(pud)		((pud_val(pud) & PUD_TYPE_MASK) != \
+				 PUD_TYPE_TABLE)
 #define pud_present(pud)	pte_present(pud_pte(pud))
 #ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
-- 
2.39.5


