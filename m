Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA05C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 23:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=; b=j5m/xQPwKaBFEJuV10cGNRl1kG
	f5nCOYeYWFeU3pBQal+j3tPqC55YprFDbJZCrUSIACCu81SUHpS7PzZRG5MSqX2Dm4nd+OTgGVRMY
	tQFS94LyhvTZ48dQhRnZ5sucy1I0EykbNkeq8db0u8P0vvGe/SuBupKSpknN+I50s1FGbg4I7l2do
	aAUnkGyINAJoad67cnAZajC1oTyutJNmqxNO0ucDggijsWMz2FvdyiXSIosAJkTUOrLlSJJ4wsCT7
	1Go2zz6YX8h2z5i2E4gs4gtQm72nhNOw+Di2t0U2TX6VMh06Zt+qhGgPPzb8Og5JlN4y5HDyiWBXw
	BFj/g0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLf6-0000000Bz60-3Typ;
	Sun, 23 Feb 2025 23:45:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmLda-0000000ByyN-4681
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 23:43:57 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5452c29bacfso4228864e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740354233; x=1740959033; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=;
        b=UNdDFHlyRbITs+mgKWniuWv6QMU0gL2lQjBWQJ2z+6zeZoqVK8+QFGSdTtZRApqhtu
         Ynw15KYMtXJv4qKMixwSBtFK7un4uIXch1SQrGERaN/E+SL3UzQV3KbxU7xorbJb1Y9u
         FP9Mr2aIcO/oMqYpNW0tPw63dVcfhQaqi5LebjrU8/sko3a1Q1V5C48hJiYjPQATwyu5
         ZtJASIWUkV/8TQv8Tu8J4rZGI/oVfNbHJ4odisEPbZe/EU3V+s2KN+L5l9DyLyctmEfm
         ZvS8yW8kGIZYqW8mVHJJjdAKYYh4gbqgn9wSfIp+o4MIsDBsmDV0nRbXtDMn+5vgU1Tm
         lD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740354233; x=1740959033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28j2oUhHrE0UtIm5Z7Iu9myzi6x7Y72gOBfh9gvCc7A=;
        b=XEuAAhu7KUjNo+XheigoiS6bHYXCkdGd/UvmT4eX3qnpJ+yYcl/bEHNO+Ucx0SGY9V
         3DScWyv6Lm4tuhxTbXdwhifvuXqJHrIrwZlTKXCgMq1+iT9ZpBm2vG1TsE2Olzw0f1Eo
         ranRpBHFEnZknrzANthlh28MviX2B4JlPeELTN4KkWelEBe4ZDpMfjQ7NRHyLWW3zwPA
         VafhDpcmqhtswetpMBxmNaqIbFlPxuMsNCfWb0y8oXXkdViOcydYVnY9unFjSz9IsX3e
         /on54Z9Q+W55DC0jS6qWMRcYypKcUQkeZBT2ZOiW65Ae7QBPWgX21GUn3mw3mEbHTwak
         HQcg==
X-Forwarded-Encrypted: i=1; AJvYcCXTvaGTCvYs/XHUclBRlgA8PEZgeczHLv8fW8vHr5iZZN10KxR74eb1k26v+cF4RsQKyDEkTyffmno4bbxdrBTZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzazD1BOgNESEmQNPM4IdatBT7+3RqvYT5HuaD8gM42SpBX+oGj
	FbP4n3hFVAqzv+EgLc3PSmP5oLDrwOq8h9AOo3Hygy0sR4ivkQYXHhrjpWXbR3I=
X-Gm-Gg: ASbGncuAWKR+PM24dHXw/ydm0xzPdJkO6AIeiMLBOGSVR2low6CAsG6fabBTBy8ykIC
	AmyNF89w+b9tD5axntMK9CIyFqYD2GGE6cAK4780VYKCZgGmEXaka3CDg+Wkw5f44ovIDsV06jP
	sY+V/l+GiyTAG1/VUPrb2poYnDIBgzbTgLTlDX9fQxF11kDec8XOqSDOjSbNaE7lQeW07D0j3MX
	mp8y85e2z/rTgx3iFMaqCAjXqrtmeQXmQ2WgQ74GR8bWB7NnWFF5Q/WxTZRB6IwOXDPywyOFZbX
	inu/666+qg/6w4TPghXeavSTmDjRZOb8nXXFlXnDU+v8egOnudgtcz3dvPs2YcwRa/tD9uB0mR6
	mQNirdQ==
X-Google-Smtp-Source: AGHT+IHqDyDmO/r2yjSG30eHo/aZTvnzBBS3IoH2SUfydcMTabalwcojF162vAWAlTXJ3voBa2nsQQ==
X-Received: by 2002:a05:6512:308a:b0:545:296e:ac28 with SMTP id 2adb3069b0e04-54839144ee2mr4857016e87.24.1740354232909;
        Sun, 23 Feb 2025 15:43:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54526741fe5sm3065509e87.90.2025.02.23.15.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 15:43:51 -0800 (PST)
Date: Mon, 24 Feb 2025 01:43:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: phy: snps-eusb2: add exynos2200
 support
Message-ID: <4tvpl3pujnuw2qjwu7f7ryrr5dndxow7srkkp2223wmexr23bi@7nmgrpq6znpg>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_154355_023415_F43B8776 
X-CRM114-Status: GOOD (  15.79  )
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

On Sun, Feb 23, 2025 at 02:22:21PM +0200, Ivaylo Ivanov wrote:
> Exynos 2200 makes use of the Synposys eUSB2 IP, so document it in the
> binding. Unlike the currently documented Qualcomm SoCs, it doesn't provide
> reset lines for reset control and uses more clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov@gmail.com>
> ---
>  .../bindings/phy/snps,eusb2-phy.yaml          | 64 +++++++++++++++++--
>  1 file changed, 57 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> index 22c77968f..f4164db71 100644
> --- a/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,x1e80100-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy
>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: samsung,exynos2200-snps-eusb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -31,12 +32,12 @@ properties:
>      const: 0
>  
>    clocks:
> -    items:
> -      - description: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    clock-names:
> -    items:
> -      - const: ref
> +    minItems: 1
> +    maxItems: 3
>  
>    resets:
>      maxItems: 1
> @@ -58,11 +59,60 @@ required:
>    - compatible
>    - reg
>    - "#phy-cells"
> -  - clocks
> -  - clock-names

Why? Clocks are required in both if clauses.

>    - vdd-supply
>    - vdda12-supply
> -  - resets
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8550-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        clocks:
> +          items:
> +            - description: ref
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +
> +      required:
> +        - clocks
> +        - clock-names
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos2200-snps-eusb2-phy
> +
> +    then:
> +      properties:
> +
> +        clocks:
> +          items:
> +            - description: Reference clock
> +            - description: Bus (APB) clock
> +            - description: Control clock
> +
> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: bus
> +            - const: ctrl
> +
> +      required:
> +        - clocks
> +        - clock-names
>  
>  additionalProperties: false
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

