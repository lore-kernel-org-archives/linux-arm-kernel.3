Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED963D3B98C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ1MXfPXQhanrVcmJnPAK+U2MoO2zVEDG8Tfvkbzfc8=; b=IGImXOYlPWP7gHdkb9fk0AXtHV
	VKa1n6qYRSgHUmYU/KTAxTAES6SvBZU0D4xu8Nf0S6Pu+k8TiDPwYlvsaCYQdO4FklI/0tAzftfel
	H7FwP4X+COoU3XXrh+Xx1fHxtclt3yaycwWWX5i4rcPPr+h/k/B0c2Q9s4c6MTDyKZZKCctGxCfGl
	9NzocA8NRXCmD62fGDIia+UKbSDDXmGnO4tNIqd+0F74yAJXrsY3QO+AxUoGj6BLg1yXYK7uBl3TA
	XWDPhTI3pq8OiC/vbdCtJf72kc3uPQzQKA1yJwQMrauj4JlnoLYwDaPyUJx/21Z59yYqUdViUflf0
	D3Bmk1Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv9Q-0000000AdFL-1F5x;
	Tue, 26 Nov 2024 12:58:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv3X-0000000AbrX-43nX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pQ1MXfPXQhanrVcmJnPAK+U2MoO2zVEDG8Tfvkbzfc8=; b=HcpLlNOl+oUJjQEGnmUOBOt9gA
	PufJYNxX63ZC0k6qv2fJ1gmgzZwX1ZkEcqZkTxRqVBK96WLf6CVzD/ThxzPxGfdrsCsKdsPWJzJ61
	0v10oI+Gtb+Y5kEpfHg6R50i2oaMYA6edWZTAN3/OwquBVPohX1uTvzIsy01oo4ryZc+fQIqy/A1d
	C/s3ZKZl6XNS2BhG/w1MdZNlJx/S9W6Tbd5QOqeZtHqc4SPj3NnKI8Y2/fvEYKHs+DhUdHSH7gW2Q
	diovs8W7k9EwGMlUmzdj+F7fmpBC9cEIq0xEOm8D/PR6aXX949zq6qqoGPFl3WxodML8mQ4feyi5v
	vG8AVFLA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42098 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tFv3Q-0006sH-21;
	Tue, 26 Nov 2024 12:52:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tFv3P-005yhf-Ho; Tue, 26 Nov 2024 12:52:31 +0000
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH RFC net-next 04/23] net: phy: avoid
 genphy_c45_ethtool_get_eee() setting eee_enabled
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tFv3P-005yhf-Ho@rmk-PC.armlinux.org.uk>
Date: Tue, 26 Nov 2024 12:52:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045240_001238_2F7B3920 
X-CRM114-Status: UNSURE (   9.69  )
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

genphy_c45_ethtool_get_eee() is only called from phy_ethtool_get_eee(),
which then calls eeecfg_to_eee(). eeecfg_to_eee() will overwrite
keee.eee_enabled, so there's no point setting keee.eee_enabled in
genphy_c45_ethtool_get_eee(). Remove this assignment.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phy-c45.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 944ae98ad110..d162f78bc68d 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -1521,15 +1521,13 @@ EXPORT_SYMBOL(genphy_c45_eee_is_active);
 int genphy_c45_ethtool_get_eee(struct phy_device *phydev,
 			       struct ethtool_keee *data)
 {
-	bool is_enabled;
 	int ret;
 
 	ret = genphy_c45_eee_is_active(phydev, data->advertised,
-				       data->lp_advertised, &is_enabled);
+				       data->lp_advertised, NULL);
 	if (ret < 0)
 		return ret;
 
-	data->eee_enabled = is_enabled;
 	data->eee_active = phydev->eee_active;
 	linkmode_copy(data->supported, phydev->supported_eee);
 
-- 
2.30.2


