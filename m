Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5131C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 02:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1D/hTfHpEkj4ENhT/+CFwGkVCSkmz0nULHdaqKDKiw=; b=vRjSf3Ug5DgJfqfaYZNFYAAqwQ
	P/Zpvo4k43B/9hwgyTIiERLidm9yOD1Ulhjd3ClAykQkUbD1911IsOl3G70DIwTEn2P6KrXc3IXkL
	gJA3sqRorW7k9cDePSpzAvNc1ExjScwj1VgQpXcwZGq+zPtlrO3kVrXaIcyaAMJAFB/Wg40N/Kixo
	Go358PczgnPOqhk1OWq8PuYcPWycqM15EWJnHgkBcFBkDc9XBgbnbN68pO17SAN3NHOfFH0DZlQg1
	rFymksHFVkAZfaaW6z9Rg735QsoTTOTWb43y7AhE8KefXURnpVP3EyH7IMnF90QetUUE7xyxc8VZi
	yhBfNw2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAIUe-0000000Es1p-1UPP;
	Sat, 26 Sep 2026 02:50:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAIUc-0000000Es1c-3dzx;
	Sat, 26 Sep 2026 02:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBBDD60136;
	Sat, 26 Sep 2026 02:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B651F000FF;
	Sat, 26 Sep 2026 02:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790391025;
	bh=q1D/hTfHpEkj4ENhT/+CFwGkVCSkmz0nULHdaqKDKiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iSMIW41maQwL2ehdH0TNscsz5QmADA5AcVjc15u5+KuWioJR0ySjmMolmOtmqcqtd
	 euVIrdW1itg1oKyM81AVGjjga1yCF1A+UkhHwXhfBCz+/lUhPG3IFMKmDQybddT+qD
	 u1YAOjRBpaff2pUjvcnftQXSGCCX8A7U29UXB6BmCmspa97quzeHpjVdhREDTNiiUQ
	 zyi+BXrlvm4K8QWWcaur7u586K3UIibc0L1IYpyj6jhAqRpadzemGRIBaC168MYY5q
	 MPnz7difEO9IITvT/Y8WX6aky3IP2Wn7N0KYuta7GaJ77RmltWKYjbmUyNk7qtAErn
	 NJqPxZYV8+CQw==
Date: Sat, 26 Sep 2026 04:50:07 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com
Subject: Re: [PATCH] phy: rockchip: inno-usb2: ensure PHY is running when
 clock is requested
Message-ID: <xnvakstneih6njyxfe27kdx54vy3zpnth24o4mjlzuoykb2pfh@np7dx62waujo>
References: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-phy-rockchip-inno-usb2-clock-fix-v1-1-f7d59c31b908@collabora.com>
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

On Tue, Sep 08, 2026 at 06:07:42PM +0200, Sebastian Reichel wrote:
> On RK3588 the OHCI controller registers can only be accessed when the
> PHY's 480MHz clock is running. After system suspend the controller is
> resumed before the PHY.

This statement is slightly confusing. There is no PM ops in this PHY driver.

> The controller requests the clock, which opens
> the gate in the PHY's clock prepare function. But with the PHY suspended
> this just results in a dead clock being routed. The OHCI driver will
> then continue to access its registers resulting in a board hang.
> 
> Fix this by resuming the suspended PHY in the clock's prepare function,
> so that the clock is really prepared once the function returns.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> This was noticed on RK3588 EVB1 when resuming from system suspend. This
> is technically a fix, but its unclear when the bug was introduced and
> system suspend is broken on RK3588 for quite a while and not just due
> to this problem. So I think this fix can be merged the normal way via
> linux-next.
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 37 +++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index 7d8a533f24ae..07d400967def 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -332,6 +332,39 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
>  	}
>  }
>  
> +static int rockchip_usb2phy_clk480m_leave_suspend(struct clk_hw *hw)
> +{
> +	struct rockchip_usb2phy *rphy = container_of(hw, struct rockchip_usb2phy, clk480m_hw);
> +	bool relock = false;
> +	int ret, i;
> +
> +	/* Limit to single port; it's unclear how multi-port should be handled */
> +	if (rphy->phy_cfg->num_ports > 1)
> +		return 0;
> +
> +	for (i = 0; i < rphy->phy_cfg->num_ports; i++) {
> +		struct rockchip_usb2phy_port *rport = &rphy->ports[i];
> +		const struct rockchip_usb2phy_port_cfg *port_cfg = rport->port_cfg;
> +
> +		if (!rport->phy || !port_cfg || !port_cfg->phy_sus.enable)
> +			continue;
> +		if (property_enabled(rphy->grf, &port_cfg->phy_sus)) {
> +			property_enable(rphy->grf, &port_cfg->phy_sus,
> +					false);
> +			relock = true;
> +		}
> +	}
> +
> +	if (relock) {
> +		ret = rockchip_usb2phy_reset(rphy);
> +		if (ret)
> +			return ret;
> +		usleep_range(1500, 2000);
> +	}
> +

This looks like a duplication of rockchip_usb2phy_power_on(). So I'm assuming
that phy_power_on() is not called by the OHCI driver before accessing the
registers. So why don't you fix that instead?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

