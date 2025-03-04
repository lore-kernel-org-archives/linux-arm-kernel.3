Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CCCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 23:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jv+vfhFM5x+H+wKvE7Tyeh9gs1SZ0jcQcgCrZLmaD60=; b=JzpmPUTgNqgQ1PfJGZJFc9C+7j
	eLkegNg2iWtdbmzRIcoCgoX+NrP5bE1ckMzoXZ9GvCFn6jAB3giV/7oFdgbu+bFF8paW6w3LIaC35
	koOO6F2zWcAh63fSmUeIZ70D8WyRtLc7u4z/8CURrEpzkanmHG5ymSlZUypva51vc+4ATpqPKTpM7
	xrRqi6EBubB4v410exJRTIu2dVNmLl+K60aoT1wcxrALgjG6uoDDrXabHYSRrO4ZHX/GQOHpRJpt+
	BGIs8WiAMfhp9kvznIVj7eu3tpnRKUSjvAOV5xTy2u8bb5d95lBoeKpHjmf2l3ZSzRmo0w/D6L1Wu
	0g3aWtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbPQ-00000006VIh-2ZqQ;
	Tue, 04 Mar 2025 23:10:44 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbNq-00000006V1p-35OE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 23:09:08 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d3db37f4e6so58124755ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741129746; x=1741734546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jv+vfhFM5x+H+wKvE7Tyeh9gs1SZ0jcQcgCrZLmaD60=;
        b=OlqDvwQ/TuCXgekCzG95eo/+5iJDGY4fv6K6lQEPymLDqU23427ExIKaLS++OjWOmu
         GEONJyVrk2gE9cRKXkw/Ij6KTKOGo8gjApIKqK7S0rLysPdCy8xlrFbdS3WovQuLQ5GF
         BiM9nGP4Q36gf32qD4mnzQsXlG1oa/cxMSEuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741129746; x=1741734546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv+vfhFM5x+H+wKvE7Tyeh9gs1SZ0jcQcgCrZLmaD60=;
        b=EMVa7VaokKtSPSBxSAGFmObGIT7ngsyR08F0nCMnO+7TzkMcJ71rRGi9QfslZ8IDkD
         JNpQ3wRtSNutMQ2jtNB09c5ZmBe2hvhNqusAfFsgR/OWiSzDvzCQbXvTxOmczPFcalRF
         VKgVXBfcWl/xx4WTkctdlkY5bLBK17etJA4NS1pxR61GL5gtjnq+JUYXkAnEc3tzKkxc
         nd/Z6WBh2cu0WNXwUzQ2pPdvJMTnfiJwXTdLG1WkkMZCLyxapSgJPDSSc6I7b43nd6eI
         CnyaIz+aE8z76mFmCYGFpXI+JR54y0w+siQWUDn40Wc/su9UDoRhCYkawZVyQyMLurVG
         DlbQ==
X-Gm-Message-State: AOJu0YyEc1Vu9VwSAFyBw1Fp/7uNfhOuKp35v8iU8NmH/UU7Ij8vqUa5
	1eqX6KOZcbVkCaQkKhnJAtBBazhih79irEAMnAN6/I7awEASBOYCNoXU/Ex8NQilphS7iv3A8wJ
	pyw==
X-Gm-Gg: ASbGnctSydehB/1vdgRjSLftFqyAntotO8R+jPfpg05bCKrnEbJJ+pnsJcOggLOtzrH
	G0i2uGfuyq56jlwn/ODHSqJ4ERIF/28Am4yP9Ec93owhVm6V5h3puOuMlMgLpRiRvNHeKQRbBYv
	LXHrm7NQt+aL7lQMqaik29BordjhVcOgNHHjdBFw/UzgrSWslAUGjJboIAm+NUDrT6Wft/0ziML
	ziaRtWnImA6hz7xtGo+JX8c7Me5EGMHE0IDz5waKbMl2hlMKQjmhwaCtvf6Ri3TWMEpbkWiPFxC
	zQ6e6kWTYwN3yfmYgZO4p6tC5M2gp8mx2BTkv9itkYFVs1NVX0EB+5ys/nZUuV0AFuf1R6/yalb
	Ho9nMbsoK
X-Google-Smtp-Source: AGHT+IHNn+vjIDK9mrUob0jsHtMuQg5cWXZnp74724DjWY9A6ekiwkcRojQCHzA59kgShLLOIYsYAA==
X-Received: by 2002:a17:903:41cb:b0:216:3466:7414 with SMTP id d9443c01a7336-223f1d397ecmr18376645ad.44.1741129306995;
        Tue, 04 Mar 2025 15:01:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5cf4sm99912355ad.130.2025.03.04.15.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 15:01:46 -0800 (PST)
Message-ID: <cb5e3a1e-39a5-4502-b99b-b7183dfaea02@broadcom.com>
Date: Tue, 4 Mar 2025 15:01:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: Fix switch port labels of ASUS
 RT-AC5300
To: chester.a.unal@arinc9.com, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tom Brautaset <tbrautaset@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250303-for-broadcom-fix-rt-ac5300-switch-ports-v1-1-e058856ef4d3@arinc9.com>
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
In-Reply-To: <20250303-for-broadcom-fix-rt-ac5300-switch-ports-v1-1-e058856ef4d3@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_150906_772424_717D0769 
X-CRM114-Status: UNSURE (   8.75  )
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

On 3/3/25 05:06, Chester A. Unal via B4 Relay wrote:
> From: "Chester A. Unal" <chester.a.unal@arinc9.com>
> 
> After using the device for a while, Tom reports that he initially described
> the switch port labels incorrectly. Correct them.
> 
> Reported-by: Tom Brautaset <tbrautaset@gmail.com>
> Fixes: 961dedc6b4e4 ("ARM: dts: BCM5301X: Add DT for ASUS RT-AC5300")
> Signed-off-by: Chester A. Unal <chester.a.unal@arinc9.com>

Applied to devicetree/fixes, thanks!
-- 
Florian

