Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704A9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqsPDTRs3ZgLIOImegD1qLGa+76w0qmIGAK8IiimNkA=; b=a8zROAOt4vDtFVnIlzVFt77H/i
	3eiXa2xlkdd/JinmrUPaIcaCnRDA3h66VBR9xHKw21uSzOCNN+pSmydzUpDf4eIlRH7dLAK1jddOi
	Hga4brSnSCA+b8SEVkExPBfFA4vylfaRbpN88zMEKwSJfpUJZfMiV7vDNO04eafp/MqpKs9oEHe/4
	5tO2Mfkv5xPyc1TC3ISy2NCKVaWZ9TjD/ucVi4+7ASt6eQoqrUq7icvy/jtjd7eRmulE9e9vkdjw/
	w+DlOO8pDqhdL5BIzAB+StU5yVJ+VnfLHiw6CJyJkRfXgibZeSB7EKTKmB04UoVUYR8luWNywsUrh
	N5PhDfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6t-00000005qtz-1fYt;
	Tue, 15 Sep 2026 10:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6p-00000005qs3-2w9y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OqsPDTRs3ZgLIOImegD1qLGa+76w0qmIGAK8IiimNkA=; b=Ph3bIpzLPrwZ94UB2RNZp/dK0D
	OpdqZ9gGfVuJ6BkqRCDaad61l9iuYanx8eKYq2vfqVu8yPzFMnwPem0YNg61BoU24NT5vg1mETYMp
	Xk+tvMoy3ib3227Pv7JWMdiZeAthqujwCcUeRsbHVUJBWB9jxw6o88IJ6C4b7OV+426nPMJb8VsTQ
	gfGmSLoiZEhlCymNYXC6+jDLwjv1VCCs2CdR1YlzJqOM5E1/0hMv0z0gJYGP30n7q35Y+7K+Ck9mP
	BThh9ShFwkR5RwbALP9ZRAC+yfSYYLUEhShtRe6oTKiz3zlKiO7/StJ+N8Ea6oHkbZKNN8pNzzdh9
	Im4sKLGQ==;
Received: from mgamail.intel.com ([198.175.65.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Q6m-00000006X08-2E7a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466989; x=1821002989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XxzPfKb26yPDb3QB4Ys98nkLHzeVIxXPUdPsL4DGLI0=;
  b=NIDOauiTmTvYtGnt7kRkY6Q495i/xMwF9sg6C6nwlbX+byI5TxTS9BOi
   GjC9XuPqvu1k8V02Zw6RGDTgpXmVVOJdOul96uRYkvpQKGb4FAII7owI9
   IccVabbwcqcpbDLyUHLxxif9Q1KdHoHA9YPMJ6RwJbQIpxqKVqSMb1s6P
   lR2O/uZ8o1+pnSbZ2Z7k5262vfPE6amAucMm2jZyhNC6FkknoktwaOKZN
   kLJP77kIDzca+E6RurP0C528Wn3bPuZD1qBSMMWkpmKAfrpS0eEFW3T/d
   CArNxe6dvLPgYpWA5MGRYFhA+BajZoa8yCZzFrjhmJNzcpxlD3CT4bLFl
   g==;
X-CSE-ConnectionGUID: i8KHr5ZpT/++kaNJKof7RQ==
X-CSE-MsgGUID: YgUk9DEYTE+7aFrdkXRD2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93524813"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93524813"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:40 -0700
X-CSE-ConnectionGUID: nZRD54hqQCCBbziNJTgorA==
X-CSE-MsgGUID: MkB4LrVBQBerTakV6p2ZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269670280"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6990E9E; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 3/7] ASoC: soc-generic-dmaengine-pcm: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:24 +0200
Message-ID: <20260915100931.3593242-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110949_009367_0705035A 
X-CRM114-Status: GOOD (  12.38  )
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


