Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B53C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=; b=Qxu5nKpDV7ZNpNtYaP+MAdSLJb
	QLt5Pin1WkQbSzRBWAQTB2kO6r0II48SsexW3U8hqFitIlQ8bmomL4P6qIwMU5Dh5IdvoOO3hy3Cb
	HCRFG3vI43g9hLMANllj1TnQ+taaKLUNWuRw2+krvBP1Mc/y2BYv5H7K6++pRMjqXkC81SN6mDEbI
	9K/0WdLnxbzPoJI88kyE/qKqpV2oSorVBZ3VSrik7fPkBNtyBjMYJhljnItjH9mQcDHGgIhRvXOk+
	eMaBr6e+RodqMYlLt0yUfuBv3meH2mWiKDOBMov5yjzPaMZVrc9H0WQIXyuSm4gOd1IB7VGa6vzai
	og+c2I+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirlb-0000000EH8r-1ypP;
	Fri, 14 Feb 2025 09:13:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirk8-0000000EGiW-0lvf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 09:12:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38dd93ace00so1006611f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739524334; x=1740129134; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=;
        b=fnmtQZB7OjHnhE5GPVkN9kIb0CDNxCsd+6eZ/PZfAEEoVroZvaRI7oPo/R1pYkCqqW
         q8wWwKPHzpyF8CI7B3Jx69Uwro8Ryfag3nwEcOE9F84lKNt/RCnS/8XJ06fpqTIc2fLp
         12p9Bv3YX7B9FGWESqUzA3F05KtR1OepxMbY9mJR/Vz8IxM3KnULO0fF9p1bELIiy0AY
         S9WkV/v+sqRGK6J7gvC7/SuRYhWZP0nGvtg5PwxZMXU0IMqWEcptudqf0WtQV5T78Rz2
         /10Cr3k3HrIFjuFla32WCOS04xJtu4IPMcTbOF9DdAgArt6XXJ0L5uKdG5K95lDg0oZq
         yvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524334; x=1740129134;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPLpS01eydUHu6GBaBUe8/ayY4CKHZMhz0y47NMUSQ=;
        b=KGSA9c7BmHhnBcn510+p4PS+oY7hUidtsxK4XiT7jj4tBYHng7kCNL3LwXBl8E++9F
         dRr6zpGw7rvZvlQpbpBXugnJ3U9fYJZmvOlmh1u3ZA9Ai6DJbP8GZNUz8sOrfadx+eAV
         Nhe6RVeq2ZdQkdV3EsqFCdw9tKCFkmckUw+wL8KFpvGF2HP9z9oUhpV+nW3HvvtlpdSS
         qs8LYIpzYM4dV8gmHOYhxRFLZcUMW9QAEU1wjtaVg/f6PRWYIVjrV1I0xycy92pKyRri
         JflEAZk15gsqwZiFKMYacfBuDyHJKKnc6XNiPPZ2tkqIJrffyMZYwqLEuJeqCzPAROKJ
         Mr7A==
X-Forwarded-Encrypted: i=1; AJvYcCX6J56ds+2UfWMsTNBzb3fwmaZgCYEMXfP7qzp/da2WR4HZh6p1PYlDKgqg6FDFRQLP6V90iIaxQtwZlGsBkgC+@lists.infradead.org
X-Gm-Message-State: AOJu0YySdQ+tllIdn+20Yl0gGGCcr/n47wWGv1dr6oCbw9g8Oi5RnHBz
	FdTNS3avLyTGBrSarI9pj3GE9F6jtoq5YmoXmRoX/QsEbs0v5umWS1zFSDDnCUM=
