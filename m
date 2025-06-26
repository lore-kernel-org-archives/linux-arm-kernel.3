Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13B4C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vusDHI++gFUYMEW3xTUw2hJurc9G5HupehcGpEINLw=; b=IVkKyUC742gLMPWY5SA3skriSe
	AHRuk4bNqbzsXwzdZuQJcrAHpZvF1e5NtyernbLmlxTe1XMYZDIgUrwLekN1XmK056tAiZMIa0veS
	rxkGHRgCwrHbPDF03C0c6jpq6Q9VT3vpWvqmqiiFo41FllVAm4yN7IZjkCaOH5zrH/K7L0u/ZPf6o
	0HbRLW1vMoA55+LGjYwaHT616c5zSQ1HZgNDVWrXiyCooEdQrt3xVffeMj0B8bV5B9lICro5zf6uz
	dOa51hPBhc6lR+tvQKr38ixiM2UdshQOd6hNZXC3JYdfKtBZB2GvW26os47Fcwe7gsD6gS9jQ9U4O
	w66Enjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpNW-0000000CGMq-2B8f;
	Thu, 26 Jun 2025 16:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUow4-0000000CCE7-0RD7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Jun 2025 15:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7vusDHI++gFUYMEW3xTUw2hJurc9G5HupehcGpEINLw=; b=ddCm6cC/GRZ13nNekQowEV6Nfy
	uZ9xpTro5PUW/+wNVTMCkzBYoc8EQdfXKGGVIPct/tUzeV/SIFqYtCgpFJlWjikk5VTYFLdpUuxqS
	Sjx9EHMHkkfONApcj5RHKBcOR52GEax2I5URDGXXEfu8sSWKgCTjaV0Uq7icMaQB0nwga4UTNsdST
	wF2hywSO1+eiP6hALOAF8NGHF477hxq6G5wT9pDNW5L+udbmhp17A/F+JtH6iQVOz6bzV9JiHUTNM
	Holi5lsThFRy71rnMo7NW4UYj4mR8U3+AAbglJShjE5oKAGZimMUvpKHz05VjZuu1s2XvJolEOQyi
	YUBtMBFg==;
Received: from mgamail.intel.com ([192.198.163.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUow0-000000068Lk-3Vxj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 15:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750953285; x=1782489285;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rr7naJ8D39trASGJNx8p2aZIXHv/0lnvvY69U2XEs1U=;
  b=Nt02UcIjF6uBzcEUTQdd0p3x/wK0asSqkTl2G/pmqiFiQCwWoWuxdSmC
   rehyCGVurU9H2+ekhNk9FrofQd2Z+mEP4/7mOxStuqP0goY1Z0WxqzhOn
   dLxC8dA3B4nFQ1wXb0D143d7Mf5lzpVfe4HPctHO7qrwg+gIBxE7zqYqh
   I7zLpfbMND+7oMwp38Z4zcFXUtscwLKjrLlqLRycuNukTdF7CIm4zZAWi
   PaLs1isC0CeWMj5W2xv7NI5i6ivpYpmpwjQ+RAWQvMdj9CR5J8p6lRFXk
   BOSG1SjyLnZWlnfioXrVON0NgNE5TtcItXH1N75KJfiaJncaqPZdOwP5J
   g==;
X-CSE-ConnectionGUID: Plnb9IaqRLi/TPHRjvmPZg==
X-CSE-MsgGUID: YP4lqB4cQ32FEWyVxHguHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="40873556"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="40873556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:54:39 -0700
X-CSE-ConnectionGUID: Bez/RQZwRBqXF5dnB4L9lg==
X-CSE-MsgGUID: Rkbpn1nCTKqqvzB7pds8Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153085029"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2025 08:54:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 29AE32AD; Thu, 26 Jun 2025 18:54:36 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v1 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Date: Thu, 26 Jun 2025 18:54:35 +0300
Message-ID: <20250626155435.325336-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_165445_324089_326A9A36 
X-CRM114-Status: UNSURE (   8.04  )
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mfd/syscon/atmel-smc.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/syscon/atmel-smc.h b/include/linux/mfd/syscon/atmel-smc.h
index e9e24f4c4578..9b9119c742a2 100644
--- a/include/linux/mfd/syscon/atmel-smc.h
+++ b/include/linux/mfd/syscon/atmel-smc.h
@@ -11,9 +11,11 @@
 #ifndef _LINUX_MFD_SYSCON_ATMEL_SMC_H_
 #define _LINUX_MFD_SYSCON_ATMEL_SMC_H_
 
-#include <linux/kernel.h>
-#include <linux/of.h>
-#include <linux/regmap.h>
+#include <linux/bits.h>
+#include <linux/types.h>
+
+struct device_node;
+struct regmap;
 
 #define ATMEL_SMC_SETUP(cs)			(((cs) * 0x10))
 #define ATMEL_HSMC_SETUP(layout, cs)		\
-- 
2.47.2


