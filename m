Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E08C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 21:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGQo42bPBIeGM7xGkyPrzTeu28HqdSS9vy6iWRQ9EnU=; b=TAg/elef6xqZ9OXjNJ8M1tJ9BZ
	tVbWpuJ5CwSnkljOmWGED+G2d3Az6bwiqaP1Mc1ApYDIde0JrDAMVPtvQRZZZCBU5XjJjog1vg6Ax
	7V41Cuwta6Bv/sXecbMpegFBBcMtZiIKbJNvhHZLDvude//d5ToUwQoLBkNoH/nkLjds/IxECdjFJ
	trXcGVR+3X5V5/sVYYlXvc+trbQIi8mubYh4LBRwqhCFR26h3Lclpw/ECtk+ARMbdZbR/2D/cishX
	xMNEWap8f/VVCMmRKZeA/mZaMI5GLgdMjpuhM+aWGicNMsyriF/aGpG/NDoIvjU/7iAtekevoPcNl
	0znHqeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucW74-0000000BA0C-2EAt;
	Thu, 17 Jul 2025 21:25:58 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucW4b-0000000B9u4-2PTG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 21:23:27 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fae04a3795so13290586d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752787404; x=1753392204; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WGQo42bPBIeGM7xGkyPrzTeu28HqdSS9vy6iWRQ9EnU=;
        b=BGBHXRJMGVklTwLZIRjWnXr2jilyxknGqxlOBM9d8b6YifL7bJ+fozNou9tFli2TV5
         wjGebGqQ5shhncnk3vIQoWeHbmReQGvt9HGRSpZbbjXlmHV0zJV+wdw3ChtvNiAdjFLq
         mw6WN1Tb8v6NCk5LY6gjkpVFmXr2zQZiRpioo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752787404; x=1753392204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGQo42bPBIeGM7xGkyPrzTeu28HqdSS9vy6iWRQ9EnU=;
        b=fPfc6AYBJ/WifXUG6DyD9xDUx6F+ASooQOsH3frj0o2rqalSj5sTtoKAtc9ifsImFL
         ZCh9SmIY81PeJOgBI4z9EdXFF0DYuIU9HqjlW0KxY80d8UGNDJaii4jCTUXI1Asilmzj
         xDW8WkN7P5pnSuVvnNEMQZCaW+JAf+srQgzwMxXRLl80FgE3KcKp+9DF3JmaudbpHt4P
         v7wMNHnjGYaZKJGilia7zVVghwR8j1G0RJAfBXDn7thftTsoysQS7U5p4+xMOFN7oVrS
         kflPZqZgSQjsSaEK7jmrXckcC6C/VcZjDmnhTAJcCIYPWP8tKvtrZ25cMOyU5AlmjwPt
         93wg==
X-Forwarded-Encrypted: i=1; AJvYcCXljQyCmd3SSX6OQ3w0oSl9GrpVL3IgUZs6z9SuQLGgxpnbeWrrKlIyCSN4vu0+/XQKZTSQnX7l1qI2npCvhW+p@lists.infradead.org
X-Gm-Message-State: AOJu0YxKHZIkE1W2g5mMGodTE1NpjVdxOxli+jZYOcSmEyu+mWdjtowh
	TRabVUioglGwO2rrsDBCLh/FqBJphB77fD6aeD0ZJEzq9K8Rov6xw/NMWTjc6vLqxA==
X-Gm-Gg: ASbGncssRLHnrr+bVW3MUQvJVUXkdj0HaGnE6vXUcI5hYYR1Y2mcOR7tNj05LJ9YcQu
	44wdD5BwAmmOaosHko0yjdQQ3Nt0H7kU5MbStN626sjHH/xtcFFUqLazpIVOi2S/CvxF6Y4lQLK
	Q+1cQAzjy3zeuoQz2uYziQG9gTD6DgJVHt5UFlNkDtvtmhs7K9p6GNCtOCLMV2mhrAXWbLNBAfH
	X8QHdFQ1fb29c1imE/WxN2GHxqtR6mO2VMhrV4Qpu4ER/6ChMLyw8mvn+3DaXw5SBvfu9bLA2aM
	g35M58LVcj5zjFFikDB2vRgnyShuzEK47gdf+7BuXx98stlnmkGNACLKQtJGkf8dtZTB5Jo49aC
	+YgUZCVe5RsbUwkrymwCnC80msb0R1EWYHqnNvJD4qexfZC2bbbKxriYByVjGojAcpmoSKn3V
X-Google-Smtp-Source: AGHT+IHpve3fVu0HltyKOyRRlJFRsFzdsU/suMNJJM0ivrDzSlO2Vn2cDGZWsdanj6d2xCh0gpH/GA==
X-Received: by 2002:ad4:5be2:0:b0:6fa:fdb3:587b with SMTP id 6a1803df08f44-704f47f0c31mr117322876d6.1.1752787403711;
        Thu, 17 Jul 2025 14:23:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051b8c04fdsm533226d6.15.2025.07.17.14.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:23:22 -0700 (PDT)
Message-ID: <923a455e-b1d2-4ea7-a620-74aa040facbb@broadcom.com>
Date: Thu, 17 Jul 2025 14:23:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PCI: brcmstb: Trivial changes
To: Bjorn Helgaas <helgaas@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
References: <20250717210043.GA2654580@bhelgaas>
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
In-Reply-To: <20250717210043.GA2654580@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_142325_644243_02FF9579 
X-CRM114-Status: GOOD (  11.38  )
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

On 7/17/25 14:00, Bjorn Helgaas wrote:
> On Thu, Jul 17, 2025 at 06:17:28PM +0530, Manivannan Sadhasivam wrote:
>>
>> On Tue, 24 Jun 2025 16:19:21 -0700, Florian Fainelli wrote:
>>> The first patch removes Nicolas from the maintainers list since he has
>>> not been active and the second patch uses an existing constant rather
>>> than open code the value.
>>>
>>> Florian Fainelli (2):
>>>    MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
>>>    PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/2] MAINTAINERS: Drop Nicolas from maintaining pcie-brcmstb
>>        commit: fde41f282590b46e96864ae88da2e2c20a967b3a
>> [2/2] PCI: brcmstb: Replace open coded value with PCIE_T_RRS_READY_MS
>>        commit: e8e7c1e95d6d4ccdc53654a5966d2183532ab115
> 
> Thanks, I updated s/PCIE_T_RRS_READY_MS/PCIE_RESET_CONFIG_WAIT_MS/
> when merging this branch to account for the removal of
> PCIE_T_RRS_READY_MS by
> https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/commit/?id=bbc6a829ad3f
> ("PCI: rockchip-host: Use macro PCIE_RESET_CONFIG_WAIT_MS")
> 

OK, thank you both!
-- 
Florian


