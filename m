Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1865C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KsdukRpL6sakIWtrVDGHhPDBcwJ9oEKV+9OztPr5qo=; b=Q9mXUI3BxCi5WSKMo5oYcrqsNJ
	AvWVbWTf59RGGMZJYSaTReV8BeebMFrzYeSI5DgwAE61x2zEGQk/7EzEAa9ZqEbeA8X7rLru93Lqp
	08+ZK1MoRektlD1h+h1ZNYp4RNzeNypv3uT49UiG5YgqEAjcLBxqign5MWHL0Z9tkHjn7LU+qAtr6
	2jvNN3drs3LpjHQ2KVLXnPRrxnxfHcRwd/LR2DqGVS2VFf3Cizc8pDF0VPCdSOKirh2mIYge3SSQo
	pJDMoD/Hs8eCq/RykW9x7cPTlJCq+M60PmIg1fz+riurIsBaEULORGQEViLD+rHq348Q/JmDwQ6OA
	fcl50JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wum-0000000EGGp-3dbd;
	Fri, 18 Sep 2026 11:38:00 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuZ-0000000EG4T-2K8b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731468; x=1821267468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YSI2Kqp03uJdGsxs/TigJRkMGLCix8Ae7tfRm9DSN0Q=;
  b=XSoyhKCxlT4qlU2WlMAFPZWZMuy9FQOcelCbE5cfrGE/ddhHFY5Xlt0s
   UPOHwW9YJLIIovuU+uqlV7OZSNirMR5x2UKO+SPp3kFCLA2b2mv/VQ/dY
   zs9UCxg17YaraYBt02moFt1T/ZRsrP2dRY9g4DxMw0BQOHts3fVRAaDEP
   9HM5JM7fkBVUa4R+EVdyDq9g6KCE8UqFG6DvjlsNNR894GVlLZdbT3wBg
   0CzzvR+g3+1BMOhaLB+XQbzY2/pQKLhhVhGEGQEZ1aVBSonIIYD2WtYTk
   HVE9wUycqJGkHTOTFMevecp89eli4745p4YFcSutbzOKAh/PN89f8sw8U
   A==;
X-CSE-ConnectionGUID: 1WtAttqjSLG8uv0eQpGHVg==
X-CSE-MsgGUID: HyQleuMgTiSuuD7PZquAQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367491"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367491"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:47 -0700
X-CSE-ConnectionGUID: c6DS/Y6KQE6nNfenLUwhZQ==
X-CSE-MsgGUID: dSLxz0Y6Sn2i5TM1ASrqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783722"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7BEA3A5; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v2 7/7] dmaengine: Remove deprecated dma_request_slave_channel()
Date: Fri, 18 Sep 2026 13:34:11 +0200
Message-ID: <20260918113727.1898998-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043747_601636_1A370B1A 
X-CRM114-Status: UNSURE (   9.45  )
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

No more users.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/dmaengine.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index c3a49a33307c..1b57bc4a7e72 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1768,15 +1768,6 @@ void dma_run_dependencies(struct dma_async_tx_descriptor *tx);
 #define dma_request_channel(mask, x, y) \
 	__dma_request_channel(&(mask), x, y, NULL)
 
-/* Deprecated, please use dma_request_chan() directly */
-static inline struct dma_chan * __deprecated
-dma_request_slave_channel(struct device *dev, const char *name)
-{
-	struct dma_chan *ch = dma_request_chan(dev, name);
-
-	return IS_ERR(ch) ? NULL : ch;
-}
-
 static inline struct dma_chan
 *dma_request_slave_channel_compat(const dma_cap_mask_t mask,
 				  dma_filter_fn fn, void *fn_param,
-- 
2.50.1


