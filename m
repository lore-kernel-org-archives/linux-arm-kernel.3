Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8707D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NCh2RDJxN8hiZ1nJoik35Pfikr6nPePDpNs7w6splE=; b=Oy7NJerNcpv+Ub/pl48croofyg
	rIWxobAXGgOSrbfJzSBEG+2Y42WSk3DYYeFeU1mkoZaWB5wJrWazeWPIJB83oWGxIfNkc7BCnd2hR
	7mwcM2/6PZxtmkzl4EAnQZCLHVE0mrgxWZ0CgmkF6E3NvRK7KoGo4mVlJICv92CSCDiQaiDjIAN9J
	iuw1jmssagLihJEW96ex5ahzZ1pbT+MqL1D0PnI7NPrUUFSB+Etbpi9AYnSEoqWKZCKz9Lu3+Mt9J
	BsSYnWOrsBuv0CKBgL/U7tV7HtnBT73cBy2pANl3qiPQC3Jk0jelmigFij61oWkXYGv3FABdpSRsa
	3WMWrG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vew4E-00000004H18-0iY7;
	Sun, 11 Jan 2026 14:05:18 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vew4B-00000004H06-2JUf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:05:16 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so8664931a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768140314; x=1768745114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NCh2RDJxN8hiZ1nJoik35Pfikr6nPePDpNs7w6splE=;
        b=oA2oVoQvDlqYgLgpjWmZQcgO25aOe3dCd8v5Rga5T0cp0SXts0pw2itfEpTLJC9Qr9
         1awkEwzvUkCOty0yxByuzdLqvcUdNVR46D98YUbCDwNL4bVosHFquaAlzp6MCvTOjwsQ
         wEJlDGnfbCdF6gnwh65gOgIIhmzqSdfgYMM2fQBgXRgYfARQRNiPBUSFjoTVfFIyuTqf
         SKSHXOYMvqIcuOS7D/hQVRy3l0ZU0O/dWr3pMz6NkrAgLb5JWY5zSc1KFAZ8KtKhUlwm
         J3NrSC4wwKUrtk3p8KxKPWFf3d0xLXaMcJC4LBAg7HTkI9bgDOgst+p0n4G5BJlhBWQb
         +ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768140314; x=1768745114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NCh2RDJxN8hiZ1nJoik35Pfikr6nPePDpNs7w6splE=;
        b=wiTyX8AX6RE3edWz6awqvc7sAhFBgWVHeli+PQetFGJlwZ0CtF0n0E5k9FPQarK7is
         JX1LZe21sp2b8NX3WbtoPyYnYf89UnD6is55MR+ZFdBZHnt0wOR6YmfhUazAvBEUEBvY
         qerih5SGjNBdjj1azSlsYW7yJ+/U41/peX6bpMYJ6cvf2CRTBcUb5g4fgjSrXbdiUEGO
         QWQTwClm63YqU0ukyxovgVJWcAiOVJ1F0ufjGY5JPd0MjHjg4/WQfM/VLWQeLMY9EHn4
         EkDbkLatXVfslFBsuWp3pFz85asy5tr2M30ZxHsmYHXqZ2qJxwSoPuVjelvMTbqrB/Wo
         aQ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWipVNY9jRFysRKaT0mrb63Nxyp96npwwxQ1b5s4RgzrOgPIWqAY2oacz8qdFzFF3p8icHHsFk7h1t4k0ppsXKv@lists.infradead.org
X-Gm-Message-State: AOJu0YzoIg0JnLXK/qFVCaPGq22HhaBvMnkICEEX3OYckQW8sLFGQV04
	T9wjwfRLrxlf5t4wnDWIAlXafMRE+Q6FlyJs6gPVNvi5+epNzNrs8gb8mLtLkWl7/gs=
X-Gm-Gg: AY/fxX5JzWlCDS9hLxGVIL+WhHlgMfjRfG5Nk8MN0/DAgj9ZDMKunYyjzqtrvLnKupl
	8sECUGmcRRdZnl7Z4dMh4HiWJfhRaSKYZ6/b8ruYSxkf3+gcmKsxAs278TVAcZCSyr4aTz/itZv
	CZV3zWsPhchmDuDiZVYVsbPREsM6iIRcj6YGxBKERIWePC8dSWqxoJ8xu/Rh8SugxY32efN740s
	agM+b0aCakylf3rDZ2YL+ssU7cnwLxdkDp4x0LMIvq5QZjZeiyG1ddirAH3WSpK+E72zVlsGvh4
	jYdicx4NNlZJTBxm+WNqLNA7qZAqxRkR+zyAIum/3z9tEbmOOWIiIYMlkQ9Oje2lKJ4S5KPsc5U
	wosTEFkX8ORJHx5R5CZ5dkA0zjNdmXr7uw3Dyh6GZiskhWZBQrtfm1q5jfxjQzsdVEeLDZ4uuHj
	5ytpy0Esrc6G2YK1PZr3f1xkefRwPV9YqYPw==
X-Google-Smtp-Source: AGHT+IHX4kBq5in8WgxEwJr9XbVFlnt6AItwyKhU9py/NMR0woB2X72z7DmCdf3HQxhQaT3H7Zh1Jg==
X-Received: by 2002:a17:906:ef0b:b0:b84:365f:10b9 with SMTP id a640c23a62f3a-b844522a6cfmr1333268466b.29.1768140313496;
        Sun, 11 Jan 2026 06:05:13 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8709d11b90sm221829666b.12.2026.01.11.06.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:05:13 -0800 (PST)
Message-ID: <1658b580-cf63-4f57-be1f-0691cc4934c5@tuxon.dev>
Date: Sun, 11 Jan 2026 16:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/15] dt-bindings: rng: atmel,at91-trng: add
 microchip,lan9691-trng
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-7-robert.marko@sartura.hr>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251229184004.571837-7-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_060515_617417_781E585E 
X-CRM114-Status: GOOD (  10.83  )
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



On 12/29/25 20:37, Robert Marko wrote:
> Document Microchip LAN9696X TRNG compatible.

s/LAN9696X/LAN969X ?

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> Changes in v3:
> * Pick Acked-by from Conor
> 
>   Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> index f78614100ea8..3628251b8c51 100644
> --- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> +++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
> @@ -19,6 +19,7 @@ properties:
>             - microchip,sam9x60-trng
>         - items:
>             - enum:
> +              - microchip,lan9691-trng
>                 - microchip,sama7g5-trng
>             - const: atmel,at91sam9g45-trng
>         - items:


