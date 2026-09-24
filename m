Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D2BC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVPtgm7IGqpAuXlkLAQsbQji9h6wA6eT15yAS4IHfrQ=; b=JmNyhTag7STvETW+iuCv71IDWe
	ny6GSifOOgWi8WZcXv5mrdz13K1JweSM2Pfp03CS1uaNFJfGUoAi6UGVJVjNzNXb4YsJCIsWpf+rD
	sxp6Cm2m5ddfj6YBvdX7u7FeVxBDIxLbB1iF1/2QD1mFIl1yNRslW/TNtxlfuSjHnGRuKh/ZDP1To
	xUgFt4pD2Cx2UywUDKrN5AMQLbuJzxgPZG5r1Ks2cOcmtGnHYQ1szKfzzWt57KZiEozsdRLVXMhQ4
	lvqPzpdPw2JgIhJLdPJwJysOQ+U15R9f9WbDlJSwxbkzpt7q2eCQ86RZ0q/X5Dw4Ff4AjxczsZ30x
	DSfj4Jyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rl3-0000000CGvT-37iv;
	Thu, 24 Sep 2026 22:17:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rl2-0000000CGvI-2mwH;
	Thu, 24 Sep 2026 22:17:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D9C4029B;
	Thu, 24 Sep 2026 22:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392D01F000FF;
	Thu, 24 Sep 2026 22:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790288255;
	bh=eVPtgm7IGqpAuXlkLAQsbQji9h6wA6eT15yAS4IHfrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nvWc07eO0bnDGeGZuw1bOITomT3EOv21j81RnAlImoKv1ug63di5lZfpkNK7baFW7
	 TxMVegoRlSRKU5sLlligGO7Hk55Wh/WleaTQEcRWjMocToLarz/2UuPNDRy0Uo6PSB
	 GsSiSJHtgDiJUzu4PvCeYy64ijF4WABznalX4Js1I/cLPe6UnPXGKQV5ufnJuMAls0
	 qx0s0/T/59FVL0yPQV0koqByPK0WA2leP56KM31nRKjZW82IwJonsf9MhVcFCh8YuC
	 bMBjrIlFkrHHpb1sUKRgWURATNK0pjog/kDOTwNUAIjnYYys/mia+C0olaWb5YZe3J
	 Vknl2iwJS6O2Q==
Date: Thu, 24 Sep 2026 17:17:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>,
	linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
	netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Simon Horman <horms@kernel.org>, llvm@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH net-next v16 10/12] dt-bindings: net: pcs: Document
 support for Airoha Ethernet PCS
Message-ID: <179028825241.2006083.15037022287865565001.robh@kernel.org>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916235200.20712-11-ansuelsmth@gmail.com>
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


On Thu, 17 Sep 2026 01:51:36 +0200, Christian Marangi wrote:
> Document support for Airoha Ethernet PCS for AN7581 SoC.
> 
> Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
> the various Serdes port supporting different Media Independent Interface
> (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
> 
> This follow the new PCS provider with the use of #pcs-cells property.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/pcs/airoha,pcs.yaml          | 261 ++++++++++++++++++
>  1 file changed, 261 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


