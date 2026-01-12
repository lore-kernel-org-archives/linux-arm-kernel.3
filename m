Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6425DCF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 20:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Szp9Mk0HCeWFgb449BpUK5gU0Kp6TwYpUFZWyIqpWlY=; b=mwZkxq9ioxErIbMRAqXE/mTqhx
	1XelUhqp0ggqstoktIfIfH0duIVOONamVH1V4BoW1TNoYM2s7uz1oqq76m80mMyKPeLEHB5rSHQb/
	snbdZtcxcFd+nhqFeLvIOH4a1HpGEPT2zKtPFo7hYincWKwMdQ67TAt1mDY11kmGSspDst6v6kusJ
	1M6GWx/WlNzIFlK3o6zx4L+ZEaJiomHEVWeRXvJAbfEkCGDqJ3cNV1D7+mtD/VxEobe4rHsLKlYJp
	vBiNXxiZCD9YrtnTA+ONTa/AcJqerGgOMjYruTVA1Awx9T+T2rt2+vSZIWdNrgF14BnVJhoyPWJ1e
	iz2tq/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfO6n-000000067jr-05qz;
	Mon, 12 Jan 2026 20:01:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfO6l-000000067jX-1zfW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 20:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 815446000A;
	Mon, 12 Jan 2026 20:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D75C116D0;
	Mon, 12 Jan 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768248106;
	bh=iAzLbGMDXQfuE3s4KFa2lQ8l5bKVW/+TK+/FOv2Eho4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmRTtpW0cY4oNrQtvYdKlC26VlGGgiFUrlh1ys7lAGIXsBImtcv9fbxXcfAzv35w6
	 GaCEUXCJJ9DajEsHvVfLZlvLZ1o8g6qhe8jqJP+I/v0W28Qb9X04J0DxlQpqYlF1rk
	 rqauQh08FgmsrE9N/Oh9DsGa2zX+Yjq3nhAh4wzrFOzlAxNMN2z97cm3vvzlatqYDl
	 rI0tZFsJuf7kCtx/pneTrvKh4BS4Plk3xYDOusK3NsxRQhiyXUjXXEm/FpNgVh0eSj
	 bQVUcZUGC3N7QtGsIFi7QPeyQ9vHl8/wPphA6UsoUUdaq3V+JCwd7EA6oyM9cOfoMh
	 pGUKXhKqAJiBQ==
Date: Mon, 12 Jan 2026 20:01:40 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
Message-ID: <aWVTJL_G__7IQTBn@horms.kernel.org>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
 <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
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

On Mon, Jan 12, 2026 at 06:11:29PM +0000, Russell King (Oracle) wrote:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..d6df3ca757be 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -102,7 +102,6 @@ struct qcom_ethqos {
>  	void __iomem *rgmii_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>  
> -	unsigned int link_clk_rate;
>  	struct clk *link_clk;
>  	struct phy *serdes_phy;
>  	int serdes_speed;
> @@ -174,19 +173,18 @@ static void rgmii_dump(void *priv)
>  		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
>  }
>  
> -static void
> -ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
> +static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> +				  phy_interface_t interface, int speed)
>  {
> +	struct qcom_ethqos *ethqos = bsp_priv;
>  	long rate;
>  
> -	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
> -		return;
> +	if (!phy_interface_mode_is_rgmii(interface))
> +		return 0;
>  
>  	rate = rgmii_clock(speed);
>  	if (rate > 0)
> -		ethqos->link_clk_rate = rate * 2;
> -
> -	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +		clk_set_rate(ethqos->link_clk, rate * 2);

Hi Russell,

An int needs to be returned here.

>  }
>  
>  static void

-- 
pw-bot: cr

