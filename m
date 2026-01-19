Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED75BD29C53
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ8eYbhVlhdIEoBhAb95BzrWlfeAYRBLk+ZXapq9NeM=; b=OOhiCBbgyWfmORWhJXoKEOM3xt
	SSB4Rtpc4ZQVPU1DR7bBkyRUJMQ0tjHoiD9wKEDUDcFsefEGfUxhaUic65r79Ij0mKLx0l+QA4KKA
	Pv0Zveyiv/f4fXPHsXIeoSimvaqfuvWU76zWOKgl+Fq41MPuJcSIN/2pf+FkMJ3GepqO9Q07zm02T
	LM7cy0A5PY3ZaV+wwBsBaMio8e0bN0Bo9Diw+iOhsTaKCHnkiE57y1AgVIv6dVy7bEqj5deYg119F
	tv6E4mUrDGErhoiRF6SPvkaqPhY76Qp2GLuaEVpP2rutaOomhzPFOqPiXPRiQGJ8xk2MGmxXOcK2r
	EpYRjCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxd-00000002coD-2TRM;
	Mon, 19 Jan 2026 17:22:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxU-00000002cfE-17WK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KZ8eYbhVlhdIEoBhAb95BzrWlfeAYRBLk+ZXapq9NeM=; b=AwWGWotMYyPEliW4N70gDLEClc
	f1Usy1NsGV6p6Wdzj44ez6hum2tb/gnLO6mHYRhmUcTN1K1R7Ny3ukjrN78JQuRW6spPqEeHXc9eU
	VmhFoeZGgS5J+S8ifdC8+pGJBIbfW2SdXg1Sn3D3ae6OtLXOWncC/oMOx2EAO6yTB6KqfJ4LU4SLx
	phDuXduVVMn0Akyzrdhgd4v+RXYLJywZk7GaIuUgLr63gYnA9ZD85d4KoKVb12ZPmJJ579deJISbe
	QjfsJTPMt0UzQtaBY2xUGeLFuYnlhSWsHqtbKGOP7fpIIEc4XrBuDUj2Gx/nGiRwUbixGA9HhJrf9
	lFBzQJ5g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxR-0000000CfiE-1FUY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D528FEC;
	Mon, 19 Jan 2026 09:22:21 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FFD93F632;
	Mon, 19 Jan 2026 09:22:26 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] arm64: mm: Simplify __TLBI_RANGE_NUM() macro
Date: Mon, 19 Jan 2026 17:21:54 +0000
Message-ID: <20260119172202.1681510-8-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_172229_509378_C31064E8 
X-CRM114-Status: GOOD (  10.32  )
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

From: Will Deacon <will@kernel.org>

Since commit e2768b798a19 ("arm64/mm: Modify range-based tlbi to
decrement scale"), we don't need to clamp the 'pages' argument to fit
the range for the specified 'scale' as we know that the upper bits will
have been processed in a prior iteration.

Drop the clamping and simplify the __TLBI_RANGE_NUM() macro.

Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a8513b649fe5..cac7768f3483 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -207,11 +207,7 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
  * range.
  */
 #define __TLBI_RANGE_NUM(pages, scale)					\
-	({								\
-		int __pages = min((pages),				\
-				  __TLBI_RANGE_PAGES(31, (scale)));	\
-		(__pages >> (5 * (scale) + 1)) - 1;			\
-	})
+	(((pages) >> (5 * (scale) + 1)) - 1)
 
 /*
  *	TLB Invalidation
-- 
2.43.0


