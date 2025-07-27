Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A73C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 19:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6fAFR76cmo7RpsyFJQzRERhtJ7iBzJqeyQVBeXy91o=; b=iw0IUz0aNX9O2t7ULCZmQpKZYr
	icWbWhIILxS8f4Ye8vG8oZEQCZDNoxqJeAovx4TUSCvl3Sm8b8tqHqFkfLHh9tpbToa4oxT++uKrq
	pxYmpbimC/Fin5uBS+AL4/73BJs/dkY1SAl7Vx3Yv//4OMpnaHtJyFvNPHu5e1aeky9U+tZUrnFvf
	yNHcYCj8oz1c7awCwVZ+L3V4VTr/iSimJs8djDEgPCwVhol41nQYVwtahrVMKArxbT69jBEC07MZ5
	zvUxpal0m3WlIYPD19e4VvoPEhDwhN0oK0WrQhgjGJq9l+LOwxSPweKRfPOCqURVhPSpy5bQdts0a
	nNHHiIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6ng-0000000D8PN-3MVY;
	Sun, 27 Jul 2025 19:12:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6l9-0000000D8GQ-2NYa;
	Sun, 27 Jul 2025 19:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=G6fAFR76cmo7RpsyFJQzRERhtJ7iBzJqeyQVBeXy91o=; b=hLV+glJqUEzoc844ck/FZXvYMD
	PhOs8Bnrf0ylD+a/wULEdJfDI4lHzXVYin5qpBLjnGkk9Hl3bvNuxqyvoLW0rSAaLya6SMpdMsKkA
	jNOg2JPnsZduh2Eyq4ZiHIwdt+JST/R54FqdZGk2Zn36lUbfT74AESIwlm8Bg63jRmyk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ug6ku-0031NN-T5; Sun, 27 Jul 2025 21:09:56 +0200
Date: Sun, 27 Jul 2025 21:09:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: dsa: realtek: Add support for use of
 an optional mdio node
Message-ID: <2504b605-24e7-4573-bec0-78f55688a482@lunn.ch>
References: <20250727180305.381483-1-jonas@kwiboo.se>
 <20250727180305.381483-3-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250727180305.381483-3-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_121011_612083_CB54500A 
X-CRM114-Status: GOOD (  12.17  )
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

On Sun, Jul 27, 2025 at 06:02:59PM +0000, Jonas Karlman wrote:
> The dt-bindings schema for Realtek switches for unmanaged switches
> contains a restriction on use of a mdio child OF node for MDIO-connected
> switches, i.e.:
> 
>   if:
>     required:
>       - reg
>   then:
>     not:
>       required:
>         - mdio
>     properties:
>       mdio: false
> 
> However, the driver currently requires the existence of a mdio child OF
> node to successfully probe and properly function.
> 
> Relax the requirement of a mdio child OF node and assign the dsa_switch
> user_mii_bus to allow a MDIO-connected switch to probe and function
> when a mdio child OF node is missing.
 
I could be getting this wrong.... Maybe Linus knows more.

It could be the switch does not have its own separate MDIO bus just
for its internal PHYs. They just appear on the parent mdio bus. So
you represent this with:

&mdio0 {
	reset-delay-us = <25000>;
	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
	reset-post-delay-us = <100000>;

	phy0: ethernet-phy@0 {
		reg = <0>;
	};

	phy1: ethernet-phy@1 {
		reg = <0>;
	};


        ethernet-switch@1d {
               compatible = "realtek,rtl8365mb";
               reg = <0x1d>;
               pinctrl-names = "default";
               pinctrl-0 = <&rtl8367rb_eint>;

               ethernet-ports {
                       #address-cells = <1>;
                       #size-cells = <0>;

                       ethernet-port@0 {
                               reg = <0>;
                               label = "wan";
			       phy-handle = <phy0>;
                       };

                       ethernet-port@1 {
                               reg = <1>;
                               label = "lan1";
			       phy-handle = <phy1>;
                       };

If this is correct, you should not need any driver or DT binding
changes.

	Andrew

