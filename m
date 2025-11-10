Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C7DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCzzab8PczDMQHwqBBuebX4DQ/jYabj1QX8nAyIsNmI=; b=AYYs9J4VWpNojwgdJuuphwz3yK
	nJvuN5DMaf0Dxb0HzERb99UKyupu5CiIrLnT73SVMR+a3vtzQtlKVYXX6LuKWhgoL37Ax7ydKCWFe
	LNBR8WmTY1qKd4/uIJk5nUayeEqwU9VdZ4utI4P2VCAD+kLV0xr6tkVFBW9GCfat7jpV1mGR0Ize9
	cfQq7M2jK7GsbEg1KQonhh9iP6/9NMOPawpVjUTz75L1S9tpk3dAdU2uBbE8hAdSKmLIntkd7lVR7
	Fp4sxS42jYolcQLjrc2CozoSjqMRUze+bKYPb2P0kt9S15QRVLdOTi94ggP1SWEauai0jgSHkDQC3
	Kx4bfbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPIb-00000005D3t-0aks;
	Mon, 10 Nov 2025 10:39:01 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHv-00000005CU7-2190;
	Mon, 10 Nov 2025 10:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771100; x=1794307100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FVYq9jhKnLoWvvNaF2UoF2l9OnxxHFIvRoR7/5QiK/I=;
  b=ObTDW7JJrmYftBRLvNQxFEkaIOPFnkBJzZ8FF0VEuY0IPog972EyV+KD
   gK4J8wm2Aj7P0YnBrSkj62zSKlz4SiUf/8oz5fpdpIeuWY1aS2iEzEtd0
   2g+hcEKKEIXYs+Sk+j7/0ctAZesFQ7ziLsrlrLXTbQ3cF5esmZQxrhGik
   X0kM7DzpYYtLqIKteTcn+OxR6SmBom4/6FWZnB+mGkGi7ypAlvdM0JB1o
   JPcWB9h4WD9g8egBQ2qhjs6h7PLeAgbf/t8N9P7iI6d/q7NUMpgoFRq1a
   mySJuchA8FjKzHsPre6Xm0v+BjGr8co9GQpdaETmprh0vJdOj0QTWvGef
   A==;
X-CSE-ConnectionGUID: /7HxHgUOTPWxFBVVPY3VBw==
X-CSE-MsgGUID: Igf44b6vSlihURyst1Tqxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64747380"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64747380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:19 -0800
X-CSE-ConnectionGUID: 1OAI2T3eTcmOyt/qIdGftA==
X-CSE-MsgGUID: 3KHBWfu/Qo65fequlUDp1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193026324"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2025 02:38:14 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 918539E; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 09/13] dmaengine: qcom: adm: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:36 +0100
Message-ID: <20251110103805.3562136-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_023819_595003_F708ACE8 
X-CRM114-Status: GOOD (  11.35  )
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
 drivers/dma/qcom/qcom_adm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index 6be54fddcee1..490edad20ae6 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -390,16 +390,15 @@ static struct dma_async_tx_descriptor *adm_prep_slave_sg(struct dma_chan *chan,
 	}
 
 	/* iterate through sgs and compute allocation size of structures */
-	for_each_sg(sgl, sg, sg_len, i) {
-		if (achan->slave.device_fc) {
+	if (achan->slave.device_fc) {
+		for_each_sg(sgl, sg, sg_len, i) {
 			box_count += DIV_ROUND_UP(sg_dma_len(sg) / burst,
 						  ADM_MAX_ROWS);
 			if (sg_dma_len(sg) % burst)
 				single_count++;
-		} else {
-			single_count += DIV_ROUND_UP(sg_dma_len(sg),
-						     ADM_MAX_XFER);
 		}
+	} else {
+		single_count = sg_nents_for_dma(sgl, sg_len, ADM_MAX_XFER);
 	}
 
 	async_desc = kzalloc(sizeof(*async_desc), GFP_NOWAIT);
-- 
2.50.1


