Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F32CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKPP2QZefEX/1xcDDWpR3rAb+ukEcDE/pNkA8dPwcZM=; b=oVfU3MIkc9QGw5o2CpQ4aUpCb6
	7TBEunqViZp6QQjwQTZ8PGGjtHZMKxu0crRUkaW3fqvFA19U6Fte3NB9bHCwEtSCfcM7e+e5cawSC
	NWMx+41KawJjYKSmwxQKgYgFoK0xT+tLN7laZpSdudvndVhfrpgeeS8RsRjTUb0S+iJNcSSfXfmGP
	rPYdSlw0qE6mdm1GzsdLoIhetSkrw9EDKMB+D62HBfSOIgPLgAU/h7MJoRj8nMHZxhvGzqwIADHXh
	Cqje9pEePg7nWTaAQcEIMhH6iWcddfcG8I1ACGD5MLp0YyyCkR4TIUnfxevWUrejvBQziY946U2cN
	ZMKJ66DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1eK-00000003Be4-0kN5;
	Fri, 13 Dec 2024 09:07:52 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1cB-00000003BE4-389z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:05:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A141E1BF209;
	Fri, 13 Dec 2024 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734080732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKPP2QZefEX/1xcDDWpR3rAb+ukEcDE/pNkA8dPwcZM=;
	b=YQIiuthdBqmu2By5+3wovQpNCgKIdq5aY+qrlpi1ANVyS5lJIrMMmLk3OsmBCKst3VMhlL
	sspuybomI1+fRmzNfp5flaYkXPtIceyJToBmlKlNsbfyrh32GWxzcvw5G4UXFjKPLy0bYu
	qIPTR4FKC31tmwFJV3UVMGl6kx1M0FVS3fE5CMNJC1hTReMMTRNwxMXxfkMVPLx04b24ZA
	qe73thbJpQ15jzIYcLRECkTJvpSji8U4cgGnrkHbwCFquh9c7c9PvAcPevSziXlVHwAoxj
	MSpWkoLIsWOz9hDeucZIaSUx5Phtod4t04K+OppfxGM5WEM4eBO9iJQb5edRMA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface modes from Lynx PCS as supported
Date: Fri, 13 Dec 2024 10:05:25 +0100
Message-ID: <20241213090526.71516-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_010539_956716_A66F39D3 
X-CRM114-Status: GOOD (  13.85  )
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

On Socfpga, the dwmac controller uses a variation of the Lynx PCS to get
additional support for SGMII and 1000BaseX. The switch between these
modes may occur at runtime (e.g. when the interface is wired to an SFP
cage). In such case, phylink will validate the newly selected interface
between the MAC and SFP based on the internal "supported_interfaces"
field.

For now in stmmac, this field is populated based on :
 - The interface specified in firmware (DT)
 - The interfaces supported by XPCS, when XPCS is in use.

In our case, the PCS in Lynx and not XPCS.

This commit makes so that the .pcs_init() implementation of
dwmac-socfpga populates the supported_interface when the Lynx PCS was
successfully initialized.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 8c7b82d29fd1..ff9a30afd7e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -425,6 +425,17 @@ static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv)
 		return PTR_ERR(pcs);
 
 	priv->hw->phylink_pcs = pcs;
+
+	/* Having a Lynx PCS means we can use SGMII and 1000BaseX. Phylink's
+	 * supported_interface is populated according to what's found in
+	 * devicetree, but as we can dynamically switch between both modes at
+	 * runtime, make sure both modes are marked as supported
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+		  priv->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII,
+		  priv->phylink_config.supported_interfaces);
+
 	return 0;
 }
 
-- 
2.47.1


