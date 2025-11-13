Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFD8CD8C87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q09rDRFSIpK0iNPSMzfdzpCn5bc8ERCcYezMZ0/CVhs=; b=ZvOdMZg7r6+soROpUfxK+PKlle
	Su/VHYHHI4usWl9OZKibJGl+8U8Vn3KNH57S0mtgHecMndj0KTQ5CSvAvft5emWjOCEHaSxI2QHJv
	iLOwt0VexDkSxNISFZSower7yfl9YVNxBgKejIpBg3oWRcekQpe5kEPkZHBU1xpx8TkT9SjHBq/Ve
	rQ1YGRrs/OVkPpdUmajnya546IKBS/W4Y8S/yDGuIzypeBg0iFMVdFy9I5nt/Tu3sXG/izXvBghPl
	nAbIQFWppShz67T7PbwkMw/ennxmL7lDhcJogTI+0MQ1vNXny2R3LpR5iPCj19Nbo0q69WWXGWshA
	9UkkXJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3l-0000000Agz4-2fXK;
	Thu, 13 Nov 2025 15:16:29 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZ3a-0000000Agld-1wAe;
	Thu, 13 Nov 2025 15:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763046978; x=1794582978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JkZzb5FMsjRx+/pIEY8nwVKtWJam+umuXTVqJZGjOp8=;
  b=Qxsl+KXW52KZgkZS/n2IV75ByrWFx5OQe1WWn6LuBYAOCgMMHtEAYb6q
   DOmoy37oKT+UhudUqct0mPu3RxmSb8epLYvg5Po0ZADzVxjUbe9F7cd3l
   oW8w1tFwHXRVLEs8jJvBm8Bax4L/cs687wsN/J7FWS+jimcnVLRyCf4U7
   gxia497t13hMNV4e3U1t5feu/Z9DG+Cm1C426uI+CjEAv0VjH0wv//548
   r7BBRftsEdOBTs4BEyhSw2IabVdXozeutHPUeXXduLYOTXCPVjeCXfiZb
   /ajulVodWd+S/BPRjToR5I+zRKNZWPRqZc8s4gKFcahuKk3A8R++Y74tc
   g==;
X-CSE-ConnectionGUID: lIOoapsyS7Wgy57JzPb1YA==
X-CSE-MsgGUID: MLehCiV7RYikuK4nYZYAPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75740560"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75740560"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:16:17 -0800
X-CSE-ConnectionGUID: NB1OMkpYSeiUxBj2Cn79iQ==
X-CSE-MsgGUID: Ml1DjtRNS+aC1JPL6nSnOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="189792124"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2025 07:16:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D96909F; Thu, 13 Nov 2025 16:16:04 +0100 (CET)
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
Subject: [PATCH v3 09/13] dmaengine: qcom: adm: use sg_nents_for_dma() helper
Date: Thu, 13 Nov 2025 16:13:05 +0100
Message-ID: <20251113151603.3031717-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
References: <20251113151603.3031717-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_071618_529048_EEFD6F8E 
X-CRM114-Status: GOOD (  10.63  )
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


