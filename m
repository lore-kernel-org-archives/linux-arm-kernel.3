Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577E4C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zPPQMLYbkiU4NDPeUT+SBUqfY1uJWSL11Latg9M1ZQ=; b=kiDwIF5o2oLzVAuchSE25g7xLq
	1n67XjK21FElZCuMs3+bLesIsuR1JaKIqOhDsiEn8MegdKpa4WfP2hcSvFfhoEsYdzpIYsw9z+5kX
	M/u1/EZhOfm5AKUNuKHEjB+FHAopee5UfoTqNIRZ7W94WPwNGl+n9B6rXJ+fKi6wt+ku9RD8zXc5j
	IAXgDc5wgqhVurSmn2l2tC6FQeq39G471b5sgYV8lWVi0gdgokTzVsrwA9ru8QblHiVHJqkdJQ2wH
	xwcN3a0IQi+R4Ksoim3+Ad4WcfSCwUSb/mhmPYOKTClzPAJaaYM/tBZ34TEiMGqKe+A+8/jhJo2md
	HVlJbKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKZE-000000088QF-1Ot5;
	Tue, 18 Aug 2026 14:13:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKZ8-000000088JH-2SXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:13:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB94D1A00;
	Tue, 18 Aug 2026 07:13:17 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E704D3F85F;
	Tue, 18 Aug 2026 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062401; bh=deqcIO8WoW8ZUIxodPxPJxHyzGgyRHFEpIWwkIpsoHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wakfnd/jp0XFaEXDa8GOOOrShfuIESM4+0taZqqVMIl02MEpCgGw14EgqvvyL5yBG
	 o1+mk+qzVPuL8Rd9ieuL3fbg0f2zvcr1KENhYiYcPUpj9JoXCujFcnK0U/7B5OsrvO
	 mUs3g3DyPckWZwcg7iQ2BnXyxqiVKdropvzuz4AY=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 18 Aug 2026 15:09:06 +0100
Subject: [PATCH RFC v9 24/25] arm64: kpkeys: Enable
 kpkeys_hardened_pgtables support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-kpkeys-v9-24-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
In-Reply-To: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787062277; l=1336;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=deqcIO8WoW8ZUIxodPxPJxHyzGgyRHFEpIWwkIpsoHY=;
 b=8Zvb9dgw8pGXz4V0LB4l31N6PHQBF1+79rdAlXKfUMt8pwgyVAcEZlljLDnHbeenNl7hIsZ2G
 qM+wAXlkOfZBjrezKjv9TZqt0L6GYTtrJd9TeNXf9l835YTjNO5ekJ9
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071323_041232_F63182BF 
X-CRM114-Status: GOOD (  11.06  )
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

The kpkeys_hardened_pgtables feature needs to be initialised as soon
as the buddy allocator becomes available. The canonical place to
handle this is mem_init().

With that done, all the bits are in place and we can advertise
support for kpkeys_hardened_pgtables by selecting
ARCH_HAS_KPKEYS_HARDENED_PGTABLES if ARM64_POE is enabled.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/Kconfig   | 1 +
 arch/arm64/mm/init.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0afa085c66be..ac9faec1a018 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2203,6 +2203,7 @@ config ARM64_POE
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	select ARCH_HAS_KPKEYS
+	select ARCH_HAS_KPKEYS_HARDENED_PGTABLES
 	help
 	  The Permission Overlay Extension is used to implement Memory
 	  Protection Keys. Memory Protection Keys provides a mechanism for
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 97987f850a33..7985045875cf 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -386,6 +386,7 @@ bool page_alloc_available __ro_after_init;
 void __init mem_init(void)
 {
 	page_alloc_available = true;
+	kpkeys_hardened_pgtables_init();
 	swiotlb_update_mem_attributes();
 }
 

-- 
2.51.2


