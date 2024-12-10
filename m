Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D532E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwG46zvUnQw2m9oBPSyxLJojvCYh95qCe3Oj2S2XB08=; b=ANtMRGuK4pJbzCFY85bZoKYh46
	354tnO9h4bTrNU6J6+ojavlsyaeKJOuGx5Oa+wDp+iId5wXBfVjoDCEwrQbKUS0J9ksKjavGK/0VX
	l9yng3lTlUD1fMb93Rv/5kshB66PNEJKIps+PHRlELJwCbzgiSZhh/tpmFyCDcqFyZfvN7qbXt8Sy
	ek1fZbqN0zz7jQCTqzIl0KcdOLOzHCwHxHwdMRy1aqJY55r+TNi9ITE6e1Q2F+JO+heuzqDOb4XAh
	0LDbtpXU95AJUTdDJmhI4IZp/iWXyEonUkJK5ICCVUwLh0bXZjFJLa8ZCwUVg7kAhMAc8FYn31qzu
	yJcPoKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2oO-0000000C2YD-41r0;
	Tue, 10 Dec 2024 16:10:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2l5-0000000C1t2-1IeF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E3725C4B5C;
	Tue, 10 Dec 2024 16:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C9DC4CEE2;
	Tue, 10 Dec 2024 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733846806;
	bh=wxcjY6Sxsaz2hTsZ9OLXJZ3XXXODa/UsYKOkty8coHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1E8oc1U42hpuavRnkbvtANsKDn6k+Yz5tBBqHzq5EK5TUqUHa36DOjdsZtM9/Oah
	 7Ob9TQmtp+TOGUxnPtTmLmpIqpnNroAzwnwmKUX1z2y5QJwZPjTBumWMwxlbxrJQSL
	 XoGjjYk7/bX9yNbgOjxxo7jOVri9x8edVaTFuojVFYs2+5qimV28MQOYmCOpDoZ2hZ
	 3WTBquHU2z6SE3hFNLNM85NRZOHnW3qjqYiCxnAFISoWZu2F1V4EvZJlQ1m0lTFihC
	 7qBKTrXhoKxEhKdX/7Db81ANvpyxEUk+sFfpsf2DdNRV2wLjIJfc+yFATv/VLswlTx
	 xiIo205ZM9XMQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Date: Tue, 10 Dec 2024 17:05:54 +0100
Message-Id: <20241210160556.2341497-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210160556.2341497-1-arnd@kernel.org>
References: <20241210160556.2341497-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_080647_380620_A703DE99 
X-CRM114-Status: GOOD (  15.87  )
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

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

gup_pgd_range() is invoked with disabled interrupts and invokes
__kmap_local_page_prot() via pte_offset_map(), gup_p4d_range().
With HIGHPTE enabled, __kmap_local_page_prot() invokes kmap_high_get()
which uses a spinlock_t via lock_kmap_any(). This leads to an
sleeping-while-atomic error on PREEMPT_RT because spinlock_t becomes a
sleeping lock and must not be acquired in atomic context.

The loop in map_new_virtual() uses wait_queue_head_t for wake up which
also is using a spinlock_t.

Since HIGHPTE is rarely needed at all, turn it off for PREEMPT_RT
to allow the use of get_user_pages_fast().

[arnd: rework patch to turn off HIGHPTE instead of HAVE_PAST_GUP]
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
There is an open question about whether HIGHPTE is still needed
at all, given how rare 32-bit machines with more than 4GB
are on any architecture. If we instead decide to remove HIGHPTE
altogether, this patch is no longer needed.
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ed850cc0ed3c..4de4e5697bdf 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1231,7 +1231,7 @@ config HIGHMEM
 
 config HIGHPTE
 	bool "Allocate 2nd-level pagetables from highmem" if EXPERT
-	depends on HIGHMEM
+	depends on HIGHMEM && !PREEMPT_RT
 	default y
 	help
 	  The VM uses one page of physical memory for each page table.
-- 
2.39.5


