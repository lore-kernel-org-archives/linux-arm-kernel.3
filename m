Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6708CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaAAZBpMGB7NNLtOQW+QNZLjNhJZLoLyOf0dfTeVUlE=; b=RfB9qun+K5hzrGqysecFJzPMMk
	3VKGyIBNmamQZ9Vv5RpJz5bdGriWVFoWvrYxbWNl9y3Au4dyG6Ctu+ECiKKys6oXMRpxHX4LR/Nlk
	Q38FtdSBUB8XcwspM9zczYfOOkBYosQtbOs3YnF+Kub1dogVB3lgsQJ6YSE/RYzY2mgDL+gCdjold
	amUjy20miUTbdjle+z2Zusc4c6KJQbMJEAxIEzcAFayz42aDL81XYWdzOpZ+7ivbqkWB4ECRj+jod
	jjHADj5VAQwK7UdyhgWL7ESQHtki4xjJA2vn1QPkGtq18H9fPanw4AuxZsfDtgx8bnK2633cbeMid
	6cqU3KkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u5-00000003Qbx-38sS;
	Fri, 15 Aug 2025 20:19:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyvZ-00000003E4B-3TUH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 18:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NaAAZBpMGB7NNLtOQW+QNZLjNhJZLoLyOf0dfTeVUlE=; b=TUWl47J6wSWYZdovT7b4gyD3WR
	50y3vDmA6RhWA8/2jvpEdnsFV3BNqK01hlP3/tSGyP3Qf58LkPBdmGiD8QkszRpvmpS80Bo2T186X
	gy+vBs4epfvbkqJLMjAU5jmkqyTGLsLz4wFJ5/N9J3K2P4dWqA3iE5TPVNOyoVnUvyFU5mOo5hoMA
	47U+tK2ND6+rSG8PJD4qhG41hPJNKtaO8yCPe0ORNYDx3PNWNug6X1RTBwwEGBA5RRcRqtLUmVF7R
	v8LdN6edsyQz+IVJJtHOzHvMQKj3IR7t44jvU7i22ms6hvyNIzz/fJv+argpmpSndSxP6HAdy1G/E
	WcDeuKxA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyvW-0000000GnJ4-3QmW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NaAAZBpMGB7NNLtOQW+QNZLjNhJZLoLyOf0dfTeVUlE=; b=Tb6bmmhxnYVqGw0yP/q44nYma2
	yPL4ILKbEY+6Ft21B0Rg6zzDDTZglBOta6eYBy5fyy7Q75j8J9GAGRWPV3cxpMJbzD32qjSC8QYh2
	8KL70QyrnMO8qUc6Lhu8tCYXJeP1lcdRi2B83nbFMTVeP9NZJ6VYwjHPX6GGO20mKFno=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1umyv8-004qgu-QW; Fri, 15 Aug 2025 20:12:54 +0200
Date: Fri, 15 Aug 2025 20:12:54 +0200
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
Subject: Re: [net-next v2 1/4] dt-bindings: net: ftgmac100: Restrict phy-mode
 and delay properties for AST2600
Message-ID: <08c46fbc-b65a-4eb4-9cfa-e555cab8398b@lunn.ch>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
 <20250813063301.338851-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813063301.338851-2-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_191318_943139_2BD8944C 
X-CRM114-Status: UNSURE (   6.67  )
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

> +allOf:
> +  - $ref: ethernet-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: aspeed,ast2600-mac01
> +    then:
> +      properties:
> +        phy-mode:
> +          enum: [rgmii-id, rgmii-rxid]

Why not rgmii-txid? Also, why not rgmii?

On the MAC, tx/rx-internal-delay-ps is meant to be used to perform
small fine tuning. There is no reason why you cannot use this with a
PCB which implements a delay.

	Andrew

