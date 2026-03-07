Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E30FFC9EFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVhycCAQhjB5+p0XAMFhZeGMfvAqhDk5umDLeanGzsA=; b=MHnoDClHTFPD8sKT6iJ38fMOt0
	EA1XZ5WD/7G3Rv64xOQF2Gz2KbZAUXtJXMvrSxOD6dC7iZPzVy3kVoLIdRLXyB+oDJqPy2+ATw2yk
	h85nRQN0859cLmdCTBPufJiDGKTXxV1aBcDex2QciEI8YEmaJj/0jLCBjTGv5GBDi4E53ch6in4lD
	6BrCn/JwZVKo2u6JrN4nhHA3twCNnYc1J5PTJe8tNbRp3/TxwEmgv/DcJ3NhdLK9/x8vPWDzKakR6
	qdS/yQVW4NIc3GGvc4Dw+p8oz1cchN2xKy21Fn0a3iRGrp/1XVscsQ6hLst+7tGP73Wplfc8NlLhF
	NXpRVbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysgr-00000005GRv-46xA;
	Sat, 07 Mar 2026 14:31:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysgp-00000005GR0-37ah
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 14:31:36 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso7322185e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 06:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772893894; x=1773498694; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVhycCAQhjB5+p0XAMFhZeGMfvAqhDk5umDLeanGzsA=;
        b=AlclJpEBP4U+7xPn1RCONhThnZ4+A7Uk65hnrNb0twmNtIMkRjHGlwUPO4UHsbvL5l
         OO9ayJZ4Ga1e/9SP7ljRCCOByzzzf4xdKjLXigxLmSI8S2bQv/LXbrlwNWPazB7Pbs8G
         QZAJbayOKRRq/mZEapJqobvd6tj/tz59l9tLw/rKXl5Q9DkfCPiXpNCxHgHNR/O0Eb/o
         NbVCOmG8iMG8OgNWt31sYZWnM6oFgKx4XPFQ7a8krdNsBomuPSE9Eb+w0y1xEjs9htfI
         Yig1kAizjtK7tZKy3ZrrRhd1kH7p51n4cTGGCQfRkg8+dM/YW+hUGiEX4PwplWoX+v2/
         82OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772893894; x=1773498694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVhycCAQhjB5+p0XAMFhZeGMfvAqhDk5umDLeanGzsA=;
        b=umOd7Rci+r+k3fPWWFoM3Kt3DrUaW3Ma60HLtXTkSvUTcrgS9uvQpguPXm6ZycNX2t
         XqJnPhNPqqfhA1y8Ip428vFFR0WssyY3QoELsRx4P0tMzKsLuw4/HO11sVLJHj8bgLjQ
         N+anIHk0n+VJeuoWn0aba0+V0Uyes1IwXswsz/ltfl9nRAfrfzOEQBtaB05OfLEGuYkI
         ErhdlgQsRF9ntulFHjTeC9B5LKTjosexVOMXdcxM4TVVEW69bYNJQIsy4rJIzAOHNp9o
         74XZdHQJtK6crtDpL8qVTSiA20yOKGU9NTAbWc94BlIZx4spxSWfjfce3I9BwbTJ5zYy
         5KGw==
X-Forwarded-Encrypted: i=1; AJvYcCVfHinPHARpNpCqmhQjGEzW8Ba3gsi2IO36v5w7+lNC7To3WHyrFKt2Li3mcv2nDN1MLMkdQUf4zGjs3uxNEwEy@lists.infradead.org
X-Gm-Message-State: AOJu0YzzHcv2tr2qHgGWKDFEzWU/dLiRgAouDnOP+YO7HbnWkNU5XjZP
	eLfcAiD/sp+pcqo57e+DVHFwlJOFlx+3Hys0Jvi9GnNWvl9DcyQn8TLwUItH135qBWk=
