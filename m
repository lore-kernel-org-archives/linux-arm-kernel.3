Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDBEF30295
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 02:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/yM1cLEJPCynSBddhLco3TyOcjIuEN7QpwgVXpMHAA=; b=XPru5HFy/wJ5vrz+1ipzXJPFS0
	hIdbYqbrt+bNbJRkuuU2X41cOdfHDpg+iDDulqynCekP9yOQiWxGlGxFCkIX4w8T4WABRlbbt0AsV
	d2MYoaO1W2oqCJjppkJxpXYqwM0amBcu83zABgCFo32bhgd3QS/Mlb6TPomJ6aGo9/z7wdQhw1EW/
	QR6r/ytMd3JiC579gzx2hKbMer5liqjfyAl5JYENv9gsF2jvoKaD6KRwoKiRw3Ym4Jh1SHfND2Jua
	qNjQFMXdwD+hkpmBk4WhHcQdHMHNbDda9PDTjBu+t7LNgH90vhZlyA5YNAntyIOi5oOX+U2/nBBgG
	oH92KOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPh-00000003B5G-2D80;
	Mon, 16 Mar 2026 02:10:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPa-00000003Axw-3V8V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 02:10:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so650881a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 19:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773627030; x=1774231830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/yM1cLEJPCynSBddhLco3TyOcjIuEN7QpwgVXpMHAA=;
        b=enMSUrnQvWxwHH3GJfDTQdQHdKP2uc3ptXI4LiGe+F+MNKI2IgrktbkWj1E8v4hpRa
         WGW+OPobcs2QNAWYDkAjdR3AgfxibS7tLfsGMsa/KNRADMzwnDPL0j0hnDvIEcaFpU3G
         GsSsByWpLXi81nAtsRfB8h92aYjSJaCqyWEIOqSQUbEZZnIzRG4olpqXI7/bD3OGdGFI
         wdIXqJyYZdJBkD+PJvygP/cU4YKTXC1gdBMrplg2p1v++ilO6sPguMh6vIL9oh9FzMX/
         LqTrxRJLw7jsqYBV7+gXPwO4zJp5hr2e+Bruhq27LLtjEUpu4boc1P9pPygwIt9DjB7P
         WIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773627030; x=1774231830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/yM1cLEJPCynSBddhLco3TyOcjIuEN7QpwgVXpMHAA=;
        b=nJnJR/VZR+aBVGWlc56/kDcv2ol5LzaoszwtmrDA6hgWXIkO3C83vuuBA7BYB+owfh
         aXXm2fbq+5+FU7euFTOKKmke2tX7lBcf9LBmfE4eVVt5+hbX2Exx5xYBpob7/c+CfZdH
         A4PrOa4MwWJpQej9+DLCn/Hf7V3rZIXZ6RlHffS6ZmVhj+b9LWugGrhBuZDi5xFb6An+
         bR50KCV/KEU4I+/V6YRxmbtFns5qNeT3aGtplR4DbZVvAHiHJ8YB+08gOILncQ7dOdq3
         mzBxQ3+s0km+fXpzw+PY5rV8kBiUZi72jKipwApiczzldQ1xCMBrmxytVgyrWuZMtESZ
         NrCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBNaz/pU6g0aF1c8ueO/J/qIKQRH5eMQUtkIbHuDDnj3bLTGe4r79c+CvJLin5ptqQkH5aU5x5McAsqwCQclBp@lists.infradead.org
X-Gm-Message-State: AOJu0YxVFjfkx0SgeoAynhe6jMMvs5xBXDgAEkbMmrBqMd+TMCJFWqNd
	G0wI/wqJTPQLJPrMCAcyeLlo5F4ARYJixW1fDhlJH2ON2ZIXzRnDsy1r
