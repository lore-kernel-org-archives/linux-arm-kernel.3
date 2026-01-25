Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B6CD778B1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+iROY3WUzRERSwXTs2FHC4QpZgLjZb1Kr+y3cuM6Ow=; b=W7krhE39NEQgBonEdaaBenWV3w
	O1TkRGUaHop/e1xPqvauqKGxL5vNf1BMBiHjkF3GzRdj0Qupmm+g/LkcmTek7wBBf9BUrEbZOZmop
	RWxc7Civ+ujxhilD9LrEm5hAw2a+Jv6rZ9r4/TOLbkdCB7Pn9moCdq+E3w+pDy18MPwIJ6vpbCO4U
	OM0VrCK5gKm5jdjw3mZP2UWBG0kgulkAUQBPVQDjBZx3hnUuAIHpcTzzX9Fs6blpmg/zyGpzKkl/+
	GWox4oJHXYC9ddqzyNK5MRo/YMiGxon6SQr0j2ja4c+6Ms3eUncOiP3AscGwjSn4A0Qh84KxoEnvO
	983ZYulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PU-0000000BZ3E-2I3b;
	Sun, 25 Jan 2026 22:16:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8PL-0000000BYwy-0c8l;
	Sun, 25 Jan 2026 22:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9033F60130;
	Sun, 25 Jan 2026 22:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97C0C19425;
	Sun, 25 Jan 2026 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769379394;
	bh=OEKubGr3hY5a5xOVN3rLMvcTBl4TpWU/SIwppQrSWZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LVC1RG8mh2klyraPJhN3DvpajxYAguCSbvBvWYpoPMcL2i4ldFU7OEuGeJNc3Ed3x
	 P4lw1apJZ3PIR++RZCynsg7sQNPWIQMqndzO0FNC1+un62PqZ6h4mF0PtfpyxY0Uf0
	 5+jBJQ3dpHd6ZMNpIZN+YKE8ryaEW6CTrUbLZ1mLYahbFSq8vNxto8527vGeqmfknp
	 0ZGa5hg0U32UR6WNjB5pl4Nn8MyRY2hmu6+Glr+v87wN1oQ29aFdm2Qml+0A5SK+PY
	 1gTRxMgEfy0H+kQLPaHWbBVP4nGv+DYJoVtqtAKaLl4teix/5IjROiirS66OmPKGDx
	 YeM7cFtbBqf9w==
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
Subject: Re: [net-next,19/21] net: stmmac: rk: rk3528: gmac0 only supports RMII
Date: Sun, 25 Jan 2026 14:16:32 -0800
Message-ID: <20260125221632.3396270-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vjEvK-00000005ghP-3lCt@rmk-PC.armlinux.org.uk>
References: <E1vjEvK-00000005ghP-3lCt@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
net: stmmac: rk: rk3506, rk3528 and kk3588 have rmii_mode in clock register

This commit moves the rmii_mode configuration for rk3506, rk3528, and
rk3588 from the per-SoC set_to_rmii() functions into the centralized
rk_gmac_powerup() function, using a new clock.rmii_mode_mask field.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ebbc09ea572a..759deb66ef2a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -987,6 +966,7 @@ static int rk3588_init(struct rk_priv_data *bsp_priv)
>  		bsp_priv->clock.gmii_clk_sel_mask = GENMASK_U16(3, 2);
>  		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(2);
>  		bsp_priv->clock.rmii_gate_en_mask = BIT_U16(1);
> +		bsp_priv->clock.rmii_mode_mask = BIT_U16(0);
>  		return 0;

[ ... ]

> @@ -1412,6 +1385,15 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  			return ret;
>  	}
>
> +	if (bsp_priv->clock.rmii_mode_mask) {
> +		val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII,
> +				     bsp_priv->clock.rmii_mode_mask);

For rk3588, the variable ret has been overwritten by the preceding
regmap_write() in the gmac_phy_intf_sel_mask block. At this point ret
contains 0 (success) rather than PHY_INTF_SEL_RMII (4).

Looking at rk_gmac_powerup(), the flow for rk3588 is:

    ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);  // ret = 4 for RMII
    ...
    if (bsp_priv->gmac_phy_intf_sel_mask || ...)     // true for rk3588
        ...
        ret = regmap_write(...);                     // ret = 0 on success
    ...
    if (bsp_priv->clock.rmii_mode_mask)              // true for rk3588
        val = rk_encode_wm16(ret == PHY_INTF_SEL_RMII, ...);  // 0 == 4 is false

Since rk3588_init() sets both gmac_phy_intf_sel_mask and
clock.rmii_mode_mask, does this mean RMII mode can never be correctly
configured for rk3588?

> +
> +		ret = rk_write_clock_grf_reg(bsp_priv, val);
> +		if (ret < 0)
> +			return ret;
> +	}

[ ... ]

