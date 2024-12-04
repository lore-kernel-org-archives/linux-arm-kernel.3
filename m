Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC60E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeaxonMXyIRT226phScRmc3Q71XZjLqP8a2LkKst8Q0=; b=IPh4HtO+52Idw3i/EZPVTHFLQA
	g/1G/lGWCjgZ88JlNMxW1bDGKWlgxKuRXqrdnXes+joo8qhfD5wkm7KqqN1g/GWeI5QxcZ5+q1Oho
	S1C+uae7yVQFhpeUslwSoTFc1heQAp8Q7KI8vs/JKHgn2kykPLNcasXT4YUOd6Db86n2qs0pTenuZ
	r7VYzQmTfqcZaf1DHCaRJGgI0STJy5WPLQXU6hNt3HI0t8itRUSsLVf6kGjjIQO4MXngZPSsnpExG
	Ju+NgjSoM87lbzGJYPOiTk2vXBYwKy2yMTs+u7ObNrOHDsqFDAa/zkEDmzXvOpwLvJGgnwz94dp5l
	JTuoVY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupJ-0000000DdiU-2tFO;
	Wed, 04 Dec 2024 19:14:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuk1-0000000Dcgc-0sPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:08:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7252b7326f4so132238b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733339332; x=1733944132; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CeaxonMXyIRT226phScRmc3Q71XZjLqP8a2LkKst8Q0=;
        b=atiCEHmioqz+whXvT5+OfQSR/0NNv0ov4BpKj7jfMJwFOWeHvewjeBuEWNTB3icGtp
         SNCfF/PBudbD13XQVaRu5V6Fl3RLJuZvGXEU/gCLaQTnpqteqRwvSpAfdPLOKfF4j7ub
         UwvTCC4vx1asrh5pYYuT2W/bes7seghLsYcLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339332; x=1733944132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeaxonMXyIRT226phScRmc3Q71XZjLqP8a2LkKst8Q0=;
        b=sImeym47FHEPb6iaGQJj0/skiDl1JmY2P4+0sb+8uDnmFDv3ajMJIwcnIYjE8fhhIy
         MsXgBvT3thZ6rMJ6KOOtXdtmqqbmeSCWAcJrYoI0iRrCAirWqSu299i4H7e37EzsEID+
         NrPiI796iuvIh1ApIl5MBmFyQWSIuAPqOknuzemY7nd2vABFW8N48n1nTuBEI5vjcggV
         IfHwkm8VWEzcMicql4CAn9GdsPoWgHzCf2cRMQgmP/lSsQlStykQg1uztfTflXgAZ/WS
         8MI8Ql/vcNB4bv4erACc3OVPxOuzPcxaF4ypGI0WP8RXTYRf9/+0HJ+W1tUNOP2JkicO
         WsEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhdecQtuVLNFT35ypn7h3jQnix6+4KlEtowiNkg0CfsN9z/0dC0Qjjf3aEdl+QFhS/pv+ZPjt08S5IX9DHI8Ks@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc4oUhzOBF/rNyK29H5KPUkTs2+xBnI48UFNqOg7QadUbyq0OS
	bhRQrStHdd9mAEJMvfHqEWG5jhMxpa8rlb2kYqMM95v6UuVEl3GSkWkRn6gxbw==
X-Gm-Gg: ASbGncssO6oJeRuMFlpqy/Fs25CNPiSGiViJOZxHG8G08bHE6H2zicDAf0M+Vta4WQG
	8vvPgbhRVmp3hd1D8SpGDWOOwdKoi3A0InFddoZ4L0UEPH/9DiNkO9vP1DUSOYNM7NoQIoK5jpN
	w0oN5SsatWqquoeCco4g2/n5roVYW9757DO5PLxMPZtlE9fntcTJeJXiG3q9o1cSUevJPbz37fm
	sXsWdhUfc0bqTw2eV5UWg7Oa2u2hmboPN8XSuAww8+hJztL+++ukrHyl7ea8/C3Oke3bOEe6v/i
	0mZv5+zPJo8EdQ==
X-Google-Smtp-Source: AGHT+IGmY+qzKW/9TmwBPBzx791pCA1vC+Wl3B3mwReYsRw8915lr3trZFeoT08VDI12exU8vOaX7Q==
X-Received: by 2002:a05:6a00:230a:b0:725:4109:5b5f with SMTP id d2e1a72fcca58-7257fa611bfmr12599475b3a.8.1733339331930;
        Wed, 04 Dec 2024 11:08:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72597347ec0sm946638b3a.48.2024.12.04.11.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 11:08:51 -0800 (PST)
Message-ID: <4ab9673a-03a7-4358-b95d-eef514607bc2@broadcom.com>
Date: Wed, 4 Dec 2024 11:08:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: broadcom: Fix device tree errors on
 BCM2712.
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
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
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-7-fac67cc2f98a@raspberrypi.com>
 <44c233d7-87d7-4dbb-a0d0-9e93ea497622@kernel.org>
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
In-Reply-To: <44c233d7-87d7-4dbb-a0d0-9e93ea497622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_110853_267766_ECD65773 
X-CRM114-Status: GOOD (  12.30  )
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

On 12/2/24 07:24, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:32, Dave Stevenson wrote:
>> Resolves the issues on clocks and power nodes
> 
> Which issues? Be specific. Such commit is unprecise and not really
> helpful. We see it from the diff that this is "some issue". What we do
> not see is WHY and WHAT the ISSUE is.

A link to the robot email would have probably been helpful in 
understanding which dt checker errors are being fixed here. Regardless, 
as indicated in patch #4, those commit messages will be discarded since 
I intend to fixup the original commits directly into my tree I would not 
put too much effort into addressing any comments there, unless there is 
some piece of information that should have been provided in the original 
commit, in which case I can squash, rather than fixup.
-- 
Florian

