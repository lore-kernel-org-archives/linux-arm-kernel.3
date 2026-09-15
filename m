Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D8CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IK3cIv3eA9Wbpi6yK7r4L1UxbUiz8LF7wr+ECYNcigM=; b=UzfrXXeIRV1JYnyH8g/8EBqIDz
	o56dCQegrBx+gK4lSAY7PU2UtrkxrpPMwzczq/qoByEQwfe5PQUO5ztlgp/Rqsw+G/o5DJ/+p845X
	3lW/xwBJJ49JSrd8spnFvxyROwjn1wguUYSPjtvN3VTqnwtcFVchFzomvAu5LksPKBnvrYAFlJ4BD
	avaW/XQAaB8Wej9BWkYftJOEs/1ZpxYpDUNnXLQOyEtQpOgyva6lBUGmyLTsWW3B6uZeuvMa8RL1i
	t5pOSRcPD94OWnu7MjG8HtNfsZFpvuc5Q0+RZrRSp7H2vVHROlr09o0I+KVWUjUgKqExETHe9IP6O
	vTZLGUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N4x-00000005OnK-0emY;
	Tue, 15 Sep 2026 06:55:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N4t-00000005Ole-3l0r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:55:41 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so11744675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455338; x=1790060138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IK3cIv3eA9Wbpi6yK7r4L1UxbUiz8LF7wr+ECYNcigM=;
        b=KDSSdcAvjzGBP6PSgDt5uAyyFvR4A1IcVgd4c6YV534GCuvtG8gtRg2c3XYEOkgVsW
         v/uEgG0tYnMzfQfMqhYHaRuY1azSIhWbP4nygYq9A9w75EgK6LRBbjBF5JK4REmu77O1
         x8AGPmtMJyxwOpgIHIXCwIQn0cFPiasHxTXtGtcov5xI3+6YAYGOGacnrs8D3o692PX3
         JZzYkOS59DJ6VPgHoEh5lRJeY47rDY1fcRsvsYTKiFDeyaUST4rfQYBet5ZRnb7bEPAD
         QUrbE7HToukYBkCB0lWW5lq2ZzOZeEgjaazIkSrn3K/1oMgATuWs3mq9ibbzphgisxkm
         FPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455338; x=1790060138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IK3cIv3eA9Wbpi6yK7r4L1UxbUiz8LF7wr+ECYNcigM=;
        b=KwIt+IM38BDlDB0ymMwaAphcm8xESIDjcN9CfQLrbms6flMvfazOy4zzV7PlWeJWU/
         izcyhd+0JSEg34jHW5VWwxjlen/Vkt+qrdPWA0oxIyUCey6qt9uy3SnIFC65GgrDXUNa
         8/UxYvIm2Mbqd/4+e0J1tsnbsjPf6v8SJS8S4PGKCz5f5oqvXVd6BUZ/uE8XG0PdRqGt
         Me1ehoIdnqo7UmTzCMciS3gKR/a7+S6Em37Tt/vBKCeXAuPhkpTzgjYaUuC5m8p68nG1
         WfEVIAQ9omLu1j3VNcutVO94LOG9TALjGIuWBpYVCLAi55ADT6lkfzBSLla6fAEwWkMt
         YZFA==
X-Forwarded-Encrypted: i=1; AKwUvBw9J2W5jDZ1ImBok0af9Oj3HlEDejiSqo155NOOxAdwlDaZer/qiARjv9fFIqsASiZQNovRGHJL5GRe+8CxVQhv@lists.infradead.org
X-Gm-Message-State: AFuF++l08r/iPnyj+bMDYmYQw+hsa+IAaQeQaNcUhjPTD5zrZjYGZX9r
	/ZssggX+E7sO0BHIJ7tpfIGALNaHDn1UkhIM/F5Xac3mhNDQepNk5HXR
X-Gm-Gg: AYBFou1fWd+ITQLICKb7wkZa2bPVVhI/Y99fSXSlUspOvT4OnvzaJsa1lsfHd47rQvX
	Pttmu36w5q6TjhxpiSgYxqkE/Hgj3OeqxCAkcQuvEojSFfBzqfMcwdTmArb/vMsoPpfqyMRAs7o
	8UxTflzlSAzaHW5jmK4sV4xg1qmT1ML8daCo05pG2LAVjkQFpOeaUK+Kg3wSCyfMaiBqxqP5Bxt
	QZU7Upv39k53CJ8P17Bgsz0KoEFE7f9CEs06VlX4skmnyX7pzPTOflblbjIGR/rgMdBYPD1Bajl
	Hq4o896YZcS6GhLdVDUpCVaSrDXBQvFMHaV8JTzRFMWr+9j1D7eD9Q5XuCfA9nAqHWMEtt/fx2e
	uZddghMOKAPE+XoAhpXzwzNFF98P9W3TX7dYh7Z8rii1G2lZmcP0EsKor/Y/k/VIDr9mSVJcLeH
	ezkZBtjWbF6IsCNPLeRK0dSvHjl9QcLMmy1Ldh13A/94HVMkBMwNcuBR8c8sTuQ5k2v/krPcxGq
	4YeMOQRKYGY4Yy3ZwQNVgD9v1paOg5oG/p0v1mn
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr73955375e9.19.1789455337805;
        Mon, 14 Sep 2026 23:55:37 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm46002775e9.4.2026.09.14.23.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:55:37 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next] net: axienet: add a TX timeout handler to recover a lost DMA interrupt
