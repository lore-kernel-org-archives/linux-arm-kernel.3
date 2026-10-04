Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484ECCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=McuNVp32CTxlLQ2QlE0pJplIh7P/8gxpjbSLGhtHHVw=; b=l1Yf135MWYbVMXIqIVwYjEjue3
	S3ZjsAfijE7eKG07QSkWqvXJtJUSOSFhxWHC0FGhtKjKpli9XIBpL8vIU4tF2zFVwNGQp4PZ1gCAV
	W6khl+PbEeFJmvx7uT7ZzDxPujltRSspljVQ712ObuBc48PYh2xh2YQ03f4TrEAsNBhB85nQdLN54
	98zYHrOoWcZz9g4w09sKyfCd5qesd5s/kFWvlyP9K8bmmRFB+7wsOUY3acWVXoXxi4z7NhVb9h7I0
	WGN3NAGM/ghBnX3h+3sPBIt+5vtBNxbtM5vrvDZkZ6nc8UrEGYdcJitNpP9Q+mAKD7SRHVVQcB2/I
	YKuHD4pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHjT-0000000EYmU-3lWr;
	Sun, 04 Oct 2026 08:38:10 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHjR-0000000EYm9-1jIk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:38:06 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so339644f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791103083; x=1791707883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=McuNVp32CTxlLQ2QlE0pJplIh7P/8gxpjbSLGhtHHVw=;
        b=dIwYFBv5yiK1OnfaYiQ75U/YCeArw258XATHo0+Z/BqZQq4xru3sq33AbfwcHr4OB1
         EoApEnxPNXX/3GHcjLfrL5G0eehAbXhWWBg6DrXjMG2jQPibzIpiugIPdAL2mswmWFAt
         wpAJA6mC6pTeM6Kmz/3tkS8HW6+cLrNZk0pzrXTHLRieb7CxKuiqD6RKjRK9t7gU8bbP
         suw7YzevMEA4fy5vOEBM0JhS7XJV/iqVAX7wW3+zJcZeceSGc1c8vdLnhKN/yq5UByKY
         IjRbZBXNQTt9Z+w7kfjbqnC08rz0QpfqHWHsRl+Vi8tytk3HaCnFrZH9GBLpq2N4dHTG
         HKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791103083; x=1791707883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McuNVp32CTxlLQ2QlE0pJplIh7P/8gxpjbSLGhtHHVw=;
        b=SjKgREQabk34WTEbIZyIxOB9+IdeIv7pSEMUPfiqyZ2oKIGoLpdHzxVaX00rRjTGuD
         fCMZcEx49hCf00Z3BqT85yhg+gLXNYXuETwx70qQt4/Dsw5bumxY442P3+DFoLFNnF0H
         DwgcOM856UBklClTxErb5aGQhJ+qSk3I+LtaCUfguQxbahHqe4OY7l1WKYXETnlxF5UH
         fU93s3jVsM4P5afanm0/sO5CjyYRtlHggpv/+3zo6UyAJJ53I05xiXQkHqbE9gQX474P
         4UMs2vcywx0tI9smEQFXQGvF8SItrONA7w6Oc0Mji7n6qjvhLnXohWl6DZX11fx4XHoa
         Yu0A==
X-Forwarded-Encrypted: i=1; AKwUvBxLFo9DGHo7grDhwQAZtq0jr5k1ksmrN0w3M7CMCgL2LNbNZ0mReAMEQUzoAdQtFEtQZsyozeOFwmmMKqVCllHw@lists.infradead.org
X-Gm-Message-State: AFuF++nJH1CL4BwpHDpuhxtlwzcrPtYX4w7ss5BzkJV1VobtU6qGTnsr
	1Ht6P9T4Waq5mFnzzfjMVf9xB6frc0QQkcZ98J3q+Aix+GoykRq4RvKD
X-Gm-Gg: AYBFou1iP3GJh2mit7EwiqmFZb0lGjqZJ18WBQJxszyiE0TVhIFZ6crz30epdVEHwe4
	7tbUoPgK/3m6w1q0wL+JDdfEplVWl+bhV8FAH7WnPuhT0FRJjFEEzShQoReRIzj8hClnc0tZQTU
	6IbsKYDowpH4kB22Pgq8EBSJh905dsaLW26UXKY3LmeoRHYee4L6RSYkfxW3mZnuvZ2i9+h7OYd
	noLWYbBWtRbtQ97p8UgHK7yBaGrQgVgA/UDDkHKbaSZpKTvcuVdybi6o9Ual9CbD1o6xJBoREC+
	Kn8s5pK4P+Bn5x3lLaM8sLUKgK/lQaaBBcqZOHxUgUR0HgPdKwmJQB7fT+So+ic5RtPFgbHegVw
	a7KrO9fYe3hVGhTfurWzBag+XCel8JCYwsQ+CuPYzmNVSNDCXbvYdJJ76rxZc8bvRaufNSGrddj
	g9sTmHAOYdquDHIaK9ikUesWtL6xpWsS1xq1LayXuzuzd121qfES/4UslX6772hcBJ0zGxcZhsK
	6m7+5/ZbSmevsthStMuNW+kCYtDb2LaRMDaGn6R
