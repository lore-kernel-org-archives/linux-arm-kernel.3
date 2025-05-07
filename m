Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F882C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcOLMbYlvwqOTROoo3srbEJTigUJIWnrqfB7khtMLAw=; b=sIIK2JtvCX5PUGqZjGr8mk1pR4
	PgIDRC/uYFj9qq29L/7bWlEcdPGHC4N2L7uyk0+2AKZmpPpz94TDv3uNaHWcT6WBgT/W40GAdkduu
	Gom8W8h6Prouvhaj/dD3zT5D//EYsFfXD/kD7J/JJ9DOmLnMDlXTHLQdIW+PC5glSJRJzgmvn0eW2
	a/lt/6slvSO6Zo5egdzPnMfPTMV3bfZ5k5Md6/8H5NdfFg6K2vevxwS+Cc9NOwVBkoK3N+Z7RjTHE
	opI54PVYhMH3YThW68Ozx0wuLq4M3gkl3mqnsyphB7xXJIMJbDC9V5Gc3GzxDS14oKqBDduij72AS
	mH4WKlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCikK-0000000GN9m-3pYV;
	Wed, 07 May 2025 17:39:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiHy-0000000GG7l-0zop
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:10:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so841195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746637832; x=1747242632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kcOLMbYlvwqOTROoo3srbEJTigUJIWnrqfB7khtMLAw=;
        b=G9N6oyViGspRIJ0WDxgh8HO8amlux4rwxRyMWZMKs84ZOLfYiH+RTH8+nMMv3I+pvA
         3eoE+1op/7C/NHn/dxPJ8N9Afv0cg7En+ZdYPPpgb7Xfw+xFggIxCX7+p6O665y20Snv
         XVKM4+5M5d8HFwgre4kWbocyDK2moOZ2zoybQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637832; x=1747242632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcOLMbYlvwqOTROoo3srbEJTigUJIWnrqfB7khtMLAw=;
        b=qimGu3TLQ7zbnB41S8ST/1HkIBdpkSiI75tshpeB35or+QxAsZz6uAvYjVT9mrV/BI
         80pJ+76/9j9UjgkWLXxgFbCRWFAOj+VOZ9y3jpD/v4O+gUnsi78AfusA6qr3SNwykrlC
         vsglw5xMqYxOkE6nBAHV2d5z6tpsJcSX0MFYzz1h7oe6Lzx7kfwHfCkfGBjpKfmKtnzf
         H3E8iCq8Xar8YhQzURT6EnOM7VhG/rr5p7KM+aBeENsi5fXJCRnUN0z6Lb9UbpoIuKWg
         OOG/lyGVze/e/toaF0ftFzrtEZtE0p2dXW/zHw0BM7l9mM4sYJXSch7HDszmtBGT/rEA
         RY9w==
X-Forwarded-Encrypted: i=1; AJvYcCVmBWWKX+PjajK2ZHi+kPF89ffRykeC+lbxq3SR1P89C14zgz+NSb1xTBZMlW7wcHz8OwcqpvMVin+lGRpa/YX7@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg3c8y1wWZ87aN6dydgL9tzJebA7RZ8JvnivleVM5prwRYvp38
	0/JtkiRXgt6ZXlhXbEapyKkh3Qpm6jGTzTD0ywgyzvD9+/iaHsQBdBRvnGgFcw==
X-Gm-Gg: ASbGnctwdfOLTLVE5k1BfOpGN9GdRVhyNyEwZjgObYhyfwB4HKjqYgewdtZcYvSDfU7
	yxT8NeXKpRuFrAyRK7HnNRQBKK8m8wg39DccF4yP+oHR0ykH5Obb/QbUsmSF7ogUoRVRH+/94fm
	qf8u8YqEBF+cyo6gdySsPC3m979N/WuLXydUlhIGrHLmqxVmGxh4TU6lBaw4McmznvVKBpiZ0po
	feCJOCJI74dGuVoeYmNKXGiVQFGh8+xCwR1zrV+D+PEGsjQXb6JMWA6vJeLdr0U14dd+1wyAQsy
	iHPSO/hhksyV0nj4YIS3NBKeuG8FC9r5ZquLPdgNxteq/pSguNnek7ieHG1MUJ/g7CZKjveoBpr
	V3tZB5a+6PKxO7f3VcmzCa/2pkhJvSu6mepJMkRo=
X-Google-Smtp-Source: AGHT+IFfi8UuFAYQjEy7l3BA3dJvfF0+JO48+2QUY30u6pN9hylsIH72wrE3T3OJ8QBiBWVpD2GDFQ==
X-Received: by 2002:a05:600c:8714:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-442d033a3d9mr3016065e9.23.1746637831970;
        Wed, 07 May 2025 10:10:31 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd33103dsm7143265e9.10.2025.05.07.10.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:10:30 -0700 (PDT)
Message-ID: <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com>
Date: Wed, 7 May 2025 19:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <aBtqhCc-huQ8GzyK@apocalypse>
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
In-Reply-To: <aBtqhCc-huQ8GzyK@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_101034_423355_998599DC 
X-CRM114-Status: GOOD (  16.73  )
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



On 5/7/2025 4:13 PM, 'Andrea della Porta' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Hi Florian
> 
> On 09:32 Wed 07 May     , Florian Fainelli wrote:
>>
>>
>> On 5/6/2025 10:49 PM, Andrea della Porta wrote:
>>> Hi Florian,
>>>
>>> On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
>>>> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
>>>> Add clk_rp1_xosc node to provide that.
>>>>
>>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>
>>> A gentle reminder for patches 8 through 12 of this series, which I guess
>>> would ideally be taken by you. Since the merge window is approaching, do
>>> you think it's feasible to iterate a second pull request to Arnd with my
>>> patches too?
>>>
>>> With respect to your devicetree/next branch, my patches have the following
>>> conflicts:
>>>
>>> PATCH 9:
>>> - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
>>>     reference at the end, my patch was rebased on linux-next which has them
>>>     while your devicetree branch has not. This is trivial to fix too.
>>>
>>> PATCH 9 and 10:
>>> - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
>>>     added by Stefan's latest patch for RPi2. The fix is trivial.
>>>
>>> PATCH 11 and 12:
>>> - arch/arm64/configs/defconfig: just a couple of fuzz lines.
>>>
>>> Please let me know if I should resend those patches adjusted for your tree.
>>
>> Yes please resend them today or tomorrow so I can send them the following
>> day. Thanks
> 
> Sorry, what's the best wasy to provide the updated patch 8 to 12 to you?
> 
> 1) Resend the entire patchset (V10) with relevant patches updated
> 2) Send only updated patches 8 through 12 (maybe as an entirely new patchset with
>     only those specific patches)

Either of those two options would work. Maybe let's do option 2) in the 
interest of keeping the traffic low for people.
-- 
Florian


