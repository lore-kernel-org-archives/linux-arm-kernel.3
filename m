Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1F5EDA693
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mowyMJmjCIhMn0C2DG7n77SSsLvmJxlX5WvGffL0C9Q=; b=z7+Sg2Jkc3Nhitne+j8/AWbfiJ
	cYEE76ATfMuVROeBW2jDsjjum3WJMlYLOdcy22qvRN+gDOMvnm1utTtUPCKoP8fBNpkHHTpm0A62K
	En0h6Je330Bq98QukG3VnnpoHJ6DJV00GnxVFHGHbBJ5datQHeujons9G4rXkIGlJlQnFcfMzVrDb
	5m4jpao2J08tJRAGiEO7SV5YT7U7zPyNXz90SZ7mpGtVBjjuoCLi8esg/9EJeWd7/Fhb3Vg8xaw7g
	1tOJd2tCzcjuZH9W00XAQl12o7pImseNX0Uy98pzGc7n4weaCEwfixuLOuxOcjPXT/rEtZqmVohOt
	5NoEei0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS4A-0000000FTQB-0wRS;
	Tue, 03 Mar 2026 15:53:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxS47-0000000FTOr-1FL8;
	Tue, 03 Mar 2026 15:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mowyMJmjCIhMn0C2DG7n77SSsLvmJxlX5WvGffL0C9Q=; b=tUFmdVhxRapKV8dmC2ymhe0C6K
	6/ZDFtJM68C6lThQ70yfiyYLMIviEj29g2FlO4yQA3Mtvks5+GwB3J+t/jAD3vnwhK7YN+TYst80e
	s4MwNs1ArW2AQgcH8fcDhJKZr9FCVBiJ6Sfx5r75YtXVSIbZ4nnhibFUBbK6BjvdIWjmMqS4D4pPC
	9vi32zhkWaZa5oBPYp5BLCBnsFN4OgdJLngQePgg8NcoCP490peq7W4k9U9UxQ4c7C38x9mn3wY3U
	FcC8pf8Oz4a8AqBkhd4PfZ00Vj2F4VYkNHNsELz9m/IyRWxSlanFLs2SKf41KokZ3VnK6GGZsgZd6
	UIQu8m9Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57374 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxS40-000000005Jb-1WxT;
	Tue, 03 Mar 2026 15:53:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxS3z-0000000BQXO-2WpU;
	Tue, 03 Mar 2026 15:53:35 +0000
In-Reply-To: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
References: <aacD3osfaZkLsGxm@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 1/7] net: stmmac: qcom-ethqos: move
 ethqos_set_serdes_speed()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxS3z-0000000BQXO-2WpU@rmk-PC.armlinux.org.uk>
Date: Tue, 03 Mar 2026 15:53:35 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_075343_329665_FE5069B3 
X-CRM114-Status: GOOD (  12.00  )
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

Combine ethqos_set_serdes_speed() with ethqos_mac_finish_serdes() to
simplify the code.

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ad5b5d950fff..57cbe800f652 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -591,14 +591,6 @@ static void ethqos_configure_rgmii(struct qcom_ethqos *ethqos,
 	ethqos_rgmii_macro_init(ethqos, speed);
 }
 
-static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
-{
-	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
-		ethqos->serdes_speed = speed;
-	}
-}
-
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
@@ -683,15 +675,23 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 				    phy_interface_t interface)
 {
 	struct qcom_ethqos *ethqos = priv;
+	int speed, ret = 0;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
+	speed = SPEED_UNKNOWN;
 	if (interface == PHY_INTERFACE_MODE_SGMII)
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
+		speed = SPEED_1000;
 	else if (interface == PHY_INTERFACE_MODE_2500BASEX)
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
+		speed = SPEED_2500;
 
-	return 0;
+	if (speed != SPEED_UNKNOWN && speed != ethqos->serdes_speed) {
+		ret = phy_set_speed(ethqos->serdes_phy, speed);
+		if (ret == 0)
+			ethqos->serdes_speed = speed;
+	}
+
+	return ret;
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
-- 
2.47.3


