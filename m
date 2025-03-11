Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E663CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7XOVAe7Thg2IYjPG4f/hG6HMBZoufgdVEu+gwRh4TA=; b=yT8ABLKeFtByFisud59gp4HjrV
	90FpKGNYRg+l5JS2ch2VdIW0RQ1FiCNxjsJOg/RXmr4HHEQTRi3geLUtIWcfxLXY4KvJd8cJXWJkJ
	Ews7AdLfli5j2U79aVbHtjgPUC1bhdI67YmO+vvqr6IL9Vq6ZoUix7qCKo3qxspZkBbcZlEWDYzeb
	9qoOnhdPGIsLfFff0Wsk0DH5IBhXIT8nm8kPSQ8YyEzROzKE+2T7pwRie8ay8oyixhM5pzJCawAkz
	ydybqzcRO+OKXbyxqT4I/tifX+j84W0oTbvk2mMSsm6LNM7dFDv0y0xXl0+BjMBLP6E0KWuxRoQKT
	qLQGS5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4YL-00000006f4e-0U21;
	Tue, 11 Mar 2025 18:42:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Fv-00000006bzl-3xcx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3A60A460F6;
	Tue, 11 Mar 2025 18:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6097AC4CEE9;
	Tue, 11 Mar 2025 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741717386;
	bh=OKgUmyfCm5KWfufOmtbwO7y0D8vMs8o5fmUjqAFAc2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fexKVTeF0ZI1hyXWGq0/Oex33Rpv/AAqnN33eDYnZ7GB34N/YakJ2uNyTI8L7QEDP
	 tzWgBIdvmOTes9rM9d4MH91vK1kHM7v3qJEVIL4z2/9o/Ot1vLgKFAxLMNu7j+1yLe
	 KJEx+KpPnKkJzev3lAtR/OZpOd1nog29HDuHqCe13qLdxonElVUIGmHPNAozGheWFT
	 e8w6kueMdUBY4AmfGrd6V5I4rFYmvNU9SFGLV9qr62Y2FeMA8iaCoUn4IM6o570MPc
	 DU995SibTurpmIHWQ4YTt9sFJ7nk+fK4eDJfL6raIRYicB3T8UkMknqI/fbmJQXuBv
	 xAVlSmqw6Lifw==
Date: Tue, 11 Mar 2025 13:23:04 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [RFC PATCH v2 04/16] dt-bindings: media: i2c: max96717: add
 support for pinctrl/pinconf
Message-ID: <20250311182304.GA3925099-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-5-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-5-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_112308_121657_45880B09 
X-CRM114-Status: GOOD (  21.22  )
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

On Sun, Mar 09, 2025 at 10:47:56AM +0200, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../media/i2c/maxim,max96717-pinctrl.yaml     | 71 +++++++++++++++++++
>  .../bindings/media/i2c/maxim,max96717.yaml    | 16 ++++-
>  MAINTAINERS                                   |  1 +
>  3 files changed, 87 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> new file mode 100644
> index 000000000000..347e66a5320c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/maxim,max96717-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim GMSL2 Serializer Pinctrl
> +
> +maintainers:
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +  - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +unevaluatedProperties: false
> +
> +properties:
> +  function: true
> +  pins: true
> +  drive-open-drain: true
> +  drive-push-pull: true
> +  bias-disable: true
> +  bias-pull-up: true
> +  bias-pull-down: true
> +  output-disable: true
> +  output-enable: true
> +  output-low: true
> +  output-high: true
> +  slew-rate: true
> +  input-enable: true
> +
> +  maxim,jitter-compensation:
> +    type: boolean
> +    description: Enables jitter compensation.
> +
> +  maxim,gmsl-tx:
> +    type: boolean
> +    description: Enable transmitting pin value to GMSL link.
> +
> +  maxim,gmsl-rx:
> +    type: boolean
> +    description: Enable receiving pin value from GMSL link.
> +
> +  maxim,gmsl-tx-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Identifier used while transmitting value to GMSL link.
> +      Default value matches the pin number.

Use normally wrapping or blank line between paragraphs.

> +    minimum: 0
> +    maximum: 31
> +
> +  maxim,gmsl-rx-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Identifier used while receiving value from GMSL link.
> +      Default value matches the pin number.
> +    minimum: 0
> +    maximum: 31
> +
> +  maxim,rclkout-clock:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Clock value.
> +      0 - XTAL / 1 = 25MHz
> +      1 - XTAL / 2 = 12.5MHz
> +      2 - XTAL / 4 = 6.25MHz
> +      3 - Reference PLL output
> +    minimum: 0
> +    maximum: 3
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index dd28cc397674..0a43582168a8 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -120,7 +120,21 @@ required:
>    - reg
>    - ports
>  
> -additionalProperties: false
> +additionalProperties:
> +  anyOf:
> +    - type: object
> +      allOf:
> +        - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#

You can drop the allOf here.

> +
> +      unevaluatedProperties: false
> +
> +    - type: object
> +      additionalProperties:
> +        type: object
> +        allOf:
> +          - $ref: /schemas/media/i2c/maxim,max96717-pinctrl.yaml#

And here.

> +
> +        unevaluatedProperties: false

Do you really need to support 2 forms?

This also allows the node names to be anything. We do that for existing 
cases, but for new ones you should define some prefix or suffix. 
Typically, '-pins$' is used.

Rob

