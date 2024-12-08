Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F850E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=; b=geDJZxOUlTBaVivxmqv14q7LOB
	/lzGjiKeFOBWt2G8+KtusLM90y1RjDBf4+Q4MP+PB+pdqrrZnEo8kKWXynLMeCN1BZ7ZYwUcjvQYZ
	dyejE1szQPXo77z9Z1I9OG0YZGYvGOj/HgJWFr1d/F+xRc9hjdohNaSF/XNpPQHt2Ww9wa1IGu//V
	kp9XZlloHzRYvEqha/FmF+d6rZ4fii92hOF7K7774uqUeavEG3AP9C56CrimUyg6okq/W2iVK2c5E
	oqqLY6lvLSMAPjfVYi8Y2lEO/YsYJEMqaKfcYHoXo+J4/E31VnVcdgPHassJzOW0BFjOLhjqQhC32
	WM9VVZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK56-00000005Xh3-25LV;
	Sun, 08 Dec 2024 16:24:28 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKK45-00000005XcN-0qj8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 16:23:26 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso560275a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 08:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675003; x=1734279803; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=;
        b=QBrVrfOfKYvkzqueLZ3PXKVooOstdznpv6WH8ttHDlSUmJkjaFfnKFeq+U7rpX/L0Y
         xrqWMRAPFnd0DuhV/ZJYDn+Mdu90MAHSREakAkmEmzdCWeaDTq1qc0wdL1p5U3mYjG/z
         YCPAB9ug7DyeRFFz6L7SvFy+pRo0NF02lA/MLw9QL65JO5Es13jw3Kn3b4lHe+7ME18q
         eJM47AGzE22mOeTKOCprtHajedw0FFYxn6+xvXe9Ly/RCgS98I6cjXZqMdtzVdHIvaZE
         hh/tE3mS4Q6ZNeXqS8jaZp8x83jji9LXvSzTfONdUm0UxkKKP3GA9HyVdHoo61kEuv6J
         WUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675003; x=1734279803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=;
        b=X/RC3Uq20BPg/PLg0GLIIVOFPpXSw4ZiHG15iVzGB3G4pxdJlyc48fQsluNDsROCPl
         Ra6DyPYDfaG8qWzCnWq3EA0qlpqUiykYxuo8gRxQAb0yaQWhENzPhefatP8fLfE8wybi
         gFuMiCEv7/Sd88I/xrNgvbiCS/sKDMmCS9JJc5jdmePrkne+iaqxXgVvGnDVbxCXLRH5
         k6HnsL4OIsKl9Kk/bodaOZZG1L2y4HDP+ZjTmQptW7Wv2S+LWoaMjqXZtYF7ro/ZjIIU
         Sz9i7jOSDeEhVg978ae1ipoIjuWuISqvlY6AqDeaIpitxCiFX/izW8hliVe5dZebHr/U
         2hfA==
X-Forwarded-Encrypted: i=1; AJvYcCW+w7sTRv/4gMWf+Ld2cN1k4P32aNcEsRGh1JmwtkZv1oK7ZiOHBlcYFI1S8zp3akr15+YEsuv/vX6xERAD7qsk@lists.infradead.org
X-Gm-Message-State: AOJu0YyeQ8Y/exzVLp3j2dRY0u6NEvybuSWwf7cgGASuexW7s9MVDB1q
	pqkJjn4obL8g6iy9kKjVkrp0c07B6OwlShQB6fxtWMu8f4+YQhVBDPzHPEi3Ih8=
X-Gm-Gg: ASbGncvbdb2tlPxsUy5WDJz09Lm23U/gzf/I7MqrcnZelhttLeZThdyaJ+m/NSDM3MC
	ehLNhOkfI0XPVryi3Qnjz2ppDaadNaVd1uREImmqKgqaV+/VuUQnEwPbZsJDS4l8DWMpChkPnu4
	qtxLNQyyXovaaZUh9ZdlKMIUkVC8NC5tEbEE94nZguNkJPu6WuxFV4zwsimVrrohfFxfLHwHAAE
	vmJgDxIa7mMYTbBDVoAWCTznGMAWEJ82QNeoKaE59az585As/turd3tgehd5ME=
X-Google-Smtp-Source: AGHT+IH86UBvGGnyAV0eg40dVkna/XfNJd8hDIG21j22U90IZW6G8d+OfAAcOP2EKLLK8RxyDrgbuA==
X-Received: by 2002:a50:8e1d:0:b0:5d3:d7ae:a893 with SMTP id 4fb4d7f45d1cf-5d3d7aea934mr5930138a12.25.1733675003295;
        Sun, 08 Dec 2024 08:23:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:23:22 -0800 (PST)
Message-ID: <40084072-8581-49b1-b0b8-e3c63dd39f3a@tuxon.dev>
Date: Sun, 8 Dec 2024 18:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: ARM: at91: Document Microchip
 SAMA7D65 Curiosity
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_082325_244635_EB0486E6 
X-CRM114-Status: GOOD (  10.78  )
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



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Document device tree binding of the Microchip SAMA7D65 Curiosity board.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 7160ec80ac1b..0ec29366e6c2 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -180,6 +180,13 @@ properties:
>            - const: atmel,sama5d4
>            - const: atmel,sama5
>  
> +      - description: Microchip SAMA7D65 Curiosity Board
> +        items:
> +          - const: microchip,sama7d65-curiosity
> +          - const: microchip,sama7d65
> +          - const: microchip,sama7d6
> +          - const: microchip,sama7
> +
>        - items:
>            - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
>            - const: microchip,sama7g5

