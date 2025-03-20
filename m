Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711F7C36001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcSKEWRQis2X2p4aHN9kdg4dWvAn4zZB4MthGt9aAs0=; b=2RMG9tVaL5KP8qy9jJmYIiOsXR
	h+Hzb5DsfrqlOq0L54trwIsJ6X6+V3U6aSs6wP0a7BcOgVpyU0TtNmDd/4ph6+lAjQOFWiwIeSHUb
	arInxxHwCBdnM1pKLRAHxwYw8qVdsWMIwoofeZu+X5/25AbBAmt6zAwmnj+3MzA8Ubx40TE1rSc7w
	OLmTN8/uNi5Gky/qOykYpQtqPCe3gatzaKyAiQI8W39e1X15joG/Ls7jIwHj61SuzkLH+oTU+16z0
	hh60/EEZvQIiDfLo8HN0XU7qreZZckGm1j59VFZkZfpStfV8mG107IIhwCJNNKcAg/dxpKZRD7Uzx
	s+c/rUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJm7-0000000Cp0F-0XMt;
	Thu, 20 Mar 2025 17:33:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJkP-0000000Cocu-3yRc;
	Thu, 20 Mar 2025 17:32:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7507C61145;
	Thu, 20 Mar 2025 17:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CE7C4CEE7;
	Thu, 20 Mar 2025 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742491920;
	bh=3HOTPhubQPxetyMqoktnFvF63Tzt8GgfFAKqGmDS3xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L60tobDYIbX0us2wQjzggEFQMCohxpSUt5d48FIZ6+R4ieavMitBq05mXTA4yrtvC
	 DKO7zbZc+tNrMOAU6seLeunDoYbbJWRW7ThKQMWnvfpFLtnrilpL1VKz290J5GJLOB
	 WHO6Y/EDPfX0Axxf8x4ljDRo+2Oa2DD6GrLL9JDK/ps4YnFsZcne1EMPpuiQRjSmwl
	 am/zcQZyNiDoO1EuYKuXNHfmaVVEhyvzm2VjiRAEkD8X5ee2YKN/k3R/nXARfi2sJa
	 ekEBzjTVTt64hgJEy+pFYujcywwSTHdX1SKfygy7KhAczBGGBdtr98QU6JtANpdBBN
	 6q9VN2uvlWBEg==
Date: Thu, 20 Mar 2025 17:31:54 +0000
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 02/13] dt-bindings: net: Document support
 for Airoha AN8855 Switch Virtual MDIO
Message-ID: <20250320173154.GE892515@horms.kernel.org>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-3-ansuelsmth@gmail.com>
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

On Sun, Mar 09, 2025 at 06:26:47PM +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed

nit: passthrough

> as AN8855 require special handling as the same address on the MDIO bus is
> shared for both Switch and PHY and special handling for the page
> configuration is needed to switch accessing to Switch address space
> or PHY.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/net/airoha,an8855-mdio.yaml      | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> new file mode 100644
> index 000000000000..3078277bf478
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN8855 MDIO Passtrough

Ditto.

> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855

Ditto.

> +  require special handling as the same address on the MDIO bus is
> +  shared for both Switch and PHY and special handling for the page
> +  configuration is needed to switch accessing to Switch address space
> +  or PHY.

...

