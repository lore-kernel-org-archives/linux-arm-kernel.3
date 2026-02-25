Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100A7FD3765
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSnbwAQr8QFbf0n85PqQBBa2B0AcsRHkkzFtD84/ibw=; b=tsFk5M9zh3Mm6V2/GDoj40t07q
	1F4NkYbW0g1WpFzRiCPiLeydHiw8oX3F9Snd+Q5vUb++RMO5ta/g5KYksdc7Te01we2k44wnxsi7C
	nB+zKN3PJU3rhLtvMZvcmD/Q7W1sH4soaOtnr1LXFixIJbNlwu/v8l8izTgpHZJnLLlkAQsMSHzcO
	uCLAW09hf++7KJtPLBpPu14s6bki2GLHQrpJjsH5Hnhx9EZy5W7TLgJAEBPlBLa8SqQL6rltKJV89
	umIcx5zlZqz4MsN7CoWrHSsshNjtJktGGHlWUdZ5yeczxri7fvMRcO4BBpmv4Bdz3LfDDIt6Fxso/
	0mbgOswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGXY-00000004Fwf-2th8;
	Wed, 25 Feb 2026 15:11:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvGXU-00000004Fvd-3Dtd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 15:11:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2adec255754so588495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 07:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772032260; x=1772637060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zSnbwAQr8QFbf0n85PqQBBa2B0AcsRHkkzFtD84/ibw=;
        b=PuyC9HjsMXNy/0TOrZECmkpu0ir+wZ3yFY0EOWb4YDu+ZGipM5xPxvKILJcIxOqxri
         zYLrvr1RajRJoLoPqcbOwAAn88fuqdE1hi1SKCRSZP9bfKtlx18wixNnl6vZ68d8aHNX
         a9fjkU7sVMFZ5KWR8FL9AN5XbM2Q7XuVTqilCoQCySmi5yXu+Q1A0YvZyELhPYpNwVBZ
         yibUdq+duqT4TPa5va83zr9zCQF6xNmbV5wdDK8AU3aaM3isuymlAdoNl53n01P8p5Bv
         6jxCkwTL+3MRbZyQFydU9pmucSmLpY5IQ7KOt9fapn1fked2EqSHe0EXaTEDyhpkXv8d
         HTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032260; x=1772637060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSnbwAQr8QFbf0n85PqQBBa2B0AcsRHkkzFtD84/ibw=;
        b=ghtVcUyxYtxlH5VH+2zpEIUNJtA8AHTmw2KgkWSDt7q0j9glIlmhY2dIcuaWhuRG1+
         TNDGMaCB3aFTRiRcuZcQFMECrK3ratTRJdy25QbcXEwswgnH25e+6AJq1qFCWxEEoJ9i
         FHyfkDcV/mG2tmwbBb7nbfaLRKFR95Wtn/IHNo/A14+LF61SEMvMt3XdgcHQVDwhWs0T
         SHB1FB3jETIhK8dzZvoqFSsmpwRN+5NrrKS7WuCoMhulSAODXAVEmFUj33Qgw/BVkw2m
         pr3UVo10nDM8vFyl97vNXrreCgy4dnLrYsy7ZiLxNRmT/paRvMMizOu0kvZlUqmkjDnE
         NCPA==
X-Forwarded-Encrypted: i=1; AJvYcCVbSzd1SUsKSpmBd8ja0L6DHYqUEV1daZNlMycf5osurHzJF6a4o62CEUP8Yzhd8zj47dljC+9dDaD/nE1eXOhv@lists.infradead.org
X-Gm-Message-State: AOJu0YyJQdL8VvdgKMfjYjRlyXiYhdSdFA5zDl2dLFAn+BsHlBm19yjC
	uM6pxo7hftidqC+wDG0SEg8ql0ze4QtYhBjtQ+dS419xvly07aiz2wuj6GMibw==
