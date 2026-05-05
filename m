Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A13CD3430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVjljbLxMN1Ao9P5aPmniNVCYmfyzPj9ri1tx9ADzF0=; b=gPwj5S1Dh/dw/yulUL3NQMk7xI
	40T/thU3rC7RtBXVwNkmlqUKMKO9bTaG729rbaxSIGO5x87ZlfK3yVxnPE0kjcHb1Ly2Yj+CVGlyu
	nkqG8bId74KUosyf61MhNt7X2W/dz27adRhib/y3b/ENM/wYRoWpYTiKTNFwz8ZB9ILDH6H7KYyc5
	nha0Pgg0+dzamqikeGExlMty/a6u0c9Jm7hkNkzjFFLX6T6yPkCZB8M2+A3GOZDUKjWFmJsvneI1A
	eRAFGGnh9XLot9lM7XcXvPtGggXvw3yvG5CHWDQx9G+FKxguQDMFr223d1LIGywSQAaHxVXn7bEDX
	F7BjR5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKB3m-0000000FWHA-1ptk;
	Tue, 05 May 2026 08:23:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKB3k-0000000FWGr-2DFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FC4160125;
	Tue,  5 May 2026 08:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D07FFC2BCB9;
	Tue,  5 May 2026 08:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777969394;
	bh=Ind4ewbTlV0VMaMhRBhUOAJ51ivGX/THmUva9v/9gmM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=f2M9o2jPkz+uTAfhKYX5YkSYI+7u87WX9J92R27Ny34tJVw2/einWFQVPGJzLRIV+
	 tJlEsetedtd67kB0cJTD9CSSmehibKuRitWy2gfFlmVbzb6aS1FS03MaGW3Cnx1sAH
	 bCDKOOQRtgL40/GnDMd0xwv3Fn1vinkB/q/+18bfc7yrVy2khSL6vRLyvnJaTZvZf9
	 3m/lP0WJmdw533Q1AkefvNZlHfK5cvHq2goaCVqB1Ds2uxq+cOxVkOM7zGRA/W7pmV
	 Q7kZfWHTBBkwuCI3mAatmXjH0z3XDA/CeBMp45ne7twljN7PJhQHhcEB0TtoggxfOd
	 qjViqG+YX22fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EE3CD3430;
	Tue,  5 May 2026 08:23:14 +0000 (UTC)
From: Abid Ali via B4 Relay <devnull+dev.taqnialabs.gmail.com@kernel.org>
Date: Tue, 05 May 2026 08:23:07 +0000
Subject: [PATCH RESEND] net: stmmac: fix RX DMA leak on TX alloc failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-stmmac-rx-desc-cleanup-v1-1-df85cd095ebc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777969393; l=998;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=6KNXYVuQw7qzkBuKkHzTHDqB5iOSzE7NC8yleiDYCcg=;
 b=dzQlfnpwahC08WkpKQ0tTinR9UEjPL8aHxj20pFBtZJaX/rBZuZ3C4W1mAVOnRozY04M1UhGs
 MgNHvyl7iCwBLgbr1viXQcq7sz6Ik7I3ZbtoXTL0C10kDcNVVtAAbiG
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-Endpoint-Received: by B4 Relay for dev.taqnialabs@gmail.com/20260425 with
 auth_id=752
X-Original-From: Abid Ali <dev.taqnialabs@gmail.com>
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
Reply-To: dev.taqnialabs@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abid Ali <dev.taqnialabs@gmail.com>

Free RX DMA resources when alloc_dma_tx_desc_resources() fails in
alloc_dma_desc_resources().

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13d3cac05..8bb843b55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2370,8 +2370,12 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret) {
+		free_dma_rx_desc_resources(priv, dma_conf);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 /**

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260425-stmmac-rx-desc-cleanup-440f05845492

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



