Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D93606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xdamVKwf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RptAFMBC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySWsHfGDAlrCmx3rkvXDuoQmW74X/X5yZy4N3Gn3SOE=; b=xdamVKwfVCzXrLJZ3C3QWUezLd
	fczisupJ0/QU8WwceWKGjYx610FQCny2A9vhjFC5em+zvI7Ty7UrHBAIywxrvORy5F4FhnzMpSD9N
	xq8LGDkHgJnWfsJEgVk9hqBCn7ZEp2vBAveHSJiMF/WPCxEw7T/hFi53q+uz5TZUhQr7guW86h+S4
	E3lNJZ3CWmiXeTvGqL3nitenvbl4MwR/N0S+MhR0HUkRvEcKKJPkhtIjF8LPVpp0Y31n3g3Pw5uc5
	wDtkTILps5CQxUQQrFBtjBIVwyZoWFlFCEoF1llNoPWWcH/5t3Use840bqHuznkLQ/3PjrtNMfGmk
	GoIMcvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWOL-0000000BuV9-0A61;
	Wed, 21 Oct 2026 13:30:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWOK-0000000BuUf-0ESN;
	Wed, 21 Oct 2026 13:30:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B20394168A;
	Wed, 21 Oct 2026 13:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697541F000C7;
	Wed, 21 Oct 2026 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589403;
	bh=ySWsHfGDAlrCmx3rkvXDuoQmW74X/X5yZy4N3Gn3SOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RptAFMBC1SSHfKut0L7FDCS+W1mdN4cxnSkqr6PuexCz0K06EJRXFfyL1EYVGw07i
	 /BH23RbF1El/pqqMrkfNvCpe0JzrqjDWgjuk0+gdUxq5aUY9B5Wwu19cHRJKUqg444
	 cOh5bKXEEkpMJYGXv/YkzN/9e+KAjyMXgqD5yD8j3fAX6Og+zSxZTj+pIGr6b+2Pa7
	 kvdG+La3wZiEvPADEB80HOSKADK41pGvzxOWAKkeN3qY/7fGiPCbaUs3SebjAXN2cI
	 ONgPPFcoL4hSZWMTzva72yn8Vo2dzRo+2FBCaG6B3irXCydmkNkw/mP1FdEPZZyviS
	 zJlm/X17a+HeA==
Date: Wed, 21 Oct 2026 08:30:02 -0500
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
Subject: Re: [PATCH v3 1/6] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3568
Message-ID: <20261021133002.GA3886567-robh@kernel.org>
References: <20261020030916.3223833-1-damon.ding@rock-chips.com>
 <20261020030916.3223833-2-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020030916.3223833-2-damon.ding@rock-chips.com>
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

On Tue, Oct 20, 2026 at 11:09:11AM +0800, Damon Ding wrote:
> Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
> the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
> resets, but unlike them it does not use GRF registers, so make the
> "rockchip,grf" property conditional on the SoC.
> 
> Also document the optional avdd-0v9 and avdd-1v8 supplies, which are
> needed by the RK3568 eDP controller.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../rockchip/rockchip,analogix-dp.yaml        | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> index 39dafe75a680..f8670a4e0430 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogix-dp.yaml
> @@ -15,6 +15,7 @@ properties:
>      enum:
>        - rockchip,rk3288-dp
>        - rockchip,rk3399-edp
> +      - rockchip,rk3568-edp
>        - rockchip,rk3576-edp
>        - rockchip,rk3588-edp
>  
> @@ -47,6 +48,16 @@ properties:
>        - const: dp
>        - const: apb
>  
> +  avdd-0v9-supply:
> +    description:
> +      A 0.9V supply that powers up the SoC internal circuitry. The actual
> +      supply source varies between different boards.
> +
> +  avdd-1v8-supply:
> +    description:
> +      A 1.8V supply that powers up the SoC internal circuitry. The actual
> +      supply source varies between different boards.
> +

Are these valid for other compatibles?

Rob

