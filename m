Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E1ACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uK0l7QDV+ABFqTSoOMZzgiXyTIr6vW6Jdj2b1FWdB/Y=; b=3DND9IPfItwsb3zdkOZGG9gqBE
	knH+l209PD0Mt28ZpyxfqDiSo2N99kqpokOkivXauVVV9BLJtJ15fOa1/5OY9rRlfLDyoSIlNkxG8
	rLvP55WBNOZHvKJbhoyiyEYDh7UcIbfvKgX/BeZtR5KgJhG4blnGTeFqxyhlAsL2+/u379gk+mqX5
	WT8h6kOWdAytOp8QYqA8nPz75LWzkPGIGHMKd49lsvaE81Z9T0yUcVdeFPAP9guxufWPJ54dH26JX
	McAWu9J7L9YmgqSt/fSWOAwoCud/7A+YCPy1V+MWGuCMGkjgy7siLppUE3qgJkz+1r8pGvm5jrR/6
	QoPOBjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJALd-00000008nqy-3eNJ;
	Wed, 12 Nov 2025 12:53:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJALb-00000008nqN-14ma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82A5744083;
	Wed, 12 Nov 2025 12:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD60C4AF0B;
	Wed, 12 Nov 2025 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762951994;
	bh=Xq4laesBhXBU8cnsibjlgRX7+Xd6QHEEQNRsfNd8xHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MgbNA+aNi66iHWuzy6LKut7QTLt+D+/WXgdFltYAbxJCNbzgA1InxXNZhXB1n5p0c
	 vnaW4LMGTXWq3iqK+mCrPfR/wgZ3CmaTYYbgSRIL+gsVedu2ksUj6iZV9eWJ1VDx8L
	 2t0dYDDlC7uKsojwf3BaUVsp/1kxfrK/qs3b/tQL4PlVsjE6+lxoNCV4z50uPZEu0c
	 IZ7IeyRYTrjvIwKCeVpl50DpVm5RZpwxhGxt3aVEGIxSEwIzBVQiTRda3iQYX8yVoG
	 FLcPcsS+iUYDO9jpoGvblj2BtEDt27fgN3g5T5VkFwZycgbBRxR4Axqu2EhuuHABrh
	 i4BX+X/MEfm9A==
Date: Wed, 12 Nov 2025 06:53:12 -0600
From: Rob Herring <robh@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v5 1/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <20251112125312.GA1319094-robh@kernel.org>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-2-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104203315.85706-2-shenwei.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_045315_349016_B8768B26 
X-CRM114-Status: GOOD (  19.98  )
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

On Tue, Nov 04, 2025 at 02:33:11PM -0600, Shenwei Wang wrote:
> Remote processors may announce multiple devices (e.g., I2C, GPIO) over
> an RPMSG channel. These devices may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node.
> 
> Each subnode within "rpmsg" represents an individual RPMSG channel. The
> name of each subnode corresponds to the channel name as defined by the
> remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..897a16c4f7db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -84,6 +84,92 @@ properties:
>        This property is to specify the resource id of the remote processor in SoC
>        which supports SCFW
>  
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Present a group of RPMSG channel devices.
> +
> +    properties:
> +      rpmsg-io-channel:
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "gpio@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-gpio
> +
> +              reg:
> +                maxItems: 1

I still don't understand what the numbers for 'reg' mean here. You 
explained it and I still don't understand. In any case, it needs to be 
explained in the schema.

For example, why do GPIO and I2C each have their own number space?

> +
> +              "#gpio-cells":
> +                const: 2
> +
> +              gpio-controller: true
> +
> +              interrupt-controller: true
> +
> +              "#interrupt-cells":
> +                const: 2
> +
> +            required:
> +              - compatible
> +              - reg
> +              - "#gpio-cells"
> +              - "#interrupt-cells"
> +
> +            allOf:
> +              - $ref: /schemas/gpio/gpio.yaml#
> +              - $ref: /schemas/interrupt-controller.yaml#
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
> +      rpmsg-i2c-channel:
> +        type: object
> +        unevaluatedProperties: false
> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "i2c@[0-9a-f]+$":
> +            type: object
> +            unevaluatedProperties: false
> +            properties:
> +              compatible:
> +                enum:
> +                  - fsl,imx-rpmsg-i2c
> +
> +              reg:
> +                maxItems: 1
> +
> +            required:
> +              - compatible
> +              - reg
> +
> +            allOf:
> +              - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>  
> @@ -146,5 +232,42 @@ examples:
>                  &mu 3 1>;
>        memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
>        syscon = <&src>;
> +
> +      rpmsg {
> +        rpmsg-io-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          gpio@0 {
> +            compatible = "fsl,imx-rpmsg-gpio";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpioa>;
> +          };
> +
> +          gpio@1 {
> +            compatible = "fsl,imx-rpmsg-gpio";
> +            reg = <1>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            interrupt-parent = <&rpmsg_gpiob>;
> +          };
> +        };
> +
> +        rpmsg-i2c-channel {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          i2c@0 {
> +            compatible = "fsl,imx-rpmsg-i2c";
> +            reg = <0>;
> +          };
> +        };
> +      };
>      };
>  ...
> -- 
> 2.43.0
> 

