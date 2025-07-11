Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED884C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEoi0PVahm6/KM7qs5t2gZMvKwQHnZ6cDjacg+0R7QQ=; b=C41I7v2ZpxvtiM9Yqkd/ExhSRm
	2u3bYHSbEBgbQKFsYvrIgpvKHkqNn9Q8Z0TlCplOOW7eyCcStx7nFH3rR/w8H68LM++ZzMoKjd0a8
	A6/LvhQacOrCXw5EiIVeA7dmWaHgXL15n0XpfOmqIOzY+kfcv855HiOKE+zMxWWdl7dh2G5puae+K
	dAbdxfDlyeTT6anTE4CdtKJSvfHnQxkvkHowwZ9JWJZs147R1+IvM5Ike43z6zmo0LNT0P9CAxjK8
	2UehidIijTXfQ5kHCuoMMqcROwYPvenHvnkSFKzG6Gt1BDDCm6VvdwYdJDURb7tXm9bUmds3Bcem4
	ufBt/uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaH79-0000000FM23-2ygD;
	Fri, 11 Jul 2025 17:00:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRX-0000000FGCQ-0xJU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B9CC61433;
	Fri, 11 Jul 2025 16:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4805CC4CEF5;
	Fri, 11 Jul 2025 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250666;
	bh=q5+HuLJh1JU1y/46sorbdFwVVHM1smyj615SFqQ/6i0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t4MVo+eEZhW6ZtkMaOr5iS7MraQkoRsWptpg+/xXCDh9nyCeKzpJ3qzBhljEOupxN
	 X8tGW8EPr5PUWkVFX7h1YMA3+g7GDp7V53CuIPkhGzp5eK98l8OmFAF1RRmkerE55R
	 JhcXBJr5t/9WR9V7BV9j2kLXUl3olanDE+L2yoWCehqigvku5iab7x2b700RcAvnRD
	 fn9izzwO8Z7VEmu2z/lBWNyfxmxCU9SdRpK/CiBmZI5WtlEGiQY3S9+ZMgsj/HAKAT
	 kqiqykYPCVHzVF0nbEFiV0cOWKtvXgvYprHDKx4EKAQxo0LcVtaSDeuc5AW0eBuERM
	 A0eebe0uqA7Ww==
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
Subject: [PATCH 02/10] arm64: mm: Introduce a C wrapper for by-range TLB invalidation helpers
Date: Fri, 11 Jul 2025 17:17:24 +0100
Message-Id: <20250711161732.384-3-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
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

In preparation for reducing our reliance on complex preprocessor macros
for TLB invalidation routines, introduce a new C wrapper for by-range
TLB invalidation helpers which can be used instead of the __tlbi() macro
and can additionally be called from C code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 1c7548ec6cb7..4408aeebf4d5 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -418,6 +418,24 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  *    operations can only span an even number of pages. We save this for last to
  *    ensure 64KB start alignment is maintained for the LPA2 case.
  */
+#define __GEN_TLBI_OP_CASE(op)						\
+	case op:							\
+		__tlbi(r ## op, arg);					\
+		break
+
+static __always_inline void __tlbi_range(const enum tlbi_op op, u64 arg)
+{
+	switch (op) {
+	__GEN_TLBI_OP_CASE(vae1is);
+	__GEN_TLBI_OP_CASE(vale1is);
+	__GEN_TLBI_OP_CASE(vaale1is);
+	__GEN_TLBI_OP_CASE(ipas2e1is);
+	default:
+		BUILD_BUG();
+	}
+}
+#undef __GEN_TLBI_OP_CASE
+
 #define __flush_tlb_range_op(op, start, pages, stride,			\
 				asid, tlb_level, tlbi_user, lpa2)	\
 do {									\
@@ -445,7 +463,7 @@ do {									\
 		if (num >= 0) {						\
 			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
 						scale, num, tlb_level);	\
-			__tlbi(r##op, addr);				\
+			__tlbi_range(op, addr);				\
 			if (tlbi_user)					\
 				__tlbi_user(r##op, addr);		\
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
-- 
2.50.0.727.gbf7dc18ff4-goog


