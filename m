Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA558D216A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0qk9pAjbjF8O1bYDix0TLSc5Ky01P2ZB8N5Zfq3Nao=; b=04mBXA15GEmHPz/P458X0Vd+XO
	/HLqM1NNtY+spccgHDche6MUNYBKd1IB9LnYRiGkqcFLoCPLWt2B2qcvS3MnHrvrytkbPyAtdduHU
	e7oFJZ1kekRy06+8i1aafUzOVRui9ZXGlriKvpVZboSJ8ODOhDm7P+nEAkSWTAU/AMdTWHDz6O02s
	8dtm7nTRjhn043nECHbc/zRIIUkvLLK32aCdiwuQxGLENnFLsjIPxApS13VH/8XpYL2CRVV9YKUGi
	Mj+ONjgJILp5+slxmrn0smnEFy9Crw9aqKXi4riFJY3P5Iu1Me3x0Zb5XzbJI/+5Mr5xdE8jUwUZb
	UH1lGhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBd4-00000008EWQ-0W9g;
	Thu, 04 Dec 2025 15:52:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBd2-00000008EWD-1LpB;
	Thu, 04 Dec 2025 15:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6235E60200;
	Thu,  4 Dec 2025 15:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CC3C116B1;
	Thu,  4 Dec 2025 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764863543;
	bh=gx0KCllM9ErS+DGIJRYM6/W4bjQJj3kqWBhKLjr1UiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg0bWHfT+vnpAFNxfwug+IPFq3ujzrQQrYpfkTaS3FonIi5FMu78d2lTK/UKD7QcW
	 ToRRj1eimPm5gCrHIg/crnJnFJLSoxWi+xFof3gDd61UALe+SdpaSva/wmsNHuj2NA
	 gogMqrb90UOV1WVz0UgkFd5GK7LTBlRbdm7dF97mJzTAPKmPbWwBOVBNWO2GLSYMe5
	 4Hv/UoAoNt2IP55W5uSQWQz1w71o6R+YsYvhDkGcQTG3Z2v0/KHQxxM2IHDOgOXFRt
	 cHNVS9DrtbBXmR03dXTIoab+ImcJIpyzNDIcMh5ak72Ce6BswZgf0FjAK1aZZSCsPK
	 5Ynr68VeIVy+A==
Date: Thu, 4 Dec 2025 09:52:19 -0600
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH net-next 2/9] dt-bindings: phy-common-props: create a
 reusable "protocol-names" definition
Message-ID: <20251204155219.GA1533839-robh@kernel.org>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-3-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251122193341.332324-3-vladimir.oltean@nxp.com>
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

On Sat, Nov 22, 2025 at 09:33:34PM +0200, Vladimir Oltean wrote:
> Other properties also need to be defined per protocol than just
> tx-p2p-microvolt-names. Create a common definition to avoid copying a 55
> line property.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  .../bindings/phy/phy-common-props.yaml        | 34 +++++++++++--------
>  1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-common-props.yaml b/Documentation/devicetree/bindings/phy/phy-common-props.yaml
> index 255205ac09cd..775f4dfe3cc3 100644
> --- a/Documentation/devicetree/bindings/phy/phy-common-props.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-common-props.yaml
> @@ -13,22 +13,12 @@ description:
>  maintainers:
>    - Marek Behún <kabel@kernel.org>
>  
> -properties:
> -  tx-p2p-microvolt:
> +$defs:
> +  protocol-names:
>      description:
> -      Transmit amplitude voltages in microvolts, peak-to-peak. If this property
> -      contains multiple values for various PHY modes, the
> -      'tx-p2p-microvolt-names' property must be provided and contain
> -      corresponding mode names.
> -
> -  tx-p2p-microvolt-names:
> -    description: |
> -      Names of the modes corresponding to voltages in the 'tx-p2p-microvolt'
> -      property. Required only if multiple voltages are provided.
> -
> -      If a value of 'default' is provided, the system should use it for any PHY
> -      mode that is otherwise not defined here. If 'default' is not provided, the
> -      system should use manufacturer default value.
> +      Names of the PHY modes. If a value of 'default' is provided, the system
> +      should use it for any PHY mode that is otherwise not defined here. If
> +      'default' is not provided, the system should use manufacturer default value.
>      minItems: 1
>      maxItems: 16
>      items:
> @@ -89,6 +79,20 @@ properties:
>          - mipi-dphy-univ
>          - mipi-dphy-v2.5-univ
>  
> +properties:
> +  tx-p2p-microvolt:
> +    description:
> +      Transmit amplitude voltages in microvolts, peak-to-peak. If this property
> +      contains multiple values for various PHY modes, the
> +      'tx-p2p-microvolt-names' property must be provided and contain
> +      corresponding mode names.
> +
> +  tx-p2p-microvolt-names:
> +    description:
> +      Names of the modes corresponding to voltages in the 'tx-p2p-microvolt'
> +      property. Required only if multiple voltages are provided.
> +    $ref: "#/$defs/protocol-names"

The default for .*-names is the entries don't have to be unique. That's 
for the exception, but unfortunately everyone else has to define the 
type (type.yaml#/definitons/string).

Each user needs to define the names of the entries which will enforce 
the length. So defining the length 1-16 here doesn't do much. So I think 
you can drop that and then the $defs is not needed either.

Rob

