Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56709CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k++NOzDiNb27hLDKjlUMeDDn+u3bsze6iAKn/JJT5GA=; b=qbSgc1JN7jylA6TxzEeAgBSDYm
	TTHDL8MQqGmHws++VsUSU1UdhtIeLu5RHzaylrDIDn5/JbRBB0+WCeQQKekqedBjyImIVGH29Uh1h
	ysRK1IOcse33Kj1P6SWMhJaw0u8KFF0/V8ePhPZ5Ia1944ERoSrcHEcueNxSZbbI/WjQD8WfFAjqQ
	SYb8mtY9/NcM5tjxq+ZEfCAlbJ6BX3uKftaMYBlvMMWU9GrZFwRFA/EVbGg17yqcerxhx6iRFo5TX
	W6Nvt/xWa5aBnYHV9vD/NQK+XLFRFlmh3f7q/ua3203jEc4LJOy7Q7qZNy2h8SlPNjImV2yd08ae1
	1Uh1lQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Um-00000001sXA-12Fe;
	Wed, 15 Oct 2025 14:28:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Uj-00000001sU4-2tCM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=k++NOzDiNb27hLDKjlUMeDDn+u3bsze6iAKn/JJT5GA=; b=f2zkT/aluwKOFxG5BV1+M1aS37
	BAFn2ANdCjKeehxBylnqfVsdmZH5mkC6269wHlSSI2+XluTe7zgOjGSjJBjw3+MNdCdFicjenKUx1
	mS5FrVu+cSiVNy+d7aU2n36GpJN6Jo9RIhe4XnCXkoTsnwLPJVNfpsQON6mDl9a/c/fEHe++EV4qE
	Vk4p/V7PD9D0URzLnPlvyBxdYkv2LtzcgCY1H7hW2nO8FeJukb3ppf/vuhdyt32MEjO5PlzrvcCkx
	bsEullaWVYCLFZ8DF2bsBDYXesUMYF9nafpSf/I0R4jMhkE0/+x67A7GBVPp68TAv/uGxoQ6xv9Y1
	QLgqFTng==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46532 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v92NO-000000004hK-3q4i;
	Wed, 15 Oct 2025 15:21:15 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v92NE-0000000AmHd-15fv;
	Wed, 15 Oct 2025 15:21:04 +0100
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH net-next 13/14] net: stmmac: provide PCS initialisation hook
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 15:21:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_072849_727637_BB1DC2A9 
X-CRM114-Status: GOOD (  13.54  )
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

dwmac cores provide a feature bit to indicate when the PCS block is
present, but features are only read after the core's setup() function
has been called, meaning we can't decide whether to initialise the
integrated PCS in the setup function. Provide a new MAC core hook
for PCS initialisation, which will be called after the feature
registers have been read.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h        | 4 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 7796f5f3c96f..82cfb6bec334 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -313,6 +313,8 @@ enum stmmac_lpi_mode {
 
 /* Helpers to program the MAC core */
 struct stmmac_ops {
+	/* Initialise any PCS instances */
+	int (*pcs_init)(struct stmmac_priv *priv);
 	/* MAC core initialization */
 	void (*core_init)(struct mac_device_info *hw, struct net_device *dev);
 	/* Update MAC capabilities */
@@ -413,6 +415,8 @@ struct stmmac_ops {
 					u32 pclass);
 };
 
+#define stmmac_mac_pcs_init(__priv) \
+	stmmac_do_callback(__priv, mac, pcs_init, __priv)
 #define stmmac_core_init(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, core_init, __args)
 #define stmmac_mac_update_caps(__priv) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c3633baf5180..35cd881b3496 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7238,6 +7238,13 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 			 "Enable RX Mitigation via HW Watchdog Timer\n");
 	}
 
+	/* Unimplemented PCS init (as indicated by stmmac_do_callback()
+	 * perversely returning -EINVAL) is non-fatal.
+	 */
+	ret = stmmac_mac_pcs_init(priv);
+	if (ret != -EINVAL)
+		return ret;
+
 	return 0;
 }
 
-- 
2.47.3


