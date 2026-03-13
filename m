Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8262105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRGaB5Bliy2iHcTFd37O3KH9tuEgTI4zNfd/MVCkts4=; b=pLOgAQ3FrC/hiKEP1/ndJMco5h
	ba6KijzBtelimHhF8dMWFs54cBoExPrht37FWixxkpHhoYvGyzX17vUSVJntvbrMurMZjciy4hexm
	SZz5TVTwG81buGFHB417WWp6114i3WFxSLNE2ivfMGM0nAICdCwXu210sxXz55XU9DsxpgFLEY+WH
	APaBfQEJRPaVCx6AM2Xs5Cto10bSyr6Q5BeyxeMSpMXIolALwFXfO3mo6Inun6465BsyGj0WbBUaR
	0GWHE2f60k1AYOrLkVmPI1+TRFnMCAH094fWCbIcuW3ZK2Nkhbdez7qWOVb7AfrLhqci6oQKx8c9N
	q0N951ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dz-000000006rS-2EB5;
	Fri, 13 Mar 2026 12:29:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dx-000000006or-1VEo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vRGaB5Bliy2iHcTFd37O3KH9tuEgTI4zNfd/MVCkts4=; b=Jlzc0EPaTQkfwlAVNO7tQgXXTU
	UCbM7Ov6AZPC6L6GCTB68qoZ6pNXBJAAxIWNSOvl3za/8DFRo8YIZApTmpCVv4rYb0EHfRfwrK1JN
	Y1ONHe9PEL5icTP622tkoGDOQVPFyTaGWBl7zxHYr0Lqc7FNoGiD4ifkV00ZqR6g/HfSRP429r70K
	ILzTO5dZXGSDZ7ASzg7Jho6fv6mnHqq9bnzCX73dfHOISS2O9+yhriPX+o6vlu0i1L+4b80LdXwCQ
	uxDEgel7DWfYaGuMEIumISbfEEKKbNbkd7blAO8FpE6pIkDNrxMaA3+xkuz3arJE4pDsLr3/1dHMa
	UysVQT2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47646 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w11dq-000000000vu-2e04;
	Fri, 13 Mar 2026 12:29:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w11dp-0000000DEiS-2epT;
	Fri, 13 Mar 2026 12:29:21 +0000
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 6/8] net: stmmac: qcom-ethqos: enable inband mode for
 SGMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w11dp-0000000DEiS-2epT@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:29:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_052929_397725_EB581AF6 
X-CRM114-Status: UNSURE (   8.99  )
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

qcom-ethqos is manually enabling the PCS ANE bit for SGMII modes while
phylink remains in outband mode. With support for SGMII inband mode now
supported by the stmmac PCS code, switch phylink to use inband mode for
SGMII. Phylink will switch back to outband mode for 2500BASE-X since the
PCS code reports no BASE-X AN support.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f0e7a060ca73..a4571c0ee8b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -765,6 +765,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
+		plat_dat->mdio_bus_data->default_an_inband = true;
 		break;
 	default:
 		dev_err(dev, "Unsupported phy mode %s\n",
-- 
2.47.3


