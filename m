Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E33CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ToVjaLw2QkDyxt21XUlKuHYlfWlGfRLzYFmO7NKSmk=; b=NMWoAcQ6m4B7ruiQaedzv3i4Mr
	Atdnpmvg600K0sZbxYqasXNdBBOkqggrr+R7s/jWnkEI0KSvRCn7aWyIXWF0QBO5iuGlt6ZqiQQu0
	Gm9O7nmjx8x5LRJ/YAnWJH4O7IC1ghXnuZRsr3JIAbcmSekEFk2JvN338tGMZhOeOeAHxdK8mwR1O
	l41IKQ0/UmMTAj73WB1aLsCRC2AoinQ3dn6MuMR8/zk0lA3yFCVl6aHT1epKBk7Y/IZqwSA6U9pk5
	DHWp2QJ4P30GRP8E9x/bwX1OFRRpgr9GW4BA+jRPSlQyc+Zrrez1GBasqVCx3XUnmGo10b7giqUBX
	7PYOG9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8W5-000000068xn-0M6z;
	Fri, 09 Oct 2026 11:11:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8W3-000000068xC-0Kuf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:11:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e831e86ebfso6977345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544314; x=1792149114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5ToVjaLw2QkDyxt21XUlKuHYlfWlGfRLzYFmO7NKSmk=;
        b=EFSXlgAH+3yklCh2rj1V/BqybG57ZPMqndkLMMp9xYSDDrifLzXJeIisznf5TWXu+I
         w9tu5SSBYYutYyr90yzFOeqyK3Amt5ikCneD8BGfPZHBDq7l2bTCKAf04tSTzMeosLSi
         eUu3fGCJ2hf7EwUx1Xejp4JunVbu1hgeSbgHTEiDYGEV3wLhmragVboerhVNqR4lGZHj
         19EnHpFdk4A219sYtzNc0FeE6bc1HvJvZ5FAOynnH6zruvfOMEsV35fDQuRjpWwWr1sr
         xu4f6chj9YTH6lo1rUpNSKTtfREa0NGQWyejENjtbhDzs58SIkCmgbB7SQV9tCj5L8EV
         jrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544314; x=1792149114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ToVjaLw2QkDyxt21XUlKuHYlfWlGfRLzYFmO7NKSmk=;
        b=B6VXtckxCanNtM7NRVUI/L/X4ND1+HRuBkZI8QZjgn43ZUIz0lwlklUNmGRmEbuCGe
         abSXocIchk5wVLAKFfXC/e5aMkoUe6TLgGZlmHV3fjxkvHD++qeAFGmRGwiyEjZjjh72
         bfJZrH4ACxWUSdYj0FC5eJVESrciC2izcHqYlXjgbmNmnXuagJr4MnEvy+Jw69uLLesg
         P6oTf2PNPwOLEwaFz6hq8LiLyte4EdRa2JdYbGalP9lNCm1u8zk7bRFyajEAhL1S+8hH
         E1FrLG5J3MaXguxW85drrNaUqnCmFLpFPSNE8aRpsnXD+9HBpBLAX5hWA47sC0rrXEH3
         VBpA==
X-Forwarded-Encrypted: i=1; AKwUvByof7DGp01M4nUP42ILiLwSGiA72FT68AyTI8JqqM5tIQ8IOYjvhl6NxMIzHaY1TDTyc4CUSdxj5DSkGA2T3VO+@lists.infradead.org
X-Gm-Message-State: AFq9FYIEiYyY3/Wh0oMKh+rcstQOnXIC6mH6UVy7fri2GwhKiH20/NcA
	2WzII5fjHfrLR4MggXKYeZ2prpCX04+JLiWZWenNPsPlY2qu/acyU0sL
X-Gm-Gg: AYBFou2j748vaY9xka0i+HEmBTKr/Nrzqac2T1tHhMgpxRvcWUkUK7HUVFqUh32T4Yf
	VNfIh3R0155FsUdgmqaGqD17va7Gqs1BAY8axH/Gu6Cnl9s+BFUtm4bBzVhE0saN1Rfcf1vd6Tg
	K9yJxhkpHQj5Ioz2I8pZJs8tAgWUSIHmvSdnMYc4Vf36yaSzJ8R6Y4LTZ/7ztgflgxMP9SPizIE
	UizPZE8Rrj+tVhOzxihiW1EszqqlNQxLM7X5TGT41cBuXbX8tiHHQLFwfZxw/gfaBOu67je4XW9
	XKnN8f0NMv+oFh4LEx+78Ifwf49rLk5ja4HNz8nk+mFbdEwtR+Y3rZp3p0NNvTChBk1kpRFg0nh
	+2B5ux3bFVqrA53OFzxczn6avSaRo7ZoqPmJ2k35h7UTQ4R4Fxmk0AHzHRZI3qnrJqiALFm4yJy
	Fxm+6f+RVrHHP4AB8jRUwwszO1qcF+a1jLygghHotx1ub//08SGE8V7eBipOegnEt6qQpY7epXZ
	Laehp+Mwx01
