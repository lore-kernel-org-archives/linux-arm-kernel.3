Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45625CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqNw45I5i0A+TvN7Yvp1p4lxx6mkgXUC3KRKlj0F9r4=; b=aDW97ng93nOwZEk2ixWMrNCb9Q
	aS+f4W4uRzpF6C3VvoJxzb3VZMT4XBvhu7bAk3+TWoCiCa21vpIeY9LfcLOxXUYTpV50uGE9m+qEH
	Vhqy47pTGoMVORoqpZswTUra8mQTgW++IUuPnlBH7uIjZjUhfItZ6LCn/IB5AQlcASF9xhtI19C3j
	lMXh7AGBr03CTQ6kArgQuL6mfBjFWfRkPTnmQ24fwwqr7hnCqzt/j82pX2xEwnrHtPiODYM73v3OU
	H+ez+2d1R04gzzOqXgL0LirLaDWGKOVke2VsyX4yz+zzcS+BlmEQ8KXBQLtnT2ntkAtzcxzdwPOND
	6cYmEBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuWS-000000069j8-255I;
	Wed, 30 Sep 2026 13:39:00 +0000
Received: from mail-wr2-x23.google.com ([2a00:1450:4864:30::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuWP-000000069i8-2dTW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:38:59 +0000
Received: by mail-wr2-x23.google.com with SMTP id ffacd0b85a97d-4888598e4f9so3820649f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775536; x=1791380336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqNw45I5i0A+TvN7Yvp1p4lxx6mkgXUC3KRKlj0F9r4=;
        b=Fj74hNgkO6GW3viECg9/adv8oR22mH6ktwkQ53tEQmVn548ZL/LKbWNsVBgAXAv800
         BqLOoOsVXHoJXU7w6cUPyzAmCVRXLT/Km2FFUOyL8cB9jyH67BUo3ymdAdg8J+uONv0V
         jJtLxvjBMKjDQBFlHsTuHLL5sU+h3lQ8maONBTPfBAkR9C9EFu+cq/qK0vxOlL0l19lX
         yjYUVDeEZfsLhJRoXabEsvvaq48FDisyBJKwspAcgFThmX+pTduHibYFnJezbESI8yam
         0a6ltjQbizBioEzP8QJRistdz0Y6cTFMNxu90CUKG4lM3t1Ke7gP5oewDp2fzFdclqCw
         T5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775536; x=1791380336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqNw45I5i0A+TvN7Yvp1p4lxx6mkgXUC3KRKlj0F9r4=;
        b=drIILGa1kG2wGonJAVoJjNczrVqGnLhF3/T7ufVVclF5PpmbpErYz0qN/HOIlwgg2S
         vQE4XR21CFFpW2tF/aXx0nOlgKX3B75qkAB65yvVqbkJKithaV1UYdlHAgxfwSSibIIm
         w/55XOyZLQEnM1aS5s8yGkELymxNDLwMY5jYvfkvybqIEYX+OABhsi2S/HAUAf9ICqJ1
         gD7Gh86w95P+Mb3wf6PAFOJUi8bKFJABchlOq69tabOgvQiAa+KnoG1/T6ZP9AYa9CtT
         OvivxYmfhl8Z24To5KCvNt4kRLUTZJgf5DoehGngI7kO3Lr36JvJpXBMglLiejvow6Z5
         /w+Q==
X-Forwarded-Encrypted: i=1; AKwUvByWRiloX0jjWKJN+tEknNN6CslZ/oQSwtwsPmMbIfObPPLdmG0fbQBelrjx4+lwu/8Ird2iQHHGzEhK08p7EOdc@lists.infradead.org
X-Gm-Message-State: AFuF++kP7qIU3ArHgNcUi/2XPtXqi/vzX5PCiUiD9XJAYiUigybN7OTt
	n2q8uzH+8ryjGy/SOFAMZGXw38swlvwNaPG0z2+fvDEmM1gJtTh1xBTH
X-Gm-Gg: AYBFou34GE88biVurSSzfRhklzBQCBpUrH7DM5Dl4UH6P5ITiHW3m3QfldiTiPmSFAt
	tZ6Ez6lgTB2reqUvrc1M2MYgEPeHlqVyepN0gw2tp/ZfqZu1V/rmEdZY/vxYqrBbImT1LHYF/ch
	2t121QQZVy9QHoq20FAt8sRSnG+AhXXup0Fuyt0scY20WWcwizn9PAJnJ0fDfiSOfneLkq8KQUL
	+Kxw2ljVEW9v/bSLdv9Mu23WhwyjSelCBRotnhIqG73bz/QtKlcVQWnWY0m/GkEyTTRVI8QJFSy
	SOJx1lDyiqXWSnNsLNETF/7onQmwKu8X74RzqUQIydYjYxw10Qqng8yUzqotO3N47kzw68h6Q1u
	uVtsEqaynIGC2aaNXBNK2Eww7w5k+BdFRc49qNv7adS0DplqhoYU+9Jeqz2mGjJueZ2YWp8epZt
	MIB/C2RgDChfHbvqIOnkUh/jWq2eGQFIiI57QkI/LgWTIjk3AgsEIlf55snQQdjoB1laFFDXlKQ
	Dl6DJWEq/M/W01RXeRFIpSOdXoDhEXT0wabwra5
X-Received: by 2002:a05:600c:3145:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-4a01b00d9bamr25280835e9.21.1790775535365;
        Wed, 30 Sep 2026 06:38:55 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029d61e4sm3504730f8f.15.2026.09.30.06.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:38:54 -0700 (PDT)
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
Subject: [PATCH net v2] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
Date: Wed, 30 Sep 2026 16:38:51 +0300
Message-ID: <20260930133851.663023-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_063857_815988_1EB1CC06 
X-CRM114-Status: GOOD (  21.74  )
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
clears it on reclaim - and free any skb still attached, as a drop since
it was never transmitted.  This relies on axienet_stop() having stopped
the DMA engine first, as the RX walk in the same function already does.

tx_bd_v is NULL when axienet_dma_bd_init() did not get as far as
allocating it: axienet_open() does not check the result of the reset
that runs it.  dma_free_coherent() accepts that, so skip the walk then
too, and drop the comment claiming the ring is always allocated.  On
the axienet_dma_bd_init() error path the TX ring has just been
allocated zeroed, so the walk does nothing.

This was reported by the Sashiko AI review bot.

Tested on an AXI Ethernet MAC behind a PCIe endpoint: traffic passes,
and after each of ten down/up cycles and five module reloads, all made
with traffic running and each running axienet_dma_bd_release(), traffic
resumes and nothing is logged.  The leak itself was not measured.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Changes in v2:
    - Skip the TX walk when tx_bd_v is NULL, which axienet_open() allows
      when the reset fails; v1 would have dereferenced it where the old
      dma_free_coherent() did not (Sashiko).  Drop the comment that claimed
      the ring is always allocated.
    - Free the skbs with dev_kfree_skb_any(), so they count as drops as in
      axienet_dma_err_handler(), rather than as consumed (Sashiko).
    - Say that the walk relies on axienet_stop() stopping the DMA engine
      first, rather than stating it as a guarantee (Sashiko).
    - Kept Jacob's Reviewed-by, as the changes are small; please say if
      that is not OK.
    - The hardware test is v1's.  The changes do not touch the path it
      exercised other than how the freed skbs are accounted.
    - v1: https://lore.kernel.org/netdev/20260927081034.350422-1-maimon.sagi@gmail.com/

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1722b7038f34..8bf27e20e103 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -186,7 +186,28 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	int i;
 	struct axienet_local *lp = netdev_priv(ndev);
 
-	/* If we end up here, tx_bd_v must have been DMA allocated. */
+	/* tx_bd_v is NULL if axienet_dma_bd_init() did not get as far as
+	 * allocating it; dma_free_coherent() below accepts that.
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
+		/* never transmitted, so account it as a drop */
+		if (cur_p->skb)
+			dev_kfree_skb_any(cur_p->skb);
+	}
+
 	dma_free_coherent(lp->dev,
 			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
 			  lp->tx_bd_v,

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.47.0


