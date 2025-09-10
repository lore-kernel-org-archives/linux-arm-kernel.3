Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4F3CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 22:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=; b=PO+aqnrF49Vz8GuLnzQkT/mHZ8
	tcc9FoW61QoQ8RUr/yKO7r8oXCyuIlaIFS8YQzk/ujpfVtnXmXplHfcIiccIEa9d/w6tApe+8M2bP
	gFag6LnelZsgF9ChSyBcHplK4+exnm11QltDhR2BFoEApixRn80c5tbzECrKlee3yGTBFQRypGhCu
	JwrrCUQveUDZ3hckHZMZD4sFt2lJi1ex9ajKGHl73O7CtoEAqkz/z/TgMX8GoUIp2yaL4AX2hHWsz
	jaT0GhrELOjh3RGYeyyPe6wkk5ZEnM5R3cASkjUybEqvnT+/eqKmgyQdjHcdkVrag94aEXzBoigQb
	ChJNgP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSwK-0000000H0No-286B;
	Wed, 10 Sep 2025 22:05:20 +0000
Received: from mail-qv1-xf61.google.com ([2607:f8b0:4864:20::f61])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwSwI-0000000H0Ma-2ryf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 22:05:19 +0000
Received: by mail-qv1-xf61.google.com with SMTP id 6a1803df08f44-70ddadde494so613476d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541917; x=1758146717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=mkSl3bIu/u9kIziTIH9nqeoEzTF/rS1cNmbv9/MzrIQsM96re/h4B7z0iYEWh39eoY
         QbZJKgdwLZYpy/evntU5AEjHwalrET9NYbgsf2wOkzvXOmMDXlYyViVimxSZ52EXAaWP
         V8To/hHoMxQ+ABi7KKpemtlnpAJJuIM9vqx4ZICddCwREr2nE+8qm6qHDPSD0vfX81ls
         jrRYn9Yphch+YMF/+O0fJPYjwirQpMYEtmuw6S+FHWIljCnUznQPxFW+asZSVwOkYmmK
         3zS28MpoUr4I0WFslVzx6jlgKMYTmdDMbYoXI22a+AXXLLIOaupWP/vRweZYza482eIu
         5nBA==
X-Forwarded-Encrypted: i=1; AJvYcCVHpu+fCrUJhkoD6XWhGopD0EbwWSU9CBjWXdQJEuXVwTt4b2OGWg7IrdCOtvaMRinoheiZv/l8k9u5fnWVS+Bg@lists.infradead.org
X-Gm-Message-State: AOJu0YzHWWiM5LovO/VG6fOpl4U55WntBzzrszGE+4cvUFNUTGitNBr/
	lcMkNWwvW2sT/7c6EfUdWTo+2es7VIen9ElWgU339gE5zd+G48I8b1ox8fjlaYPeaJrMdZQFkAX
	4P4BYqdlvaDBTRlzaa/qldSrRQq5a+iDQtl4MTQfOlhzaAXotRIFv6nSD94tW+fq5Ap4BNmAaH6
	gnYg7otDUtHp74NxxO8/yzIcLY2QPqubxUOsGgpgpfr0LP8CGTmvHJs/WJLo1bGnafsyOXdndzD
	NtV1/q5xBud5d4nxTCmMVprfSvZA8HBE0E=
X-Gm-Gg: ASbGncuoQwwfFRbcxGxi39qtxFBiC9eHfkRwcHbJ5vISnV7lLGndDLlI+jJLPmIISak
	bQNuKLk7JIY8EGgvcdRKS9OTnpdhCABfTjc2i3ws42Va9UEOpQH9zRQSIZDV8fVgC+SyF2YlSjC
	VbvBoltpxBu5zyYMrL86eOuSeP+FmFhiYo8/NQd6jgXhmsfwS8a+BDsQaOjCk0KOszJd60Dqnir
	+7knY4Td/DiXTpy+U7mrq6PhY3QZKB7bvdnfTL6/gZGQMZKQwCIs1UlzudBb2HybA5sXqKdvDzn
	U8T+KfhS7qfCw023U2OyIuX0cdvKs9uki/NNcm7gE0/+ZMrmGVQIItBMnPrPW0UDxSDzSa7zm3y
	r/gE2OYvi0vqnJrr80Sa0BdZT4Z9tqEnLGh/DFFeBqTJ2a24d90eJ2Bz/q57yA+0NaJuFOelj3d
	4cEJN7/8Y=
X-Google-Smtp-Source: AGHT+IGrMH7qGoh9pu/EjvORQQEf7UbC65Dfw9RJx5P+7p2hPOXWWowlqUqtCAxXIWdm0dqjAEXtTvgHdKVu
X-Received: by 2002:a05:6214:621:b0:70d:ff3a:f96b with SMTP id 6a1803df08f44-7393ec154b8mr163543806d6.44.1757541916498;
        Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-762c8f98eeesm362126d6.37.2025.09.10.15.05.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24c8264a137so281225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757541915; x=1758146715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=Ksz+ksdGQH5TBbZMiCAnBgKXq0oQE+G31vpH37YeqrtBMe9iEddxx4MhhImcUIc3n1
         oLBEp2YNHfdPxsAYsuauZBT+VbBrjrexWytMpL5j8j4TKyLVv5labjc/Um/V/iHuILhY
         k4144rxc8wIIPWPPVxh7t7Up9a4eBeGCLP3bs=
X-Forwarded-Encrypted: i=1; AJvYcCXsQXxJfm0oQ+AB1zGq3FMZDOOIHhaWh3mpO+EKUCMhHogSDbqzOdyu67yenB0jeRWMhJ56h/0xmgWcx/2sGu3A@lists.infradead.org
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726785ad.45.1757541915307;
        Wed, 10 Sep 2025 15:05:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726435ad.45.1757541914912;
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25bf675b77fsm1714715ad.43.2025.09.10.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Message-ID: <f72733cf-cf96-4960-b07f-ed0d9efbbb03@broadcom.com>
Date: Wed, 10 Sep 2025 15:05:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_150518_734145_740DFA3E 
X-CRM114-Status: UNSURE (   9.61  )
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

On 9/10/25 00:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


