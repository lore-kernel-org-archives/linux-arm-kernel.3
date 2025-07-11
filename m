Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC621C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI8jHr+FpGiCOpU4zs610Fkg4ZV5gINbqqzXwUmbrmw=; b=U722za0JYuCEYsRjPfqSSC83Rl
	AO8DzZSvXzhUmub7dxEh5OIudkMTupAU8lDumEHXZFBnLkfNrmi6df9n7cvV4dCFLupzns/nGCf/H
	3pZweAHAkpYn21gS69ln6RuCXya54EsJoZLTsa15Yoiripgw5h23yk6x23oEZSam4FTx5EpxAF+Pg
	yDPk1AQW10P83odSPJsyCg2HxRrsZteCGH3QD8TYiYGVdTsdYd5xFW5Xe98INs8Ve233TIjCqqIIg
	MlRdf8w0LpO/TfR+MidI65wO4X2SdnW2fFaTRnNdXbm3rtpRR10By+h9ow1Q0mu9y7U5SjKWqaTap
	bSRMvOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaH4q-0000000FLkK-49th;
	Fri, 11 Jul 2025 16:58:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGRU-0000000FGBk-2Tys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 16:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 213995C71FF;
	Fri, 11 Jul 2025 16:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA647C4CEED;
	Fri, 11 Jul 2025 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752250663;
	bh=OxLUcaS+mva8YPmoE0SCu30mpSKl3MfgIv/3sz5pLSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pu3CDGI7gtFmF+qiVxu4UuGFf0kYyLet7UFwqfJtrlybo5L+Aw5JYH6JhSUi4TUEP
	 y5m2Ke1W0ppaxpDSdnJd+acjFjWKxp20q3eKPIb2ftjpJ4NfUbDSvfVDz435hOGCFS
	 wovLcYQWByRaS+uoaEMWxkRlwfWVvENvWMxbuCbb8YVniNQ6dIcp8VPEoGVFy+Ts3F
	 xJE7oJ9B+6wIrDfopjzrVq9Yg+fBm+8LVmFrZVe7UHCKo3RlaUugw2L7J1N3ZdF/Zc
	 SVyFGzIfFH+xtnqHFxhj3AT52CJraXOPLlUb8bs+QVjk6nGv8YhbzAZG7/FilvET8E
	 6BuzS8K5pzyYA==
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
Subject: [PATCH 01/10] arm64: mm: Introduce a C wrapper for by-level TLB invalidation helpers
Date: Fri, 11 Jul 2025 17:17:23 +0100
Message-Id: <20250711161732.384-2-will@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250711161732.384-1-will@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_091744_669972_B1EDF4FD 
X-CRM114-Status: GOOD (  12.34  )
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
for TLB invalidation routines, introduce a new C wrapper for by-level
TLB invalidation helpers which can be used instead of the __tlbi() macro
and can additionally be called from C code.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index aa9efee17277..1c7548ec6cb7 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -88,6 +88,16 @@ static inline unsigned long get_trans_granule(void)
 	}
 }
 
+enum tlbi_op {
+	vae1is,
+	vae2is,
+	vale1is,
+	vale2is,
+	vaale1is,
+	ipas2e1,
+	ipas2e1is,
+};
+
 /*
  * Level-based TLBI operations.
  *
@@ -105,6 +115,27 @@ static inline unsigned long get_trans_granule(void)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
+#define __GEN_TLBI_OP_CASE(op)						\
+	case op:							\
+		__tlbi(op, arg);					\
+		break
+
+static __always_inline void __tlbi_level_op(const enum tlbi_op op, u64 arg)
+{
+	switch (op) {
+	__GEN_TLBI_OP_CASE(vae1is);
+	__GEN_TLBI_OP_CASE(vae2is);
+	__GEN_TLBI_OP_CASE(vale1is);
+	__GEN_TLBI_OP_CASE(vale2is);
+	__GEN_TLBI_OP_CASE(vaale1is);
+	__GEN_TLBI_OP_CASE(ipas2e1);
+	__GEN_TLBI_OP_CASE(ipas2e1is);
+	default:
+		BUILD_BUG();
+	}
+}
+#undef __GEN_TLBI_OP_CASE
+
 #define __tlbi_level(op, addr, level) do {				\
 	u64 arg = addr;							\
 									\
@@ -116,7 +147,7 @@ static inline unsigned long get_trans_granule(void)
 		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
 	}								\
 									\
-	__tlbi(op, arg);						\
+	__tlbi_level_op(op, arg);					\
 } while(0)
 
 #define __tlbi_user_level(op, arg, level) do {				\
-- 
2.50.0.727.gbf7dc18ff4-goog


