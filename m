Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECD6C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4QXIQCdFZb4CzT4aVD2qApaTNEzh2KXvqhEKJ0aoFA=; b=UnGvCH0gsJNrsppsibKLEArV9F
	kVhKFsyrbmwYQIa99axJibbsjxocEAXj6vxkzhWbcciYHd9xCEbT9ixtZwWZyKySkRfHYpDMhCSRG
	Q/KsBhVSuKCY4FcVxF6BBwqB9yeDhBf58leuRaU2QTNuXlDo/4wS7xn+A1l3TZG0GMnYvBMqMZ7GS
	sQzPibvPimOqGk6l+K9Nqu56KdW7iq+N1LeOK3fdIHhsitMa3CmBTOIYrOiXRi+OVszktDCPEdvJ2
	Z3U8UTetcFdqjj1dDCRWoFuNT215etDMJZfAlwWoAX46o4kEAuBw3pJ/27HTvsVi31tnJvM1flB1+
	jq1CzOPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUYh-0000000FaRp-0c86;
	Sun, 02 Aug 2026 11:40:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUYf-0000000FaQx-00VM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 11:40:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 72C0E4E410A1;
	Sun,  2 Aug 2026 11:40:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FDA96029B;
	Sun,  2 Aug 2026 11:40:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 009DF11C1757F;
	Sun,  2 Aug 2026 13:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785670837; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=r4QXIQCdFZb4CzT4aVD2qApaTNEzh2KXvqhEKJ0aoFA=;
	b=Q6v6jRA/qLormalEK99NvV0UHWZVCUQOouW2uqL7p6onWkt5R/ER9DoKWBPCsCnvF5pC1K
	iK+1yfjTHKe6s8ZlIrO2uaa9AsHQddf2w+khDWy6mU3g2k4cF7jkkoS13HDB6iQD8T/l5B
	5CKqDRaK/DYX6CYvUF6gnUKedp3kRnE/0eKplg/RBylucgx9r95rRVh1v/f4Ka0zgH3ZPm
	1wWn4E4b9BaMsTtgX4eIccZAP7sYCcihEkD6b56+2xgzfFqIHmLi27sLiuoqgE6FfqqPYS
	c7CQxxRbGqEBUd1pM+ayk6xEL7lsL2JRu+vE0ixkSULQi9vY3WYPXcaz8AkYlA==
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
Subject: [PATCH net-next 2/2] net: stmmac: ethtool: Address off-by-one when reading the coal rx-usecs
Date: Sun,  2 Aug 2026 13:40:14 +0200
Message-ID: <20260802114015.214212-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_044045_184570_63F5B5F7 
X-CRM114-Status: GOOD (  13.19  )
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

When reading the rx-usecs coalescing parameters on a dwmac variant that
uses the RIWT for RX interrupt coalescing, we convert the riwt value to
usecs :
 - One riwt cycle is 256 clock ticks, we compute how many ticks in $riwt
   cycles
 - divide that by how many ticks in a microsecond, and we get the
   rx-usecs.

The opposite computation is done when setting the rx-usecs param.

Because of the 256 ratio, we're subjected to off-by-one errors in the
value read-back, which can be reliably measured on i.mx8MP :

$ ethtool -C eth1 rx-usecs 102

$ ethtool -c eth1
  Coalesce parameters for eth1:
  [...]
  rx-usecs: 101

Let's be more explicit about the rounding for the riwt to usec
computations by using DIV_ROUND_CLOSEST, which solves the off-by-one.

This does change the boundaries of accepted rx-usecs parameters, as the
previously accepted values were in the 16-246 us range, and now fall
into the 15-245 range on imx8mp.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index eebfd6976aaa..154cc0c7623d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -762,7 +762,7 @@ static u32 stmmac_usec2riwt(u32 usec, struct stmmac_priv *priv)
 	/* Receive Interrupt Watchdog Timer (riwt) has a resolution of 256
 	 * ticks.
 	 */
-	return (usec * (clk / USEC_PER_SEC)) / 256;
+	return DIV_ROUND_CLOSEST(usec * (clk / USEC_PER_SEC), 256);
 }
 
 static u32 stmmac_riwt2usec(u32 riwt, struct stmmac_priv *priv)
@@ -775,7 +775,7 @@ static u32 stmmac_riwt2usec(u32 riwt, struct stmmac_priv *priv)
 			return 0;
 	}
 
-	return (riwt * 256) / (clk / USEC_PER_SEC);
+	return DIV_ROUND_CLOSEST(riwt * 256, clk / USEC_PER_SEC);
 }
 
 static int __stmmac_get_coalesce(struct net_device *dev,
-- 
2.55.0


