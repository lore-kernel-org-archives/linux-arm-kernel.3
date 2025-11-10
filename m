Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAE5CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsqD8hIYqMXl47bv5z/kCNG5Y97c4gpH+3NJyE3dBrM=; b=wIvqk2vSwf3mAy31tSzH6f7Ozt
	RfUY8UAdKcSGKTi6eoM04oWYdCNCQPiy0+ScbvdJsVVTlYGBaydN8LXW+Fv3LLb5l5wmlY+mgZeoO
	vLYrwK2Yz51NvfP85qw5Jsj/EFL+Fyyio0nuZAsHBxEknGZD5nVrNk7Gz3qyTQK6Uc1A0hXvbTNkt
	XKsr7sXxPBgPRg5lBXrVROVJ3DfYwPZhf+xt9xA13jl2opMIo9dk1+gmZnBEXjUp1lmlXCEsc2tKE
	Pc/bDZpWryNbkB5FKLEw+7QB+h7iG2xP+vV3+4w+Awc9qw2dRSK8rr+TcWTd2SaBdH53wvue3thf2
	bYJFQGkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPI1-00000005CYv-0eWo;
	Mon, 10 Nov 2025 10:38:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPHw-00000005CWA-3oeE;
	Mon, 10 Nov 2025 10:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MsqD8hIYqMXl47bv5z/kCNG5Y97c4gpH+3NJyE3dBrM=; b=BLQVeLEjgil8HRR6gWWU9M4sQr
	wUAY3pD0X031o771WL+3DjJDdxGdQEB+hJ2FWjl6zSV/Z5+zPZX20M/YIIm4e6KQ8ftojvHPTEY1U
	GI/VKZuLWwbEM2arXG4g4P1WEqXsB/yUYzh0YORX3X+JriJxKwgyjxruz2abuuMutqyLDHUYrK+iK
	v8QRKKch7XnWlpJ1LywE9rTF/gFnAgp0p3OweHIyiP5GZ9Q/2cI/5AAG2hnnfL0ItwlSvbzFNeuvT
	pBUBaREB+V1a84JiSP82cyKEnHr/MQ9jrh6/YXzr4ZfTHBGVEshE8bf7J6YzQfpZHaakrQ6+4ZE60
	rzq2qP4w==;
Received: from mgamail.intel.com ([198.175.65.10])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOQD-0000000AP5X-1imu;
	Mon, 10 Nov 2025 09:42:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762771097; x=1794307097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Zh3TL69b+gdWcKPQcymDHz8XDu0tfbcYP+gfBoy5co=;
  b=UELuAsZcgex68cD19UhzqEUeeN9QAED5nu6BnNUfu9BlxHQpThUezyfE
   T6bITfRWDI1cCDnHvW8O/BCJ74Ms8ytZ0CeZRjVzIuKKrztdAnv4D0+4n
   /P7pAd/geG4bSywuCmCP1WVdZMaeR+xkylC4l8u5eDY+SxUMSXswdburj
   QwQn6Bv35CU1xxBrzy7aFyItubVY4ufPIJn1g9zv65z7egqD/h+EO9wpE
   /Ofj3FPsg0PihWGsIKJJQjhQXcu/X/FumRhOr3SVHvKmCRpdHKhpZq2QI
   pwBQrpAWtzXfCAWbVbpK/WjjguSK/WOrjU3U4NR6gXQZFrMhke+TQ5DZ/
   g==;
X-CSE-ConnectionGUID: HVeXtdIMRkSvKxlBqJqsAQ==
X-CSE-MsgGUID: KA7e9lFgSrq+eNKlA1guVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="82216071"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="82216071"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 02:38:13 -0800
X-CSE-ConnectionGUID: ihaVOzPVSqKkglaDulk+Iw==
X-CSE-MsgGUID: PRC7eIlSQ/mEwofKKs5zLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="189081440"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2025 02:38:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 73E7A98; Mon, 10 Nov 2025 11:38:07 +0100 (CET)
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
Subject: [PATCH v2 03/13] dmaengine: axi-dmac: use sg_nents_for_dma() helper
Date: Mon, 10 Nov 2025 11:23:30 +0100
Message-ID: <20251110103805.3562136-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
References: <20251110103805.3562136-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094249_918457_D82F30F1 
X-CRM114-Status: UNSURE (   9.97  )
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


