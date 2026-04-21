Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBA7F89248
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGH4jR3x97gdksJ2jTHGIjB3FrLo83Krn8aAiB2UsMk=; b=utf2G0tQoqy5kDb79f6qkRP3JB
	0yfC4dnzgix6Pt18UBqENajznOC/bxsNbXLKs5WG4jJpSFqurqA4iR8DnLHuBL16mcvTmr+CyGuQT
	+yu9B9TmrtvaN4faTc+VKo2OakQO8IwTflTVfHsDQvGuGCsiGGW9VsCMoyeVDt8QXt6yhZN2i8y0F
	3yRYqBeBGPrSNJOsb2QzCeJxzlu6ZQMa8HVC65z8Pvo8sj8eL+xoeK/HmpgsWMBjiZfsh7GY1cJ5x
	qqApvpBfM1uk0x6h3TVnlKStGssQ9SItvtDPvsOQ9jhUEaSmFhqkEuYIw7lcYi8mwQJ2A6ozBzssb
	YleIM0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uQ-00000008ODY-2GRA;
	Tue, 21 Apr 2026 10:00:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uK-00000008O9q-2wF8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Apr 2026 10:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rGH4jR3x97gdksJ2jTHGIjB3FrLo83Krn8aAiB2UsMk=; b=MTZAHPzjespX9+xZT6yANLIEzL
	FJRp3ky2hd+f0rq/X7Kxd1+GU3zxiZZfXjPgdGAnE8WLYNxMGUjzyYTot1/bbItk5FmpkDIFcYIJI
	snK/aqCXh+gZ4klqj5xFVS+l53qQ1wTJ5GrZymvKVRTI252GTR3IzARD0WXHjvIBfQfSe7b4EXVSZ
	3wXqiU8GTh/s0EGXgYkPaO1XIepIdfIx5lIV8wT8mClLN1gi2aniPgTD6ubjb6YHAGpHv5HQKpPul
	Ce6thnQEElCdX+bcYtxtcbLNQBb2VAgKtMz/aixe2v8gj0xT1MhoaVU5kcNWIPxBDMiJtHzCtDXNP
	uHfR7lcw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7u9-00000009XMd-3oVC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:00:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6C73024;
	Tue, 21 Apr 2026 03:00:22 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC4943FBCB;
	Tue, 21 Apr 2026 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776765627; bh=p90basbuAqk6MT2r9VyRSm6WE7j2SMi5ZXXTNvRCow0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hozG5qLUVKRm5oTJBycHggig7nC9xnWoUwXXIM87WkbO2lrTxUS5f4ULP9qtVfhQp
	 bdG69rgqROkIfM/u0kS6jg5lJ5AVwtWhK4K4Tl6uqDW1KwOJ8UpkPsQzjXOAJl+Jmh
	 7Qdm5QDGZ3Be6d4fNn22A0Be4ovnTJj2cyqM0g0A=
From: Catalin Marinas <catalin.marinas@arm.com>
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6.18.y 3/6] arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB maintenance
Date: Tue, 21 Apr 2026 11:00:14 +0100
Message-ID: <20260421100018.335793-4-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260421100018.335793-1-catalin.marinas@arm.com>
References: <20260421100018.335793-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_110030_244047_4F2A191E 
X-CRM114-Status: GOOD (  12.63  )
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

commit 6bfbf574a39139da11af9fdf6e8d56fe1989cd3e upstream.

Add __tlbi_sync_s1ish_kernel() similar to __tlbi_sync_s1ish() and use it
for kernel TLB maintenance. Also use this function in flush_tlb_all()
which is only used in relation to kernel mappings. Subsequent patches
can differentiate between workarounds that apply to user only or both
user and kernel.

A subsequent patch will add mm_struct to __tlbi_sync_s1ish(). Since
arch_tlbbatch_flush() is not specific to an mm, add a corresponding
__tlbi_sync_s1ish_batch() helper.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/include/asm/tlbflush.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index c87d13bee37d..387bd86af702 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -191,6 +191,18 @@ static inline void __tlbi_sync_s1ish(void)
 	__repeat_tlbi_sync(vale1is, 0);
 }
 
+static inline void __tlbi_sync_s1ish_batch(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
+static inline void __tlbi_sync_s1ish_kernel(void)
+{
+	dsb(ish);
+	__repeat_tlbi_sync(vale1is, 0);
+}
+
 /*
  * Complete broadcast TLB maintenance issued by hyp code which invalidates
  * stage 1 translation information in any translation regime.
@@ -286,7 +298,7 @@ static inline void flush_tlb_all(void)
 {
 	dsb(ishst);
 	__tlbi(vmalle1is);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 
@@ -345,7 +357,7 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_batch();
 }
 
 /*
@@ -512,7 +524,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
 	dsb(ishst);
 	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
 			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 
@@ -526,7 +538,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 
 	dsb(ishst);
 	__tlbi(vaae1is, addr);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish_kernel();
 	isb();
 }
 

