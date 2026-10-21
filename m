Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA9606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jw3/0Tqf;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=XSX/CjyC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vskPYQTGSiRlfiG8NjtDrPBmdQ7Pt7Lx7mQfl+2YAU=; b=Jw3/0TqfpZiEyZXauKsMmhokro
	Ggv+K6JzpGPcQT5lfIPnEpSYk71a+hvgq/K8OURoiPo2QtpWc86I0v8JuJvi+wOGCZEUi4atQx8eZ
	Ip+JKcmOgDhyfouynEqXlgo8FCQ1ylCjuZB7nxYZnhKhpq/ig6FpoX0V0+E4zGjtE77jZ2sk6t2nQ
	zhGfX5FWr5AoyJfHN2Pei+ogQbZmQh95IP02/PQsZ/YMBTPMwWbrYSQMXJR6lNNkX2RcSaz51JB7j
	sEpkREXtIUw6jSLzH/E+rv16An1hYsT4ZPTQGzWNpau/8G/pFIWJ+XDQMR+uAtHIruSA7PGN9Vw3j
	xHW9PFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdPp-0000000Cse2-2Y5P;
	Wed, 21 Oct 2026 21:00:05 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdPn-0000000CsdL-2dR8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792616403; x=1824152403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1vskPYQTGSiRlfiG8NjtDrPBmdQ7Pt7Lx7mQfl+2YAU=;
  b=XSX/CjyCB/vkTfGLQIbwtwNArWf8peEbtJ5BzO9+oMuold8nRGRr/phn
   GHcn2Zz0I47LTeQTzk3n3tekobWWJRKXrS7WRkBhCM0EVhGgdurCvTKuv
   13uSSs81SQgyFKg3sw1KeNWe0fy9S2XUYNpESc9xDf0JskmjIDkl04Za2
   WvJBvpFCFyUD2+uTp/6RM23Ykl+HxLHxlFQ3esbd6GV67nBXMnrqqbqpw
   JQjClphEolMK4J1b6ZbG/CHuJ3Z7kShKpW/oHOxh2Bd2Qsy8RK50WvdM8
   D/rjfTRMmpMwNpHe1ENYxS0YhJyCY/zJl6hxhDGCHmQ2bYwHVmgmi6oqg
   w==;
X-CSE-ConnectionGUID: vLrZ2WaFR1aYiCQMpY5b0w==
X-CSE-MsgGUID: dQDwu3MKT3O/yvN3/BXiWw==
X-IronPort-AV: E=Sophos;i="6.27,170,1787011200"; 
   d="scan'208";a="31914416"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 21:00:03 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:30807]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.51.105:2525] with esmtp (Farcaster)
 id 2652e6fa-dded-4dcd-aa2f-370e1df2b89e; Wed, 21 Oct 2026 21:00:02 +0000 (UTC)
X-Farcaster-Flow-ID: 2652e6fa-dded-4dcd-aa2f-370e1df2b89e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 21 Oct 2026 21:00:02 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Wed, 21 Oct 2026
 21:00:02 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>
CC: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH 1/3] can: ctucanfd: enable NAPI before starting the controller
Date: Wed, 21 Oct 2026 20:59:22 +0000
Message-ID: <20261021205924.2538511-2-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021205924.2538511-1-patrzhan@amazon.com>
References: <20261021205924.2538511-1-patrzhan@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_140003_718038_2453551A 
X-CRM114-Status: GOOD (  14.41  )
X-Spam-Score: -11.9 (-----------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ctucan_open() starts the controller and unmasks RBNEI in
ctucan_chip_start(), prints "ctu_can_fd device registered", and only
then calls napi_enable(). A frame that arrives in that window raises
RBNEI. ctucan_interrupt() masks RBNEI and calls napi_schedule(). NAPI is
still disabled, so napi_schedule_prep() finds NAPI_STATE_SCHED set and
the schedule is dropped. napi_enable() then clears SCHED without
scheduling anything. Only ctucan_rx_poll() unmasks RBNEI again, and it
never runs. The interface receives nothing until the next close.
Transmit still works. The RX FIFO fills up and the core sets DOR, but
the overrun is only accounted in ctucan_rx_poll(), so rx_errors and
rx_over_errors stay at zero and nothing is logged. Every re-open (ip
link down/up, a driver rebind) runs the same race again.

The netdev_info() in the window makes it much wider on a slow console.
This can be reproduced by sending continuous traffic with cangen from
another node and repeating "ip link set down/up" on the test device.

Enable NAPI before the controller starts, so that an early RX interrupt
can schedule the poll. NAPI can be enabled while the controller is in
reset, because nothing schedules it until an interrupt arrives. If
ctucan_chip_start() fails, disable NAPI again. Otherwise the next open
would call napi_enable() on an already enabled instance and trip the
BUG_ON() in napi_enable_locked().

Tested on QEMU with the ctucan_pci device.

Fixes: 2dcb8e8782d8 ("can: ctucanfd: add support for CTU CAN FD open-source IP core - bus independent part.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Patrick Zhang <patrzhan@amazon.com>
---
 drivers/net/can/ctucanfd/ctucanfd_base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c b/drivers/net/can/ctucanfd/ctucanfd_base.c
index 07d4aa43c..82bf6c645 100644
--- a/drivers/net/can/ctucanfd/ctucanfd_base.c
+++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
@@ -1231,6 +1231,10 @@ static int ctucan_open(struct net_device *ndev)
 		goto err_irq;
 	}
 
+	/* Keep before ctucan_chip_start(): the ISR masks RBNEI and only the
+	 * poll unmasks it.
+	 */
+	napi_enable(&priv->napi);
 	ret = ctucan_chip_start(ndev);
 	if (ret < 0) {
 		netdev_err(ndev, "ctucan_chip_start failed!\n");
@@ -1238,12 +1242,12 @@ static int ctucan_open(struct net_device *ndev)
 	}
 
 	netdev_info(ndev, "ctu_can_fd device registered\n");
-	napi_enable(&priv->napi);
 	netif_start_queue(ndev);
 
 	return 0;
 
 err_chip_start:
+	napi_disable(&priv->napi);
 	free_irq(ndev->irq, ndev);
 err_irq:
 	close_candev(ndev);

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.50.1


