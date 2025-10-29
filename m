Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1418ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6BQL6pYIyYcfD62z4eFR4ZcGsYapOwH4KmWb8UERcYU=; b=UHLNYy/iimBdKgYqQBnRJbNM+a
	SE6ot45jZnEOXz0a9WkK48WwKN2BdkUUpfcYYvGpBKb+E3S1qojNLcxTVONJbL0CGAOrsSgkAhUJ+
	1wT0hfZjwI/yOCTVFz9RoRv9BGMaJoqVevT+kLEb7HSttVtSa88sQxE/d+nPXr5isL99PWjZXBQez
	rMdRlrTnYPPji+yLvJSe0FjRmNJq0AaVzMegUN9uZ/VmmoUh0YP6rExP542U4N6IrRtAxHvOG4WsY
	wJKoisQP7g8VWJ1BKa3ebnPeUreeoTw9S/s0DzOaWDGk+vWn4A2a4YT43KqZQK9GX5szKsnpOvdb/
	i/gpIg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1CS-00000000ClB-1wl9;
	Wed, 29 Oct 2025 08:06:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1CM-00000000Ceq-0CBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11F2C49258;
	Wed, 29 Oct 2025 08:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4E36C116C6;
	Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761725185;
	bh=EILhiXwSG8mnsP3WGsVKBzN2WcZ7wKbqmXj+1wrNFzc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HIlPSwP91NTIR8DUNPxOnv/QWitRD5UCo3NK/LPNUYywq319bFSleyjDrASLyZOET
	 EyIg0r/E+LHUX9/Hq+kfNL+Bos3HAlc31jpPtpI8ebdy1KmvlWbpeevQy/Ea0m+MsE
	 CZxtVAHJ/EZkb4P+nKtVgKgkFcVUPxK8S7u3BT4icP5l9DzyGjLdGSKdp93YlfQpxM
	 A7gXBhn4zDD0LE6oqsKQVGXdxN1R/kNNxiO48BnxfFr9jKfR/pla2chJzOGgRZwPjX
	 q2cO7hiXVFPHEOKIR6bAtvg3xGjatE25cb+zcJGNTO3LMtqDlcnP6GoljUjd61a2N9
	 knbmbYWBeMLEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E74CCF9F3;
	Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Date: Wed, 29 Oct 2025 16:06:15 +0800
Subject: [PATCH net-next 3/4] net: stmmac: socfpga: Enable TSO for Agilex5
 platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-agilex5_ext-v1-3-1931132d77d6@altera.com>
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
In-Reply-To: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725182; l=898;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=p2uWSKKuLwxCOpiNDSbfDTRN7HWTGIFC7QoK3weEpGc=;
 b=zvAEVmt+YCzpgZzoyQtINmkYcMh3/hMOKUNLU/c2tHXcq3h/po36vCnYfNbJL7FRIrYsYIqLa
 yFsbzkbCYp7Bbvx1f8salXZIKI48J2OoZKGS74Dg5MPOSyLxdweez8P
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_010626_138037_0B9A597C 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Rohan G Thomas <rohan.g.thomas@altera.com>

Agilex5 supports TCP Segmentation Offload(TSO). This commit enables
TSO for Agilex5 socfpga platforms.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index c02e6fa715bbea2f703bcdeee9d7a41be51ce91c..37fcf272a46920d1d97a4b651a469767609373b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -474,6 +474,9 @@ static void socfpga_agilex5_setup_plat_dat(struct socfpga_dwmac *dwmac)
 
 	plat_dat->core_type = DWMAC_CORE_XGMAC;
 
+	/* Enable TSO */
+	plat_dat->flags |= STMMAC_FLAG_TSO_EN;
+
 	/* Enable TBS */
 	switch (plat_dat->tx_queues_to_use) {
 	case 8:

-- 
2.43.7



