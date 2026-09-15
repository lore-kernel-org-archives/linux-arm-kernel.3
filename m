Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D29C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1s6meXsRDcAiElrJnxb7p0En8b2xo3FlUs+u4S3pZb4=; b=HCxpyzqPOAZzEGFd333nM+kv/J
	97Htbgfv6kUPf5hVmGWSDPw2mxxaJ1evfu6rvXUX4pZ1aVOXRFgOb4InHORKMI6NlLCj9j/KDmxYG
	RQbaQ74sMhN4F7k+Y4gV8T8rHIzNQqQSa/pmIDaNldL6NSPo6xTCe/zUswusIM8HYmVZ1c8wkYc6b
	xeoNCS1vOdsasElUPXhe+LUDNrdAXc+qiV1RdqYV4yXkMTTV248dW4au01z+qLqKUD/43jV1cxhpJ
	5nbqbTHbZwxqcShJH8Um1rGgKS9jUgeOqJ1rADj7ABsewA89nu9owibbcuvziM2hL6l+22xng0BOs
	oIMbFoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6t-00000005quC-2NzX;
	Tue, 15 Sep 2026 10:09:55 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6p-00000005qs0-0g6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466991; x=1821002991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D1bk2913pdN2XTk5dYfDZD30b03Yi/im1ni4fvAIaRg=;
  b=JELXYS+0oI+xqFgBRimWogTg92HUCU5jB3YvJMMDtASMiAGXAeF/7Xt1
   7oyyl961nsm6gpWmM51POlD4ZSyLL36M0+sUUvno032oQ+lcCnj2qAgbf
   52LEYENnNEn8uLMTjHM2IIsJxp4wA8TpjOxPjzWv2HG9YfhERmiUB1X8G
   /PWCiJMtS9vnyVkqC5tj776l6ewNNCFeBQZF96OxwYDqqOkEgcGm9zprz
   7EVuupfPJ/pA5UGAEckXgGth6sj4Zac2VZmgXrO3EWPt7FNANS9RW92r2
   /pAb5h49bh5CLcoPo37pOF1DjiH0vbWW6a0/B2SFVjW4BCjzRAHQTkLHH
   A==;
X-CSE-ConnectionGUID: /bsmzn1ETsebdUJda9mSvw==
X-CSE-MsgGUID: Pgeie+m0TGuHtjf3fl1aqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93649189"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93649189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:47 -0700
X-CSE-ConnectionGUID: 2n8xZtl4QHaOyEk6gsbb5Q==
X-CSE-MsgGUID: zwriBC04QHyA/SUGdRggxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296442788"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 03:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 73190A2; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 5/7] ASoC: fsl_asrc: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:26 +0200
Message-ID: <20260915100931.3593242-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_030951_216398_D6801398 
X-CRM114-Status: GOOD (  14.93  )
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
 sound/soc/fsl/fsl_asrc.c     |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c | 13 +++++++------
 sound/soc/fsl/fsl_asrc_m2m.c |  8 ++++----
 sound/soc/fsl/fsl_easrc.c    |  2 +-
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index b24737add001..ae682bf450f6 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -638,7 +638,7 @@ static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
 
 	sprintf(name, "%cx%c", dir == IN ? 'r' : 't', index + 'a');
 
-	return dma_request_slave_channel(&asrc->pdev->dev, name);
+	return dma_request_chan(&asrc->pdev->dev, name);
 }
 
 static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 2f662bdf14d0..5cd12781c604 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -191,9 +191,10 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
 	pair->dma_chan[!dir] = asrc->get_dma_channel(pair, !dir);
-	if (!pair->dma_chan[!dir]) {
+	ret = PTR_ERR_OR_ZERO(pair->dma_chan[!dir]);
+	if (ret) {
 		dev_err(dev, "failed to request DMA channel\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	ret = snd_dmaengine_pcm_prepare_slave_config(substream, params, &config_fe);
@@ -404,9 +405,9 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 
 	/* Request a dummy dma channel, which will be released later. */
 	tmp_chan = asrc->get_dma_channel(pair, dir);
-	if (!tmp_chan) {
+	ret = PTR_ERR_OR_ZERO(tmp_chan);
+	if (ret) {
 		dev_err(dev, "failed to get dma channel\n");
-		ret = -EINVAL;
 		goto dma_chan_err;
 	}
 
@@ -497,9 +498,9 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 
 	/* Request a dma channel, which will be released later. */
 	chan = asrc->get_dma_channel(pair, IN);
-	if (!chan) {
+	ret = PTR_ERR_OR_ZERO(chan);
+	if (ret) {
 		dev_err(dev, "failed to get dma channel\n");
-		ret = -EINVAL;
 		goto dma_chan_err;
 	}
 
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 4bc40f328f58..e440cc083ebb 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -503,16 +503,16 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 
 	/* Request dma channels */
 	pair->dma_chan[IN] = asrc->get_dma_channel(pair, IN);
-	if (!pair->dma_chan[IN]) {
+	ret = PTR_ERR_OR_ZERO(pair->dma_chan[IN]);
+	if (ret) {
 		dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
-		ret = -EBUSY;
 		goto err_dma_channel_in;
 	}
 
 	pair->dma_chan[OUT] = asrc->get_dma_channel(pair, OUT);
-	if (!pair->dma_chan[OUT]) {
+	ret = PTR_ERR_OR_ZERO(pair->dma_chan[OUT]);
+	if (ret) {
 		dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
-		ret = -EBUSY;
 		goto err_dma_channel_out;
 	}
 
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index aced16d1228a..d30cc3e90215 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1433,7 +1433,7 @@ static struct dma_chan *fsl_easrc_get_dma_channel(struct fsl_asrc_pair *ctx,
 	/* Example of dma name: ctx0_rx */
 	sprintf(name, "ctx%c_%cx", index + '0', dir == IN ? 'r' : 't');
 
-	return dma_request_slave_channel(&easrc->pdev->dev, name);
+	return dma_request_chan(&easrc->pdev->dev, name);
 };
 
 static const unsigned int easrc_rates[] = {
-- 
2.50.1


