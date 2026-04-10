Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625CEF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=ae8cfkGUIMIeVdEIq5b46ZHpiRc5HR7kNfrW28/CmkI=; b=RpDX/7SflcwMI9
	fCBA8FeTHtT2YAtv5ggOXuRA27vMNANpqX5MosA44aNpfavW7GJK2CYnFMAy9x0pI+qTLDXfi74fM
	mQoYLlkmbv0sbtyaIA0YHVvYQP/jiYTuGHodSZa58x7DrBdC7rqOlivjLSNxxawvJFR8p959lMm8u
	ybKHU6cBzcRi1vDK3YDR7Xe9ztEGHqiuMvAMOVXICkONSZFJx9P3NScEhltH82jY+UNCG0vDrbqAx
	ZCwaVKU/QbSHvL79mA4mBkX9qu3tyg0+4j+lGGAeacwaNVBHqcs+377iNp82oFALqruvtBeEDGQDu
	jhd4TmY+ob6lha3jdIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArT-0000000CCoR-1pfU;
	Fri, 10 Apr 2026 12:21:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBArF-0000000CCQH-3V4m;
	Fri, 10 Apr 2026 12:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E98D6091C;
	Fri, 10 Apr 2026 12:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FAAC19421;
	Fri, 10 Apr 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823667;
	bh=ql5fkS0UEXw/nBMHEudu1ngsgqvxlZvUknLeTtAAGUU=;
	h=Date:From:To:Cc:Subject:References:From;
	b=uoiHjWjoWcWN7Tw6xiUbL/Io/RlHzIChPqiGJJ7RtYjsrncirPNTd0U6jsMefBLBl
	 PuEP8rIYZGWPrDUGiB7D/1OZBxXBypGlDQEoNlUgfhKncfE0Vht3vVd8dR09fIJYz6
	 LaRap+OM72T7ij93UcDxrSAuxRJvyqDUwai7p79fd01gYNQNCFb6LttF4gur8fMl1Z
	 TmanYlU2xNYAREOAaMNh8AIeZ2WEpNPx/37VkP03IexczKkHFgtDwEiwY8TvmgoUyG
	 zdqSX2TqLhRdpCyZVVz2iZYLDeqcR5cB1pNHnjTlrpzblDMQ8i7KXktiKriMpSMGuM
	 +dQ/qJxaC9obA==
Date: Fri, 10 Apr 2026 14:21:04 +0200
Message-ID: <20260410120319.723429844@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
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
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
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
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 32/38] powerpc/spufs: Use mftb() directly
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

There is no reason to indirect via get_cycles(), which is about to be
removed.

Use mftb() directly.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/cell/spufs/switch.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/arch/powerpc/platforms/cell/spufs/switch.c
+++ b/arch/powerpc/platforms/cell/spufs/switch.c
@@ -34,6 +34,7 @@
 #include <asm/spu_priv1.h>
 #include <asm/spu_csa.h>
 #include <asm/mmu_context.h>
+#include <asm/time.h>
 
 #include "spufs.h"
 
@@ -279,7 +280,7 @@ static inline void save_timebase(struct
 	 *    Read PPE Timebase High and Timebase low registers
 	 *    and save in CSA.  TBD.
 	 */
-	csa->suspend_time = get_cycles();
+	csa->suspend_time = mftb();
 }
 
 static inline void remove_other_spu_access(struct spu_state *csa,
@@ -1261,7 +1262,7 @@ static inline void setup_decr(struct spu
 	 *     in LSCSA.
 	 */
 	if (csa->priv2.mfc_control_RW & MFC_CNTL_DECREMENTER_RUNNING) {
-		cycles_t resume_time = get_cycles();
+		cycles_t resume_time = mftb();
 		cycles_t delta_time = resume_time - csa->suspend_time;
 
 		csa->lscsa->decr_status.slot[0] = SPU_DECR_STATUS_RUNNING;


