Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1463E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 01:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7wVaI7qK2wPTd+ohbRhZB4OSfyEFrr8MoJXJLzkunD0=; b=WNsLEPtDiaQu14N2KXIMXtWgp+
	cwae9OV9KuWtEayJQb/FI5Mt5MlBF7NdkW7HfwBAA1+4ZSK4BCLaLFV3OIixkDh2guclSvqs/4gnm
	XlnKECjSTB05kGklwX6vn82sj0Qsq8DY5e1j+yXeYN2vZHulW8Hsfx6bqCy/77xDye9kXEm6KXEl9
	O7Wjd+S3TjLcZUZASSg9MBBHIXHGxvgRy9euxxRzXx94iojyaQc/bSL5E4+ltNwOg261Pkz68VRHF
	JNeNF+aHsxo98xDPil5GpZwXrKfK3Ie0SlAqj5A4vmviv62MMcs2jVQIHVXe09hq+jbuLi+H3VIsC
	+sU19Nrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUypx-000000039pu-46Zt;
	Tue, 07 Jan 2025 01:56:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyol-000000039kg-40Vq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 01:55:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4362B143D;
	Mon,  6 Jan 2025 17:56:06 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.54.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F3AD3F66E;
	Mon,  6 Jan 2025 17:55:34 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Replace open encodings with PXD_TABLE_BIT
Date: Tue,  7 Jan 2025 07:25:29 +0530
Message-Id: <20250107015529.798319-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_175540_039542_70207F06 
X-CRM114-Status: UNSURE (   8.72  )
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

[pgd|p4d]_bad() helpers have open encodings for their respective table bits
which can be replaced with corresponding macros. This makes things clearer,
thus improving their readability as well.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.13-rc6

 arch/arm64/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6986345b537a..e20b80229910 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -896,7 +896,7 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
 	pr_err("%s:%d: bad pud %016llx.\n", __FILE__, __LINE__, pud_val(e))
 
 #define p4d_none(p4d)		(pgtable_l4_enabled() && !p4d_val(p4d))
-#define p4d_bad(p4d)		(pgtable_l4_enabled() && !(p4d_val(p4d) & 2))
+#define p4d_bad(p4d)		(pgtable_l4_enabled() && !(p4d_val(p4d) & P4D_TABLE_BIT))
 #define p4d_present(p4d)	(!p4d_none(p4d))
 
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
@@ -1023,7 +1023,7 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
 	pr_err("%s:%d: bad p4d %016llx.\n", __FILE__, __LINE__, p4d_val(e))
 
 #define pgd_none(pgd)		(pgtable_l5_enabled() && !pgd_val(pgd))
-#define pgd_bad(pgd)		(pgtable_l5_enabled() && !(pgd_val(pgd) & 2))
+#define pgd_bad(pgd)		(pgtable_l5_enabled() && !(pgd_val(pgd) & PGD_TABLE_BIT))
 #define pgd_present(pgd)	(!pgd_none(pgd))
 
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
-- 
2.30.2


