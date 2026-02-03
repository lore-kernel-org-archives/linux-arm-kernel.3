Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69DEE83070
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+glT1WUCuKKRwLLSyDdKdz7/iH8B4iVFWpjJ7rAM32I=; b=O+wiiAv22Eejzo2VO2xqdDkSyp
	eapBBVqKj6aytCGwGqM37m/qTfR2E9Lqc8sqQsinRyG0pCXfJjSO5ZOnj5xgf8qGra+2jHTKIDVPA
	OzSNSc5LgmXRSfglZv/UToJrJ/PiACAL2ccLiufUrW+OuSM9yh0lVInDmJWeZxMheQUOUAY01oNLs
	lXaaDNwAk8a89zI9/Rk7rluZ5ELHZ59wf4UESJMNUdcQmjBje+oExDwGdorKN5qgdufyE5YWcYVii
	DaeWWIqMI33zieY55kAqAWA8x1FzaZ12xWN96H3r6agfNsaodn9rdsgmzXwdu2Sr0YY9B53vTiVKL
	6xDtbkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDw-00000006Qzq-17YO;
	Tue, 03 Feb 2026 10:01:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDDt-00000006Qys-3Zgk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+glT1WUCuKKRwLLSyDdKdz7/iH8B4iVFWpjJ7rAM32I=; b=RgBvXZX3BO0h4gx+wAS1NsQHr0
	wxM1Nx375bb/gzMAB8DAwmbHT8eBprkmKNQQLUj84gIHxeU817sFFR+KRvzmRxw8/fkBCtTQAemJV
	8Q9kUiLj51RCcvAd3ShmWlG+YIE8bCL+uVQ4opsTe+jsatHsFho9HqBc9z2lhiDFtG8OfyHp1DsKF
	1Qgn17OeG5AmgG5yS9TCt6EeUYDJpr5wXvHQbwbj4875y4FEw4NVjTOLw8IL2I5hn47UCv0KS2oRY
	jWAtub3QW/+VRmpS3GSs3sce3hz7LrqpYzWOVBOk4PN5pF5NHa8+/FamY3l5Hei3DN+YsAxY5M+G+
	fIEYMvig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40622 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vnDDp-000000004xC-2P37;
	Tue, 03 Feb 2026 10:01:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vnDDo-00000007Xx9-3RZ8;
	Tue, 03 Feb 2026 10:01:24 +0000
In-Reply-To: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
References: <aYHHWm5UkD1JVa7D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 3/4] net: stmmac: add missing serdes power down in
 error paths
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vnDDo-00000007Xx9-3RZ8@rmk-PC.armlinux.org.uk>
Date: Tue, 03 Feb 2026 10:01:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_020129_890566_80643218 
X-CRM114-Status: GOOD (  11.88  )
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

The open path is missing cleanup of a successful serdes power up if
stmmac_hw_setup() or stmmac_request_irq() fails.

stmmac_resume() is also missing cleanup of the serdes power up if
stmmac_hw_setup() fails.

Add the missing cleanups.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9efdde915229..05b0b080bade 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4137,7 +4137,7 @@ static int __stmmac_open(struct net_device *dev,
 	if (!(priv->plat->flags & STMMAC_FLAG_SERDES_UP_AFTER_PHY_LINKUP)) {
 		ret = stmmac_legacy_serdes_power_up(priv);
 		if (ret < 0)
-			goto init_error;
+			return ret;
 	}
 
 	ret = stmmac_hw_setup(dev);
@@ -4170,6 +4170,7 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_release_ptp(priv);
 init_error:
+	stmmac_legacy_serdes_power_down(priv);
 	return ret;
 }
 
@@ -8273,6 +8274,7 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
+		stmmac_legacy_serdes_power_down(priv);
 		mutex_unlock(&priv->lock);
 		rtnl_unlock();
 		return ret;
-- 
2.47.3


