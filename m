Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8B5E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2OnYbVM51vK7rXqzqPzMR2GLaEuYy0u3CF3iWkf7G0=; b=eVIZhMAcX5JQGVc5zr7I0YJ/JG
	jqBfr+7Z9lRczG0q92kehKCrMujzgjOT2sni6zIZylNLo0U442SPpmfqj4WmtYzwlcszeG8XPzjhI
	pMNdAvCgjo2XWRjHaCYsZj3UpPpzd07X8JjLFQe0VQiKS3I9WntLgNUvFxblv/+nrJRGVcBgI+SoM
	ApRHOYn2RyosdCscfRZOQHB4m0Obk+fHatMH5V3t1Kvh4SyFMLyfdqyLPYDAp04dTAtXuqFdQACWQ
	hMjmz164vtV9r1Gloz16Bc2gK5H5q8VLSRsOnP7a+sIndC5vI9okNNo16BRBjBPrrEL/eQpOiBY2E
	KUf4fdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCMQ-0000000GFjx-2U0P;
	Thu, 05 Dec 2024 13:57:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCKQ-0000000GF9h-4BxW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406938; x=1764942938;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=k2uyYdC8wALllRKsK0v7WW1DX6DY5ZwM7HHpcSIknjU=;
  b=Gms5C8p1gm4fElomnZfncbX5KWnT3eez1ADnMC8n/0ZitPHsVL+p7VpX
   4rA/cEJOvHlP7HSdD4+2GZ5lgM58xoDmnCd3vtEPIKOHD3wmTDfJvMuPT
   O6CBWRdYhTUbzjleMHDyZCW441D+8ojJLMsEy0BsYjmbwNjvDnsOLVYBa
   9tqiSha0YIi/TpCJynU2oT0btou3j5uB+C7CU4CrWKGod0NcmqsUktadW
   t2DqnFE1k1LkL/fADVaJHsiWbjArGakO7OJh1jDxgpNbGCwTEN/QPfeFs
   jhXCikKn+Zt1gEP8I4FcUPowIfokdgMT9gwXM8XLZcZKyl4QLaevWX/4o
   Q==;
X-CSE-ConnectionGUID: 7ioOcpSzQfuJnUZ0WQ6I1Q==
X-CSE-MsgGUID: 1CMFdT0eRHyhGeZ9reiYPQ==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="34869390"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:55:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:55:29 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:55:26 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Dec 2024 14:54:26 +0100
Subject: [PATCH net 3/5] net: sparx5: fix FDMA performance issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-sparx5-lan969x-misc-fixes-v1-3-575ff3d0b022@microchip.com>
References: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
In-Reply-To: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<arnd@arndb.de>, <jacob.e.keller@intel.com>,
	<Parthiban.Veerasooran@microchip.com>
CC: Calvin Owens <calvin@wbinvd.org>, Muhammad Usama Anjum
	<Usama.Anjum@collabora.com>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_055539_106276_3D3A12CA 
X-CRM114-Status: GOOD (  12.76  )
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

The FDMA handler is responsible for scheduling a NAPI poll, which will
eventually fetch RX packets from the FDMA queue. Currently, the FDMA
handler is run in a threaded context. For some reason, this kills
performance.  Admittedly, I did not do a thorough investigation to see
exactly what causes the issue, however, I noticed that in the other
driver utilizing the same FDMA engine, we run the FDMA handler in hard
IRQ context.

Fix this performance issue, by  running the FDMA handler in hard IRQ
context, not deferring any work to a thread.

Prior to this change, the RX UDP performance was:

Interval           Transfer     Bitrate         Jitter
0.00-10.20  sec    44.6 MBytes  36.7 Mbits/sec  0.027 ms

After this change, the rx UDP performance is:

Interval           Transfer     Bitrate         Jitter
0.00-9.12   sec    1.01 GBytes  953 Mbits/sec   0.020 ms

Fixes: 10615907e9b5 ("net: sparx5: switchdev: adding frame DMA functionality")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 2b58fcb9422e..f61aa15beab7 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -780,12 +780,11 @@ static int sparx5_start(struct sparx5 *sparx5)
 	err = -ENXIO;
 	if (sparx5->fdma_irq >= 0 && is_sparx5(sparx5)) {
 		if (GCB_CHIP_ID_REV_ID_GET(sparx5->chip_id) > 0)
-			err = devm_request_threaded_irq(sparx5->dev,
-							sparx5->fdma_irq,
-							NULL,
-							sparx5_fdma_handler,
-							IRQF_ONESHOT,
-							"sparx5-fdma", sparx5);
+			err = devm_request_irq(sparx5->dev,
+					       sparx5->fdma_irq,
+					       sparx5_fdma_handler,
+					       0,
+					       "sparx5-fdma", sparx5);
 		if (!err)
 			err = sparx5_fdma_start(sparx5);
 		if (err)

-- 
2.34.1


