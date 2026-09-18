Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1919C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7hfK+qZe8W077RkzRTza0DHQiGA/xyznXcJIRqk9Jc=; b=dZ82UiF37A3pDga0yec9qWuTp0
	hxBETNluCx0xJdjZ5QfYtHz3MqyKzRzoqE5FvRISTk+HoHi84E/YjgaJvN7p89tWKdRNUuvpzvbhD
	hbP9vY5ntr0DKhL3KPp7qivKcfAbRvm/+NchcQfIHClX0lr3UQ/WUbRuTwLY7T0HzI2Y/Aa/JP+KY
	DZtVU6Fzm1N0HEHsVgNJnU0lBaq4VAExlseYYjsEWzKok8NiaVzvyd+MimP+VseiTuQMI4AyhJ5Vu
	UoTLH42SRDrwrwgj7gxnlfi71Wm80zKkbFbFRLlmvA7wBjxico5rpEPk7R3H4IKvf2PjLjuLF67vg
	MIVirnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wum-0000000EGGF-2sr6;
	Fri, 18 Sep 2026 11:38:00 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WuW-0000000EG5g-3EIu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789731465; x=1821267465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dsocwb7K2ZpRqzpDad5Pm4Zdlbi0/SbBbWa0Q7zC82k=;
  b=mgTPGUKVsJEw6EU7QkL2sAHWNwNfom1mEfPHgna8qm2pj1+9C9jT+oUV
   vNPNcItRr7J2eBJC3TiwiRWabUa/pb3tY2XDO01s8cBDxfnX3GDviltqR
   MOs6dnoSJifS4Clv7Bi1214fKhEc5nhlqf3BMYtXJmgmfdX/rtXIPiA6q
   3H5sf43frv1AvTqpMFz5kmILWmJz6Q6e4dL7zxqK1G4zz0VaDjGNxNrN/
   dWGXRQTt1rUCr19vpdtPQU5vZzvep4vDo+xCWhhUcABYpgty5H34qIIW0
   4axqkHJJgpU4kU5kZTgR+ms2jXwoLmPtBBgv3Py2O3cF7wBYmnyjWzWiS
   Q==;
X-CSE-ConnectionGUID: bTxjqQwTRlWa9FkYoGmjUg==
X-CSE-MsgGUID: opXtcI9cSsGK5dfT87W4Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11908"; a="92739761"
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="92739761"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:37:43 -0700
X-CSE-ConnectionGUID: iLqdN8XLQ3SjN2203lubpg==
X-CSE-MsgGUID: VSAVOy0OQ9qg8FU7OlJ13w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="271029227"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2026 04:37:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 76EA8A4; Fri, 18 Sep 2026 13:37:29 +0200 (CEST)
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
Subject: [PATCH v2 6/7] gpib: fmh_gpib: Replace dma_request_slave_channel() by dma_request_chan()
Date: Fri, 18 Sep 2026 13:34:10 +0200
Message-ID: <20260918113727.1898998-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
References: <20260918113727.1898998-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043744_826415_D40C988B 
X-CRM114-Status: GOOD (  13.70  )
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

Reviewed-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpib/fmh_gpib/fmh_gpib.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
index 5e10e9353fed..4ab9b0a317fd 100644
--- a/drivers/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
@@ -1458,11 +1458,15 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
 	e_priv->irq = irq;
 
 	if (acquire_dma) {
-		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
-		if (!e_priv->dma_channel) {
+		struct dma_chan *tmp_chan;
+
+		tmp_chan = dma_request_chan(board->dev, "rxtx");
+		retval = PTR_ERR_OR_ZERO(tmp_chan);
+		if (retval) {
 			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
-			return -EIO;
+			return retval;
 		}
+		e_priv->dma_channel = tmp_chan;
 	}
 	/*
 	 * in the future we might want to know the half-fifo size
-- 
2.50.1