X-Gm-Gg: ASbGncvrjQJXcroYHjpS9Bejvk1vF0g2+qaZ3CAh/IDaOvK7c46j3lYKF4RxHrltM5u
	WzXs9KkI0R4/5c0+Y7j276dVTYLgXZDwpPRcE2BaM/lko3La2eU98ZgCubED2Uv4E2aDDue4Pr3
	hyBbAzqxOjejNvjnxj0I/DNBp0uqoFrXZ6SrRc+4zLsZ6eBKIWUbVeRf/cB6qmlpSiK8HbmwU3V
	RH6O7SM7lAKksbcN4vSADZ9omEVFnKGJiM+kxHCUAWtEherO1EZeIhMABTVVI2EFX7UaACRFgMA
	lzuzO4COPEI0fos=
X-Google-Smtp-Source: AGHT+IHB7Zaq1DV8SNQlu/uvUkXW1GOYMzSJKw6n2qPshAIpNTdXKTBQ2IDut6nlYHPtUDgvHL/tTA==
X-Received: by 2002:adf:e390:0:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38dea26e7e4mr10175098f8f.21.1739524334488;
        Fri, 14 Feb 2025 01:12:14 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258dcc45sm4114605f8f.33.2025.02.14.01.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 01:12:14 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad for s4
In-Reply-To: <20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com> (jiebing
	chen via's message of "Fri, 14 Feb 2025 10:13:40 +0800")
References: <20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com>
	<20250214-audio_drvier-v2-1-37881fa37c9e@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 10:12:13 +0100
Message-ID: <1jjz9szy8i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_011216_221877_85FBC8C2 
X-CRM114-Status: GOOD (  16.66  )
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

On Fri 14 Feb 2025 at 10:13, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> add the s4 audio power domain, add the mclk pad, sclk pad
> and lrclk pad clock id for s4

Incomplete description of the changes that follows

Also the change mixes 2 differents topic for no reason AFAICT.

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml         | 18 ++++++++++++++++++
>  include/dt-bindings/clock/axg-audio-clkc.h             | 11 +++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..364783c6f7572b09d57de2b35d33adb7bcf7db18 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,7 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
>  
>    '#clock-cells':
>      const: 1
> @@ -100,6 +101,9 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    description: audio controller power
> +
>  required:
>    - compatible
>    - '#clock-cells'
> @@ -116,12 +120,26 @@ allOf:
>              enum:
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
> +              - amlogic,s4-audio-clkc
>      then:
>        required:
>          - '#reset-cells'
>      else:
>        properties:
>          '#reset-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +
> +    else:
> +      properties:
> +        power-domains: false
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
> index 607f23b83fa7287fe0403682ebf827e2df26a1ce..75dde05343d1fa74304ee21c9ec0541a8f51b15e 100644
> --- a/include/dt-bindings/clock/axg-audio-clkc.h
> +++ b/include/dt-bindings/clock/axg-audio-clkc.h
> @@ -162,5 +162,16 @@
>  #define AUD_CLKID_EARCRX_DMAC_SEL	182
>  #define AUD_CLKID_EARCRX_DMAC_DIV	183
>  #define AUD_CLKID_EARCRX_DMAC		184
> +#define AUD_CLKID_TDM_MCLK_PAD0_SEL     185
> +#define AUD_CLKID_TDM_MCLK_PAD1_SEL     186
> +#define AUD_CLKID_TDM_MCLK_PAD0_DIV     187
> +#define AUD_CLKID_TDM_MCLK_PAD1_DIV     188
> +#define AUD_CLKID_TDM_MCLK_PAD2         189
> +#define AUD_CLKID_TDM_MCLK_PAD2_SEL     190
> +#define AUD_CLKID_TDM_MCLK_PAD2_DIV     191
> +#define AUD_CLKID_TDM_SCLK_PAD3		192
> +#define AUD_CLKID_TDM_SCLK_PAD4		193
> +#define AUD_CLKID_TDM_LRCLK_PAD3	194
> +#define AUD_CLKID_TDM_LRCLK_PAD4	195

I think we've been over the fact that s4 audio clock is very unlikely to be
compatible with the axg/g12 generation.

I doubt they should share the same bindings ID.

>  
>  #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */

-- 
Jerome

