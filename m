Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1B9D31A35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l/E7ExTubkkyxXCzVbpQxo2KmM1nm2KyOFnCzexyVgA=; b=LcGt+IuNKI9OKmNQNxD4r5N6xy
	PZGtjlChZtnm0+2GweFZU4ShS3lUj0ZLXt1Ecz7v3L7v4f8M8mAx9gDedL4Dhg1UdNzOfonfLGMag
	9MR5iSkDhPs8sIx/om1R9FKnC3Kkr2z2+qZu2Ir8MZqC6t/viMjUASErVPt6PEddHd1Bq0yfDp4AC
	78FVi5n6Myrmhuz0HEFKEOoTzY18miOcm5r9C2uqqdK0Ti+baMxEubvBkS+o9vycKeRCPYYIunlYV
	z02EVvHAwmD6djjJzSCd8WfYD46eftHmbBZDHN4MtUmV5S48uOmKcgQXk1jco4+5Pvn5YU1h2oyaF
	1sP8N0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxAq-00000008YHl-32aH;
	Wed, 14 Jan 2026 09:28:20 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxAk-00000008YGY-2MbE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768382894; x=1799918894;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dx8wdyZ1+Rq3DObPX6zf0dh3NrSxxmnlPzpX3UXG2ec=;
  b=P4BSMhKYvqJAwZobesf3jmcjdbhF0WFdLxSrbbOSxABpSvM/VfqkDOcd
   imexW5Cl065II8Ib/TB5wq0zCFySLeopwRH79VMQ6lqz/LWCM3/BFwwZE
   NfU5ZeyhCs8aUiMOvUEPTLAZ5FREAE0I8pyZswAHdwI8osGDmzgIySKhf
   Yma/kyrkVDMO7eRcl0lURvxfc0R8SLtlTzANI2oNKIX0Y+vcfPiyqEhM8
   hP3JAs4+xrbat1ViN3k3xqNnvAMqZxszpYvKpT7Mm8fVMWrl2YjWXR7Nb
   Yt7PWmDy4hTqfZ4lNim0lVEkT8UXGsWaG6Y0YLDgkX/JV1RlW2RaZaO/X
   w==;
X-CSE-ConnectionGUID: V4H94M3gS5upY1aEwqiUDA==
X-CSE-MsgGUID: 8fIXLuICQ1Sx1qpbHVWgAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87258427"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="87258427"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 01:28:14 -0800
X-CSE-ConnectionGUID: bRaxQtijQleZaZYRzDl9dg==
X-CSE-MsgGUID: PoJBeXJ0T52sf7c7XXKeZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209474968"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 14 Jan 2026 01:28:11 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9737998; Wed, 14 Jan 2026 10:28:10 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-pm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v1 1/1] thermal: stm32: Use predefined HZ_PER_MHZ instead of a custom one
Date: Wed, 14 Jan 2026 10:28:08 +0100
Message-ID: <20260114092808.273695-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012814_730731_266F39E3 
X-CRM114-Status: GOOD (  11.05  )
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

Use predefined HZ_PER_MHZ instead of a custom one. No functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/thermal/st/stm_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
index 6e90eb9f414d..5d8170bfb382 100644
--- a/drivers/thermal/st/stm_thermal.c
+++ b/drivers/thermal/st/stm_thermal.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/thermal.h>
+#include <linux/units.h>
 
 #include "../thermal_hwmon.h"
 
@@ -76,7 +77,6 @@
 
 /* Constants */
 #define ADJUST			100
-#define ONE_MHZ			1000000
 #define POLL_TIMEOUT		5000
 #define STARTUP_TIME		40
 #define TS1_T0_VAL0		30000  /* 30 celsius */
@@ -205,7 +205,7 @@ static int stm_thermal_calibration(struct stm_thermal_sensor *sensor)
 		return -EINVAL;
 
 	prescaler = 0;
-	clk_freq /= ONE_MHZ;
+	clk_freq /= HZ_PER_MHZ;
 	if (clk_freq) {
 		while (prescaler <= clk_freq)
 			prescaler++;
-- 
2.50.1


