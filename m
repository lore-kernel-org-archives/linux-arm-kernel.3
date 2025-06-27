Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC79C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJQWI5I0MErBn9WTrv1JNB0C4UjjQpBVKY6GABk/040=; b=nS3i4ukRha95ye7/5X0fG96LTy
	xrASy9XQ05zz+rPPo1ntvxXWicq5G9/wF5AnweG50LdUU4b8uWZ2Jm0fJXmERJ6MY/dBMTiw+fpS0
	xaRCf0yBy4hfOny2FT4gC24fZ8bW2GzOSU/B/zjlvhDYTa6R7B19CJA3E7eXQWmXMr2Ctbk7dt1ND
	c8ocJpZRPy+XSCm3J5kS3i1MhRa3iHLUANPbLD3yJC8I+ze9xzBXJJX0jJmp3CmhKWFO0WjJ4KDq6
	CS6a+6ycMU2Ge9qkVZQT8Ox4V4rHrgVNuV8VUfC9xG/uzYE7B2vyNWBAGSZlfv4sqIN0zf7Jwj4xM
	0E8PD7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEMu-0000000FY69-36w1;
	Fri, 27 Jun 2025 19:04:12 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCBY-0000000FJh9-0Rpb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751042660; x=1782578660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TSgOQXH2cylh/c8/YzG1JlJ0nKvfIZhvP1Qcm1/EaFA=;
  b=ClC/ugHmtQBnH2E/osUup/TVLKjXxusApFG1fhFxQbFP7Al9YiLONGFi
   pZsWG9u6cw1zVBA3j9fcroXw3XsstgSBbuTwOsGWsG637F0y5RzKr1rbC
   EZ29zUnFx4QP/2DvBrdnvpnTJad7chAS2mpchQfRlNrJvLsF0ieeIxYsi
   IgBk6WImT/ndQ9lY446okPDxZN77FlbY9nj6FBouRU8c6j7/+ISERzLAl
   bdAi4SxdoTxUpiz2v4xnrEC6KrdAvp+64TXX08G4PX3JPqAO9hbt766/E
   kt4zGKFXKOUwgzPswNtu1bJ7uqG0WKzKkTRKoHaVpheQxeB5WGZzBFKzQ
   Q==;
X-CSE-ConnectionGUID: 7aonlo3gQQGp4YBHzA5OkA==
X-CSE-MsgGUID: w9FHW9pISG+jiRzVvYcIWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57142558"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57142558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:44:19 -0700
X-CSE-ConnectionGUID: jQNau0O0Q+O1RMMTIlbW1g==
X-CSE-MsgGUID: DBf9Q/T1RqKi6tq9M3cw5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152951937"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jun 2025 09:44:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 11A3F2BA; Fri, 27 Jun 2025 19:44:15 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 1/1] mfd: syscon: atmel-smc: Don't use "proxy" headers
Date: Fri, 27 Jun 2025 19:43:58 +0300
Message-ID: <20250627164414.1043434-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_094420_190030_F4823F4E 
X-CRM114-Status: UNSURE (   8.74  )
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

v2: fixed multiple compilation errors (LKP)

 drivers/mfd/atmel-smc.c              | 9 ++++++++-
 include/linux/mfd/syscon/atmel-smc.h | 8 +++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/atmel-smc.c b/drivers/mfd/atmel-smc.c
index 4628ca14e766..0a5b42c83f17 100644
--- a/drivers/mfd/atmel-smc.c
+++ b/drivers/mfd/atmel-smc.c
@@ -8,9 +8,16 @@
  * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
  */
 
-#include <linux/mfd/syscon/atmel-smc.h>
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
 #include <linux/string.h>
 
+#include <linux/mfd/syscon/atmel-smc.h>
+
 /**
  * atmel_smc_cs_conf_init - initialize a SMC CS conf
  * @conf: the SMC CS conf to initialize
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


