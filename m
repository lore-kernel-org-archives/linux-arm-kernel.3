Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B23E668B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-Id:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cIdcSO03gTT0fM6/zF587fdk2GaGTRpxbXAnsMw29mQ=; b=3B4LdhU3PUezm1fAAxFXAX+c/S
	IoismlWDEyFDB/dqdnZMgEOfkykHqqv6puTXG4zBGvQPPeOslFlNt5crf+5gtyfGvxvxDoo1XMO6L
	Dq4W9xiTkGnKJnNsoG5PKMhyuEcOMkP1chmfI62m9HEHJ/ohNYmHZTUBPCE/4yqFgsSdMSYwJIE1q
	Z6y9AUC/nM/w6euu0ARYmWGtjclGroi9pzri5mEJZPmLGnuTAcX+6vKr8jw4WX1xc9QVh22pHaHYM
	YYJt0gy18PWaB0RtVDjriOoeJIvgL8b881wZoXWZC9/39FED3+vxesrksI4EZs8HIPq8eUnRX1P3w
	A3ZMTzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFPr-00000006KkE-39L6;
	Sun, 24 Nov 2024 16:24:55 +0000
Received: from bmailout3.hostsharing.net ([176.9.242.62])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFFOu-00000006Kfl-06YC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 16:23:57 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id E9A32100E2027;
	Sun, 24 Nov 2024 17:16:09 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A91511DB74D; Sun, 24 Nov 2024 17:16:09 +0100 (CET)
Message-Id: <90667b2b7f773308318261f96ebefd1a67133c4c.1732464395.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 24 Nov 2024 17:15:27 +0100
Subject: [PATCH for-next/fixes] arm64/mm: Fix false-positive
 !virt_addr_valid() for kernel image
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Zorro Lang <zlang@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>, Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_082356_199337_FDA42081 
X-CRM114-Status: GOOD (  16.66  )
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

Zorro reports a false-positive BUG_ON() when running crypto selftests on
boot:  Since commit 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to
sig_alg backend"), test_sig_one() invokes an RSA verify operation with a
test vector in the kernel's .rodata section.  The test vector is passed
to sg_set_buf(), which performs a virt_addr_valid() check.

On arm64, virt_addr_valid() returns false for kernel image addresses
such as this one, even though they're valid virtual addresses.
x86 returns true for kernel image addresses, so the BUG_ON() does not
occur there.  In fact, x86 has been doing so for 16 years, i.e. since
commit af5c2bd16ac2 ("x86: fix virt_addr_valid() with
CONFIG_DEBUG_VIRTUAL=y, v2").

Do the same on arm64 to avoid the false-positive BUG_ON() and to achieve
consistent virt_addr_valid() behavior across arches.

Silence a WARN splat in __virt_to_phys() which occurs once the BUG_ON()
is avoided.

The is_kernel_address() helper introduced herein cannot be put directly
in the virt_addr_valid() macro:  It has to be part of the kernel proper
so that it has visibility of the _text and _end symbols (referenced
through KERNEL_START and KERNEL_END).  These symbols are not exported,
so modules expanding the virt_addr_valid() macro could not access them.
For almost all invocations of virt_addr_valid(), __is_lm_address()
returns true, so jumping to the is_kernel_address() helper hardly ever
occurs and its performance impact is thus negligible.

Likewise, calling is_kernel_address() from the functions in physaddr.c
ought to be fine as they depend on CONFIG_DEBUG_VIRTUAL=y, which is
explicitly described as "costly" in the Kconfig help text.  (And this
doesn't add much cost really.)

Abridged stack trace:

  kernel BUG at include/linux/scatterlist.h:187!
  sg_init_one()
  rsassa_pkcs1_verify()
  test_sig_one()
  alg_test_sig()
  alg_test()
  cryptomgr_test()

Fixes: 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to sig_alg backend")
Reported-by: Zorro Lang <zlang@redhat.com>
Closes: https://lore.kernel.org/r/20241122045106.tzhvm2wrqvttub6k@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Just from looking at the code it seems arm's virt_addr_valid() returns
true for kernel image addresses, so apparently arm64 is the odd man out.

Note that this fix would have obviated the need for commit c02e7c5c6da8
("arm64/mm: use lm_alias() with addresses passed to memblock_free()").

 arch/arm64/include/asm/memory.h | 6 +++++-
 arch/arm64/mm/init.c            | 7 +++++++
 arch/arm64/mm/physaddr.c        | 6 +++---
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index b9b9929..bb83315 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -416,9 +416,13 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
 })
 #endif /* CONFIG_DEBUG_VIRTUAL */
 
+bool is_kernel_address(unsigned long x);
+
 #define virt_addr_valid(addr)	({					\
 	__typeof__(addr) __addr = __tag_reset(addr);			\
-	__is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));	\
+	(__is_lm_address(__addr) ||					\
+	 is_kernel_address((unsigned long)__addr)) &&			\
+	pfn_is_map_memory(virt_to_pfn(__addr));				\
 })
 
 void dump_mem_limit(void);
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index d21f67d..2e8a00f 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -156,6 +156,13 @@ static void __init zone_sizes_init(void)
 	free_area_init(max_zone_pfns);
 }
 
+bool is_kernel_address(unsigned long x)
+{
+	return x >= (unsigned long) KERNEL_START &&
+	       x <= (unsigned long) KERNEL_END;
+}
+EXPORT_SYMBOL(is_kernel_address);
+
 int pfn_is_map_memory(unsigned long pfn)
 {
 	phys_addr_t addr = PFN_PHYS(pfn);
diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
index cde44c1..2d6755b 100644
--- a/arch/arm64/mm/physaddr.c
+++ b/arch/arm64/mm/physaddr.c
@@ -9,7 +9,8 @@
 
 phys_addr_t __virt_to_phys(unsigned long x)
 {
-	WARN(!__is_lm_address(__tag_reset(x)),
+	WARN(!__is_lm_address(__tag_reset(x)) &&
+	     !is_kernel_address(__tag_reset(x)),
 	     "virt_to_phys used for non-linear address: %pK (%pS)\n",
 	      (void *)x,
 	      (void *)x);
@@ -24,8 +25,7 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
 	 * This is bounds checking against the kernel image only.
 	 * __pa_symbol should only be used on kernel symbol addresses.
 	 */
-	VIRTUAL_BUG_ON(x < (unsigned long) KERNEL_START ||
-		       x > (unsigned long) KERNEL_END);
+	VIRTUAL_BUG_ON(!is_kernel_address(x));
 	return __pa_symbol_nodebug(x);
 }
 EXPORT_SYMBOL(__phys_addr_symbol);
-- 
2.43.0


