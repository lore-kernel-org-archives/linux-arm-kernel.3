Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wl0OQAceQNZiTRMXXYgPYqORgysEC5Wk2TvfRZlvXhg=; b=uASLVRI1cF/S+P3w5yabve6K0A
	H5QLGhC3yAnshWKn/3VQAaDOe3yDPc5msQ4+QLM2F1BvEt6Tqxf734/VS59QL0/pqpeu2TktybGgH
	9j0hBmLA3ta2wcutWXUZ+ypx4LRXf2b1yOPxMui2aUFd3fDy2yBpl9dO1QXlHvP47gEE1fkIBlnOO
	Ljdiwmdpyu9rrzRBA+EB9RToR/fzJcBKhNwWNBvrO6CR5rRCikvam/8I6UqtNzWPx+xWq9GmxZFCE
	NWEfaxfQqrcALruk8MXkM7GfwAKeDfKGaF1I19s0NQG1N8TisfXVS6CJBYiReOQXsc4o0ZIKquxX+
	yfiWS0TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkrX-00000009DzN-3smy;
	Tue, 14 Jan 2025 17:37:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkqI-00000009DsI-1CVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:36:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2eeb4d643a5so9987259a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 09:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736876201; x=1737481001; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl0OQAceQNZiTRMXXYgPYqORgysEC5Wk2TvfRZlvXhg=;
        b=EbG06lFHH978lbE1344srw4WUVD2Usua8wTkydPk4i2+1XauhTQGMgZ6vz4ixMjEWU
         +slD8Ov9I8W6hjNCDl9TGPZPQrOs6/anadYLzJbBoYYZkg9XGJ4BvarYsf2ioc/dQPwJ
         PZR1Jl2McPMcW7v5uiUUyvsq7889eCfwcOHwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876201; x=1737481001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl0OQAceQNZiTRMXXYgPYqORgysEC5Wk2TvfRZlvXhg=;
        b=l0hYMDIVHPdqRRCuORCwr3yBo2vxgCz1wpjGywn4qAPrHHtgRdnCytP5LcdK5m/Uq3
         EFFXT+iohg0wW2Mycqx05jsoEKe9fnUgMoA1j3Q2LoOlGT+HhBmWRLSEnHNacUcwxjIt
         5W83wMjpiiEyUcZTahKtEH1iwsx6G1rXE4HFPaWVtcXe0X5XDUFp6Kz3VCDIE/yDE/Hc
         YoUQUplC6uG/kNJQ9YtXImDYT+L3yZC24MKh8gvjo4jIjexcVytYciVUX8FHYroQ+Xi2
         ip53CMsFsEz8heHRvwfAzDb7tx3e79q89HVVt5btU95gj06e4e+eeIKoOmEaYNeFQ77/
         iTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxp1pdt+eCPEaOUWyvSmGknF2UxajoSObUtaTIaEP2ojG5KOfr62La2mu/0jyNBzw7cBhW1Nhrz0dhUmWtVxcX@lists.infradead.org
X-Gm-Message-State: AOJu0YxicGeGRdrkBfl1aB1f7tLczqL7iYdTMufx1Hzs9pkIxZgpGMn0
	DGbjIYqDRRUuuzF88BMSNZ/Z3ob35VhjpeYSIFKmkuyTAR/ZuBZ9U7fzL4RQMQ==
X-Gm-Gg: ASbGnctrjb/em6FIZpfHOUwhq1Bi33XOcN9ZJ2OSLacU4myTxQffcNND7YJazG2gsi2
	H1fKpd4Yw+Nf52ZzYizmpSpA5gxxbwZZz8Uv2oHdJHLXxk1GEUgfrBiAFTE7L3eRRh8coHLdVYi
	xnWaQdFkvdLXAUfvNHvXc9jN0VpXNu26fGH9G3DzzGqfLFN+EPmUTJ2+O3fRrTXLBSiUTU13e3G
	k+UJALwc2X+sfZP/jE8GUoKDzu7gJRDAKP1RS1CWin5OhQzq1ByO974LFBk9bKYzvik/7oYAE0N
	ThfnRl3YS6/aP0uvN/7J
X-Google-Smtp-Source: AGHT+IHHsWEv45wozGJmxuqAfNmVOO/eL2E6IblEH5O05wgleycnhwaLm+UfIHZkEHKBKpY6IxmalQ==
X-Received: by 2002:a17:90b:2e44:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2f5490ee8ecmr31229108a91.32.1736876200871;
        Tue, 14 Jan 2025 09:36:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm10697210a91.30.2025.01.14.09.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 09:36:40 -0800 (PST)
Message-ID: <169fe40d-021d-4229-85e0-5dc74cf009b7@broadcom.com>
Date: Tue, 14 Jan 2025 09:36:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250114105553.273085-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114105553.273085-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_093642_447166_A1206765 
X-CRM114-Status: UNSURE (   9.24  )
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

On 1/14/25 02:55, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpio/gpio-brcmstb.c | 3 ++-

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

