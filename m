Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CED8F44851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=u2KrsjOZZc+bQEPw3J7+YcyUcAZcAFTN5sTexf8i1No=; b=aYpi6j06UQKGlS
	PwgAAcvOq1yD8tMIhn4irAb6tCAKYyC23DF3qIEwvEnkbuR2lipCDUjR8QK8VaiSA3NhaMPV9wIWV
	8aRA8haFT5fj438AzQcZFySeD+KoeJqABxpU4Fk7Yyg+aylwttDF9x/GW6QqS+dZLCj/l+2aZOADv
	VVQafjpXtLpG/OeUSg7VU2Bw4wUcEkMXexxzyoXeironu3oOAx01IK5gCPC56GFx4Qs34MSHbcq79
	3tJaOqQ8Sy5vc2Ucm4zmEUs8HxeB7VLOKzDqHfxDLbdrRpltdagF+BC0SODCphQdd3l7QdTuFAsjE
	16btwL9JgMfgoYb5vyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAq2-0000000CAW9-1y7e;
	Fri, 10 Apr 2026 12:19:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBApy-0000000CAQw-49aJ;
	Fri, 10 Apr 2026 12:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7208F435AB;
	Fri, 10 Apr 2026 12:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704BDC19425;
	Fri, 10 Apr 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823590;
	bh=r17Pe0N1ahBhrB3JYh2nj0lozuwWxFWE8s4wbHnNz1U=;
	h=Date:From:To:Cc:Subject:References:From;
	b=okWRwWiKRXWxIOYd0Peg6lhswEXmgs6TDBmjhAnD7Q9a6usCqNg9OYWu+roqFftQt
	 CXuq9wugiKbiMxTD+p64hE/DfyXI2OVOyYyt+MQaYOMvBz3HQvYNGX8W9+b4gE14hU
	 1DViHL5lpk9k7rS0TYmec/vPv8+l0l72HHkjevm3yaDtlLwCxfiyVTiYsTY5w9OTh5
	 Ju9iD//e8k54q8KUH3ojDg3WjR+Vu3B/cuQgNtmo0Zn1MW3hNX3wOdJ7kCRM+fO7Bg
	 3Yz29lBDAALUYxAqFMkB8dpm5Y3XPhihE7EzHhldnKqOW+zQ+3nRrzSdk9MbluRvBK
	 0NZT2IviOMPvg==
Date: Fri, 10 Apr 2026 14:19:47 +0200
Message-ID: <20260410120318.658719117@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
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
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 16/38] fbdev: udlfb: Replace get_cycles() with ktime_get()
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051951_127773_C7999775 
X-CRM114-Status: GOOD (  15.69  )
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

These metrics are not really requiring CPU cycles and as those are
meanlingless when the CPU is running at a different frequency, this can use
ktime_get() and achieve the same result.

Part of a larger effort to confine get_cycles() access to low level
architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Bernie Thompson <bernie@plugable.com>
Cc: linux-fbdev@vger.kernel.org
---
 Documentation/fb/udlfb.rst  |    4 ++--
 drivers/video/fbdev/udlfb.c |   24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

--- a/Documentation/fb/udlfb.rst
+++ b/Documentation/fb/udlfb.rst
@@ -156,8 +156,8 @@ metrics_bytes_sent	 32-bit count of how
 			 USB to communicate the resulting changed pixels to the
 			 hardware. Includes compression and protocol overhead
 
-metrics_cpu_kcycles_used 32-bit count of CPU cycles used in processing the
-			 above pixels (in thousands of cycles).
+metrics_cpu_kcycles_used 32-bit count of microseconds used in processing the
+			 above pixels
 
 metrics_reset		 Write-only. Any write to this file resets all metrics
 			 above to zero.  Note that the 32-bit counters above
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/unaligned.h>
+#include <linux/timekeeping.h>
 #include <video/udlfb.h>
 #include "edid.h"
 
@@ -600,15 +601,15 @@ static int dlfb_render_hline(struct dlfb
 
 static int dlfb_handle_damage(struct dlfb_data *dlfb, int x, int y, int width, int height)
 {
+	ktime_t t_start, t_delta;
 	int i, ret;
 	char *cmd;
-	cycles_t start_cycles, end_cycles;
 	int bytes_sent = 0;
 	int bytes_identical = 0;
 	struct urb *urb;
 	int aligned_x;
 
-	start_cycles = get_cycles();
+	t_start = ktime_get();
 
 	mutex_lock(&dlfb->render_mutex);
 
@@ -661,10 +662,9 @@ static int dlfb_handle_damage(struct dlf
 	atomic_add(bytes_sent, &dlfb->bytes_sent);
 	atomic_add(bytes_identical, &dlfb->bytes_identical);
 	atomic_add(width*height*2, &dlfb->bytes_rendered);
-	end_cycles = get_cycles();
-	atomic_add(((unsigned int) ((end_cycles - start_cycles)
-		    >> 10)), /* Kcycles */
-		   &dlfb->cpu_kcycles_used);
+	t_delta = ktime_get() - t_start;
+	/* Avoid a division and approximate microseconds with shift right ten */
+	atomic_add(((int)(t_delta >> 10)), &dlfb->cpu_kcycles_used);
 
 	ret = 0;
 
@@ -727,9 +727,9 @@ static void dlfb_dpy_deferred_io(struct
 {
 	struct fb_deferred_io_pageref *pageref;
 	struct dlfb_data *dlfb = info->par;
+	ktime_t t_start, t_delta;
 	struct urb *urb;
 	char *cmd;
-	cycles_t start_cycles, end_cycles;
 	int bytes_sent = 0;
 	int bytes_identical = 0;
 	int bytes_rendered = 0;
@@ -742,7 +742,7 @@ static void dlfb_dpy_deferred_io(struct
 	if (!atomic_read(&dlfb->usb_active))
 		goto unlock_ret;
 
-	start_cycles = get_cycles();
+	t_start = ktime_get();
 
 	urb = dlfb_get_urb(dlfb);
 	if (!urb)
@@ -774,10 +774,10 @@ static void dlfb_dpy_deferred_io(struct
 	atomic_add(bytes_sent, &dlfb->bytes_sent);
 	atomic_add(bytes_identical, &dlfb->bytes_identical);
 	atomic_add(bytes_rendered, &dlfb->bytes_rendered);
-	end_cycles = get_cycles();
-	atomic_add(((unsigned int) ((end_cycles - start_cycles)
-		    >> 10)), /* Kcycles */
-		   &dlfb->cpu_kcycles_used);
+	t_delta = ktime_get() - t_start;
+	/* Avoid a division and approximate microseconds with shift right ten */
+	atomic_add(((int)(t_delta >> 10)), &dlfb->cpu_kcycles_used);
+
 unlock_ret:
 	mutex_unlock(&dlfb->render_mutex);
 }


