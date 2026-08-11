Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAE2C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9/67X/LTqY7+uC3dFrJVHFQgK16jDeYcGuHeHobhes=; b=RbZrPpQXaNZhTavun7egn4ASKu
	TNRoKwPDhWMzq4vEB8rov+XFoyWnC0nrNkdLHB2CEbi9VE4ri+LkiIEiTU5vh/D6BSagEeSHBM6Hg
	qZPTfnu0iZH19ydtGxl2Js7AXfYcy5MGi/koBiPNfLJxtsjTp4Y8YWOpsFrV9D+NAlqTHOBYR7NlC
	WZLlZdc2+I1ZyA440fWcoqcmmfyreJM1KjIVChjioK8y5MBLP9WYhGp+vmyNQksmRMRTVDZXI4C92
	H21AkLJPwK9n445Ub5c7zsghj0QZxJzW598VL6y5FogPaJUhgzVswuXUNCATMglK8hNOk2mj5zB+L
	MDkCsaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjPa-0000000DoYl-3TiN;
	Tue, 11 Aug 2026 10:08:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjPW-0000000DoYI-0SMj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:08:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 367991A1566;
	Tue, 11 Aug 2026 10:08:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08A576033C;
	Tue, 11 Aug 2026 10:08:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D39FF11C4BE4F;
	Tue, 11 Aug 2026 12:08:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786442912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m9/67X/LTqY7+uC3dFrJVHFQgK16jDeYcGuHeHobhes=;
	b=lHndeW7QJdEGn4ZG//J7fO4qbmQ90K8+WMK73B6JHfnlhc800us7XKEmPwV0UJbQVOhMld
	aBsc2APDG5U/g2UZBQTES/0rByUDKlJWCKgWIRprK3lFt+JsIfENdmqR9BCFGmn+L7MoST
	nVFc7O7r/1Y0U8dEJCEM2UPotuad7C9EqFcktw6nwlbi5zpIi+zqKBRNLlab2RjEYCrwjm
	dHbu0mDuOUA3UvuhE1ulF8vckJblz0SSMuH1fSJGmDknJAH1unfLz+XZd81ScolRV2rThS
	Mgdh7cRmUxsax7proZmq2PfmnpdP0Dh6QRmuYkUOze/BVW2+rjz+BKw+WaZzPg==
Message-ID: <16c11b73-7d38-4856-9100-d27993ae0fa3@bootlin.com>
Date: Tue, 11 Aug 2026 12:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: keep gso_enabled_types in sync with
 netdev features
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_030842_294190_9470B1C2 
X-CRM114-Status: GOOD (  19.35  )
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

Hi Lorenzo,

On 8/8/26 20:00, Lorenzo Bianconi wrote:
> stmmac_set_gso_types() derives priv->gso_enabled_types all-or-nothing
> from NETIF_F_TSO, but stmmac_set_gso_features() advertises NETIF_F_TSO,
> NETIF_F_TSO6 and (on GMAC4) NETIF_F_GSO_UDP_L4 as independently
> toggleable features. Since netdev_fix_features() only ties TSO6 to the
> checksum features, disabling TSO (ethtool -K ethX tx-tcp-segmentation
> off) leaves TSO6 enabled in dev->features while gso_enabled_types
> becomes 0.
> 
> For a TCPv6 GSO skb the stack then keeps the frame unsegmented
> (NETIF_F_TSO6 is still set), stmmac_features_check() does not clear the
> GSO mask, and the stmmac_xmit() gate (gso_type & gso_enabled_types) is
> false, so the multi-MSS skb is transmitted through the ordinary
> descriptor path as a single oversized frame.
> 
> Derive each GSO type from its own feature bit instead, so the mask stays
> in sync with dev->features and TCPv6 (or UDP L4 on GMAC4) segmentation
> keeps working when only TSO is disabled.

Thanks for tackling this :)

> 
> Fixes: 2e4082e4b739 ("net: stmmac: simplify GSO/TSO test in stmmac_xmit()")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 24 ++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a71f0df26378..3d3042afcdf4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4371,16 +4371,18 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
>  	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
>  }
>  
> -static void stmmac_set_gso_types(struct stmmac_priv *priv, bool tso)
> +static void stmmac_set_gso_types(struct stmmac_priv *priv,
> +				 netdev_features_t features)
>  {
> -	if (!tso) {
> -		priv->gso_enabled_types = 0;
> -	} else {
> -		/* Manage oversized TCP frames for GMAC4 device */
> -		priv->gso_enabled_types = SKB_GSO_TCPV4 | SKB_GSO_TCPV6;
> -		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
> -			priv->gso_enabled_types |= SKB_GSO_UDP_L4;
> -	}
> +	priv->gso_enabled_types = 0;
> +
> +	if (features & NETIF_F_TSO)
> +		priv->gso_enabled_types |= SKB_GSO_TCPV4;
> +	if (features & NETIF_F_TSO6)
> +		priv->gso_enabled_types |= SKB_GSO_TCPV6;
> +	/* Manage oversized UDP frames for GMAC4 devices */
> +	if (features & NETIF_F_GSO_UDP_L4)
> +		priv->gso_enabled_types |= SKB_GSO_UDP_L4;
>  }

Sashiko says this could be racy, as there's a short window where the enabled_types is 0.

Maxime


