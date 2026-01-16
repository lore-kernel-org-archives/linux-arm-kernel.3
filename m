Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67660D4A5EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8fi6CJhgG3Gt9/Fik90JXM3ELjZRcCcShbma7D2KVo=; b=nX1v2MRPhFMC5L0WBSd5cd0V8P
	Kbp9Xdc467ZjgD1lU0PBPtOr3pNOAhXY8MB8/E6yY+RVzF9RXvy4JlT5RjTu8yG6Idt4Qxpvl3vki
	VUhls6ZTMe+MEASXWC+ZvgXC5kT7ut62FjV99NHJRc72yan2qU93bBmMpnWViI1tyDJKEyM39xOmm
	hjsAkaRTnPFKXQH1VO4QVbJtyq18r8NrEE560oBIKohEy+HtxWSXJUI6Nat1wEwwvwkCwuD9AZhCU
	4gfiIDvNOaYP2ciQkwtboI1HfMWtOTks2o9RWqQ1nmtibaEisdj5IRPTRSOJgRgpQLckYZpE1YK7N
	rNScqKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga33-0000000DVGp-46bx;
	Fri, 16 Jan 2026 02:58:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga33-0000000DVGg-1cma;
	Fri, 16 Jan 2026 02:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79DF460167;
	Fri, 16 Jan 2026 02:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5783DC116D0;
	Fri, 16 Jan 2026 02:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768532332;
	bh=Z8pz7s7wIhRbbyi0eFN+WPj/og6acecvdgN9FzzA8w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnytLdQmwn45B3ZBFM/hT5sAyAKdFL8cS0MtmDxP7MsiosPTNfXT0MpvAg4XUmPR1
	 9ilmf53jlm8YkeMW8Jc00GdC18E/n5VkbyRY35TuR4ZFW3xHmu5MqZhldWLAs9WUSK
	 /f4lxWwLUTm3EtNqbHTGJ6xq8H/Hbkzv9EYuOXM3dRA+y+BjroCeUguepRPNbHs5bW
	 HWXDCT8AAsaXSVsydq/roIP7T+Q4pURm9S1g6LaAWJgEtkvJTHu51+NaeveREFBpMY
	 X9nW+jIvyV1Fwhk/5S6JbWK4h0Vdq7ghGQqgKK9I+Xsmal+MWtXHfobV8mowfGNh2C
	 Fbshsj4QJPOxg==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	vkoul@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	andrew@lunn.ch,
	edumazet@google.com,
	netdev@vger.kernel.org,
	linux-phy@lists.infradead.org,
	davem@davemloft.net,
	linux-arm-msm@vger.kernel.org,
	neil.armstrong@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Date: Thu, 15 Jan 2026 18:57:24 -0800
Message-ID: <20260116025723.354031-2-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
References: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
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

I haven't investigated too closely if this is legit or too defensive
TBH but since I'm sending the second one I'll include this as well..

This is an AI-generated review of your patch.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: add stmmac core serdes support

This commit adds SerDes PHY support to the stmmac core driver, moving it
from platform glue into the integrated PCS driver. The serdes field in
platform data is optional and NULL when not provided by platforms.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24a2555ca329..6c515f9efbe7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -3549,12 +3550,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>
>  static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
>  {
> +	dwmac_serdes_power_on(priv);
> +	/* Only sets the SerDes mode if it wasn't already configured. */
> +	dwmac_serdes_init_mode(priv, priv->plat->phy_interface);

When priv->plat->serdes is NULL, dwmac_serdes_init_mode() will call
phy_get_mode(NULL). Unlike other phy_* functions (phy_power_on,
phy_power_off, phy_set_mode_ext, phy_init, phy_exit) which handle NULL
by returning early, phy_get_mode() is an inline that directly
dereferences the pointer:

    static inline enum phy_mode phy_get_mode(struct phy *phy)
    {
        return phy->attrs.mode;
    }

Can this NULL pointer dereference occur when a platform does not
populate plat->serdes? The call path stmmac_open() -> dwmac_serdes_init()
returns 0 (success) when serdes is NULL, allowing __stmmac_open() ->
stmmac_hw_setup() -> stmmac_clk_rx_i_require() to proceed.

> +	phylink_rx_clk_stop_block(priv->phylink);
>  }

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
> new file mode 100644
> index 000000000000..3003e1ae38d2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c

[ ... ]

> +int dwmac_serdes_init(struct stmmac_priv *priv)
> +{
> +	size_t i;
> +	int ret;
> +
> +	if (!priv->plat->serdes)
> +		return 0;

This returns success when serdes is NULL...

[ ... ]

> +int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	struct phy *serdes = priv->plat->serdes;
> +
> +	if (phy_get_mode(serdes) == PHY_MODE_ETHERNET)
                         ^^^^^^

...but dwmac_serdes_init_mode() has no NULL check before calling
phy_get_mode(), which will crash when serdes is NULL. Should this
function also check for NULL serdes before calling phy_get_mode()?

> +		return 0;
> +
> +	return dwmac_serdes_set_mode(priv, interface);
> +}

