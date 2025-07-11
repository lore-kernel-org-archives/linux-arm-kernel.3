Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5970C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RXVgCpEDLHiYI8Gnm88h1oFXs+ze9ZlmxfNJPHB9Mo=; b=bEyQm5Zg3N9VzZvAR+E6Owr2t6
	tz1WrgbxNBzFUVTQx0m17X02C/pot5d8calWkA8+CagU7d90p5mYRe1doYJR7xIIfpYm8OFXai6dn
	EigmYMLDtXrZ5UpgDrpeUGa66C9UfvCbFiN8cjyG04+U9m0Z0b557fd+h2ku/Py+GvSUuWo3RHchv
	6ALAhE2HpnzTtgYSCnZqXBkMPNYxwu/x9Dvg6VJ80+iFJ7qb0Mf1vceDYwpVHOcYRpjDXb8q17bEz
	BUrzNh1McShYFmQVnBgBUJBvoTi31DXaTnVWlpVpBR3RRRjV8Rp+laX4gM7ZEZkkJg1yN8EH9PZRX
	LCBfH85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHVh-0000000FOhM-0rVj;
	Fri, 11 Jul 2025 17:26:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRn-0000000FGHc-2LkV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B89643793;
	Fri, 11 Jul 2025 16:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4090BC4CEED;
	Fri, 11 Jul 2025 16:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250683;
	bh=AuZ9fTTOEu8jUPZc0v6I8pAQSkyfRml4JgY7xt6+Jko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5oVx7eRlm5cJmNhjSbPJySGMgrCGkb69GM1qLknnOUZ5hzqKNSC/xi5T+5LPaloF
	 mMGGIuXqQih0GCiKWUSfnscKG3nRV2nKK7LDsQDTW5Qa0FX7E7qvM1Z1ICnNE5Y7P2
	 j8EaB0ysrbG+2Uuh+siMhtWr70gDV6faF78BdlvtOPKogPnuGbMFF9wwBxeWA/hsdL
	 ByXJMljfJA6KDwQh1MFNkbKoTd7HQ+kFwYDTmw/esY5+dC+6jBw4YfHrkuYVS24hJS
	 EpnfGuno197YnU/hnJNzk9L6F2gFcD57MjQEfcUh2RPa/yhAELYe2cZQFVqFJrizzb
	 4uR4+DhwT6AwA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 09/10] arm64: mm: Simplify __flush_tlb_range_limit_excess()
Date: Fri, 11 Jul 2025 17:17:31 +0100
Message-Id: <20250711161732.384-10-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091803_634581_EBD2485C 
X-CRM114-Status: GOOD (  14.73  )
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

__flush_tlb_range_limit_excess() is unnecessarily complicated:

  - It takes a 'start', 'end' and 'pages' argument, whereas it only
    needs 'pages' (which the caller has computed from the other two
    arguments!).

  - It erroneously compares 'pages' with MAX_TLBI_RANGE_PAGES when
    the system doesn't support range-based invalidation but the range to
    be invalidated would result in fewer than MAX_DVM_OPS invalidations.

Simplify the function so that it no longer takes the 'start' and 'end'
arguments and only considers the MAX_TLBI_RANGE_PAGES threshold on
systems that implement range-based invalidation.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 8618a85d5cd3..2541863721af 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -470,21 +470,13 @@ do {									\
 #define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
 	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, kvm_lpa2_is_enabled());
 
-static inline bool __flush_tlb_range_limit_excess(unsigned long start,
-		unsigned long end, unsigned long pages, unsigned long stride)
+static inline bool __flush_tlb_range_limit_excess(unsigned long pages,
+						  unsigned long stride)
 {
-	/*
-	 * When the system does not support TLB range based flush
-	 * operation, (MAX_DVM_OPS - 1) pages can be handled. But
-	 * with TLB range based operation, MAX_TLBI_RANGE_PAGES
-	 * pages can be handled.
-	 */
-	if ((!system_supports_tlb_range() &&
-	     (end - start) >= (MAX_DVM_OPS * stride)) ||
-	    pages > MAX_TLBI_RANGE_PAGES)
+	if (system_supports_tlb_range() && pages > MAX_TLBI_RANGE_PAGES)
 		return true;
 
-	return false;
+	return pages >= (MAX_DVM_OPS * stride) >> PAGE_SHIFT;
 }
 
 static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
@@ -498,7 +490,7 @@ static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_mm(mm);
 		return;
 	}
@@ -547,7 +539,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	end = round_up(end, stride);
 	pages = (end - start) >> PAGE_SHIFT;
 
-	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
+	if (__flush_tlb_range_limit_excess(pages, stride)) {
 		flush_tlb_all();
 		return;
 	}
-- 
2.50.0.727.gbf7dc18ff4-goog


