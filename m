Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30428C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjrvvQmo/fKDtVMvtCDb2bRjs6bfmJhMEvD/yxRPZ2U=; b=LO4g2Ow3ldt0caHverPbErYX+q
	jpPgZewU7QqTFj9b8+Bd++P6BwecSyslCE1jLCPX44XFOl1ocbX04BNB7gq2Peyr0rlmo5hIjPSeC
	LgmCR6uEVtTUf4SJTNL4HrROLA7InQUT7nALKYNmXuKQiCRMqz9FdXzZiY0kUylj3Oh9mW7KNL259
	pBvFIy64VXL+w/pnO3d4gLekY5dlPdvz7cghAR/azSMyk+yadD82khHUUjFoMVV8b0ezut9RAepmx
	y90CEE7spfLUu2ZTIurtR4QQUqfHBdukEigFiDj7Qx+Avl8XIqSOT7l+QQh/2dYn+DQKQrCtNFbb4
	ObK+hQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgtY-00000003gVB-0Fc3;
	Wed, 05 Feb 2025 15:00:52 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgqq-00000003g62-2mig
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767485; x=1770303485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LWWSgceP4b2NC/0ZlJaLRWZ5tS4LiVtbK0mjSJfEAow=;
  b=T2CsNcXjRU0nRa5ClclabJqdPR8wBo3cVe48UP8ltAA7GVfLkyCPZWFL
   kVeh8z/R0Zkggz7n0K9uAk/ku0gWQmPB+WPzkMOxRrBoB03e3jpPj9IAT
   k9w36QBB7enFo0N7MclvRRfNcVjK0nMjO3Pp1cgBYRr2hUfMd9fEaWD8/
   aKgH7zW1j1SXaba0/iYQ22gn16RRp0UXGzGiq9suSksvmwnhjtYn/U37d
   U7F3fGCW5BMCoDUA1xj3fnOVzJpvG0vFcFD11a5assaSlxlCg4I7eXVfy
   uoxB5lAF8VwZCAyQa4dDyuRBG8OmvAgsk7qYOsXIEvPhTXi3SlBNFlsmM
   Q==;
X-CSE-ConnectionGUID: Z44wamFaTX+87x5RAg6KcQ==
X-CSE-MsgGUID: CI0TwyCMSW+6uKWx1+8U3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39599710"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39599710"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:03 -0800
X-CSE-ConnectionGUID: K6nc5QcQSXiYTt2XdJuX+A==
X-CSE-MsgGUID: TxFOuydCRDyH9A6DioS8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115968401"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 05 Feb 2025 06:58:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CD62914E; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Frank Li <Frank.Li@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 4/4] dmaengine: Unify checks in dma_request_chan()
Date: Wed,  5 Feb 2025 16:57:12 +0200
Message-ID: <20250205145757.889247-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
References: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_065804_709157_E2B06B41 
X-CRM114-Status: GOOD (  12.72  )
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

Use dev_fwnode() to simplify the check logic for Device Tree and ACPI
in dma_request_chan().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dmaengine.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index dd4224d90f07..758fcd0546d8 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -40,6 +40,8 @@
 #include <linux/dmaengine.h>
 #include <linux/hardirq.h>
 #include <linux/spinlock.h>
+#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/percpu.h>
 #include <linux/rcupdate.h>
 #include <linux/mutex.h>
@@ -812,15 +814,13 @@ static const struct dma_slave_map *dma_filter_match(struct dma_device *device,
  */
 struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct dma_device *d, *_d;
 	struct dma_chan *chan = NULL;
 
-	/* If device-tree is present get slave info from here */
-	if (dev->of_node)
-		chan = of_dma_request_slave_channel(dev->of_node, name);
-
-	/* If device was enumerated by ACPI get slave info from here */
-	if (has_acpi_companion(dev) && !chan)
+	if (is_of_node(fwnode))
+		chan = of_dma_request_slave_channel(to_of_node(fwnode), name);
+	else if (is_acpi_device_node(fwnode))
 		chan = acpi_dma_request_slave_chan_by_name(dev, name);
 
 	if (PTR_ERR(chan) == -EPROBE_DEFER)
-- 
2.43.0.rc1.1336.g36b5255a03ac


