Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEFBE63CA4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7Kn92q1Cwojvr1vVrOuQ+UT0DmnbL9qLeqllIr2gjY=; b=kz0qTb9NYOghInInSmmnQCX0IA
	qv7+W6pUnAg/oKhVV1/vmFAfDnTvJwKKS17SLWARByPTMfgEFuN6EyK881DvKuCaeozmP6fphlvDq
	6KXNuHJmFuqBOLb3MK8Tb9B/mkdXMAS2y5Z3cmpZeFtCMI63+Q1iaZYKgdGVgoThbKEjTNTqKd9uk
	6rQc/fQWywlDu9HGwIM4ES1aJeBirPxvPk/3/eNoiqNbgjOtMuFKgXg2GWl7hsj4br2190t6JMUbj
	g3RMLQEYmt8KTiVUA8/Xq3LATgkG2a59g0wRW7pm1DhJzuGxmd70lWK4G/C1RpDsd+wfFQTSYhE/Q
	6Eed/GTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PH-0000000BYuS-2ZON;
	Sun, 25 Jan 2026 22:16:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PE-0000000BYth-2ZV4;
	Sun, 25 Jan 2026 22:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CBA1442A5C;
	Sun, 25 Jan 2026 22:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25263C4CEF1;
	Sun, 25 Jan 2026 22:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379387;
	bh=IXmYEQa3v2AXOgV7ZGc0qQyUfP6Kstj5GKYZ3gYVCpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lO3FJpY9D/lRWbrbZt5lKv/9RNiUf0XAQ1CTBQnkGmRGICX0fbqjXxP3cx+iV41YZ
	 2utOyn6n0/g5qTZkOhbkLhGHcfrXFbMoL+AcVvrF+yrLOepU0BHU1RdYBGxG4+uaGs
	 ZHDv1uNdNkK1PTXcronHbCVGe6m2jf5qYi78kqwd2QX6moWWnHHXRyDxQDrun7kcJ6
	 idTmkGO0oedSkBaAqDsnZKbNbYUU1hgU/2z7LhEoa9FlY+ICoSDW4ky8q2I0jGC1Fa
	 7t3qMbx8v/CBRxOGNIbP9l8+3LZeaXMk+1krgyH8on91VQj7ChHyv5ktPAGVI6Lbpg
	 aE2Hkpc3PV+nA==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	andrew@lunn.ch,
	davem@davemloft.net,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	heiko@sntech.de,
	andrew+netdev@lunn.ch,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,03/21] net: stmmac: rk: convert rk3328 to use bsp_priv->id
Date: Sun, 25 Jan 2026 14:16:25 -0800
Message-ID: <20260125221625.3396113-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEu1-00000005gfq-05H8@rmk-PC.armlinux.org.uk>
References: <E1vjEu1-00000005gfq-05H8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_141628_694169_359A1E00 
X-CRM114-Status: GOOD (  19.69  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: rk: convert to mask-based interface mode configuration

This commit converts many Rockchip GMAC implementations to use a new
centralized mask-based infrastructure for configuring PHY interface
mode. The PHY_INTF_SEL and RMII mode configuration is moved from
individual set_to_rgmii()/set_to_rmii() functions to rk_gmac_powerup().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 4117f6863ff0..48fc5b58092f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -1198,9 +1225,6 @@ static const struct rk_gmac_ops rk3576_ops = {
>  #define RK3588_GRF_GMAC_CON0			0X0008
>  #define RK3588_GRF_CLK_CON1			0X0070

The comment above this definition says "/* php_grf */" indicating that
RK3588_GRF_GMAC_CON0 is in the php_grf address space.

> -#define RK3588_GMAC_PHY_INTF_SEL(id, val)	\
> -	(GRF_FIELD(5, 3, val) << ((id) * 6))
> -

[ ... ]

> +static int rk3588_init(struct rk_priv_data *bsp_priv)
> +{
> +	switch (bsp_priv->id) {
> +	case 0:
> +		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(5, 3);
> +		return 0;
> +
> +	case 1:
> +		bsp_priv->gmac_phy_intf_sel_mask = GENMASK_U16(11, 9);
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}

[ ... ]

>  static void rk3588_set_to_rgmii(struct rk_priv_data *bsp_priv,
>  				int tx_delay, int rx_delay)
>  {
>  	u32 offset_con, id = bsp_priv->id;
>
>  	offset_con = bsp_priv->id == 1 ? RK3588_GRF_GMAC_CON9 :
>  					 RK3588_GRF_GMAC_CON8;
>
> -	regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
> -		     RK3588_GMAC_PHY_INTF_SEL(id, PHY_INTF_SEL_RGMII));

This removed code wrote to php_grf, but the new centralized code in
rk_gmac_powerup() writes to grf instead. Is this intentional?

[ ... ]

>  static void rk3588_set_to_rmii(struct rk_priv_data *bsp_priv)
>  {
> -	regmap_write(bsp_priv->php_grf, RK3588_GRF_GMAC_CON0,
> -		     RK3588_GMAC_PHY_INTF_SEL(bsp_priv->id, PHY_INTF_SEL_RMII));

Same here - the original wrote to php_grf.

[ ... ]

>  static const struct rk_gmac_ops rk3588_ops = {
> +	.init = rk3588_init,
>  	.set_to_rgmii = rk3588_set_to_rgmii,
>  	.set_to_rmii = rk3588_set_to_rmii,
>  	.set_speed = rk3588_set_gmac_speed,
>  	.set_clock_selection = rk3588_set_clock_selection,
> +
> +	.gmac_grf_reg = RK3588_GRF_GMAC_CON0,

This sets gmac_grf_reg to RK3588_GRF_GMAC_CON0, which is then used by
rk_gmac_powerup() to write to bsp_priv->grf.

[ ... ]

> @@ -1654,6 +1696,7 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
>  static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  {
>  	struct device *dev = bsp_priv->dev;
> +	u32 val;
>  	int ret;

[ ... ]

> +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> +	    bsp_priv->gmac_rmii_mode_mask) {
> +		/* If defined, encode the phy_intf_sel value */
> +		val = rk_encode_wm16(ret, bsp_priv->gmac_phy_intf_sel_mask);
> +
> +		/* If defined, encode the RMII mode mask setting. */
> +		val |= rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				      bsp_priv->gmac_rmii_mode_mask);
> +
> +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
                                 ^^^^^^^^^^^^

For RK3588, this writes to bsp_priv->grf at offset RK3588_GRF_GMAC_CON0
(0x0008). However, the original code wrote to bsp_priv->php_grf at the
same offset. These are different regmaps obtained from different device
tree phandles (rockchip,grf vs rockchip,php-grf).

Does RK3588 need a mechanism to write the PHY_INTF_SEL to php_grf rather
than grf? The clock register already has clock_grf_reg_in_php support
to select which regmap to use, but there does not appear to be a similar
mechanism for gmac_grf_reg.
-- 
pw-bot: cr

