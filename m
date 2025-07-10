Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B660C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxqC0ATm8XXXx24MpZdy05ScJSWmhlnLQqeCjqghw20=; b=JCfKXESGpf8OvwFPxek5UvPTsG
	AvENa5/mPH0i4woCJMUcf+oFsm0CLs571yFQpDMX4PfaPoXdT1lKJm6y93bZnyhf+o6SRRzQwDI73
	3en7gapWrdaiC/O+xi1NcX72wL+D/YdpehG95xp3K2q2uWC8hVJ2mZZ97HdwT1RDy97+RtEGJeLwP
	gFy449/guMzFAmnv5b6vc8PEJyzSHYyerxqlTWwg5amInlLcWO9RZ8oOuTCqYoc2yMwgRJXxfS9s+
	x8X9EPYYSVI0+0uzDzhh4Bi/tlimk82S7LtnABNTJbsMqqMsYJiLFFpAHzegImfw86Ie4GbcHDDjk
	yoRsn5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwU9-0000000ClCZ-2ZO0;
	Thu, 10 Jul 2025 18:59:09 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtU0-0000000CIdF-31gy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:46:50 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so1192124fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752162407; x=1752767207; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxqC0ATm8XXXx24MpZdy05ScJSWmhlnLQqeCjqghw20=;
        b=drcemwEIS0gbOX3QgNzdjkdGcLVkL8s+rA8AGMGg/vpL7S8sDwz/sM8w96jORiTC9F
         yPSr7wWCWe/jkbGMxqyyvdVoD/To0i9ijk51E6JDLTimz666gv4PhdkyQGtuShiRybZe
         QRB3tdQLiauKtmbktx1aSt3Zjz3KdikiHM9g/BfApJ+hY78JHHylTBu904De6Ilyg3TO
         RhZ3sekADUFMMBoRGMVUAqiCMvnIGiWHDEVpBJFZK1A6YXOez0Z2nUeL/aR0YdtlSIDw
         eXDKMfj/VbJRO+x9R6jSRkBC2awjXKj7I011pq5coJdYeyId39o+CUJDENM1+P4XZlZA
         R2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162407; x=1752767207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxqC0ATm8XXXx24MpZdy05ScJSWmhlnLQqeCjqghw20=;
        b=YITp/PMoFUV3VwqPBvJV/2Wfin/WwSnWMAWMuafITvx/Rpan9Uz8ge8m44xTsMGdQ7
         KvpCxHtH7S813vKhTfgWGjOR2eAWCQqJqrdqeMaZcg/VOkjCsucS2wDjS4O99CAQTp+A
         doY2IITS+MaUpD/+1/2NYdoxL0s7mn2IUtPyJMeBomvDTyjAW778qMb9xBAYKogz+i84
         k5VewJ8J/kB+c0jgbhXVMP/YdgwCWkUvbC8l/NkwDTvrlThInAr/FlI97j/1HlI2hCuJ
         r5Y1Nuj15Cj0m+qsK/8hDkHt4RTUd9ZYPcU67i8xecYYIAemCTSpCLkHKINUcB8wjlpM
         c7bA==
X-Forwarded-Encrypted: i=1; AJvYcCV0/dOCWw7DMWoccWx/PLbdSRa/jLRLpoQn2e/lrjbjtve6mQcIPJxCTMsza1sZ/EuUjDLvKsQPStcWuUr8GDjl@lists.infradead.org
X-Gm-Message-State: AOJu0YxwcC8fzpuh01Go2X1h1Eme63mgshdvmO6+YKtXGw/nKEwuA2ui
	GFXNwjcTgT6HShcCzND9lmvmNRLpvQPy483jX2heJw9h9mrQzPchfjobPQAyQdRPIkE=
X-Gm-Gg: ASbGnctZfklhWOy/sSIqKg9b2pQ7ZrgEErkhppnKlI6/oMRvc3Ula3qaBy0H2UDac+5
	NRotLtZLP18X5ewFieUlto+I4evlbn3vFxgdfSejK+xx1/B0dVHZMk/Ftos8Iq6MCQVfLwEcD59
	R6LQmGKZc3dJavI7E2oZThnNvRTOlzCWt/Uv1Yxd7jKAmBbivKrAYJ/w6tAlZFamLbS4rEqWfx/
	W5no49iJMfHTRwjgD2ETNv3G3mdinGkXDn9M5UbdjhSfb29OevP/g4ghMsqIrWES8CDs3jEoS3b
	dybt/L809xuuk22EXUhngSMf3VZrjSYkJLvCF6otSZIrBlMlMzgWjAcs7DlA22l6fl1m05jaHOz
	Q/LaEil1rgPJK2I1dll72DXx0vW7kVLLRTL9TUB8=
X-Google-Smtp-Source: AGHT+IGGnNYbfg3tRijwYJsTHxFrHe4ec9V4WbLcn63Mw2V3gA0rhenSRI8xr6ktDmmz0UyeTDfVCg==
X-Received: by 2002:a05:6870:7053:10b0:2eb:9fe5:d06c with SMTP id 586e51a60fabf-2ff0c5af786mr2100280fac.3.1752162407230;
        Thu, 10 Jul 2025 08:46:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:6f38:cf8f:abb1:34f7? ([2600:8803:e7e4:1d00:6f38:cf8f:abb1:34f7])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff116dd664sm343870fac.42.2025.07.10.08.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 08:46:46 -0700 (PDT)
Message-ID: <2bcd758b-c2d0-488a-8ead-ec7fb39f93e2@baylibre.com>
Date: Thu, 10 Jul 2025 10:46:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: adc: imx93: Add calibration
 properties
To: Primoz Fiser <primoz.fiser@norik.com>, Haibo Chen <haibo.chen@nxp.com>,
 Jonathan Cameron <jic23@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-iio@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de,
 andrej.picej@norik.com
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
 <20250710073905.1105417-2-primoz.fiser@norik.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250710073905.1105417-2-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_084648_996414_E8DB76D4 
X-CRM114-Status: GOOD (  16.19  )
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

On 7/10/25 2:39 AM, Primoz Fiser wrote:
> From: Andrej Picej <andrej.picej@norik.com>
> 
> Document i.MX93 ADC calibration properties and how to set them.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../bindings/iio/adc/nxp,imx93-adc.yaml       | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> index c2e5ff418920..d1c04cf85fe6 100644
> --- a/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/nxp,imx93-adc.yaml
> @@ -52,6 +52,27 @@ properties:
>    "#io-channel-cells":
>      const: 1
>  
> +  nxp,calib-avg-en:
> +    default: 1
> +    description:
> +      Enable or disable calibration averaging function (AVGEN).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +
> +  nxp,calib-nr-samples:
> +    default: 512
> +    description:
> +      Selects number of samples (NRSMPL) to be used during calibration.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 16, 32, 128, 512 ]
> +
> +  nxp,calib-t-sample:
> +    default: 22
> +    description:
> +      Selects sample time (TSAMP) of calibration conversions in ADC clock cycles
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 8, 16, 22, 32 ]
> +
>  required:
>    - compatible
>    - reg

This seem like things that should be set at runtime rather than
in the devicetree. Unless there is some justification on why
these values depend on how the chip is wired up?


