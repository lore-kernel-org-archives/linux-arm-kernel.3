Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08BCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MY7bxFJYtXm8HUtlybSD4F1Gat7DlZMqvsph0TlNDiw=; b=ZRRDqLm5wVKsf5QTqOSJHZFQi5
	2lOUAvStguNCUrMC2LuqGv7KWT491PWzDsFAR1zyHRJfc7V20ss1KSsSiMR+TovzkTmmF3hRTd/m2
	daK2VqqpngmNOs++zssSNt7kA+fgFv7JS8dDscYeUui9Ax5AwMiI5aKpcmGAs4KMu7lNTSDuxAQuv
	CBSoX72hGfC6T2iOBJB0OF21SS9gLpjB/9La3OEgq7hRkP74naVxI69uDm0yFeUbyjulY5KUV04cB
	fKDEUSlQ5cqYvIWJr3ven82+QF7L0htcmfOz1YHwBbUzjSn7oPUqa2sr057kEf95qT3EomNaHm3GX
	nhQEPL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHGO-0000000FMnm-2nrd;
	Fri, 11 Jul 2025 17:10:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRg-0000000FGFL-0hFr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4229472BD;
	Fri, 11 Jul 2025 16:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D755DC4CEED;
	Fri, 11 Jul 2025 16:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250675;
	bh=Xuzx6uwSk0yNzSsVAXXMPAY9gCduvpNUj0iAmpfZdno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E8EoeJ8N9T8OaOoWAHbFraEkEQd6Ze+Ty6mhEeSmdVVdVQ2vIHINyKH8HtEz+v5dJ
	 wpSPpI1Gg/2plhs+yU0fhXRgHc3G5g2Nh4T7LprrsfqHKouSZxOXFX1CrsSYKjgY9q
	 uWbIqK6mopmsNhh522MlTaftjZrATL2gvSI5M+2aycE/kKAmZbDEQGb8hvBJmuk3C7
	 pZo1B23Nbpn7Hz4e1dgrcxkhzxw6tPYIN5bhVjKdFgdcoAf/CFrcb5hdhF5jRVP8xr
	 zTVbW0FjrddOl6kc72mbDxT25XCWW+gF4xmV4OWRO9t+zrLK8kaiFtdUpzndhNKD+h
	 CtQDfARzY3FfA==
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
Subject: [PATCH 06/10] arm64: mm: Simplify __TLBI_RANGE_NUM() macro
Date: Fri, 11 Jul 2025 17:17:28 +0100
Message-Id: <20250711161732.384-7-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091756_222140_8C143BB2 
X-CRM114-Status: GOOD (  10.70  )
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

Since commit e2768b798a19 ("arm64/mm: Modify range-based tlbi to
decrement scale"), we don't need to clamp the 'pages' argument to fit
the range for the specified 'scale' as we know that the upper bits will
have been processed in a prior iteration.

Drop the clamping and simplify the __TLBI_RANGE_NUM() macro.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index ddd77e92b268..a8d21e52ef3a 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -205,11 +205,7 @@ static __always_inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 le
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
2.50.0.727.gbf7dc18ff4-goog


