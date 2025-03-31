Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC6EC36013
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VAUBCR1qQypaLZ0U75royn7et8hFAe1cCo6TxIoWr8g=; b=fFzp2tY22thWMH9KxURI8UrkU4
	Y4JFCAUpO0BV6NoI/KCA/oVG9q+CXrdie9GvxlL9ll5PMIQ0GPD4jGRUaH09YK6Vk0Z/O5HbmNLvQ
	krTfTg3PashXTGpkKLb98PbK7amYxfwWTnxqVHAwFNd4GJRAcKfY9JGZNLBmMJlYvPAr27xITyDZh
	z0mGAh7hOpRQhN37hwZEcYWdaZepXMZ0vjBN9gor2foq+l/ebEPCfduq7swBjEJCFy+/rozwkoEHj
	jAKJfmj4zKYKi+PT8OlmxRHc8dj2umcSumOdukpfimEX6Tj2rfMfJF6/bNoY0PMIgLOA3ffj5o5C6
	izsuzCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9Ph-0000000HBNv-1kz8;
	Mon, 31 Mar 2025 07:18:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9MK-0000000HB1n-1mt1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743405300; x=1774941300;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S9PLDZwlG5H+w+pVSMdCcSg1mFwcQbvBvxpNPhwVhLA=;
  b=CJAocyJ2h7rdkoGwI+D1u3vi0vfWTj2SIw0nHGT94d8ra95iKEUuUJwT
   BG0oPvDHOefd4fPYWFdytFgKceI+Xe4IDb706d0fITWTvwsQ3FxO1JREK
   ++QxwjR0UB5NkmfxCXuR+Wl4u+UjvxwslRUa4I4hRz36OsRiEThx+uBSl
   aDZsOaEgAa+a/kZCkbyQZZqcKNitTH0tveWoJM85TB/WeofZ5dVLR4Lzm
   /O51y6bPjVAy9BbnB1F3+vF0DsR2lJIGrOanIl8o5WpY/FhvmSqP7YVDg
   3g/7L5ELwEzwDmlrh7pKkB2eW4BLi0KRDnzP1p7gKTQuLo6YCF5GfSAa6
   w==;
X-CSE-ConnectionGUID: I3qeXeceQMCCa87z5a4IXA==
X-CSE-MsgGUID: s3cSIeZmQn6XTFPxU5AtmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="47405487"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="47405487"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 00:14:58 -0700
X-CSE-ConnectionGUID: LA0GxrAORYSgJ6o2AYSWww==
X-CSE-MsgGUID: oMQXemDARSOWSW/dU9e+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="126919645"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 31 Mar 2025 00:14:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4CECF1B4; Mon, 31 Mar 2025 10:14:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] coresight: cti: Replace inclusion by struct fwnode_handle forward declaration
Date: Mon, 31 Mar 2025 10:14:53 +0300
Message-ID: <20250331071453.3987013-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_001500_472862_5EBD4A27 
X-CRM114-Status: GOOD (  12.39  )
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

Since the code wants to use the pointer to the struct fwnode_handle
the forward declaration is provided.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwtracing/coresight/coresight-cti.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 16e310e7e9d4..8362a47c939c 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -9,7 +9,6 @@
 
 #include <linux/coresight.h>
 #include <linux/device.h>
-#include <linux/fwnode.h>
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
@@ -17,6 +16,8 @@
 
 #include "coresight-priv.h"
 
+struct fwnode_handle;
+
 /*
  * Device registers
  * 0x000 - 0x144: CTI programming and status
-- 
2.47.2


