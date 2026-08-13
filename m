Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB453C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sht1wpc2JaD5RBgXpQ5clgBvN8Zd0QFzMWE/NcW/TSg=; b=1Lq0g6SZXBycZkvrbrxyXq4KBG
	N5EQGDAB9QtjoHQen29t7AdHVlUBmpeAPYxPxlofdhplYH/mO5SvvXdeMNW9MCP5DsHuLncm1xMzm
	due/iS6JoDt/CVYdJfC1vTYcmKpP69cR/YKZPgS3uuBUgQesjsMO1v2WjVwqZmtZAQi/nvuFe9eVC
	CrVhkP9Di5Pzeiahw1o+ebIQTXpiIjN2dmUbMYazk/VPPxuEMivAYZeerf6fUOlDf6yUOQaJLMWXL
	MSDReE4Zx/ZfxB3lbm8TvdePFIDXa0nveUX/bnOLvKGDnFLYlEWXza//APtCiHT4jaxrlw29G+Vn0
	hjjoRDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCV-000000002kr-1Np1;
	Thu, 13 Aug 2026 07:50:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCQ-000000002i1-2t38
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:50:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4954df200ddso2823985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786607401; x=1787212201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sht1wpc2JaD5RBgXpQ5clgBvN8Zd0QFzMWE/NcW/TSg=;
        b=hMFgQF5L3JdregZPL6HcHcVpxpXh0E2adzT2MynwDBKtEFk6M2M0A1bIT1nDzmI9yw
         CboyjBjDpFzOfevHJXDONeR9k+jwiLYXZHgSZupOFyqGQueoCmcIQoMdaUzAtcTeIO1w
         XUd2ZJvIUrnWcewxPdC/vouGAf6/0e9nACc7JxzhG3iI4tzeiRejSOwLzfcAyFr93bNW
         tZFPrKncWRRQOdhN2QK5NNeGY7snyKFwZmg3LNQ7FLZMxiBpv2ccezrAMJwoxJyx+VW8
         fI1nksVVhXS4E8UZrAePeqHGHQOrrXFzpSz0nQqtcIv1dpZ4SwdflrEEtNxHdr03jHqu
         uUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607401; x=1787212201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sht1wpc2JaD5RBgXpQ5clgBvN8Zd0QFzMWE/NcW/TSg=;
        b=MoP+2sgyCQrIURbQm43cbVe8f5Jvwe8sQCFatJq4+i9M0PDWD4RV59QaDhf4kGenrJ
         q1l7XBI1c9WMdpMoYg+vVWDlHA9SjCvAPEDS5hLyb7c64MI9PP8asTVi/c6TolJGtwzF
         f29jFc599n3iNILB7tDEloMVyzfMHvto8QAW1ywY95xgR9bEJ96mS1hFS+oIvxYcd/me
         wIRN5smy3P9yZRTQmNw+MJkdmmhoNaN2NMyHfo/G5Fv5frwf3i+YQkImfUeBMbRjK3cO
         8GwEeNtOq/Sj7TW/BKSsWRl6Ynv4SKIdHbmCVOvUG3FVlGRZJuRgo6eW1fPSniGqRkIy
         m5wg==
X-Forwarded-Encrypted: i=1; AHgh+Rpone3pMfneRmx/VW7Yyb1z95WQCl7Tr3gXzd+LYmKrpLiMWmFcuCArXOsD4c8e0fNciDTHKtCTzz5KQA7ooPzW@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ3a3hrOviH9lB6UK6lMVdMWZyGklMnfae/JEROMQwZen/xkqX
	GZeVjG9Ew1BQbaDXdjzISkBjoZfZxU9g/eirGeI1jtsxc/BzdFDfddBs
