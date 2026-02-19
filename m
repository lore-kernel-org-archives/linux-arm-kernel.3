Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE55EE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXy+qZEOQnVZ1TQ7eVHl4KeCMH2Hq+n4vm2MJCw5RdM=; b=EWF4KKOLDFvLxVvdfhVo0qnY0t
	XVcyAllBs1jmge1Tf/pzarvfhgjuSjbtENmpAASECQk0vjgbpzhN2iQLvV3KCyQagZufPy2XOY2gb
	V04qpu1tJv0U6BsBk6dKAYOlAs/TAi1sYhxFB6A3wXgDkZ9mfMLPwWd+DzdTmPJ8rrjtvrkFSiCoM
	Kzv+rKkz7QXIruKxHkPtuPeLfgkD7zjkH8NFSMvfkO/fOHWNqiq501Nntzd6Don1f407OKNOH59e1
	ZYq/zPyqizPmUIEdRTr2g99zWY14zf3uucvkgpRNVjgRPT9ZLJ7iGNb3h/+5aUWVpIIVVPsnVvozE
	rahXRNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3UP-0000000BM0e-3Bgt;
	Thu, 19 Feb 2026 12:50:41 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3UN-0000000BLzI-3KJX;
	Thu, 19 Feb 2026 12:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hXy+qZEOQnVZ1TQ7eVHl4KeCMH2Hq+n4vm2MJCw5RdM=; b=tZEqxZucuX/1jcU8pRmHuLZ+6d
	/9ccakLp0L3pRQL1fWOMLx1SA3A9iSe9vYiNi3fK7X6xHyHRCThgq/DKNBAkb+PKA8CefMmPnRhBK
	F8ocpLJY+bjuehH2eAqgrum8wd1jdABw8d3tSuNBqU3kAcIP1cOz9mHrIIKd8uRT5eRo8VXS8UW7c
	IAfAOFX9s1H4P8zLc3G6tCNRixWd+aLbPARNrH8JuTveBpKHO634g3dm6bnw0HopjgKldP6Lmn1bW
	hgylN8D4OmaZIYJcpW3Qc6Q/pU89P3s4fz3DX/BCZ8sxWZreQU8VvmW2fwVYd6JladAx/EdXH1Ba/
	JhZgLgkg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48508 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vt3UI-000000000rO-45uj;
	Thu, 19 Feb 2026 12:50:35 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vt3UI-0000000A5e2-0Im5;
	Thu, 19 Feb 2026 12:50:34 +0000
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next+ 2/9] net: stmmac: qcom-ethqos: move
 ethqos_set_serdes_speed()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vt3UI-0000000A5e2-0Im5@rmk-PC.armlinux.org.uk>
Date: Thu, 19 Feb 2026 12:50:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_045039_831322_BC9F2982 
X-CRM114-Status: GOOD (  12.07  )
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


