Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833ACE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDrWR7h2raxJC/jFcGE7XFAhit/WhKwllzn4v6e25aw=; b=GuD+UeMXeR9AA+yS/4J2ubG/Z+
	+iKcN/JBpuAAqWqf5PWQO3EVM0jdS8V9I1eFa57LcuvzyZl+cTe7xh8U9Jl5puZWAG1olwwqJKqIC
	YUdegxQ61pHsmWKE4EqmSS7ic5dmRp4XxQfC8OZgL+Fr3ClWd3FaweKO9+czwBeFLJXu8vODfaiL7
	4zrGMUG050tKvruiErI/t6ZzVzLHTC81k8RWLZIdPgxdJqDQAL49foN6r+BfDVRdeYza2t6F6MW81
	bXYe6paPWnIiZd8dPc/Kjo8oRxqQv0ga3zAMfr4gLsbH+y3/O22dIy5h3so3TS2iyAH9Eql5MvuRP
	fjbKftYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoft-0000000BJyQ-0q64;
	Thu, 09 Jan 2025 09:17:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoY4-0000000BHba-2G2g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:09:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3862f32a33eso280166f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 01:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413791; x=1737018591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDrWR7h2raxJC/jFcGE7XFAhit/WhKwllzn4v6e25aw=;
        b=W4rJjWNz39/plurEp5uX7WMd7wxaGBkoB2YOBCyX/rV6AVnhjPkYWprRXwHrkjXapJ
         YBybU6cklWYbtV2Ha8XUB51bV2FSRAbYcaGMyDGOoNMYnV/2es6T7U6Tq9HUogr/r/qx
         stXRtMQYTqv5WQfQMZuqQp4aMITpVHGjRJSWbeA83i6jjp4oQ9zEsNvJGh2fp4bCec3B
         APWKQ89PqnxvmLIcZgg0TtGITUH8vyj7t4QQlchwfzEW6FA7TCQ79PudLGENA8y37is8
         9RZij09jjLpRRlf23mkA94s3u5WY5XGROIFdiIg0tBhe21zShiioxueBe0nwAfKw7iMA
         N7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413791; x=1737018591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDrWR7h2raxJC/jFcGE7XFAhit/WhKwllzn4v6e25aw=;
        b=P+iGJ0+gdICIEcJBIt835NQPWyb9SxSnzouf92vyS+kfFYohuN5yRy7J1Iwm5t0lqa
         YYOjupH0ID/IdxoNv/SI+zhMcpSVx/0yUvPIWC91q//UBqkpU2s3tUioMFCrZIAZ3wg7
         ucUYLgT5fTcKWlOsFqCNRh47JCus5iWBbeOE2VfEyTOZnGVuDY8hbzIwHhuWvwxNN+oa
         1HVInk/sioAXRZnPXaDixwoH5/kxZgzb1F4RpLWqoU+9aJC4DSst6A5I8PWQ1tf7Nahi
         HhV668whlvAAgqKkIyKDgTL751xT67tq2KW3STSlU6T5kh/gPWLBshVwaYTdiu3mrNXZ
         eNNg==
X-Forwarded-Encrypted: i=1; AJvYcCWRBG8yhMLR+XPyJQMKIfD62Pva0WJNjhezc/7D0Hya2lScWr177czhWWq6BekP6LyGqsIzwS0bMrafDfGJY8vs@lists.infradead.org
X-Gm-Message-State: AOJu0YyptjXOPMQ1ivqJjhLwOLJsmtMuMQguw+9//Lw6xDndxKUnkYaW
	vfD778HqPeHUCkNgIAmgjwofDdhdoaskeOzRHHJmCz/VSa07wveyQfSmxV9ebAA=
X-Gm-Gg: ASbGncu5CRU7thaCPN61Sp2AKJN+aRCnMVIxlb/jf0tXK9x0OHWdAhZ0A3K0mu39E/N
	WpUYWd9O6DpkC3GSien3hUxjwwzR+kw8oClvZb1ADxeGLLEn1zWIx6+5UCDNnuql7X/6dGlsZ2P
	EVi2LOHPdqfs2euaCZjVs29Ki89LRLNNjH7eDrQX/TNyT2w6IMCVfOa4o8HOkqYjuVxm7IrgAXx
	tMLBmSvJtHvZ3aJydLgFvXQjBbbAiNfUjMWWoB2eKK1s8ATeZKV/+H0i4BuOpXlEw==
X-Google-Smtp-Source: AGHT+IGRJU00RisG9i0trOMKvJFYFliD2nOh14yfkZLJb8Z2MdvVwSvtyYD5ZhP9DVJTYxjtT/tgUQ==
X-Received: by 2002:a05:6000:2cf:b0:385:e961:6589 with SMTP id ffacd0b85a97d-38a87303d73mr5153466f8f.20.1736413790761;
        Thu, 09 Jan 2025 01:09:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d447sm1227370f8f.4.2025.01.09.01.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:09:50 -0800 (PST)
Message-ID: <36471228-4383-4b01-bbe2-0ec490617f6c@tuxon.dev>
Date: Thu, 9 Jan 2025 11:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: at91-pio4: add
 microchip,sama7d65-pinctrl
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
 <20250107160850.120537-4-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-4-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010952_583117_D00C5C28 
X-CRM114-Status: GOOD (  14.26  )
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

Hi, Ryan,

On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add pinctrl bindings for microchip sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> index 774c3c269c40..4b9f3373503d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt
> @@ -6,7 +6,8 @@ configure it.
>  Required properties:
>  - compatible:
>  	"atmel,sama5d2-pinctrl"
> -	"microchip,sama7g5-pinctrl"
> +	 "microchip,sama7d65-pinctrl", "microchip,sama7g5-pinctrl"

Looks like you have one space in front of the line

> +	 "microchip,sama7g5-pinctrl"

Same here. And this change should not be needed.

>  - reg: base address and length of the PIO controller.
>  - interrupts: interrupt outputs from the controller, one for each bank.
>  - interrupt-controller: mark the device node as an interrupt controller.


