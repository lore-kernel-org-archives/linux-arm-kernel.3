Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DFCCC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOeaatzk9bhuYpSzqiCT8rOTWkQH4urpPw2fjdSr5Ec=; b=1IWHj3jwAi5/FREMvGM+4sxyV/
	yHyuIgSn9NhoC4h0ibmnksg6c+Tno0AwNOflGVZ6hfJx4IMgRjECXj4dr+2Ps2q0+8wLnNYSB4cj5
	xTt6vQCwL+6S9olvWk+VT9b59SeqYLjJymfb/ZFHkHExUQjXq9wPCNp1OILGk4L+gnMP8uMR+l1D1
	L1nKO0YbmvCDquXDyuft7Yzo1is0gMAVyqp0yVjy6YFRd9NglaOgQXXOS1wOcQW0kRUpQYbOkSp5U
	D014pKETD965g7uuIqNts4Q0ywgYv2nRgn6APdxnRarTvfUOXAzl9MYV1pnt4GdtXirfkJ3jShLMX
	Bl47NUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSR-0000000EbUt-2c1Z;
	Wed, 14 Oct 2026 06:27:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsSO-0000000EbTW-3Wjt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:27:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a061a13884so31744225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959239; x=1792564039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOeaatzk9bhuYpSzqiCT8rOTWkQH4urpPw2fjdSr5Ec=;
        b=aQihv3keq4v3RNLHfAEuvpYNgQMV7wIUMoih5hmUPIwFBAKomYwfBqYCJUO7/GZnsA
         j04YjwFY1UonF3+fbRJtD07jeIMUjsBEKKub8ro3FMVGOUJ4cRn480A3SycKdkZwB4ZG
         N0cPxA3o/ATfeizymjK3iI96JEWXmD2xoc3C9UzDwIGjkrej6P8599X8ynmYRlKF1B5R
         SJPLqu0MXYJMMiebXDf336Il8yNRVFkrYMbUgp0MajAtIyoUjrig0pGEOwesKCZcIH9O
         hDjHLp6SwdI/8vKUnKw9IwtQIQ1rkDGjaC1iZNsf6g1jWQjJfo0vQX/D+JOiiVUDmxBA
         X1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959239; x=1792564039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOeaatzk9bhuYpSzqiCT8rOTWkQH4urpPw2fjdSr5Ec=;
        b=mxhPgdbPTY3qwslhR2JBVx7Nm7elVSJZXWaPQ9HfrlqlxlPswQnHM53sbqdXOesokd
         Ey8iV3wq5iDhgzDeL9hYEA1sb6ao0lMQaJybK2W87LgeVTp3EAH9ravR8uDIpSveazej
         rouLy0uWtX2vEO3ZX3m488c2/a4hnH597EcSz6BnkTeuWaquBxdKmtNASDY+sOjNLmCV
         MU0Ngfxlu/yXI2lXO9CI09LwllvKD9XZ7DoZJxXA8aNMfKl2/5B0o9WDsxsMUiY/fQT/
         1ckcOjXF/0U3wDQeCDbGZdcnL4VElHWyw9UWR3L8Px7c3nCMvDvfxB/kR5BAd0X2PiI/
         goJg==
X-Forwarded-Encrypted: i=1; AKwUvBx6WAMtr5HVPQ/V1tlQX83+3/gBL1R6THR+DjROf5HTVVlfuY0h8Wo+32SByEnGsQDBO4HQmCDJyOaXA6wL42K7@lists.infradead.org
X-Gm-Message-State: AFq9FYLvxLMoDrzIHSGfpWylAsSXSXSC58MBCI2lT60oGFwC8QSdJvsq
	ONcdDgIUwMae7meXkQnGT/yspS0OHzVIfNYEW0vpLmapCxKeAAG5vLQ3
X-Gm-Gg: AYBFou3c2IpObbIyM/acHhTi6tlHxxw/7NN54AGt5MhZURCiOP/cQn/aiul84/V47pq
	PujCMBzcr7bIIu9WzO1/GWRRxvmP6kbMNtaNdvdY8M26ibfpE4S57jv0aFiJsQIUyzBg6pTBIWP
	SU4z+eVyGGweZuGHNfH0kK/Xikv4Cq7kJERNd05ELrtPKBN/I6C6w8v9LeAzHcUR0wZRPDCVV4P
	wFg6dtj8bMIu4qBccr039SFttrux2OqMLClp5CLdwjgGEFEpQfQtYaH/bQJjpyq7gdnm3yH+vS3
	bmWsrJw31+ebEuPQi5ZqNllY13TV7kxcH2Lw1HwgGTtYQgRUDiUt+5OQEIBHQ2c9cMezp6PvwFv
	iyxPVMJypG5BBwwk3fK630pmYcMQ1ygnNpY3Pfs8F7g6kiaB6VZzXAGl7xnGNYVqVSdri/ICAdb
	Fx+1Oi53qvmXfsRoGYDVeC/d2ROWrQNO64dixF3bY3FZe3/YV66DWYHNP5rxikXkIvtUSokq3tZ
	Z1DfoofNQQymB55skGvmXn+ZJ0OTJLGoAlf7BlRPwMsi8ZZif7os+K9vAjIXvhyNuSNP5yRJPGf
	TEj9pThFiC/lXyo4XT7PRipG0/60U4xMZf0EyrrUdBqjcNiGJmNsapotUTxYiDt6EyIJOSAcmii
	pzu7OR+oBWTe8cQ==
X-Received: by 2002:a05:600c:1c1f:b0:4a1:a484:2c37 with SMTP id 5b1f17b1804b1-4a1a4842caemr152491245e9.25.1791959238943;
        Tue, 13 Oct 2026 23:27:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aed1-da01-ddff-863b-8308-ab16.310.pool.telefonica.de. [2a02:3100:aed1:da01:ddff:863b:8308:ab16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm528846745e9.4.2026.10.13.23.27.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 23:27:18 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Joao Pinto <Joao.Pinto@synopsys.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	bpf@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/3] net: stmmac: free RX resources when TX allocation fails
Date: Wed, 14 Oct 2026 08:27:00 +0200
Message-Id: <e7a5380aabfbc03bd560ab08f37ea255d11d528a.1791958735.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1791958735.git.kmehltretter@gmail.com>
References: <cover.1791958735.git.kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_232720_894888_999B0072 
X-CRM114-Status: GOOD (  10.98  )
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

alloc_dma_desc_resources() allocates every RX queue before allocating
TX queues. If TX allocation fails, its error path only frees TX
resources and leaks all RX resources.

Free the RX resources after the TX allocator unwinds its queues.

Found by inspection. On a BeagleV Ahead (TH1520), forcing TX DMA
metadata allocation to fail left the RX cleanup event absent. With this
change, both TX and RX resources were released.

Fixes: 71fedb0198cb ("net: stmmac: break some functions into RX and TX scopes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 495ff7aef..8fd7d2173 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2425,6 +2425,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret)
+		free_dma_rx_desc_resources(priv, dma_conf);
 
 	return ret;
 }
-- 
2.39.5 (Apple Git-154)