Date: Tue, 15 Sep 2026 09:55:34 +0300
Message-ID: <20260915065534.102249-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_235540_473662_CECD0096 
X-CRM114-Status: GOOD (  22.09  )
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

axienet_dma_err_handler() is the driver's only reset path, and the only
two places that schedule it are axienet_tx_irq() and axienet_rx_irq(),
both on the XAXIDMA_IRQ_ERROR_MASK branch.  Every route into recovery
therefore depends on a DMA interrupt being delivered.

If a completion interrupt is lost the queue stops making progress with
descriptors unreclaimed, and nothing ever schedules the reset: the error
branch cannot run because no interrupt arrives, and NAPI is not polled
because it is only scheduled from those same handlers.  The interface
stays wedged until the driver is unloaded.

Add an .ndo_tx_timeout handler so the netdev watchdog provides a route
into the existing reset path that does not depend on the interrupt that
was lost.  The handler only queues the work; axienet_dma_err_handler()
then performs the reset in process context, as it already does for the
error-interrupt case.

.ndo_tx_timeout is added to axienet_netdev_ops alone.  On the dmaengine
path lp->dma_err_task is never initialised - INIT_WORK() for it lives in
axienet_init_legacy_dma() - so scheduling it there would be a bug, and
watchdog_timeo is set in the same branch for that reason.

Tested on a Xilinx AXI Ethernet MAC by clearing PCI_MSIX_FLAGS_ENABLE
underneath a running interface to drop completion interrupts: without
this patch the TX queue stalls permanently, with it the watchdog fires
and the interface resumes passing traffic.

Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..b5927e979c34 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -55,6 +55,10 @@
 #define DMA_NUM_APP_WORDS		5
 #define LEN_APP				4
 #define RX_BUF_NUM_DEFAULT		128
+/* Well above any legitimate TX completion delay, including the worst case
+ * allowed by the DMA interrupt coalescing settings.
+ */
+#define AXIENET_TX_TIMEOUT		(5 * HZ)
 
 /* Must be shorter than length of ethtool_drvinfo.driver field to fit */
 #define DRIVER_NAME		"xaxienet"
@@ -1884,6 +1888,30 @@ axienet_get_stats64(struct net_device *dev, struct rtnl_link_stats64 *stats)
 	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
 }
 
+/**
+ * axienet_tx_timeout - Driver TX timeout callback
+ * @ndev:	Pointer to net_device structure
+ * @txqueue:	Index of the transmit queue that stalled
+ *
+ * Called by the netdev watchdog when a transmit queue has made no progress for
+ * @ndev->watchdog_timeo.  axienet_dma_err_handler() is the driver's only reset
+ * path, and it is otherwise scheduled solely from axienet_tx_irq() and
+ * axienet_rx_irq() - so a completion interrupt that is never delivered leaves
+ * the queue stopped with descriptors unreclaimed and no way back short of
+ * unloading the driver.  Schedule the reset from here as well, so a lost
+ * interrupt is recoverable.
+ *
+ * This runs from a timer, so it only queues the work; the reset itself happens
+ * in process context in axienet_dma_err_handler().
+ */
+static void axienet_tx_timeout(struct net_device *ndev, unsigned int txqueue)
+{
+	struct axienet_local *lp = netdev_priv(ndev);
+
+	netdev_err(ndev, "TX queue %u stalled, resetting DMA\n", txqueue);
+	schedule_work(&lp->dma_err_task);
+}
+
 static const struct net_device_ops axienet_netdev_ops = {
 	.ndo_open = axienet_open,
 	.ndo_stop = axienet_stop,
@@ -1894,6 +1922,7 @@ static const struct net_device_ops axienet_netdev_ops = {
 	.ndo_validate_addr = eth_validate_addr,
 	.ndo_eth_ioctl = axienet_ioctl,
 	.ndo_set_rx_mode = axienet_set_multicast_list,
+	.ndo_tx_timeout = axienet_tx_timeout,
 #ifdef CONFIG_NET_POLL_CONTROLLER
 	.ndo_poll_controller = axienet_poll_controller,
 #endif
@@ -3054,6 +3083,10 @@ static int axienet_probe(struct platform_device *pdev)
 	} else {
 		ndev->netdev_ops = &axienet_netdev_ops;
 		ndev->ethtool_ops = &axienet_ethtool_ops;
+		/* netdev_watchdog_up() only arms the TX watchdog when
+		 * .ndo_tx_timeout is set, which is the legacy DMA path alone.
+		 */
+		ndev->watchdog_timeo = AXIENET_TX_TIMEOUT;
 	}
 	/* Check for Ethernet core IRQ (optional) */
 	if (lp->eth_irq < 0)
-- 
2.47.0


