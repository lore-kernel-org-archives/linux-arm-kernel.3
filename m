Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DBEC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cP1pcPzTI23uLel2PWWjRilB7xFiwWgaGT+GbKyq7IU=; b=1+Q7TqylAqXFxESoALn65ZVO3H
	S/IgPa4qwpv9ePi/DUa51kSXm1XIEGeM/s1PF9TyARp3LqMZKdq7Jgc93owwKagkgTKyVS/kwu/HH
	ecEgaJajafe+PDVPxsIK468HzbQFLDgNEKO6dyZGsdK+6jaWV1sUehyhjsEKrG+isBAsbZeJJ2f8L
	08gDH3ALvNfqzzX61nS1Y3X0U0UT5W9gCacsCkI7yT+rlvpuY2BypPtNP8gM+3qTFKR7TJ2o8YM1o
	RczbbxDtULnti30AcHd/U/JjlyZqZ71vaC+ndkpk8I54p36Us/a0wg4Cq1zPKSKiwkWJB/2BIA8Y8
	lueOkbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAOK-00000001v5d-1659;
	Mon, 03 Mar 2025 18:19:48 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAMk-00000001ura-20Ut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:18:12 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2c1be520943so761546fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 10:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1741025889; x=1741630689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cP1pcPzTI23uLel2PWWjRilB7xFiwWgaGT+GbKyq7IU=;
        b=DBtB3PysiKtkbsxsen5nlHVzDJpj/fuIgSq5G0UrwR+Ol1v6l2BfsAOg2kYcMAMpe/
         wl9p45lIUWht8MhwCJ37b4N14/EgJIouefaT+rK8IopkkQd39qX885j9OGhzzxmaZGvf
         A6DmbFiprHzedA3I5K7IoJ0lSI9xqCudpTfqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741025889; x=1741630689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP1pcPzTI23uLel2PWWjRilB7xFiwWgaGT+GbKyq7IU=;
        b=IdVdY9CYXkHnxZKjppe+YYc1O5nmQ7AJlswo8dPCz0yMrk+rOEsjkpLEr94JUBIYwQ
         rRe2DPgG79gggmOVk1IiRGxHlxBzVqdBfgag721y80KrfPdsQEvae3AeaYlgSMSYFdG1
         eCkCV8DEXFUZpB7Sx0gqd7wxHyCkAMmz3XLYqSMuZVc/CXfQxiQGiGJbitmQk/eH2JyY
         9wW26Go0CqqazMDuaYxzHi11IYGGhspr0BfO9jcepxa2TlnRZY2nMcvO09HmmMIWmYLM
         RRO9sA1Bb3uWDPv8LxqiVm3o+QknC/206ihGq9ympgm+NxsfMY2xKFbw0t/J4wSDrfYc
         CjsA==
X-Forwarded-Encrypted: i=1; AJvYcCWk3g6+1n5oaO/+u4XUFRdw4+VlZVS9W7oFawr0bNRhf5LQKSk8T3KZou+7wtZekgJ2SAtdAhCC9H4jUgUxB0eN@lists.infradead.org
X-Gm-Message-State: AOJu0YwdsCX3uFeKL4QRfTCbYJtLR2D2KTz0fAdJdsKXLpWl+6o+IMvO
	HZvNbjQkoL2aGEIHPZnjKj0/X/1w0eoH+0PSz5g96kj9zc58E3HtiLot7Zg6Lw==
X-Gm-Gg: ASbGncs/9lv6r/c1dd+Hl3qMQfGhmZig/T5m9ZepLiMPLES+Zl0futvRa0tCEuYajz7
	+yDUSmIPkIBsxzaSxCHpsQ3ZhAj6fQQO9Fz/hjHBa2Bx5gXEOauKktTWtKR1lVZSZSDOXz9bXX7
	g36sSGQ/7EXNDwl8N4WnfnaarmOMI4VVEif1mE8CKQVSVoMPS+gq/XG2e3AUvxqK3kxJ+OcBGUN
	irX11MoENsLFjUcEVg4XZAhSz24e3Cok6QyVd3GInnPMSY8er76UYygAZSlEqr59QHvdgSu6DWp
	kZdZf5N4oqVVbb5s8XPObZRK5fG533YNu0+8LXc94ATVKLtkXHE2C0W2WI38KCOThmgUBZ2o6Y4
	mU0rQ0+v2
X-Google-Smtp-Source: AGHT+IHIeerp0csmjpgMhf9H65fzHI4UH0+WiPD+422dpOjHZ235fb7KyK/aUfyQ5/kOnzI7lKfpIw==
X-Received: by 2002:a05:6870:8a11:b0:2c1:4d78:57b8 with SMTP id 586e51a60fabf-2c178789c90mr9441107fac.28.1741025887840;
        Mon, 03 Mar 2025 10:18:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd7695asm1804587a34.45.2025.03.03.10.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 10:18:06 -0800 (PST)
Message-ID: <3555a62e-b0aa-4564-827f-98508ceb77d1@broadcom.com>
Date: Mon, 3 Mar 2025 10:18:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: bcm2711: Don't mark timer regs unconfigured
To: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
References: <20250222094113.48198-1-wahrenst@gmx.net>
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
In-Reply-To: <20250222094113.48198-1-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_101810_567433_B27CE6A3 
X-CRM114-Status: UNSURE (   9.59  )
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

On 2/22/25 01:41, Stefan Wahren wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> During upstream process of Raspberry Pi 4 back in 2019 the ARMv7 stubs
> didn't configured the ARM architectural timer. This firmware issue has
> been fixed in 2020, which gave users enough time to update their system.
> 
> So drop this property to allow the use of the vDSO version of
> clock_gettime.
> 
> Link: https://github.com/raspberrypi/tools/pull/113
> Fixes: 7dbe8c62ceeb ("ARM: dts: Add minimal Raspberry Pi 4 support")
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied to devicetree/fixes, thanks!
-- 
Florian

