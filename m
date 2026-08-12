Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76979C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C263u9rVLW8LQm4gcIcoHLPBvXCdecVgr7UYaLA8USY=; b=a/vxkHfKNTE2BM3DE4Lrwdrlwy
	nwksJZr68Q2dOeaKDvripHzmKFIU04VlvPUIoorKBFNEV0OB40LPRBseAM4heMkYS7qFAaRZfIZXj
	+aBkBZCkpIIp7WR/GiKNc+5FQwbpE+bqv/KrqK7Zq9/yncFHzwqp8DJqNQcDpbDT04b+wkZZHfpmI
	rpEU41iears2OX7AhUnM96lzYOQ0DpWndTaNC1yrHfqbJ9sI5CVMYE/ur9YnVq3YCA0rtf78IaOpN
	g1FuFTHxlCtZ/RJSsmgDhX78mi8tkojnuWptmSLzbYFWgAeTjvEW4GYaacVNTOsDM6/N1A9aOBZkq
	QP5BxxIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3QQ-0000000Fa4t-3Oyx;
	Wed, 12 Aug 2026 07:30:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu3QN-0000000Fa4S-1ypp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 07:30:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2E371A15A2;
	Wed, 12 Aug 2026 07:30:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E8656045E;
	Wed, 12 Aug 2026 07:30:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2DE011C4C8B6;
	Wed, 12 Aug 2026 09:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786519848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=C263u9rVLW8LQm4gcIcoHLPBvXCdecVgr7UYaLA8USY=;
	b=J19Y8uMc8ZKcZpGlUAeQlNxM8ln6fgX7p1MmWs4xAPL0bMXd0OqQSz3fC5WBVt2NeJdPWx
	RAau+9Zjyt/NsfiKRCM84x6PeZj/UO6Kd6elSv5y12OthuXBeGNNJ3D9qGesJ6Eq84mlIv
	55rfky5D2Ig+K/KFGw5God0uOOXQnGeV+5kb1TspCH6gwqX7QM2ZEAeFhfdt9OCq94MmTv
	4lXGXVR3PqWRtPM5QsT2Wph2eB8kbgbw324T8ZM/XzeCem/0lvOa2HqZNpsKA/dz1agsSa
	ZcXBo18Z3EihV7e0Jn9/Q1zX3gYdzy/lKHRl55qXDWX6T/h/KGCy+kjVTlcxwA==
Message-ID: <8cbbe252-3339-47aa-be30-7415b47208f1@bootlin.com>
Date: Wed, 12 Aug 2026 09:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: keep gso_enabled_types in sync with
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
References: <20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260812-stmmac-fix-tso6-features-v2-1-72c3b06eb8d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_003055_661308_C84C15D2 
X-CRM114-Status: GOOD (  20.93  )
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

On 8/12/26 06:38, Lorenzo Bianconi wrote:
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
> 
> Fixes: 9edfa7dab811 ("net: stmmac: enable TSO for IPv6")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
> Changes in v2:
> - Fix possible race between stmmac_set_gso_types() and stmmac_xmit().
> - Fix fixes tag.
> - Link to v1: https://lore.kernel.org/r/20260808-stmmac-fix-tso6-features-v1-1-f82b17595052@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 +++++++++++++----------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index a71f0df26378..df3549f55741 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4371,16 +4371,20 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
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
> +	unsigned int gso_types = 0;
> +
> +	if (features & NETIF_F_TSO)
> +		gso_types |= SKB_GSO_TCPV4;
> +	if (features & NETIF_F_TSO6)
> +		gso_types |= SKB_GSO_TCPV6;
> +	/* Manage oversized UDP frames for GMAC4 devices */
> +	if (features & NETIF_F_GSO_UDP_L4)
> +		gso_types |= SKB_GSO_UDP_L4;
> +
> +	WRITE_ONCE(priv->gso_enabled_types, gso_types);
>  }
>  
>  static void stmmac_set_gso_features(struct net_device *ndev)
> @@ -4416,7 +4420,7 @@ static void stmmac_set_gso_features(struct net_device *ndev)
>  	if (priv->plat->core_type == DWMAC_CORE_GMAC4)
>  		ndev->hw_features |= NETIF_F_GSO_UDP_L4;
>  
> -	stmmac_set_gso_types(priv, true);
> +	stmmac_set_gso_types(priv, ndev->hw_features);
>  
>  	dev_info(priv->device, "TSO feature enabled\n");
>  }
> @@ -4766,7 +4770,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  		stmmac_stop_sw_lpi(priv);
>  
>  	if (skb_is_gso(skb) &&
> -	    skb_shinfo(skb)->gso_type & priv->gso_enabled_types)
> +	    (skb_shinfo(skb)->gso_type & READ_ONCE(priv->gso_enabled_types)))
>  		return stmmac_tso_xmit(skb, dev);
>  
>  	if (priv->est && priv->est->enable &&
> @@ -6198,7 +6202,7 @@ static int stmmac_set_features(struct net_device *netdev,
>  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  	}
>  
> -	stmmac_set_gso_types(priv, features & NETIF_F_TSO);
> +	stmmac_set_gso_types(priv, features);
>  
>  	if (features & NETIF_F_HW_VLAN_CTAG_RX)
>  		priv->hw->hw_vlan_en = true;
> 
> ---
> base-commit: 7b53449540502cb21b32bca62a6258e22cd97bbe
> change-id: 20260808-stmmac-fix-tso6-features-7fdc5e9448e2
> 
> Best regards,


