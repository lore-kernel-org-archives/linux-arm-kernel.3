Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CD606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gz+ygf5c;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=R7YSMykC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XQwmMGo6QxiVGI7PkR9uzdzIsrnhm9x0tfacxXI/5Zw=; b=Gz+ygf5cQEB3aH19f6KKF+rvzH
	CsiHAb3w4LhM7xYbt8vN6zrcF8PhnW/5B9lMNn8YJVUjggL3KOaFNcoBTfonAfswhnLvk9yPS+2zd
	+5V3VfGmwBybcr89Hch1VB08bZ0D5pmR4D+g+ezR4L9SsXLQY5Gz81WFIm25WMJxEunygFIHXtBO1
	3O6uBwskE+JQWlX9jCOlQan9XPDAO1/ahMbBAPh1W3qVYrgJwth0C+ZGmjxiv9T/WtN+dAl6LaQMl
	/sTSsc67JceKOmLcNS9AyHzaBANfD4pPz2g9hB2QWAQwgrdFjD17L3dkEEHDojZr0m3gTqA52of4v
	VaR7djYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO15F-00000000bOm-0CgS;
	Mon, 02 Nov 2026 23:04:57 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO156-00000000bNf-0SIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793660688; x=1825196688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XQwmMGo6QxiVGI7PkR9uzdzIsrnhm9x0tfacxXI/5Zw=;
  b=R7YSMykCzzKxjBT8hgI8GrzBDKAR0xdNawXD/LX3oW08OzQH/7It/RHW
   X/R/oEGF6BMC1ubaAFBLTk6sWEWT0diJjDBqzofK5fq2nlL8uqa8LJ2Tj
   zyWignSlxmWct0eyF/QeIgOOTHz3X1UdYeLWlkFIj+lR9oPwaPabkh+Xf
   A+0aHlXCAEVoJbFjS4K6ZaLKDCOHBUfZ+p0jauHW4kE+JLWbmBzexJRi6
   k6Ksoo3kH1mM8jg5HhDE2GhWClELLBsHmQOdHDnG97QK/nTljgfGSUyWT
   MxDwA0tKUa2nPZZSU9JdO8GAahnSXJmvm5Vt5ei8zWD0fajVGAIoAdZ9U
   Q==;
X-CSE-ConnectionGUID: UvCHpBAnQGanjYMLbQxFKA==
X-CSE-MsgGUID: 63+Uxh43R/qOlB8fgnQ0OQ==
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208";a="32901025"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 23:04:46 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:4186]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.52.149:2525] with esmtp (Farcaster)
 id b1a9aaf3-301d-46ee-9a86-6cdc76e1aa68; Mon, 2 Nov 2026 23:04:45 +0000 (UTC)
X-Farcaster-Flow-ID: b1a9aaf3-301d-46ee-9a86-6cdc76e1aa68
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 2 Nov 2026 23:04:45 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Mon, 2 Nov 2026
 23:04:45 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>
CC: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH v3 2/2] can: xilinx_can: enable NAPI before starting the controller
Date: Mon, 2 Nov 2026 23:03:39 +0000
Message-ID: <20261102230339.1260288-3-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102230339.1260288-1-patrzhan@amazon.com>
References: <20261102230339.1260288-1-patrzhan@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_150454_402363_569B29E5 
X-CRM114-Status: GOOD (  15.65  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xcan_open() calls xcan_chip_start(), which writes XCAN_IER_OFFSET to
unmask the RX interrupts and then sets XCAN_SRR_CEN_MASK to enable the
controller, and only then calls napi_enable(). A frame that arrives in
that window raises the RX interrupt. xcan_interrupt() clears the RX
bits in XCAN_IER_OFFSET and calls napi_schedule(). NAPI is still
disabled, so napi_schedule_prep() finds NAPI_STATE_SCHED set and the
schedule is dropped. Only xcan_rx_poll() unmasks RX again, and it never
runs. The interface receives no data frames until the next close.
Transmit still works. The RX overflow interrupt stays enabled, so once
the RX FIFO fills, xcan_err_interrupt() counts rx_over_errors and
reports overflow error frames, but nothing reads the FIFO. Every
re-open (ip link down/up, a driver rebind) runs the same race again.

The window is only the tail of xcan_chip_start(), so the failure is
rare. Adding an mdelay(50) at the end of xcan_chip_start() makes it
reproducible with continuous traffic from another node and a single
"ip link set down/up" on the test device.

Enable NAPI before the controller starts, so that an early RX interrupt
can schedule the poll. NAPI can be enabled while the controller is in
reset, because nothing schedules it until an interrupt arrives. If
xcan_chip_start() fails, disable NAPI again. Otherwise the next open
would call napi_enable() on an already enabled instance and trip the
BUG_ON() in napi_enable_locked().

This is the same race as in "can: ctucanfd: enable NAPI before starting
the controller".

Tested on a Versal board.

Fixes: b1201e44f50b ("can: xilinx CAN controller support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Patrick Zhang <patrzhan@amazon.com>
Reviewed-by: Harini T <harini.t@amd.com>
---

Notes:
    v3:
    - Add Reviewed-by from Harini
    - v2: https://lore.kernel.org/r/20261030233330.3483988-3-patrzhan@amazon.com
    
    v2:
    - Correct the commit message: the RX overflow interrupt stays enabled
      during the stall, so rx_over_errors is counted once the FIFO fills
    - Name the ctucanfd fix by subject instead of "the previous patch"
    - v1: https://lore.kernel.org/r/20261021205924.2538511-3-patrzhan@amazon.com

 drivers/net/can/xilinx_can.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/xilinx_can.c b/drivers/net/can/xilinx_can.c
index 43d7f2282..5c2412bf9 100644
--- a/drivers/net/can/xilinx_can.c
+++ b/drivers/net/can/xilinx_can.c
@@ -1570,18 +1570,22 @@ static int xcan_open(struct net_device *ndev)
 	if (ret)
 		goto err_irq;
 
+	/* Keep before xcan_chip_start(): the ISR masks RX interrupts and only
+	 * the poll unmasks them.
+	 */
+	napi_enable(&priv->napi);
 	ret = xcan_chip_start(ndev);
 	if (ret < 0) {
 		netdev_err(ndev, "xcan_chip_start failed!\n");
 		goto err_candev;
 	}
 
-	napi_enable(&priv->napi);
 	netif_start_queue(ndev);
 
 	return 0;
 
 err_candev:
+	napi_disable(&priv->napi);
 	close_candev(ndev);
 err_irq:
 	free_irq(ndev->irq, ndev);
-- 
2.50.1


