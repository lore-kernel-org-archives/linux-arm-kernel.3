Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C82CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srql0adFwKjuSiPXuKOqpneZip55+r2hDDt+Z+UX+GM=; b=AHYr56hB23jjXp4f4sWNcqr/EM
	tGmCpJn3chUMyLkS+S6wjrGY+MxCAU1w9K5oNEPn4rwWBM4Oq2dUUZ45ZwRlSyrZwNyhd+oPIhSCe
	oSwBkNeZjVcGozvp6fAVfga55aICY3M1Gitir9BssnjWbHjHUU3sx0QcLLt0oCq3HR+XhxtvZs/3A
	K1MPHGW04yQ8Gr39g3X3FAaewfEbAPehK0kF3Yzl0uYM7jKE2dGGZOXl43rXcWXcIQsF7WynohCMQ
	+qq084KGsGUmVKBd9VM37NK+xcw4FeEsd0V6qUiBSuiH37F4v4y17atfHsqprXhUCxMCzoCavKjgf
	MNQIMRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLK-0000000E34b-1J5x;
	Mon, 27 Oct 2025 13:33:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLA-0000000E2zX-2yn2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=srql0adFwKjuSiPXuKOqpneZip55+r2hDDt+Z+UX+GM=; b=MCCJbxCxJZLQdzv6ibhwgfr+6q
	3bNgIZkRwandecUfegabY6YPyyupzvIazP8mW6U01NvUjJN4DyKVAny8Oo5I/T6m6B5O8ituaYl5Y
	pEsnSxwuIM6IgZnFKppUy2h3mT8orBw39uJEa/kPrnUUNEMl3TnsyK2clh37cEvgV1s93n0Zo0vjA
	rifT6AhFFyDWikONtnG1NMqJ3kcc7SkGpYqDXqttiwb9ChBDuNUKzRG4PkPMczeRDaVTMrdpWb5/I
	GMuu9wBaWY5fpxh3JMA/iWe1nhmK4oCoWksWnJh9p0u1zX1P9QspMqLv6j/61Ptf5J4bL98sg6uOi
	qr1KjLsA==;
Received: from mgamail.intel.com ([198.175.65.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTN-00000002Be5-3eqb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:37:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571970; x=1793107970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L2EJvo+ibiudIgMshQ8LXZ2bLi30gQggyjvuPIskscw=;
  b=G3YdkaVWw6xXLRhV8Ggy4Ia4iIFuTi/c4uQUIrCJJtYe+h5gkQlLhFh8
   7UiLxc3+n02+zSBSLLfuSeO5sRx+4A+HuTe43c+0NKcUl3VPR1QqRZLVZ
   AAK4IMNknQY97QHaf078HWMA57kmY8hesrOdvUf9Qz3jvOA0JwAaAN1Ud
   USbqXX6nSwHYCKndrlwo4lm43iSUduGTOF+MsurzgihQBqKE3DR0NicDp
   mZi08s8RdXaCd5m8HYewUsuu82GT8YtLHCL5U6Mqk8yJxBnds5MpLDK1B
   xMGwIbwmMCg0gPN7VuRuuKpy9cJi+OOcO6Os9jYRU2JdMsji951txeOEh
   w==;
X-CSE-ConnectionGUID: OXwDTHY8Say4l6ssBHSv4w==
X-CSE-MsgGUID: ll7o0NCPT32zdaBjtDSX+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63538364"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63538364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:48 -0700
X-CSE-ConnectionGUID: 3ddyvoeJT1KyPd5IgZv5Tw==
X-CSE-MsgGUID: WXHlONIZSjuUuikFyU/rXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184938316"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A939E121F07;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDj-2mbu;
	Mon, 27 Oct 2025 15:32:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 6/6] dmaengine: zynqmp_dma: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:32 +0200
Message-ID: <20251027133232.392898-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123718_225812_855A3A81 
X-CRM114-Status: UNSURE (   9.38  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f7e584de4335..7bb3716e60da 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -695,7 +695,6 @@ static void zynqmp_dma_free_chan_resources(struct dma_chan *dchan)
 		(2 * ZYNQMP_DMA_DESC_SIZE(chan) * ZYNQMP_DMA_NUM_DESCS),
 		chan->desc_pool_v, chan->desc_pool_p);
 	kfree(chan->sw_desc_pool);
-	pm_runtime_mark_last_busy(chan->dev);
 	pm_runtime_put_autosuspend(chan->dev);
 }
 
@@ -1145,7 +1144,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 		goto free_chan_resources;
 	}
 
-	pm_runtime_mark_last_busy(zdev->dev);
 	pm_runtime_put_sync_autosuspend(zdev->dev);
 
 	return 0;
-- 
2.47.3


