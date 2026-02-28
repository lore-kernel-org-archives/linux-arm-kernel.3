Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49910FD0040
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b1vxRCPG0GEyJG0dLWnSAzn6wjV232WVUDRNGvKP04U=; b=JppKg5OtvKTH32
	8Z87izbmAuhOi/wBPlALqWiuNsijF19mhWLRkB1EpU1wmMQchT2uOGNtzbjocQ1ffW+MYDMrmn2jc
	oza3DHXDf2dtsLmJbNC1Fg7Qjwg1nlLhhi0AYZZ0lxW15cwHnEa13KmhperhyRBrcsm9IAo3esKfj
	g/3nQXFYQXy+xW0l1MGxP+J9jisVgfzIFcytuze1G+GZE7qmsFQ7mJD0pqMYVyJUe3mcq0UG4orfb
	Fm4XBgg9q9PGLCzslyTiDZtZehUNUYz+YjXyCDcg6STSU4ryVXsoMJ2YYswOlmpjqxQZrCPMTxGH9
	pKulVztc16T/dcRgG5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSY6-0000000AJl4-1diu;
	Sat, 28 Feb 2026 22:12:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSY4-0000000AJkA-08IZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:12:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a8fba3f769so15137785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 14:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772316751; x=1772921551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1vxRCPG0GEyJG0dLWnSAzn6wjV232WVUDRNGvKP04U=;
        b=Mk0KNy51/S5sLyBULBi5mOzOC4+fBMrJpujDobTFA/o0kN4K4/bflZlnkGVfMMeRwh
         R6syyTF3cGAnNz+ZDlaWfS2lqnBV5U8Oc8pHnHJl0Aqk7NdBFxpwfM9pktfONgC5FvTf
         /l+S1IHPrW4cHwB0wYI52YpXb+Q7PIeBXcr3wB0FmM33YBNMGKI/m43VR9ibUb6oHvLs
         mpgpZ7QGuy7GMe/KjRyTt4bbxxNG7g9QiPNVjAfFRKo9nloqMinRrimoTMBJZ5nfeGer
         xA78GhafJ6mzxA43O/eOeShmUKTwnN4a1IkcoVJwaw3R9pPyYzRbDwhXIhhKfQ3TYmgo
         85Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772316751; x=1772921551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1vxRCPG0GEyJG0dLWnSAzn6wjV232WVUDRNGvKP04U=;
        b=PyRw9ydcXqA/sKtwtSH23IGO/nJIvacAwDnNFKLMln0xrYdkzUXz01Jr3N/8ayLAcp
         aSRHT9l4tZzOEzajpWzAn0FzjmPgV5zlx0/LXdZMJqEwCDbcICuKgDTWrwS8kg11UYXC
         gG3Nv6WtgnNmULjjaGCLLcATDmhWg1Gc6T6brQriZEcrZInOzBR3bcNenTo0ldeNEjIs
         MsqR6EyY06ZgcerEQvryHj37ne5PYrqZJ2g/amh9fhv7WBVMxiCotFjfP2vezbhb2G2I
         hPFRj5f3teMMPdnMzckO8WacfPCd2vWNR5ygXclwmN8R4QqbCegp0YfnlWqMX1L5v83v
         Ak3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVitHvEaMzwpXEd9XstUpUeCjBBj9IUt1BGjj8Z5Nd4H3oF5N2Vjel36+YxxSbyGWtIgsdqUb2yiuQjys9SlRW2@lists.infradead.org
X-Gm-Message-State: AOJu0YzjnmN6wWjjeE4oxYY+AcPxCBjzJPZHOahdv16QWq1lO9JdwSxC
	gP1SqadvrRyQckh8bsbyYuLKh1YxaI5WF001470uo21EE3+XJAJBPLPP
X-Gm-Gg: ATEYQzxyPDlqRSBxMKTjjUoWxxLyYxlfQrwedxBlzAUX/IwbOgo4VTNEOoPz8cX0lHS
	ex50y7W/AbqSnf9oqQgApLSNxWVs4zaM3G1ODIYkpnKpR7E+t42Hu6l2vrYOsGLwNUmq5iqg3C4
	t8A1gDYxZw0lWQi9Gdyiyt78ZrGvtB3m61y5FOMZCuvMq0SZoFX3TP9/PtFg89Z6B3P3E5nZllA
	5gxWuU01U1D+E0RSWojOW3kX7rmw8KF1bTD36LiwtAumHSCq8O8QyMp9HZIYxpo908nsMUA4Fdr
	YNOBZnPQO51dij2G3FTPRifmfLMIgT9KWoibeTg6fCUfSlQceFUXRqg+qoT0lfON3b6whSBvOxP
	V1GLBqqS/5PB6DVwHLSIhID6QqMHlLexwUfqy5fFSK52ke8YOFMuoKAkcmnH3rFOy0CyZVMWj/e
	HORYS0otsTmoBR35KscVmhcEnA+Sxkeqbyas3/
