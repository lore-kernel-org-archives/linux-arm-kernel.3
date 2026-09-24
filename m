Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C10C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gII017pjaiWPy7eQPcmYTXbw9whvLxZWHojjvAPZMqM=; b=2lqwjakSjgTxrY5Jb67WZkg5U+
	mVBs0CZoHiLQ/5vRQYMGoEHvZq+MZlq3V/i/4QluLefITe7W8kS7UfrkXEA7vkVYCtALcPNK9qD7o
	DBcLjhA59byxmdR49QyWybpaQB6zaxafTjViWbC6kd3P73cSfeU9wvwsv+8GzW8t9zMYNrzghuvEi
	zFIfeUfUWT1ADprfwYnxgs+mRH1hsKH1f+4etMMM2MHC1Jm1kWw8f9L15K2g5Wh8xKRRMC7XBMaLR
	KL50sSbaWfA49V3DHMWlSzwZo9At4P0PImot9k6DTZ6DqBQjs5UPVfSX9OXnMzI8rGpVFDxBxbsZO
	oX9Otumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jqp-0000000B8Ly-3Uif;
	Thu, 24 Sep 2026 13:51:03 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jqn-0000000B8LH-3Ikh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:51:03 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f56039dso301557366b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257860; x=1790862660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gII017pjaiWPy7eQPcmYTXbw9whvLxZWHojjvAPZMqM=;
        b=r0huwEI7e58X9XJUpXY3QaZqSrZM5YnkduLrfwu86pQchDHEvn4rudrFkg5CmUkQ+C
         kNNK6IoKPPOuZdNy4TuCOQ6MXAk93gTfM7ZBqwXJD3WlcF0kvUfo/5LY1yVDP2W03Mf1
         BbQi5OX4a3u9tH0ndDHkGxn93MY9M+LAPvyeQp+a64xyxANlydd1NJf5TlSDt04i0sdl
         dXpzBhCjPDfPlKD8stCAa2tsWP5E2T0XDX0QkXAecMTZvkiUzzCeRI3kyrCbD/lEdcUg
         XvNmit/7BU+FkT55ed1ptOh0vaWyoqhunGpCSAL0s0VQdxa3yoFm8G4RMHX3twnyinYu
         P97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257860; x=1790862660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gII017pjaiWPy7eQPcmYTXbw9whvLxZWHojjvAPZMqM=;
        b=2aHgKGAKPbjXvhiW7ATFyFxC46aqLs6Q3edjtLw8oSRTKAyHGXjbV+GHesaWhwTgju
         6JEk6Oxw2kfHP4Xp0eMoJbi0tY/Mmy0RULpg+7Sc8ThXeKAMSF5aJRnhPsJphgS+wDX7
         EyEdKvXdjWwJAcggWdx/N02wMYyUISaBrTtLqYcEBtV5DC81+MMHCQKLJ/bo6K1ODZRM
         D/3g4QL2Q5xuN8NCvGz2bV26bEbJmcS20+CK56W7k8BadtnmaOX8d6N74IehlyRsA4h5
         Iz3IeuYdu0uc5oE9KWHQVqJ1Q+0MOq9Tn6zyN7G48RDyqMVs5nXnFhWap9qjoowVgeMG
         OUCQ==
X-Forwarded-Encrypted: i=1; AKwUvByX4kXfpnNjRVhScrsTb4gV6Zu7UbAc4FCscsvE1/PNN4KSJratw1R5ARMhcjmW1gTvPWDrY9jSPYoM9and2PlY@lists.infradead.org
X-Gm-Message-State: AFuF++lv1min54R9mCfiD/9PmHh+YLXLKUMebXr8X2jQs46IBHQspZGh
	4al5RlnPTQ127XZ/idZ+ECkFY8XGqHlAOiJgzVLp3pcz2BBogh+BJRSj
X-Gm-Gg: AYBFou2877uQrX5KloxwXpuVBPUlDU9BwXHaSfyfKmxlbuYRMjwxvRb1wPIilOTylFP
	q+NaO/bc43sa9RnEB9WrlPeQDCdqLvs87MXmBcEqNiP/To3oOiiGN93Kv7Mjabyjao7ritJV9VV
	nNI+zbbpS0i5kqgUHIjK6iqR5uUv+WOpD8H6DZLEpkpRpQKkLLoeRY2242JB7nzwGTNrMFVqX6D
	osKNnCMZ23GtoajyEjGPc2jt/0+QT0KBVrVrn/4YMccTA0a0eKrRrFSGyVWKBXD4eSZ9g0nAL3A
	jhNKhTdDQdN/yf7U80fFb8SixP3wlU4MaYGVG41qwMA/s/Qg5hdJURlEcdK+nly/7dwOdTaqEsY
	MkmYfuZzrvs7xNEbwMxmhq7Y/RRQqGS24C6g+BCI1/YMW4nKtdqFs7nMlpYn3oiEUgtrdrr0HLW
	k3zwmPWor/Bd0+NEeJKEAO05VIHl3RDspC7iByUNeybEIake5nvwCUyLW30jXzsI6U69uxrg/GC
	TZawIXA5LrdNs20H99kQ70E7y4R2vT9+uSp7InX
