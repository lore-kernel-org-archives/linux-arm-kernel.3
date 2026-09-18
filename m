Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C833BC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xngq4QnkZ9SQriVo8X8dXEURA+Fnv00PqNye1+fCTv0=; b=SuUzDM6/oyFNgrRyQbTniPmiP3
	VVfukTRU+2wU2q0JpUIcqNrAVKbTlkP0G9zCo8/6FSE1zKNiXD4z5X8JJdRC2XB3UwkrdCe+4bUM6
	oHAOCdc02wCNulzB2ft6gOqbmFf7Yta+O7GepIr3V/BHjHkODZXk4TeqlICFIreyfu1TwHJK+2cDn
	Gr0AJ6Rz6lYCOsb6Yzmp/iMA/Qc1dFVcE4TFlP3ylQMEHXDM3UbhNE51EZq0Cj023EGUSMAzPiPcj
	axxe9AmxFqJ67F0GuLIb0E3fZWgyzlCiJm9I7pCE53KgE9oYBde0TLFJecsAs4ItWkZYykK21+KZp
	YIfmITUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wum-0000000EGGX-3EsW;
	Fri, 18 Sep 2026 11:38:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuW-0000000EG7b-3To4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731465; x=1821267465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5gUb+hVvLoFAVftWGRnnASwFC0wEvWCakupR8SXd3dg=;
  b=hRoWeqzn/XedhI855kx22z20fC5gNjTgZRmYToMAqt7A7R+CoqzlR0ck
   uKPfQmCD/bg6q4YsH3Bmn6O+SaKOHPxG2i81zBVkNnntlz5ydjODlVtpn
   GiMsYnjL4I6f6GBwRVCDfcBZVZdX48ttaCK0tGI1BsEBzPTf/2u+OmgQt
   IH4T/IyeUY7vHY5tVoTtrRaj2fjaTXXSmo3GiAj1xtTan+uE1NK2Kv9Bl
   ceWERgUQN2W94oez8qJimGxJwFh4uvKOLl6Q9+xd3T6MOAY5OF/5JNduf
   2YlzUXtr9IBglqmzFaRGSaOFvDJKpTi9V3TS5JZTLsJCkhi5r1f0c/F2V
   g==;
X-CSE-ConnectionGUID: fxEu2CL2Q56f9TiiiLpAyw==
X-CSE-MsgGUID: 3lRg3kVZTky/g9ZpSg6qWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739774"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739774"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:43 -0700
X-CSE-ConnectionGUID: MKVMvLwrQiuKI46WECtxaA==
X-CSE-MsgGUID: LBXUdJr7QP6V58c7vq4Yhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029226"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 72129A2; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 5/7] ASoC: fsl_asrc: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:09 +0200
Message-ID: <20260918113727.1898998-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043744_898924_7FABEAE0 
X-CRM114-Status: GOOD (  16.70  )
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
since the former is deprecated. With this, propagate all possible errors
to the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/fsl/fsl_asrc.c     |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c | 19 +++++++++++--------
 sound/soc/fsl/fsl_asrc_m2m.c | 15 +++++++++------
 sound/soc/fsl/fsl_easrc.c    |  2 +-
 4 files changed, 22 insertions(+), 16 deletions(-)

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
index 2f662bdf14d0..86489f70e262 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -136,8 +136,8 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
-	struct dma_chan *tmp_chan = NULL, *be_chan = NULL;
 	struct snd_soc_component *component_be = NULL;
+	struct dma_chan *tmp_chan, *be_chan = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct dma_slave_config config_fe = {}, config_be = {};
 	struct sdma_peripheral_config audio_config;
@@ -190,11 +190,12 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_params_fe->addr = asrc->paddr + asrc->get_fifo_addr(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
-	pair->dma_chan[!dir] = asrc->get_dma_channel(pair, !dir);
-	if (!pair->dma_chan[!dir]) {
+	tmp_chan = asrc->get_dma_channel(pair, !dir);
+	if (IS_ERR(tmp_chan)) {
 		dev_err(dev, "failed to request DMA channel\n");
-		return -EINVAL;
+		return PTR_ERR(tmp_chan);
 	}
+	pair->dma_chan[!dir] = tmp_chan;
 
 	ret = snd_dmaengine_pcm_prepare_slave_config(substream, params, &config_fe);
 	if (ret) {
@@ -223,6 +224,8 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		be_chan = pcm->chan[substream->stream];
 		tmp_chan = be_chan;
+	} else {
+		tmp_chan = NULL;
 	}
 	if (!tmp_chan) {
 		tmp_chan = dma_request_chan(dev_be, tx ? "tx" : "rx");
@@ -404,9 +407,9 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 
 	/* Request a dummy dma channel, which will be released later. */
 	tmp_chan = asrc->get_dma_channel(pair, dir);
-	if (!tmp_chan) {
+	ret = PTR_ERR_OR_ZERO(tmp_chan);
+	if (ret) {
 		dev_err(dev, "failed to get dma channel\n");
-		ret = -EINVAL;
 		goto dma_chan_err;
 	}
 
@@ -497,9 +500,9 @@ static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
 
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
index 4bc40f328f58..e7b91196d35b 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -466,6 +466,7 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	struct device *dev = &asrc->pdev->dev;
+	struct dma_chan *tmp_chan;
 	int ret;
 
 	exp_info_in.ops = &fsl_asrc_m2m_dma_buf_ops;
@@ -502,19 +503,21 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 	}
 
 	/* Request dma channels */
-	pair->dma_chan[IN] = asrc->get_dma_channel(pair, IN);
-	if (!pair->dma_chan[IN]) {
+	tmp_chan = asrc->get_dma_channel(pair, IN);
+	ret = PTR_ERR_OR_ZERO(tmp_chan);
+	if (ret) {
 		dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
-		ret = -EBUSY;
 		goto err_dma_channel_in;
 	}
+	pair->dma_chan[IN] = tmp_chan;
 
-	pair->dma_chan[OUT] = asrc->get_dma_channel(pair, OUT);
-	if (!pair->dma_chan[OUT]) {
+	tmp_chan = asrc->get_dma_channel(pair, OUT);
+	ret = PTR_ERR_OR_ZERO(tmp_chan);
+	if (ret) {
 		dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
-		ret = -EBUSY;
 		goto err_dma_channel_out;
 	}
+	pair->dma_chan[OUT] = tmp_chan;
 
 	return 0;
 
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


