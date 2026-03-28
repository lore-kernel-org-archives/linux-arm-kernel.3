Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B1D10D1485
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 21:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAKrOCApQzZu2zjOdNYoweFwV7e0x+wpN1tQch7jZX8=; b=hxVfSi0UzbGi0YAH15p8epawNj
	fyV+Pcbqow7CEtIWX9osO5gH9k1K3JDNFHkWZCUiAWQsKyGc+KytatkhJfTKjMWj7+RF2jc9gQz7x
	JsklX6kYF2IXSsr3yDRuXJXh7+PIevqURrmaHGBD4mzKYhezZoNB4BXwNSclFtoESXLa8BiM963iW
	CUlvofBCVrHnmmumwSw8z/NTr96z6o8IWmbyXODKOy14yY0qurcgPUfdOJqO7C+8uU/hixBXx6PLo
	oEwrCZd8phds3HrxXuYzWYtfhsh/WeukIitjpXBCUiwxeJR9iH+uHq0crlwJRAWid6y6E7nCxh8F0
	c/l8jDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bLe-00000009K2I-3MAk;
	Sat, 28 Mar 2026 21:37:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6bLX-00000009Jv4-2AFF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 21:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mAKrOCApQzZu2zjOdNYoweFwV7e0x+wpN1tQch7jZX8=; b=X6ncgmiqT8+A6FjjlkaLMVhA+6
	Vd1/NoHB/v/6tciiT5mrhH0oQykrLBJ9GET2Izdc/o/BHyhZKcewlwp5B+6iTVL0abrA4mhsm3MRs
	f60U481DoOjuCFDWx0ZZ+Ep6ZkLswRe3MMz7xhyPIyupCKzeUe734oxKhwuaY5D0k35AS8TlfFm0f
	raeGF85p2MSMlzMvHmPXr60A8AQlQTnoB0C22TWa8p9yooDknF5aAmj8iDSSUjsv9cSkdWDxRljnf
	oV/KR7jC5ksDQXfDCYIwDF69w7+EzeNvARavEIeglsMnhDMUwkCrf7z5sTe8n+5mAS5tjJ6006irq
	NE091BoA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56392 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6bLQ-000000007Tz-0swP;
	Sat, 28 Mar 2026 21:37:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6bLO-0000000ELuR-3IhN;
	Sat, 28 Mar 2026 21:37:22 +0000
In-Reply-To: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 09/10] net: stmmac: add warning when TSO is requested
 but unsupported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6bLO-0000000ELuR-3IhN@rmk-PC.armlinux.org.uk>
Date: Sat, 28 Mar 2026 21:37:22 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_143731_556358_0FF2EDE5 
X-CRM114-Status: GOOD (  11.35  )
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

Add a warning message if TSO is requested by the platform glue code but
the core wasn't configured for TSO.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3bfa4bbe857f..c61ce1282368 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4388,8 +4388,10 @@ static void stmmac_set_gso_features(struct net_device *ndev)
 	if (!(priv->plat->flags & STMMAC_FLAG_TSO_EN))
 		return;
 
-	if (!priv->dma_cap.tsoen)
+	if (!priv->dma_cap.tsoen) {
+		dev_warn(priv->device, "platform requests unsupported TSO\n");
 		return;
+	}
 
 	ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
 	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
-- 
2.47.3


