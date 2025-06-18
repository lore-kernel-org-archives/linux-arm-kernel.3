Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8315C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YBYuQYbzLC80oZvh7S2m5LwCzlb8lJZIkclLoGPtU8=; b=QGVmQqdwhqySS6AC6izUCC3f2u
	I7r3E7hX6uX9EYTk5sBcTl1RotwO63Z6UGyGQNB5Re0O6Q4vLUNB+xkzW5TApQsqv0HA36D2QzrA+
	7FqHPFFTbtpozyVeiL4tIL8IW+HbVLtXHHs/qxA5HlNCL9GwxiMQMCcLMf//e4POyejoLLkjXDDC7
	+iof3210EI9MYuJe4KdR+qAY1NS4rWV82lovHohfTkWE+hgMY8wc7oBdJJaxaK/3TXQby6qjMIAwW
	MdbIMscuyaNS9na649IGwHG5k5sZuoWW6tFsTnsXiqFarmDNK8/Ol62P5AYt/qXx5b1+GY79Mi5wD
	5hdfy12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyE7-0000000BBpH-0fuF;
	Wed, 18 Jun 2025 19:13:39 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxVZ-0000000B4eg-2tH6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 18:27:39 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-40669fd81b5so4374607b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750271256; x=1750876056; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YBYuQYbzLC80oZvh7S2m5LwCzlb8lJZIkclLoGPtU8=;
        b=E2Rlo9XVMxHJ1/805M5E7GsisNYqfix7ZmsEIowcj8NxmZrrlvvXAK8HnO4AJTnjlb
         Lvd2xeY1Z73NVPdJc1o4LpJBFnG8K+h/u/V1cd2kqRvsstKbHGIL0XV1Y6mVsVApmdl/
         j8y6MlioI8Qvr3XkHVVO4JZ00gSt+CNNWCUBpHz//v5Y88JB6Zsx2ICI56WCMV3cr5a7
         5ZYea2NdZmIlWZVJqds98FcVUByZ+ny/nFwz0PsWegzcTbwcAJ6jbDHtoyyZ5gwUhAyR
         OIKPNAWYTv3Fu59vSRVZOUt2gIXFPShZQuWXQdHhKbvEoBb6+KCKnHhw8bjv8FuOP7Mf
         2zTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750271256; x=1750876056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YBYuQYbzLC80oZvh7S2m5LwCzlb8lJZIkclLoGPtU8=;
        b=ibqRcfZNAvgc39Bjt4qhpD72WFCq5B61T0LNApQwRRBwa5nfa+bzvDB+lE0JlxdxLq
         ZiPr7ziLh7zogVMjH7deC4UA9dfMI1ljP/0DpWC/0VewzZhlNtCUPxU9Cwz2QzSi9LSQ
         kixAsB8RhIFpihBMWLv9zRtrScAlJ8J2uuVO6ewPBH0JDmFykV7re8EdBZP/S77j+QTR
         1G4p2NBtl4/we6olIkmxCNADk2DU+muRCdxl/a4MuCXegkCHKMtdU31Nx5sFfMesTOgp
         HQZnTdx3pVa/v9nCWRn8nmus1kcNVQKxUkBzzULhlgf1VcbIG8gS4X7IR0HlvQdBokAr
         e7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWshJ5b9/GeevOZah2kZsumuV6ILaxVkViRulIYvjgNb46lUKM650HmKU/ZbZSbz917JIuK6PTJFYeDWqCbx4sN@lists.infradead.org
X-Gm-Message-State: AOJu0YyDSmWZYoRQZqShBJkGtzskp18CauwolSkmRLbjhib96HRbThu6
	myK7TSurAoKsR7BKXK5WFjxgn8aXRO+6y/o8R3X3YzI4NToNJ9OQsHjr/mYR36A1dHI=
X-Gm-Gg: ASbGnctVgIB2NvRzuCUOysWiqWAmMGY66Sxhe1jJvEjbTK6oLvgTQnif4YvQSN/GPFL
	IVyWdKMyXB2NQC5YuN6Kn4NV7O3v8+voCsBwD5WAQfYWJS4OXYFMoTUNT2suKMA2r5P26tchb1B
	CLBpWQPsJr7cxINBWaOub5zdWwT5Y1w1fjAfF+gPtgdbCfd3LPtX1zhD9h7+u0+MmI/UhJj+FzR
	6lvZRAaXdSaBlN4QLjP2U+5xjS9ruw5Ze6TsOJ+etThfsWzgSubZpgKWN0HKIlmLue4l45vTnZo
	j2ZBuW8c50ldGoId58VfJMMSBePhFrP1D1KqPSI7TzkioSgAwNopeuy5jYcoB5xGZI/34gpzSbb
	Yme/jIxuoziQeHJf/hXNR35IUHYDloId2PS7bQcs=
X-Google-Smtp-Source: AGHT+IGfYT6pTX84G34dN1v1rA2QrNVoZ5Qci8skHuTcu6xXSLE5XMAg/YdsULkFqRm5674RrJMxag==
X-Received: by 2002:a05:6808:13c7:b0:403:3fb7:3870 with SMTP id 5614622812f47-40a7c1cbe28mr10969858b6e.10.1750271256246;
        Wed, 18 Jun 2025 11:27:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740c2748sm2437844b6e.18.2025.06.18.11.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 11:27:35 -0700 (PDT)
Message-ID: <2588bb7f-2a3a-4001-ab1b-6d9bd57b545b@baylibre.com>
Date: Wed, 18 Jun 2025 13:27:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual
 upper/lower bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-3-sean.anderson@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616220054.3968946-3-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_112737_731388_0CF781D7 
X-CRM114-Status: GOOD (  20.30  )
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

On 6/16/25 5:00 PM, Sean Anderson wrote:
> Add an example of the spi-buses property showcasing how to have devices
> on both the upper and lower buses.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - New
> 
>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> index 02cf1314367b..c6a57fbb9dcf 100644
> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml


In addition to changing the example, we could also extend the
spi-buses property for this controller since we know this controller
has 2 buses.

  properties:
    ...

    spi-buses:
      description: 0 is the "lower" bus, 1 is the "upper" bus
      maxItems: 2
      items:
        enum: [0, 1]

Not sure what to do about the default though since as discussed elsewhere,
this controller needs the default bus number to be the CS number for
backwards compatibility rather than `default: [0]` as is specified in the
previous patch.

I suppose we could leave default out of the generic binding and leave it
up to each individual controller to decide how to handle that.

> @@ -69,7 +69,7 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>  
> -      qspi: spi@ff0f0000 {
> +      qspi: spi-controller@ff0f0000 {

It seems more common to have spi@ rather than spi-controller@.
Is there a push to change this in general?

>          compatible = "xlnx,zynqmp-qspi-1.0";
>          clocks = <&zynqmp_clk 53>, <&zynqmp_clk 82>;
>          clock-names = "ref_clk", "pclk";

