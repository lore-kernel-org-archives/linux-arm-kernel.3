Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16201F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 20:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2X9IdtUnrT50yiykczKjUwFjhJemy6Dkqp8i9B0154=; b=GVBz92rJAw0ZKMbU32Ul7Indze
	CqmO/2rCRRf1KA0GsEC7xhameDUBOGPYaKzYzXyh33qWo//yOduSQUMEYBSpBgSPmeZcQ96uYJBki
	hAjAHot3yvBB2+0zVZpWElTL8JVElGpoL3CuLLIAUp7791GSY3XL0z8YVgUarIzvjNbljuIuc/ylf
	biKn3+KmBhvzVhGPvUeOgHJ5kInIc1ESIJONx4zXLu4QdtTy0DShYWCjswJPM3U6bX1NkXQvP0h04
	ToHOYDToOzaLvc0EPHm3gMtQinJZPSPh9hw6GEiLtMK07VZfgxtBCx9uzcRpRBGI/spWlvDH3VW0/
	NzaOH5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBItn-0000000CnHG-2wFJ;
	Fri, 10 Apr 2026 20:56:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBItl-0000000CnGP-1glM;
	Fri, 10 Apr 2026 20:56:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EABB3403ED;
	Fri, 10 Apr 2026 20:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2163C19421;
	Fri, 10 Apr 2026 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775854576;
	bh=Pl/TPuj3MEjAUAkiR6iNGQuG7vTK4etd1CQHextbc1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GQ142PFWFm6CPGgxzIstxv+Opw0b8SXuQ9OyBP6RDGrB9wMYrgGJRlAIcXmjiMiJQ
	 uvHLzYRX996/8mwPCxIT6HNprAxZjHfiZYVGdKL2zkx4tDdEJ1Qjhj23YsuYeVWZUk
	 qB897HhG8G4RkSYw8g0MDIEY8t5mxlaTJQ0hQJRlVPLc72Bfpv47WYQcen6mmTC6UB
	 IDYz08Lq5Ox+catFPgX2TnERo0NsyMmc6D+DEo5bfEi3Zb8CozxsaaIUnftUYBffz4
	 eRJ2pErWPmB+XVojMvRq9gH2C+KSLENGTN6u78aH1Po3BWHW2gKcN/A+CamqsNtu9t
	 mhyolj1ID3OUA==
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, Lu Baolu
 <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, Bernie Thompson
 <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso
 <tytso@mit.edu>, linux-ext4@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, Marco
 Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Richard Henderson
 <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dinh Nguyen <dinguyen@kernel.org>, Jonas
 Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Paul Walmsley
 <pjw@kernel.org>, linux-riscv@lists.infradead.org, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, "David S. Miller"
 <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: [patch V1.1 11/38] misc: sgi-gru: Remove get_cycles() [ab]use
In-Reply-To: <20260410120318.320727701@kernel.org>
References: <20260410120044.031381086@kernel.org>
 <20260410120318.320727701@kernel.org>
Date: Fri, 10 Apr 2026 22:56:11 +0200
Message-ID: <87ik9yzg9g.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_135617_480474_99DC349A 
X-CRM114-Status: GOOD (  12.26  )
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

Calculating a timeout from get_cycles() is a historical leftover without
any functional requirement.

Use ktime_get() instead.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
V2: Fix typo
---
 drivers/misc/sgi-gru/gruhandles.c   |   20 ++++++++------------
 drivers/misc/sgi-gru/grukservices.c |    3 ++-
 drivers/misc/sgi-gru/grutlbpurge.c  |    5 ++---
 3 files changed, 12 insertions(+), 16 deletions(-)

--- a/drivers/misc/sgi-gru/gruhandles.c
+++ b/drivers/misc/sgi-gru/gruhandles.c
@@ -6,26 +6,22 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/timekeeping.h>
 #include "gru.h"
 #include "grulib.h"
 #include "grutables.h"
 
-/* 10 sec */
 #include <linux/sync_core.h>
