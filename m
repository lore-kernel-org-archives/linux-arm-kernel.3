Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADE2CF2564
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 03:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUmWN2q9CznqHhZr93nYeUTrbX/gJRytbRQOjNs241w=; b=dQguKoliQyqfTpfDC3fVhD43BA
	+3JXix/Fp7GFvtvsgu4bJxYvi/LajQzdKihpqXQCa4+xS3zER1FRjC82Xi6C3O/kQP73IIw2fumc8
	JkG7dWIr1uHI/k8JGa91Xuq2mtNPoFbmRts6ybWQcfPtuaVacgkPlob8RGeuQMTWOSUUrG6Zj6K0N
	WpEKQLRZangY3Mp+GxdF3aLJYsHeEYcMtRZ8vKdfsBQqiQE9CNltRpsB09gl5cSxb5XymO1l5KApx
	xhBgOjYzrHvvX1JGtWJBfJlgtUa7z+N2mYI8ae9kwIWRIWLfesz/8Q2br1nLk2bt+4UNS4L5u2PEg
	B9pFNq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYfK-00000001RuR-2Ios;
	Wed, 19 Nov 2025 03:15:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYfJ-00000001RuJ-3dyv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 03:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFEDD60204;
	Wed, 19 Nov 2025 03:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88573C113D0;
	Wed, 19 Nov 2025 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522128;
	bh=YOmZc5YkShaSn+TX5Z50l4bn0lVGLCCXoWsdflxq00k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hxUFiRqOKzZpf/5IGRwwjsZIvduHM2jeGVy6jyUOF2zF+sIjEPzNZBq9nPr5v/rr9
	 hdMyHjar+KKvRSgBOoJYX7eKl5kFirM5ZHsKhotXziMKk+N6cwDxUDGrtTwUGX1rJ7
	 5wttXB+JMF5nkhpkRyIBb9Kut33ZIjai8XO6cAKbjd/9osutzKKq3nIh5emqaQr/M+
	 DIFbuex/If6iNDPbTW3fXCPexl9FoNjHgozgwhkT3QKGAiJrsnGrWGV0wq+7yqPi/j
	 JfMz5g85oU++rcfheWS5gzv4Q7idLIOEHDAqQKNRFExRAymryZmbGjKKO5KAK7O9Op
	 po7iPszoyo+ig==
Date: Tue, 18 Nov 2025 19:15:23 -0800
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
Subject: Re: [PATCH net-next v16 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20251118191523.4719ca2c@kernel.org>
In-Reply-To: <20251113081418.180557-4-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
	<20251113081418.180557-4-maxime.chevallier@bootlin.com>
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

On Thu, 13 Nov 2025 09:14:05 +0100 Maxime Chevallier wrote:
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -228,6 +228,10 @@ extern const struct link_mode_info link_mode_params[];
>  
>  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
>  
> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))

Hm, I think this is defined in uAPI as well?

>  static inline const char *phy_mediums(enum ethtool_link_medium medium)
>  {
>  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> @@ -236,6 +240,22 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
>  	return ethtool_link_medium_names[medium];
>  }
>  
> +static inline enum ethtool_link_medium ethtool_str_to_medium(const char *str)
> +{
> +	int i;
> +
> +	for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
> +		if (!strcmp(phy_mediums(i), str))
> +			return i;
> +
> +	return ETHTOOL_LINK_MEDIUM_NONE;
> +}

Same comment about possibly moving this elsewhere as on phy_mediums()

> +static inline int ethtool_linkmode_n_pairs(unsigned int mode)
> +{
> +	return link_mode_params[mode].pairs;
> +}

