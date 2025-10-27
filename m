Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E4CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3YR88ejJErBzD58j/XjV2x9+edBe8d6KD4QOhT+ixQ=; b=hzvrKAoOBVy4Z79q8kuJJsGVY+
	iMed9qfu4mOF2M+KloLiqT8+9+L/rTxYBdclNoLhzzG0HYR05zJq5Y0QZYV680LxzxYIsMjxY5fn2
	LYr6F+8DhnScvgsnpKebiZsR9J/YIRzabstMEb8m/FRmJ0qZP2AXIIj5wYJ0LlC8CB7Xje4nb8Prv
	woQlz9+isDF7Sk1AzobbGhWNUT+2RwCEdVzB3XdvnIYJ/ijcREh2AMrX6Q1L6VtX1w4CL3ee3Vt06
	Rv38uzkka4Lpg1p8DMDmzwOGPcEcdoZZSFnvE0YrG7v8rZlriRWr/5MVSWLqDluUyVEDFiNezv0PH
	JLwoiZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNLB-0000000E308-0Yr5;
	Mon, 27 Oct 2025 13:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNL8-0000000E2yu-2m4X
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H3YR88ejJErBzD58j/XjV2x9+edBe8d6KD4QOhT+ixQ=; b=fyib5Vnb1ddsZVWYqKzOaRKSPY
	trRTYuz8IM6hLoEOiA1OHuc4UDiYt07zxvchhrlLCfoRuBE8pYVhe0LwNLgzBjFwId56yjhRIIyoS
	f3Efsi2cw2QUi0IYMuriFYa2SU3ynuRdLd1Y9cCd37iqHjTjxwJ3Cm/0x9ZdCWuB7KgI36AwFwqul
	bbPIkRPT2hf594BAqX+Ovn4kdFJz2Pu7gFJv1VEtg0H6ftxmiGSS3rdC4oEhPrcGLzbBRY0t2CHDM
	PbI/mhOq5zkaHNIe+I271cWb7YSDcl1HGdRIAjGVxDf67x7b+gK/ICnvadJO/hBx+oStcfRwCyDb9
	l7NLEwYQ==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMTL-00000002Bd1-1omW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571967; x=1793107967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mamwn5TbNH4hfztICDA/xhTtvnc1/Keqfpn2ZYZW7RQ=;
  b=JHSJ4q6fuHsBMOng0LBbFLM9Ryz4xWNSKlN982A4P7bErfMO8sN6Naii
   +gB0Qpm9yW+lQUNl6hk1a4NZDCHinc8vo+G92IuQ7fxHkCleRy1KVlRto
   C8jkEyCr/GoG9DSYiMuSoxGxNolAQigSC09I2RxWluYixkzmIQJgiwwD1
   5LYUZnWU0ltmdCjTX+pObGKrLmNCNH1hYw7mS2pW9nOfR5uP24wCEc2j+
   QjsHGF8Zm4xj8Oedu00DMTE6nVMW78tYUr02EbmM3L2SZCiKtiWAOk//x
   qOAlNKCybPINllOsT9vQmG50hw072LAeqhUYmRGNaWuDDLfZTN3RReLZH
   g==;
X-CSE-ConnectionGUID: C5inSv+sRKWzDCg4Ao6HUQ==
X-CSE-MsgGUID: jOaj4QBXQRqGn52krvyvNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63555402"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63555402"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:43 -0700
X-CSE-ConnectionGUID: 6o5P9WsNT5mWDTMPgHg5Kg==
X-CSE-MsgGUID: CqqWrJUlR+eDcmWguz3O7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189082275"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DBD711FADA;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDT-2WpC;
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
Subject: [PATCH 2/6] dmaengine: pl330: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:28 +0200
Message-ID: <20251027133232.392898-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123715_849857_1ED77271 
X-CRM114-Status: UNSURE (   9.88  )
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
 drivers/dma/pl330.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 82a9fe88ad54..72f260328ae9 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2133,10 +2133,8 @@ static void pl330_tasklet(struct tasklet_struct *t)
 	spin_unlock_irqrestore(&pch->lock, flags);
 
 	/* If work list empty, power down */
-	if (power_down) {
-		pm_runtime_mark_last_busy(pch->dmac->ddma.dev);
+	if (power_down)
 		pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
-	}
 }
 
 static struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
@@ -2313,7 +2311,6 @@ static int pl330_terminate_all(struct dma_chan *chan)
 	list_splice_tail_init(&pch->work_list, &pl330->desc_pool);
 	list_splice_tail_init(&pch->completed_list, &pl330->desc_pool);
 	spin_unlock_irqrestore(&pch->lock, flags);
-	pm_runtime_mark_last_busy(pl330->ddma.dev);
 	if (power_down)
 		pm_runtime_put_autosuspend(pl330->ddma.dev);
 	pm_runtime_put_autosuspend(pl330->ddma.dev);
@@ -2347,7 +2344,6 @@ static int pl330_pause(struct dma_chan *chan)
 			desc->status = PAUSED;
 	}
 	spin_unlock_irqrestore(&pch->lock, flags);
-	pm_runtime_mark_last_busy(pl330->ddma.dev);
 	pm_runtime_put_autosuspend(pl330->ddma.dev);
 
 	return 0;
@@ -2371,7 +2367,6 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 		list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);
 
 	spin_unlock_irqrestore(&pl330->lock, flags);
-	pm_runtime_mark_last_busy(pch->dmac->ddma.dev);
 	pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
 	pl330_unprep_slave_fifo(pch);
 }
@@ -3176,7 +3171,6 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	pm_runtime_irq_safe(&adev->dev);
 	pm_runtime_use_autosuspend(&adev->dev);
 	pm_runtime_set_autosuspend_delay(&adev->dev, PL330_AUTOSUSPEND_DELAY);
-	pm_runtime_mark_last_busy(&adev->dev);
 	pm_runtime_put_autosuspend(&adev->dev);
 
 	return 0;
-- 
2.47.3