-#include <asm/tsc.h>
-#define GRU_OPERATION_TIMEOUT	((cycles_t) tsc_khz*10*1000)
-#define CLKS2NSEC(c)		((c) * 1000000 / tsc_khz)
+
+#define GRU_OPERATION_TIMEOUT_NSEC	(((ktime_t)10 * NSEC_PER_SEC))
 
 /* Extract the status field from a kernel handle */
 #define GET_MSEG_HANDLE_STATUS(h)	(((*(unsigned long *)(h)) >> 16) & 3)
 
 struct mcs_op_statistic mcs_op_statistics[mcsop_last];
 
-static void update_mcs_stats(enum mcs_op op, unsigned long clks)
+static void update_mcs_stats(enum mcs_op op, unsigned long nsec)
 {
-	unsigned long nsec;
-
-	nsec = CLKS2NSEC(clks);
 	atomic_long_inc(&mcs_op_statistics[op].count);
 	atomic_long_add(nsec, &mcs_op_statistics[op].total);
 	if (mcs_op_statistics[op].max < nsec)
@@ -58,21 +54,21 @@ static void report_instruction_timeout(v
 
 static int wait_instruction_complete(void *h, enum mcs_op opc)
 {
+	ktime_t start_time = ktime_get();
 	int status;
-	unsigned long start_time = get_cycles();
 
 	while (1) {
 		cpu_relax();
 		status = GET_MSEG_HANDLE_STATUS(h);
 		if (status != CCHSTATUS_ACTIVE)
 			break;
-		if (GRU_OPERATION_TIMEOUT < (get_cycles() - start_time)) {
+		if (GRU_OPERATION_TIMEOUT_NSEC < (ktime_get() - start_time)) {
 			report_instruction_timeout(h);
-			start_time = get_cycles();
+			start_time = ktime_get();
 		}
 	}
 	if (gru_options & OPT_STATS)
-		update_mcs_stats(opc, get_cycles() - start_time);
+		update_mcs_stats(opc, (unsigned long)(ktime_get() - start_time));
 	return status;
 }
 
--- a/drivers/misc/sgi-gru/grukservices.c
+++ b/drivers/misc/sgi-gru/grukservices.c
@@ -20,6 +20,7 @@
 #include <linux/uaccess.h>
 #include <linux/delay.h>
 #include <linux/export.h>
+#include <linux/random.h>
 #include <asm/io_apic.h>
 #include "gru.h"
 #include "grulib.h"
@@ -1106,7 +1107,7 @@ static int quicktest3(unsigned long arg)
 	int ret = 0;
 
 	memset(buf2, 0, sizeof(buf2));
-	memset(buf1, get_cycles() & 255, sizeof(buf1));
+	memset(buf1, get_random_u32() & 255, sizeof(buf1));
 	gru_copy_gpa(uv_gpa(buf2), uv_gpa(buf1), BUFSIZE);
 	if (memcmp(buf1, buf2, BUFSIZE)) {
 		printk(KERN_DEBUG "GRU:%d quicktest3 error\n", smp_processor_id());
--- a/drivers/misc/sgi-gru/grutlbpurge.c
+++ b/drivers/misc/sgi-gru/grutlbpurge.c
@@ -22,13 +22,12 @@
 #include <linux/delay.h>
 #include <linux/timex.h>
 #include <linux/srcu.h>
+#include <linux/random.h>
 #include <asm/processor.h>
 #include "gru.h"
 #include "grutables.h"
 #include <asm/uv/uv_hub.h>
 
-#define gru_random()	get_cycles()
-
 /* ---------------------------------- TLB Invalidation functions --------
  * get_tgh_handle
  *
@@ -49,7 +48,7 @@ static inline int get_off_blade_tgh(stru
 	int n;
 
 	n = GRU_NUM_TGH - gru->gs_tgh_first_remote;
-	n = gru_random() % n;
+	n = get_random_u32() % n;
 	n += gru->gs_tgh_first_remote;
 	return n;
 }

