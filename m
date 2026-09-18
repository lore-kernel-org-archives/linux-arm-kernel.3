Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBFEC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt6L3uvH9A57PRirqx3Jv0druz02+OMIZdsGOyesZzw=; b=KZwSGBh4V99J6M+IkHIx8jQVBw
	yihIKk329WHKtDsURGem8ATDOSdyGwvN0uK0yx/YNMaGYntjFNcdj8j+wdlUXhFOWff/YfQOAKsru
	Mbpfv/FMaTzfdXpzhcT0mzHDyA6hRC+dAeQ7Wlbi5RWiYi65ARuIQDZ4GM0aNPwvU4iDaZYdSKyPn
	Ty8a7pUMp9EFacQoXNRmXRLbTF6dvsisj9ZDa2EReUVqhihWSP8AciQauj3Rh5FdUt0OBKNPUvEH3
	mdvqxtyNSknBIsbLSk2k0LwDttJOsQIDPZvTWTdv+1ly9DjZumc5FEva2l8O3yso4PhBLfrmVVTif
	HYFtgNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuY-0000000EG8P-1Ayh;
	Fri, 18 Sep 2026 11:37:46 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuT-0000000EG4T-1LHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731461; x=1821267461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XLzgAaMNDk785gOrzo3Jw9J0cT01zC/WwTUadr7d3+M=;
  b=kepbKFMDTB0wHDtsFq9vpavfSvmvd8HoNqpwrh9LesnMk0m33EYG4OmV
   6dmYivFUtvl6lbPMJfUvd7iF5VorTdFOXmL8rdeU6KMCV2KiSyXt7LgGm
   adVPQasRD6U3XII5qP/zDvFF7DtstGgvIbNFohpTtWD72X0V5TkB8nhqV
   AXFVfMnGH9molWq/Xa3zpdZXglodr44omrzN2O8TPElMuHeWtYaDVwTos
   ll8iEqEeYaL71+LtxcVwPKyPIEPmonCiJKp8pia3ZfQ7S13dBCctCPnrL
   sXLSPkYbPjHX00mHr85Vxx6kD+pIp6v3sNnjBqMvGL9pVZMEKfmFYHtbN
   g==;
X-CSE-ConnectionGUID: jgbTZspbRn22FVec5iVxRg==
X-CSE-MsgGUID: yTGmoFeVTi21K2YLFKBQSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="89367453"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="89367453"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:41 -0700
X-CSE-ConnectionGUID: StlknkQKRBWNDpL5Ln95KQ==
X-CSE-MsgGUID: 9pOIgltNRyOJG64WTtDAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="2783682"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 04:37:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5D2009B; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 1/7] ASoC: stm32: spdifrx: Drop mention of the deprecated and unused call
Date: Fri, 18 Sep 2026 13:34:05 +0200
Message-ID: <20260918113727.1898998-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043741_378290_11FF4FE6 
X-CRM114-Status: GOOD (  13.42  )
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


