Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763A3C982C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qQqM77rtghvgKu6YabCwwuVBNYl794CidFfVv4BKvYw=; b=txIltz5WN6OhwBDsIMLwcj5MDk
	sDS5ar9hm/QJrklOW42fx9jBigNlev6TRdotJdlWhuHTT3ZWg/vffVuYv9vJuM4IFwzIiK4xD1frx
	tU0lRhQu0LNX8sjRAuHSpKIW8rVRUoeXJ+pVp9SXA1gaegtahMu2XQfCKtS8jjuBSW+/wmAZSkUgc
	YSnIb0LUjF3yKAD48z9/bbrci6SIQpDHS72pk9c5DhnyRR0+xoM1yVi4RTWv45nOVpDZSJ/7iFl5M
	dJo0rUA4GZWmGLakxInukgEB64KL1FFQuvbT1XlId+g9uUef7ZesAvyUNdrEr4FDQKqdcyC9Dme6a
	yKH3vdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6t-00000005qub-2nIc;
	Tue, 15 Sep 2026 10:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6q-00000005qsk-44zR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qQqM77rtghvgKu6YabCwwuVBNYl794CidFfVv4BKvYw=; b=GOYwaMtfOlXEapBcsvfAqG9NRq
	hexza0aZmiNZAYHVpG1sUmrPjBUJebjzT4orJjj+QUjs2ASAAcCcBGpqG879M5k+8GlI9tTkxAOW/
	nde0mGya4+c8RRnyKUuEAPnHqNihXszy+dLhSEpXIHErPObCb+PbDUO9+lPEtNrIDJD+3Sd70AOcE
	HX1xA3fIqcekEO29AzX3821gxJGfj55cQeisEAEfL9xhLRWfO+cdnvDQhNaCncxySA347R/AbfVHm
	PYEl+EFyC3K8kQk6y2TfW/yCiymf0pzz0Rj75jLUHmswah/wWLBqO+h7cgrm8aHERzPr3ZFiUHSKr
	CnNYCSnw==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Q6n-00000006X0u-3AXX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466990; x=1821002990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W9AeHQQ9O7vDh1ohv/edIAywDUCEHTQoqqfoGL/kpls=;
  b=lfmZJl7hkjZnjOnSQtUNjU6BPiRnvwPY+p/lVW5ThOnHLJ43lL5R5BjC
   BZEmoJXM0gx6fFxdwEXlPIOsLv1V1JkhVo1yhoC1mrUuaB4Ohdqr8+VdY
   GR4cyhkj33C+N7PtIwYpq8GHYSnlaXnavLxgQRq/PCwditockVxpB01vg
   Qbb6ES8PYui1DmACFqd0Tg++nbIBmUOVdBk+y/QXcEw8qfhobgLaFEFN2
   IIWH5YBcarA2SLECr3P8lrtZ1iyDIqVPKFHkl7WqDBoiu+O4y8eTYMC7R
   4ob4B9K/TbPwUN+FEUc4KEFlEvVzrmL+GkYPIPjf9gPDyXqS+zpjP2psX
   Q==;
X-CSE-ConnectionGUID: dWXVACB0RnGW8TMyp+Tlhg==
X-CSE-MsgGUID: xKk9Qp+mQdirr12ObKVkbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93524825"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93524825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:41 -0700
X-CSE-ConnectionGUID: K1NmNoVzTm+8qhwkZ/RYog==
X-CSE-MsgGUID: zb6nhcKYRhehd3UVzZyxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269670283"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5BF7799; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 0/7] ASoC et alia: Convert to use dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:21 +0200
Message-ID: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110950_337476_48CFFC05 
X-CRM114-Status: GOOD (  11.11  )
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

 drivers/gpib/fmh_gpib/fmh_gpib.c      |  7 ++++---
 include/linux/dmaengine.h             |  9 ---------
 sound/soc/fsl/fsl_asrc.c              |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c          | 13 +++++++------
 sound/soc/fsl/fsl_asrc_m2m.c          |  8 ++++----
 sound/soc/fsl/fsl_easrc.c             |  2 +-
 sound/soc/pxa/pxa2xx-pcm-lib.c        | 10 +++++++---
 sound/soc/soc-generic-dmaengine-pcm.c |  8 +++++---
 sound/soc/sprd/sprd-pcm-compress.c    |  7 +++----
 sound/soc/sprd/sprd-pcm-dma.c         |  7 +++----
 sound/soc/stm/stm32_spdifrx.c         |  2 +-
 11 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.50.1


