Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09EAC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27jezBfAVIzktHTr6l4mHiDx2Ggq5Iy2enqwqiFBvyU=; b=Bhe5nu2ssMy3+uqfCg6V0INHG9
	VXk1GSr9MWmwapv7YogQyuOa4WErmWVKOhFJ0pr83dLwNG7zTVTTnATFXe9Rtxhg0cd8kcQ9+pSso
	rAlCn46Hx+SLrp7I7udFbQW0AvpSwWD1qaqr4vKRK0jJSkuYQY+xnRrKabpJG1ou+eJS37OHIoNq3
	sR6d80p1fiOxxGIeQ7hdO2PU/iWRaVZea21aeGs3XdfoKT9GFxAbl2eMq2E1156GyZzN2hK9B5ncz
	M3822c7+R0YWUC3kAemqbILV4lLEDY5uKP+5ZLHOqJMRYNhNOAqkL5SP1cbv9z5P6jCkw1hF8QdCQ
	o2Rso1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTyw-0000000FjDN-2and;
	Thu, 16 Jan 2025 17:48:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTvS-0000000Fibq-43sT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:45:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2167141dfa1so22675285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737049502; x=1737654302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=27jezBfAVIzktHTr6l4mHiDx2Ggq5Iy2enqwqiFBvyU=;
        b=FZJ+mSICK7/XsTg7qm8DMri1iCqxKUPBdk/pOAu8a9+bFBJWuSuFRoEh3MrbpBwFTt
         +nFDhns/bhXQWdyYAKFW3Cd0/k+mTulUbS73FQmeIwr20DXKdO+dJf5jrvzR3I61fgJF
         qUoqItDHRnWcGsPf2CZ9/n+Do8wCkJXDHeOkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049502; x=1737654302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27jezBfAVIzktHTr6l4mHiDx2Ggq5Iy2enqwqiFBvyU=;
        b=DHdAhcTMD3XBe89nLmo0jBRdD00L13cppY7MVvbanUZWWZmzQlP6qR9PfgSJisNVLg
         badtlcs+vZIjqS2H5X/1dGai5/OmNyrjBnTYtfKX1/k0F2E4JILp7cqerTKcRBZnAW+z
         kVjk4mhHo/GmAzZOcjCCA901+E3Y4EAgMFioEwl69na8v5R8ybWXofhR8C/+PsiYSt98
         iJlOHAio4fygi09WplCV3M/sD5U09F+P8eCupi+rQdqS3SIY4KoXlz0oszsFxAtyt/b+
         hS6UPg+NT0755cIqTnJVGDARoOFmbguLbbWYT+/IAxwdzMIN3eReBrGP02jvdfT4qOhC
         fc+g==
X-Forwarded-Encrypted: i=1; AJvYcCVLSFYdCbyLja3XaQXJgAgFYWbqy5stgCxXVZxBqt+O8Z4L3YBY/Bg7qQx6KxpEUv/MhYezDbXODcfNwnJ9S06h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8wCr3WtyOMD0rQEA+3tBAGpHh4YE44ROJc+VSeVs62/7WHfY9
	blVArJSmL8qrKOQxzW6FMOjTpnAImq3Rr8YDPYYlauYlCHunmf3Bi4bMs3a+VA==
X-Gm-Gg: ASbGnctp6+BIkuH1m/wm5eqo1pl0/kr/HRTBjmWSLqvV9GpL4HMKwsMYsVYSpi3qQEV
	UMveaCBtweRijVIoELnNE90VLkINCgRIwI6Q1BvCc7x1o6Z+HvlCeDodJLEq13dEczjUgnluZIb
	omPIdirK/zZs6kNGQqaTvc9W06bblEfM8MwCJ+5hK/I/a65XRffWOZxLpolUzA5kfEvtSZV+jIe
	gXHZ/P+nav3FfNNMO5W4Zr6s8SNvaSmQHK8RuTyv4OVCQhAEjRquGzFBMhxm5ME/tLE/S6v6UML
	EjE5+8iZvBVugjfP4oJE
X-Google-Smtp-Source: AGHT+IEoVJVVRv483DSqBDgUt/hYJJvZWdWXiVwpeOSnOJXp9+lLG+fUWzzlPwCAlreJSx1M0dr82w==
X-Received: by 2002:a17:902:ecce:b0:215:a303:24e9 with SMTP id d9443c01a7336-21bf0b7698emr116741705ad.3.1737049502456;
        Thu, 16 Jan 2025 09:45:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb76dfsm3010695ad.61.2025.01.16.09.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 09:45:01 -0800 (PST)
Message-ID: <a8867a5c-412f-429a-bee5-68c9b9c51131@broadcom.com>
Date: Thu, 16 Jan 2025 09:45:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: bcm: rpi: Enable minimize for all firmware
 clocks
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com>
 <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
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
In-Reply-To: <20250116-bcm2712-clk-updates-v1-3-10bc92ffbf41@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_094503_036389_6D9DADB0 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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

On 1/16/25 08:24, Dave Stevenson wrote:
> From: Dom Cobley <popcornmix@gmail.com>
> 
> There isn't a reason not to minimise the clocks, and it saves
> some power.
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

