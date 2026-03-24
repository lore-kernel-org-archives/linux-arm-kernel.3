Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10273F54AA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snkm8Yk1lJSIIGbyA9V10oVIIMFDPNv5dbd0RwLCxhU=; b=hkJQtJ2syobdQjxkPE5Xn+heWb
	BgWzKJd2JY/5QqFNR6rHVMNwRNMeTw3I9Df60/zfKQ4ggvz43V/9tHzCKwLlO3xnNu56xporFKMer
	HTUW3IB4crFMJ91xMAdoVWvCZ0e4HpEvF1S+NSl8bVZdvzckttxa/FFJNy5ZXJyin6UZ2WyjZJ0Im
	3KOBD7frT3+LyRbz3RLI7xGUSOPbbZVHavUAXiosaYzgwHBqGloVJhqvSvBgGWhZiC6ADS5rf5jCe
	lBE1C1ZirLF1/dTiGGcwVIHTcnrHrX167UpXt5OwMGOpwoK4S1/b7bul6OK5U2Uu075GzKrrolw+d
	CfHcrsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51gQ-00000001XGV-2iqS;
	Tue, 24 Mar 2026 13:20:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51gO-00000001XF9-2e9R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=snkm8Yk1lJSIIGbyA9V10oVIIMFDPNv5dbd0RwLCxhU=; b=ONm9xJgRfpRgehHL37nXvQ2FWq
	/JStvzJSw1JBXpbaNkzFOcsOGX9eUN6eVNaTohy6SiyrBt/fNf8S1Os82JOSYSapBMf7BPpwndfkJ
	yJOvSLbPQ0mggKA0VMGJAamTTMbTuIf9fkRhiL6WIYJRCpXytHx0m+bBwpYUYwFDqXi5Mehu4oSly
	nDAheswZLTscPTAYyPbkNKRX49B7h3jRL43Vb5PC2LPSqxdTQfHFH6+TE9nOoMylNt1kdkdwd+ySJ
	PXvEzD67GWPPC5xhRM1xPWHZCau6WhPNwUPygIlrdAC+HP5ONBy1v5GXKiB8wQ2wWEX6eXwaOzb3V
	sZkGgMBg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48332 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Yt-0000000025U-2Gp2;
	Tue, 24 Mar 2026 13:12:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Yn-0000000DwWY-06F3;
	Tue, 24 Mar 2026 13:12:41 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 14/15] net: stmmac: qcom-ethqos: correct prg_rclk_dly
 comment
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Yn-0000000DwWY-06F3@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_062032_677926_91E3DFCD 
X-CRM114-Status: GOOD (  10.87  )
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

The comment for calculating the prg_rclk_dly value is incorrect as it
omits the brackets around the divisor. Add the brackets to allow the
reader to correctly evaluate the value. Validated with the values given
in the driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3faea7ceebd3..0cc5b925cdb6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -450,8 +450,10 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 	} else {
-		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
-		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
+		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT /
+		 *  (2 * RX delay ns),
+		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
+		 *  (2 * RX delay ns)
 		 */
 		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
-- 
2.47.3


