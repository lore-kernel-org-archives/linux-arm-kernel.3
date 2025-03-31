Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A7C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TaSqygxkqCMcJXzIqctSdU61Lko/1FiLR/qpj+1lsfM=; b=11GFLgXJcEjb6ZuUef0OU7MnvK
	KZaUvwPay1od0peHJxvU2Y7p+5m2XPif2btfK6olBrHKYcnoW6rUG4rN1df8Z3I2yrS9eGntTzbO0
	RQh9+gG6cLAqPn9XkQICo++bSqXhKs1WoyHqJvMzI2wpB3v0rHtQUPt8TTgs+AONev4mzBrJETgNq
	gSURAXlRP/Rr2URABBxnSpif4nhbHRV6zyPxgirHJ1YUmVPzkJHrwdvov1FYttEgVntgSiuvzmpfV
	/EWUxy1WbXhxo7T9emRnNVLMESmnCpp59MeDPMDwmBQMIxBkysYDGV1o9XZCQaU7PhRLEiywZn4g5
	VowO9c+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Uk-0000000HBuJ-2aKc;
	Mon, 31 Mar 2025 07:23:42 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Sp-0000000HBgl-0ZBa;
	Mon, 31 Mar 2025 07:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405703; x=1774941703;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5XkEjuyV2van/BQCwUUXEpOlzawQC5PT+p/CBGgu1kc=;
  b=a0J4j8u8a7ll6dtdnATSGi+VeRJJAEiQd0Pl64nuR+H3LWoPAAVE/iyt
   0u6Jzm9RlWVCe6HBoGFkoBVuiwQjMXzykEU+ZJCu7WZUimCH4LfEJOtC4
   b9JMFimqfCWGbAil+gI/Lgnr7xG7Y8t/rVDwaKWt4ucZK6nQaJxyxkQ10
   Hu9FtKL3PtE4+0Vnjs6CSFDDho/1f0Mvbsc3eCaU0E3qgQUVcGZ0RJ/wq
   RTpfwAYYakzi0KAjK5w+Ii5SF5Dmm9WDAX8M74N8nqxzNUxULwKBYl1xA
   AmqTFPTFe21fhv0C7dzuUxTDAj6rtI9GQyGyKFH/G5uYs/oDvwcTSh2uG
   g==;
X-CSE-ConnectionGUID: ES6eA+CJTsmHPKJG924F2Q==
X-CSE-MsgGUID: Y6pNlnQzQx2zsA3q6NMZuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48466724"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="48466724"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:21:42 -0700
X-CSE-ConnectionGUID: Bnu6NutjTYW/R0x5YADX4w==
X-CSE-MsgGUID: FCUgQ0auR/SrITSB1Sovvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126247204"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2025 00:21:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79D331B4; Mon, 31 Mar 2025 10:21:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] media: raspberrypi: rp1-cfe: Remove (explicitly) unused header
Date: Mon, 31 Mar 2025 10:21:36 +0300
Message-ID: <20250331072136.3987653-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_002143_232604_56C87531 
X-CRM114-Status: GOOD (  10.82  )
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

The fwnode.h is not supposed to be used by the drivers as it
has the definitions for the core parts for different device
property provider implementations. Drop it.

Note, that fwnode API for drivers is provided in property.h
which is included here.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 69a5f23e7954..fcadb2143c88 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/fwnode.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
-- 
2.47.2


