Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1DDD19511
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJgupyv4cMlMjWoS3ehRYTeqZd5ThHSTOnFErgKpsH0=; b=shuFGD00QZLVFh4GEoQ9xuhaRu
	w8LwEANXU12obPlT+aghJm6XBNP1meluFTUPcNxtwXZA+h4vV31ZIw+/Cx2XQ9rpG3YZD3t/6mEja
	lte8rpBfRHQMa2ZXRYZXzVG5r3ZMx0w2mTDJEV3p7qz6tZpMKDmiPtjdQ/JaxpL8BNc8G5Ou8zAm3
	gnrqkx2zRUhJwMl5Iem0+VTxenuOpO+zUGOuQMNB3rhEyEIr8h/QuM8XyS6Rsm1OPkpkN8oRsqAa2
	WnT+p6blw6D3ibG/rhScLcsHEkw+++n2gXSnm0ytDR9NcwxZ3W2Fx9MVkNRj/4zJzUOUTFq38XmWb
	GAouIqjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkX8u-0000000DODH-1cRV;
	Tue, 27 Jan 2026 00:41:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkX8h-0000000DO6z-2PBl;
	Tue, 27 Jan 2026 00:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B434644344;
	Tue, 27 Jan 2026 00:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076F2C116C6;
	Tue, 27 Jan 2026 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769474461;
	bh=E6r83GJEejdqNv42ad0axn2xC3bNIulFB7d/X0R4UEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VqvsPB4XnXGAUSGtfXM2BLjW83pb+dmu9z0syFGF8qUO1beyR72ZsCuSiTzwgd3Ph
	 k/7VdLhJE+r0StwGC8QI1B+2qrRCNui/70imSiNwX9P0x57syOIGjpqh4hfVhL6QKF
	 z/XHx/6+Qjat2sO/QsNbSQFvqLTTGg3R4BNuADKsmYLBiNHgIyciMtYcOMa6xDGAUz
	 AQxAT1AsH2Ee6O7npCq6v2jhv71XmkIm3vCTcPsh6i8Qaoomosfn9xvBNgr4Nm6Z56
	 D+TQiaN7q19e7krhexQtow5GAan+Ug4W839LIxc336jnecHq/ZgZeO+3FTxm4jBudz
	 7lZcUee/VmbsA==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	linux-rockchip@lists.infradead.org,
	heiko@sntech.de,
	alexandre.torgue@foss.st.com,
	andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com
Subject: Re: [net-next,v2,08/22] net: stmmac: rk: convert rk3588 to mask-based interface mode config
Date: Mon, 26 Jan 2026 16:41:00 -0800
Message-ID: <20260127004100.3785792-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
References: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_164103_639929_1DB0C311 
X-CRM114-Status: GOOD (  13.13  )
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
net: stmmac: rk: convert rk3588 to mask-based interface mode config

This patch adds a gmac_grf_reg_in_php flag and a rk_write_gmac_grf_reg()
helper to write to either php_grf or grf depending on the SoC. It also
adds an init function for rk3588 to set up the interface mode mask.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 35836ffdfc1d..5bbdcc963430 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

[ ... ]

> @@ -126,6 +127,18 @@ static u32 rk_encode_wm16(u16 val, u16 mask)
>  	return reg_val;
>  }
>
> +static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
> +{
> +	struct regmap *regmap;
> +
> +	if (bsp_priv->ops->gmac_grf_reg_in_php)
> +		regmap = bsp_priv->php_grf;
> +	else
> +		regmap = bsp_priv->grf;
> +
> +	return regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
                          ^^^^^^^^^^^^^^

The regmap variable is computed based on gmac_grf_reg_in_php but then not
used - the call always writes to bsp_priv->grf instead of regmap. For
rk3588 where gmac_grf_reg_in_php is true, this writes to the wrong
register bank. Should this be regmap_write(regmap, ...) instead?

> +}

[ ... ]

