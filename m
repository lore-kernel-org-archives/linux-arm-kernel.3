Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E667D3B7D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc2JaiF8YDuWbd1/5kQ+QwF9rEqB4RzFSqHFAqyBPiM=; b=rvtHVqmDzLPsYMIR+Klho3qYmB
	9+UQniZTWpjRNjxZhTuWcwWkMwYL10q7oxJ6u+fZm1bd+fV2GjHTNfg8UWVWxO18uj0orxM3RxftS
	CWevCNa37zwV0fRLw1FC6lRMW/yPNz5fwcgaLsSrbDwo6Ys0jQHJOoyVwbLAHOu001ygMExmK6oVl
	W++9OcYH8dnLcPFksjm+iSJs5143RcFG4hwlQ54WWWwbTmKpLcZHWRmfqMcIMZeMVYpwsN9aQBeB0
	c3qPiiOwfpLq0JCwmajKvot9Zpo0MKztjtQ4/xMkjgqzJFfKHLsFbCnyxx/fjetKFh4BMc1sgjmDD
	kQRXKQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRq1M-0000000AqHa-25nd;
	Sat, 06 Dec 2025 11:00:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRq1J-0000000AqH4-2sb2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 11:00:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so33338905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 03:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765018808; x=1765623608; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kc2JaiF8YDuWbd1/5kQ+QwF9rEqB4RzFSqHFAqyBPiM=;
        b=DB7GPrj6EXg6nfe+wm7/QlqirzAWkigT4bDyNFvXr2aO0OhamH23TzYtFiBkPXrrh3
         nRsDI/QGsrtFnQvE5872RfhsPMaOKedEmHOBpajQb19lpSM+veAzepCJI5+HmbdjWNOa
         HbkKLOJycV1TzmDEx3XW5SJmCGXbQGBq06LeFbBJzQ+7Oqk1Iiwx/MjY5Wh3HJGfPKpD
         e4VKlZOpe7mvnPJY5MBlUOJUjdsqgP5SZHPzpZPyAgwXYi/cMXi4Rnyue4itQAGsTYgr
         kGzAI1efGkpTdNPVfDqRaLn9cA5bxQlxLknoiZgDeKUHaihiNvYjy8yukW7xN8Sr2Y+H
         MkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765018808; x=1765623608;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kc2JaiF8YDuWbd1/5kQ+QwF9rEqB4RzFSqHFAqyBPiM=;
        b=uEb2MiTzsMn+mJZLt7DFgCRx16xYkP55NG5HQjSWFi7vm0NC76dWVlNHHvPD9Ckesj
         xzlaYzvKbXgi7ZmNtmUL0PbmbWppwnnHnjnIEtU8N6cwC7awOik5wEtUAJ32Pmk6pxJn
         fgq7X0GEUDZvAJb47Z4W2e0RPs9YP4+RI4bpBgy4TZzT/NDsnr+FOMoCpnQgxBiK2YE+
         mA0jMsFZv1ifsjID6essAcOKOTTdbLaX/NvcprmGyZYkIFMXNs9JriCiYAs00gXZYula
         1YqPtQ7v8ON3Li/QBp2wiYrK4c6TAfhRZsOWGQmCgPGXeB4r4QZZn8/YSSNdZO7Obai5
         z5mA==
X-Forwarded-Encrypted: i=1; AJvYcCXkv/bSD8xPIAa8T+SIEg8bzPm8ikkmlDLVPTpr4dkObkcNfxstOzDBGJq5VwgolGj0/0nTtGFRRO2C2mjlHQlZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwGkrzEMYYu1qauL6B8Mu+kZzGAS+R/St+tvgW34e1lCDMDb4yg
	yQuYGaaTe49+KOmJk8Y75n++B+F0GumipzU+NR4A5jg5SZd5tSsM6Fbo+b4t5et+liI=
X-Gm-Gg: ASbGnctBAIokoXtIjPc3T51N/4pibTp9E1bwIQnjK6pJdVtd0zzT747KDIBWj2a8FxY
	V0WnhuXXNZH7AizGpqzfJjhwjbpsGL1cUwrIrphuDbdEE5rIuXIcZh9lZAHaPvEcy19f/4XRs77
	rQrZba2rDVR54SyXYRihB7orcAt00lkhL9BZIbMOivsYA9CsZHAb3rTuznvfJluW6Pc5/Fd25Js
	G4A0F6Fs8DjvZfBMvlrMXvccYZm4YLm6H3cZgJpWYS41n5yUYd+jD1/ues3npEmKDkss+yFbnOM
	yitoiRFjvIeykO2AhaiYXHxw5NZP9xYzvLh7zVLagGSMcb0rhQA8HiVafwWW55nm4foq6eAVNgm
	uwV6EjpYCpA1fN8THMFMgMA4F456iUVweDXKtTt96nvxsWEfjL+5JdG4nhR17w1ncoiOeKiioOv
	XdIsp4vjiWRMeZtXMnoBg=
X-Google-Smtp-Source: AGHT+IHg5GdDTYGQOEHD3cwRfpUfOQHlfr14pGaL0IqRsshKFqaVNowhZrK6AXN53S2hvgP3GnnKew==
X-Received: by 2002:a05:600c:6989:b0:477:9650:3175 with SMTP id 5b1f17b1804b1-47939c913d3mr24108895e9.0.1765018807726;
        Sat, 06 Dec 2025 03:00:07 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311e7142sm133083685e9.11.2025.12.06.03.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:00:07 -0800 (PST)
Message-ID: <190349af-77c5-45e3-beb3-d6f82ce1987f@tuxon.dev>
Date: Sat, 6 Dec 2025 13:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: at91: add lan966 pcb8385 board
To: Horatiu Vultur <horatiu.vultur@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, wsa+renesas@sang-engineering.com,
 romain.sioen@microchip.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251201082629.2326339-1-horatiu.vultur@microchip.com>
 <20251201082629.2326339-2-horatiu.vultur@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251201082629.2326339-2-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_030009_745886_16D4CC1B 
X-CRM114-Status: GOOD (  10.86  )
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



On 12/1/25 10:26, Horatiu Vultur wrote:
> Add documentation for Microchip LAN9668 PCB8385
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 3a34b7a2e8d4e..68d306d17c2a1 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -235,9 +235,11 @@ properties:
>            - const: microchip,lan9662
>            - const: microchip,lan966
>  
> -      - description: Microchip LAN9668 PCB8290 Evaluation Board.
> +      - description: Microchip LAN9668 Evaluation Board.
>          items:
> -          - const: microchip,lan9668-pcb8290
> +          - enum:
> +              - microchip,lan9668-pcb8290
> +              - microchip,lan9668-pcb8385
>            - const: microchip,lan9668
>            - const: microchip,lan966
>  


