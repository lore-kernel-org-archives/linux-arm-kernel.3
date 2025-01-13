Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A624EE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chXwxPSm499N84MeQ/hbX0oDsMrVYQ0eEiWb6Bzy+XA=; b=quiwRkzCV2/UhcHHwodjHDOUXw
	/2BuDBd9AHiBS5cXHs8suATDtvtP/K4qjJvDmu4sNd1rGetMntruAzcwd400cbca9CBq9z4R3Gcpj
	Sf7PdaRgKbQdFT+P36rzQ+W0vrWCi1DAw6UajHffJzELKsPsW9Eu3NHQooOEfHn8JsHrHFOmygSbp
	/QCLmnbCPdbBnKgpvpDWOsxs/odbCJ9Rio4mzJhrTcHxav1ltH9SazgSJS9On4r8WZBk0oW/LZwiK
	7H3eoH1mE6AQQTDrG7MS5r+X4QvXo4GX8hVNriqJVlfnqcOi/irL+10Kdl5kfVwJvFGfLAaw451Y+
	ZEycbC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIzc-00000004zsM-0VgD;
	Mon, 13 Jan 2025 11:52:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIti-00000004ygZ-0GsP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=chXwxPSm499N84MeQ/hbX0oDsMrVYQ0eEiWb6Bzy+XA=; b=J57ZEuuJoJ9EkO5nhs+61xeyAh
	lrtQfofdDXMP1xze95c3uPiqKDHNQ2kPdIkx57CQABhEG72XQ9tsxJcF3150ZXG1T3ajtQC+LQCVK
	N7NYo76PjIr+UeC8uunP/67W4fAkYQWujWMxUrHXWRZv4IebagEQRThuTdxhCAY1uCeutbbgOIt8U
	eBZkVHlccjVxQi46R8m5lRE9kIUsDtETwsD964F5Sm+CrVSBX6QetO6QcRFJJRZa8798iakjvPijv
	IQskVvpgpGhaFxkPhn6jMzZh8DfiVuExRrsUiiO1pOKjuYwpTDCVHUZuCKvnJVQj1QuynNIutP1Bv
	pBOzySsA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35688 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXIta-0006Vg-18;
	Mon, 13 Jan 2025 11:46:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXItH-000MBC-8i; Mon, 13 Jan 2025 11:45:55 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 4/9] net: stmmac: check priv->eee_sw_timer_en in
 suspend path
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXItH-000MBC-8i@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:45:55 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034622_124964_E3AFF864 
X-CRM114-Status: GOOD (  11.68  )
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

The suspend path uses priv->eee_enabled when cleaning up the software
timed LPI mode. Use priv->eee_sw_timer_en instead so we're consistently
using a single control for software-based timer handling.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e8667848e0ee..26ff1ded4e3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7719,7 +7719,7 @@ int stmmac_suspend(struct device *dev)
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
-	if (priv->eee_enabled) {
+	if (priv->eee_sw_timer_en) {
 		priv->tx_path_in_lpi_mode = false;
 		del_timer_sync(&priv->eee_ctrl_timer);
 	}
-- 
2.30.2


