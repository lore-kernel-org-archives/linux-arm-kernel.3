Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA485C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPo7yuMQUseeUfF5xw8F+I5twxmXEKkNF8gXD40MNsk=; b=k2gWX9efwhPVfhX/pbPJL2aJxP
	iHbeYYPgRPQ1NZtMiHQLspSKC6jSB28HNs4XYhpt+TNGq5gm6cmXh2wFhVZSZn1QD3Z6NLda4b10K
	YNgMUjOig4HiJhAdtJPPpKV8lGj6z40Z/1cbQTVhnuH1Sv4qeanPatKZdbFzLxLxYYbjViKlxHbUP
	HpXZgdLXvBlbUQ3OvSjpqOtyhUVaMGj4Oh/8Q/XY3oC10rVAQYwI2UyZXrzy48qvt9cin+gZsYXO8
	OSKXrWUcCsgUlsMY8VV2RAfyR1OzlUxmrBGTYfshuBsex+GyCaCjr0LqiLidpPieXcgUFaPboDfCL
	srqA5ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgxY-00000003h6I-3LJO;
	Wed, 05 Feb 2025 15:05:01 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgqt-00000003g7p-42Yi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767488; x=1770303488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M41KJpPTgtZC1kvfB0ok8XtGl6qr+rtNSYSFho5CTIc=;
  b=kk6Pckv6b3RqAkWvwZ6m1bhjBY65OCQIXDkhumiC4L9FZRuUVpFr0dBu
   sjrCA8j9LvtJdugxjZeb9q/Ewp8Hr1JH2vBCF2KB2uO77U+QjvXxx1LYQ
   xIh8hQQHesMZaKH54n0YrGAJOah0ryPumwFCisGjvSMiy+6TR9+bZsS4H
   PemQtn6kzehwFACz11ib5TzVZzcfLpz4hnUqC0n4PwCv/UObJeo9lOxiQ
   mm3utZVMCVvbe7MI1c3+rKSPjohdjEoWxNLjtblUNTSydczV7ZbelTno9
   X14z8NWWVl891k0O9yWXzcn1cMc0bJ7tnR6IoejAGZMbNzDU8WAh+eOK2
   Q==;
X-CSE-ConnectionGUID: zQ66mwbbQriU/UBaUiTqzQ==
X-CSE-MsgGUID: 6i2s/OaGTea6QRKufeI4KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39232359"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39232359"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:04 -0800
X-CSE-ConnectionGUID: +/C1jtaVQV+6by6EwWF+9w==
X-CSE-MsgGUID: hG1snVx5SUO/cR2QZ8CmNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111806975"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 06:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C7EE5164; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
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
Subject: [PATCH v3 3/4] dmaengine: Add a comment on why it's okay when kasprintf() fails
Date: Wed,  5 Feb 2025 16:57:11 +0200
Message-ID: <20250205145757.889247-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
References: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_065808_047461_2F25F529 
X-CRM114-Status: GOOD (  10.54  )
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

Add a comment in dma_request_chan() to clarify kasprintf() missing return
value check and it is correct functionality.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dmaengine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index c1357d7f3dc6..dd4224d90f07 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -854,8 +854,8 @@ struct dma_chan *dma_request_chan(struct device *dev, const char *name)
 
 found:
 #ifdef CONFIG_DEBUG_FS
-	chan->dbg_client_name = kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev),
-					  name);
+	chan->dbg_client_name = kasprintf(GFP_KERNEL, "%s:%s", dev_name(dev), name);
+	/* No functional issue if it fails, users are supposed to test before use */
 #endif
 
 	chan->name = kasprintf(GFP_KERNEL, "dma:%s", name);
-- 
2.43.0.rc1.1336.g36b5255a03ac


