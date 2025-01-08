Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79833E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0T3qTmWNKjRvWAUF4BnhHDw4+Y2/jmnBIbfLY1Le9cY=; b=CmJuaHJY/e6oCT75ANJc+NGs4U
	UFi3bT6+BnoE9454btGAa6oK9CydaVGVz8TfYoTqzssfsefToRj1viZlmZElifGnkK+bVsxbZ0IvS
	t4I7JZ4oCqCdcYakjtC5tg5zEkr0YCUcLghdxirr5oqEgEUCAwBhiTDJKE53LqruqkptOVMBQ02iN
	XwQBRWmc3XYZSvlXgzEkbCYFqIukumZZ/uhk6EGzGzo2E9aKp1Skejdqhjx9A5TQmTtq2uE5riAwx
	jFNehBgU0OVt254JI8GzVzfOQQTpea+1fn4Kzw647ImMH26RYeLIsZ5n+vkZcNsGKdq6Hj0d9I1GT
	9K2dRYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZz5-00000009PIa-2Z31;
	Wed, 08 Jan 2025 17:36:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZfV-00000009LVf-1E4V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 17:16:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2167141dfa1so350205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736356592; x=1736961392; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0T3qTmWNKjRvWAUF4BnhHDw4+Y2/jmnBIbfLY1Le9cY=;
        b=PA+xuYIa8K4AHXHPjW9Jjcfaj002FKFrIj7okIY8zb2bGIlS97sMHxcT9uuSAY56yl
         p/3d5EkRSscZddRqTB555nRaGTYH9So+n7lfYs7KFAfZpnGtguPYi1f//9jjIYwiGh6g
         oFGpFLskW9omzo4ZuIaTMsRF1xWocG+FN/29s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736356592; x=1736961392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0T3qTmWNKjRvWAUF4BnhHDw4+Y2/jmnBIbfLY1Le9cY=;
        b=ThUC/wIN4L6/0hZ1uzSlZwAP2NgytN2PfdjRW1kL6V7p3dT4RsfYZ3ASsYQWIk+TiO
         PJLShG4zFGBiRGhlc6Etf6hCfVI6wVfPy7y0HLNVuHpBuwMovKJO0b7R2TlTuAokEFlv
         MtmPBhec9TWua0bgjC187nb7gtTjz+Qzoc4W6AqdjpBq8UlqhErJUIV+2UK66b5OQ/N8
         9/5skbM7uUPX7jXDisQctpMw2siAlXzLRwtbvZ51yMpta3qGn+ZDoQGIrv7eNw2PQbji
         EvzLuZtJev4G36oY5Tvk4Obs8j1mX5IFDhfwtGrEO6FLF0V9SGmctSmd/A8jM1hgUX/v
         DH8g==
X-Forwarded-Encrypted: i=1; AJvYcCXLe/nte/6y+z3+uTVtc9vhLS3pSHsR0g/rTVuNF1tD9zjT7X2zN1hgiQLfwULve242L7uiho6gADPCjmQxvlsA@lists.infradead.org
X-Gm-Message-State: AOJu0YxVc8X7keT5PKbAODneJ6E84ptwbiQkCEvnlEJZ3BxYxokQe5Kp
	0KHF+OIQ2Jwp8mlgZEqqA+4VIA/iqieH2pE5O4CXo4y3qynIE46lNB8VyluaeQ==
X-Gm-Gg: ASbGncuvpk+WZWSmoP2DcuvYrkb9A51wu6IK+qR0OYr9M+b3Ps+1zDsgLS9vOscwGi7
	yj/krNchlNwCQuXDhsEy7cuEzWchldF9vYHaIXj1ssVe7V0RVVkMU79TLuTGoWIboFy9gcuZJkL
	sAYuFex1wwXEbJKk0ZlwPevWrBmi91eQdikl7LEUbf6zda6re6bdtYkvdSZ/w5kJ74QiJfcOC5n
	raiA5yiyg/tpoijcNTIjDIs6GW6YaYZ80xiETuFfyX2pO1a0BxZza5Txd3M6t2lHkEFQ/RRlrTS
	dta5lIWB71mxkFTGWpxg
X-Google-Smtp-Source: AGHT+IFdirgINMAKBimNFsOTtAuNTTf3q6GIEsWAps4SrC0rZhPHcEx1lfpJ6b1zIeyXBLocP9cM9Q==
X-Received: by 2002:a17:902:cf4f:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-21a8d66fd2amr1197475ad.7.1736356591694;
        Wed, 08 Jan 2025 09:16:31 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4fbcsm330246845ad.174.2025.01.08.09.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 09:16:30 -0800 (PST)
Message-ID: <06f649f3-823c-44f2-b71a-a6ec4d38f20b@broadcom.com>
Date: Wed, 8 Jan 2025 09:16:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Correct indentation
 and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250107131108.246898-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_091633_338475_79F77157 
X-CRM114-Status: UNSURE (   8.98  )
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

On 1/7/25 05:11, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

