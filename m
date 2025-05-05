Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33FDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiXsY6i3CU4I0qkujJNdjQUh6frATBliU+6G2LaWlFE=; b=2HX4LiXDjCK/K91ZhHK3BPpFbI
	Ov7peUYZN7r5DzhruVJwLOf1h6gq+1fVu8HY7Sp6PujmU/gI4dYWOTufp74jBfgPFeriy+smLFmYL
	LcKf8dWjtxYXKs58U/+avz/nzZe3RdFsqExtZ+hCYPU7/OX0osGetsWbh13P5T+U+DZO/a7DnIX64
	EMw/IjQhNDYnIzA2lewu27cApFiYPSxXymfXQdRoUbx9VmQJwr68SUvsi2R/Q9Ho2IZKvYlyRsuEq
	l1Fo4zEoTSyQFnzegIa0Ma5lwYyoVO3WML68+pS3VFmUHJNMmyOIkpFOJwkSyfKGJutNN5+isuLpm
	ubqFG6TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC94F-0000000A11p-3KU0;
	Tue, 06 May 2025 03:34:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4vI-00000008xs1-3B1y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56E6D629C6;
	Mon,  5 May 2025 23:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEA4C4CEE4;
	Mon,  5 May 2025 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486511;
	bh=lPog47QGvgV+ETJkQFbNqdqrBnE3MM2NASVff6hG8Ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VrK3DVQVFm5OGzkyQ31CGXU2GH4sqm9c9QohQumZm4U03zHOCsISUb76wxHnZBrM6
	 2azIpkwlccAlKz1gHo94HDjst0HkeKsPE9mFh8xj9e145YOIDH2ePLcH4JVX8iYib7
	 775tm4L2qnQ0d/8QCPgFW8nWf3d5n1oQIsWaSWU+478x6e6yDSDqNwiVYIx8by4x42
	 +/V6zPV9ru8FuR8VvmW8Zrc6cZGmEkGfGCGcqFgLk5wIuIYxIA1HcGzJX/wL0Aw+yV
	 gE0xjDtBglflH/YG/JqlAeCYHMrw3j6lUGa3Dkg7xM21nVlVqAQp9gwC/7vQcmkqU/
	 +C5+md690PyYA==
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
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	ioworker0@gmail.com
Subject: [PATCH AUTOSEL 6.1 068/212] arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
Date: Mon,  5 May 2025 19:04:00 -0400
Message-Id: <20250505230624.2692522-68-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
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
index 1d713cfb0af16..426c3cb3e3bb1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -677,7 +677,8 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	pr_err("%s:%d: bad pmd %016llx.\n", __FILE__, __LINE__, pmd_val(e))
 
 #define pud_none(pud)		(!pud_val(pud))
-#define pud_bad(pud)		(!pud_table(pud))
+#define pud_bad(pud)		((pud_val(pud) & PUD_TYPE_MASK) != \
+				 PUD_TYPE_TABLE)
 #define pud_present(pud)	pte_present(pud_pte(pud))
 #define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
-- 
2.39.5


