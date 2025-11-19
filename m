Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52E2CF256A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qi8Uhh0lG9Hd4TNBn2tA/inIExO0IHTpT00+WCJjP4=; b=NRJu2QOJyLcIkCbDYQYpEX56wx
	i613UPrZAzCV/aeklGZ0xaLTR/nvUqRWpDGzAts62sASWgmv+Z/kf0fqK6EvzDIdMNFjvULWTBb61
	RwGfLkT/P4227RDvinr7mrjnH8b/nhQqKkp4VQmRi9Fdd6aUbuyh67qhpIG+WPomdGCDxkrEhqT8Y
	iWSu5WfxdCWBg87lZrqcWqLzK9cduAvVMS201Fls5TIfB8I0RJgRCz3Rhq8STSstXJ4mKDkBXZ3UU
	amJTx9Y6mM5EaQ+zTVr8A9Bz9GZAYBiIxco1wGswGSdr+pq5JuvSYXrw05IXX7F6ru/RqacYXLwph
	oBAvDW4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYfE-00000001RtT-14WV;
	Wed, 19 Nov 2025 03:15:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYfD-00000001RtL-2Pt3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:15:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE1F2601FD;
	Wed, 19 Nov 2025 03:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61698C2BCB0;
	Wed, 19 Nov 2025 03:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522122;
	bh=jppTVEZ7+b57BpzoBkGxDxEcHrfhod9Sylcsl4PBp2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IKueXAfwGpXxKjDN3my/fqv1yoK/JMu5VDNsDHVUadXWHn43VKfMAFfmOOdA4DaEi
	 m7Y7CwbXMRzf4w5qI/T3hEb6leiiu3VpBQHc6VHDVVwFpgyIYOxGmyki3Eme5QzECC
	 yBP7JdcF10UywPvnd/Y7v6jSYdUkRluJBdETGQ2LhGi62vUDClbhEM7PlV7COFI1HS
	 i2ywsp4XCzKV/Li7NHGOrgTfSO2s62Wi7AOqERyBrsVEVe8LP6L3sRr5waJa+tEZCI
	 J/FRiC07J4mSiFpOsylBEkBqubUaqi8JkIDdKg8DkRMW/8bqEPLCGcHin2mfnRpSYC
	 Pcb85/4PMtSwA==
Date: Tue, 18 Nov 2025 19:15:17 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v16 02/15] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <20251118191517.1a369dad@kernel.org>
In-Reply-To: <20251113081418.180557-3-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
	<20251113081418.180557-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Nov 2025 09:14:04 +0100 Maxime Chevallier wrote:
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index c2d8b4ec62eb..ad2b5ed9522b 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -216,13 +216,26 @@ static inline u8 *ethtool_rxfh_context_key(struct ethtool_rxfh_context *ctx)
>  void ethtool_rxfh_context_lost(struct net_device *dev, u32 context_id);
>  
>  struct link_mode_info {
> -	int                             speed;
> -	u8                              lanes;
> -	u8                              duplex;
> +	int	speed;
> +	u8	lanes;
> +	u8	min_pairs;
> +	u8	pairs;
> +	u8	duplex;
> +	u16	mediums;
>  };
>  
>  extern const struct link_mode_info link_mode_params[];
>  
> +extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
> +
> +static inline const char *phy_mediums(enum ethtool_link_medium medium)
> +{
> +	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> +		return "unknown";
> +
> +	return ethtool_link_medium_names[medium];
> +}

Will this function be called by a lot of drivers? Would be great to
find a more suitable place for it, ethtool.h is included by thousands
of objects :(

>  /* declare a link mode bitmap */
>  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
>  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
> diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
> index 8bd5ea5469d9..6ed235053aed 100644
> --- a/include/uapi/linux/ethtool.h
> +++ b/include/uapi/linux/ethtool.h
> @@ -2587,4 +2587,24 @@ enum phy_upstream {
>  	PHY_UPSTREAM_PHY,
>  };
>  
> +enum ethtool_link_medium {
> +	ETHTOOL_LINK_MEDIUM_BASET = 0,
> +	ETHTOOL_LINK_MEDIUM_BASEK,
> +	ETHTOOL_LINK_MEDIUM_BASES,
> +	ETHTOOL_LINK_MEDIUM_BASEC,
> +	ETHTOOL_LINK_MEDIUM_BASEL,
> +	ETHTOOL_LINK_MEDIUM_BASED,
> +	ETHTOOL_LINK_MEDIUM_BASEE,
> +	ETHTOOL_LINK_MEDIUM_BASEF,
> +	ETHTOOL_LINK_MEDIUM_BASEV,
> +	ETHTOOL_LINK_MEDIUM_BASEMLD,
> +	ETHTOOL_LINK_MEDIUM_NONE,
> +
> +	__ETHTOOL_LINK_MEDIUM_LAST,
> +};

Why is this in uAPI? I'd have expected it to either exist in the YAML
spec if there's a new uAPI that needs it, or in kernel headers.
Let's move it out for now to be safe, we can always move it in.

> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))

Ditto.

