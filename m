Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D70FC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CwAOv7AuOU3VUGki+Bi2QHHT2yAfq3OZkA/qLdvJjM=; b=rrA4D2Qm2BJVBsYhagvFu4b59s
	cr8Tz8YQEjPyXTck1r+/XzoRVMqQWX3nvGRUJw5IiNfK5VwBzMg8/88MF7cZiBwLdbny3/9WOeJWF
	pNA2ztuUjxpcCgl7Q1094Qy/IzSRxOUtK7wXAUJvTjTDahUG5sqQrRSQgDXxeXqooryedERcneWM1
	h7NN5QeVDI+G86RtdDKQMIT8bnLdCcsIR1xHh+7rK8Sw3cKrQ/EkRSpZcouistv2x2X8iv5RDu2OB
	uZvY1/WnqZhkfLZUHkOcS+k8GIfuwEbqahxXPTHDMCm2A4ziEsDQzoq7YSky6QlTY5xVHXq4KfIXu
	6AnrnSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAN5-0000000Ahse-3qiF;
	Sun, 09 Aug 2026 20:43:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtAN2-0000000AhsD-3UY0;
	Sun, 09 Aug 2026 20:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8CwAOv7AuOU3VUGki+Bi2QHHT2yAfq3OZkA/qLdvJjM=; b=UIgSVgZnmz+5WlFSwJJZKiT824
	DTiu0zX3/mLBpv7/M4Fkbq45gPPjyiHRXTm8asKXEmk7uxC7vQm/8rhOCKd40QleKyr5XUiHF5buE
	wQHcnC6j6UjP7/D6iGx6E6NoQJvPr9lQ3QLMxVVuwslBI+UX7/YKdezQ5cihWe6CLaH0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wtAMh-00Gqw3-H1; Sun, 09 Aug 2026 22:43:27 +0200
Date: Sun, 9 Aug 2026 22:43:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
Message-ID: <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
 <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_134348_894563_6A7E8F6C 
X-CRM114-Status: GOOD (  16.48  )
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

> I think the most annoying one will be stmmac with the 3 different PCS
> implementation but we already handled that in a upcoming ipq50xx driver
> currently present in OpenWrt mainline.

stmmac is always annoying :-(

If this can make it more uniform, make internal and external PCS look
the same, that would be great.


> @@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
>         };
>         struct phylink_pcs *pcs;
> 
> -       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
> +       if (mvpp2_is_xlg(port->phy_interface))
> +               pcs = &port->pcs_xlg;
> +       else
> +               pcs = &port->pcs_gmac;

I thought the point of new API was that phylink picked the PCS. Why
this if? Why not register both and let phylink pick?

> +static int mvpp2_port_fill_pcs(struct phylink_config *config,
> +                              struct phylink_pcs **available_pcs,
> +                              unsigned int num_possible_pcs)
> +{
> +       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
> +
> +       available_pcs[0] = &port->pcs_gmac;
> +
> +       if (mvpp2_port_supports_xlg(port)) {
> +               if (num_possible_pcs < 2)
> +                       return -EINVAL;

This seems like defensive programming. If we said there was two, we
should assume available_pcs has room for two. I would not even pass
int num_possible_pcs as a parameter.

    Andrew

