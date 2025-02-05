Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B013C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6z/JXAGt2FXgiGe8/akTm//4xUh6kUJF+WrzkEi6SM=; b=1Bm1WA+ZCOFfRlV0JsJMcYeYG7
	zUW6xpCbqwSovXqyuKyixEgaI9fvtSxazWT9ufpTXenBzL2EI85vOSSorNvSSlXI65ildITbBNstD
	xRDMq1BDNQSl5WT00JlW/PEXN4CAw+XHk+zQzIFwUElp4G8C9rMc+qfHaKTfZMbBn2j7Ls+FKCHzT
	IthAUWT2VhHorE9HInYepwoFmQ+dB139FKlTDLfx3gfn+Hzv4Aah7ZClXgytCn7PU5f4wePtUg4aN
	eZILpmwkmMs8sO6LzFfX0Z1Li5blQWT3jg3JX5ZpK3VmbvGe1zREC84fYPMD7qd9a/aakPRYlDxsr
	jvHIbEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgwD-00000003gtk-3fvq;
	Wed, 05 Feb 2025 15:03:37 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgqt-00000003g7D-3LaB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 14:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738767488; x=1770303488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uvnNcC/P2j4xylOfl/Tcg9K+1wXoPmdsdMK/xVegdEE=;
  b=kNBcJolPBfewbDDOECnC/GQ6XBdk0uyBFeTyIQKo8pKFzBPXCsof5DPp
   Tn+MlKke1KBR3Xziov0nJlunC4HEZpOnsUSJx+SMDkSJi/e/uNmzidZd/
   HWXQn0VAJtXetzXWLsYFLWQxzPkix9DXL4DvlbE1nSzAabWpolEMR2zda
   MaRH7dinwE3RXsw9vCLB8IQxdMqHfffF7i1mWmocaLpGh7nu0wQG/XwEg
   fJq5XHPq+tRFDpn43KKcrLTByQU51MEtKFFw9iCxPxvgPp62mXzE6AXey
   pHUDoU5bf0qm/62MynYAQd2u90qedkOP0vcNKcxCnorjg1BISFuMR4as2
   Q==;
X-CSE-ConnectionGUID: QHf6D5U0QtiIdhz9i98t8Q==
X-CSE-MsgGUID: RrbOEji5RuGtCfCUx8WUmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39232349"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39232349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:58:04 -0800
X-CSE-ConnectionGUID: ve7rhMT8RhOcIscPbAcCeQ==
X-CSE-MsgGUID: 4IezkWDmRTGdOzeqUX5fIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111806976"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 06:58:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AE98D10A; Wed, 05 Feb 2025 16:57:58 +0200 (EET)
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
Subject: [PATCH v3 1/4] dmaengine: Replace dma_request_slave_channel() by dma_request_chan()
Date: Wed,  5 Feb 2025 16:57:09 +0200
Message-ID: <20250205145757.889247-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
References: <20250205145757.889247-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_065807_876377_0403C279 
X-CRM114-Status: GOOD (  12.30  )
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

Replace dma_request_slave_channel() by dma_request_chan() as suggested
since the former is deprecated.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/imx-sdma.c    | 5 ++---
 include/linux/dmaengine.h | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 3449006cd14b..02a85d6f1bea 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -1459,9 +1459,8 @@ static int sdma_alloc_chan_resources(struct dma_chan *chan)
 	 * dmatest, thus create 'struct imx_dma_data mem_data' for this case.
 	 * Please note in any other slave case, you have to setup chan->private
 	 * with 'struct imx_dma_data' in your own filter function if you want to
-	 * request dma channel by dma_request_channel() rather than
-	 * dma_request_slave_channel(). Othwise, 'MEMCPY in case?' will appear
-	 * to warn you to correct your filter function.
+	 * request DMA channel by dma_request_channel(), otherwise, 'MEMCPY in
+	 * case?' will appear to warn you to correct your filter function.
 	 */
 	if (!data) {
 		dev_dbg(sdmac->sdma->dev, "MEMCPY in case?\n");
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 346251bf1026..83cbf7197a76 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1639,8 +1639,8 @@ static inline struct dma_chan
 {
 	struct dma_chan *chan;
 
-	chan = dma_request_slave_channel(dev, name);
-	if (chan)
+	chan = dma_request_chan(dev, name);
+	if (!IS_ERR(chan))
 		return chan;
 
 	if (!fn || !fn_param)
-- 
2.43.0.rc1.1336.g36b5255a03ac


