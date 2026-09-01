Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545E5C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8mQrubMfq7apt28Lc/aGd7gh6BelReRAK6wSkmkAv8=; b=xJwXi+hmlSWRS0VhZ1CH3beRvS
	AVBWVC6dMIMZTxnf3tOEYXBykL6MP5/d9xJr7fB6N7lU1mIT97UM7Yy4ezzL8wDR0H+x0Ir7NKFS6
	8vAXrRIBsr3qIT2YTvj8AS+jQGPu8rIYdGjRBsPbTZ2fCKXXaJt0hfFmEKdM4sr9VdFIDl5h2MSMx
	uuJXjBDnZhem69ikOw8BnXaNWuqSBNDSdonNJsFixpHK83jJDbZFcgkww8pIw55iioXYnEJ+8L7ld
	USI1k4QoOVyydeb2ayLjTnc4w+1F4nuIgDcJLuVVB6b8DMTlVPye/y24VOfEInQQMBSvGkn1B6rWr
	DwBx/K6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P3Z-0000000CGj0-3SW9;
	Tue, 01 Sep 2026 14:01:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1P3Y-0000000CGis-2TiI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:01:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D238860214;
	Tue,  1 Sep 2026 14:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1691F000E9;
	Tue,  1 Sep 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788271303;
	bh=o8mQrubMfq7apt28Lc/aGd7gh6BelReRAK6wSkmkAv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dix8H7HjnBFsKReQ8DjEp08GQWI1dGAyzfxLCH6+abKlsKrCy6Q9Vlp0TK009PJLH
	 8nkJkofi6GEThp0RoASMBkbDcxZgX4VmLMKeYlHiFpM9PfWRoKSAHpkeHBDmQdRWcy
	 XunjS0HvdD1yTD/BlTZ5wrQLKnplwFxE052ep6It4fWMdIp/qt0K/O6jr2fNrA9GGf
	 Wq4plO0eZXrU4fo1iJzfvJmzwjdiQgrJU+4YoSc/elM1NLol7yXMPbYFecq0hRAJO3
	 y29+oH6rkbkAPp/wKvIkGqBHuCvFcGQte4GCpOQvmhpDSeCSS7FZMUK+Uv2ZE+aaNp
	 I3gjnZ2moqV+A==
Date: Tue, 1 Sep 2026 09:01:42 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linusw@kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next,PATCH v2 1/5] dt-bindings: net: add phy-supply
 property for stm32
Message-ID: <20260901140142.GB1244140-robh@kernel.org>
References: <20260812091122.566439-1-christophe.roullier@foss.st.com>
 <20260812091122.566439-2-christophe.roullier@foss.st.com>
 <20260812195828.GA724768-robh@kernel.org>
 <3326ff38-75c3-4218-b537-17077f3faa4e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3326ff38-75c3-4218-b537-17077f3faa4e@foss.st.com>
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

On Tue, Sep 01, 2026 at 09:33:33AM +0200, Christophe ROULLIER wrote:
> 
> Le 12/08/2026 à 21:58, Rob Herring a écrit :
> > On Wed, Aug 12, 2026 at 11:11:18AM +0200, Christophe Roullier wrote:
> > > Phandle to a regulator that provides power to the PHY. This
> > > regulator will be managed during the PHY power on/off sequence.
> > > 
> > > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > > ---
> > >   Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > index 987254900d0da..0c7eb1ccadd47 100644
> > > --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > @@ -99,6 +99,9 @@ properties:
> > >         encompases the glue register, the offset of the control register and
> > >         the mask to set bitfield in control register
> > > +  phy-supply:
> > > +    description: PHY regulator
> > Which phy? There can be multiple for ethernet. In any case, doesn't
> > really matter because either is wrong. The supply(ies) for a device go
> > in that device's DT node. This node is not a PHY.
> > 
> > Rob
> 
> Hi Rob,
> 
> Ok I will update my description with :   "Regulator that powers the Ethernet
> PHY."
> 
> To manage this regulator on Ethernet glue, I based my work on the examples
> of :
> 
>   - allwinner,sun4i,
> 
>   - allwinner,sun7i
> 
>   - allwinner,sun8i
> 
>   - fsl,fec
> 
>   - rockchip-dwmac
> 
>   - rockchip,emac

There are plenty of examples of how not to model things in the tree.

> 
> For me it is normal that PHY Ethernet regulator is managed by MAC glue
> because it is mandatory to power ON Ethernet PHY chip BEFORE MDIO scan.

What happens when you have a PHY with a supply, clock, and reset that 
all need handling and those all need to be handled in a specific order 
and timing? And then you have 10 different boards with different PHYs 
and different power on requirements? You are not going to handle that in 
the MAC driver. We've fallen into the trap of "I just need this one 
property" many times. It doesn't scale.

The MDIO subsystem has provisions for handling power on of devices 
before discovery. I know it will generically enable a clock. Maybe a 
single regulator is handled too, I don't recall. If the PHY gets more 
complicated, then you need a specific PHY driver to handle it.

Rob

