Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFAFCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ535sMG9SHzKQxaCXBfr4JfaELjSThyJX0LteFzYAI=; b=xXjfUm0c48PohSgS21oCrKVfip
	qpcb+cHv5IEItCr1ZmXRgyFDjX3vMVIy/nnnfbVXI8V2WYdHFVrygbIrtqJKsO7reJsnMQV9b3Am1
	zz7vDDVqD00e/7JX/zcONh3qK7E9lDXgIc/+/zWQkcemGQRFPD3AEb8msechNAzO6WKPRYVLT3wBW
	p+WWtjEVKwEciOJzih2nM5Ifldbp+Qev/8h96Z+2nNZ0DDUgsF5Fp1mvyiykAH6NdeiFciGPt43c3
	Otb0MB5xZgqq/b2rujWZIJtZI9/6WeGQLBCxCD841dE8qdcGVjOY0Z0TrdSYZoX500pzV7IHehOJv
	8JXe5WSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsM3-00000007JpS-0JC0;
	Wed, 03 Sep 2025 18:37:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto2n-00000006fxS-47qI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UZ535sMG9SHzKQxaCXBfr4JfaELjSThyJX0LteFzYAI=; b=N9VGlBQfCIXoCER8b40eEiqZr0
	45BFRSok5U/ALiTU1M1+lI3qJ6nfVhxGcOASOZWkl8+LvD8pXTeozsI4tpfPYepPFUli2D21WqtXH
	SpvsjTSs+QJLBqMl1JlFMUy4PUPkn4aCyU48XNS+nRbklbntWsS94wIce0rY9A2l3JF4gB/g9iXqI
	lZoNo/IXljxz3/1VFOSeUKmGVRY9N8EtlvDVbBQ0pvAEWQ2aTgNwYpNSsgW7WzHkwgkEmFqoMGKlo
	frhX7jgBWoGJpgmoX84OHYDOB3oNrO/BXidU5ZmfaD48YDTeKFmCjuzUk0f1+vhXQ0lBm3fd150OZ
	w0965dPg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52698 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uto2d-000000000bz-3Qsc;
	Wed, 03 Sep 2025 15:00:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uto2d-00000001se4-0JSY;
	Wed, 03 Sep 2025 15:00:51 +0100
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/2] net: stmmac: ptp: conditionally populate
 getcrosststamp() method
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uto2d-00000001se4-0JSY@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 15:00:51 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070102_036134_1D9A5E61 
X-CRM114-Status: GOOD (  14.28  )
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

drivers/char/ptp_chardev.c::ptp_clock_getcaps() uses the presence of
the getcrosststamp() method to indicate to userspace whether
rosststamping is supported or not. Therefore, we should not provide
this method unless it is functional. Only set this method pointer
in stmmac_ptp_register() if the platform glue provides the
necessary functionality.

This does not mean that it will be supported (see intel_crosststamp(),
which is the only implementation that may have support) but at least
we won't be suggesting that it is supported on many platforms where
there is no hope.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3767ba495e78..8b4cf1a31633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -247,10 +247,7 @@ static int stmmac_get_syncdevicetime(ktime_t *device,
 {
 	struct stmmac_priv *priv = (struct stmmac_priv *)ctx;
 
-	if (priv->plat->crosststamp)
-		return priv->plat->crosststamp(device, system, ctx);
-	else
-		return -EOPNOTSUPP;
+	return priv->plat->crosststamp(device, system, ctx);
 }
 
 static int stmmac_getcrosststamp(struct ptp_clock_info *ptp,
@@ -278,7 +275,6 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.gettime64 = stmmac_get_time,
 	.settime64 = stmmac_set_time,
 	.enable = stmmac_enable,
-	.getcrosststamp = stmmac_getcrosststamp,
 };
 
 /* structure describing a PTP hardware clock */
@@ -296,7 +292,6 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
 	.gettime64 = stmmac_get_time,
 	.settime64 = stmmac_set_time,
 	.enable = dwmac1000_ptp_enable,
-	.getcrosststamp = stmmac_getcrosststamp,
 };
 
 /**
@@ -332,6 +327,9 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->ptp_max_adj)
 		priv->ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
 
+	if (priv->plat->crosststamp)
+		priv->ptp_clock_ops.getcrosststamp = stmmac_getcrosststamp;
+
 	rwlock_init(&priv->ptp_lock);
 	mutex_init(&priv->aux_ts_lock);
 
-- 
2.47.2


