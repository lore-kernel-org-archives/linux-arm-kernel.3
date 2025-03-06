Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200F4C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1PLVkKiN56Ya4maBrOxQSy4Oun8BAWhqNDU9AJlFdI=; b=JyL71mVn8QcVtNNSvXzVafekuW
	ZMMCU4WwstgNCwvZAUVNNpQS7CCaF6KjL/gK6vqgzpprJPnr4wFupiW2m8J28j2LtAL5v8/7KqdDL
	z0sfWvhnczOXhN4Fr6LWW3FdwA1nh32s3aub7w0sompr1j+otl0Tj5eH1L7lNg8gQQ3jkJtYZ6f/k
	6GlIuLRh/bOCm8rbCXyoqa2/MfHwBysKCzJAptRdAYGtKc2RAdMEEeNlVf/8KgXRPZnsUsFdWiUOO
	9FnQ6MR6Nk9xbY8yleExjFSLTXZfhbD2bnPBxHi0Kw8Mq5+ArzRL1qEyRHX7u6uuOYdn/UEbP+80a
	zICZAG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBZA-0000000B66W-0qA8;
	Thu, 06 Mar 2025 13:47:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBSQ-0000000B56k-1kfy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0B9EA44D12
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 13:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C117C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Mar 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741268413;
	bh=2mSyakUOyo08l4OiCw4nRuD9nEYgVqyIBYFul/OR6iM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1N9mnaP340A/wWlypAiLFCrdWOF0xMeWFyAlmpSuDtd3GP4DMVjl+sCZNm0Zi+7P
	 H7KhOV3UR4DCuASANAWLPrXGpm6QRYBoYHCJkS1m2IiGZNbQrLJR9YmLWrC+2gr81K
	 JoJy0KjiCoNkCIFMzp5maxBn7tfZdMV6HkU8uzBx4CbPyIrydyyOD9L2Wfq0027PSp
	 0DBNjjO/g9xSZI+hIP/o4RVKowA+vqskkJCh3TctS9VEC9693ffTajySV31CsSXzjd
	 0eOWc5w9UYNeNlqMtsPMNAKi7ZgJY/uFYXGjEl6GroQcPH9eBp5Cv82/QEVrrsGJQb
	 bibT+KI4vZ9zQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e4ce6e3b8cso1180532a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 05:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjG71IcG5gJiFRQUj4FKYUi1ntvHULwhiNEiVvAXba537jQ95v0+kSs0TEMzhVENJ9jl1vd24Sk4/VfCBIsX77@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Z6Rgga2Ixck21ctnY22DC8QAaoTEgQIjdqcoeasWYuWkV2dJ
	wv7Qylwf4f9fKGyaivcbTVYSAvWOPH/woHhyIwyAr6IwrcfuALYD4IYti4AkjylwWDJhhqJqaXN
	ypK6Xg442Cqqxchbz4nPfvM8Jcw==
X-Google-Smtp-Source: AGHT+IGj+xYZZsPz4jo/iFpv6TDQ/flAGSh5fwxEf3UPQtG9b2FsLgBktltZesQa3BHxfQan3/3TV66VU1r+mDDfBHM=
X-Received: by 2002:a05:6402:5113:b0:5e4:d27a:d868 with SMTP id
 4fb4d7f45d1cf-5e5c1a6463bmr3852917a12.0.1741268411865; Thu, 06 Mar 2025
 05:40:11 -0800 (PST)
MIME-Version: 1.0
References: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250306085849.32852-1-krzysztof.kozlowski@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 6 Mar 2025 07:39:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKODHZcrpqskA2aeK6EqGNx9aGNuPqGzhcZ_Nqiu+Ccww@mail.gmail.com>
X-Gm-Features: AQ5f1Jqm2v42Q6wtTkhP_amcTxbY2Gmov9aAKcbCh_hPzmOQ2Z0TQ2BFM2Dah1A
Message-ID: <CAL_JsqKODHZcrpqskA2aeK6EqGNx9aGNuPqGzhcZ_Nqiu+Ccww@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: samsung,exynos4210-srom:
 Enforce child props
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_054014_593237_3A3750FB 
X-CRM114-Status: GOOD (  15.15  )
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

On Thu, Mar 6, 2025 at 2:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Samsung Exynos SROM peripheral properties were moved from the device
> schema to separate "peripheral-props" schema for child node, but the
> device schema does not reference the new one.
>
> Reference the peripheral-props schema so the child nodes will be
> properly validated from the device schema.
>
> Fixes: 67bf606fcf18 ("dt-bindings: memory-controllers: samsung,exynos4210=
-srom: Split out child node properties")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Fix for Rob's tree.
> ---
>  .../devicetree/bindings/memory-controllers/exynos-srom.yaml      | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos-=
srom.yaml b/Documentation/devicetree/bindings/memory-controllers/exynos-sro=
m.yaml
> index 2267c5107d60..1578514ec58d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/exynos-srom.ya=
ml
> +++ b/Documentation/devicetree/bindings/memory-controllers/exynos-srom.ya=
ml
> @@ -38,6 +38,7 @@ properties:
>  patternProperties:
>    "^.*@[0-3],[a-f0-9]+$":
>      type: object
> +    $ref: mc-peripheral-props.yaml#

Why do we need this? Any child node should have a schema which needs
to include mc-peripheral-props.yaml if any properties from it can be
used.

Rob

