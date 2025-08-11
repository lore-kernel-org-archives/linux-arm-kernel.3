Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB10CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkwU+NrtOQ3YQDNx1VQqaKHQvOV1/1YDtCRZ1UlgtcY=; b=kNUQG4SsV118hOGXL6nzZdTB3N
	arp3i2LmrBnNfkOHuN/8dfBrfrXp0um5kFtVDaLPQDJwVbyRIHpceVoBpNHcsv/DksiRF8lUffAP/
	8ettZ+KQjMpqLuaru+iT+6U06vBcWmzzv9MTdHXEwsnufbwoD6RPWRlAotNDFdtCHW+fqOXXI5tvn
	KYN3hj8beCw39INbxY7+dIHV8Z/G4C2PhILMBO7GVUsCETKZXxsy16QMCK64Tn2x94ckZvQiwZZbf
	Qm2H+v+HDo/u5xtbpPUxZ4Jw7X+NXDQLHeeWgVwCqFZF/WOf//J1jHNvBiANWTheMETz0keg1goPd
	p43Z5XZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacw-00000009D6G-1UDg;
	Mon, 11 Aug 2025 22:04:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXeL-00000008qCz-3kXy;
	Mon, 11 Aug 2025 18:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gkwU+NrtOQ3YQDNx1VQqaKHQvOV1/1YDtCRZ1UlgtcY=; b=t3jXhAnmE8Y/32k9kYlIUCcYQw
	/J4H7928UGvMo0TZOp9WX+4qJq9X/fE9Gf/O1jTV1xLm1Mo887Zu6z3AeggpB1sIDRtzPT7IU4Xdz
	r8WHp1o98P7Ke/XrHQD+NjEW8GSthCmZp835BpDzysFskpb+9ogqFVjiCQzFeKu3j2jLjm3DB3XQs
	mjik3koQjcDumMQ7s2rxjYdtWGdShZuq6AO91aKHFCbgSk0ORpdZAv9N0fQjmRihjHfUkp8UIBIqk
	TI9mhqhPZqovS4cPQX+oRDj/UnHrnr/XfHk9TMtHTSUk39pHwVtuawRiVBPIH9eeV6X8hhaIu/JcY
	xOav21YQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53150 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcG-0003aU-1M;
	Mon, 11 Aug 2025 19:51:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXbX-008gqZ-Bb; Mon, 11 Aug 2025 19:50:43 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 1/9] net: stmmac: add suspend()/resume() platform ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXbX-008gqZ-Bb@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:50:43 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115337_930989_EE017B92 
X-CRM114-Status: GOOD (  13.44  )
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

Add suspend/resume platform operations, which, when populated, override
the init/exit platform operations when we suspend and resume. These
suspend()/resume() methods are called by core code, and thus are
designed to support any struct device, not just platform devices. This
allows them to be used by the PCI drivers we have.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    |  9 +++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c    | 12 ++++++++----
 include/linux/stmmac.h                               |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f1abf4242cd2..2da4f7bb2899 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7879,6 +7879,9 @@ int stmmac_suspend(struct device *dev)
 	if (stmmac_fpe_supported(priv))
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
 
+	if (priv->plat->suspend)
+		return priv->plat->suspend(dev, priv->plat->bsp_priv);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_suspend);
@@ -7931,6 +7934,12 @@ int stmmac_resume(struct device *dev)
 	struct stmmac_priv *priv = netdev_priv(ndev);
 	int ret;
 
+	if (priv->plat->resume) {
+		ret = priv->plat->resume(dev, priv->plat->bsp_priv);
+		if (ret)
+			return ret;
+	}
+
 	if (!netif_running(ndev))
 		return 0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 030fcf1b5993..21df052eeed0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -901,7 +901,9 @@ static int __maybe_unused stmmac_pltfr_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 
 	ret = stmmac_suspend(dev);
-	stmmac_pltfr_exit(pdev, priv->plat);
+
+	if (!priv->plat->suspend)
+		stmmac_pltfr_exit(pdev, priv->plat);
 
 	return ret;
 }
@@ -920,9 +922,11 @@ static int __maybe_unused stmmac_pltfr_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	int ret;
 
-	ret = stmmac_pltfr_init(pdev, priv->plat);
-	if (ret)
-		return ret;
+	if (!priv->plat->resume) {
+		ret = stmmac_pltfr_init(pdev, priv->plat);
+		if (ret)
+			return ret;
+	}
 
 	return stmmac_resume(dev);
 }
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 26ddf95d23f9..22c24dacbc65 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -248,6 +248,8 @@ struct plat_stmmacenet_data {
 	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
 	int (*init)(struct platform_device *pdev, void *priv);
 	void (*exit)(struct platform_device *pdev, void *priv);
+	int (*suspend)(struct device *dev, void *priv);
+	int (*resume)(struct device *dev, void *priv);
 	struct mac_device_info *(*setup)(void *priv);
 	int (*clks_config)(void *priv, bool enabled);
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
-- 
2.30.2


