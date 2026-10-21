Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yyjLPJYL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vl6o6SXK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF6DsPZwEfTAUnK9ZZCxg7q+OblzpYg/pKGicRqUkBU=; b=yyjLPJYLzibww3OX3bOvw+wYnE
	V/WkLzrJzM+vDjusTlor/SP1F9uerYsU5IW44ahP2tUSzenWTW2PEXCEw0tv2QqzI5GXPR/e92TRY
	X+Dgq602I6uyhrMPD/0eVsQk0L7UtOzDe4h5nSfYGCjfTZP0ywgcjJ0KmnDXcU9McX0bPocRb9Pka
	2wZvc9q91B3cA3GPa63lCzy3h2lOD7fsrmXurLfvOPALNxRFTrLC40kiOfmh7NjYymrOtr+eqx0SE
	jdTwP2XARTfkRknIz2uWFuXrS66oBSSyIthH9uXHtyhmg+iYb79tn6orqwsCYx3hcluOqS5DSAKgm
	edV2+4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWST-0000000Bv0f-3I38;
	Wed, 21 Oct 2026 13:34:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWSR-0000000Buzq-3xxo;
	Wed, 21 Oct 2026 13:34:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6428441B05;
	Wed, 21 Oct 2026 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FEC1F000C4;
	Wed, 21 Oct 2026 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589659;
	bh=sF6DsPZwEfTAUnK9ZZCxg7q+OblzpYg/pKGicRqUkBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vl6o6SXKiIbV/CqnvA/a2XkS0NAjGDw0y/kcFsI8P5diKF2Zu43NtD3WXZpTBhWaK
	 5zGVHdyOxCOJavy+OKH8wXUGUD7Cb61xGY8DKTeeCvc1wFVxDy19Q5fIgGE6+LsE7S
	 jl+zIbXJ2RXCSZPNwUWyA9c2ELG2zxlgs4A6/XgQLdI/SzDNcPErduA1MehK+PDpSd
	 DiL5j8EiVNDAGYYjg9ItFAHP+y5Zvd42w+lNtrNajzkmiQVXXqw2Lx4C8S8PvAXZ7T
	 Dg1Qv8Q5jnF9/4WjfmJxfBdxBiHw+8A5zNnsrH+emuE73UhGLZzOG7zUOBfVQdgdHk
	 2AEydevOYwHuA==
Date: Wed, 21 Oct 2026 08:34:18 -0500
From: Rob Herring <robh@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dave Jones <s.dave.jones@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/6] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Message-ID: <20261021133418.GA3889663-robh@kernel.org>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-3-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020030916.3223833-3-damon.ding@rock-chips.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:09:12AM +0800, Damon Ding wrote:
> Document the eDP transmitter PHY with NaNeng IP block found on the
> RK3568 SoC.  The PHY is controlled through the eDP PHY GRF registers,
> so its node is modeled as a child of the eDP PHY GRF syscon.  Also
> add the "rockchip,rk3568-edp-phy-grf" compatible and the "edp-phy"
> child node reference to the Rockchip GRF schema.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../bindings/phy/rockchip,rk3568-edp-phy.yaml | 59 +++++++++++++++++++
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 15 +++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> new file mode 100644
> index 000000000000..afe7bc3d839e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/rockchip,rk3568-edp-phy.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/rockchip,rk3568-edp-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip eDP Transmitter PHY with NaNeng IP block
> +
> +maintainers:
> +  - Damon Ding <damon.ding@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  On the RK3568 SoC the eDP PHY is controlled through the eDP PHY GRF
> +  registers, therefore the PHY node is expected to be a child of the
> +  eDP PHY GRF syscon node.

From the driver, looks like there is a specific register range for the 
phy regs in the GRF, so please add a 'reg' entry (and 'ranges' in the 
parent).

Rob

