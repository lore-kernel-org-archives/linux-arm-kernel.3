Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15263C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KChgJAXuMQyT7x1VOwwYYFQMGY9QzV8q2M2IBSM9j7o=; b=puTUP9CMRbdqft7PY5Rb8hNSiV
	QcMnvT0vCgXHuWU0WHnfoID51CobVttaCt5ghgDW11q9A2PXVQC+KJvl8vn/jdCt2Lb2bNwEHpwZr
	58TbW+nYFSSgy0x4LXHER4mr9ss3TmobIAOmcolzxyDCstw6r6wR3o+OdoX8Up8nH+UTtfFXCLGDe
	ZWq9jzuRplNo7+lZkFIqwBaCEgkrt6X8jPsCqb1K2eybl7s/hQqU+lWnsjYgNay/rTOPnofyzHAzb
	AJ/IMdPynEl7UCXue8tOD+OhvL+OSbUz4XL0rEhU4yC4Je3GCnURmIhfMF6LrUzLc1B9TEiNkKefB
	9fKSfdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIMV-00000007xa9-3V3z;
	Wed, 12 Mar 2025 09:26:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHM-00000007wL1-1UHb;
	Wed, 12 Mar 2025 09:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=KChgJAXuMQyT7x1VOwwYYFQMGY9QzV8q2M2IBSM9j7o=; b=C5/Fd0iLx5QDzAjcXhO9HQEe3t
	VKrWJv/eAG3ttpnTFCtxA1HZljukx7CwFXvnAEcadPCPHeqxEna4BrNcVGF/CjsCgzJuv7SrlGCGB
	JMUsmYXmFey4m8fCE9DzAT2t0SQpcvMtUtSZNcozZV2F+MUayGLsoK3D+DxY2ho/PJjF00JyXFAyi
	aitD1oPnFwHPWw6uYTfLVuZY2p/O3OeG3HuW9q4qKQSiGStGSSbzmzq0uQNOUBRRRnJK7j5m88mp6
	/GNivY9hyLXy9tTpSFtR8UujEX03T6TtjXU6yZlp+GqDweKXo8MSBd8uERN6UYybyPzWUa9c08b4L
	c7JavzJw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIHJ-00000002LKX-0ool;
	Wed, 12 Mar 2025 09:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KChgJAXuMQyT7x1VOwwYYFQMGY9QzV8q2M2IBSM9j7o=; b=vpgWF3sK6eOoHMYePbzIi4JaUs
	H+uPnBvjZuTPJg+0EqBv4KBtrKNwb6KN9930joCOMbbFN6+SwDxc3f8rFuU6CXNPTt+zUqiOReOw9
	Twxbe9IYnUYdnldfoUp15x4Mm1xvtkB1ZEh+sP7ngT+Nki7rDT9chsDYBVE0FJitr3AX3k17kx5Pf
	q8XHBnOcSl09d0e3v38pxEJEFFvDOjqSlFFdYd/kj2lEzL98iQSmgoC52TrPu8UmIEeGQn/tKQvLh
	fIppVrTWTFf6mwErzAs2LOTdKvRzDbkAwKUS4qPErBTPi1dY39xe4XRCwf+zCfvOQZ9BoI6rMYhIG
	39/ND6Cw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39778 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIGu-0005CC-04;
	Wed, 12 Mar 2025 09:21:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIGX-005uzl-TQ; Wed, 12 Mar 2025 09:20:41 +0000
In-Reply-To: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
References: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 4/9] net: stmmac: ipq806x: remove
 of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIGX-005uzl-TQ@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:20:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_092129_346954_AE45FA3D 
X-CRM114-Status: GOOD (  12.36  )
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

Pass plat_dat into ipq806x_gmac_of_parse(), and set gmac->phy_mode from
plat_dat->phy_interface.

Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 0a9c137cc4e6..ca4035cbb55b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -211,16 +211,12 @@ static int ipq806x_gmac_set_speed(struct ipq806x_gmac *gmac, int speed)
 	return 0;
 }
 
-static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
+static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac,
+				 struct plat_stmmacenet_data *plat_dat)
 {
 	struct device *dev = &gmac->pdev->dev;
-	int ret;
 
-	ret = of_get_phy_mode(dev->of_node, &gmac->phy_mode);
-	if (ret) {
-		dev_err(dev, "missing phy mode property\n");
-		return -EINVAL;
-	}
+	gmac->phy_mode = plat_dat->phy_interface;
 
 	if (of_property_read_u32(dev->of_node, "qcom,id", &gmac->id) < 0) {
 		dev_err(dev, "missing qcom id property\n");
@@ -398,7 +394,7 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 
 	gmac->pdev = pdev;
 
-	err = ipq806x_gmac_of_parse(gmac);
+	err = ipq806x_gmac_of_parse(gmac, plat_dat);
 	if (err) {
 		dev_err(dev, "device tree parsing error\n");
 		return err;
-- 
2.30.2


