Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8D7D29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJfnfoj2i4cf3HB9SnNFExdWOa+0DqZR7buiYR1d9o0=; b=ocKvExTLJvirnTWefku5L9uiRK
	CbdnwqJjKLzi9nRPaLtxchN9YgvZi2tGehPQGwBEFH3rW6sgoYh35Z2fbGmSEWkN3nEKlrfjIrNhy
	2fH+ovtIdc3MovgnfnjuhoOFWjHswtA338lT52d2qeNY0M6z4fhMZP1v81vDHh+XQXxJrIBpXJwj4
	sdjZjztfq0zXcJmMWBURjp8yQyeAASo+X6fmE5Xp3T2YRTK7c7QRyWF3RBrmeLr5NbtCZki8FvTpd
	lwmfZqG3BrV3xKhd0P7SrCLNxN6jOobbtCbDSTNNR7aSYmY0kdKCJYGN+RYhvBxVPZWNlu4O1YlNX
	WpjDtNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxP-00000002cbt-0BWi;
	Mon, 19 Jan 2026 17:22:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxL-00000002ca8-16ls
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jJfnfoj2i4cf3HB9SnNFExdWOa+0DqZR7buiYR1d9o0=; b=ZfAe56kKQp+R0UZBYlhN+yOahW
	ZZwl8K24rcnaRGHAIqhOcUsmlAXBFg4j42bv2EaHdTYlF/xyMvLo12J6CN2vPf9PO3xA/h0ouI0Gx
	vcbgkn9F8xQGKqw/pnLUd2fjocIGT4T/ufdgjCXj/nfWr0Yhib1rZKpnzFve5fI1zH07gQCbjHdbq
	lRu2L7PMkUkZf6qLS8jXBE/CTxV8LV2dE5TAlVuub8Kaq2I8dkcJm2InPGtcW+S+PWeFSVKDJOWsj
	s1ZYusgAY786AqlJoeHUwD+MKW9e5lKKcR434EqUnmQAFzkobDHSZUxTzlhCsrPGgub3mc6zuiKee
	MzfUf8hg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxG-0000000CfeV-3LXj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A784FEC;
	Mon, 19 Jan 2026 09:22:10 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D00A3F632;
	Mon, 19 Jan 2026 09:22:15 -0800 (PST)
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
Subject: [PATCH v2 01/13] arm64: mm: Re-implement the __tlbi_level macro as a C function
Date: Mon, 19 Jan 2026 17:21:48 +0000
Message-ID: <20260119172202.1681510-2-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_172219_238999_6C06596B 
X-CRM114-Status: GOOD (  10.89  )
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

As part of efforts to reduce our reliance on complex preprocessor macros
for TLB invalidation routines, convert the __tlbi_level macro to a C
function for by-level TLB invalidation.

Each specific tlbi level op is implemented as a C function and the
appropriate function pointer is passed to __tlbi_level(). Since
everything is declared inline and is statically resolvable, the compiler
will convert the indirect function call to a direct inline execution.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 67 +++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a2d65d7d6aae..a8ca2593a289 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -105,19 +105,60 @@ static inline unsigned long get_trans_granule(void)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
-#define __tlbi_level(op, addr, level) do {				\
-	u64 arg = addr;							\
-									\
-	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) &&	\
-	    level >= 0 && level <= 3) {					\
-		u64 ttl = level & 3;					\
-		ttl |= get_trans_granule() << 2;			\
-		arg &= ~TLBI_TTL_MASK;					\
-		arg |= FIELD_PREP(TLBI_TTL_MASK, ttl);			\
-	}								\
-									\
-	__tlbi(op, arg);						\
-} while(0)
+typedef void (*tlbi_op)(u64 arg);
+
+static __always_inline void vae1is(u64 arg)
+{
+	__tlbi(vae1is, arg);
+}
+
+static __always_inline void vae2is(u64 arg)
+{
+	__tlbi(vae2is, arg);
+}
+
+static __always_inline void vale1(u64 arg)
+{
+	__tlbi(vale1, arg);
+}
+
+static __always_inline void vale1is(u64 arg)
+{
+	__tlbi(vale1is, arg);
+}
+
+static __always_inline void vale2is(u64 arg)
+{
+	__tlbi(vale2is, arg);
+}
+
+static __always_inline void vaale1is(u64 arg)
+{
+	__tlbi(vaale1is, arg);
+}
+
+static __always_inline void ipas2e1(u64 arg)
+{
+	__tlbi(ipas2e1, arg);
+}
+
+static __always_inline void ipas2e1is(u64 arg)
+{
+	__tlbi(ipas2e1is, arg);
+}
+
+static __always_inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
+{
+	u64 arg = addr;
+
+	if (alternative_has_cap_unlikely(ARM64_HAS_ARMv8_4_TTL) && level <= 3) {
+		u64 ttl = level | (get_trans_granule() << 2);
+
+		FIELD_MODIFY(TLBI_TTL_MASK, &arg, ttl);
+	}
+
+	op(arg);
+}
 
 #define __tlbi_user_level(op, arg, level) do {				\
 	if (arm64_kernel_unmapped_at_el0())				\
-- 
2.43.0