X-Gm-Gg: ATEYQzwI38zcVBJLyHRiKgv1dYwJMwN6nG9fKMh7oFOwAcYjkNKc8Kgs0LO9OONWncZ
	j/k9BcC+z5FTDQKasytYYecCZZ7JKF8TvyR4kuk/rJy6OHFwMx2dlcWg0prvzbIGBllP8evZuEa
	B3XOWmr6qhNzHUqbLR25y5IRPQNy9wVcpfHEyBPhSDnGX9Mg9hGh7tyfiCXfG/z+dbmwNL7V7eK
	O+ksC6QG7GT6aLgrke4/1KKNq5gNsovpVt5n8hFltxXzjCpHnzV9N8nCN6xPWS1IezxYFu4Z3X2
	T+xXeYXBPVXATiw2yb67ryBgPrUBy6hTf3DN0m24sEBFMCa/MK1bKitjo0A08JSFM1OZrbS19V5
	AtW3c19OffyFJ/p9oyUo2NPdZii+oNDsPTfXGnkOlA6PabsgO8isz2BKhUMG/mBb7hALjsTbDwL
	oUHL+xzD46qxY2pZ7tbflNNFtYQ/yFgoYojXEFmSRrQIC9EJdoQDVw4mjy2SzroCLdrz4pEEF+5
	QGWQKSDatXiQ1BJlN9xYQ==
X-Received: by 2002:a17:902:e94e:b0:2ad:9326:3c3d with SMTP id d9443c01a7336-2ad93263e35mr69945275ad.54.1772032259787;
        Wed, 25 Feb 2026 07:10:59 -0800 (PST)
Received: from ?IPV6:2401:4900:892f:f52a:c575:426a:cd40:5f5d? ([2401:4900:892f:f52a:c575:426a:cd40:5f5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75321543sm144713925ad.72.2026.02.25.07.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 07:10:59 -0800 (PST)
Message-ID: <d37d3775-c5e6-44d8-92bc-68f465d7cc97@gmail.com>
Date: Wed, 25 Feb 2026 20:40:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: arm: atmel,at91rm9200-st: convert to
 DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu@tuxon.dev>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
 <20260224-arm-microchip-v2-4-8bedacd2cdcb@gmail.com>
 <20260224-gout-exquisite-1ee0b67c58cd@spud>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <20260224-gout-exquisite-1ee0b67c58cd@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_071100_816986_BDA92248 
X-CRM114-Status: GOOD (  16.68  )
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


On 24-02-2026 23:18, Conor Dooley wrote:
> On Tue, Feb 24, 2026 at 02:46:49PM +0000, Akhila YS wrote:
>> Convert System Timer binding to YAML format.
>>
>> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
>> ---
>>  .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
>> new file mode 100644
>> index 000000000000..ff485b37cba8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/atmel,at91rm9200-st.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/atmel,at91rm9200-st.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Atmel System Timer
>> +
>> +maintainers:
>> +  - Nicolas Ferre <nicolas.ferre@microchip.com>
>> +  - Claudiu Beznea <claudiu@tuxon.dev>
>> +
>> +description:
>> +  The System Timer (ST) module in AT91RM9200 provides periodic tick and
>> +  alarm capabilities. It is exposed as a simple multi-function device
>> +  (simple-mfd + syscon) because it shares its register space and interrupt
>> +  with other System Controller blocks.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: atmel,at91rm9200-st
>> +      - const: syscon
>> +      - const: simple-mfd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  watchdog:
>> +    type: object
>> +    description: Watchdog timer subnode.
>> +    properties:
>> +      compatible:
>> +        const: atmel,at91rm9200-wdt
>> +    required:
>> +      - compatible
> This should just be a ref to the binding providing the watchdog.
>
> I am guessing you didn't test this against all bindings, only against
> /this/ binding and therefore missed the fact that it doesn't comply with
> the binding for the watchdog itself.


Ok, i will take watchdog properties as a ref from different yaml.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    timer@fffffd00 {
>> +        compatible = "atmel,at91rm9200-st", "syscon", "simple-mfd";
>> +        reg = <0xfffffd00 0x100>;
>> +        interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
>> +        clocks = <&slow_xtal>;
>> +
>> +        watchdog {
>> +                compatible = "atmel,at91rm9200-wdt";
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.43.0
>>
-- 
Best Regards,
Akhila.


