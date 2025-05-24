Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68B0C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j+A/wcAjjzOXucCcPrPqRyyoTRY9hnx7kS73VHwOW0=; b=WiGFKlHkgB5UiGInQ4R83rPh/6
	cMMWSUSHbOROl0CPdKO3WGtAHpD4BTy2u6HB5f728DNY+EHE2pO3AvYKPxsz9DCLdL8b1VDl5cw5X
	ppihrS+rmbmo6Ur+uxdwOnObnFRXcjDQzk1pZo6vzBe4qV7qlhqTklS4MT1/edcvVvxMPCaCW+qWb
	ZteIR1sodBH3Y9PN2RoT1a4nmPz3cIpohBe8bqnEZKv/G/ybFqtaFlKtnF2Tjc7GMW3BJAAzAggrP
	m8ZyU1h8M6W8/2avK17aFpvfAU+mZSNw8lstjw5NI+9VnWmXkSgtrSi1LAL1duSSqqxxQGF7VfPub
	SIsDQfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIqDK-00000005w1D-1opE;
	Sat, 24 May 2025 14:51:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIqB8-00000005vvH-3Yko
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 14:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=6j+A/wcAjjzOXucCcPrPqRyyoTRY9hnx7kS73VHwOW0=; b=Xm
	+Fntir9xBjM2MNWbSndaFmwEXhYF9USaPzzlIBnIdtYCNjV4ZIq9s5XoD2o1OaBJXNVmTu9z5TRMd
	DNKc6sxBSylhkLtYUeHzjykapObNfBt7gPISSXSgjjNCK2lIOsy/V1psSSVvUhRSOwIEWMD8OVuTi
	VWCCVcoaxKAAdTY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIqAZ-00DglV-8h; Sat, 24 May 2025 16:48:15 +0200
Date: Sat, 24 May 2025 16:48:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhe <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jonas@kwiboo.se,
	rmk+kernel@armlinux.org.uk, david.wu@rock-chips.com, wens@csie.org,
	u.kleine-koenig@baylibre.com, an.petrous@oss.nxp.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] net: dwmac-rk: MAC clock should be truned off
Message-ID: <112fa3c4-908d-4e31-9288-b3a2949555b0@lunn.ch>
References: <20250523151521.3503-1-sensor1010@163.com>
 <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
 <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_074850_889214_B0160FF6 
X-CRM114-Status: GOOD (  17.99  )
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

On Sat, May 24, 2025 at 10:05:47PM +0800, lizhe wrote:
> Hi， Anerdw
> The following is the logic for calling this function： 
> 
> 
> rk_gmac_powerup() {
> 
> ret = phy_power_on(bsp_priv, true);      // here.
> 
> if (ret) {
> 
> gmac_clk_enable(bsp_priv, false);
> 
> return ret;
> 
> }
> 
> }

Ah, there is something funny with your patch. Look at the diff:

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 700858ff6f7c..036e45be5828 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1648,7 +1648,7 @@  static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)

This line tells you where in the file you are patching, and the
function to be patched. This is what i looked at,
gmac_clk_enable(). And gmac_clk_enable() has a similar structure, ret
declared at the beginning, return 0 at the end. But the only way to
that return 0 is without error.

But patch is actually for:

 static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 {
 	struct regulator *ldo = bsp_priv->regulator;
-	int ret;
+	int ret = 0;
 	struct device *dev = &bsp_priv->pdev->dev;
 
 	if (enable) {
@@ -1661,7 +1661,7 @@  static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
 			dev_err(dev, "fail to disable phy-supply\n");
 	}
 
-	return 0;
+	return ret;
 }

And agree, the error codes are ignored in phy_power_on().

But i have a few questions:

How did you generate this diff? This is the first time i've made this
mistake, as far as i know. I trust the context information when
reviewing patches. Yet here it is wrong. Why? Is this actually normal?
I know diff gets it wrong for python, i don't trust it at all with
that language, but i've not noticed such problems with C.

Did you look at the history of phy_power_on()? It looks pretty
deliberate ignoring errors. Maybe there is a reason why this happens?
git blame and git log might explain why it is like this.

	Andrew

