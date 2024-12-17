Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE76E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZeJxYn4M4casXfZYAzyk000sLKELwjFu6x+Nrq42e8=; b=4zHdX/29QhNuasHGcd1Khq9RTo
	66firCi/960ujwjyxcyZn8SRLWW5KnbMoCbR9lcWP18asaXq5rxcKMVKiPWxxu8iN0U9iRV/Zf8UI
	UgfcK4jtLEHEgryBqZ8lq+7qK0shE1mzn6HEtjjHtpbH4JladVxZbGgVSsDNqIXTMggq8IkNM9pcy
	/qrHDZK4sLtLGebuIX2QZD4tmf+pbB6v2rgH67HeGQcR8YCsByhg6/VwMok3p/XbaILCnpC/LMDHJ
	d9vR4VNZpoLeG1pC7v5f/bhP8uyv4dXf9KCXedCT04J7pl7vWYKPaVS1CILAMHKqw2fe58xHYA511
	6Z6u6hfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdTo-0000000Ef9b-1Nwv;
	Tue, 17 Dec 2024 19:43:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdSM-0000000EepW-1mqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:42:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3863703258fso18714f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 11:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734464528; x=1735069328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sZeJxYn4M4casXfZYAzyk000sLKELwjFu6x+Nrq42e8=;
        b=XoTvGYlNuXGXVhHGnbwD/s2KM8IjhGD+3C3tsZb418wzGp9U7WKMtA0fvLQPY3+yEB
         q9PrZ0oSJpMvpfzzED9NhxlJoCu1ya4eg8iK+zv5AE7jw5kaNHpcQ12gMtpA8sspDqFS
         ouCUWgYSOAtr9zsvnh08DhbuHKUjvr9of3Nf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734464528; x=1735069328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZeJxYn4M4casXfZYAzyk000sLKELwjFu6x+Nrq42e8=;
        b=KjYT9p6u3lwAf2bawoK8/e21SFCcaQL6JlnwZ9H5UU1BGcVGRtMnpgE2vlr+KFjWuI
         1CsqD84kAYIy2cA8iE2kL6pJtbJa89keo0YwSLFBHdjFq05pNviDhktgqpmANWvyVgt1
         NXsZD3boSMyd5a+8bBYDXF348pV6YnHfXRuPkr9QIDXzpmao2EcmvQ1UN82ev6YWC7p2
         iu0qMFCH9WqXn8xa5354//BjzrVYStrFtoUhN5SF3otYcYqBjAmf0R+CAbmrbL1CF9OM
         80kDaR5geJYMb2OInpuZBj5DNC42jd0SacA/sUso3fUsfBHkdNo2b+ksLbTndxF8xrNI
         VWQg==
X-Forwarded-Encrypted: i=1; AJvYcCV2ki4YLyx/RZqJN5ggTJyW5IoSu2k7j6vGZ3uMwF3/D4zO20/neFL/cv9UYPTMEVJkATabH+xZN/Cvolz/v/8y@lists.infradead.org
X-Gm-Message-State: AOJu0YzpKH0lXlkEhtl5BYN67vT1d9BREYV/a6Z8DUUTYuNap+dE0WcZ
	KzaP8IeJwGcCfPBhvvveSUQxMt9CfMoyIUPswi1cyClwP9q4VBxJUKuBKiJCNA==
X-Gm-Gg: ASbGncsNQ80Zx1nWSbVAox+e74tkMUxc8Q++VCMBZYuyIAqQ3jqzDtdx8LKaGxnyNOv
	CUP1cUJHlgATPs4P9YFXd0oiD6nUoY2G6eSnACiF+9RwxTjWSIgy54iBcapHcbNBsv6wTOGyVlY
	EX3cLTHiQn6/+qHm6ztsNDf6nOUwKGIRiyHRDAUhxnddN4rlbU9f4wVeFvHKMQgSE13UAxkaxhX
	eN2wvEpX6skz5rC2ojnK/2rCfSqDCB7Lv4R8bmvielVB7VI8Xza4XEDP3UxdIM/IiTVaRo9jyxs
	10Kx4Le0kJmCJYIRfvXs
X-Google-Smtp-Source: AGHT+IG7pit3qrybh+dX6LCCHFauPg+ewGevbEpdjxdDr6DQ7XbMIITH4874VC47Iw9X3OLAW6gEwg==
X-Received: by 2002:a05:6000:1563:b0:385:ea40:b46b with SMTP id ffacd0b85a97d-388e4e1514cmr38438f8f.4.1734464528392;
        Tue, 17 Dec 2024 11:42:08 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ad9asm11843854f8f.58.2024.12.17.11.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 11:42:07 -0800 (PST)
Message-ID: <9952cc14-72a1-4a56-977d-58177d6c553e@broadcom.com>
Date: Tue, 17 Dec 2024 11:41:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] drm/vc4: Fixup DT and DT binding issues from
 recent patchset
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_114210_534667_B91A5A0E 
X-CRM114-Status: GOOD (  18.53  )
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

On 12/12/24 10:36, Dave Stevenson wrote:
> I missed the DT errors from the recent patchset[1] (DT patches
> in linux-next via Florian, DRM bindings patches on dri-misc-next)
> as Rob's bot report got spam filtered, so this is a fixup set.
> 
> Largely it was changes to number of interrupts or clocks in the
> bindings, so those are now covered.
> 
> I've fixed up the missing "interrupt-controller" flags for 2711
> and 2712 whilst here.
> 
> I can't get my head around what is meant to happen with ranges:
> "soc@107c000000: firmware: 'ranges' is a required property"
> The meaning seems obvious.
> 
> However if I add it then I get:
> "firmware: '#address-cells', '#size-cells', 'dma-ranges', 'ranges' do
> not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/arm/bcm/raspberrypi,bcm2835-firmware.yaml#
> 
> There's obviously some other flag I need to set in the bindings,
> but I can't work it out. We have similar errors for all the Pi
> platforms for one or more nodes.
> Please advise and I'll happily fix them all.

Dave, as proposed earlier, I have squashed/fixed up the fixes into their 
original commit since those were only in linux-next. Thanks!
-- 
Florian