X-Received: by 2002:a17:907:ea8:b0:c25:8bf0:36ef with SMTP id a640c23a62f3a-c2ac2409273mr221371166b.14.1790257859622;
        Thu, 24 Sep 2026 06:50:59 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6ecd17sm298110766b.63.2026.09.24.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:50:58 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robert.hancock@calian.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v3] net: axienet: bound TX completion cleanup by the NAPI budget
Date: Thu, 24 Sep 2026 16:50:52 +0300
Message-ID: <20260924135052.185129-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_065101_853981_1159437B 
X-CRM114-Status: GOOD (  21.86  )
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

axienet_tx_poll() passes lp->tx_bd_num to axienet_free_tx_chain() as
@nr_bds, and @budget is only forwarded to napi_consume_skb() as its
bulk-free hint.  Nothing limits the cleanup loop to the NAPI budget, so
the number of packets returned is bounded by the TX ring size rather
than by the budget, and the poll can report more work than it was
given:

  eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
        returned 96, exceeding its budget of 64.

Returning more than the budget breaks the NAPI contract.  It also makes
the "packets < budget" test in axienet_tx_poll() false, so
napi_complete_done() is skipped and TX completion interrupts are not
re-enabled on that pass.  NAPI reschedules the poll, so this recovers,
but the accounting is wrong either way.

In steady state fewer descriptors complete per poll than the budget
allows, which is why this is rarely observed.  Triggering it needs more
than @budget completions outstanding at once - for example when TX
completion interrupts have not been taken for a while and a full ring is
reclaimed in one go.

Stop the loop once the budget is spent.  cur_p->skb is only set on a
packet's last descriptor, so breaking there never leaves a packet
half-freed.  The check is skipped on the @force path, which cleans up
after a DMA mapping failure.

A budget of 0 is a separate case.  netpoll calls napi->poll() with a
budget of 0 to reclaim the TX path only, and expects no work to be
reported.  Treat 0 as no limit in the cleanup loop so the ring is still
drained, and have axienet_tx_poll() report no work for it.  Returning
the reclaimed count would trip the WARN_ONCE() in poll_one_napi(),
which the unbounded loop could already do before this change.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes
with this change applied.  Neither an over-budget poll nor the netpoll
path was exercised in that test.

Fixes: 9e2bc267e780 ("net: axienet: Use NAPI for TX completion path")
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Changes in v3:
    - Report no work for a budget of 0: axienet_tx_poll() now returns
      "budget ? packets : 0", so netpoll cannot trip the WARN_ONCE() in
      poll_one_napi() (Sashiko).
    - Reword the @budget kernel-doc and the in-loop comment to cover both
      uses of a budget of 0 (Sashiko).
    - Drop the wrong claim that a budget of 0 matters to the @force callers
      (Sashiko).
    - Add a hardware test note, and the Assisted-by: tag that v1 and v2
      omitted.
    - v2: https://lore.kernel.org/netdev/20260917115657.20697-1-maimon.sagi@gmail.com/
    
    Changes in v2:
    - Treat a budget of 0 as no limit, so that netpoll still drains the TX
      ring; v1 reclaimed nothing for it (Sashiko).
    - v1: https://lore.kernel.org/netdev/20260914114821.55503-1-maimon.sagi@gmail.com/

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..7fd77f8cb57c 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -772,7 +772,11 @@ static int axienet_device_reset(struct net_device *ndev)
  * @force:	Whether to clean descriptors even if not complete
  * @sizep:	Pointer to a u32 accumulating the total byte count of
  *		completed packets (using skb->len). Ignored if NULL.
- * @budget:	NAPI budget (use 0 when not called from NAPI poll)
+ * @budget:	NAPI budget, or 0 when not called from NAPI poll; also passed
+ *		to napi_consume_skb(). When @force is false, cleanup stops once
+ *		@budget completed packets have been freed. A budget of 0 means
+ *		no limit: netpoll polls with it to drain the TX ring, and
+ *		axienet_tx_poll() then reports no work.
  *
  * Would either be called after a successful transmit operation, or after
  * there was an error when setting up the chain.
@@ -788,6 +792,16 @@ static int axienet_free_tx_chain(struct axienet_local *lp, u32 first_bd,
 	dma_addr_t phys;
 
 	for (i = 0; i < nr_bds; i++) {
+		/* A NAPI poll must not return more than its budget.  Stop on a
+		 * packet boundary once it is spent - cur_p->skb is only set on
+		 * a packet's last descriptor, so no packet is left half-freed.
+		 * A zero budget means no limit: netpoll polls with a budget of
+		 * 0 to reclaim the TX path, so the ring must still be drained;
+		 * axienet_tx_poll() reports no work to it.
+		 */
+		if (!force && budget && packets >= budget)
+			break;
+
 		cur_p = &lp->tx_bd_v[(first_bd + i) % lp->tx_bd_num];
 		status = cur_p->status;
 
@@ -1027,7 +1041,11 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
 		axienet_dma_out32(lp, XAXIDMA_TX_CR_OFFSET, lp->tx_dma_cr);
 		spin_unlock_irq(&lp->tx_cr_lock);
 	}
-	return packets;
+
+	/* netpoll polls with a budget of 0 to reclaim the TX path and expects
+	 * no work to be reported; see poll_one_napi().
+	 */
+	return budget ? packets : 0;
 }
 
 /**

base-commit: 879e280b8486d4612ad1aa050d6fada2dd80cf1c
-- 
2.47.0


