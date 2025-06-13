Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C984C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHeYqEVybulKIAJ/SLz1vtqwVOqbhPS/lmlXAmsbCt8=; b=T9ppzJ82BOTCJNKYyL6ZH2IEXb
	UuRnO+ToaXGh4UyiD4qovkmv0S5QgOD7B6pfPyO2QDL32iIT7K3jK2IJahal2zZb174jusuWJkGW3
	UeEq/I7nSkG4nicPbqEb8L0KNRStiMwuy59AALpNeLlfiYvCOx0Ql/ZviyF9icQ4wmNd8zqvKG0hv
	TZfk6/nWAzkHvt8k8Nv0tQaFKaUV2JWhmRoqK4h88EsH7sVWGr5BISpTvwNHX3A1F6tmbdBrnhHaf
	1gKx6bz6KPy4+lfWBpYwQ8qTxGh4LP6UtZf1onajZzD6oKKVYM+qSxPrzi7JCALVbBHa/tAkuIKXC
	mA77FLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9wE-0000000HQBl-0npw;
	Fri, 13 Jun 2025 19:19:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9O7-0000000HKjS-445I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 18:44:29 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso2770003a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749840267; x=1750445067; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHeYqEVybulKIAJ/SLz1vtqwVOqbhPS/lmlXAmsbCt8=;
        b=E4y+xngTYBgmIN4RAQll862wUUhJULZPmJSVptSBR56PP1QKnHvdr4NRqKhVlsmkzS
         YuDt9aJdMWgD56N8KiJgFHQghnyYx8Rz9NJn2Pu4feRndSNKJ5AFmCN5gYFZzjmlVZLJ
         Ydw1pC+gJGls8LxWwd3NrAoEbUVzyevr2cjRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840267; x=1750445067;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHeYqEVybulKIAJ/SLz1vtqwVOqbhPS/lmlXAmsbCt8=;
        b=pRD55Nw5BErvT36KZl3D3LmViVqYPX7hVNfOi4cqMzbnkrDJZQoewRf/qcLZc8Kce+
         RKtK0Bk//9yZFQQWYD9jBHmBco1aw98kwsgZxririDhLC+zv8RDm9vn46dKMOx29H8FL
         ewX5/7fUY6/Yj2DmbhTlaCu44BWvY7IbS7VycnXQbVatS9cXYJHe9MvzVyXMOAoM39Od
         HdlqDX+gmUQvijbs1KwshAnyN0KmMDfkYj5Uyo1tXQriFv0EkN12rKGelISmpFPWww+R
         nP395SvJjoTOPw/x4XikEmdddaQg2ZF/RbS04fGRdM1zu4yF7VpQ7H5M7Y4Qd8ZAq1X6
         1Jtw==
X-Forwarded-Encrypted: i=1; AJvYcCVAU5CmqhbCiYCDk2/0gxJsjDYMZTKIpfgNCVuQo8eIpSQphS3KsFSeDieTTL7+gf1LAmyj8O4jcyim16iqgMmA@lists.infradead.org
X-Gm-Message-State: AOJu0YyIjRpl07c81xraDAsbcMYY9C2hiFKXFNvFCCle1bxcY4X/L3nR
	Cq4VhJg8kFJlSp6AyphOuzl/6/J1I8NknEJ6ZzKpRLcvOM6bBm08Xr6cxJHvjr1P8w==
X-Gm-Gg: ASbGncun6pAcnGSNVSpvamX2jThu+O7QfTP+SnsqbftbZZVN8lFKiEDb9YWk1SGCov1
	1FGoc7T91DP1h9YzQbSond74MEt9S7HrgWjU2pbVk2bKbnBmACKwcYZrrW4qVXAb0NDzSVh4wZ+
	OVpMys1Gp4u1yuysRm6fWPE4NO3viVf+3cSwQMz9+ouPng9U/XZPrJZ/FCZAMl4UFJq2aZeLZgE
	q9XM84NSxul660x8xEnGEOnKNYkuF0pHmLXwMG5UtSSNOuEpkjgG1B1QMdo6whArf/niZQ4drGx
	Kd0Db0P2MXKciYqoUz/F0UVL1NaggPVKXYkd62qsLlmMOkWtFUGU9KsSxuI9ns9qkzoF0EXC7fg
	mg57kn+F5BesoFxbS0QUERlPuPw==
X-Google-Smtp-Source: AGHT+IE3l/ieo58PZuP/VXIQXaNY72ns5eLc69FqJbf0YSdSZl1/lgIYYyrYbd3f+TjZzr4aXsSomQ==
X-Received: by 2002:a17:90b:4cd1:b0:311:f2f6:44ff with SMTP id 98e67ed59e1d1-313f1db806fmr1227482a91.17.1749840266701;
        Fri, 13 Jun 2025 11:44:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bca4c7sm3729100a91.3.2025.06.13.11.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 11:44:23 -0700 (PDT)
Message-ID: <d995799f-b4d9-4c90-a1a0-2e8e212a6b59@broadcom.com>
Date: Fri, 13 Jun 2025 11:44:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: brcmstb-avs: Fully open-code compatible for
 grepping
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Markus Mayer <mmayer@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_114428_070178_71285F82 
X-CRM114-Status: UNSURE (   8.44  )
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

On 6/13/25 00:16, Krzysztof Kozlowski wrote:
> It is very useful to find driver implementing compatibles with `git grep
> compatible`, so driver should not use defines for that string, even if
> this means string will be effectively duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

