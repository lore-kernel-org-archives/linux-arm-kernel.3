Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF0D1099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=25V8DYFU9KgrqSnL4j6VKPHgjbPInL8yTB/LVOU5qIo=; b=gEnyme87ZVs1szzc8mYpU4m/tc
	OlZV5fxqSj52A97oai/13RVswKFMspf5vw+pa2jkdsRgcKjRIIs0yMaP1mgYL/JlVzZ1MJzKpesKK
	Gb/Nf3FwsiwOC2L7nxs/Ib0YCqh45nh/dmRd8i6gs6k0+9ioMF8tCDsD9wPndkgeiOpN28nzi8+OZ
	IseW6lWX1h9WiU9Mp+bme2E9Id79jIfwg0GrUHFxMb/iMcEc5cePf69HX2V/cPJTJTdGeXjJiZkPS
	+b1VUb1f4SpViNq6x2pWCZUEvWWjUhP5qJm8d40XZ/YrCy2w4ao8Xsq1beDjiUecNj/4dEeTK0Bh/
	kTRlU/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i1C-0000000Df69-1byT;
	Fri, 20 Mar 2026 22:08:34 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i19-0000000Df5q-3JIq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 22:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774044512; x=1805580512;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FaZ0aLusP0pFPS2jA5Ih5uKpG/m0MxKuEKIdtPOd6v0=;
  b=kR3V5me+XCU1WGo3UAYEhNnUBWCvvza6hPQpzQ2oR6wW7bphc0amkDTm
   y0OAqWPEBxY4Sny4VqAIDoMWSBjuoXXfO3+WvAFJgE+kkTwUpKwK0ztxh
   LXNjoUXNuwvL0m9cgTSyiz2dX9SHVh2WtTm0o+jEp+j89GJzC2tq4CCaG
   3HDPpWQYV3cJNNbo5H87jbfbYmHpB0csUXramCK087GRtFbe2uyxfK+s0
   PT66v0qZuYAGnw+BtTuYRSahcDqc7rJBuyj/oeIAbePfbUnVGGWBly24W
   BAGC4LJgAPGQbU797C+cCBl8x67V26EDygUzj9nGgUoYlIj3CfujXkij9
   g==;
X-CSE-ConnectionGUID: bmvsACN2TZagAq1BKqRoIA==
X-CSE-MsgGUID: kb8yVPr+TxSaYzE+qQg1rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74841440"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="74841440"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 15:08:31 -0700
X-CSE-ConnectionGUID: Ayl5QMB1Qv6Dm5vGfOljew==
X-CSE-MsgGUID: XAREnRUaTBCm/gJqTw/umA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223398209"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 20 Mar 2026 15:08:29 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2620595; Fri, 20 Mar 2026 23:08:28 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] serial: xilinx_uartps: Drop unused include
Date: Fri, 20 Mar 2026 23:08:27 +0100
Message-ID: <20260320220827.3237499-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_150831_890610_AB50AD18 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/xilinx_uartps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
index c593d20a1b5b..a072b75dbaf2 100644
--- a/drivers/tty/serial/xilinx_uartps.c
+++ b/drivers/tty/serial/xilinx_uartps.c
@@ -22,7 +22,6 @@
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/reset.h>
-- 
2.50.1


