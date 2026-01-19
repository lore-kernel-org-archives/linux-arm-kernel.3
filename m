Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3ED8CCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9m95KgEyNK1CvtfTsfth0r05lcDYU8i4iOvx30+kzo=; b=Sk9VJgziHJLpTQsRwLTtndGNnj
	iIJvcUlokMPL6Q2kOtRNgWT2kSrTiMo2CQR/tYu0CTRZWLWeYkzHidkdpH1JzrRHbug6kKhp3dAtS
	y2Cdq62324erKa81KnWj6HR+VZcY8haxq3E68/CS+tDzCkzNkEtRuJJAKfed0Y2O+CzsIL6u7nDWe
	JAOOAkVEuooBxTo1usDdDoH5NkQvYKpdddviNqTKN8dfzmJeu56tQFXf3xPNVoNyO+ppZLh8evfUN
	eVVqmorMipngfJhVA5uIP7Zs5O0qIIFS+2vSx+H6zrj3OcocM41CwI+Xuw5+KHluPXudyDhuyLqmk
	3LSAwfqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuol-00000002lh6-1As9;
	Mon, 19 Jan 2026 19:21:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhuoi-00000002lgx-2804;
	Mon, 19 Jan 2026 19:21:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 851EA600CB;
	Mon, 19 Jan 2026 19:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6584DC116C6;
	Mon, 19 Jan 2026 19:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768850495;
	bh=bTvnpQwyMWeQprejsCLPF19PUoNVMU+Bj/o+xuFRyPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhYHaSve1QmWIrv5TyLGaTbwpfcsUaMF8FmzVrt0/wMD7H60mLj0P0CBONBIlAk6s
	 2MgpJYvIMV7hr9yTFTfVZPsAthBZKM5rvBncUfeuowcaSgkSHprRyQjAIxq2cHizxO
	 iOClmclqVBvGQ4Ccloghkcpp1igKQnhoCD14gXvLRsI9ktg+aa8Ae+uagcSBh5lXCj
	 ga5CJxyB8jFbJrpTJ44TqoMj/+MFMo2cCAr94PZY4Aap4TArOrQOgR/5C4KKNVvwJ6
	 8aiS8FbuE4ysLrue1Ekh2MSuivawyRRIG4ad5DRekXMoDopYCtF5Z+Ocg2SkgN8cr2
	 mjoSI+jRrDnNw==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-phy@lists.infradead.org,
	davem@davemloft.net,
	maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com,
	mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	edumazet@google.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vkoul@kernel.org,
	andrew@lunn.ch,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Date: Mon, 19 Jan 2026 11:21:25 -0800
Message-ID: <20260119192125.1245102-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
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
net: stmmac: add stmmac core serdes support

This commit adds SerDes PHY support to the stmmac core driver, moving it
from platform glue into the integrated PCS driver. The SerDes is managed
through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
for the power state.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 2f826fe7229b..4d1902f3a58f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> {
> 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	struct stmmac_priv *priv = spcs->priv;
> +	int ret;
>
> -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> +	ret = dwmac_serdes_power_on(priv);
> +	if (ret)
> +		return ret;
> +
> +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> +		if (ret)
> +			return ret;
                        ^^^^^^^^^^

If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
a powered-on state? dwmac_serdes_power_on() succeeded at this point but
there's no corresponding dwmac_serdes_power_off() call before returning
the error.

Looking at phylink_major_config(), it appears to discard the return
value from phylink_pcs_enable(), so the caller won't know to call
pcs_disable() to clean up the power state.

Should this be something like:

    if (spcs->interface != PHY_INTERFACE_MODE_NA) {
        ret = dwmac_serdes_set_mode(priv, spcs->interface);
        if (ret) {
            dwmac_serdes_power_off(priv);
            return ret;
        }
    }

> +	}
> +
> +	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
>
> 	return 0;
> }

[ ... ]

