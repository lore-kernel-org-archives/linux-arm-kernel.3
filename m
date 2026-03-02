Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5258EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atJUZ30fOdNNWWwE+6CqhH8gXEItcNi27s1LcuoVq7k=; b=tXRzCgOjHMFS0SlzKS1fKUNK/O
	1oB46TveKFtH3tnLbITuU2ODmqUUlXCYD8mNxaAJYpR0uE3keb+Wm/ZQxv5N//hdS+F7oCiM0UZCF
	IP6P4kAUTo6THIpmO4E1o07nmiG41ZKcBYNoECW+PhsPm1TtCKssvZGpzXrDsD3nTdT+1SKYu4fgd
	y9yk5kbUnPyv55THGFJHLS3t+HXUC362UBW/al09D54U+UY/SGNHZ/UbsujzePpcYvIIUlgkKTR7/
	1c2jZVLK0riFcllfFKAuKqP8o/8chx60K5GGSx19B4MUqMIBx32z+S5cdri48iom2tRDMf61JZQb3
	5dE0wu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lD-0000000DArk-1e3W;
	Mon, 02 Mar 2026 13:56:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3lB-0000000DAnD-1jxA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:56:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E65FB150C;
	Mon,  2 Mar 2026 05:56:25 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64A7C3F73B;
	Mon,  2 Mar 2026 05:56:30 -0800 (PST)
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
Subject: [PATCH v3 07/13] arm64: mm: Simplify __TLBI_RANGE_NUM() macro
Date: Mon,  2 Mar 2026 13:55:54 +0000
Message-ID: <20260302135602.3716920-8-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302135602.3716920-1-ryan.roberts@arm.com>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_055633_500367_B3448958 
X-CRM114-Status: GOOD (  10.45  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 3c05afdbe3a69..fb7e541cfdfd9 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -199,11 +199,7 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
  * range.
  */
 #define __TLBI_RANGE_NUM(pages, scale)					\
-	({								\
-		int __pages = min((pages),				\
-				  __TLBI_RANGE_PAGES(31, (scale)));	\
-		(__pages >> (5 * (scale) + 1)) - 1;			\
-	})
+	(((pages) >> (5 * (scale) + 1)) - 1)
 
 #define __repeat_tlbi_sync(op, arg...)						\
 do {										\
-- 
2.43.0


