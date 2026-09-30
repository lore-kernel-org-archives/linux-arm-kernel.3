Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEFFCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tf3AicESXUN6zuzkl4u0tQ13NoG3pfVJBuiqaZBvBM=; b=iV/1WwDEgJH3aUO5zWxuwVcFnN
	m6OCm54K8+vEsrMCJckryPe8eXfb90EjIkhdioGEjkbGttIQsdOEnI5CwHiOBf1UIDe6/txFltSf8
	82hMVgMVxseyEWsALeFTSJR7gK+r1sE/yjEtLLwHTUy3khrBq9DGN1UlUgnwVptrUosu6K7ze/x20
	rl97sb2d6YTg7hTiD/Dcp8rfNJnKnGVCMPK7VD8hpcsNmk1YlW7/nfEJPFMCbg91ZACUk4gFMTQRR
	rntIuyZpiT6HZmFDaKzfGaGqmVl7zKdpFlDx/XPru/3ZfChEtJ2+eHBqR5r23MAqrkpqQphp2FpaF
	EOtmgNyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC24u-00000007H76-10bp;
	Wed, 30 Sep 2026 21:43:04 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC24s-00000007H6e-1Aqw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:43:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C51E21A1088;
	Wed, 30 Sep 2026 21:43:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F42460749;
	Wed, 30 Sep 2026 21:43:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E477103298BA;
	Wed, 30 Sep 2026 23:42:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790804579; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2tf3AicESXUN6zuzkl4u0tQ13NoG3pfVJBuiqaZBvBM=;
	b=wWq8lA4jkXbXyIYIi/p642+Ci9bSZu3PRIhX4K8SASZRLhSn6gmX4nNtsJm5c07SRvsx/F
	/IWwOfD5fT7y+7zgOqB8p8biMUCxKPV1tnjW/JOnXKiN/GHhr4B4TGzPWK33l8BecRGwMv
	lil80UiHe7VrH5SzyDw8ItgQ7e7O3b9hB0N/m6FK0iUWDIZiEE/lRJTqappRMwuwfdxFGt
	XZjyJSFZf5LLHNybBvis8UnE8viBPnOh3Se18Bpvx4/wYonqvagSM/H9UPKHK/YGc99LSK
	ellb3bQwsrRUhhLVjvWxxgs3PA53tfI2395U0zMnusrA9wMje+vsQXGPMrrDIA==
Message-ID: <87598792-c93d-4e2b-9094-0f3e9c72e2c8@bootlin.com>
Date: Wed, 30 Sep 2026 23:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v6 4/5] net: stmmac: Do not advertise S-VLAN stripping
 when it is disabled
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, recv.jo@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, jun.ann.lai@intel.com,
 yi.fang.gan@intel.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
 <20260928203441.34876-5-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260928203441.34876-5-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_144302_467422_D4B5C277 
X-CRM114-Status: GOOD (  14.31  )
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

Hi,

On 9/28/26 22:34, Ovidiu Panait wrote:
> C-VLAN and S-VLAN tag stripping are both controlled by the EVLS bit,
> so disabling rx-vlan-offload also disables S-VLAN tag stripping.
> However, rx-vlan-stag-hw-parse keeps being advertised as enabled:
> 
> root@rzv2h-evk:~# ethtool -K end1 rx-vlan-offload off
> root@rzv2h-evk:~# ethtool -k end1 | grep -i vlan
> rx-vlan-offload: off
> tx-vlan-offload: off [fixed]
> rx-vlan-filter: on [fixed]
> vlan-challenged: off [fixed]
> tx-vlan-stag-hw-insert: off [fixed]
> rx-vlan-stag-hw-parse: on [fixed]
> rx-vlan-stag-filter: on [fixed]
> 
> Fix this inconsistency by making NETIF_F_HW_VLAN_STAG_RX follow
> NETIF_F_HW_VLAN_CTAG_RX.
> 
> Fixes: 750011e239a5 ("net: stmmac: Add support for HW-accelerated VLAN stripping")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


> ---
> v6 changes: None.
> 
> v5 changes:
> - Rebased on top of the rename patch: used dwmac_is_xmac() instead of
>   the dropped hw_svlan_en flag.
> 
> v4 changes:
> - New patch.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0d70eb452af7..b007ff120471 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6211,6 +6211,13 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> +	if (dwmac_is_xmac(priv->plat->core_type)) {
> +		if (features & NETIF_F_HW_VLAN_CTAG_RX)
> +			features |= NETIF_F_HW_VLAN_STAG_RX;
> +		else
> +			features &= ~NETIF_F_HW_VLAN_STAG_RX;
> +	}
> +
>  	return features;
>  }
>  


