Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84687C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGebEj6i+Mcb/tRGCA6W1Ao+p+atxNQYMkqBjVq7X1I=; b=vEbuCDiEkPJVVessZbJUAD6H/N
	Mk3i+Fx4uTz6aiI/1hPjlf684rHF0lhc2s/Ussc7mLtyxTlI6axOeFmvIviduxmaUA3msakA2iDyK
	QrkjbUHEAUmAiEL7BNPZbAzuZYa6gjmqnsi6B0gA1RnqEmQXR2boEgXfdq2kufOaNuwMtnBfSfEjq
	ml5O0HhQeGxgYtFzH9g7D6L66y4I3fFbAI6QcHBSJH+H/GevY5zQr/9rBCGehHETl90gK9Lr9ceu/
	sWsCKNkavgOkOxKz/P92EzBMH8MVnmTtD/d9cEDrLLow9lS5Vri0WZMJ2h/v/sg/r/w+ZkxlKCwsG
	IQt+/OrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q7I-00000005rF5-01YR;
	Tue, 15 Sep 2026 10:10:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Q6u-00000005qv5-2j5S
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 10:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zGebEj6i+Mcb/tRGCA6W1Ao+p+atxNQYMkqBjVq7X1I=; b=AG7wW3TKWlQnNk0NXNdVDVfEI3
	87tvfRGdNiWL8oIjHX4I/usRXFt+s3olKFrqzliVU0/qqUWHYnAPFtmVMN0Kc/D3Ut17zSwzDLHJD
	Aom/tuzyxQ6c/r4WRkndKujI9R/79dQRKX9NwSZIDz3sZ2I22Rzuh59JRl8lIsnP2py+0iAqxiuh6
	NprXWiOeg5AbcJaP/9McDz9HlQoYaMsAPFHijEDcKAw0teBvlwSMP/MrWYw784rCzZaRR6TFCdyjv
	Iet2JJRZevBdxN9rEZwHBdp2o0aHBPyMmc0Vr98x28w3Cz8jgVF3qweEc3TXa9NkzYu5m9bvZ5lXc
	dD67KWZA==;
Received: from mgamail.intel.com ([192.198.163.7])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Q6r-00000006X19-22XL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789466993; x=1821002993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S3szUq2krwYbTZZeTS/C4wC1E20wM6Ut+0nvD27YgTw=;
  b=LPkEXZwGAmrFoIHWzQZRHWERyTj0cQRSS3qN8y1ToG5k59ZiOo+XwT2l
   b78wjQUeXjYyaL4isNlheqULJ/iXVjImydoEkr3KBv2vyBw0D9YFJoKyd
   lmVW3fUFdGDcdeYvopHZSziO5PB5ZcAAFb5M+asGML0S2i2BlivFBvDCG
   rf2AfqBrdH7mJZ6fjmVr0rDBL4mzPVzGIytg75wWGCkVF7VsGvsMCNLvZ
   RmsKjYlXpXxABMeVWgPNahiS5bGuQBKOGZPmdnDQbuzhTgwSGUKt7i69R
   z1RQPGwTbAE46fMb13QgXs1CwcTQT+QvgkaOFAKtLnHb3qUhnR2uzCPZM
   A==;
X-CSE-ConnectionGUID: jwy5BShaT4aVz59tbUovAw==
X-CSE-MsgGUID: N+wgnncySDSYPYs7tk0c3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115360961"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115360961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 03:09:47 -0700
X-CSE-ConnectionGUID: 42MLKcpWQmuH0LoosqBueg==
X-CSE-MsgGUID: +GC634cpT4uXWqdlsRFeRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271517611"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 15 Sep 2026 03:09:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 77E2BA4; Tue, 15 Sep 2026 12:09:32 +0200 (CEST)
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
Subject: [PATCH v1 6/7] gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()
Date: Tue, 15 Sep 2026 12:04:27 +0200
Message-ID: <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_110953_930054_C9D174F9 
X-CRM114-Status: GOOD (  12.09  )
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
 drivers/gpib/fmh_gpib/fmh_gpib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
index 5e10e9353fed..3fdcc673ec8b 100644
--- a/drivers/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
@@ -1458,10 +1458,11 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
 	e_priv->irq = irq;
 
 	if (acquire_dma) {
-		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
-		if (!e_priv->dma_channel) {
+		e_priv->dma_channel = dma_request_chan(board->dev, "rxtx");
+		retval = PTR_ERR_OR_ZERO(e_priv->dma_channel);
+		if (retval) {
 			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
-			return -EIO;
+			return retval;
 		}
 	}
 	/*
-- 
2.50.1


