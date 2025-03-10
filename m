Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F53C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARCXnqS38tZ6SrvZyY4r4LsmND+qBD6vwra/0tog6Ok=; b=eWwQ+6dso4SFo/l7i9eJwa/1Px
	kFgUoofHGNYi+KduT9O2hAR/JdkCEsy5ntICWI2jhmhIazMGA0a+pPKRP+zmyprJuQHe2/Nr+PIiK
	YZt0olo4eUEeMTlkj6B2kF5BzdiM8BUqFzjBwhfgx2uZ5apjVohrdDaXgk/vfhv/in0tohrr/L2XM
	pYp/b+6tJdESOXK+dnte58nbnsExdOk5ni1TIsldl5lBUeAb9U9+8NcXVdZNUuw7SNokMiIETcMKt
	1FoBfvjGk4xS24W2m3NLH/obdX3BBZOZ0ThIZaKoBK09C+d5ZYTSLsvvxhq7TjeOnbIroVN2Lovqb
	4x7gz6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcCC-00000002bc1-4Bez;
	Mon, 10 Mar 2025 12:25:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbyZ-00000002YB2-3L7q;
	Mon, 10 Mar 2025 12:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ARCXnqS38tZ6SrvZyY4r4LsmND+qBD6vwra/0tog6Ok=; b=A4QTFwP92MvvwiC1CwF600PCv2
	pKuDyEuS43X1T9u2nX1zkmEPe/IAk1zy/FiBCClxg/q5F+J5+cZSr3w49TGekynnqUZ4kk6QRhQtQ
	EuZ/5HAwyvRRpGXtzWLgQ9ZTaZnvpKHlS4Rs3CkKAKB+OEIO4sIWOL/2QZEOHwtdcdybCzxyrC4Q2
	eaeVYKeOgU1oimksoG2uoHyzniS+296SZSNylUWGQg9K/DVkMxcirnghCdqaH2YH6UzUs2e8rPwXF
	ZN0ehYTDxAKEVWdYhHjRF/Yu+6Igix0GaqFM8QJchXFjfTanR7clqfryFDAgGwByM7jhHgEY98nUS
	N5Rn86Gg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58196 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trbyG-0002ZB-2u;
	Mon, 10 Mar 2025 12:11:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxv-005qYM-5m; Mon, 10 Mar 2025 12:10:39 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 5/9] net: stmmac: meson8b: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1trbxv-005qYM-5m@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_051119_833514_3BBFD053 
X-CRM114-Status: GOOD (  10.50  )
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Set dwmac->phy_mode from plat_dat->phy_interface.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 9c2d62d133ad..a50782994b97 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -417,11 +417,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		return PTR_ERR(dwmac->regs);
 
 	dwmac->dev = &pdev->dev;
-	ret = of_get_phy_mode(pdev->dev.of_node, &dwmac->phy_mode);
-	if (ret) {
-		dev_err(&pdev->dev, "missing phy-mode property\n");
-		return ret;
-	}
+	dwmac->phy_mode = plat_dat->phy_interface;
 
 	/* use 2ns as fallback since this value was previously hardcoded */
 	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-- 
2.30.2


