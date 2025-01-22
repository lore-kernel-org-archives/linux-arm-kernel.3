Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D52C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 17:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR2v5i43Bog5zABHex15udU9qFqwwYZ2gE9luM1Vgms=; b=2osiZw49RuyBnbQ5aot+o3EBPw
	GMmtt4ov0BrWhuZ0oT45I0hvdZkRcY4gi+hcWXjddRfz6pwU2BYsl4/Jmzjx16Rq1nKdDWQz22fg4
	oNtXpLJaPOLYiBue5kzsm3+ddt3v30P+ufBvWbhyM6YmNLYkkJl7uZuGefAuGi8vAaLpBtrtNbKRm
	iNg2lkFPVZG5hpht7pstK+beDX+rTc5HoZjKj243cwlvhYwvKhroOkqDlh/JIXQhThELEvbxXeJTb
	J14lWYT2FwIJA19wQPeMZ/ORR2+wLQOaQKar5Rh8G49znDcqGFIC87efJDyYTSyAlCiglUnPAAtbr
	YTOUPtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taeut-0000000AvpS-0wrP;
	Wed, 22 Jan 2025 17:53:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taemL-0000000Au5o-070o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 17:44:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2165448243fso157303545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 09:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737567876; x=1738172676; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BR2v5i43Bog5zABHex15udU9qFqwwYZ2gE9luM1Vgms=;
        b=ZlaYZhdxeBVLEg+relp+bWHfx3SiTgrZWq3tyKUMcrrdSCoV2fECjDiO97urOb3rI8
         H0xSRZIZ4SvFtCkWn8SUkQKQR0BrLoIKYF9hXaLqDmn/9nBHPDfGItKBvJRM0YOq0xYB
         wBfTi6LnIP7CVJMIbJAKkLypbIBsmRyiaeGBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567876; x=1738172676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR2v5i43Bog5zABHex15udU9qFqwwYZ2gE9luM1Vgms=;
        b=t69a/0oWfGVGvtQLRyEzr7G1Y3NBNhU1JnrjbStGl8hEyiX4ADtqgPYPVeF9WCVMZs
         SNjev9sVTsTZlKexNk7kpkFtojnB5EnsinmouKvTANcp5pvx1NT9VMycZnQytccvJvrr
         S0gc/4vrgVE5mpivQKE3eahSPsUgcoEAgjT7lz3sMWFv7VWLUlbM2+ZW7xUCzN2So5qP
         vUT1FcTV8iIvFddHQ51qxX8o9F0ZIwm2M6yW1xTkqX4SuSl2uAMy3f2/mdPif0H8oOtH
         RXmBWB2Xw+50SdaFw3ryvB5D5KONshYBHrHAX51ldyySfF/PkY//8MIzaqM7bj8BkG8O
         WegQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK38VtzvaDZyxkocmEvaGrDyOep0vdmbRPlZ3SPkHz8kLVP5jVv8yayRC434UPV4mko/GMvTnzWA4lF3aqkPB4@lists.infradead.org
X-Gm-Message-State: AOJu0YylFAVhQdZYrEl+bWVcJ1RdeeftsJY2slABgsN1VWwPO/Sz8GzG
	5EHj4ZjgvxJkAzApT/IvU0ricBdNE65x7AwErq27RnmDTmuIdRzozUZZclh5lQ==
X-Gm-Gg: ASbGncsA/PyNWYavE05yv9Px9mEgFvds7Xejugydc8Umhc6R4fCFRzQlqls8jstM7Sn
	4ejuR//wvFuH+xH1XjRCDeGGQNbvo5SgtGF+/70m9jGsETSuiTjj0SWi1YaHK13r/6QkdB6rSRT
	hWTqfd/LyBFZ2dHX4Nesslqbl1YZfk8vxJ/n57aNSQDVhHkvnRzwGKshSQSDZJFg+dS0upzn73V
	PXttDsa5ifKFK5Uj1zP9nURyyG4j2RARBd8Tsh/W+Y2vvtOLDuSjbvPESpk40nCrCPnOU1MXjDy
	kdZ9HkXn4mCxWfYS2ACcJBN1xmvZQa3wFiDy/xGqjehG
X-Google-Smtp-Source: AGHT+IE+5+CaTWhm/ASDe5cn+Ev+JcgtwwOvdyaXdz28CDWXKRN9CPb0wgEEHqEsnMDhyCiUdTVObg==
X-Received: by 2002:a05:6a20:748c:b0:1e0:d848:9e8f with SMTP id adf61e73a8af0-1eb2147dd69mr36855295637.13.1737567876418;
        Wed, 22 Jan 2025 09:44:36 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcaa3a4dbsm11025598a12.12.2025.01.22.09.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 09:44:35 -0800 (PST)
Message-ID: <84b0d614-61c4-48ec-b7a4-d83eb8672858@broadcom.com>
Date: Wed, 22 Jan 2025 09:44:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
To: Stefan Wahren <wahrenst@gmx.net>, bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241217193356.111102-1-wahrenst@gmx.net>
 <20250114231638.511804-1-florian.fainelli@broadcom.com>
 <cc710138-aee9-4d10-9ec5-8a017c19dff4@gmx.net>
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
In-Reply-To: <cc710138-aee9-4d10-9ec5-8a017c19dff4@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_094437_143796_388330D0 
X-CRM114-Status: GOOD (  11.19  )
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



On 1/22/2025 7:01 AM, Stefan Wahren wrote:
> Hi Florian,
> 
> Am 15.01.25 um 00:16 schrieb Florian Fainelli:
>> From: Florian Fainelli <f.fainelli@gmail.com>
>>
>> On Tue, 17 Dec 2024 20:33:56 +0100, Stefan Wahren <wahrenst@gmx.net> 
>> wrote:
>>> The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
>>> multiplexing for I2C0") introduced multiplexing for I2C on BCM2711-based
>>> Raspberry Pi boards. Unfortunately we missed to enable the necessary
>>> driver in the defconfig.
>>>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Link: https://lore.kernel.org/linux-devicetree/961b3d43- 
>>> b4c9-4573-82d7-844aa129d994@notapiano/
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>> Applied to https://github.com/Broadcom/stblinux/commits/defconfig- 
>> arm64/next, thanks!
> i can't find the patch in this branch or in linux-next. Do I miss 
> something?

It was locally applied but not pushed out, now corrected, I will submit 
it for v6.13-rcX within the next two days.
-- 
Florian


