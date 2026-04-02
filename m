Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D8DD3942F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xD9Ws0wj/oKKCviSDFh+SyGUaZONQvwUQ/re7IVmgTY=; b=KcORFZEzljjVCNg0p24ECghVWc
	/KvOFM/lnGjcAe11KihNGV4SGL7EdlPHOMuBqE949Q96J/d5+E/GVZ0Pi1fqi0IEUZiuBe/iFIR0o
	NftfMZR5wxqAxcOv8/LC0ObRxNwMZPAd83qkWlDCui5jnl8vpNv3H1eOG+PE8MNMEGoxiKNUk7yYr
	EaT23KRc0ot1kjmFEDCmBAI74ITm5sNZYl1gfgXikzFJCLNZAuFGBwqgjzVOLQ9dIABSuGvvTLDLB
	jqrSej1eub4huMVVyJHkmkGG+P74UKBT949gG7epT9nEBrmBzBgNR/b0QxHKVekPhG2WHPQY9dGkl
	sHCoVosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JL1-00000000N9k-1Lzw;
	Thu, 02 Apr 2026 14:48:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JKz-00000000N8r-2MR9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xD9Ws0wj/oKKCviSDFh+SyGUaZONQvwUQ/re7IVmgTY=; b=yz0hZk2TQ0z0WN4LzR8/RPaHBf
	nAiQSMV47/v6hNhGL00u0kvvA+d4wkN6hBaKazAIonNrKRBBqpMWRvyaFD47A5qeRvpvn0sbr0QEO
	jy1D9swn36xdIPvtU9pybae20tbQchAZOnbqc8nDyiWZ8OC8CcfpJXQWE71H73asbTI28r1cWC3pM
	oHYUQ6dShP5Ju/BHedcgJsRExiUmoxaSF5+cWeN7A0UOlhRt7kboTYn+idcRYB9XUbtReSbaIMeAU
	OD95J8ymPcdm4gcn+mL19jVZ0OFaMl1xrtfxUHtx3ugEUkstqPo6XJh9spVwECze1E4Ne1qicie0m
	uwLwV3Ww==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59264 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w8JKs-000000004ao-2o1I;
	Thu, 02 Apr 2026 15:47:54 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w8JKr-0000000EdLC-41Bt;
	Thu, 02 Apr 2026 15:47:54 +0100
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
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: set clk_csr
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w8JKr-0000000EdLC-41Bt@rmk-PC.armlinux.org.uk>
Date: Thu, 02 Apr 2026 15:47:53 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_074801_603113_42BDCBA8 
X-CRM114-Status: GOOD (  10.21  )
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
fed to the slave AHB interface can range between 50 to 100MHz for
non-RGMII and 30 to 75MHz for boards with a RGMII interfaces.

Currently, stmmac uses an undefined divisor value. Instead, use
STMMAC_CSR_60_100M which will mean we meet IEEE 802.3 specification
since this will generate:

  714kHz  @ 30MHz
  1.19MHz @ 50MHz
  1.79MHz @ 75MHz
  2.42MHz @ 100MHz

This gives MDC rates within the IEEE 802.3 specification, although the
30MHz case is particularly slow.

Selecting the next lowest divisor, STMMAC_CSR_35_60M, which is /26
will give:

   1.15MHz @ 30MHz
   1.92MHz @ 50MHz
   2.88MHz @ 75MHz (exceeding 802.3 spec)
   3.85MHz @ 100MHz (exceeding 802.3 spec)

Unfortunately, this divisor makes the upper bound of both ranges exeed
the IEEE 802.3 specification, and thus we can not use it without knowing
for certain what the current CSR clock rate actually is.

So, STMMAC_CSR_60_100M is the best fit for all boards based on the
information provided thus far.

Link: https://lore.kernel.org/r/acGhQ0oui+dVRdLY@oss.qualcomm.com
Link: https://lore.kernel.org/r/acw1habUsiSqlrky@oss.qualcomm.com
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
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


