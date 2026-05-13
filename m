Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED831CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 04:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aJljDkEl530JUlXP/acd/Wc+KOQERlK0h/Hx734pvo=; b=YrPsThQrB/bpnKdYYAqg0ekYlf
	6Ec9Ftdn+JO/llcUQvUCcIbrDGH9R2KxrxAIli/My6wWmP1Dv++iIYqJ2S6QF9qK4zVJXH+ciL3Ge
	Kfbow9RyXROybZWIftP5nI2eiVSHGAGhUMdFiKOvXjbWyGLAYQS9GOgnBKJLtZH47AujMGXRL8xr5
	+Zvjc/ko1EaHvCzoUBHeO7GkRZT4SXsLYtRNWn3J8l6SZtvQy3OWBdVpMJyJyPAvyocn0zlU9mI5s
	oiZpzzsMIk7kn78bGKnuoWCJUQY7nspGX+c6NUqbjCnDG3xxbIomfO3WUnOpQZZZMrDUgY5OBg/wk
	vXMjdyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1VY-00000001FBW-1tg1;
	Wed, 13 May 2026 04:47:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN1VW-00000001F9O-11lX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 04:47:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82B061595;
	Tue, 12 May 2026 21:47:36 -0700 (PDT)
Received: from a085714.blr.arm.com (a085714.arm.com [10.164.18.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 305A53F905;
	Tue, 12 May 2026 21:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778647661; bh=TmCvO12iAjHSRBJDFbEkaVzXDT8a8vX3wzPeUnlsa9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sIw08p51XIj5EbAwuNGYLYUlpNL2nf3nisSDjSd6CTG5MqAQE3CPjzFwXRo9Tctza
	 dmq1pAKdWQqtprsnDuwV8WLy9TcNI3EPXi6eprgKVZtL1goOwG6DhSoroM/thdRCZg
	 gm/DV38U6ihb2/WizMSYIpahGPpI3K55FfOqXhaQ=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC V2 13/14] arm64/mm: Add an abstraction level for tlbi_op
Date: Wed, 13 May 2026 10:15:46 +0530
Message-ID: <20260513044547.4128549-14-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513044547.4128549-1-anshuman.khandual@arm.com>
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_214742_370023_951AD890 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Linu Cherian <linu.cherian@arm.com>

With FEAT_D128, a new instruction aka TLBIP is being introduced for the TLB
range operations which has an argument size of 128 bit.

Add an abstraction level to void (*tlbi_op)(u64 arg) helpers to support the
D128 variations when applicable.

No functional changes are introduced with this patch.

Signed-off-by: Linu Cherian <linu.cherian@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 70 ++++++++++++++++---------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index c0bf5b398041..361d74ef8016 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -162,49 +162,53 @@ static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
 
 #define TLBI_TTL_UNKNOWN	INT_MAX
 
-typedef void (*tlbi_op)(u64 arg);
+typedef u64 tlbi_args_t;
+#define __tlbi_wrapper(op, arg)		__tlbi(op, arg)
+#define __tlbi_user_wrapper(op, arg)	__tlbi_user(op, arg)
 
-static __always_inline void vae1is(u64 arg)
+typedef void (*tlbi_op)(tlbi_args_t arg);
+
+static __always_inline void vae1is(tlbi_args_t arg)
 {
-	__tlbi(vae1is, arg);
-	__tlbi_user(vae1is, arg);
+	__tlbi_wrapper(vae1is, arg);
+	__tlbi_user_wrapper(vae1is, arg);
 }
 
-static __always_inline void vae2is(u64 arg)
+static __always_inline void vae2is(tlbi_args_t arg)
 {
-	__tlbi(vae2is, arg);
+	__tlbi_wrapper(vae2is, arg);
 }
 
-static __always_inline void vale1(u64 arg)
+static __always_inline void vale1(tlbi_args_t arg)
 {
-	__tlbi(vale1, arg);
-	__tlbi_user(vale1, arg);
+	__tlbi_wrapper(vale1, arg);
+	__tlbi_user_wrapper(vale1, arg);
 }
 
-static __always_inline void vale1is(u64 arg)
+static __always_inline void vale1is(tlbi_args_t arg)
 {
-	__tlbi(vale1is, arg);
-	__tlbi_user(vale1is, arg);
+	__tlbi_wrapper(vale1is, arg);
+	__tlbi_user_wrapper(vale1is, arg);
 }
 
-static __always_inline void vale2is(u64 arg)
+static __always_inline void vale2is(tlbi_args_t arg)
 {
-	__tlbi(vale2is, arg);
+	__tlbi_wrapper(vale2is, arg);
 }
 
-static __always_inline void vaale1is(u64 arg)
+static __always_inline void vaale1is(tlbi_args_t arg)
 {
-	__tlbi(vaale1is, arg);
+	__tlbi_wrapper(vaale1is, arg);
 }
 
-static __always_inline void ipas2e1(u64 arg)
+static __always_inline void ipas2e1(tlbi_args_t arg)
 {
-	__tlbi(ipas2e1, arg);
+	__tlbi_wrapper(ipas2e1, arg);
 }
 
-static __always_inline void ipas2e1is(u64 arg)
+static __always_inline void ipas2e1is(tlbi_args_t arg)
 {
-	__tlbi(ipas2e1is, arg);
+	__tlbi_wrapper(ipas2e1is, arg);
 }
 
 static __always_inline void __tlbi_level_asid(tlbi_op op, u64 addr, u32 level,
@@ -475,32 +479,32 @@ static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
  *    operations can only span an even number of pages. We save this for last to
  *    ensure 64KB start alignment is maintained for the LPA2 case.
  */
-static __always_inline void rvae1is(u64 arg)
+static __always_inline void rvae1is(tlbi_args_t arg)
 {
-	__tlbi(rvae1is, arg);
-	__tlbi_user(rvae1is, arg);
+	__tlbi_wrapper(rvae1is, arg);
+	__tlbi_user_wrapper(rvae1is, arg);
 }
 
-static __always_inline void rvale1(u64 arg)
+static __always_inline void rvale1(tlbi_args_t arg)
 {
-	__tlbi(rvale1, arg);
-	__tlbi_user(rvale1, arg);
+	__tlbi_wrapper(rvale1, arg);
+	__tlbi_user_wrapper(rvale1, arg);
 }
 
-static __always_inline void rvale1is(u64 arg)
+static __always_inline void rvale1is(tlbi_args_t arg)
 {
-	__tlbi(rvale1is, arg);
-	__tlbi_user(rvale1is, arg);
+	__tlbi_wrapper(rvale1is, arg);
+	__tlbi_user_wrapper(rvale1is, arg);
 }
 
-static __always_inline void rvaale1is(u64 arg)
+static __always_inline void rvaale1is(tlbi_args_t arg)
 {
-	__tlbi(rvaale1is, arg);
+	__tlbi_wrapper(rvaale1is, arg);
 }
 
-static __always_inline void ripas2e1is(u64 arg)
+static __always_inline void ripas2e1is(tlbi_args_t arg)
 {
-	__tlbi(ripas2e1is, arg);
+	__tlbi_wrapper(ripas2e1is, arg);
 }
 
 static __always_inline void __tlbi_range(tlbi_op op, u64 addr,
-- 
2.43.0


