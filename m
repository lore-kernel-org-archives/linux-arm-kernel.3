Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D07C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1vgpEyqoB5Yit/Cccb7tneqG7j1BMP/IM+pD573dhE=; b=PLuCrRHv4cqSFRofQrYIh60ZAE
	aQRY2zwBLeAYQL6OcuLuLr+tDpCdwbMyHwD+dYfptgQpo+zH/NF3Yi6lq3iDcx5LXCyUwbp5eJO2O
	pjHjWjwARSil210UCVRn/2+3/BXIKcc91sEWfW+8+fSt0YY/XZ2sqHB1GRb2DxXEzFH9LYRbPVtIK
	NB2RpjMfgd5W2o+h7Q1GV7HmO5/bP6cY5JIzEGQ7dG4DcvP/uomZVUkDv2/FcLqA//Ym5vlJkm6pd
	NssqCLMXaZ3184hZDWcIKumvGx/+jaK/H3OULT+25Iw/A97kem9Z8xqSkwxrXLq9nU7saYSABLDiy
	DBksLXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuY-0000000EG97-2JkX;
	Fri, 18 Sep 2026 11:37:46 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuV-0000000EG5g-23Lw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731463; x=1821267463;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3tCjl0Z1sktzbW2YwCZvEyafyorhC/cCFxIhMbEzRQg=;
  b=in7LvzyXtXo6ttb2pPlHMtL1NCca6Ixn/i9ETdxihO0Mf5iI6A6XYI+g
   rCWFJVIqF/JQ5XMkwQQ2Mywt/dSGYHdziB4IbADWFwNn2efF6FjPBwzX1
   DGYbr6RnAYcgLVcL4USrlZGS1WDVTUxI6HUMreakr4JROG7WNFc7QMx4Z
   Cg2l/0cCEGD1dnqjVmpnNVan5qe9sGi85pN+aSEw1MnWJLUKyqTQiXWzq
   L1g/F7XGeEfbtb+Sm/DDGkOjhY6rH3MIb7UVyVUGr39T8L45b1Tw2FlrF
   B1EfSVhUMPn9hEAWcGlGp6VpJTBgTB1csQ2PUWf1Ro7d0PzD4riiSGWrJ
   Q==;
X-CSE-ConnectionGUID: Rd4W2dMYRvOkEOCMejdpww==
X-CSE-MsgGUID: 5vBlEL+SS22kC5M1BX+rlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739739"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739739"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:41 -0700
X-CSE-ConnectionGUID: Jf/bNaFCTZSqe9QU4FSD7g==
X-CSE-MsgGUID: 1EkaHw41Qp2XYb8vIyZBcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029220"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:35 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5958099; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 0/7] ASoC et alia: Convert to use dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:04 +0200
Message-ID: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043743_585765_BFB95D47 
X-CRM114-Status: GOOD (  11.36  )
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

Convert the last users (mostly in ASoC) to use dma_request_chan() and
drop deprecated dma_request_slave_channel() completely.

I think the best is to allow Mark to take the whole lot and provide an
immutable tag or branch to others (DMAengine and GPIB).

Changelog v2:
- Add a comment that errors are now propagated to the caller (Frank)
- Make sure the error pointer is not dereferenced (Sashiko, Mark)
- Collected tags

v1: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>

Andy Shevchenko (7):
  ASoC: stm32: spdifrx: Drop mention of the deprecated and unused call
  ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
  ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel()
    by dma_request_chan()
  ASoC: pxa: Replace dma_request_slave_channel() by dma_request_chan()
  ASoC: fsl_asrc: Replace dma_request_slave_channel() by
    dma_request_chan()
  gpib: fmh_gpib: Replace dma_request_slave_channel() by
    dma_request_chan()
  dmaengine: Remove deprecated dma_request_slave_channel()

 drivers/gpib/fmh_gpib/fmh_gpib.c      | 10 +++++++---
 include/linux/dmaengine.h             |  9 ---------
 sound/soc/fsl/fsl_asrc.c              |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c          | 19 +++++++++++--------
 sound/soc/fsl/fsl_asrc_m2m.c          | 15 +++++++++------
 sound/soc/fsl/fsl_easrc.c             |  2 +-
 sound/soc/pxa/pxa2xx-pcm-lib.c        |  9 ++++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  8 +++++---
 sound/soc/sprd/sprd-pcm-compress.c    |  9 +++++----
 sound/soc/sprd/sprd-pcm-dma.c         |  9 +++++----
 sound/soc/stm/stm32_spdifrx.c         |  2 +-
 11 files changed, 51 insertions(+), 43 deletions(-)

-- 
2.50.1


