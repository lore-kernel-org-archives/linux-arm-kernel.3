Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D45C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOLdmoMA90ePHrObFN66+cI371ZUZG8vr9aDokr1vns=; b=q8Lc1WYsN0EACZOumldCZkGJqe
	1n/QvGBJRKbHpaMllVYGvxHGEgUxgm3lxfJrFaP/3/C+GLw8fxNi1/O/vCwFcluasqQawH7nGcNaT
	zbvTaCLf6q6mOla3u/oVhdewVXY2Vbkr19LKS9iwUfj1McDhBFGHShc2AX/FZVk30oqLFtUnZAO9M
	+Ep6dc6SnPYRFonkqESO1z3QHki7WQptufMzHqWUTCvVad5OBLjOFfa2iQGslqOICHVKw0bZHnEG5
	uG7ic3MHArK33h0BgX5fUluP8xBXWFVRhVs22e7vxVLxpHSOu9ctnGzLTrljpMyXVLF4fNH3het1S
	IlDUK5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6t-00000005qtm-1Akb;
	Tue, 15 Sep 2026 10:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6p-00000005qs1-2Fy8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DOLdmoMA90ePHrObFN66+cI371ZUZG8vr9aDokr1vns=; b=EcttGpDLqDzKeq6zGk6D1AABeu
	7c3JOEpd6CPyMvrFdpxkQArD4XuH3Duz/IMEZT8m3s9R368/YO7oXCt9c3qsLIbFk25pO9a35YQWX
	LEn1S02/CaLNNV2W81724Sj4A4AUqmHnSGGNC2cgyqSwjPw2T/Z8/rTqXkpx4ORn9fjJv5nShDlZK
	YWr8ZJhEkvpjb7zBO1e1NokXEehZTPc5S1AqUtD/ZY/wtHNORG2i107AHqmJSKCb8ihQxAN7FHcxh
	6cTLtHKLQAVlNLFW+BvKB3ev2vGW6YtFCNwsdE28/nMwyfjoaLRmG+itD0+jA9SaoHet27cOBOiCK
	CNe7u6hA==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Q6m-00000006X0i-1cys
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466989; x=1821002989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w2DAbC3uMPgmhkJrhUyn5lKx37XxWntjSija75HyW4U=;
  b=YQ78NQWXmaXuJ2zM0B1y2uf+Bldmd9carafWXgXiN9+iyXCXKClSi05x
   VHYqa3OAXyJRnORt0HeZXEOyhR01jSJg5WrcMGV0yobW3q2UT0mvKx8qB
   +NwTzLIwlrHjZGq+i71luHRAoM4H82qhG/HU9naDNhOnBhr/52I9b3EKl
   MBpNsXEkd/DAD6P5viewGCXTF3o36r8KGUVSdDjhLfMQe5yMkzqzElSpp
   GJFlv5VY/X2H95lHOgCbpHdxrz6PvgGXSQxcgCzhOgYx6C10vxrf0Z5wk
   3RtRbKKRwsvDJ4OKMV+ksVry+RAtB6ZBTkGoR5KJmwPMIp7zJ8JLrJTdE
   g==;
X-CSE-ConnectionGUID: +RsInDorTOSXjWAgwjcVsw==
X-CSE-MsgGUID: vxMQqQHvRLuZasNsAg/5pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93649157"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93649157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:43 -0700
X-CSE-ConnectionGUID: aMDeGoWGStOWi0L2fcNgqQ==
X-CSE-MsgGUID: AzomspuhSQKxEu/pCuSgJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296442487"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 15 Sep 2026 03:09:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6438C9D; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 2/7] ASoC: sprd: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:23 +0200
Message-ID: <20260915100931.3593242-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110948_811686_40B5E578 
X-CRM114-Status: GOOD (  13.40  )
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
 sound/soc/sprd/sprd-pcm-compress.c | 7 +++----
 sound/soc/sprd/sprd-pcm-dma.c      | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index e5249924b54d..5613c25fffd7 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -153,11 +153,10 @@ static int sprd_platform_compr_dma_config(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	dma->chan = dma_request_slave_channel(dev,
-					      dma_params->chan_name[channel]);
-	if (!dma->chan) {
+	dma->chan = dma_request_chan(dev, dma_params->chan_name[channel]);
+	if (IS_ERR(dma->chan)) {
 		dev_err(dev, "failed to request dma channel\n");
-		return -ENODEV;
+		return PTR_ERR(dma->chan);
 	}
 
 	sgt = sg = kzalloc_objs(*sg, sg_num);
diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index f509a4601de2..1586eff61120 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -171,13 +171,12 @@ static int sprd_pcm_request_dma_channel(struct snd_soc_component *component,
 	for (i = 0; i < channels; i++) {
 		struct sprd_pcm_dma_data *data = &dma_private->data[i];
 
-		data->chan = dma_request_slave_channel(dev,
-						       dma_params->chan_name[i]);
-		if (!data->chan) {
+		data->chan = dma_request_chan(dev, dma_params->chan_name[i]);
+		if (IS_ERR(data->chan)) {
 			dev_err(dev, "failed to request dma channel:%s\n",
 				dma_params->chan_name[i]);
 			sprd_pcm_release_dma_channel(substream);
-			return -ENODEV;
+			return PTR_ERR(data->chan);
 		}
 	}
 
-- 
2.50.1


