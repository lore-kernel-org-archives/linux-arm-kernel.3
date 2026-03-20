Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F831099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D1EjCt4Ivm9KY54kWEHJqokWGbXe44CtrCfz7X5sUBI=; b=ee+BjBr6OQsPIhlDwmxn9VNJ+i
	LaObBQFSHAN+3xKa3bBU0N5IoX18XJMH4uxmlMUEWBdiA4MK7wiPHPUzGEFI0O/34ZjbutZ5nFqeO
	0sX56hMQ23WQTR4D4kxp8tqWjFuTsaEZYVS4ci3EiNBV/zfhZJypQQagHta7OTWgO7pF1LnRhj64r
	5yaNjSl3eDG+D1woX51nCQOHm2pS+gD5U3VD6ksh+pgided1Uwwt8Or7ThvklLbQ3TXfERWw/e7UF
	I2g/diqiG1qefCUbpIyFM62uF7YRwEs0uzvTf1aDTpVRxkYm9c3MVGkSwDplmCzCuurLtsVM0YhQI
	ypJUVfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hpM-0000000Decq-2onY;
	Fri, 20 Mar 2026 21:56:20 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hpF-0000000DecL-0f7P;
	Fri, 20 Mar 2026 21:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774043773; x=1805579773;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Rf2eakh5ZeaAaheFJYAVxm4fy6YqH2KFkakWRjpmuM=;
  b=V1tn8RB3dn3urYQ1OE6BNMxaTGWhe11BQWRGmG+HB85fDpLViNY5JImy
   47gfXQ0bTmIukYwSVmlxP7oa+C669Y8Z+US2byTZBUeV4vzKfIU/HvJT7
   ahAjn7vO3jbwgOqqqjp/lYQ4LxpZgiRPIxTf8uXSxVUghdGCgabpSZqJB
   MZ9RcVd7PJ/q/iXthX0c6CM6ezojr6Ocwan1f8B0N12mOOeH4sOu5//Eg
   bzJsFwC+GbUREea88JEswrrr8V8VH5bqrt9YuAOfJowAooVCzSxDESULH
   D5a+fb22MI0UGiAc7a1Mfn1LkSif34s0AM1TjGPOwV1sJ6V0na9LSbwwE
   g==;
X-CSE-ConnectionGUID: JA6RV0LrSsq9e7T/yJtO0A==
X-CSE-MsgGUID: FylbJ+4ASKuxZpGeXyWx4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75206241"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75206241"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 14:56:10 -0700
X-CSE-ConnectionGUID: RKkVuXzFSeeUmx+o2YwLYw==
X-CSE-MsgGUID: Kp0B0jduSwCPwqIM2VlfoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="220732837"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 20 Mar 2026 14:56:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DB47195; Fri, 20 Mar 2026 22:56:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] scsi: ufs: rockchip: Drop unused include
Date: Fri, 20 Mar 2026 22:56:06 +0100
Message-ID: <20260320215606.3236516-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_145613_211203_5A81AABD 
X-CRM114-Status: UNSURE (   8.77  )
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
 drivers/ufs/host/ufs-rockchip.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-rockchip.c b/drivers/ufs/host/ufs-rockchip.c
index 7fff34513a60..bac68f238e1c 100644
--- a/drivers/ufs/host/ufs-rockchip.c
+++ b/drivers/ufs/host/ufs-rockchip.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-- 
2.50.1


