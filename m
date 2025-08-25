Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31688CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhJX7lYH6Ks2ZFGlgrdRtJtSoWafm0FdMUF8vZDPYT4=; b=4iXUAp+8FDqBpHqYgWWFuXIe4k
	s4svghStx2jeRr1yl7Zi9L8ZFQvhbcaEI5QWUoV1BDJcHYUGJZ/W3Bf3TmMtzomrnwiNFz38vmrS9
	b16syDWa0HiDryfaJ9ZNSPqibRTfSpXR5OCwWznnyxTB4OmToT/p256Etq3Z8x42czRNIAp9ucckR
	/f4zp3179FuIIgtO6nQGqkGMJri2C/ePny+zQLLrqFGdsq9DkrlXFntszlMCGX4VGmtyzPBABU+Sk
	9F+A3Z5rRhQfGMv8tVR/tCaCnqUNLDlrP+/4ycHKQPRbbRi/y3I8kw+gVWtPrI5UJknymd45oTkxw
	HgTwtcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYB-00000009AkG-05SJ;
	Mon, 25 Aug 2025 19:08:15 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaAp-00000008hOH-105z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 16:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139759; x=1787675759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4BgR1C08p0drss5NDxXSek6A+9jO5AXL54CNKL2STq4=;
  b=AZs0u7aoBYGIy7weIN9XXwIvOQwUDTW01aHDcYsWqKWWFJ8uh4N3kxpb
   maqEt7nKoTQi+JhQ9bos3/BMFRq0MLsDEB3shLjYiWA24uHgpBygcUl5v
   Utl72acLunXCNsEEGlOUdOaTUJFELqBW8iCC7Xe+prnQ3qE6ky+83nRXd
   bqw0LbVeeosxjzOsHPiv2j9u2YoSTeGsH44JMPdmIn8c3zA5hiPuv1bJJ
   W0jKoBrSr8QBmNRITw8jcehp7P/YVgGnsoR7Ba030qv1gGNl60756pfnc
   yyVl8LhnseFV/dwRBXI+ojSo/y4s7jFlh5kflX1OHTJuHcKwCmlwQ8LAQ
   Q==;
X-CSE-ConnectionGUID: BFZphEj5Tf6mFoqNAgekKw==
X-CSE-MsgGUID: GrT7sgP+RCCou47EnoxwHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58288813"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="58288813"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:56 -0700
X-CSE-ConnectionGUID: RQaCu0IOQPuihHdwgc5pQg==
X-CSE-MsgGUID: snlOI4+aRY2/4OBMeyrQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="168588221"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DD7AF96; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/3] floppy: Replace custom SZ_64K constant
Date: Mon, 25 Aug 2025 18:32:56 +0200
Message-ID: <20250825163545.39303-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_093559_288190_6246FD62 
X-CRM114-Status: GOOD (  17.10  )
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

There are only two headers using the K_64 custom constant. Moreover,
its usage tangles a code because the constant is defined in the C
file, while users are in the headers. Replace it with well defined
SZ_64K from sizes.h.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/parisc/include/asm/floppy.h | 5 +++--
 arch/x86/include/asm/floppy.h    | 3 ++-
 drivers/block/floppy.c           | 2 --
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/floppy.h b/arch/parisc/include/asm/floppy.h
index df20dbef3ada..f15b69fea901 100644
--- a/arch/parisc/include/asm/floppy.h
+++ b/arch/parisc/include/asm/floppy.h
@@ -8,9 +8,9 @@
 #ifndef __ASM_PARISC_FLOPPY_H
 #define __ASM_PARISC_FLOPPY_H
 
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
-
 /*
  * The DMA channel used by the floppy controller cannot access data at
  * addresses >= 16MB
@@ -20,7 +20,8 @@
  * floppy accesses go through the track buffer.
  */
 #define _CROSS_64KB(a,s,vdma) \
-(!(vdma) && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+	(!(vdma) && \
+	 ((unsigned long)(a) / SZ_64K != ((unsigned long)(a) + (s) - 1) / SZ_64K))
 
 #define SW fd_routine[use_virtual_dma&1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
diff --git a/arch/x86/include/asm/floppy.h b/arch/x86/include/asm/floppy.h
index e76cb74bbed2..e7a244051c62 100644
--- a/arch/x86/include/asm/floppy.h
+++ b/arch/x86/include/asm/floppy.h
@@ -10,6 +10,7 @@
 #ifndef _ASM_X86_FLOPPY_H
 #define _ASM_X86_FLOPPY_H
 
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
 /*
@@ -22,7 +23,7 @@
  */
 #define _CROSS_64KB(a, s, vdma)						\
 	(!(vdma) &&							\
-	 ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+	 ((unsigned long)(a) / SZ_64K != ((unsigned long)(a) + (s) - 1) / SZ_64K))
 
 #define SW fd_routine[use_virtual_dma & 1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 24be0c2c4075..d769a223fcc8 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -233,8 +233,6 @@ static unsigned short virtual_dma_port = 0x3f0;
 irqreturn_t floppy_interrupt(int irq, void *dev_id);
 static int set_dor(int fdc, char mask, char data);
 
-#define K_64	0x10000		/* 64KB */
-
 /* the following is the mask of allowed drives. By default units 2 and
  * 3 of both floppy controllers are disabled, because switching on the
  * motor of these drives causes system hangs on some PCI computers. drive
-- 
2.50.1


