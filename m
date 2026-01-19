Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306B6D29C50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUSaBaEwwp7QkqAOPk1deS2DAg2VZwhsGLTGOc/a9Vw=; b=RgR/HyPnvmPK7gzoRghzs0n3i3
	7FY6ZdrDF46oIwI5nL683Xxdfo9RxPSzGkuQFk4W8CGcNZGKxJnZWcOOtXy9qgfez7OlXy5V5NzBm
	NlfMSkqLZoFD1J0smyv3lZse/E8DMNrSo/CvbxfeMQHZjiT+KgqMd9IvAejrBEog6Dv+tKC8HDdGa
	rbPxXEmyKkwrHj4FmHS86IbmsUXfKPt0L23umKbBk6+koAGMM5z9i0TKYsszFl/2fbpg+7zVxMgCH
	1QRiEO0rJea2YmsEcLlfu54t7iuckoDQE3n+R/JRpDsVN+Kp6n2sXHkCX3UC1YWLqfCWzkM8b3DPh
	kiNsHHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxP-00000002ccL-1WiA;
	Mon, 19 Jan 2026 17:22:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxL-00000002ca7-1BV0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 17:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SUSaBaEwwp7QkqAOPk1deS2DAg2VZwhsGLTGOc/a9Vw=; b=dgONkOY0iTmAHX0J51LN2v/35e
	+HWoGSKQI4vjsXyly8szuVw+wm2531wsLfkz71oSGUQZMvdaUQUaNrB45pPEIgkuRtf+EldMvPt4h
	hnXn9nNw/71S5o6vvm1bbBGKxV1yGDqhHMq0JwldzIn7aojsB/Enu/4Zfsu/az5UknOQCDFs3SWE7
	HDGFhsyRSIlwsGhdTNj/7cS9xLC9t4FxG9wKabySSAW0Yccw3ZjieMJepXU5WIIbSRSUBPM5y5eu6
	NXdJ1a91NxFog4c6DCdxiUcdBDxHFYobE4NwwD1ZJif2wfg0iQlHGt3+C6lnL1j92X3U1SsnlDinz
	omOHOZ8w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsxH-0000000Cfei-1AwP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:22:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD7F91476;
	Mon, 19 Jan 2026 09:22:11 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00963F632;
	Mon, 19 Jan 2026 09:22:16 -0800 (PST)
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
Subject: [PATCH v2 02/13] arm64: mm: Introduce a C wrapper for by-range TLB invalidation
Date: Mon, 19 Jan 2026 17:21:49 +0000
Message-ID: <20260119172202.1681510-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119172202.1681510-1-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_172219_571594_60F25E08 
X-CRM114-Status: GOOD (  13.04  )
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
for TLB invalidation routines, introduce a new C wrapper for by-range
TLB invalidation which can be used instead of the __tlbi() macro and can
additionally be called from C code.

Each specific tlbi range op is implemented as a C function and the
appropriate function pointer is passed to __tlbi_range(). Since
everything is declared inline and is statically resolvable, the compiler
will convert the indirect function call to a direct inline execution.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 32 ++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index a8ca2593a289..acd59bc61e00 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -457,6 +457,36 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  *    operations can only span an even number of pages. We save this for last to
  *    ensure 64KB start alignment is maintained for the LPA2 case.
  */
+static __always_inline void rvae1is(u64 arg)
+{
+	__tlbi(rvae1is, arg);
+}
+
+static __always_inline void rvale1(u64 arg)
+{
+	__tlbi(rvale1, arg);
+}
+
+static __always_inline void rvale1is(u64 arg)
+{
+	__tlbi(rvale1is, arg);
+}
+
+static __always_inline void rvaale1is(u64 arg)
+{
+	__tlbi(rvaale1is, arg);
+}
+
+static __always_inline void ripas2e1is(u64 arg)
+{
+	__tlbi(ripas2e1is, arg);
+}
+
+static __always_inline void __tlbi_range(tlbi_op op, u64 arg)
+{
+	op(arg);
+}
+
 #define __flush_tlb_range_op(op, start, pages, stride,			\
 				asid, tlb_level, tlbi_user, lpa2)	\
 do {									\
@@ -484,7 +514,7 @@ do {									\
 		if (num >= 0) {						\
 			addr = __TLBI_VADDR_RANGE(__flush_start >> shift, asid, \
 						scale, num, tlb_level);	\
-			__tlbi(r##op, addr);				\
+			__tlbi_range(r##op, addr);			\
 			if (tlbi_user)					\
 				__tlbi_user(r##op, addr);		\
 			__flush_start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
-- 
2.43.0


