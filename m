Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A25CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7ILgVSl1cCXHuRsPTglZobkv3bXbExIQncijaA3L+c=; b=tP2f0Kc1wcI/mg6gZvWV7yVCip
	z9FPnpNwVK0gcird53K2451YMpChc40yDmMjVT8fnNTB3wnXkZjHc+n7NtUStoXBKg27t5i97slJp
	pRl3cP0cLHI9YbcT9VgeOgXpRTz/gC5axRvlpoKBPVcG0uiY804axiQ6Ypg3dJqHZDdysWpgrBLTx
	+wrR79mJakCxTZ3T3Ypoch2ijvp3rYS5emGkRu6it1xd2/e9q1s9CUc6G/zseFgVN9zgIxZ5XPA/Q
	n5w1IU2PbVmcvG4jK69G1e6InFU6a1AehGB78wgKG57KY4PqoPQzdZGLMzd0Q6f+KGCf/vE2sCScW
	MHbC5/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHps-0000000GsFe-3LP1;
	Fri, 07 Nov 2025 08:28:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHpq-0000000GsEu-2BAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g7ILgVSl1cCXHuRsPTglZobkv3bXbExIQncijaA3L+c=; b=Z4vWbDH8DlbE81UFNr0LreGoWB
	bt2+X09KBN+ES4kUdAYQDQEjqpVyVQTUoVUbsF1TVkMTghkdX7cQqt3ckJEwDlzdVU2Ua4OIf6hB5
	Ag57yJT0unQFnGrKfsqCV0BIpSyonA1albhbfgGL7evXgjHQFC9MlkVBRyvcepm3/c59d/F/i6Bry
	VnK4fvjOTKC36KSwF4IMkj5Cs7/SYqwjcazWuCwtNT60MDu7cvLXcl6XLyXAQMgEs7yFSeXHb6AKN
	PygDSuHBwAI9rxQXsuUSAMrw67Cg80jlWQW9G7wNkgLbTZ/4rM9W0xxzfDmW3wUhSf5HrloqY+sSY
	PjlR5Gow==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58618 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHHpj-0000000068d-33jw;
	Fri, 07 Nov 2025 08:28:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHHpi-0000000Djqp-4910;
	Fri, 07 Nov 2025 08:28:35 +0000
In-Reply-To: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
References: <aQ2tgEu-dudzlZlg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
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
Subject: [PATCH net-next v3 01/11] net: stmmac: ingenic: move
 ingenic_mac_init()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHHpi-0000000Djqp-4910@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 08:28:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_002842_557903_B93017BD 
X-CRM114-Status: GOOD (  10.79  )
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

Move ingenic_mac_init() to between variant specific set_mode()
implementations and ingenic_mac_probe(). No code changes.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index c1670f6bae14..8d0627055799 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -71,20 +71,6 @@ struct ingenic_soc_info {
 	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
 };
 
-static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
-{
-	struct ingenic_mac *mac = bsp_priv;
-	int ret;
-
-	if (mac->soc_info->set_mode) {
-		ret = mac->soc_info->set_mode(mac->plat_dat);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int jz4775_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 {
 	struct ingenic_mac *mac = plat_dat->bsp_priv;
@@ -234,6 +220,20 @@ static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
 }
 
+static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
+{
+	struct ingenic_mac *mac = bsp_priv;
+	int ret;
+
+	if (mac->soc_info->set_mode) {
+		ret = mac->soc_info->set_mode(mac->plat_dat);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int ingenic_mac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
-- 
2.47.3


