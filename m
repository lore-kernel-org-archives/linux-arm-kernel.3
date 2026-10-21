Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C79606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 21:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Isedgt0;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=gnRdnn2d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SoBYLzK+ZdLfi5BCMX08p53Wh7vlbOFUlLFSPM85IU=; b=4Isedgt0PfK3Chglv9gDpyGY8n
	8zrJW9aoFDiI+K496+kfHhdDZP4ZaUWFHU9rLNRJpoeny6xSs3boBO1Vv1EPW6Z6YpexO6sc0gI6G
	o2UW55OUcgans0b6YVImwu+E3aMVSfVUdHd91W3TmH57+hYP7FXDxdK9wTbHvXic97QwiR3Ca5Mf9
	9BoSlfyZ9OCICFGWDUvgezOiytS2vg7TFNIgUh9m15HN8TmIoDBg6A9eFKdGMpMhmkuSrcKSchOhj
	JvbPqaSA3ZkJs7pE/9Bsh7jTkAF7FUvN2USBdQ1Yy27f0yUwlnUH6XoKyuXwL1/EVnCjYDotEB+rC
	M92cKnBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdQc-0000000Cstc-3rJZ;
	Wed, 21 Oct 2026 21:00:55 +0000
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.12.53.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJdQX-0000000CsrP-1Pk0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 21:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792616449; x=1824152449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5SoBYLzK+ZdLfi5BCMX08p53Wh7vlbOFUlLFSPM85IU=;
  b=gnRdnn2dw0XHqDOUPj3K7NRvLpJbqtjLM7X2QIECpQZNm+1sPfeVTOkP
   9f7u74nziCTuJZ7hmZ5VkPFRjLljo7Rbz3VewooYvrq2FhRSbqfuHRmIZ
   LOX0mGyhOrB7WSem37YNsdEEzz4kF9knVvJa9yC2t5JOAX36ztvqrTvFO
   Q0NNPu66dZWSOQt8Q5XIzU8RxAUR8RRm1SdPedzXy9EUhTcRieKCLzM/U
   pBxJJBkPcqBggqv74/hSrtalSeS6A9KNbtVZSxemzcFzQAgYjXlfUGsX3
   GtYThw3LnX0m6RUZWgPtvVvBLRJiDxZ5Hw4F1XbL2kO/zqcAdQ/KNe8Mz
   w==;
X-CSE-ConnectionGUID: 4/rpq61JRLqO9NOaBAgw+Q==
X-CSE-MsgGUID: sYrwamOUTHyVUZD/vCqM3w==
X-IronPort-AV: E=Sophos;i="6.27,170,1787011200"; 
   d="scan'208";a="31778176"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 21:00:47 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:13056]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.190:2525] with esmtp (Farcaster)
 id d86c36b0-f405-4590-bf50-a87d9474e8c4; Wed, 21 Oct 2026 21:00:47 +0000 (UTC)
X-Farcaster-Flow-ID: d86c36b0-f405-4590-bf50-a87d9474e8c4
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 21 Oct 2026 21:00:46 +0000
Received: from dev-dsk-patrzhan-2a-52a3f46b.us-west-2.amazon.com
 (172.22.91.11) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53; Wed, 21 Oct 2026
 21:00:46 +0000
From: Patrick Zhang <patrzhan@amazon.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol@kernel.org>, <linux-can@vger.kernel.org>
CC: Pavel Pisa <pisa@cmp.felk.cvut.cz>, Ondrej Ille <ondrej.ille@gmail.com>,
	Harini T <harini.t@amd.com>, Michal Simek <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] can: ifi_canfd: enable NAPI before starting the controller
Date: Wed, 21 Oct 2026 20:59:24 +0000
Message-ID: <20261021205924.2538511-4-patrzhan@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021205924.2538511-1-patrzhan@amazon.com>
References: <20261021205924.2538511-1-patrzhan@amazon.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_140051_658410_533AC48D 
X-CRM114-Status: GOOD (  14.67  )
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

ifi_canfd_open() calls ifi_canfd_start(), which unmasks the interrupts
in IFI_CANFD_IRQMASK and then enables the controller through
IFI_CANFD_STCMD, and only then calls napi_enable(). A frame that
arrives in that window raises RXFIFO_NEMPTY. ifi_canfd_isr() masks all
interrupts with ifi_canfd_irq_enable(ndev, 0) and calls
napi_schedule(). NAPI is still disabled, so napi_schedule_prep() finds
NAPI_STATE_SCHED set and the schedule is dropped. Only ifi_canfd_poll()
unmasks the interrupts again, and it never runs. From then on the
interface receives nothing. ifi_canfd_start_xmit() stops the queue
after every frame and relies on the TX FIFO interrupt to wake it, and
that interrupt is masked too, so transmit stops after the next frame.
The stall lasts until the next close. Every re-open runs the same race
again.

Enable NAPI before the controller starts, so that an early RX interrupt
can schedule the poll. NAPI can be enabled while the controller is in
reset, because nothing schedules it until an interrupt arrives.
ifi_canfd_start() cannot fail, so no error path changes.

This is the same race as in ctucanfd and xilinx_can, fixed by the
previous patches. I do not have IFI CAN FD hardware, so this change is
compile tested only and the failure sequence is taken from the code.

Fixes: 0c4d9c94a130 ("can: ifi: Add IFI CANFD IP support")
Assisted-by: LLM
Signed-off-by: Patrick Zhang <patrzhan@amazon.com>
---
 drivers/net/can/ifi_canfd/ifi_canfd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/ifi_canfd/ifi_canfd.c b/drivers/net/can/ifi_canfd/ifi_canfd.c
index 0f83335e4..feb738eb0 100644
--- a/drivers/net/can/ifi_canfd/ifi_canfd.c
+++ b/drivers/net/can/ifi_canfd/ifi_canfd.c
@@ -846,9 +846,12 @@ static int ifi_canfd_open(struct net_device *ndev)
 		goto err_irq;
 	}
 
+	/* Keep before ifi_canfd_start(): the ISR masks the interrupts and only
+	 * the poll unmasks them.
+	 */
+	napi_enable(&priv->napi);
 	ifi_canfd_start(ndev);
 
-	napi_enable(&priv->napi);
 	netif_start_queue(ndev);
 
 	return 0;
-- 
2.50.1


