Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F731C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt6L3uvH9A57PRirqx3Jv0druz02+OMIZdsGOyesZzw=; b=U+PL/sT1ptZORA7OY0MiupcsD6
	wquZ91Aaa0jKU1a5x87tOSTQkUQ1FlgLBwAtFUkGpVw/OlxT0PO3hnBzRAOW+EIZRxoI0TvEpiXDI
	FEr4vCV6i+tDxz8qrmKItuu78fDqYTPbH0m50be7MZ3EHcpR640487FKLxbUNaobll2OymOlYeB0l
	cCtuQLs4wro4+YzQ6gzntQ92diqRwqdaQJROd5FC0Rm8AGsmpvBD8MkdwDIPVRu+7BooOmkaCeplS
	DAlKGPuPtwnpAaMhXWvE6lzW+nkAHO8hptx15u2avUSflHI03xTMGjhzuJPmERFNffCKLsXue/hUw
	2+e5itiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6u-00000005qva-0ZC0;
	Tue, 15 Sep 2026 10:09:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6s-00000005qt7-14Go
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Nt6L3uvH9A57PRirqx3Jv0druz02+OMIZdsGOyesZzw=; b=jyuxlrcKT5NHZh0Ez+V0JxIPkx
	TtcK3pBDEqYz6Y+CFWE5SWGUG3/5yFBa0hEeqTpJVirmfS9uPl9EaguiUfbPEqqfABYkBy87QtMSh
	mOpWZPt8X8E9Jev+78ziZrPOz1iLffcGI0yNSo9OptoPtD72GQ5fCqNd93R5g0zXm759J4pn3NV60
	0K3Vv5NGRi59JLqglOWhjAeXmmQnIzfxD3G+lbD5/CHhKd0EiwI7c3Pyu/3UzVWBlrPkkx+THyHn7
	37EBuIwxlwg8RLz0+kEzYIZQy7wgBp8GA/V6vmedc+iJ8nTjRs3ThputWJg+Oja5ZL+756H58gNuU
	t3YpDHdw==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Q6p-00000006X0i-08l8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466991; x=1821002991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XLzgAaMNDk785gOrzo3Jw9J0cT01zC/WwTUadr7d3+M=;
  b=bXSnvdcY0zP843VFaYwZeCZcY8or2VsvYtXe67j170T/Qa2MJkf8s+VW
   uIBcYrMhXg+n70k+5T+BaSTPVhOm9ClsFwiKqp3y7qMB7yUFnbKqdGvtU
   /ariHYsWTFQjqBu1RsBeNAIiMAtJSSubgasOkgTeMxE8CVK6GLmcOZqXr
   2HxXrYKZA7kTpy0nJu6mwtRh/qDEcpRMbWfZDqb9SQo4fMUzV8zCmIF3j
   9Ih55BvlDbFVUEL4shaDbgQmOGoIB4q8ExegRLpm1CkwHRSV/GBzHhEJt
   WK1uHeXYZhyu07/xlZR++usbP3IQgQDYwbfufWy5HNN3wKfaWf4ub+kBN
   Q==;
X-CSE-ConnectionGUID: ymhvx5X0R4uLMRFyLjMf9w==
X-CSE-MsgGUID: cGnni+YXR8KBwvdmqWeVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93649143"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93649143"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:43 -0700
X-CSE-ConnectionGUID: 94G8huAuS4W8E8rtBCaQHA==
X-CSE-MsgGUID: 5uCh+aTIQo2HoQ0Fyhoeuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296442482"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5F6509B; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
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
Subject: [PATCH v1 1/7] ASoC: stm32: spdifrx: Drop mention of the deprecated and unused call
Date: Tue, 15 Sep 2026 12:04:22 +0200
Message-ID: <20260915100931.3593242-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110951_472802_DC51B62E 
X-CRM114-Status: GOOD (  13.43  )
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

The error message was not updated while driver moved from the
deprecated dma_request_slave_channel() to the dma_request_chan().
Update the message by replacing it with the correct function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/stm/stm32_spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index e0fef47a227e..0ece54740773 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -400,7 +400,7 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
 	spdifrx->ctrl_chan = dma_request_chan(dev, "rx-ctrl");
 	if (IS_ERR(spdifrx->ctrl_chan))
 		return dev_err_probe(dev, PTR_ERR(spdifrx->ctrl_chan),
-				     "dma_request_slave_channel error\n");
+				     "dma_request_chan error\n");
 
 	spdifrx->dmab = devm_kzalloc(dev, sizeof(struct snd_dma_buffer),
 				     GFP_KERNEL);
-- 
2.50.1


