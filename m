Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A80CA0FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WyGocCgHBIIkkkxcd3AEqFZiqE4Qc8dTTZQnUK0iu8=; b=cO6y6S2Ec8NXam7jGX8meSQOQM
	kUI9Sd0TrF+CXilcKv/gXIcNvoqOfpm+obMZZsxzyFAqIINU0+fOeAAXDnmGCqxlOuZ2UWpwVy5fc
	1w9ZSMIV9CGiBfRNBXwc+GkrkLq8lC7Ha/fdQAfzWA3lTwt0WslOY7nBo93npHydWBGuS8/HnjuZW
	O+b+eRGi73qBAz2n4SYnJdPZKSscR6ErHuMQ6XYEbSgQ7z665iSEubiBb6BoMXvEX9zAxaHx2KrAY
	vstFcezN6LSY4SmkxS583tYUZywlIu0staiomanZO4E84H01mzh1CIftCeYk1KLhZamD1YJUzS3Oa
	gES0uvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYA-00000009Aji-1hzc;
	Mon, 25 Aug 2025 19:08:14 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaAn-00000008hNb-2iRe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 16:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139757; x=1787675757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WzmZWMms4bv8taptRv7sWNE6UwWdfM4GmVI+cXRz004=;
  b=QNF9pf7Oa43vX5VKBm0IwM5wQiF3GZTS+ueXNkqn8A2F02I46VDZXmPk
   CBm1bPp608VXM9kvfv7ZjVUvyb2hxfqiH8QR8dSbCV23fI2xMX+2Eec73
   hF7Mcj/z03hIpWoVNIByBOOuITe2Ps6YmDboYZGmy/0/uy9PJ/jp3/J3T
   /pY5A9L7EtBQ7FIvzPqQTFCf1OldDIZYoNr+7b3LMb7HjtCwYJXvbsokV
   iHlko925VR0vchIkfkMEcHT/2TDPyUb8JKQoIcB+PvBsuq9JaK4YypoHn
   3L8T+pHCINCmnduIokMIlhN2LbxlIPnr6TNyc9Z04ZwVaEtLIkIYckXBq
   Q==;
X-CSE-ConnectionGUID: yoDnlggSTICHwGTwh5X4mQ==
X-CSE-MsgGUID: jD/2kPYPQVSSfxa4w+6rhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459537"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: wGy2mzdEQBu6ep/2AqbnXQ==
X-CSE-MsgGUID: NAapVdSxTk+ZacKhIWFZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241086"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E1D6697; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
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
Subject: [PATCH v2 3/3] floppy: Sort headers alphabetically
Date: Mon, 25 Aug 2025 18:32:57 +0200
Message-ID: <20250825163545.39303-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_093557_734445_911403F8 
X-CRM114-Status: GOOD (  12.29  )
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

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/block/floppy.c | 54 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index d769a223fcc8..61d62019a38d 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -163,35 +163,35 @@
 
 /* do print messages for unexpected interrupts */
 static int print_unex = 1;
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/fs.h>
-#include <linux/kernel.h>
-#include <linux/timer.h>
-#include <linux/workqueue.h>
-#include <linux/fdreg.h>
-#include <linux/fd.h>
-#include <linux/hdreg.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/bio.h>
-#include <linux/string.h>
-#include <linux/jiffies.h>
-#include <linux/fcntl.h>
-#include <linux/delay.h>
-#include <linux/mc146818rtc.h>	/* CMOS defines */
-#include <linux/ioport.h>
-#include <linux/interrupt.h>
-#include <linux/init.h>
-#include <linux/major.h>
-#include <linux/platform_device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/mutex.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
 #include <linux/async.h>
+#include <linux/bio.h>
 #include <linux/compat.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/fcntl.h>
+#include <linux/fd.h>
+#include <linux/fdreg.h>
+#include <linux/fs.h>
+#include <linux/hdreg.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/major.h>
+#include <linux/mc146818rtc.h>	/* CMOS defines */
+#include <linux/mm.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/timer.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
 
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
-- 
2.50.1


