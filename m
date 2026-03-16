Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D618AF30297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWF2mf3kVPfppDp36uMCmkCxPdxULYmBpYhT7oMPfhU=; b=YsLyuFR5elxQIcFbTzYEcM7XkJ
	yhf7qLPeA7VFCl5lg6NVPE7AcU+492i7KCw/jCVIAl9es21JvjjF2bhP+Og9fewVo/sm+EFUhJPfO
	UTnePDkdjGeTtzNQYID1OQ51Y1jlMtrfdPqi61ljPmUSE8ioMcpfN1cM7hINlQP6+7yLz7MO9b4Xg
	Q00mzk3gYZJN/DtYAjcLyIqJDZY4PQf5X+63pQlm5HWXkv7Za5/PHbFjfqccuVl6Q5UNHAUBgeT+r
	gNX70kVLGU/WvEfzGz3ZxoxOOGvTDcmenk2+oNrXxUky7XqPWOSH+hEYgQqOlblutD5XoQK+zIHdl
	805AdIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPi-00000003B5u-0aGC;
	Mon, 16 Mar 2026 02:10:38 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPc-00000003B0D-3HBA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 02:10:35 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35ba2ae4df3so153764a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 19:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773627032; x=1774231832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWF2mf3kVPfppDp36uMCmkCxPdxULYmBpYhT7oMPfhU=;
        b=X6GPMxDsg71tKTJHOR3F+MmjBX2+g3Qf3Hk/TZes0lbEuZeYpGXW9KEv9PcuzQf2H9
         8edTNv8NGBLeSsIWC8Nr0HhOP5evg9s3HL1JhCH8PoGQt8sT6GlN+WJ3VsXLEqCXQDWb
         6S/Rmk43kDoykRtz964aK2x5p8+xDqJ9DNxSPnUTSwxHD5Y/iUVvXnK4vxY2uk+ayJmH
         n8CMQsJxRmfTGTUXP4Xl9uUJvf1M6U2wX3xLhopYC7ac1gQV890Shc8YANiwgJxPf1ar
         9ltInWXNzTowcnsJy9doWrOIS4i3fyDkPmtr+ht1qrWnLRoOOQfUiBc1UAonHp0OtseN
         ndWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627032; x=1774231832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MWF2mf3kVPfppDp36uMCmkCxPdxULYmBpYhT7oMPfhU=;
        b=DXf+tMqnPAz0Wkppnbre5WuF6mcHDygg3G0qh1r1SktHtINVf9kE78AC48+EnRSmly
         BsvT/OYS8VZX+nYTGBVUjMo9xC+5/lynqYo2vStwMoReKD4WTyCwRXXhac/b3fzJMbZr
         n1oG8H9wrZ5eTP4yyDVgEuA+tw/eRnoBAzJ+lyxQ3Kmn8hvaTBllrTRvfe6nVeRtCqo7
         U0epDowEK6BSdTCK+MbCfMJUz4O0SEkx87X+hA2GBLwWUVZRaeN8hgtrG93WeceSCIm+
         THMXNHXYlTjt0BJsWseCtkjjniCRqHLIJIBIhrNN6eFZ3F02SdeVLLZYRHWBZypMd9xY
         jXbw==
X-Forwarded-Encrypted: i=1; AJvYcCV8kiazTrwCKSUlBggaLqAtzDREl84GgaC+lScjlJi4w+kZaHDNviRKNIFpj0FAuOjz/V0UjcCs37bNCbjaXUNa@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/OvsCivaB1921qNzc6Ahf38M+BM3DIa3d8YuykBvA2Lj7Orq2
	sZrqbGkbOrH0Sx30bAARWu7anliBCpLTvt/1nq/EZJzhZCmBrsMDeTrp
