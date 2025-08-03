Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B602C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 18:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nAqOrU8mC0Z3rvF/se+5QTvub9P8PeKySL6x0gt1KT4=; b=cTX060gz201kQ4Kbfnyo7UPKz3
	6XmEJUsQzuCXMy31QxX/rAeCFsF7LmPPg5kRuERtWq2xJ+KbAoTkv40KzZPbo/jRFLnS3qTpPmETk
	resUgeP8WjorFfuFvEffwyzJyYqGI3J2uFHf9Ats6CrQJ/Gr1dug0dPcJLzokyEdrNB9S878oZu6f
	x2NcyTVgFJCsWx0Rg3n0+Q1Ri/8gq1p9S02GjBl93iJxwNHmrw9nTFJ/ajzXZzAVbtn++6OL7oujM
	Q0gB3EmkVlTI+/wgblWlRlJndEkLpbnWkC3msj4KbIF020xGNVa5eb+EOf1gc+dxxvpzeTRTFERUk
	FujkIItQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uid5f-00000008w6Z-2gzv;
	Sun, 03 Aug 2025 18:05:47 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uid36-00000008vv8-00Pr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 18:03:09 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 573I2NYB3665805;
	Sun, 3 Aug 2025 13:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754244143;
	bh=nAqOrU8mC0Z3rvF/se+5QTvub9P8PeKySL6x0gt1KT4=;
	h=From:To:CC:Subject:Date;
	b=vNhKEvApxFut0oTKQW0GFUaQpvUcq70BEJzyqpq+iAvtV0UTsLREnvYRWq7pyQZrA
	 Gs1gW6iCLmbPh2/5osMbTkZGnDzKaEZngfI8GxIIxXQgatUVAEOYJbTygKJaOAowNl
	 wt8jbmoqY/1oZje8oTMjhTM5Mk1hcSFHcXHS52lk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 573I2N3e2265990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 3 Aug 2025 13:02:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 3
 Aug 2025 13:02:22 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 3 Aug 2025 13:02:22 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 573I2MMp2180903;
	Sun, 3 Aug 2025 13:02:22 -0500
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 573I2KpU005223;
	Sun, 3 Aug 2025 13:02:21 -0500
From: Meghana Malladi <m-malladi@ti.com>
To: <namcao@linutronix.de>, <r-gunasekaran@ti.com>, <jacob.e.keller@intel.com>,
        <m-malladi@ti.com>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
        <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
        <pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
        <davem@davemloft.net>, <andrew+netdev@lunn.ch>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH net v2] net: ti: icssg-prueth: Fix skb handling for XDP_PASS
Date: Sun, 3 Aug 2025 23:32:16 +0530
Message-ID: <20250803180216.3569139-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_110308_175386_514A1AF4 
X-CRM114-Status: GOOD (  13.03  )
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

emac_rx_packet() is a common function for handling traffic
for both xdp and non-xdp use cases. Use common logic for
handling skb with or without xdp to prevent any incorrect
packet processing. This patch fixes ping working with
XDP_PASS for icssg driver.

Fixes: 62aa3246f4623 ("net: ti: icssg-prueth: Add XDP support")
Signed-off-by: Meghana Malladi <m-malladi@ti.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---

v2-v1:
- Collected RB tag from Jacob Keller <jacob.e.keller@intel.com>
- Populated headroom from xdp buffer instead of hardcoding as
  pointed out by Jakub Kicinski <kuba@kernel.org>

 drivers/net/ethernet/ti/icssg/icssg_common.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 12f25cec6255..57e5f1c88f50 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -706,9 +706,9 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 	struct page_pool *pool;
 	struct sk_buff *skb;
 	struct xdp_buff xdp;
+	int headroom, ret;
 	u32 *psdata;
 	void *pa;
-	int ret;
 
 	*xdp_state = 0;
 	pool = rx_chn->pg_pool;
@@ -757,22 +757,23 @@ static int emac_rx_packet(struct prueth_emac *emac, u32 flow_id, u32 *xdp_state)
 		xdp_prepare_buff(&xdp, pa, PRUETH_HEADROOM, pkt_len, false);
 
 		*xdp_state = emac_run_xdp(emac, &xdp, page, &pkt_len);
-		if (*xdp_state == ICSSG_XDP_PASS)
-			skb = xdp_build_skb_from_buff(&xdp);
-		else
+		if (*xdp_state != ICSSG_XDP_PASS)
 			goto requeue;
+		headroom = xdp.data - xdp.data_hard_start;
+		pkt_len = xdp.data_end - xdp.data;
 	} else {
-		/* prepare skb and send to n/w stack */
-		skb = napi_build_skb(pa, PAGE_SIZE);
+		headroom = PRUETH_HEADROOM;
 	}
 
+	/* prepare skb and send to n/w stack */
+	skb = napi_build_skb(pa, PAGE_SIZE);
 	if (!skb) {
 		ndev->stats.rx_dropped++;
 		page_pool_recycle_direct(pool, page);
 		goto requeue;
 	}
 
-	skb_reserve(skb, PRUETH_HEADROOM);
+	skb_reserve(skb, headroom);
 	skb_put(skb, pkt_len);
 	skb->dev = ndev;
 

base-commit: 759dfc7d04bab1b0b86113f1164dc1fec192b859
-- 
2.43.0


