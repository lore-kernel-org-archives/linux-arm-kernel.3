Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A7EC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AUA1jYu18/VV528nC+Fd5/366KmfMQGrmQqxLT2Djc=; b=RhnZTfQIMnJzrrnDxIqMZ0ITww
	3zsxSiJJ2n4qyxouvI9xtYoaHqHizL61aSeAYxsU6ts7uNVAK8K/x89LPTQgxrK24ncBlO2p9egzi
	OArqKGiC1DeUmGPaUQMkInz26knjdob+eIgfzoZzoL/Ufbb9vEvLg3qeflBOOy75+RT3k9QDDfKQI
	k+GCbJisnkvmXEphZocW10CkAwH3vKCjd1FzULTHzp9xsY7MTNMrUAB6wuTrMEGeYIR9JtHJBarqy
	o4gz4PT5PMetywkEMq1HU8l80EvgCoRWb52dkpU8SEmZbW6RbRnx2AOlBP+z95KwdngsZoUR0eIAA
	zc24AcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bfp-0000000Fzv0-2EC0;
	Sat, 12 Apr 2025 14:17:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bZA-0000000FzI7-2pfG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8AUA1jYu18/VV528nC+Fd5/366KmfMQGrmQqxLT2Djc=; b=LGz7/Vo3Gdx3pT1LrIOtdN5T9D
	c4rHZlimCX0OXI3TtTUfn45Amt+kwNobKXxOjGN5cAPRuypB6LqxQBp8Mtgrzyc1qy6YCUs1FDGta
	JI2qC0woGEnUA0Ztt4w6qOVvmDp9RV2RShdPiZwkcdzZX36jqs0ocYb3Zk94Xe8mhdkxGh/vQemKZ
	6WGzkVCGQ7zgCmsnvZGExU7y0QsRdUdYX8dE1fHNqOXUJPv8KGyQLvpR+9n5sQw8IDHHoAeoLjWFc
	d9hvxFYuM22+4f+2q2KS6+8Sgk6gJrDUSRPRt15H84BpDzbcK9mNp0OcBb6OSGLXGyJ2qFUUcVucB
	LBn6uWEw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51242 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bZ6-0004ah-2K;
	Sat, 12 Apr 2025 15:10:36 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bYV-000EcQ-Cv; Sat, 12 Apr 2025 15:09:59 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 3/4] net: stmmac: qcom-ethqos: remove unnecessary
 setting max_speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bYV-000EcQ-Cv@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:09:59 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071040_713003_67EE4851 
X-CRM114-Status: UNSURE (   9.75  )
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

Phylink will already limit the MAC speed according to the interface,
so if 2500BASE-X is selected, the maximum speed will be 2.5G. It is,
therefore, not necessary to set a speed limit. Remove setting
plat_dat->max_speed from this glue driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cd25aea3e48f..e8d4925be21c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -676,7 +676,6 @@ static void qcom_ethqos_speed_mode_2500(struct net_device *ndev, void *data)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
-	priv->plat->max_speed = 2500;
 	priv->plat->phy_interface = PHY_INTERFACE_MODE_2500BASEX;
 }
 
-- 
2.30.2