X-Received: by 2002:a05:600c:3e07:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a027585dfemr125622175e9.12.1791103083428;
        Sun, 04 Oct 2026 01:38:03 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4cfsm206540565e9.1.2026.10.04.01.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 01:38:02 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@iogearbox.net,
	jacob.e.keller@intel.com,
	joe@dama.to,
	suraj.gupta2@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v3] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
Date: Sun,  4 Oct 2026 11:37:59 +0300
Message-ID: <20261004083759.1016519-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_013805_489463_77AA39B1 
X-CRM114-Status: GOOD (  26.16  )
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

axienet_dma_bd_release() walks the RX ring to unmap and free every
receive buffer before releasing it, but frees the TX descriptor ring
with dma_free_coherent() alone.  Any descriptor that
axienet_free_tx_chain() had not yet reclaimed still holds its skb and
its streaming DMA mapping, and both are lost.

axienet_stop() disables TX NAPI and stops the DMA engine before calling
it, so nothing reclaims those descriptors afterwards.  Bringing the
interface down while frames are in flight therefore leaks up to
lp->tx_bd_num skbs and mappings each time.

Walk the TX ring the way axienet_dma_err_handler() already does: unmap
every descriptor whose cntrl is still set - axienet_free_tx_chain()
clears it on reclaim - and free any skb still attached, as a drop.
This relies on axienet_stop() having stopped the DMA engine first, as
the RX walk in the same function already does.

The walk must not run on a ring that is not there.  axienet_open() does
not check the result of the reset that runs axienet_dma_bd_init(), so
when that reset fails tx_bd_v is either still NULL or, after an earlier
close, points at the ring that close freed.  Clear tx_bd_v and rx_bd_v
once their rings are freed, and skip the walk when tx_bd_v is NULL.
That also ends the second dma_free_coherent() of a stale ring which the
same path already did.  On the axienet_dma_bd_init() error path the TX
ring has just been allocated zeroed, so the walk does nothing.

This was reported by the Sashiko AI review bot.

Tested on the AXI Ethernet MAC of an ADVA TimeCard X2 (PCIe card, with
the built-in AXI DMA): traffic passes, and after each of ten down/up
cycles and five module reloads, all made with traffic running and each
running axienet_dma_bd_release(), traffic resumes and nothing is logged.
The leak itself was not measured, and the failed-reset paths were not
exercised.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Changes in v3:
    - Clear tx_bd_v and rx_bd_v after freeing the rings.  v2 only caught a
      NULL tx_bd_v from a first open; after a close followed by a failed
      reset the walk would have read the freed ring (Sashiko).
    - Reword the comment on the skb free: a descriptor can complete after
      TX NAPI was disabled, so "never transmitted" was not always true
      (Sashiko).
    - Say in the commit message which hardware the test ran on.
    - Kept Jacob's Reviewed-by, as the changes are small; please say if
      that is not OK.
    - The hardware test is v1's.  The changes since only affect the
      failed-reset paths, which it did not exercise, and how the freed skbs
      are accounted.
    - v2: https://lore.kernel.org/netdev/20260930133851.663023-1-maimon.sagi@gmail.com/
    
    Changes in v2:
    - Skip the TX walk when tx_bd_v is NULL (Sashiko).
    - Free the skbs with dev_kfree_skb_any(), so they count as drops as in
      axienet_dma_err_handler() (Sashiko).
    - v1: https://lore.kernel.org/netdev/20260927081034.350422-1-maimon.sagi@gmail.com/

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 09443623a3e2..c88c671f8b2d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -186,11 +186,34 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	int i;
 	struct axienet_local *lp = netdev_priv(ndev);
 
-	/* If we end up here, tx_bd_v must have been DMA allocated. */
+	/* tx_bd_v is NULL if axienet_dma_bd_init() did not get as far as
+	 * allocating it, and is cleared below once the ring is freed;
+	 * dma_free_coherent() accepts NULL.
+	 */
+	for (i = 0; lp->tx_bd_v && i < lp->tx_bd_num; i++) {
+		struct axidma_bd *cur_p = &lp->tx_bd_v[i];
+
+		/* axienet_free_tx_chain() clears cntrl when it reclaims a
+		 * descriptor, so a non-zero value means the mapping is live.
+		 */
+		if (cur_p->cntrl) {
+			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);
+
+			dma_unmap_single(lp->dev, addr,
+					 (cur_p->cntrl &
+					  XAXIDMA_BD_CTRL_LENGTH_MASK),
+					 DMA_TO_DEVICE);
+		}
+		/* not reclaimed by axienet_free_tx_chain(), so a drop */
+		if (cur_p->skb)
+			dev_kfree_skb_any(cur_p->skb);
+	}
+
 	dma_free_coherent(lp->dev,
 			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
 			  lp->tx_bd_v,
 			  lp->tx_bd_p);
+	lp->tx_bd_v = NULL;
 
 	if (!lp->rx_bd_v)
 		return;
@@ -221,6 +244,7 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 			  sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
 			  lp->rx_bd_v,
 			  lp->rx_bd_p);
+	lp->rx_bd_v = NULL;
 }
 
 static u64 axienet_dma_rate(struct axienet_local *lp)

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.47.0


