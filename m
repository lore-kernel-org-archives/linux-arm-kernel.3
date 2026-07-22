Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B8C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yr/OrBC+qRuEY7Yqo7iUWp5/J7OekvuX5jORhC8HqGk=; b=V1L08Lmccb/XFgIrlEqcXXRdfH
	fcxqJhX+swByR4mCow2mekhwyeHwEH2GObtfwKQstXy4+g7HI1j0VseTQGqhMaTV72T49GDtfR0Pq
	jnMrtgjzPKB8jLjfVTJYcqNJWWsMJWGTGv6cQRhIg7QKaVvp6yqUDh+UzqRs1PtBFmsdiew3XlMFX
	2otUvIIBL8LW/+matyQpH0f/prPMu31o8ThodHPw7lXdAgVsZhp26tku16NdSHctforioZez7id6h
	luQB7iXxVswlWr+aaf8YBYA5Bg1xRkWtEbzPchMXvhdO+hesn9K0BaQjtpP9occarY7eZuDiWLlUv
	irfipQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRHN-0000000B3b3-3A6w;
	Wed, 22 Jul 2026 07:22:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRHL-0000000B3ar-47zH;
	Wed, 22 Jul 2026 07:22:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26F1D60A67;
	Wed, 22 Jul 2026 07:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18DA21F000E9;
	Wed, 22 Jul 2026 07:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784704926;
	bh=yr/OrBC+qRuEY7Yqo7iUWp5/J7OekvuX5jORhC8HqGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EypVTYXuhH1X+r3duiINXfNRT1lSn8Jg5CsmTAswYqKaOLuxHa3MqNG5z1buQiASQ
	 9B9DJp/OnSHch96/gNZEAD8KfPYfcIvTH/qvVe2JNaPFgVt3K7qPT3lyT7o/MobhoO
	 Vj16I+a9TIOAh85/TyNk7kL1xyfnCCK9KuhDIr1hE6iBK2/5P4mbzICLgCShu4KQiA
	 /QHgNBd6PNMNm9mSa7LjDJB32g9stv92ExHVmpdAg8KBMlrKdJX6cmNCil23SLMSRv
	 0E22QcvyT4orDsM/ux7G4rujnYD9HgGqpXCNnN6y5svkQb92Ebirf9qbr/rGLVJMbg
	 CtvuyfaxKFVoQ==
Date: Wed, 22 Jul 2026 09:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@flipper.net>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 09/10] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Message-ID: <20260722-enchanted-mandrill-of-refinement-adc7b3@quoll>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-9-f0f4a4ede712@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-9-f0f4a4ede712@collabora.com>
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

On Tue, Jul 21, 2026 at 07:52:39PM +0200, Sebastian Reichel wrote:
> The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
> possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
> to select the right interface.
> 
> In addition to that the RK3576 has the same IP as RK3588, but configured
> with Multi Stream Transport (MST) enabled for up to 3 displays and thus
> has a total of 6 DAI interfaces (I2S and S/PDIF for each possible
> stream). Meanwhile the RK3588 does not support MST and thus has only 2
> DAI interfaces.
> 
> The binding update from this patch has only been tested with the simple
> single stream transport (SST) setup as the Linux driver does not yet
> support MST.
> 
> For MST it is unclear what a good binding should look like. Technically
> there are a couple of options:
> 
> 1. Stay with the single cell, but add more numbers. I.e.
>    0 = I2S on stream 0,
>    1 = S/PDIF on stream 0
>    2 = I2S on stream 1,
>    3 = S/PDIF on stream 1
>    4 = I2S on stream 2,
>    5 = S/PDIF on stream 2

This looks simpler and anyway the numbers are abstract, so they do not
need to match "stream X".

> 
> 2. Add yet another cell, so that there is one argument for the stream ID
>    and one argument to select between S/PDIF and I2S. I.e.
>    0 0 = I2S on stream 0
>    0 1 = S/PDIF on stream 0
>    1 0 = I2S on stream 1
>    1 1 = S/PDIF on stream 1
>    2 0 = I2S on stream 2
>    2 1 = S/PDIF on stream 2
> 
> 3. Create one subnode for each stream in the DP controller with its
>    own graph for the video streams. This would mean the MST binding
>    is quite different from the SST one.
> 
> As it is unclear which way is the most sensible at this point in time,
> just go with the most simple option for now and revisit this once MST
> is added.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml     | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> index 2b0d9e23e943..c4f8959dd65d 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> @@ -25,7 +25,7 @@ description: |
>    * Supports up to 8/10 bits per color component
>    * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
>    * Pixel clock up to 594MHz
> -  * I2S, SPDIF audio interface
> +  * I2S, S/PDIF audio interface
>  
>  properties:
>    compatible:
> @@ -46,7 +46,7 @@ properties:
>        - description: DisplayPort AUX clock
>        - description: HDCP clock
>        - description: I2S interface clock
> -      - description: SPDIF interfce clock
> +      - description: S/PDIF interfce clock
>  
>    clock-names:
>      minItems: 3
> @@ -83,7 +83,8 @@ properties:
>      maxItems: 1
>  
>    "#sound-dai-cells":
> -    const: 0
> +    const: 1
> +    description: 0 for I2S, 1 for S/PDIF

This is ABI change, which might be backwards compatible or not, but
commit msg should explain that. I can easily imagine drivers where
written that way that they will fail with an old DTB.

Best regards,
Krzysztof


