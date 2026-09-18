Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CE2C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCb774S6nPnlt27AN21fS7+AXM8jLF0u2+u/WwMLr+0=; b=z5lZgiILEdvN1cwet5jrp8bBfU
	FEG5Ev7I3677orZTs7zw9mLeCOzRM0Ihqt2suh8Ei1BqG21BomG/joZMfN8N+EM/NMzuVrgqRe+JQ
	5tugQilA3eIupVGnpDgeGbKWOGB+q2xVzvonX0uFz6LqWFhQKhsS9PNuuFb4j5PFtM0WwPb+x0krt
	e7qe465opD4Ei+4shfU7okA5iKbtUAnOqQOaJz2nHoGLA5v5eP8M8/LiHMfY0fCbzr6TEOoY2/oy4
	VGd79lo6oZ3f+o5G0xVqhuPzfMZgD4VIp1a+BdknC/HalaRR5p06k1SNVZqpe4mNN+ncFiwHvsoah
	UM5c+QMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuY-0000000EG8h-1dAt;
	Fri, 18 Sep 2026 11:37:46 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuT-0000000EG5g-0jAX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731461; x=1821267461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HBMn/5uoBJRDMKsyJnTaBaHBHzv4hmzBn/RwfpsTeuY=;
  b=hixdT9J0ebvY3QHvsaxGhMCm3XvWSJxpRVECgaDg8mDrvv3x4uY0aZzt
   LcFAlv0aDcNZ/P/9T9y//KVOg7GAieuxL9KIxLZQY0OBqCsD1xZdl4Iu0
   KvJ0V9+ac/uSGyDTMhthMNE0SFMMkHNjaL6b5zlVJEz4T/YPH93hT1p7K
   RZAigk7BbJ1g4JtZI3yukdyi5TnSfkkvHMs8pxvGwyC75dHfqB6w7O4iI
   r+/bJeugAvHFb3PDj+16VlwTwG2M87oP0cz+kdeHR1T5g0hw0dxvMslQ9
   TsDmYfNKWTUqZPwqurOFxJCAWmkawdyUscjxxnZRMLEF4oDSf4AkPZ/Li
   Q==;
X-CSE-ConnectionGUID: Hi90fMqZTv2bTjRdNlHPOg==
X-CSE-MsgGUID: tWrSfALbT5WMI139/Of9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739722"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:40 -0700
X-CSE-ConnectionGUID: ojMW1seUSfORwlkiKf3M8Q==
X-CSE-MsgGUID: knn7zAWeRM+3HtKgvEjlkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029239"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:34 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 67EEC9E; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/7] ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:07 +0200
Message-ID: <20260918113727.1898998-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043741_226596_E7DEB3CE 
X-CRM114-Status: GOOD (  12.28  )
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 65b7ec52a054..6d1dbee8f6c1 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -242,9 +242,11 @@ static int dmaengine_pcm_new(struct snd_soc_component *component,
 		if (!substream)
 			continue;
 
-		if (!pcm->chan[i] && config->chan_names[i])
-			pcm->chan[i] = dma_request_slave_channel(dev,
-				config->chan_names[i]);
+		if (!pcm->chan[i] && config->chan_names[i]) {
+			pcm->chan[i] = dma_request_chan(dev, config->chan_names[i]);
+			if (IS_ERR(pcm->chan[i]))
+				pcm->chan[i] = NULL;
+		}
 
 		if (!pcm->chan[i] && (pcm->flags & SND_DMAENGINE_PCM_FLAG_COMPAT)) {
 			pcm->chan[i] = dmaengine_pcm_compat_request_channel(
-- 
2.50.1


