Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6E0C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vEmeHSRktXz2Zp/AeoCrE6FXGB8T1j415lF9mBeix4=; b=zlMf+C9BQrg2KMB2ghfDFtpN2P
	uusNSUeJD94kgN+9GRnNhPKp0lcincOynKvfK16fJnebgzandVY2acrHjrNEILExUEftAv5HXcbPu
	8mDyjOqUV3rw2oVq24a5YPvRNg5VGmKgxDme0O7YkJbGYJPYPo93RdR/l3Aq0wlLu4sX6Hf4osGkm
	IIt4blwe+I6gUTaaiigSi5qmP5ygqJAcMpEQxUs9yk+oiozH7kluLvTneWoSFpfQQfHMLn1bl+M1/
	qloflUWwywI4p7LzeVJ+lcGHSuWSlGAGHMpDJZDKmAJunzBL3JKNQGeFbn4ipjxjGQWNvsRVW3UxI
	yC8PWfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZzZ-0000000DiS8-2CQ5;
	Thu, 10 Sep 2026 08:18:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZzX-0000000DiRm-3FhR;
	Thu, 10 Sep 2026 08:18:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 945BD600C8;
	Thu, 10 Sep 2026 08:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2524E1F000FF;
	Thu, 10 Sep 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028322;
	bh=1vEmeHSRktXz2Zp/AeoCrE6FXGB8T1j415lF9mBeix4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nkgi9nSFRykN5Hn1sYrVe9y3lR7ExxJbTpq3t2nQ9ec6R2tYRySjBovEO3b28PfnG
	 H0oCKcc2DMC0RLq8+jVHIveIbeBwKrSbnS9kwBJ7Wa9GOeRsKMrtQffU6Emw7TfOCo
	 dWndxq15GSZ6ThhrHjFKaMJAoTSfJl9/AG8EriA2OvERbHnxjSjf+BL/6mpzvKyEVj
	 mkE+Vie10j2xqggaFNOLATBRiMcNkhnNv94uHhOCmD0YTgIwxtNat5frK4CSlHLaTU
	 7aeRRxtmDMSOI6Vx1LN8DdVFlxKlc1czCH52+6TFgbsfGWMqY57GeoNctxE7W4YfRN
	 zafzM/on/gExQ==
Date: Thu, 10 Sep 2026 10:18:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 04/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
Message-ID: <20260910-esoteric-axolotl-of-symmetry-c02f5f@quoll>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132716eucas1p2d093509db255e62e6bd546e734f04e63@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
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

On Fri, Sep 04, 2026 at 03:27:05PM +0200, Michal Wilczynski wrote:
> The video output subsystem has its own system controller, documented as
> dom_vout_syscon. Among other things it holds the mux that selects which
> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
> to reach it.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> index 0039319e91fe6e6aadc4300114626348e4dfb7ce..47334f6c1243c9950e6fba44daacd41f42b55781 100644
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -24,6 +24,7 @@ properties:
>            - enum:
>                - starfive,jh7110-aon-syscon
>                - starfive,jh7110-stg-syscon
> +              - starfive,jh7110-vout-syscon
>            - const: syscon
>  
>    reg:
> @@ -90,4 +91,9 @@ examples:
>          #power-domain-cells = <1>;
>      };
>  
> +    syscon@295b0000 {

Don't need new example for every compatible. You already have three...
and this one is exactly the same as the first one. Drop.

Best regards,
Krzysztof


