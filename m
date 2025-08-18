Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A444CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpNFY2zr1VsygjGbzhz+uBinN58GcwWHwnpY7MGqkVs=; b=Hr+e0ivBjT3BXEzU9Z6t4kBuS1
	9LbOIOkiVvC8Td4Fnb9HaywzD5310tL7KPnZmV5iZS7OsAyqkubUEhUVhOm6OaS7i9k6sF15JyP+E
	EulcMJIEQGhX1L7q+VJNrKSciza/s0XWBbcbkx5864tilcgFE8YIvQBLLMDu4O8FyVbrrPZYneP1c
	1HEHPHATvfIQyCUlXvOhQYk8+htoZIjQ40AMtEVqUPGORl/Yn0iiBUXddNS1kyOE3KiuPl3XjE5b1
	WCguVrfkVKUd1cTcoibushptJlVDQaGKychj3ETNtPb4Zu62S3vJgODy0CV+le9kxEOlc2HOFRlpB
	FJFfGl4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4s6-00000008ONQ-171N;
	Mon, 18 Aug 2025 18:46:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4Wq-00000008KBi-21jQ;
	Mon, 18 Aug 2025 18:24:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7af30a5so733945066b.3;
        Mon, 18 Aug 2025 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755541459; x=1756146259; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mpNFY2zr1VsygjGbzhz+uBinN58GcwWHwnpY7MGqkVs=;
        b=mqQMZHk3/UVxsQfa+dO4+WNf/efYPzm2GKXSEfZHpUvsjYo0gZzK31T3RhgaE685t5
         PHhTgenfUitxKigPx9iZWoBwfpfFMqKuARAZ29prCbGC34BppVj8iS045em5KB/3vd+k
         KL5lYn7HAvNQ2e+EAcXMMB8MgXZb44moGeEsdwG6MHv+aH/dI54ZGMvZCtAYBlkJMCWH
         ICT5TKxSSkrwgP7L6zfpbODh/H4vhzmmjGIVRtaQbGNzWyqulfzExxQX+ONnjILacgZf
         Pb+FlDQ0PJNKw/W91Z56nxZ8/gX9qhiVRhx0RQYjeIkkh29zI/VuJMcLTtD5vIF4dnet
         DDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755541459; x=1756146259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mpNFY2zr1VsygjGbzhz+uBinN58GcwWHwnpY7MGqkVs=;
        b=hPfgkSnO9r8T5bu4MQBuQzb9KSOQ+CgD98xEwIRfvXYkVk/X7FQgathlI0kW6lrW3r
         z3EW0bKLrUivDk4N4mhoRocvP5OUwGhQqJiNCTbhdGE2ZaMru5CSh7tDJH+xTaBT57xb
         hKsRbMvfOdtc5+g0JofReu0FXEz+n+sGkRhPZ1ffyBc9AvEDpyJxkBKUNqO2ZUDwATVK
         y2e0Iv9oo7106Wjs3OanIynIGbDlZ+Rx5Y2EP6bqtMpicXRgEpPlKAH3vrQLjJyZF+Uz
         SjU17T2NP6go/ffXPDTwrLBc8d+O5dHUXyIwso5WcKKE3LDXS5dNjaKIM18vT9x6Rs6x
         0bow==
X-Forwarded-Encrypted: i=1; AJvYcCVy/U/T6zM4drcLtpWyvyzYSJcU44FW9+dh6Em0K9Yt/oUbdqQt7oB1eWaPdAs4hzlM0rH3HHlQB0eoaU90y2m2@lists.infradead.org, AJvYcCXcXbOZpbOgwJyxb0bG4npbMwi6Vy11bavcKskVeFMh6T3pmO3x0hKP/VmVAN0Zfqn9YJXQM27EhEMdi0kjCvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxASmAjOsmHp9N3klZSwBnc9xc6W1y+dqruV/tpzW9lZS/TV4FT
	Z6Nzm22/ePuIjYKEuEgaeC0U4Qh7A5njpOFNIVV8IgDgJkysibB4GtQ=
X-Gm-Gg: ASbGncsLjosBWkbdOWIOdHFTUA5+pxMWMHXA7+Y6J4NAZZTipb2YeJxObugqcItddPP
	vQLRi7veTC5/4Bj2UC8iAOTzSzfdxW6kTkQixK0m6hgBqEgTxR0iPdGV8CPJvPpXu0FZXVAb+Py
	X2xWF2OAN+k7d5RrgUAXK6L/VGtYlnyvC0yY5OIdf1ANkjA93UvPrlK6xTfx+vq2JMTBAaX1JuM
	h/a1EAXfcCqRBOd04infEVtME51MiAxthPThyaasr33ufIstn5HY28bCQS2m2bwTo+uC3dMlFHD
	JYo9i6N2irQRg7RECnue5O101s7Fj+oqsb/bIthkLMLeWt4D92A4BcNsxgO2sJ/FRDlWC5ETrOj
	Fo5amPaZuVri4/Dmf2gvRRIq0duTFLzR/aRvhYuvmMB3VtYMzS7UZLrxrMHNYxC6KQe0W
X-Google-Smtp-Source: AGHT+IEP3Kjp2u2J+yPrgUCMTkqSRo7LZ5tDQMH0zZ3JdCM3es1AYojWLj3afepK7WSFanZwbTQU7g==
X-Received: by 2002:a17:906:f5aa:b0:af9:71fc:726 with SMTP id a640c23a62f3a-afdd98e33c4mr44524866b.17.1755541458156;
        Mon, 18 Aug 2025 11:24:18 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:beb0:cc44:a532:3452? ([2a02:810b:f13:8500:beb0:cc44:a532:3452])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcea0ebdsm851063466b.56.2025.08.18.11.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:24:17 -0700 (PDT)
Message-ID: <5593866a-29b2-431b-891b-c15cb2da8361@gmail.com>
Date: Mon, 18 Aug 2025 20:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Fix Bluetooth interrupts flag
 on Neardi LBA3368
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Hsun Lai <i@chainsx.cn>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable+noautosel@kernel.org
References: <20250818090445.28112-3-krzysztof.kozlowski@linaro.org>
 <20250818090445.28112-4-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250818090445.28112-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_112420_544317_280F8772 
X-CRM114-Status: GOOD (  16.81  )
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


Am 18.08.25 um 11:04 schrieb Krzysztof Kozlowski:
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning: GPIO_ACTIVE_HIGH = 0 = IRQ_TYPE_NONE.
>
> Correct the interrupt flags, assuming the author of the code wanted same
> logical behavior behind the name "ACTIVE_xxx", this is:
>    ACTIVE_HIGH  => IRQ_TYPE_LEVEL_HIGH
>
> Fixes: 7b4a8097e58b ("arm64: dts: rockchip: Add Neardi LBA3368 board")
> Cc: <stable+noautosel@kernel.org> # Needs testing, because actual level is just a guess
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Please kindly test... Not cc-ing stable on purpose, because this might
> have impact, so needs actual testing.

Tested-By: Alex Bee <knaerzche@gmail.com>

Thanks,

Alex

> ---
>   arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
> index b99bb0a5f900..b9801a691b48 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts
> @@ -609,7 +609,7 @@ &uart0 {
>   
>   	bluetooth {
>   		compatible = "brcm,bcm4345c5";
> -		interrupts-extended = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
> +		interrupts-extended = <&gpio3 RK_PA7 IRQ_TYPE_LEVEL_HIGH>;
>   		interrupt-names = "host-wakeup";
>   		clocks = <&rk808 RK808_CLKOUT1>;
>   		clock-names = "lpo";

