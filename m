Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3BDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYICy3ZHkuRdlX+HoDWTtRubayv3mEheNrVzHMaXuwg=; b=iYFFXulBomnSeUpKWdCDDgQ/Cr
	PFokdvQ9QT4kOwfCIpIc4QKI9hN+6QnzgGgcUSx6Xk6aK2KaaAVITOiBFDePfazwdk4cBVK3Znt4b
	PGPQWnX2NFlcMtrYL+/h6uAQsOeuKsE9JMTAp3vqhbB8ekYkk2nfKWO/+TWJihmxYHbtkV8XAv1tN
	BxKdqAACYP2z7MIYXDagSphGkiN1QfgSVvDOF1Z12wSLIIz9cryLO4VOZ+Rtjz5R7l0E/b+DDNM/n
	YiNtAdTS1o3XKF1gwrPlk2mPG+2mijqNZ70340oSjUhQ8wXx+BOV2dyMlFIj9Q4iO/7LoTTYRFRmF
	UXrTv8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4TU-00000006eIl-2Kah;
	Tue, 11 Mar 2025 18:37:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts48X-00000006awx-35Nc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D4025C4B84;
	Tue, 11 Mar 2025 18:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74968C4CEEA;
	Tue, 11 Mar 2025 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741716928;
	bh=vpOOffpnSh0fvqCTw4JxWUJ/X6ZreK0VQ8Rv3J0Zuk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMkcqqPMiAosOQ6797LvVM0cf0//2QkwY7Y/WX+Xbe0fHcYlmDB9hImV1m+0dtdnw
	 SYaxhK5zIlVTYBS1aaho5ir9czEEetG18LYiuwbQnHwbq9Xn8MrEMAIcU+TmTEY/+U
	 kNC4q11UEKsCy430kwd4TwECWpAajaMHNCHLe138iuX77M4uXnW80k9TDnky1HC2jU
	 PMeLHqszfc/RldC++sAMTVp4TaECEq+CZZqZ9P3sqg5w4nz5J3sCYZdeZGbB6wJLoh
	 k0nVEhynYytlveBn+KVgO5IFD+8+MEjjQTafF2lFnCIb6VSsc9dEB2ASZuc9n191hC
	 OACZj9ubp4j4w==
Date: Tue, 11 Mar 2025 13:15:27 -0500
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
Subject: Re: [RFC PATCH v2 03/16] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Message-ID: <20250311181527.GA3917837-robh@kernel.org>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-4-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309084814.3114794-4-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_111529_863414_3F85C92B 
X-CRM114-Status: GOOD (  17.68  )
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

On Sun, Mar 09, 2025 at 10:47:55AM +0200, Cosmin Tanislav wrote:
> MAX96717 is capable of address translation for the connected I2C slaves.
> 
> Add support for I2C ATR while keeping I2C gate for compatibility to
> support this usecase.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../bindings/media/i2c/maxim,max96717.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 1026678a17a7..dd28cc397674 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
>  
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      '^i2c@0':

This allows "i2c@0anything-you-want". Based on reg, you want 
'^i2c@[01]$'.

 
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -98,6 +122,21 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - $ref: /schemas/i2c/i2c-atr.yaml#
> +
> +  - anyOf:
> +      - oneOf:
> +          - required: [i2c-atr]
> +          - required: [i2c-gate]
> +
> +      - not:
> +          required: [i2c-atr, i2c-gate]
> +
> +dependentRequired:
> +  i2c-atr: [i2c-alias-pool]
> +  i2c-alias-pool: [i2c-atr]
> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> -- 
> 2.48.1
> 


