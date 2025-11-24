Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24C9CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqsAGmvrT+RP/IY99VEMwYi0/a49IR5aMlu9+7wZVXg=; b=DFCyQnt2CtXtXQCdI/A/lp/lio
	jn1UhqVOhOQ5cxmCYklekunRvtluzTqXQGQk/MAms1T6wpMBMtMduMweTrd/QCkRJQkn5GoEu4HkR
	deCjetUowt82le1c2MUOpiqkLTillDLihnClVou5DzhH47aKMW+BdhOzYJZs1+OZ/+qvOq8MlAx8y
	XR7hLlyWzT/+s6MQh/YuQZD2W2wkbceUvnkAj65fu7nV+jAkW79a1bdAS0B566hhKdyRyhm5uFpn/
	fWY/lOVYbbaazsgqKCA1evPOb0JzTAOvQ0G1cJn8ar01t+wBjAoyDqLg4yLnmZff3XP/n+c/IC7rw
	7TorvUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQz-0000000Bcld-3pIz;
	Mon, 24 Nov 2025 12:12:45 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVQW-0000000BcS9-43np;
	Mon, 24 Nov 2025 12:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763986337; x=1795522337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z4cy+2HbiLCLWtcSsLcUwBV59DreBfM5HrektthG6GQ=;
  b=ZqCm95SQ2DjVXZsq6yHRIXZSeRr1JGJQ/qOFQ1acxhZ+Qd6XtSz3zBkr
   GsySKL7R+eo7Cr8hOyokGwe/Itxm5JVMPPNNfbOECFki2a1ojfO3BE2fD
   Y+TmK0O8f+WrHQYh84Fo/HLt93fyfNQUg4siCKK2n0BmTPcy4hGX1OHES
   8WsdFIm/f9E6UMLMSlHQpRafvxXnZTfzx+9lK2DkFanIhdCE7dce8GnoB
   GKXdY0O8ZCYQf8ep52P8vMPMGxslW15BuXFIasXVosgp4y0d4bjWPNoZj
   XrgcuNHu5xENYUDr1kx/SMlYABOZ/xInRUzPNpwMzFh3iKFGgsnnwwc7s
   w==;
X-CSE-ConnectionGUID: wVMZKqLOS7m3yFWFtXgLPw==
X-CSE-MsgGUID: JrJF3Yy5SuWFWkizkjG1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="69847609"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="69847609"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 04:12:16 -0800
X-CSE-ConnectionGUID: u8eTMZfQRgaZ40Qo2k195g==
X-CSE-MsgGUID: 39ttMucESuq1ncwuVM0izw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="222970344"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2025 04:12:10 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6560CA7; Mon, 24 Nov 2025 13:12:03 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Vinod Koul <vkoul@kernel.org>,
	Thomas Andreatta <thomasandreatta2000@gmail.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 07/13] dmaengine: lgm: use sg_nents_for_dma() helper
Date: Mon, 24 Nov 2025 13:09:25 +0100
Message-ID: <20251124121202.424072-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
References: <20251124121202.424072-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_041217_021367_43F70F70 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Instead of open coded variant let's use recently introduced helper.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/lgm/lgm-dma.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/lgm/lgm-dma.c b/drivers/dma/lgm/lgm-dma.c
index 8173c3f1075a..a7b9cf30f6ad 100644
--- a/drivers/dma/lgm/lgm-dma.c
+++ b/drivers/dma/lgm/lgm-dma.c
@@ -1164,8 +1164,8 @@ ldma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	struct dw2_desc *hw_ds;
 	struct dw2_desc_sw *ds;
 	struct scatterlist *sg;
-	int num = sglen, i;
 	dma_addr_t addr;
+	int num, i;
 
 	if (!sgl)
 		return NULL;
@@ -1173,12 +1173,7 @@ ldma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	if (d->ver > DMA_VER22)
 		return ldma_chan_desc_cfg(chan, sgl->dma_address, sglen);
 
-	for_each_sg(sgl, sg, sglen, i) {
-		avail = sg_dma_len(sg);
-		if (avail > DMA_MAX_SIZE)
-			num += DIV_ROUND_UP(avail, DMA_MAX_SIZE) - 1;
-	}
-
+	num = sg_nents_for_dma(sgl, sglen, DMA_MAX_SIZE);
 	ds = dma_alloc_desc_resource(num, c);
 	if (!ds)
 		return NULL;
-- 
2.50.1