X-Received: by 2002:a17:902:ce91:b0:2a0:c58c:fdd2 with SMTP id d9443c01a7336-2ae2e4b0e92mr83742325ad.26.1772316750783;
        Sat, 28 Feb 2026 14:12:30 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b4160sm89495125ad.64.2026.02.28.14.12.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Feb 2026 14:12:30 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/5] arm64: Provide dcache_by_myline_op_nosync helper
Date: Sun,  1 Mar 2026 06:12:16 +0800
Message-Id: <20260228221216.59886-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_141232_079521_2C3A715D 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

dcache_by_myline_op ensures completion of the data cache operations for a
region, while dcache_by_myline_op_nosync only issues them without waiting.
This enables deferred synchronization so completion for multiple regions
can be handled together later.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/assembler.h  | 25 +++++++++++++++++++------
 arch/arm64/kernel/relocate_kernel.S |  3 ++-
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index d3d46e5f7188..cdbaad41bddb 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -371,14 +371,13 @@ alternative_endif
  * [start, end) with dcache line size explicitly provided.
  *
  * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruction
  * 	start:          starting virtual address of the region
  * 	end:            end virtual address of the region
  *	linesz:		dcache line size
  * 	fixup:		optional label to branch to on user fault
  * 	Corrupts:       start, end, tmp
  */
-	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
+	.macro dcache_by_myline_op_nosync op, start, end, linesz, tmp, fixup
 	sub	\tmp, \linesz, #1
 	bic	\start, \start, \tmp
 alternative_if ARM64_WORKAROUND_4311569
@@ -412,14 +411,28 @@ alternative_if ARM64_WORKAROUND_4311569
 	cbnz	\start, .Ldcache_op\@
 	.endif
 alternative_else_nop_endif
-	dsb	\domain
 
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
 	.endm
 
 /*
  * Macro to perform a data cache maintenance for the interval
- * [start, end)
+ * [start, end) without waiting for completion
+ *
+ * 	op:		operation passed to dc instruction
+ * 	start:          starting virtual address of the region
+ * 	end:            end virtual address of the region
+ * 	fixup:		optional label to branch to on user fault
+ * 	Corrupts:       start, end, tmp1, tmp2
+ */
+	.macro dcache_by_line_op_nosync op, start, end, tmp1, tmp2, fixup
+	dcache_line_size \tmp1, \tmp2
+	dcache_by_myline_op_nosync \op, \start, \end, \tmp1, \tmp2, \fixup
+	.endm
+
+/*
+ * Macro to perform a data cache maintenance for the interval
+ * [start, end) and wait for completion
  *
  * 	op:		operation passed to dc instruction
  * 	domain:		domain used in dsb instruction
@@ -429,8 +442,8 @@ alternative_else_nop_endif
  * 	Corrupts:       start, end, tmp1, tmp2
  */
 	.macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
-	dcache_line_size \tmp1, \tmp2
-	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
+	dcache_by_line_op_nosync \op, \start, \end, \tmp1, \tmp2, \fixup
+	dsb \domain
 	.endm
 
 /*
diff --git a/arch/arm64/kernel/relocate_kernel.S b/arch/arm64/kernel/relocate_kernel.S
index 413f899e4ac6..6cb4209f5dab 100644
--- a/arch/arm64/kernel/relocate_kernel.S
+++ b/arch/arm64/kernel/relocate_kernel.S
@@ -64,7 +64,8 @@ SYM_CODE_START(arm64_relocate_new_kernel)
 	mov	x19, x13
 	copy_page x13, x12, x1, x2, x3, x4, x5, x6, x7, x8
 	add	x1, x19, #PAGE_SIZE
-	dcache_by_myline_op civac, sy, x19, x1, x15, x20
+	dcache_by_myline_op_nosync civac, x19, x1, x15, x20
+	dsb	sy
 	b	.Lnext
 .Ltest_indirection:
 	tbz	x16, IND_INDIRECTION_BIT, .Ltest_destination
-- 
2.39.3 (Apple Git-146)