X-Gm-Gg: ATEYQzwHlhL81L4kXm7hdIBboskVYrBfrdrr6po4r31ERnEZVxTvp5GgS0kKgNSYn4W
	EY3OJkctyv2fU5eRJeGd2/FyLAuJyxuIDJlDyyZV8zGxYssTOXNVAptqQ43Z8GbGN8AZMI6rm/3
	KR3TvtQpJkPOVcvA1htMWpXJxWJXG625cmzCqX3NX/Cz2iqdRanYUVpVJhtYhYet9a8KWNPXya5
	wr2Sb9TC9EAFWhg/V/h0uiPs1GrefyErZSBW+DyPF6sNrAzkEIX07WeYucQ/U5mZC3AWsZsCj3q
	FxqG0RmB0wrHqfDEwuV+OY9eGrTwSK3Ekvj/vp4HpgXKlNr7CO2pugkQlSbJkSkyYqwZHS40OTZ
	klKosaEWkug2XKFPlBvo3ARzkaQN84orASYCHqchTaH/0eUQErpbhG1wJjFi90e/srYsonIHhbe
	hTRuKLTjj+DhYcSZzGx6TaJBUrn7HJctRA7sWCxOF18FGFZ9dWUmiX99bGj/IRM7jk
X-Received: by 2002:a17:90b:3501:b0:359:fa1e:2bc3 with SMTP id 98e67ed59e1d1-35a21ea5dbfmr10103044a91.6.1773627031911;
        Sun, 15 Mar 2026 19:10:31 -0700 (PDT)
Received: from luna.turtle.lan (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ffdfb7sm17705805a91.14.2026.03.15.19.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:10:31 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] net: stmmac: Prevent indefinite RX stall on buffer exhaustion
Date: Sun, 15 Mar 2026 19:10:08 -0700
Message-ID: <20260316021009.262358-3-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316021009.262358-1-CFSworks@gmail.com>
References: <20260316021009.262358-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_191032_921390_36009C53 
X-CRM114-Status: GOOD (  16.38  )
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

The stmmac driver handles interrupts in the usual NAPI way: an interrupt
arrives, the NAPI instance is scheduled and interrupts are masked, and
the actual work occurs in the NAPI polling function. Once no further
work remains, interrupts are unmasked and the NAPI instance is put to
sleep to await a future interrupt. In the receive case, the MAC only
sends the interrupt when a DMA operation completes; thus the driver must
make sure a usable RX DMA descriptor exists before expecting a future
interrupt.

The main receive loop in stmmac_rx() exits under one of 3 conditions:
1) It encounters a DMA descriptor with OWN=1, indicating that no further
   pending data exists. The MAC will use this descriptor for the next
   RX DMA operation, so the driver can expect a future interrupt.
2) It exhausts the NAPI budget. In this case, the driver doesn't know
   whether the MAC has any usable DMA descriptors. But when the driver
   consumes its full budget, that signals NAPI to keep polling, so the
   question is moot.
3) It runs out of (non-dirty) descriptors in the RX ring. In this case,
   the MAC will only have a usable descriptor if stmmac_rx_refill()
   succeeds (at least partially).

Currently, stmmac_rx() lacks any check against scenario #3 and
stmmac_rx_refill() failing: it will stop NAPI polling and unmask
interrupts to await an interrupt that will never arrive, stalling the
receive pipeline indefinitely.

Fix this by checking if stmmac_rx_dirty() returns its maximal value,
returning the full budget (which tells NAPI to keep polling) if so.

Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f98b070073c0..d18ee145f5ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5593,6 +5593,7 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
  */
 static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 {
+	int budget = limit;
 	u32 rx_errors = 0, rx_dropped = 0, rx_bytes = 0, rx_packets = 0;
 	struct stmmac_rxq_stats *rxq_stats = &priv->xstats.rxq_stats[queue];
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
@@ -5870,6 +5871,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	priv->xstats.rx_dropped += rx_dropped;
 	priv->xstats.rx_errors += rx_errors;
 
+	/* If the RX queue is completely dirty, we can't expect a future
+	 * interrupt; tell NAPI to keep polling.
+	 */
+	if (unlikely(stmmac_rx_dirty(priv, queue) == priv->dma_conf.dma_rx_size - 1))
+		return budget;
+
 	return count;
 }
 
-- 
2.52.0


