Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47288C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6ST9MO0xhHKKK61d7KBl+q5WdV+hnI+lqckETtBROU=; b=Z5uYI+BjgysjdVbkuVzrNnFgtZ
	qMLekMDkCNet0B0pfyxW3YmSCiLg7/4ZlnRhj15NNHxj1RXpXbPBgPtxZ14vI5MbhfqGWrJhho8u3
	UfJT+DaYeJ1F2amJgRDf2PVPOwUclCYXV2h4E+J0Rue6u7jz2fa/9jHoMAvRt+ntN1voeMRGoYjKK
	ABqiP65g3gGqU5fnZ1vubEdbx8/Q68Yewpd2kFNiMn0BEGFt+cWrLMSGBZUv3JR/e0puR3gz9uJGz
	dj0DieEIJEiMbq1sNFl9I6z9PgUsCErxgnKIK7uYqsqJhtN3VgUhReAdsUl6Bwhxfy2kSb8Zjo+1o
	EeiL+zTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyES-00000001St3-2HuT;
	Tue, 25 Aug 2026 20:58:56 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEI-00000001Sna-3MIO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691522; bh=E6ST9MO0xhHKKK61d7KBl+q
	5WdV+hnI+lqckETtBROU=; b=HHiOExNagC67Mue4hKwQ0B5MUnPtWrGbsg45GprQpkh307ZKIQ
	KgadCKPrFoCytd5mSZcaommv5m/eTgI3rMOHxpyQ5P40L/3qcbX21aiAnEMHkwEm2aXpgAURBy2
	epBoNcMrXtkCSajJdTreXtNjPfmmf9Psj+pEjMwkxHpxnzfbPslRh2EF2kliJ4Aw01+UdkkOO+W
	hVXombEqXr2FMfxhpUyjzrkAFbSJzjGMr4ovhlaM5eU9sq85SeJLBsagfm90/Hj0MVhwUjbtw8S
	lXh1N8GB9g87Y0VqqwehixKI60TsEk1AaC7KohFjbvV6d9yWs0DRcmyXj67c7HxEF7w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691522; bh=E6ST9MO0xhHKKK61d7KBl+q
	5WdV+hnI+lqckETtBROU=; b=tEWKBLAOvv0aZDYbFR45is0Xz4W0LeAXh3ss6J0V/o6dz115+a
	OprdMuGDsMebHWkxgEfna/Fxe655s1hM1SBA==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 5/7] arm64: hibernate: use dcache_by_myline_op
Date: Tue, 25 Aug 2026 20:58:37 +0000
Message-ID: <20260825205839.14571-6-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135846_987906_CF5ED28C 
X-CRM114-Status: GOOD (  11.01  )
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

swsusp_arch_suspend_exit() used to open code its cache maintenance, but
the dcache_by_myline_op macro does everything that open coded version
did, including the ARM64_WORKAROUND_CLEAN_CACHE handling. So use it.

Since this was first written the macro got split, with the trailing DSB
moved out into a wrapper, so use dcache_by_myline_op_nosync here and
keep relying on the DSB that already sits after the restore loop. That
keeps this a true no-op.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/hibernate-asm.S | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/hibernate-asm.S b/arch/arm64/kernel/hibernate-asm.S
index 2baefe7a82d3..f7613404f99e 100644
--- a/arch/arm64/kernel/hibernate-asm.S
+++ b/arch/arm64/kernel/hibernate-asm.S
@@ -66,16 +66,11 @@ SYM_CODE_START(swsusp_arch_suspend_exit)
 
 	copy_page	x0, x1, x2, x3, x4, x5, x6, x7, x8, x9
 
+	/* Clean the restored page to the PoU */
+	mov	x0, x10
 	add	x1, x10, #PAGE_SIZE
-	/* Clean the copied page to PoU - based on caches_clean_inval_pou() */
 	raw_dcache_line_size x2, x3
-	sub	x3, x2, #1
-	bic	x4, x10, x3
-2:	/* clean D line / unified line */
-alternative_insn "dc cvau, x4",  "dc civac, x4",  ARM64_WORKAROUND_CLEAN_CACHE
-	add	x4, x4, x2
-	cmp	x4, x1
-	b.lo	2b
+	dcache_by_myline_op_nosync cvau, x0, x1, x2, x3
 
 	ldr	x19, [x19, #HIBERN_PBE_NEXT]
 	cbnz	x19, 1b
-- 
2.47.3

