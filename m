Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC54CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x991MXHST0EKiSJEKhetd564OkHnAL8jVf76/MDrS0c=; b=KHcaB0gWifPr95kzTm333Vfsf1
	LSq+rBIb0CdQi1EJT2BTOi9hivpSJ1J4E3hotaOCwNN+TZldTUXAugquOd/SpkUPIMktll8cy9z5n
	EYM0aDHBLS//aYHAjAAqs0L4h/b7/meAIdWXWTjKvbP4N4/Ltm9+jVTpBujFqklz1qETkPra7/4jB
	+RVifERRPl3vju2mUthF8IaSc3697ijjgBxi5MdZSyCc8FBqrg+OD7LG2qYGCAoPUmt6zctLQSiie
	d/KXCtsLyx07VKl2Qh6aCf3rm+O03NleUd746E/npTfwSewmwOSlfvBUAkX/oxHv7PQMkCtPvRCqB
	a5ZZtE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u6-00000003QcV-1NLv;
	Fri, 15 Aug 2025 20:19:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz06-00000003EZX-1kDB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 18:18:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x991MXHST0EKiSJEKhetd564OkHnAL8jVf76/MDrS0c=; b=D+x1WVLcZ53KTWMcrdI9EpHE02
	8yC/gviSJuG+wT0FAIwdGtx7Hf91sReRU9wzkbY4NR3pjNjtDNmP9vMxhMo/l+8MZg2yWVYK76lbO
	wi3IiJOXMaoVg9Hh6SGKlOUaRg8hQeMHqwBkf/wzWwJd/djaMoJHqc/2nMfXfCz21w+vy5/U5bwYw
	4J4EwUhJGOS8vNnS+LfEbStl0PEJjv/PDWiyoPj7QrXeo0MSsrixOW50WpA/1PPyaNj1JXc9ZjGJe
	K+upEvI9o4KYZ2TXOJ5SYgdbiIVNbI1yJHK+mGofoW+ZJAcleHbNAtUm+yqQFE7Yfy3sZ8ZOB09sL
	6qFjkI2Q==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz03-0000000GnRK-18Uk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x991MXHST0EKiSJEKhetd564OkHnAL8jVf76/MDrS0c=; b=XeDhmJ4y9KKDkVdDuflrq5rn09
	L5mL6HhGn0XktAYU7n3gE40QDLQ2HzzS51Uyk61sD2QFliAjVGRBjC2aHH5+x+mbqWGvu9fWqUilP
	PFN6P/BWLU60i0PyUv3v+2ex0B4ftLx92Ab83vIpqI3OPteQ4f3sG9XgovWaSO/8S3G4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1umyzl-004qln-V5; Fri, 15 Aug 2025 20:17:41 +0200
Date: Fri, 15 Aug 2025 20:17:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	taoren@meta.com, bmc-sw2@aspeedtech.com
Subject: Re: [net-next v2 3/4] ARM: dts: aspeed: ast2600evb: Add delay
 setting for MAC
Message-ID: <0f0383dd-a55b-48e6-824c-798c2a9e173e@lunn.ch>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
 <20250813063301.338851-4-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813063301.338851-4-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_191759_590924_7DC880C5 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

> @@ -149,6 +155,9 @@ &mac2 {
>  
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii3_default>;
> +
> +	rx-internal-delay-ps = <2000>;
> +	tx-internal-delay-ps = <2000>;
>  };
>  
>  &mac3 {
> @@ -159,6 +168,9 @@ &mac3 {
>  
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii4_default>;
> +
> +	rx-internal-delay-ps = <2000>;
> +	tx-internal-delay-ps = <2000>;
>  };

Documentation/devicetree/bindings/net/ethernet-controller.yaml

# Sometimes there is a need to fine tune the delays. Often the MAC or
# PHY can perform this fine tuning. In the MAC node, the Device Tree
# properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
# be used to indicate fine tuning performed by the MAC. The values
# expected here are small. A value of 2000ps, i.e 2ns, and a phy-mode
# of 'rgmii' will not be accepted by Reviewers.

    Andrew

---
pw-bot: cr