X-Gm-Gg: ATEYQzzryt1CeUYGZgtryYs+hHNoX3B+N9ffhbsnmAyb7j9ApDH3IE4tLB7NKtP/UTQ
	UZ3Ea+q2w6/V4bj2WygCCXiTXYkhRDgnFwZJKS2JAyUhjWvZOnpfeWWfBAoU5EYITqF8fXojz4+
	xAfYVE5GKF6WcVfmAsBfmb+ril0aQvnpHikohGxqxAKUXv6zgnlbRNcq5AFTA3v8EGeBaYCL8uu
	wkj4HNClac0trRlLc4I30jSeyIoo1Wicxx76OQ+cYfbV0s1v7owcX1Ep/WQdtey0aXaPV84Y2kO
	CGZG4HDgM91NFznEjjaphRPdfkyAgMRLHiFgbjShT69zwQpfChXFYoSTUCxGApa6Dd1YlmT26sq
	Z5szv/74EUi6+1EFoZ5Hzyt3z44KLsiF8v51qrPnfW0TgAnfu86kxY//EFX64bpgZH9qODaf9Qw
	PSwEgTmaJEcu/Y+vlVWsR6tS6gEUUWTnGjsjb3PbhsDAnUANwcHpBmVR0W+Kyaw7yT
X-Received: by 2002:a17:90b:4ace:b0:359:f8c3:dada with SMTP id 98e67ed59e1d1-35a21eb5ea6mr10794612a91.13.1773627029885;
        Sun, 15 Mar 2026 19:10:29 -0700 (PDT)
Received: from luna.turtle.lan (static-23-234-93-211.cust.tzulo.com. [23.234.93.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ffdfb7sm17705805a91.14.2026.03.15.19.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:10:28 -0700 (PDT)
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
Subject: [PATCH 1/3] net: stmmac: Fix NULL deref when RX encounters a dirty descriptor
Date: Sun, 15 Mar 2026 19:10:07 -0700
Message-ID: <20260316021009.262358-2-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316021009.262358-1-CFSworks@gmail.com>
References: <20260316021009.262358-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_191031_547290_2A20E6D8 
X-CRM114-Status: GOOD (  16.58  )
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

Under typical conditions, `stmmac_rx_refill()` rearms every descriptor
in the RX ring. However, if it fails to allocate memory, it will stop
early and try again the next time it's called. In this situation, it
(correctly) leaves OWN=0 because the hardware is not yet allowed to
reclaim the descriptor.

`stmmac_rx()`, however, does not anticipate this scenario: it assumes
`cur_rx` always points to a valid descriptor, and that OWN=0 means the
buffer is ready for the driver. A `min()` clamp at the start prevents
`cur_rx` from wrapping all the way around the buffer (see Fixes:),
apparently intended to prevent the "head=tail ambiguity problem" from
breaking `stmmac_rx_refill()`. But this safeguard is incomplete because
the threshold to stay behind is actually `dirty_rx`, not `cur_rx`. It
works most of the time only by coincidence: `stmmac_rx_refill()` usually
succeeds often enough that it leaves `dirty_rx == cur_rx`. But when
`stmmac_rx()` is called when `dirty_rx != cur_rx` and the NAPI budget is
high, `cur_rx` can advance to a still-dirty descriptor, violating the
invariant and triggering a panic when the driver attempts to access a
missing buffer.

This can easily be fixed by subtracting `stmmac_rx_dirty()` from the
clamp. Because that function currently interprets `dirty_rx == cur_rx`
to mean "none dirty," its maximum return value is `dma_rx_size - 1`, so
doing this carries no risk of underflow, though does (like the Fixes:)
leave a clean buffer unreachable.

Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
Cc: stable@vger.kernel.org
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6827c99bde8c..f98b070073c0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5609,7 +5609,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
 	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
-	limit = min(priv->dma_conf.dma_rx_size - 1, (unsigned int)limit);
+	limit = min(priv->dma_conf.dma_rx_size - stmmac_rx_dirty(priv, queue) - 1,
+		    (unsigned int)limit);
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head;
-- 
2.52.0


