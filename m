Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE1BC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4A0gOkh6EF1txaH+mrpoRBF09xGj7itWV4BlukJjIMo=; b=AcjRyiSeHSzF123h3IgJaIveGU
	veazCFbgZdYI/18iOg+f8+n8PlSmFXTVfspv1XQtP7d69mSq8Ic6hzYwO7Nb4/K6mqoaX8nWSh6JU
	U+L+qysNh7SueaGw1uEUtxbkS3FCrevQFfbQIHhBRFctgyUGFwiE1OeR7wuEj2/Ku0fHH++f5mAIk
	d335Y3mFT/YqpSWtkTThgQQF0B1/MWXfP4Be2KGgnPm2oXDkoiBe4JedBS0527VnJteDTJfCx9bN9
	1wqyGXRRfPqmdBQ+tN9feA2F5wV0+Lt8rQQPgVKG4Hub9rhPxx4rbtbRtFlouRj9w8Zoxpq0VmSel
	uDegmzRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJkf-0000000GP6t-1Qn4;
	Wed, 14 May 2025 21:34:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJic-0000000GOkJ-2aFl;
	Wed, 14 May 2025 21:32:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B13925C5463;
	Wed, 14 May 2025 21:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3D3C4CEE3;
	Wed, 14 May 2025 21:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747258369;
	bh=mXXP6jPmHjrLDq0YvJKfrILeEi0rih83V0iyKJkz37w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eklo3P8gO3ZA/poAviqKg20Jo5FLMmxCWg/QyoBrT+JcE0uc8kxa0Ps8m0ovUG5aA
	 mcUIBXxORo606F5yOGujkrHa4+2JIZgrWNg/+hhiwxwP2p+quNVO3OnVswmgVoHAp5
	 1oOA1qsA3OfZWdpYGsi7PvNzFr6zJS2StHzUOvo/kybJAyO/8FhHEsoxbAJS7qOqik
	 gZ1gVA7xuk/FEADQvzcwXntGdrNwBQvIBr1oXKDJn+xFcwboM8C7GPrT9GQY7+ZztA
	 BcDCJ/l//GCCv6TV+MfNAhAejNGGt5Z+pY1VyYX9UxRBXpOwz+b1zHMJitu8Ppdiew
	 l8FMVbVx/p6Wg==
Date: Wed, 14 May 2025 16:32:47 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [net-next PATCH v4 07/11] dt-bindings: net: ethernet-controller:
 permit to define multiple PCS
Message-ID: <20250514213247.GA3053278-robh@kernel.org>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-8-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511201250.3789083-8-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_143250_700122_4149A820 
X-CRM114-Status: GOOD (  16.43  )
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

On Sun, May 11, 2025 at 10:12:33PM +0200, Christian Marangi wrote:
> Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
> can be defined for an ethrnet-controller node to support various PHY

typo

> interface mode type.
> 
> It's very common for SoCs to have a 2 or more dedicated PCS for Base-X
> (for example SGMII, 1000base-x, 2500base-x, ...) and Base-R (for example
> USXGMII,10base-r, ...) with the MAC selecting one of the other based on
> the attached PHY.

I'm confused what you need. The restriction was no arg cells allowed. 
Any number of phandles was allowed. The former would need a 
"#pcs-handle-cells" type property.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 7cbf11bbe99c..60605b34d242 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -84,8 +84,6 @@ properties:
>  
>    pcs-handle:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      maxItems: 1
>      description:
>        Specifies a reference to a node representing a PCS PHY device on a MDIO
>        bus to link with an external PHY (phy-handle) if exists.
> -- 
> 2.48.1
> 