X-Gm-Gg: ATEYQzxv/aXzIPhXCuLbFavAcgmYqDhUx0bF7TEMyxOSVs4b2jYiIMaRmCIZJl3KeEn
	Sxbmzt4wq/jsd3YQh5yu5zbrKtbnAxVXZcL4yAY4Suavs0ipdXLxY3tcfR10LO24yOQjG+ynktH
	bL+Jjquf1ipKZixVimoebXntUbduKIFoquwEoxP1mOMAuHRUwCapfTfMYjmTHvj7QUMzdz05WyM
	7WTDINBwHnwuYRvTQRscEp64q1k7jjdh9dy8Ukd0xJaMrssYG5KZl0SfnppdWxhlLQbR1WJn+Tt
	2fzDTza+SDbFjYt9yRdCBbYfq19P8PG84GSKNonmh+kUSjqZhJBgAZysoSQwDlYI1/4Bnmk6KoS
	Pfn3hYBcOd0UYb+qERfugsRMexJH2/WhxAwZfg1jL7d/fG9Mw37LGAuih8YfgILWfMDNbTFyuXn
	kRgltdxbBdVgQLNjLQsgd0liLaabxT6g==
X-Received: by 2002:a05:600c:8b0d:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-48526984289mr91782915e9.34.1772893893631;
        Sat, 07 Mar 2026 06:31:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485246fd237sm77122865e9.7.2026.03.07.06.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 06:31:33 -0800 (PST)
Message-ID: <aacb74f1-5d4a-4ed1-92fe-0c5536691274@tuxon.dev>
Date: Sat, 7 Mar 2026 16:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: arm: microchip,sam9x60-pit64b :
 convert to DT schema
To: Akhila YS <akhilayalmati@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260227-arm-microchip-v4-0-7e2ae1c5b5d6@gmail.com>
 <20260227-arm-microchip-v4-3-7e2ae1c5b5d6@gmail.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227-arm-microchip-v4-3-7e2ae1c5b5d6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_063135_802314_3BC103C3 
X-CRM114-Status: GOOD (  17.08  )
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



On 2/27/26 17:14, Akhila YS wrote:
> Convert Atmel Periodic interval timer of 64bit (PIT64b) binding to YAML
> format.
> Changes during conversion:
> - Add missing compatible "microchip,sama7g5-pit64b" along with a fallback
> compatible "microchip,sam9x60-pit64b".
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>   .../devicetree/bindings/arm/atmel-sysregs.txt      |  8 ---
>   .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 ++++++++++++++++++++++
>   2 files changed, 68 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> index 70059f66f2b4..d0561f7f465c 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> +++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
> @@ -1,13 +1,5 @@
>   Atmel system registers
>   
> -PIT64B Timer required properties:
> -- compatible: Should be "microchip,sam9x60-pit64b" or
> -			"microchip,sam9x7-pit64b", "microchip,sam9x60-pit64b"
> -			"microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b"
> -- reg: Should contain registers location and length
> -- interrupts: Should contain interrupt for PIT64B timer
> -- clocks: Should contain the available clock sources for PIT64B timer.
> -
>   System Timer (ST) required properties:
>   - compatible: Should be "atmel,at91rm9200-st", "syscon", "simple-mfd"
>   - reg: Should contain registers location and length
> diff --git a/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
> new file mode 100644
> index 000000000000..f00ac7e858d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/microchip,sam9x60-pit64b.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/microchip,sam9x60-pit64b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PIT64B 64-bit Periodic Interval Timer
> +
> +maintainers:
> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
> +  - Claudiu Beznea <claudiu.beznea@tuxon.dev>
> +
> +description:
> +  The Microchip PIT64B is a 64-bit periodic interval timer used in
> +  several modern Microchip ARM SoCs including SAM9X60, SAM9X7 and
> +  SAMA7D65 families. It provides extended timing range, flexible
> +  clock selection and supports both periodic and one-shot interrupt
> +  generation modes.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: microchip,sam9x60-pit64b
> +      - items:
> +          - enum:
> +              - microchip,sama7d65-pit64b
> +              - microchip,sama7g5-pit64b
> +              - microchip,sam9x7-pit64b

Same here, I'll adjust this list to be alphanumerically sorted, thus, 
microchip,sam9x7-pit64b first. Other than that:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


