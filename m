Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825B5D3A67F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVarP6PjU9eb6xoU6oTub3mnCxBAu8wX1kKk0MQH4yQ=; b=BBb9ihZfRNXcii/wZ5GGXusLz6
	XKYckUgWPiGcPzgpCruW007D6NiLS20ybQZ2guzDv3CXQ5AwL9wvrybc2EGlfsyBSUyY+1+RqTUML
	/MjztKzWXIcYsFYOSwijQNxJgzyjrZEpfeR5JZug6VjZFyOP4FvE+1ccX5ut/pGkGw4D7BsHBg5zN
	6+5gKRCyM4Opb9RtxoZpChgFqgnTwKQ40LDOiIVpfmsBL9rfu/w87r3Ve0vSOGeSrR6pLzv+VEMKX
	GyHwTDgoL2Erylwd/sVR7Kcmv0eq/vjoRlr8id/Ah8yWzQi/7dIyQRo9zKdrKvzCgXcZf6vqsgXVk
	bH4yQKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDh-0000000FWhH-3X7g;
	Tue, 29 Oct 2024 18:45:33 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ohO-0000000F3HH-3E0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:04:04 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3e5f9712991so2952319b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1730217841; x=1730822641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVarP6PjU9eb6xoU6oTub3mnCxBAu8wX1kKk0MQH4yQ=;
        b=R92fGy3pm/JglxfOz50OsAWpYJ+zMM+LTM52UHTYLuFBHrBVXhapuB6gHAzGWKyFza
         7OSJgTWo35yfFvBu87HShMY43OmtWZllfocvvWjx4drgoI+Sy0mFgqQUctfLPpbstMmg
         edFEnY9U123kFFV5zPtXClY6d4S3mqX3N2tb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730217841; x=1730822641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVarP6PjU9eb6xoU6oTub3mnCxBAu8wX1kKk0MQH4yQ=;
        b=e7DRo3Wkm+tI3AkWT+pUXHJf9+qqIoEAEDrXKjHWMECuhlvru+YWrMpCB9KFNab0vS
         sB1SsISOmWf61e8SczFOZMiEt5dJAIBgF3HDc1iJq+HxiDDjoA8gj54l1W/oOkZN2MVG
         RgjygyLUyZyPy4vuz6pi36zIkp0GMwzSIVQB22haP+NA1wXUJJc2kkUiLjCLZdN+rhw+
         tNtf0lDGkhk9KfzNLTSs9Ky1w+rhPFfAF6W+jc2wqoZx4nSgOt4CWMivS1U7aIfWZ0yd
         p18rwMan18EsYals9eZYDDBGYdvW+ORp2EvN0u0tkd0ysiBrtpCFZA1S5EfDOjhI7bTT
         0egw==
X-Forwarded-Encrypted: i=1; AJvYcCWzzD2dcFT57SxC/RoLBPrtxp90F192j1NTaUanMSKBPySmLM+TqaMLhSWoBskICJCekhEBd0X8eyDqnCPqPj5o@lists.infradead.org
X-Gm-Message-State: AOJu0YyUSzW2pe2x0oS6lz1nBm97zIQrQwWj2IQs/ICp58B92qHWLot7
	9v6gfLd8oOu3qsHCBDIJc/g0WwpVwfNr5dWh0ZKJwdBZ2u0poeODtGmoUcqhIg==
X-Google-Smtp-Source: AGHT+IHDW02jORThNkphPVR5nYXaCzOIi29r7kEzU4Ib558j11YspqnCbtEZ+pfyDZ8Qps0FYb9L7A==
X-Received: by 2002:a05:6358:3997:b0:1c3:d00f:fffb with SMTP id e5c5f4694b2df-1c3f9f8173fmr492234355d.27.1730217840455;
        Tue, 29 Oct 2024 09:04:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a5660asm42888206d6.140.2024.10.29.09.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 09:03:59 -0700 (PDT)
Message-ID: <c623075c-fd80-4312-90ba-4f8a3c3f56f9@broadcom.com>
Date: Tue, 29 Oct 2024 09:03:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: brcm,bcm7038: Document the
 'open-drain' property
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, justin.chen@broadcom.com
References: <20241012025603.1644451-1-florian.fainelli@broadcom.com>
 <20241012025603.1644451-2-florian.fainelli@broadcom.com>
 <20241015163200.GA1220909-robh@kernel.org>
 <252b6f39-3b06-43b7-b227-1c29c1c12bd5@gmail.com>
 <7aok7zs7whxfg3bhv7koxfxq6qhgv34b7kg3mh526z2cf7e23l@ffbsxqdqjis3>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <7aok7zs7whxfg3bhv7koxfxq6qhgv34b7kg3mh526z2cf7e23l@ffbsxqdqjis3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_090402_902177_C55B1E30 
X-CRM114-Status: GOOD (  21.77  )
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

On 10/29/24 03:44, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Oct 15, 2024 at 10:07:10AM -0700, Florian Fainelli wrote:
>> On 10/15/24 09:32, Rob Herring wrote:
>>> Another thing to consider is for any PWM controller with more than
>>> 1 output, you might want this to be per output and therefore should be
>>> a flag in the cells.
>>
>> Yes, that is a good point, this controller has two channels, so it seems
>> like increasing the #pwm-cells might be the way to go.
> 
> So the idea is something like:
> 
> diff --git a/include/dt-bindings/pwm/pwm.h b/include/dt-bindings/pwm/pwm.h
> index ab9a077e3c7d..d18b006a7399 100644
> --- a/include/dt-bindings/pwm/pwm.h
> +++ b/include/dt-bindings/pwm/pwm.h
> @@ -11,5 +11,6 @@
>   #define _DT_BINDINGS_PWM_PWM_H
>   
>   #define PWM_POLARITY_INVERTED			(1 << 0)
> +#define PWM_OUTPUT_OPEN_DRAIN			(1 << 1)
>   
>   #endif
> 
> and then add support for that to the core and drivers? There is some
> intersection with pinctrl (depending on hardware). I wonder if
> abstracting this somehow using the typical pinctrl properties would be a
> saner option??

But what if the pin is not managed by a pinctrl provider? I have started 
going the route of implementing the PWM_OUTPUT_OPEN_DRAIN bit as an 
additional specifier in the #pwm-cells, but I am not sure to what extent 
this should be allowed to be changed at runtime.
-- 
Florian

