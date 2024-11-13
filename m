Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6EED41C17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QI8MidwZZ5apE6IYuuUbrPqi3d8lcdFWg29g280gmXo=; b=NZaQCOH2VHbp/z
	YPxdexxj5XBkBeJfNDh17JLvOvZtp7KW7pHz9t/X3obuzUHgcFD7AMtxUNu5Yl/9v/IzUdPOwpBqF
	cKgOZ0jjm34uZnMnksoPFSZbCAWRoI2NNMj4yNIFAtI3hHFz4qzUyuQzJNEDzj28fE5bF/5WeLlN9
	361WTkQDvwfzxe4L5aG0weosO7B2AJ40nHh/dise3ZkngHtl93rD4qkkGlpK+W1x0CtJZr1mEaFWz
	JNl000YEKOstkyLtR+9bP8JsBLc0NB+ayrImCi8BL5sywOcaSI6rmE8PiXAIlyrqw0VCSA0xSNny9
	pHx2ZnsOA6TCxDpbcwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB97T-000000069Zb-3Cp8;
	Wed, 13 Nov 2024 08:52:59 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB95B-000000069IH-21Vm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:50:39 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e8607c2aso7347265e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731487833; x=1732092633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QI8MidwZZ5apE6IYuuUbrPqi3d8lcdFWg29g280gmXo=;
        b=A/sKJmCGpT4VSEmd/tgkgnbnWvSKLtTBm9Kjst0bIGpWKAcOGdwCVQSSxh0Zd3nEcb
         feULMBkGYLvcy+NJcXm5Yl+8E4I06Plw98tSBRGM6ifZdcwqyK5rL0yLlREXrC+dOelp
         u+6IhHw3N9dF0k8d5d1M1L0Ztxc37QwDGTFmFNatkudiQEw/fgze0KgrBsmRea3ftb7u
         YKtKXH/xYM+mkNsn3+FsEohteDQWyMBJoc4NLoW0ebBRs9xDEyigl4cB9aeBjP3ulbpG
         AsazZjvOZypLYQDL3lUKXGdSFTklcMxw1jnHtukBoesWlcrS3uLqrYWDnywTt0WEx0Kz
         4deQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoy8dixP67kqVxoxfSYKNBoymt7Hm+UZ8RPVbkcMvOfKngZaWHBEZvVfsM2OGkfb26550qJFLNEj0FHc2gSvDm@lists.infradead.org
X-Gm-Message-State: AOJu0YyOzYforjNT6IPKIDW51bOOrpBbdn6Db/R6Oqs3E3H/FO8HPkUO
	+S0T2k/OHj2wee/VHQj4D1pIhqsK15nwTq+B0CT6+kUMHdpOheSYVd5XTxJ4
X-Google-Smtp-Source: AGHT+IHC1M3niPDte1HVbL52MQfcd0mJiIWBAad/LNubyq4ofPggrN/u+EBjD1zvm9dENIgOVecusw==
X-Received: by 2002:a05:6512:4018:b0:539:ea7a:7688 with SMTP id 2adb3069b0e04-53d862b452fmr9421554e87.1.1731487832989;
        Wed, 13 Nov 2024 00:50:32 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9badsm2115565e87.192.2024.11.13.00.50.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 00:50:31 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so63788881fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:50:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrr5AWwiN6gNCSXW9+QM+O6O1HZWB6b9/rKeIQkj0QXsQnct4r5YZ24RKIv8FXWpZ+ddeHanK5DmxscX201myv@lists.infradead.org
X-Received: by 2002:a2e:a551:0:b0:2fb:4b40:1e18 with SMTP id
 38308e7fff4ca-2ff2016fc88mr87156771fa.13.1731487831435; Wed, 13 Nov 2024
 00:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20241111005750.13071-1-andre.przywara@arm.com> <20241111005750.13071-6-andre.przywara@arm.com>
In-Reply-To: <20241111005750.13071-6-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 13 Nov 2024 16:50:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
Message-ID: <CAGb2v64x_QE8w_4h10waG33xNpkd9QLt_B=xSPMMe0M=6bqsJw@mail.gmail.com>
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner A523/T527
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005037_546005_E94C6BB9 
X-CRM114-Status: GOOD (  20.11  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2024 at 8:58=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> This introduces a new style of binding, where the pinmux values for each
> pin group is stored in the new "allwinner,pinmux" property in the DT
> node, instead of requiring every driver to store a mapping between the
> function names and the required pinmux.
>
> Add the new name to the list of compatible strings, and required it to
> have 10 interrupts described. Also add the new pinmux property.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a1=
0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-=
a10-pinctrl.yaml
> index 4502405703145..6fc18e92e1e94 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinct=
rl.yaml
> @@ -56,6 +56,8 @@ properties:
>        - allwinner,sun50i-h6-r-pinctrl
>        - allwinner,sun50i-h616-pinctrl
>        - allwinner,sun50i-h616-r-pinctrl
> +      - allwinner,sun55i-a523-pinctrl
> +      - allwinner,sun55i-a523-r-pinctrl
>        - allwinner,suniv-f1c100s-pinctrl
>        - nextthing,gr8-pinctrl
>
> @@ -64,7 +66,7 @@ properties:
>
>    interrupts:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -119,13 +121,17 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: pinmux selector for each pin
> +

Why not just the standard "pinmux" property, as given in
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml

>      required:
>        - pins
>        - function

This section should be made to apply only to the existing
compatibles? Maybe we could just split the files and have
a clean slate for sun55i?

ChenYu

>      additionalProperties: false
>
> -  "^vcc-p[a-ilm]-supply$":
> +  "^vcc-p[a-klm]-supply$":
>      description:
>        Power supplies for pin banks.
>
> @@ -156,6 +162,17 @@ allOf:
>          - interrupts
>          - interrupt-controller
>
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 10
> +
>    - if:
>        properties:
>          compatible:
> @@ -166,6 +183,7 @@ allOf:
>        properties:
>          interrupts:
>            minItems: 8
> +          maxItems: 8
>
>    - if:
>        properties:
> @@ -244,6 +262,7 @@ allOf:
>              - allwinner,sun8i-v3s-pinctrl
>              - allwinner,sun9i-a80-r-pinctrl
>              - allwinner,sun50i-h6-r-pinctrl
> +            - allwinner,sun55i-a523-r-pinctrl
>
>      then:
>        properties:
> --
> 2.46.2
>

