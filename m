Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9B2CD8C8D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk8/5nWBofggtO4HKczYMg6PfcYGq3JDVme1biZjuQk=; b=KBkSzdcrVDuNbBumBTajlwwQ8I
	wOiBx20G1Dv6/4hMQOm4as7N+wsdzknk9mK4vtSRrXVkKx6MP8SARveos7k2JxYasVqdo4536UReO
	ll7lc6PZnpnQkMEAxHDxh9n2eDXl/ttxeA5zzHX/gXAKlGQj/NpWyp7XNIiFyuZionQbyZb7OYUFC
	dH1uC/V2TGmpaoz2BkRRA+MlbvAU30MowQvj8p8IZMGizLhMTDSsQURVndNXf5hbJ9fmBM55SzM2U
	mN/COkLpKSszUmZm4I+rG1t8pM3knJWBhQhYJOTeKdn7v+HNXXBemLKa4+zb+vpSLU6IsLNRy/Iw3
	rxeM+/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3z-0000000AhAy-3na5;
	Thu, 13 Nov 2025 15:16:43 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3c-0000000Agpj-2dl5;
	Thu, 13 Nov 2025 15:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046980; x=1794582980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nUvI1SoM4FGg3QQHNwgNidRdOH1tF5MQSJvXCQ4IzUg=;
  b=nOdH7VTErT5PDkcv62qonBteiwRnNpW1nIq34x8C4ip1GITAzABkzAHM
   R+dTOOa+z8cuIkMpuWkAPSjoEqi7aa8q0BY8f2jZEOF5Y3j1qJ8vizUH8
   szZGlkahCbCbauCj9Kz3FICgjzPP4SpTpQ+8HdtJQkWK+H0QeoumaGmC7
   tADAfaPeprtHXmJc+SxoOZLkeN5C/82f510GXB1/Rr4TmzezWZdU71L7O
   18wndiOzKNV854tNbrHgIGIGo563PyKri5YMvlf9+QJiqb0CjYYuPml2W
   AG5P8zqwjzRdWc4wu2ehGqSWKx2VgC417upLUrAh9khEVRh21u7/CBwip
   w==;
X-CSE-ConnectionGUID: 12rNUX39QJmf4VHiu5xksQ==
X-CSE-MsgGUID: sv6yzQRsRHmxblFaRPmbWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75809653"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75809653"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:11 -0800
X-CSE-ConnectionGUID: +LVNA3BcQcullz1ZF1JcFw==
X-CSE-MsgGUID: zoy9/u+GRxq9Z4N09/HWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194684642"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 07:16:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BD96599; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Subject: [PATCH v3 03/13] dmaengine: axi-dmac: use sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:12:59 +0100
Message-ID: <20251113151603.3031717-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071620_688550_58819CF3 
X-CRM114-Status: UNSURE (   9.46  )
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
 drivers/dma/dma-axi-dmac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index 5b06b0dc67ee..5d4436e7d2ee 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -674,10 +674,7 @@ static struct dma_async_tx_descriptor *axi_dmac_prep_slave_sg(
 	if (direction != chan->direction)
 		return NULL;
 
-	num_sgs = 0;
-	for_each_sg(sgl, sg, sg_len, i)
-		num_sgs += DIV_ROUND_UP(sg_dma_len(sg), chan->max_length);
-
+	num_sgs = sg_nents_for_dma(sgl, sg_len, chan->max_length);
 	desc = axi_dmac_alloc_desc(chan, num_sgs);
 	if (!desc)
 		return NULL;
-- 
2.50.1


