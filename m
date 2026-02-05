Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088F5ECD992
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fHDQi34fVUPWoYfxvUQRDdNHeJu6A8a2oyunlAczJtc=; b=GR5QO9W/oN6FrAl7O4BCJWrAeu
	o/nhnvpmWQHNzs/eFRDGRCRZZiL/ua6xCUxb4IunBF+PbYx8CZ7dFpUGzD8LD2yTtbEgna4KwF6MO
	xXGe47MvkiQPwDNykC3SWbtzo4ZtbX8d0sgNXjSwZFIUyly0uuEqMoQMM4nBHK560qAyCfqNY5M16
	JFE4ktVB8sXERCHqkGBgnH4Rrx3eIf7wK3wk2vqJ7G1RwKhKuwD6Jg24ngL4qg4eYaqfwbHjxDDI3
	km/Z0vOAl29QBQTcjZWnnZnIPKU4mfHnxchjRCoJuVzpGHcOlu8yLbW+scu2E6JJDw7EmI3sNCzuP
	w8I/+kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo47q-0000000AMv1-3NfP;
	Thu, 05 Feb 2026 18:30:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo47o-0000000AMuc-2ghL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 18:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fHDQi34fVUPWoYfxvUQRDdNHeJu6A8a2oyunlAczJtc=; b=GLhMdLorgo4Lpe2c/teEhqRFE/
	pt2hfejxhy43/FaumZ2JySo+x2R3JzQKrTOpE6joAu6jV1CBAQELgsW//x3K4ncVuAETcQFw30fnw
	L2kRDhvwvGN5UF9as/ZxjIO7fsFRlUF+NHZdOsGcN7+2RnT827VKi/1hY2hI+23IkJT6q5G+8NxDF
	/R/FevIavTiT+yKk2OgqTpnGDg2K/RBJ6QpA7MB4M/T9QTwBsClJl65IfrXVf3/Fiu1935Z4kBgqw
	i/taI70rd5//z/VnVv3fo16v7qAfxIbfD5hsXuMHII3Vjec5jdlRwkpqPZAsAfqsYWb11JsEOdjOM
	GfKP2K0Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41268 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vo47i-000000007Tx-2hAS;
	Thu, 05 Feb 2026 18:30:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vo47h-00000007l0I-3rzN;
	Thu, 05 Feb 2026 18:30:37 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Subject: [PATCH RFC net-next] net: stmmac: add documentation about clocks
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vo47h-00000007l0I-3rzN@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Feb 2026 18:30:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_103044_886359_9F0C66DF 
X-CRM114-Status: GOOD (  14.23  )
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

Add documentation covering stmmac_clk, pclk, clk_ptp_ref and clk_tx_i
in the hope that this will help understand what each of these clocks
are for.

There is confusion around stmmac_clk and pclk which can't be easily
resolved today as the Imagination Technologies Pistachio board that
pclk was introduced for has no public documentation and is likely now
obsolete. So the origins of pclk are lost to the winds of time.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Is this worth documenting, despite the vagueness of stmmac_clk vs pclk?
Too verbose? Or not sufficient information? What do people think?

 include/linux/stmmac.h | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index a7d73b40041e..2367238e587c 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -282,10 +282,41 @@ struct plat_stmmacenet_data {
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
 					  phy_interface_t interface);
 	void *bsp_priv;
+
+	/* stmmac clocks:
+	 *  stmmac_clk: CSR clock (which can be hclk_i, clk_csr_i, aclk_i,
+	 *    or clk_app_i depending on GMAC configuration). This clock
+	 *    generates the MDC clock.
+	 *
+	 *  pclk: introduced for Imagination Technologies Pistachio board -
+	 *    see 5f9755d26fbf ("stmmac: Add an optional register interface
+	 *    clock"). This is probably used for cases where separate clocks
+	 *    are provided for the host interface and register interface. In
+	 *    this case, as the MDC clock is derived from stmmac_clk, pclk
+	 *    can only really be the "application clock" for the "host
+	 *    interface" and not the "register interface" aka CSR clock as
+	 *    it is never used when determining the divider for the MDC
+	 *    clock.
+	 *
+	 *  clk_ptp_ref: optional PTP reference clock (clk_ptp_ref_i). When
+	 *    present, this clock increments the timestamp value. Otherwise,
+	 *    the rate of stmmac_clk will be used.
+	 *
+	 *  clk_tx_i: MAC transmit clock, which will be 2.5MHz for 10M,
+	 *    25MHz for 100M, or 125MHz for 1G irrespective of the interface
+	 *    mode. For the DWMAC PHY interface modes:
+	 *
+	 *    GMII/MII	PHY's transmit clock for 10M (2.5MHz) or 100M (25MHz),
+	 *		or 125MHz local clock for 1G mode
+	 *    RMII	50MHz RMII clock divided by 2 or 20.
+	 *    RGMII	125MHz local clock divided by 1, 5, or 50.
+	 *    SGMII	125MHz SerDes clock divided by 1, 5, or 50.
+	 *    TBI/RTBI	125MHz SerDes clock
+	 */
 	struct clk *stmmac_clk;
 	struct clk *pclk;
 	struct clk *clk_ptp_ref;
-	struct clk *clk_tx_i;		/* clk_tx_i to MAC core */
+	struct clk *clk_tx_i;
 	unsigned long clk_ptp_rate;
 	unsigned long clk_ref_rate;
 	struct clk_bulk_data *clks;
-- 
2.47.3


