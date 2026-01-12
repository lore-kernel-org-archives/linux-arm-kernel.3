Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E64CF45C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKpW3j7QEPMtte/xq/Kqnp5tdF2ya0EDZZiyEE9rFKE=; b=RFqwa4jZMKdUTO0kLbdMBt0hK7
	DvAINi4g3rx2lRDZIJie5NZ8l6h3LkXD1g2a80mtVvwOQOkxHm+ZpKghVQAxIMEHT/QGDIfMCyRz4
	GaDChy8LsLQ5ZrC2d+op0gm6joNx3AjelW5o5rWXGjljODx6U9h5OtCgiXHZaQ7EBCGxMhQqRUmwz
	ywBCvGSdyiVCSP+SDm5QOuIzbXgcq+LGDZJSkrEhkI7iDzdw29jFODGpKcb3ljggjTDZkS8iLa933
	BfynopK0JaguKbbrJzMGsEDBhAHpdNoO+gtlJagcJvITtEUwwjZeQmIHGOXIA9Jheu3Di9XSusEaf
	IorO4+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMO8-00000005usv-3fSo;
	Mon, 12 Jan 2026 18:11:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMO5-00000005usG-3dSG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OKpW3j7QEPMtte/xq/Kqnp5tdF2ya0EDZZiyEE9rFKE=; b=wXua87J2Bi9yo/Xi40fZoFqvzB
	MyjJlaSDV8ro6WGtWz3kWjhjaSONVPT7E0TxsLd6CfZxXpjr/jUq7G2U5G2ZTv9a+19ZyF5xrY48J
	RlUTGXy8lw3Vxpwgdt9gNWvaIgF3BFEMZLBXjPhI2zYCeOzgmaGOPJ3tu4Ooqz/HNsEaaThHITwlG
	/SVSPOF4BVYgjazpkyiZhkuY0iacfoIZTgIVzxnW4YRBcsUC1ctjGJRi/kcJYSpP47gxozX3Nwg5m
	nVgLR4m3XQxti9dFw2zUq6dsFOZ4+U8Fkp4vWHfCZCXs51iQLThLcDk3YjBw24I3HkBeOz0qikbO4
	qn34U+vg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35310 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vfMNx-000000006bd-1Wn8;
	Mon, 12 Jan 2026 18:11:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vfMNw-00000002kJ9-2XDx;
	Mon, 12 Jan 2026 18:11:24 +0000
In-Reply-To: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 1/2] net: stmmac: qcom-ethqos: remove mac_base
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vfMNw-00000002kJ9-2XDx@rmk-PC.armlinux.org.uk>
Date: Mon, 12 Jan 2026 18:11:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_101133_925983_0A5AF819 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

Since the blamed commit, ethqos->mac_base is only written, never
read. Let's remove it.

Fixes: 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0826a7bd32ff..869f924f3cde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	unsigned int link_clk_rate;
@@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	ethqos->mac_base = stmmac_res.addr;
-
 	data = of_device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
-- 
2.47.3


