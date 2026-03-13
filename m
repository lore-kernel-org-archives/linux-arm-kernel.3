Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB52105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p0rSsXOHVPiLPE9YB/i36bApTaz8+E8i1mIA/i01iU=; b=Gi/vC0iriMw0C/L+bFbeOXIOcI
	nGDZ6Skm/FYTGAIocZgTSEOjz7tsPrf2nKLz74Eh5Xp+QppUS7Q2IeS/D8M/h2ddTPSMOX3rLAYEH
	+IvEC52el/BAIHI9y4+FEBMBVkCIAhkoE+o/vdwQgyOLUu5eFhMNpF+FfRhDQiTIyL6okUMxS79/K
	QvlCIEiKEEXE5iSsCf1psw9tEKAV1F2MKuZTrZ3R6vfryt0fOPaLAym5CSCBph/cTJB7kvAQP/rS3
	NLJR4ggnyWEn6WhmDUCiJOU6JYsnGnEPhQoEnvl2yJ9W672CTEIogDBWMr9xIj4MF9Vjk8yMx8WLR
	abk/xHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zB4-0000000HQtv-478C;
	Fri, 13 Mar 2026 09:51:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zB2-0000000HQt5-0dam
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 09:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=9p0rSsXOHVPiLPE9YB/i36bApTaz8+E8i1mIA/i01iU=; b=IEQRgg2MkuL60pYYtR5nx4NLv1
	1gbbK6oICvreIJQDYh4sn7TNxHqF94NUnuVqIp+pP+QqUlmzNVETSL5MF2IHBJfJbHZ1s/N6wZCG+
	cEu0NJJAHKHxi5L/dQwBjvV1jCgAdw0IX+9xrrxRczlVc3o0tF2aA4LRcwaNeE/0syju9uwGCSQtD
	T1B0Wc6U7u+uT9/HdtyipCaze/7I/FtdjyC6IE4n9YQUAYPOGN6/q8UswYss7NICVTcNVRSGRJ0KP
	ienZX/VblqtLDETWEs9aSAkhkYGtMsN/aJvcOs+JhNqTybt+SsCI7Le9DuiMZG6YGPw0LqSlw9zV4
	38qsrMVw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zAz-0000000311f-19rA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9p0rSsXOHVPiLPE9YB/i36bApTaz8+E8i1mIA/i01iU=; b=ng1NtnHXdcGB13nYO7cWqw3FOM
	dRjsZkIFuvM9Kt0KhXC+709SjM5jiciGxveNXkDj2FDct2GYYh4h5qEP77VeaN76P8jBBdAjVeg5J
	Zr9KZlzKEwuUQ5ignMn19VdeJYKVbUmFMDXM+dqL1Et35rN36af47JwM28h3Hennr+m4wvuqmpFrV
	TmXFttXUGrC+C8lO27UQHrkOvNrWYUEyWM7ggrNhqEllY8U389L5Rz/X+REs8zStRYI9NrFPF0yqI
	wvOMsqIyzkGpWdM9lhdO96qFibE0gQuTO3qY4ioxOAYGWt4FAHOwPAJpV/mTLYmSrCvuVDh0Eiw3/
	w4izRfGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36402 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0zAo-000000000cp-05sD;
	Fri, 13 Mar 2026 09:51:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0zAn-0000000D4FA-01WH;
	Fri, 13 Mar 2026 09:51:13 +0000
In-Reply-To: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
References: <abPdzyXJHqt5v3bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v3 03/15] net: stmmac: clean up
 stmmac_clear_rx_descriptors()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0zAn-0000000D4FA-01WH@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 09:51:13 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095125_443250_B07F603A 
X-CRM114-Status: GOOD (  10.71  )
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

The two paths calling stmmac_init_rx_desc() are identical apart from
the way the pointer to the descriptor is fetched. Split this out.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0dcf4a31e314..765b168df50d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1514,20 +1514,20 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 					u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	struct dma_desc *desc;
 	int i;
 
 	/* Clear the RX descriptors */
-	for (i = 0; i < dma_conf->dma_rx_size; i++)
+	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		if (priv->extend_desc)
-			stmmac_init_rx_desc(priv, &rx_q->dma_erx[i].basic,
-					priv->use_riwt, priv->mode,
-					(i == dma_conf->dma_rx_size - 1),
-					dma_conf->dma_buf_sz);
+			desc = &rx_q->dma_erx[i].basic;
 		else
-			stmmac_init_rx_desc(priv, &rx_q->dma_rx[i],
-					priv->use_riwt, priv->mode,
-					(i == dma_conf->dma_rx_size - 1),
-					dma_conf->dma_buf_sz);
+			desc = &rx_q->dma_rx[i];
+
+		stmmac_init_rx_desc(priv, desc, priv->use_riwt, priv->mode,
+				    (i == dma_conf->dma_rx_size - 1),
+				    dma_conf->dma_buf_sz);
+	}
 }
 
 /**
-- 
2.47.3


