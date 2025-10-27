Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF5CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w9V1QhsQaDj4BDudraOA9fYuyiTPGwZZdruZ++SGc8=; b=pnrKWgVCgAcFgrq4uZkqbebeFZ
	dFZKp1xJXVTJq/aaUXhYL8FZPRhmGQYbXphm46fsQyHSR3AYTK+2NvJpQxXaqK70Dlt9cn3D1m6U0
	9ugBmbo3jZWql27JE+U1APtw9p1cY6hHFm3QWTq9QSyFIWzofTF0MWgRVGzGDoMnREKkka3X1mrhu
	skyRHwpKoxOxF2le4WHQvGCuq2z5RIeVdfapNrNGtoSLt1WF8D7ixFHeAKDDYiJUM7vH8mSgKnb9I
	uuMyFDlarSPKFSiAkU8OKUQ2EVbH4ibyAvwqYf1hGOwZKg5Mh9PPZm5ZhTqN61hMnisejTL8KS42H
	+WTLrb/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLYt-0000000DmaK-33Pq;
	Mon, 27 Oct 2025 11:38:55 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLYr-0000000DmYD-1yM8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761565133; x=1793101133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j468xXoR9cr3OXREFcfRw79OYR6IigAtpibsNTQMHX8=;
  b=Hvy6i/8P5VYYFAHjD2oeLeQ1NbjhbmfIx3I6ssFpr5R308kV9KlxFGuI
   6dpql2w355AJv0bMrpL3WSP9pGk8Es/1VGoamk8w9udCQQSs3U7qzKp0N
   ntmfRAi8Uh3ipI9Zu+urh73ZtEXQCXCcU1rE7kWgL2kFfEwVBfH1JiiTL
   DAW49SEpoY+D2osQLqLsO53REV0mRPM6w7DM+NaXfgFtrEs7NDk3qG0l6
   ri9jVSmEI+grw92bka+fNpvyxFfbtlXHklRAE2ZxMLvVniJDKaXH4gm7Q
   YG2YCvFVfc5BBxQBZCINWv5HrkFQWNsnCcsR3XYL7isTNztJeLXWcurux
   w==;
X-CSE-ConnectionGUID: zxh1Gv3OTx69lfBY8Hby1A==
X-CSE-MsgGUID: A63mNj9FR7++MLFVD//4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89112458"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="89112458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:38:53 -0700
X-CSE-ConnectionGUID: et9/0J7fTyaBSFj4o0jrAw==
X-CSE-MsgGUID: 5HD9QNMGQS6xqkxUaE5dVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190235487"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:38:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 98413121EFA;
	Mon, 27 Oct 2025 13:38:45 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLYY-00000001ddm-2H6P;
	Mon, 27 Oct 2025 13:38:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Nemanov <michael.nemanov@ti.com>,
	Kalle Valo <kvalo@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/4] net: wwan: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:38:34 +0200
Message-ID: <20251027113834.390681-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027113834.390681-1-sakari.ailus@linux.intel.com>
References: <20251027113834.390681-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043853_537786_BFC5B23C 
X-CRM114-Status: GOOD (  10.36  )
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
 drivers/net/wwan/qcom_bam_dmux.c           | 2 --
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c     | 3 ---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 2 --
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 2 --
 4 files changed, 9 deletions(-)

diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
index 64dab8b57611..6a5b22589af4 100644
--- a/drivers/net/wwan/qcom_bam_dmux.c
+++ b/drivers/net/wwan/qcom_bam_dmux.c
@@ -162,7 +162,6 @@ static void bam_dmux_tx_done(struct bam_dmux_skb_dma *skb_dma)
 	struct bam_dmux *dmux = skb_dma->dmux;
 	unsigned long flags;
 
-	pm_runtime_mark_last_busy(dmux->dev);
 	pm_runtime_put_autosuspend(dmux->dev);
 
 	if (skb_dma->addr)
@@ -397,7 +396,6 @@ static void bam_dmux_tx_wakeup_work(struct work_struct *work)
 	dma_async_issue_pending(dmux->tx);
 
 out:
-	pm_runtime_mark_last_busy(dmux->dev);
 	pm_runtime_put_autosuspend(dmux->dev);
 }
 
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
index 97163e1e5783..689c920ca898 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
@@ -250,7 +250,6 @@ static void t7xx_cldma_rx_done(struct work_struct *work)
 	t7xx_cldma_clear_ip_busy(&md_ctrl->hw_info);
 	t7xx_cldma_hw_irq_en_txrx(&md_ctrl->hw_info, queue->index, MTK_RX);
 	t7xx_cldma_hw_irq_en_eq(&md_ctrl->hw_info, queue->index, MTK_RX);
-	pm_runtime_mark_last_busy(md_ctrl->dev);
 	pm_runtime_put_autosuspend(md_ctrl->dev);
 }
 
@@ -362,7 +361,6 @@ static void t7xx_cldma_tx_done(struct work_struct *work)
 	}
 	spin_unlock_irqrestore(&md_ctrl->cldma_lock, flags);
 
-	pm_runtime_mark_last_busy(md_ctrl->dev);
 	pm_runtime_put_autosuspend(md_ctrl->dev);
 }
 
@@ -987,7 +985,6 @@ int t7xx_cldma_send_skb(struct cldma_ctrl *md_ctrl, int qno, struct sk_buff *skb
 
 allow_sleep:
 	t7xx_pci_enable_sleep(md_ctrl->t7xx_dev);
-	pm_runtime_mark_last_busy(md_ctrl->dev);
 	pm_runtime_put_autosuspend(md_ctrl->dev);
 	return ret;
 }
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 2310493203d3..b76bea6ab2d7 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -877,7 +877,6 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 		t7xx_dpmaif_clr_ip_busy_sts(&rxq->dpmaif_ctrl->hw_info);
 		t7xx_dpmaif_dlq_unmask_rx_done(&rxq->dpmaif_ctrl->hw_info, rxq->index);
 		t7xx_pci_enable_sleep(rxq->dpmaif_ctrl->t7xx_dev);
-		pm_runtime_mark_last_busy(rxq->dpmaif_ctrl->dev);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		atomic_set(&rxq->rx_processing, 0);
 	} else {
@@ -1078,7 +1077,6 @@ static void t7xx_dpmaif_bat_release_work(struct work_struct *work)
 	}
 
 	t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
-	pm_runtime_mark_last_busy(dpmaif_ctrl->dev);
 	pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
 }
 
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 8dab025a088a..236d632cf591 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -185,7 +185,6 @@ static void t7xx_dpmaif_tx_done(struct work_struct *work)
 	}
 
 	t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
-	pm_runtime_mark_last_busy(dpmaif_ctrl->dev);
 	pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
 }
 
@@ -468,7 +467,6 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 		t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
 		t7xx_do_tx_hw_push(dpmaif_ctrl);
 		t7xx_pci_enable_sleep(dpmaif_ctrl->t7xx_dev);
-		pm_runtime_mark_last_busy(dpmaif_ctrl->dev);
 		pm_runtime_put_autosuspend(dpmaif_ctrl->dev);
 	}
 
-- 
2.47.3