X-Gm-Gg: AR+sD13ajUS4QOhH6l2VA+gX/SmwDlULXVQavLZkwsNnnc5Hh1QUTIGVZcu27nFPrv8
	dxTxMqG34xYrw58XCQAvBt88wcyueaiF6Iva3hPhSOiWImK53WlJhmE4WkOJbiBjFpVvTvgTCmL
	crMh7zc+P2jT/H+3tQMyLQ2wOpbPl8K2HfY5lW3Bb9TsK4aYgDGJqx6wcnOkYFf0KT4MYVw/EUj
	SC97KHM1gIqOApmQav+oXjN2gXRSz/DDmU8oJps5EHVmoef7FqV+ldSUG1Vs9rQZ21o5CZ6x2lV
	x4U0D6fYmX9GqqJrNmHF+3MOIzY/hL7tTLSg1cwZV60oCHVKCZvnj4Hv/c//arSQhGPdkGH0hR+
	IPAoITt6AjS3QCaYtfCmWw0U3Ws9PpIO9JwJsMjhzRnGXP2IdP0OxBN49EfQTTxxToq1oVUcv8E
	AJSr9VZg9IrMurhZhn5UGh2+Y5/XL3RrDHQZvDEWWVu5B27SFQ3wjLYHI73btooTDDpxLUitnAn
	4u5Fy7LxZJL7IT4RRsiTrV3CI5sW3P6AhPvn4Zafw/BsLGPfLc=
X-Received: by 2002:a05:600c:8209:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499821f1273mr49179195e9.11.1786607400830;
        Thu, 13 Aug 2026 00:50:00 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b62894sm41936365e9.13.2026.08.13.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:50:00 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Date: Thu, 13 Aug 2026 07:49:27 +0000
Subject: [PATCH v3 1/3] net: stmmac: enable MAC rx/tx after DMA start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-stmmac-rx-fifo-block-v3-1-738acbee55d9@gmail.com>
References: <20260813-stmmac-rx-fifo-block-v3-0-738acbee55d9@gmail.com>
In-Reply-To: <20260813-stmmac-rx-fifo-block-v3-0-738acbee55d9@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786607395; l=2198;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=oLJsS8Rav70RicuKxT5K0qmNv7lDA+PehXT5PqdKKNQ=;
 b=hJo3R0HUUrrbix8X3VwmEqUsVK8fR1LNfIWebwZ0c3IPfe14IWCevuyQu7bdSHoIuNgdeoAdz
 /kxuNoZ6eCFCtBKcosxxy1Ff0Od+wPN6JCggYGfYdAnse5WAN1dZBUD
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_005002_757085_7A31123C 
X-CRM114-Status: GOOD (  16.28  )
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

When the MAC receiver is enabled before the DMA channels are started,
incoming frames fill the MTL FIFO with no DMA engine to drain it.
If the PHY/Switch is already up at this point, and there is inflow
of packets towards EMAC, the per-queue FIFO overflows within this window.

Once the FIFO is full, the MTL read controller goes idle and never
retries delivery even if the DMA comes alive later on.
This behaviour happens due to enabling the MAC RX path before
the DMA setup is ready, and any delay between these events increases
the chances of blocking the rx path permanently.

The EMAC should only accept packets after the DMAs are enabled.

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3591755ea..1213cb216 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3692,9 +3692,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 
@@ -3750,6 +3747,9 @@ static int stmmac_hw_setup(struct net_device *dev)
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	phylink_rx_clk_stop_block(priv->phylink);
 	stmmac_set_hw_vlan_mode(priv, priv->hw);
 	phylink_rx_clk_stop_unblock(priv->phylink);
@@ -7189,12 +7189,12 @@ int stmmac_xdp_open(struct net_device *dev)
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Start Rx & Tx DMA Channels */
 	stmmac_start_all_dma(priv);
 
+	/* Enable the MAC Rx/Tx */
+	stmmac_mac_set(priv, priv->ioaddr, true);
+
 	ret = stmmac_request_irq(dev);
 	if (ret)
 		goto irq_error;

-- 
2.43.0


