Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B6CEA4FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MSVGaTn7XmA6GkXd/fmaGcbAWdaT3/cac6c7RkoSv1I=; b=L++9pQBjxRy+oRRlWBs/RWBLs2
	ogr6zp4AVwyEYgth2IPsDO6pV1lE55clRiM3fwawVxjhBDWfYaHu+f0WiWzQ1NF5q8B/O60W5bllX
	metWIkFel8996b6crIaN2PgnLTQhdXG7dxkJy/R8ml6eJNYpN1rHVR8/reFhDG0BL/+Uz4sz9hMxN
	uhmEhbrARNfjScHwbuTJHBs4CEmsv8qg4blIfLSzQKDt1MV53Om4JURCd78VQ5i+y6q3JRLZYUkfy
	K9fhtFsVhKhVjwSiooEvQlCwbT4Yt7vXKin47ia/8R2TiV7XXulfs5B7MqWdUixFlJyoyPzR/QKXy
	nN5c/M6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUsK-00000000GLq-20Fy;
	Mon, 23 Feb 2026 12:17:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUsI-00000000GLQ-3eNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MSVGaTn7XmA6GkXd/fmaGcbAWdaT3/cac6c7RkoSv1I=; b=PS2f02IzwG5dDzXEj90R/sRgwZ
	JligdCvKe18fAPWGEwMAVCVlYYqNrMR7OKqNT/CsyLDqD4n868fofXSMgvLaneVl8JE/Tt3lTnwIm
	YABgQmK6SgXbcU/u3tFOGiKjoloi2qsQE8rQ52kNjtz63rP9+HUd5OTQCwalDiVjoE4oVqakgz5Qp
	iRaxoMUm1vkEcKMxm9w+HkQ/hKh82G9DMbfePDGK5Ipfxu5n06kTuB8mmUBNT+wjbqZF7ix8wuitr
	dJpkt7FQ8QLDobjgNNd2RWuMAWGQF9hDu04LCTDJQ3pURXZLP2lfLzQ208csrRSxIoGdc+MhlcV49
	UUAW/4pw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40614 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuUsD-0000000042a-3Uz5;
	Mon, 23 Feb 2026 12:17:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuUsD-0000000Afci-0XxO;
	Mon, 23 Feb 2026 12:17:13 +0000
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
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next] net: stmmac: fix EEE supportable interfaces
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuUsD-0000000Afci-0XxO@rmk-PC.armlinux.org.uk>
Date: Mon, 23 Feb 2026 12:17:13 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_041718_911079_FE55979E 
X-CRM114-Status: GOOD (  11.02  )
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

According to the dwmac v3.74a databook, only MII, GMII and RGMII dwmac
interface modes are supported for EEE. Restrict EEE to these modes, or
the modules supported by a PCS other than the GMAC's integrated PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 82375d34ad57..89ded359a9fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1374,9 +1374,21 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
 				 pcs->supported_interfaces);
 
 	if (priv->dma_cap.eee) {
-		/* Assume all supported interfaces also support LPI */
-		memcpy(config->lpi_interfaces, config->supported_interfaces,
-		       sizeof(config->lpi_interfaces));
+		/* The GMAC 3.74a databook states that EEE is only supported
+		 * in MII, GMII, and RGMII interfaces.
+		 */
+		__set_bit(PHY_INTERFACE_MODE_MII, config->lpi_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_GMII, config->lpi_interfaces);
+		phy_interface_set_rgmii(config->lpi_interfaces);
+
+		/* If we have a non-integrated PCS, assume that it is connected
+		 * to the GMAC using GMII or another EEE compatible interface,
+		 * and thus all PCS-supported interfaces support LPI.
+		 */
+		if (pcs)
+			phy_interface_or(config->lpi_interfaces,
+					 config->lpi_interfaces,
+					 pcs->supported_interfaces);
 
 		/* All full duplex speeds above 100Mbps are supported */
 		config->lpi_capabilities = ~(MAC_1000FD - 1) | MAC_100FD;
-- 
2.47.3


