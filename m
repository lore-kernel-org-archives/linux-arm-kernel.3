Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1D8n6sAJQ7YC/Q50BthGw8wcmOYNk6MxTkRcRqV4ZM=; b=aNXWpLvPAcaVuYMNULT4Y9ByJT
	VOu/0P0E/vv9asrnJbfqZoql1mHm33MinChHUFfVJVdAQk9rDcdq3wJUT6ZXKQr/0F60pHK/B/Krk
	sNsOXjp2a3LzlB7wbwue33T0aQyGNKnGshv+0OhivdSCM8nuGd19a0qOA5u3mP9uaLDTFtHhBTKYC
	KyrPxbrBDJcu2zhU6aKB30JEIyN8XyWfO6onvB77W1r7fW2KjGIKGTyat1VPcxpcgQe+yfQcuU5QO
	pBIq0bOhtvB1EeOJI4weXxcaz2dglCeTYNqeSFgy8qBjlqltsC+MLGXaUCVzj14/3xImixekGoV+M
	jsjDHNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh4-00000008Tgb-1uHs;
	Thu, 27 Feb 2025 19:37:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf3f-00000007mc7-3Xw5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=p1D8n6sAJQ7YC/Q50BthGw8wcmOYNk6MxTkRcRqV4ZM=; b=kU6KvMXCuChG4QHA1emHTjTpjZ
	imPNzlbvSjBQMYfY8x/WgW6y0ri7SNjDZYQdVNpzaWGJ8Si2zGgx88FY6Zi8OReDlSfcEnh9Crccj
	x52rYkpHwqNeTtM3Ww+5asTrhsvX/X9tfResU2sHgvA0JgTHhXdolLfhdu0zfps5kFj70/9hcUnu1
	RPaGuVqich/aJFogo9SDv6/h1SjuwnemhCUIc/ZhqF2hOdkNxZzdLpXoxM5OtjoGrZQxAsg641tR6
	pW0vLiAMUhPUAJ7oX+i4ZRgdfFO4Do2ktOM+QfAbbJW7KXbABNqFNK+RXRFupfX2x9tn/ENfaziPf
	l4B3RaYQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf3d-00000003oRZ-0EnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p1D8n6sAJQ7YC/Q50BthGw8wcmOYNk6MxTkRcRqV4ZM=; b=rtYJnuXrIe0AQCnCJTGaP+rbsD
	2pSTyrwH8a81FCamY6OfDZeHuTfe/4E0UBMj/qAeg9m6r00Q0hkXDhkAdwPIRVNUU/47h8G62AS/G
	FLJ9w/VPZ9XE336PNBWVn28tbetb6QvKIn/AJPnH8MmWOOpPy/snEUrpB/e0vvCicRsay2AxTI/eF
	ql1EcppUEMU+IStB7BNwPmEZ1fRkCVyqLK092zIkHVi7UYFagnsIQ8DDeGVk1xto4Ibm0G1FLBCyB
	4fhGDbCQ7ghIRdlfM5wCubpDrcuU+JnNLojCX0HGeU5V9/Hzrx9a7/sdSYEiLRsaTCd2bVcXEkCWh
	acPTN1Kw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36794 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tnf1b-0007QA-2x;
	Thu, 27 Feb 2025 14:38:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tnf1H-0056Kz-To; Thu, 27 Feb 2025 14:37:47 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 1/5] net: phylink: add config of PHY receive
 clock-stop in phylink_resume()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tnf1H-0056Kz-To@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:37:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_144013_239861_59FBCD45 
X-CRM114-Status: GOOD (  11.22  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a3b186ab3854..0aae0bb2a254 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2264,7 +2264,7 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	pl->mac_tx_clk_stop = phy_eee_tx_clock_stop_capable(phy) > 0;
 
 	if (pl->mac_supports_eee_ops) {
-		/* Explicitly configure whether the PHY is allowed to stop it's
+		/* Explicitly configure whether the PHY is allowed to stop its
 		 * receive clock.
 		 */
 		ret = phy_eee_rx_clock_stop(phy,
@@ -2645,8 +2645,22 @@ EXPORT_SYMBOL_GPL(phylink_suspend);
  */
 void phylink_resume(struct phylink *pl)
 {
+	int ret;
+
 	ASSERT_RTNL();
 
+	if (pl->mac_supports_eee_ops && pl->phydev) {
+		/* Explicitly configure whether the PHY is allowed to stop its
+		 * receive clock on resume to ensure that it is correctly
+		 * configured.
+		 */
+		ret = phy_eee_rx_clock_stop(pl->phydev,
+					    pl->config->eee_rx_clk_stop_enable);
+		if (ret == -EOPNOTSUPP)
+			phylink_warn(pl, "failed to set rx clock stop: %pe\n",
+				     ERR_PTR(ret));
+	}
+
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
-- 
2.30.2


