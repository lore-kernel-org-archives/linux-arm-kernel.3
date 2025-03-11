Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E2DC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 06:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GZ7cz/UX3l7TXfpyRAthti0yRRZUSdIt8pbZp1M5Mqk=; b=g8UqZYGms6nsTv+K6F9ieKJ9FK
	Fcmzn/dMslwnRvnD55naQL66V+voirmfnfL+dh2D//UMoPXgeHcFEQID3CZMQHhCoIClp3yE6DuJP
	ELmGM9qBeqhH9s1lDzQbL+apPNmm8EIUTdfaVwj/nqnyqzoJfGI6kQDX9fE4hodckXIgor7jGkA7y
	rYprV6vOK8LyXWmQKvyw8RqWfviM+RT4jmM3VP7EqT88ScDs8pQD0nFQAr52vG5fbycBd9ZcQIP3C
	mLN3+p8v6DCTMgBMd/NjbBLf9XszIJkZW8kRJiyy0qmh5hTzPf7IzAlOmQDUAqMhIO96qj9uTm9ei
	3XerBUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trt2S-00000004kbK-0mo2;
	Tue, 11 Mar 2025 06:24:28 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trsqz-00000004j6T-0O5e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 06:12:38 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52B6CKX81109371
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 01:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741673540;
	bh=GZ7cz/UX3l7TXfpyRAthti0yRRZUSdIt8pbZp1M5Mqk=;
	h=From:To:CC:Subject:Date;
	b=NYJ+Bmq3tpkEV3S65WZUNaUYRse1gfb3BmxL35hNSf7fQO5SIkW+yVCdPCe1ZvQz4
	 Lyy2j2cDYkPPfhwI8IlIOWFLr90avwp1TA0i/H8mgnyNqey4tdug1oC9LeCpba6vQj
	 d4EKqV4LjFpNQuDZlOpbYufsjEXzdQVFdKwL4NKk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52B6CKeI014362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 01:12:20 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 01:12:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 01:12:20 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B6CF2t042003;
	Tue, 11 Mar 2025 01:12:16 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
        <kuba@kernel.org>, <pabeni@redhat.com>, <rogerq@kernel.org>,
        <horms@kernel.org>, <alexander.sverdlin@siemens.com>,
        <dan.carpenter@linaro.org>, <jpanis@baylibre.com>
CC: <vigneshr@ti.com>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH net] net: ethernet: ti: am65-cpsw: Fix NAPI registration sequence
Date: Tue, 11 Mar 2025 11:42:14 +0530
Message-ID: <20250311061214.4111634-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_231237_297502_E5D39DCC 
X-CRM114-Status: GOOD (  10.54  )
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

From: Vignesh Raghavendra <vigneshr@ti.com>

Registering the interrupts for TX or RX DMA Channels prior to registering
their respective NAPI callbacks can result in a NULL pointer dereference.
This is seen in practice as a random occurrence since it depends on the
randomness associated with the generation of traffic by Linux and the
reception of traffic from the wire.

Fixes: 681eb2beb3ef ("net: ethernet: ti: am65-cpsw: ensure proper channel cleanup in error path")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
4d872d51bc9d Merge tag 'x86-urgent-2025-03-10' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
of Mainline Linux.

Regards,
Siddharth.

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 2806238629f8..d5291281c781 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2314,6 +2314,9 @@ static int am65_cpsw_nuss_ndev_add_tx_napi(struct am65_cpsw_common *common)
 		hrtimer_init(&tx_chn->tx_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
 		tx_chn->tx_hrtimer.function = &am65_cpsw_nuss_tx_timer_callback;
 
+		netif_napi_add_tx(common->dma_ndev, &tx_chn->napi_tx,
+				  am65_cpsw_nuss_tx_poll);
+
 		ret = devm_request_irq(dev, tx_chn->irq,
 				       am65_cpsw_nuss_tx_irq,
 				       IRQF_TRIGGER_HIGH,
@@ -2323,9 +2326,6 @@ static int am65_cpsw_nuss_ndev_add_tx_napi(struct am65_cpsw_common *common)
 				tx_chn->id, tx_chn->irq, ret);
 			goto err;
 		}
-
-		netif_napi_add_tx(common->dma_ndev, &tx_chn->napi_tx,
-				  am65_cpsw_nuss_tx_poll);
 	}
 
 	return 0;
@@ -2569,6 +2569,9 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 			     HRTIMER_MODE_REL_PINNED);
 		flow->rx_hrtimer.function = &am65_cpsw_nuss_rx_timer_callback;
 
+		netif_napi_add(common->dma_ndev, &flow->napi_rx,
+			       am65_cpsw_nuss_rx_poll);
+
 		ret = devm_request_irq(dev, flow->irq,
 				       am65_cpsw_nuss_rx_irq,
 				       IRQF_TRIGGER_HIGH,
@@ -2579,9 +2582,6 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cpsw_common *common)
 			flow->irq = -EINVAL;
 			goto err_flow;
 		}
-
-		netif_napi_add(common->dma_ndev, &flow->napi_rx,
-			       am65_cpsw_nuss_rx_poll);
 	}
 
 	/* setup classifier to route priorities to flows */
-- 
2.34.1


