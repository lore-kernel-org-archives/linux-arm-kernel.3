Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF1C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=COLxGQOVY8yt2fr7J5AtRemZ8VM27w02vgM7FuSdjVM=; b=tdUdQhf5QqX4voLbjzfG8ZrMSX
	VQtP2mwuJdYyfW/qFC0CIkGTkiW858UDEAz26h84nlnU5x82038IxfcNykTe2IVdv3Dz2tpS9pWg+
	yiqSYVGAMNTxUwDuZnDFgrDFC3ZYECk3wwMDKUarUQzX3LjzIecfHq13bXF5sNpn70BGluGJL12nv
	/3bOvIivDJTJlqFOGs13BDeof5SLaTUYqbbZQcHYgkExkuK8HldcLGkgAF5HiLGF0o0dVEQtVvzTf
	piv8ygQFfHgBd7FsXZgYhFu5xtesY+OFrdAlBiUWoRwmgMGwCgevVv67A9/BRHnzxW2IbdYpl8pLQ
	4fzeaqRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKD2-0000000GS6q-1ijQ;
	Wed, 14 May 2025 22:04:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKAO-0000000GRiG-1bDT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:01:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D787629E4;
	Wed, 14 May 2025 22:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AC3C4CEE3;
	Wed, 14 May 2025 22:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747260091;
	bh=MyzjnthvybELOM4JvFy1xzr8PF39cyQLUmn5pDE6Ihw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyXr+1Vq93LQsdNac7iCM7MAdHJtBYJE3PYL1oocxeEjvmEWQL+dF1/8+ROuUCvFK
	 dY5QplCKRZO9ty72rWusWC/7wJbeDaxSfXfqSI6zdjaL9NNmxtYF289fODYD91OMmg
	 IJtsvT7FswkQj1bEMhC7fxVPFqnnjAHNqCZKDfrVyynZ0/xJXm2KeRL3AYxILtc+GB
	 sA6y2STbAzTbGL/FmxFS3qg01TnzB3GZ9jxQB4E26LeqYvfW0LhAISYclCngk8XLD7
	 3JSBmPEvSRiHAcPqgmQ2MJqYa8KYJSJnf2VBvu7eS7h+vGzr/pffM/XT7Zqedcxx9X
	 SxL1hABJnE2yA==
Date: Wed, 14 May 2025 17:01:28 -0500
From: Rob Herring <robh@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>, Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 03/19] dt-bindings: media: i2c: max96717: add support
 for pinctrl/pinconf
Message-ID: <20250514220128.GA3111478-robh@kernel.org>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
 <20250512212832.3674722-4-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512212832.3674722-4-demonsingur@gmail.com>
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

On Tue, May 13, 2025 at 12:28:12AM +0300, Cosmin Tanislav wrote:
> MAX96717 is capable of configuring various pin properties.
> 
> Add pinctrl/pinconf properties to support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 110 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 111 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 167c3dd50683..5998e2518be9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -121,6 +121,116 @@ required:
>    - reg
>    - ports
>  
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        enum: [gpio, rclkout]
> +
> +      pins: true
> +      drive-open-drain: true
> +      drive-push-pull: true
> +      bias-disable: true
> +      output-disable: true
> +      output-enable: true
> +      output-low: true
> +      output-high: true
> +      input-enable: true
> +
> +      slew-rate:
> +        description: |
> +          Slew rate.
> +          0 - Fastest
> +          1 - Fast
> +          2 - Slow
> +          3 - Slowest
> +        maximum: 3
> +
> +      bias-pull-up:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-up
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-up
> +
> +      bias-pull-down:
> +        oneOf:
> +          - type: boolean
> +            description: Enable regular 40kOhm pull-down
> +          - enum: [ 40000, 1000000 ]
> +            description: Enable either the 40kOhm or the 1MOhm pull-down
> +
> +      maxim,jitter-compensation:
> +        type: boolean
> +        description: Enables jitter compensation.
> +
> +      maxim,gmsl-tx:
> +        type: boolean
> +        description: Enable transmitting pin value to GMSL link.
> +
> +      maxim,gmsl-rx:
> +        type: boolean
> +        description: Enable receiving pin value from GMSL link.
> +
> +      maxim,gmsl-tx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while transmitting value to GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,gmsl-rx-id:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Identifier used while receiving value from GMSL link.
> +          Default value matches the pin number.
> +        minimum: 0
> +        maximum: 31
> +
> +      maxim,rclkout-clock:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Clock value.
> +          0 - XTAL / 1 = 25MHz
> +          1 - XTAL / 2 = 12.5MHz
> +          2 - XTAL / 4 = 6.25MHz
> +          3 - Reference PLL output
> +        minimum: 0
> +        maximum: 3
> +
> +    required:
> +      - pins
> +      - function
> +
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +
> +      - if:
> +          properties:
> +            function:
> +              const: gpio
> +        then:
> +          properties:
> +            pins:
> +              items:
> +                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp5, mfp6, mfp7,
> +                       mfp8, mfp9, mfp10]
> +
> +      - if:
> +          properties:
> +            function:
> +              const: rclkout
> +        then:
> +          properties:
> +            pins:
> +              items:
> +                enum: [mfp0, mfp1, mfp2, mfp3, mfp4, mfp7, mfp8]
> +
>  additionalProperties: false
>  
>  allOf:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f463ebca056..f8ffb7cff9c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14201,6 +14201,7 @@ M:	Julien Massot <julien.massot@collabora.com>
>  M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml

Don't think you need this...

>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
>  F:	drivers/media/i2c/max96717.c
>  
> -- 
> 2.49.0
> 

