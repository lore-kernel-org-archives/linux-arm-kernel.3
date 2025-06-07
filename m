Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EFCC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiKPxyE+L/mL7ntMB6eAW2AGGkAO+xZvdmfN92Ddt1o=; b=vtF4XpcSnprruGvE6Yz2iuaNLT
	jKzdn1ILB7Xg0uL9ub1zf10q66xaPJ6FnLqAtIQLfXEVbqTxAQ46/HEyQOTmIQbYUEkTdbgyFXxIT
	3Zn2beKER5YwsHk+WAtWwSpDnauIOZPoB5Z5jCxIXwzHBuG0dUfEq3x3SuiRgb+FTLwKyMkOFlIOs
	ZhVF77dycvcoF62QjPeEia2GDG8ATgg+wI5WkrJcEU2n8D0bzcVf4xGLoSy1aDNSxBm8MuiCOEsCX
	jqo1jjbOKRsf4I1d/dF7dmn3PTYTCxpYT2wN+Za9bXS8OawnjcSzbz9yxm30y8rD4e4TTayztlv/8
	e2HJbaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrx4-00000001cIU-1ryD;
	Sat, 07 Jun 2025 11:43:06 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrus-00000001c3J-0J7I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:40:51 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad93ff9f714so501826466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296448; x=1749901248; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JiKPxyE+L/mL7ntMB6eAW2AGGkAO+xZvdmfN92Ddt1o=;
        b=P07ae9fFBhmL461wUFglprhB++PRdvqAC3gZnuSGRL/E4JQvfSyi/5mhk0xKXDDSbj
         N4gGPPDI3ycRAXPBVGJ+V1g+F69mjPwe2hP4ABI19T+tIH52gverD3cYM8h6qhxezsJ8
         F1WbDyado7pWyY4ETCejwghgjs9tnr5JEY3MQRU4x1CzCRGWjNZo6vTNgFAs4UaDYMJU
         erH6kQ6Fg648ezzXq6/HxcnH4e0DvpSX57j1fn9zwXsCaDAMF/SKPk+htUL/XDgxjZ8D
         K4fKdYpw3AQ9RRzopRpFjAOqxipJggRnsBmFcxNdjpCUaZLd4fN+gvg8marsNwCAQS40
         xc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296448; x=1749901248;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JiKPxyE+L/mL7ntMB6eAW2AGGkAO+xZvdmfN92Ddt1o=;
        b=YKm+5JnuoYCjYJOoR6ZAAQ7FlXmjNNqPLb9HhFCuZcOq6BhXNtsBaQn9SW46oQrMvQ
         VskSO5IyHHXWw52gverdlsSOqTLljXx71D40KlGGefa6twBVxSvQx125HIXOSjh5Uwn0
         i+XotZHV1ViIo9IYG9GMdublQAcWnwXynt6pUmTGSsOjQVh6TdweEWj/8f8sa0ZreXVx
         5i8ab9XW++Qit5KLX8EFvWq6UTG+xLLNN7QTwx0x3te7SdZrxWxztzaT7ncjyHEv2XXE
         5adUC7jusmZuDYPQLdYBkoYgZO/I1xA8Ap0AKXkEEpcGnaNNr4L25veiMmNfmuHwMBvF
         MWfA==
X-Forwarded-Encrypted: i=1; AJvYcCWkKHmVNkg8HlVA2569Pgo4H5ktEr082rc5wiPwhvlAGFPhPAA84HWL9X5P9Br6JCQM1nmpNu5kL6i3KgdOndMc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqnp6AfoTfsfgu3wnmKuPd1TFaY4vR5QnVuaThEf+/jyJZxTVH
	/heWWqeSXnZ61dXy+OOK1kMb+DCk1Wytj+lb7kKPKgKoKW5My+8ntFpIMc62nu58SJs=
X-Gm-Gg: ASbGnct/LOnTGv7bFRyMTzIaQbGw0pLbSnE5LfcjaCp3Q9EWqFcbA+u4rlOPubCjrGR
	MYalNt7y5vzwsMvo+bld5cQtIZajbcFJCn+4/Gy0n/clc/2/OX9gb1LMCvir16EaN8iU7Ef+UFa
	4jtNB4coJOSvuD6oW1g+mGAFZ2GNwLrHeerq6r4tCheSS2DiwbFU5HsvYQKbp2gPMLkEo3QiQOP
	kh7Qaru0wOWEAV4pM9aM0Vl21uoWg5c+45NXYNzbOGNS+sMQCeYUdplqjRJ1LPPh8Qm/P3pL5EU
	MIEVZRRtqItm/F7TTPuu52Y3BAmPKBmOcaLjD75WHdJJdMVvW7qK9xViknrqyCeH2bBKlFrp0gS
	VgR5M/w==
X-Google-Smtp-Source: AGHT+IFH+/W+aC/DziM0dgJNs2fwK23eiIJdn/dAFXAJM2ZH6flXjX0d+7niB19viLz/Kl7VwDI7TQ==
X-Received: by 2002:a17:906:ef0b:b0:acf:15d:2385 with SMTP id a640c23a62f3a-ade1a9fd850mr693582666b.16.1749296448424;
        Sat, 07 Jun 2025 04:40:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc7b3b6sm268238766b.173.2025.06.07.04.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:40:47 -0700 (PDT)
Message-ID: <f03c5c49-e890-428d-9c5c-649bad512170@tuxon.dev>
Date: Sat, 7 Jun 2025 14:40:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: crypto: add sama7d65 in Atmel AES
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a5509576e211bcf528e088f78e619575a26bbd8f.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_044050_120368_D5723522 
X-CRM114-Status: GOOD (  13.51  )
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

On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DT bindings for SAMA7D65 SoC in atmel AES.

Would be good to improve the description here, e.g., specify differences,
similarities b/w SAMA7D65 and SAM9X7 or SAM9G46. Same for other similar
patches in this series.

Thank you,
Claudiu

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> index 7dc0748444fd..1de4ee70a05f 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> @@ -15,7 +15,9 @@ properties:
>      oneOf:
>        - const: atmel,at91sam9g46-aes
>        - items:
> -          - const: microchip,sam9x7-aes
> +          - enum:
> +            - microchip,sam9x7-aes
> +            - microchip,sama7d65-aes
>            - const: atmel,at91sam9g46-aes
>  
>    reg:


