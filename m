Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB262C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auhvNUtNhHzN8ivUnjTOLnzCC2fZ2k/foSyeLDAvO2o=; b=Jp8f+JE1M3MgRldC7L46r0w+sS
	KNxDxaHXZ/VJe2IUnz47Jui51I26aRbIRH5VDzbabrKLOUpBlmRb/bLiuVflCJZSs7WRxjX3LwQKL
	3dLbti2A5Tb+23UDqVJoZbnQ/68ak5qmRdorrQwRQyD5WV8OgmLERU1plGG5sPNE48PuRKcR+Ghj4
	mWws8ZS7ls+OwutqUpCy3SrjIHrMi5mFFcJRHr3+uba4FzcCwjWRe9P8fDCKXlTvP7DcFs2FNssXU
	ZocydkipZNpVgqi/SCsYH7Eng/MuvpjRDwEUpkPe6AW9TmUErVnD6zXPeZRsG53LlZQio+EyMzhob
	7LqcO2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wun-0000000EGHA-03bR;
	Fri, 18 Sep 2026 11:38:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wub-0000000EGBR-3O78
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 11:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=auhvNUtNhHzN8ivUnjTOLnzCC2fZ2k/foSyeLDAvO2o=; b=e9Xi02aDJErf4OOiwgI0eEPmpc
	mEWTCwAeC0AUyH+XLH4+vhx9VvgCqnslQj4KW0Jy8gVJh288q/baOGyy7KGfTPMyXW1XUoWpAkUwP
	Y6jS/lSBNCCWaCHzLQsMPpQ1ji/UnbT30C4ZbvLMLzAGd47RqaCD/jR8bG5PHieBXJ97dgN0emiwk
	7bVlMQzGAKOozkTBa+ZBzqjaOKVvLX6jxnvuqTBisdFC3AY3YUriQ/KWCVDmihEUEKex1uw9g+quQ
	eg/J/QnviXerzHBLBPsDbPOAyvQJCMIcpxxk3LdGL/zlIVbH9xRQlqdG1q8TPICnpdMk29R3F3XnG
	3oxPmnTw==;
Received: from mgamail.intel.com ([192.198.163.18])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7WuY-0000000A0Zo-1ywa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731467; x=1821267467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iHSC1nNEnhUx/XbEolv5AtLHIEcgA20Dn5X1VVvaZ8M=;
  b=fN47e1V437UZCSRImFORU2r3vCzxAh8pn/hJexiuRfsW9pyD3Fy2O6lH
   QU12gzWBJedC+K0H/KD20tC9cM8xvji+GOxgV2de0WoS6O5BnbUpSWHed
   AZXxBFc7C6rE37jNVFfI87BEs+4DYyse5+2bZ7PhSyZom+mo6c8COH7ID
   /mLvR9aTnaqbERfb9Wc6r502ybQGGDVlHZhIxmKmQ5wytK/WAsQiExvVR
   cA9nAhZTjE5O5uyXB2Ty+bZAVAlYQ1MztjofPiKw+00DZt8lREdfS7SfD
   c6s3PI0H6snpCMl3kW3V+zBiNfE0LfA8WX3uD6x+QpbCBBUM53ipkASxm
   A==;
X-CSE-ConnectionGUID: tPMf1XOdSHmBYI4tt1Ur7w==
X-CSE-MsgGUID: PKH+jhTgTaGcqtKEE0JyTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367465"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367465"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:41 -0700
X-CSE-ConnectionGUID: vwoX+4jyTkKozcevs1734A==
X-CSE-MsgGUID: P5cUJ9SJT2GCeaMH1c7Yjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783683"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6CEB5A1; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 4/7] ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:08 +0200
Message-ID: <20260918113727.1898998-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_123747_094882_88FBCFD3 
X-CRM114-Status: GOOD (  12.78  )
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
 sound/soc/pxa/pxa2xx-pcm-lib.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-pcm-lib.c b/sound/soc/pxa/pxa2xx-pcm-lib.c
index 88a9d3226302..4b5b07f0c444 100644
--- a/sound/soc/pxa/pxa2xx-pcm-lib.c
+++ b/sound/soc/pxa/pxa2xx-pcm-lib.c
@@ -79,6 +79,7 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_params;
+	struct dma_chan *chan;
 	int ret;
 
 	runtime->hw = pxa2xx_pcm_hardware;
@@ -107,9 +108,11 @@ static int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
-	return snd_dmaengine_pcm_open(
-		substream, dma_request_slave_channel(snd_soc_rtd_to_cpu(rtd, 0)->dev,
-						     dma_params->chan_name));
+	chan = dma_request_chan(snd_soc_rtd_to_cpu(rtd, 0)->dev, dma_params->chan_name);
+	if (IS_ERR(chan))
+		return -ENXIO;
+
+	return snd_dmaengine_pcm_open(substream, chan);
 }
 
 static int pxa2xx_pcm_close(struct snd_pcm_substream *substream)
-- 
2.50.1


