Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D6010F284D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+M9yYezcxfIh1hPPvvgkIRJqsWvclP69Ajn/rsWdDAg=; b=Q48YlgX3c+P7zgsgKkzPg/W2Cb
	+Dv/f0Qk1TlqeliixM9efxhXYI7jEz/anrrJTNNMfMutBGmFLVGjliW31BUc1WEctpitYqpLTFDei
	1+TJ9EfAF+Mh1NCHqx9hxW/G8+D/N7rbESqR64h93iKQP7jglGPsdfhikADxj1kK1RIvPo7Ud+jqT
	ycXYwBz6HxDlTCSvV5Fs7r2D2XJwIz1sRXQdL+G2YffMrtMVN8rJMBmHuzEbUlW3d98w6pDyjtwe6
	yuVsvyZ+xEh6pyK5bv4xWDx36c7UEQkaf0ppyTCmxEhwwsWVViiVOg2fhjV4owkyOB1L0r84cCl5W
	gMZTJoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AZx-00000007p9M-1MEE;
	Fri, 27 Mar 2026 17:02:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6AZu-00000007p8z-2UC4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 17:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+M9yYezcxfIh1hPPvvgkIRJqsWvclP69Ajn/rsWdDAg=; b=bHEMiXE8jlRa8mGAupx4zy/RXE
	sRxjTjYdIcYAw1Zoom9A73EC2ndhclH8n58t9u9mfc2Nb5XAo+Y7FEIA5Wtd6/eLNEefy2pOtfOfe
	C/0heJdKlBWVFIlAd/oifUahn/dfz34/+vJBCkUzMZZnkabQkbP8HX6XACzmHYQgv6yQA2zf+bbhr
	OG5OhDDAC2PfGhR87gIRdXsJTBNrsv67FrKDh/cbAYEH90FF2n/XL7XUlyRv1WH6ifuQ/eZUm9cZ1
	GeGKSKAsmSreCQrKRKpWV8osW6ZlHDFpwrkoM82afi1WXlpaazHDN6DU4RlRN0WGSUKf6d1XpjgQ2
	6xTNbWYw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41308 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w6AZn-000000006RA-0MTU;
	Fri, 27 Mar 2026 17:02:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w6AZm-0000000E54W-1F6E;
	Fri, 27 Mar 2026 17:02:26 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 17:02:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_100234_658475_3BDA2D92 
X-CRM114-Status: GOOD (  10.42  )
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

The clocks for qcom-ethqos return a rate of zero as firmware manages
their rate. According to hardware documentation, the clock which is
fed to the slave AHB interface can crange between 50 and 100MHz.

Currently, stmmac uses an undefined divisor value. Instead, use
STMMAC_CSR_60_100M which will mean we meet IEEE 802.3 specification
since this will generate between a 1.19MHz and 2.38MHz MDC clock for
this range. Add a comment describing this.

Link: https://lore.kernel.org/r/acGhQ0oui+dVRdLY@oss.qualcomm.com
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

This likely needs the qcom-ethqos 15 patch cleanup series.

I think this is what's needed to fix the MDC clocking issue. Please
review and test. Thanks.

 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ad3a983d2a08..ac7d6d3e205a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,6 +764,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
+	/* The clocks are controlled by firmware, so we don't know for certain
+	 * what clock rate is being used. Hardware documentation mentions that
+	 * the AHB slave clock will be in the range of 50 to 100MHz, which
+	 * equates to a MDC between 1.19 and 2.38MHz.
+	 */
+	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
 	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->dump_debug_regs = rgmii_dump;
-- 
2.47.3


