Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF7EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rcl1SX/OvDfBPdSZc3LYo5TUWBN/Uceh2ueRnzxWfk=; b=kYmwA7t5Y79SOrW31qoO7O1JCA
	ENJx/y1JrY0J/o1ETZPqJDOgzNJjXExgooABhJ655TJFsyjnzBCt/UfwDAYpkWt1us46jJY5GnK9r
	PPhFLpJBCnZjdYjXrWDUNe+hfYEoojytOxura+aMxbm+o7RD68qu/I7pTaW5o16ie+TgpGA20r7tU
	b2+tfTyfgStSlQgcvs7OtTP1U6Hwvxk0Y7C61F0G9q1TLe9aa4zT81qipafOwgUFuPITlfi2wC+7R
	HZCxYEAFEe6ghrJUUr3D0K4gBz2HGIM2hsNbSdbkD7Nibas98rcuhTm+hEJKBuQZKp4hgIs2WbLfh
	/sU3pbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXksl-00000009E8V-2FgE;
	Tue, 14 Jan 2025 17:39:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkqc-00000009Duy-1eMk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:37:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216395e151bso159815ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 09:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736876221; x=1737481021; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rcl1SX/OvDfBPdSZc3LYo5TUWBN/Uceh2ueRnzxWfk=;
        b=Nbd5eBYQvgqXHyN3TgFFeStUlAZo0+cj9sCAxRlrIGXVszYKNnIP3JC7FyM6EtgqGJ
         MTmFVFi44tDj/ntHfWbGoHzDiWxJCl9sn5JwJQqvhH/VYndJ4J3Sq8cuBtzGGh9IGpNx
         oj+ZxLf7KXKw2p6JVKOmP7g7JRbS0swyzzYnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876221; x=1737481021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rcl1SX/OvDfBPdSZc3LYo5TUWBN/Uceh2ueRnzxWfk=;
        b=Ynx4ETg4sOXrf5PQwH3GilTDmM+OYi7in3bxzYCTkFn5K3euQQ2BVEsvpUe2vwmATk
         IdVuAv+M1cI6HZvqC/HiXfnz4H92VqILYO8T+IbRXZte/uEGfPGiJimId8OmcgnwQZ4x
         rksyoEaCwUSgWu27DRd+FycL4c1QComZRzu8ecCn8Cy0S39nr0veIEV50rrHRC1YZpVx
         UmcH97lZuX98hFnxWd4hANDFujnx+XXN2XknfGdG0uMdt5qvaDj/Pp/b4TGUG7mCHSh/
         HSVUvdhw4WS2ditjDeWwCAzoPq1kMa03fN2/agiOyXcJ4FSVbb5ocQ5wOwXk9ivu5P2d
         RuLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhPjoclgPZST7KL7M5Wl/tJAZo2WyhmQ6cxhewVde0ideHW5313cdzcC0rtYEiqjleIBCC/eS3daGudzQVkYEn@lists.infradead.org
X-Gm-Message-State: AOJu0YzYd89ffvFb1bfKAoC3Z780OecaMQva7ADneHGEBp6sAlT2Agjy
	atGovymBm5j/scEbGXm++TCuv3d4K08DOhjT26KjL+vYmgY3wDmznQ4w9cnq+Q==
X-Gm-Gg: ASbGnct3sxhjmRXz64hdxbqugR2Kto3p0d9aYjqGH0ZzL7EIcvQnLanM8GOT8XX1UqL
	HTK5Idfi1jX2mjhfne3iJwxjVhFnainjJC8XWvAvNRpsepOzs5tvJyjznlWxpsYcO38P55CIUX/
	eCVH2qQqI4sO9Um48+rPROe89ChHzayWsVtCkxApehUaK8oNNuZ/Km0F/Fw7HHb6xXIgmwN3s2d
	dm1zj0l2W+Mj80NIYToBDHRjsYDNmZSijLO1txflOgQ5P+fUKG/aVfbZmTS8TtRVbyiUvfh1/xL
	7l57KU4Iwep33DYJaW/a
X-Google-Smtp-Source: AGHT+IEFzv5G0xmABBL+XZICiZP0VhjMpDV3vlDzoecWcnfA7PB2ZBZcrMRU1kwwvn6finYRTqr0/A==
X-Received: by 2002:a17:902:ecc3:b0:216:14fb:d277 with SMTP id d9443c01a7336-21a8d6c7ab4mr318410025ad.22.1736876221535;
        Tue, 14 Jan 2025 09:37:01 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10ddeasm70270415ad.48.2025.01.14.09.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 09:37:00 -0800 (PST)
Message-ID: <96dba1fb-53f3-40fb-8e20-887cd089961c@broadcom.com>
Date: Tue, 14 Jan 2025 09:36:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_093702_434224_FA591FB7 
X-CRM114-Status: UNSURE (   8.93  )
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

On 1/14/25 02:56, Krzysztof Kozlowski wrote:
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

