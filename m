Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63399CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/cq3A8GUv3iHjuxqajw2dHHmjUe71oX1UiIXwPA5/TI=; b=VBsV+I0sSNYC+xgcqiBreYTH63
	tJNXsFGZO3uDCPSqIdcqlOpbklK/oPnTjwaWzr2MAi+/zm/LK6LgyvWbMpHdMeMpHBdhFNhVlVNMm
	wib/B65AKCOBXkckLhscP0Ay+ShuC48XUPgLlE7eAt+k7THxzIiVfhH7Tv0oNzLJMFNXpKM2FD7QZ
	aDHO7BvyJ523abovRfnGHZr4GRtb322tx5CB+ofiOiUbuZd4Kmt05Nwqju/Er3XJpATuO5KRXfg5u
	i1meOWH66OAZ3x18vHilt+vY6BWbIRq5jZ5mMOV/TK02Pj1ep51mh4TXfM/e/R4xFXlXTRijteW8o
	k/VilbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIv-00000005DHp-3OFY;
	Mon, 10 Nov 2025 10:39:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI4-00000005CU4-3qnz;
	Mon, 10 Nov 2025 10:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771109; x=1794307109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OwNTWbPKJ24ffgAUyc6H9GN1ggjkmnfUcXfxAtMuqrQ=;
  b=VL+Pp5jZFKx98T9RZVZsAkZqSykNzzGHegjDDXC6NZk3w11IhkazzlWa
   xyjK0xFJrYMPZcLsoucrOKqQ7ufeyLPLf1jYPWiAfvrqMuaiBmwsa0lov
   GSoU/bWJt6DdzaWgn+5/Kk7AXGGq0JJcx8PsaL+oUfT/VVVLHPCzVmXVd
   z27/pu/vwPADI/tdpF8f+PK4Fp9fulYUsDCArIzlYr0ajWo3HEGjDueM+
   yBbiqZjlswdw9NWbM12e+1UxecoaW3iTJjGgs23iCKuvDo3UEe2w/lawc
   wXAzJhCU0865s5P8AO1cigVeHRv5Eh6JfSHnX26shkmywtEZW0KmKkZ3i
   w==;
X-CSE-ConnectionGUID: NdE13zJhTRORFsQzDc3xgg==
X-CSE-MsgGUID: 4QLpyVaPRjK6b42lBoWKHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64728181"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64728181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:19 -0800
X-CSE-ConnectionGUID: 6E3zoBtVSpW1NjrvUZ8dwA==
X-CSE-MsgGUID: zGNu059tSv69g9qQPFKq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188891267"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 10 Nov 2025 02:38:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A5264A2; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
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
Subject: [PATCH v2 13/13] dmaengine: xilinx: xdma: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:40 +0100
Message-ID: <20251110103805.3562136-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023830_420019_369AFA1E 
X-CRM114-Status: UNSURE (   9.67  )
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xilinx/xdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 5ecf8223c112..118199a04902 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -605,13 +605,11 @@ xdma_prep_device_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	struct xdma_chan *xdma_chan = to_xdma_chan(chan);
 	struct dma_async_tx_descriptor *tx_desc;
 	struct xdma_desc *sw_desc;
-	u32 desc_num = 0, i;
 	u64 addr, dev_addr, *src, *dst;
+	u32 desc_num, i;
 	struct scatterlist *sg;
 
-	for_each_sg(sgl, sg, sg_len, i)
-		desc_num += DIV_ROUND_UP(sg_dma_len(sg), XDMA_DESC_BLEN_MAX);
-
+	desc_num = sg_nents_for_dma(sgl, sg_len, XDMA_DESC_BLEN_MAX);
 	sw_desc = xdma_alloc_desc(xdma_chan, desc_num, false);
 	if (!sw_desc)
 		return NULL;
-- 
2.50.1


