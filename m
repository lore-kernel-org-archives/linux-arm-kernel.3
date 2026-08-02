Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FFDC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 11:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4Tgmpjf7Ilmqtz+aDL1dWKoCzuAU0Ep6wZi5PJ2Z1o=; b=h8xxdEOlpzUPLDfcll2229sfgB
	OmD0M63bJZmMQ13UZF2CD3izFyM6FlH5Yd95jNR4K0SQ31x4y1+dWOevm0xf4RIjo3JK7bptXMBco
	q9yAF8lRTN7KqAsbAyAQ7bMhx3iT0yJtmsxTYDL9pJoetOgSaavAc0Bs8iL4x1ko0ZmBCGDwbuT+m
	sPrz4FxJI2yZPP5v5hoDENxkNx6euSwwAENGFgisp6dd2GMMbv9Tx1UdZQTjDmHbeRzQfXuvS0R9o
	WfXxcQpP2QXN9t4eruJMGz70jAxpFZkzItnMEzDTNTZs2kzY9PnNG5VVv0aIc7whPecn2KLgYlbMR
	99YD8G2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUYa-0000000FaQ9-44J7;
	Sun, 02 Aug 2026 11:40:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUYY-0000000FaPT-0XP5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 11:40:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE3BD1A13B2;
	Sun,  2 Aug 2026 11:40:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D51B6029B;
	Sun,  2 Aug 2026 11:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFF7311C17580;
	Sun,  2 Aug 2026 13:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785670831; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=I4Tgmpjf7Ilmqtz+aDL1dWKoCzuAU0Ep6wZi5PJ2Z1o=;
	b=PAngdWN6Kzyy6RaS1SocProVrElUHk+7aR63UdtGX8aeUFj5FKxZA1GHiBktiFT6xEPsQC
	4inKyi+YGs+ojuQOCYoU2piqRRPPWMx5BOAa8DCTlLgPaAnZWOpcCHB8kO/pHt2+CasYxa
	lXbadogFobFi5rxEjWN/nXXRcwlnEOGTfWcEMM7oA9WLBbZqh4dpc6m4CfB1Ze7QQ0o03d
	qEBVvuwvC/BfrQxq6+XESu/d+aRqFe7SqlErLTRyJQu9n+t7pbaK/2AJrYeeIxWl98s12h
	8fRu7/+m5CczHDwrlK3ENeQN5qbVywY8qNlwwYP8xAT70l7gDELcsyA4ZOKxBw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 1/2] net: stmmac: ethtool: Comment the magic numbers in RIWT computation
Date: Sun,  2 Aug 2026 13:40:13 +0200
Message-ID: <20260802114015.214212-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_044038_711770_F38A9B87 
X-CRM114-Status: UNSURE (   8.82  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Receive Interrupt Watchdog Timer is an RX interrupt coalescing mechanism
used by some variants of dwmac. It allows waiting a bit before
triggering the rx interrupts, allowing for batch processing.

The RIWT is configured with a granularity of 256 stmmac clk ticks. Let's
add a comment for that and wrap the raw "1000000" into USEC_PER_SEC, as
we're computing "how many clock cycles in one microsec" with that step.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 92585d27ab88..eebfd6976aaa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -759,7 +759,10 @@ static u32 stmmac_usec2riwt(u32 usec, struct stmmac_priv *priv)
 			return 0;
 	}
 
-	return (usec * (clk / 1000000)) / 256;
+	/* Receive Interrupt Watchdog Timer (riwt) has a resolution of 256
+	 * ticks.
+	 */
+	return (usec * (clk / USEC_PER_SEC)) / 256;
 }
 
 static u32 stmmac_riwt2usec(u32 riwt, struct stmmac_priv *priv)
@@ -772,7 +775,7 @@ static u32 stmmac_riwt2usec(u32 riwt, struct stmmac_priv *priv)
 			return 0;
 	}
 
-	return (riwt * 256) / (clk / 1000000);
+	return (riwt * 256) / (clk / USEC_PER_SEC);
 }
 
 static int __stmmac_get_coalesce(struct net_device *dev,
-- 
2.55.0


