Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F83EF44847
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=SzqmkoHD6RR/VnMu1Lp5RPrviQ3U1+g7qyWPaG+gRfs=; b=zcaSbxYuIfa0oI
	Qpdnm+xqt3sCdDQ55eM3WloZ71tIw1Htg1Jnh+FhJ+Eg02Vkf59D9UqJJpTZLghOtZPYjrRSd0dVS
	AkflLQysb35dxynl3Ip8rT1kReNrg4AHGOtQ654IvoHQUE/rPr8245u7oj7bxaqCVneHVwboVBvKg
	9vTYi3mMTRlEu0ijsnHR2dOVItQGI51iRjWeEVZAd/xfuzNdvnp3QGMmh6hRScV680CMXpUa/YFkD
	xF2/sC4rUS0M1ne2vc1SEUrK/7acJSrWUDtnsUos5WpIjKkj7PGEPb2n+sq5EJFVKHcIXtCTOx3eP
	teqiJpTz2yfM/1VUsFfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqF-0000000CAoa-39ge;
	Fri, 10 Apr 2026 12:20:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqD-0000000CAlc-2wqi;
	Fri, 10 Apr 2026 12:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D8F661332;
	Fri, 10 Apr 2026 12:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1939C19425;
	Fri, 10 Apr 2026 12:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823604;
	bh=OJyrwmrX6lIri0LIdsFu5GdqSG8VG/nHQeslgTl5R4k=;
	h=Date:From:To:Cc:Subject:References:From;
	b=SQFHopbFA4avzkQltPCDvONKOyWmV73pxkcg27G4tKW1mNfy7PYVk0h6FRJhlowhk
	 TQQGbFN8xcNa+loyfTw/Ao/LMW9fb2z9STU9hSKk0Q9e4TyhUmpic8YPBLcUkWvS5H
	 AbfS/R5YsMQyaoKc/WDlm6lhBx4bXYBfs3B4LA3Z/Y/SjzAwbFrEIx6rz/PfITLKPl
	 d1tT7WhENbDQpyhAelqaE4x97qqSWFBpW6gFyL/Wzy4bWcES9cochVgZgvdNMg3UtL
	 W9F79+f3Gx3pjpImzUkKb/YiEF7KogJM+PPf5Wjs2H8jaVYTBcG1Ittd3E5H9zOpng
	 +M493bQX3+83g==
Date: Fri, 10 Apr 2026 14:20:01 +0200
Message-ID: <20260410120318.862164111@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 19/38] kcsan: Replace get_cycles() usage
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

KCSAN uses get_cycles() for two purposes:

  1) Seeding the random state with get_cycles() is a historical leftover.

  2) The microbenchmark uses get_cycles(), which provides an unit less
     counter value and is not guaranteed to be functional on all
     systems/platforms.

Use random_get_entropy() for seeding the random state and ktime_get() which
is universaly functional and provides at least a comprehensible unit.

This is part of a larger effort to remove get_cycles() usage from
non-architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com
---
 kernel/kcsan/core.c    |    2 +-
 kernel/kcsan/debugfs.c |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -798,7 +798,7 @@ void __init kcsan_init(void)
 	BUG_ON(!in_task());
 
 	for_each_possible_cpu(cpu)
-		per_cpu(kcsan_rand_state, cpu) = (u32)get_cycles();
+		per_cpu(kcsan_rand_state, cpu) = (u32)random_get_entropy();
 
 	/*
 	 * We are in the init task, and no other tasks should be running;
--- a/kernel/kcsan/debugfs.c
+++ b/kernel/kcsan/debugfs.c
@@ -58,7 +58,7 @@ static noinline void microbenchmark(unsi
 {
 	const struct kcsan_ctx ctx_save = current->kcsan_ctx;
 	const bool was_enabled = READ_ONCE(kcsan_enabled);
-	u64 cycles;
+	ktime_t nsecs;
 
 	/* We may have been called from an atomic region; reset context. */
 	memset(&current->kcsan_ctx, 0, sizeof(current->kcsan_ctx));
@@ -70,16 +70,16 @@ static noinline void microbenchmark(unsi
 
 	pr_info("%s begin | iters: %lu\n", __func__, iters);
 
-	cycles = get_cycles();
+	nsecs = ktime_get();
 	while (iters--) {
 		unsigned long addr = iters & ((PAGE_SIZE << 8) - 1);
 		int type = !(iters & 0x7f) ? KCSAN_ACCESS_ATOMIC :
 				(!(iters & 0xf) ? KCSAN_ACCESS_WRITE : 0);
 		__kcsan_check_access((void *)addr, sizeof(long), type);
 	}
-	cycles = get_cycles() - cycles;
+	nsecs = ktime_get() - nsecs;
 
-	pr_info("%s end   | cycles: %llu\n", __func__, cycles);
+	pr_info("%s end   | nsecs: %llu\n", __func__, nsecs);
 
 	WRITE_ONCE(kcsan_enabled, was_enabled);
 	/* restore context */


