Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017B5C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZ5YX5z3KBN085PsYk9M8htYCNBDm2d0pRk6SE3Tnco=; b=Y6crcRy35g/PH8VhXJgQGiC6qA
	MZdd6194cy6prcpTtHlbMuQLGp+oISbhjMKxPhw2fKxHkyHSe7tusYABigmp+Tdaf0t2bJLFsuN2t
	zWMk1qWUzmlsIyCbBZEzxH0Cik+GUVT3hj8TeUC0aqzEoTQ9MVFv4fkg5VhsUASnZHSzoBSJ3IQ04
	SsD5DrretAI6g6pIbNch6YcdkozQtjHGUMFn0rsAquKauG7jEbaqpkfw1m+97Oh1Mjfl1eWuEoO+H
	AQkXyfe/ldvpoz0vkkWeyewdJtM8CRMYJJi6HwqdO6060thJhWRttF20ISviAIrFKfKsraxAaWgdg
	Zv0YNXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVJg-0000000BTKK-42xL;
	Tue, 03 Jun 2025 17:20:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVGU-0000000BSvm-0Xps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:17:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-73972a54919so5216467b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748971049; x=1749575849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ5YX5z3KBN085PsYk9M8htYCNBDm2d0pRk6SE3Tnco=;
        b=a3YGFZiZCisH253yzciDhztfQHmCdIfIKt5Telb9a0RRackAPka1pdGTTuY1g7QrBN
         pyQnOrK9Hm+S9v2kxAdbAc0+Kbm8CSm6ZiRUgNVXa0TuWhayy4D+VL2K5kavRW90+tx6
         KUdmD8FIPpeaFbIvSVOdPZkn4f11S0qIXejlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748971049; x=1749575849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ5YX5z3KBN085PsYk9M8htYCNBDm2d0pRk6SE3Tnco=;
        b=XG8wC5oEvrL/06IDNGGAftqoGIpgh2Egw0Pu1ST2ueBShUIrCEvShalyhgLPVbDN5j
         UCzmgCI8pqDNbmsZxFw91qWH4xsjjtJ4GkQwiF1m7Gy+k+ZveO9gZDHUjx2NaygDcKYi
         x1AE1FIMF2h7nfqx8S3iWySqRLwju9rQDb7P4ScX3Z5e7ZJQNumbmWjDC6tW7VuhhNOg
         bu3g0fYy37c3XFEKwFSNsk2G4uBjYWVGa4iMeBza+2+lRbMZpfYWiew6uidEDzInB3dO
         iSfSQtzxctUcXHXzZ8qQTT6Ypf52jWC/7Hs//ISwoJW1bJ75MF4icV+5zip9tI549YXi
         2fMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU7ZQ7g5NmKUDfKVA7NGszOkZjOkvUY+K6fBNyLhyhaIWd0ubFeU9DOw7mgLpJ1IwCqmZzlNBO/JvYRGeSNlbd@lists.infradead.org
X-Gm-Message-State: AOJu0YwOxzpqluRpXfzafJJVokm396+KU5LdSEJR4Yc3bu8fEDbi0Ua7
	YSHTFV59PFw9CknpsqXRf4gvb1WZn3gN0+SiR2PYiCMlJ3kvfQDkORUWVB/HF11tvA==
X-Gm-Gg: ASbGnctXuAwQ64cF6xCYpdArMyVsmC7amY/dMfWmkXdyJognGY+hVOHlCMXJ6orW2DM
	JlHtiWICI9g+Ik+hxsXjIIyQSziQvjlOCjj6EG85kannhequxZixpzT8j4a3jsWaGvQus2jvU5/
	c1Y762sGYHwDHdHCRCLPzWnSCtko3KDoKzSKnuxnUf6k9rQGy0WSoG+XFwODDmyeQtM7ytVGRih
	J53nG2vUgyurz6CUY9E1FvB4tkWbuBrbOCVwDlnDMYNhG12vTKQiXjYcFsD1wlaEl0ZX+JoBguT
	P9CoITZ+vuP2AtN2qeMZH+ZwhqiGt2izTUX7l2dRWmO4bvnp+ppyJ0iPZ+BRBV+p+SHm4E8OEWw
	+KBEmFKwzh/7nbZKX7yk8MpAlwM27yz0w4qIbxlHk34vWoEQ=
X-Google-Smtp-Source: AGHT+IH5GulsAjqe5CcgYA7XklQijHBuhHK02IVeHV6VG0dpYUeRl+hBb/uGE/suyrCQ+bYpoUsRKw==
X-Received: by 2002:a05:6a00:2da0:b0:732:2923:b70f with SMTP id d2e1a72fcca58-747d18a68e5mr17089629b3a.11.1748971049157;
        Tue, 03 Jun 2025 10:17:29 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9670bsm9639276b3a.30.2025.06.03.10.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 10:17:28 -0700 (PDT)
Message-ID: <3037cd65-89e8-4029-9ee2-4695db5987ad@broadcom.com>
Date: Tue, 3 Jun 2025 10:17:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes
 property
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250530224035.41886-1-james.quinlan@broadcom.com>
 <20250530224035.41886-2-james.quinlan@broadcom.com>
 <6c3ec1c3-8f62-4d76-86d3-c1bbe3e1418f@broadcom.com>
 <2f79ae4e-6349-472c-b0cc-ea774b8ac7cf@broadcom.com>
 <CA+-6iNz48EFUGUOiHCSaqgsU_tKGV1=Xvw4fjoUS_AMhUHAi6w@mail.gmail.com>
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
In-Reply-To: <CA+-6iNz48EFUGUOiHCSaqgsU_tKGV1=Xvw4fjoUS_AMhUHAi6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_101730_162454_41861B20 
X-CRM114-Status: GOOD (  11.36  )
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

On 6/3/25 10:16, Jim Quinlan wrote:
> On Tue, Jun 3, 2025 at 12:24 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> On 5/30/25 16:32, Florian Fainelli wrote:
>>> On 5/30/25 15:40, Jim Quinlan wrote:
>>>> Add optional num-lanes property Broadcom STB PCIe host controllers.
>>>>
>>>> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
>>>
>>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>
>> Sorry I take that back, I think this should be:
>>
>> num-lanes:
>>     enum: [ 1, 2, 4 ]
>>
>> We are basically documenting the allowed values, not specifying that we
>> can repeat the num-lames property between 1 and 4 times.
> 
> num-lanes is already defined as
> 
>      enum: [ 1, 2, 4, 8, 16, 32 ]

Right, but then we need to re-define it with our own specific 
constraints, still, don't we?
-- 
Florian