X-Received: by 2002:a17:903:1905:b0:2dd:8e5:28d with SMTP id d9443c01a7336-2e84280a518mr12154275ad.8.1791544313701;
        Fri, 09 Oct 2026 04:11:53 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:13b6:ac86:6bdd:a8cf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4ebfsm6823245ad.78.2026.10.09.04.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:11:52 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: stmmac: fix RX coalesce frames counter
Date: Fri,  9 Oct 2026 19:11:37 +0800
Message-ID: <20261009111138.320089-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_041155_123871_274439F9 
X-CRM114-Status: GOOD (  13.24  )
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

The RX refill path should set the IC bit once every rx_coal_frames
descriptors and leave the rest to the RX watchdog (RIWT), as done by
commit d429b66e2ebc ("net: stmmac: Implement RX Coalesce Frames
setting").

Since commit 6fa9d691b91a ("net: stmmac: Prevent divide-by-zero") the
counter is increased by N+1 for each descriptor and then compared
against N, so it is always reset to 0. With a non-zero rx-frames, IC is
therefore set on every descriptor and every frame raises an interrupt.

Fix this by counting one descriptor at a time in a helper used by both
stmmac_rx_refill() and stmmac_rx_refill_zc(). Platforms without RIWT
(IC on every descriptor) are unaffected.

Fixes: 6fa9d691b91a ("net: stmmac: Prevent divide-by-zero")
Signed-off-by: Pengfei Zhang <zhangfeionline@gmail.com>
---
The default rx-frames is 0 (watchdog only) since commit da2024510031
("net: stmmac: Tune-up default coalesce settings"), so this is only hit
when rx-frames is set explicitly.

Verified with "ethtool -C eth0 rx-frames 16" under UDP load: without
this patch almost every received frame raised an RX interrupt, about
twice as many interrupts as with rx-frames 0.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b837e8e27..72678760e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5071,6 +5071,22 @@ static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
 	}
 }
 
+static bool stmmac_rx_need_ic(struct stmmac_priv *priv,
+			      struct stmmac_rx_queue *rx_q, u32 queue)
+{
+	u32 frames = priv->rx_coal_frames[queue];
+
+	/* without the RX watchdog every descriptor needs IC */
+	if (!priv->use_riwt)
+		return true;
+
+	if (!frames || ++rx_q->rx_count_frames < frames)
+		return false;
+
+	rx_q->rx_count_frames = 0;
+	return true;
+}
+
 /**
  * stmmac_rx_refill - refill used skb preallocated buffers
  * @priv: driver private structure
@@ -5116,15 +5132,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 					 stmmac_rx_check_buf2_cap(priv));
 		stmmac_refill_desc3(priv, rx_q, p);
 
-		rx_q->rx_count_frames++;
-		rx_q->rx_count_frames += priv->rx_coal_frames[queue];
-		if (rx_q->rx_count_frames > priv->rx_coal_frames[queue])
-			rx_q->rx_count_frames = 0;
-
-		use_rx_wd = !priv->rx_coal_frames[queue];
-		use_rx_wd |= rx_q->rx_count_frames > 0;
-		if (!priv->use_riwt)
-			use_rx_wd = false;
+		use_rx_wd = !stmmac_rx_need_ic(priv, rx_q, queue);
 
 		dma_wmb();
 		stmmac_set_rx_owner(priv, p, use_rx_wd);
@@ -5492,15 +5500,7 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		stmmac_set_desc_sec_addr(priv, rx_desc, 0, false);
 		stmmac_refill_desc3(priv, rx_q, rx_desc);
 
-		rx_q->rx_count_frames++;
-		rx_q->rx_count_frames += priv->rx_coal_frames[queue];
-		if (rx_q->rx_count_frames > priv->rx_coal_frames[queue])
-			rx_q->rx_count_frames = 0;
-
-		use_rx_wd = !priv->rx_coal_frames[queue];
-		use_rx_wd |= rx_q->rx_count_frames > 0;
-		if (!priv->use_riwt)
-			use_rx_wd = false;
+		use_rx_wd = !stmmac_rx_need_ic(priv, rx_q, queue);
 
 		dma_wmb();
 		stmmac_set_rx_owner(priv, rx_desc, use_rx_wd);
-- 
2.54.0


