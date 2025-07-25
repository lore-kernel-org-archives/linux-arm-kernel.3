Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F3FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 04:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VI39K57CdQ86d6d0aFYHUvCEXJfJb9qVK/y2Z3jHq6o=; b=lHAv4DMGwvfVwOzG2lhh4SIC3L
	UfSxGTQ2lAeFeG2n3LWVTcmRmiURRhxHR7+VRRuDN58M64F9s7l9VQqlpwYpcTnHpzdOt/D54xVpQ
	guEjP2MTyWbk7HCONvwOw/PmsTXhagmXje2dHqj2hY56scSyYlnMBQmHacFSPak1lW7ikb03jxs0g
	UT82eLq0JIpfPxoqEqit9EWwOyoWNUmfW9TFtz6cuocWXuF/Ao1ruKKzzFRhCJHxDLRdVcsRBTLUw
	x+/VR0+F09buxMhRqn2r9r3ac5I9rY9JmJxT04CZOky/RbmVqWcRfK9ifvjCaaSjeQo81vrUsXFFo
	4+et70UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufABf-00000009206-1CSR;
	Fri, 25 Jul 2025 04:37:39 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufA9C-000000091ti-3hY4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 04:35:08 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-718425f1172so18509457b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 21:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753418105; x=1754022905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VI39K57CdQ86d6d0aFYHUvCEXJfJb9qVK/y2Z3jHq6o=;
        b=S8A19hZw1oRTZgUQtncnNAA5R74EHcnWKyVhJMZTk4iDDkiAtD6jsDzk94lqTPJA+v
         RrMrZwSKF2mOClzR+k5mVOxqNBOe/7Xpj4UcBiCL1iEcSsycRSMa8Q3MuJ4PaTxd4sGk
         0FxZwE9zeu9ReEU1KI+somD7h8Xb1MvTs3zi08K0vSHveR5e/JOwihD6yo3LUco0nfpy
         QNZymA649DvNowOZL9CXSBHa0eAaYqZJOjyY/Tt7NapXQouEwZBcb+Fe2vh5I97zjItH
         /qOGNuv14ayk+Fq/ilGjHLVss0Jx4WRfnZehZDpYlZOgvhxqUbJlLYNB2rWY7PJlmhUP
         LNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753418105; x=1754022905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VI39K57CdQ86d6d0aFYHUvCEXJfJb9qVK/y2Z3jHq6o=;
        b=jaWk4px/pQ6eDOao+Slt17kvHxImeITIapkh50CVEmxCae1yFbNPOIN7pMKZ/vDVqT
         jdFThIBQkqEeeJLpcK0+Ak0K9lqELr+QrhqXV2SIoPsJ/0Jp9kGtAKmrJu8mgpahYgm+
         sr2E0GeShUOVwuTzNNe5tQrjQtJOrAzRkCpKF6OCnoBk0ioUyPFWaXdFsWtWuMj5ScZM
         4RuphLwl2XE1NyyyKwsupwSpEz+cHUccOpB/owbU6lZOJQ+fk5CcetU5VyY/wOeiCNnJ
         bgZOu2K8xWbMN2TKqsBBlVLl0XCLISoIFRZeyBQuny84NJq+qgoibUaz2tBmLlCCnImn
         r2UA==
X-Forwarded-Encrypted: i=1; AJvYcCV9PV2SWiaQk/H6kLol88K00ZlqfX+LpjnJbVAgRRLxSFvRuUCFixiM8iQ904p9Fpyxmou3YK0wOmPPUNKp7Wc3@lists.infradead.org
X-Gm-Message-State: AOJu0YwQc0Fq5+kiC52SiyivUdkLunKx3gosvuxcSm4b5BYHToV6GGsk
	SUebpdva5dt2XXKo7CaPOxUpN6b66eLO3lVX9z4xdAgz4O6PF5nV4G7aS1UZM+U2lLe83FLrgT9
	ZOUdUQxfxIKOQUyqbfkOGoE99CLSr4W8KX7KQYnzRoA==
X-Gm-Gg: ASbGncsWXZY5AHR4XvOJa2G56kprDG6LOwRIsxFZ9gQI/d9vx9CGfxIBXF6+T+Nqt4S
	UYvn/NU29wVRDZQXzb32wCNG93gSHvFUfCvuwBU2bDzfBi/UM3HEB1Nu6R2TSjsvTWYGY4BQ6hj
	m67bzZE5YL+J+HZJTq0PXSWVoXsPrR6Br7T73Ojvl4qkk6yiiaeXjnyCMIHPU94flaZep6dAVnV
	R66d0M=
X-Google-Smtp-Source: AGHT+IFJ9XzJp6Xgxj0QLlNaKvOqYQXU71T6tCJTyQCg4SCr1RJUJwWNJFlJ0weWOTfAVwxY6VMJ4E1O+l5CAaib/pU=
X-Received: by 2002:a05:690c:60c5:b0:702:52af:7168 with SMTP id
 00721157ae682-719e37735b4mr7086307b3.2.1753418105293; Thu, 24 Jul 2025
 21:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org> <20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250724111345.47889-7-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 24 Jul 2025 23:34:54 -0500
X-Gm-Features: Ac12FXznxCvoXznkWVOuS7v8nJpWf44pmIfF2zVk3lxzJ_JMee-Hqsv_4Ncl66s
Message-ID: <CAPLW+4=XmFYvD1tmXXX53ORHp-Ued3_tCZoFCi=ch35aBuYO5Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: iio: adc: samsung,exynos-adc: Use
 correct IRQ level in example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stankus <lucas.p.stankus@gmail.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Dan Robertson <dan@dlrobertson.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dragos Bogdan <dragos.bogdan@analog.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Stefan Popa <stefan.popa@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Ceclan Dumitru <dumitru.ceclan@analog.com>, Alexandru Lazar <alazar@startmail.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, 
	Angelo Compagnucci <angelo.compagnucci@gmail.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	David Heidelberg <david@ixit.cz>, Manivannan Sadhasivam <mani@kernel.org>, 
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Andreas Klinger <ak@it-klinger.de>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_213506_949699_3F6F3B12 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, Jul 24, 2025 at 6:14=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The interrupt line to GIC is IRQ_TYPE_LEVEL_HIGH, so use that instead of
> "none".  Also replace the hard-coded GIC_SPI flag.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc=
.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 4e40f6bed5db..8069e99ddac8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -128,10 +128,12 @@ allOf:
>
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      adc: adc@12d10000 {
>          compatible =3D "samsung,exynos-adc-v1";
>          reg =3D <0x12d10000 0x100>;
> -        interrupts =3D <0 106 0>;
> +        interrupts =3D <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
>          #io-channel-cells =3D <1>;
>
>          clocks =3D <&clock 303>;
> @@ -152,11 +154,12 @@ examples:
>
>    - |
>      #include <dt-bindings/clock/exynos3250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>
>      adc@126c0000 {
>          compatible =3D "samsung,exynos3250-adc";
>          reg =3D <0x126c0000 0x100>;
> -        interrupts =3D <0 137 0>;
> +        interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
>          #io-channel-cells =3D <1>;
>
>          clocks =3D <&cmu CLK_TSADC>,
> --
> 2.48.1
>
>

