Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77D4CF256D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 03:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/9fXz2ddaTLkXOH8ycWjaberX2W1W2CHsbRWkVwg9Y=; b=d+11duoBSiNZl+tLqjsG6TTKrR
	2ctvtnvksaqLtn8ijuBltficZx5WhYhzkLE+1MoFpHvkqnzZwP11uK1NMb0V88NWECgGOyLslWtCK
	8Ue8jETVgwD9EY3JBcUfYFcaQQvijxZMx8jWqSPpOvhHAag01oTGXK3D62sV+MgyV+9aoxx0Qaxdp
	iElb11fzfbLEjZ/e3KXXrcw+Zypvb0GDVx6bJTjlgldHkphJtMzzXqYxKa5+cTA99ES0q11l7M6ah
	4pmmr6QZGZ4vMQGu8JCt0Mg16z5VeGwhUI+u5siybwskOPBu4joKzO8cA1VoFv7pBcOy8SibQALNZ
	IG1y+G4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvkE-000000066ay-3Gjn;
	Thu, 20 Nov 2025 03:54:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvkD-000000066ae-08RV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 03:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28C3F40860;
	Thu, 20 Nov 2025 03:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0371C4CEF1;
	Thu, 20 Nov 2025 03:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763610843;
	bh=a7vnpmXnXdqNvYGCUQj1wNNIzSzZ7tEyGzfOBhzICC8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L5gYLiXPHSg8nT9iI/9V4WGuGCyjZPy4pOzGn61PY5F14rjSQqAY8nVbUINYCsW6x
	 /mPpFqBKA/iTOjPtr6btfSSNYGV6o9d9KT52nGogQSVUvr7TxsSKdHuYMCEkZ+0Ohb
	 BfQqKbAmdqb91w+iwEWMzR1xOV+WF1N8ms8BJ+VJHuOr9Z+FoqDLsckC4a2a2geGfN
	 FeuQBJ7NM0P2lBrWz6zH0tq0OVqv1DW3ng9ibI9Wv2SuziZfoOAVHnTDZGT4+At4Zn
	 KepKt1hnlN5Xfh7XoqXdA4LCIovpS4NE0vBJQcTQ2+j9uQi1qJaSt7/Bq9YPUo9Lhp
	 ewMqf3JRICEGQ==
Date: Wed, 19 Nov 2025 19:54:00 -0800
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
Subject: Re: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20251119195400.1bf0cc68@kernel.org>
In-Reply-To: <20251119195920.442860-4-maxime.chevallier@bootlin.com>
References: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
	<20251119195920.442860-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_195405_093965_E1758196 
X-CRM114-Status: GOOD (  10.14  )
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

On Wed, 19 Nov 2025 20:59:04 +0100 Maxime Chevallier wrote:
> diff --git a/net/ethtool/common.c b/net/ethtool/common.c
> index 2f4b70f104e8..8216e4ada58e 100644
> --- a/net/ethtool/common.c
> +++ b/net/ethtool/common.c
> @@ -460,6 +460,21 @@ const struct link_mode_info link_mode_params[] = {
>  static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>  EXPORT_SYMBOL_GPL(link_mode_params);
>  
> +const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
> +	[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
> +	[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
> +	[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
> +	[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
> +	[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
> +	[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
> +	[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
> +	[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
> +	[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
> +	[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
> +	[ETHTOOL_LINK_MEDIUM_NONE] = "None",
> +};
> +static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);

Thanks for reshuffling things, this one needs a static tho:

net/ethtool/common.c:463:12: warning: symbol 'ethtool_link_medium_names' was not declared. Should it be static?
-- 
pw-bot: cr


