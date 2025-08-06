Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48043C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia3SLEzSRc8nG56lmpcOP8Y+PfXfHWZspV0p+jrskHQ=; b=bZRgJR1CrJsf4ALzlT2qukWTxW
	Gwc2sQP7kDvwij9QuqyjJdHcwIUWD5UNDspuwo1Yr4xBrZJPACWoC8rTHk7uU80u4PK9qt0RwwSVz
	E8lk4L5l8BPdPLYNXPF394cdAMOef46Unqm1NUpEHEk2jevekkK/XzrrV0/JaiejLCLvXI08kWTLL
	uv7RocYHuK9j/SU2Ci+ALJzg6lYsHpTy50zIxd68VMnlsKjCK3JMx57zH3wV6G7ObUp5hm9Da/N8b
	9f0ScfemLbVRpi/szu2MNQbsKCVfGKWjaHjmwOgIVMDjePdW1eRLDbZRgSpnhWqVQLA9hZhoSnSW9
	Qu5+/dRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmVu-0000000GiMh-3oG6;
	Wed, 06 Aug 2025 22:21:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkxE-0000000GROt-1wK1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 20:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ia3SLEzSRc8nG56lmpcOP8Y+PfXfHWZspV0p+jrskHQ=; b=DgVrsdGQf8oUcqrMiGGuzf5Ach
	82228OwTvU7B8MgGaGnMaObJiJ0n/pAXB+MzDvPpkYHKLPzd/E5sri9kEGT0hq06ZCmzgbvFiAzpe
	0zWj2QW5E7DcWmSb07vffljlp7JVBBFvp5MCO1n1AlgSoLJmDe+TXUjaWnviiA8iet618Ny732K0O
	EyGJ2wPK1fpxIka5gwQnF9MV2Q/qhUYqNApRi28ez0YYGFilHld9W3W0odJ1qcS+R6X7swfWZU4Mc
	EEQsQnHC849f5M4nUY+CoWcLYd7EaflzYy8qmQRWU/g4VNJiBdypQXp3sR+awN0lttPwgp7qTJ37H
	8FcNgb0Q==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkxA-0000000EOZ0-3kPb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 20:41:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2406fe901fcso2674245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 13:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1754512898; x=1755117698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ia3SLEzSRc8nG56lmpcOP8Y+PfXfHWZspV0p+jrskHQ=;
        b=I5R1lxuRUz8wUkdWUqJPysoExbF5FqifM3ZDBN8hjmy3m6ORV8oenQhHvLR8WqDo8s
         cyH551vhJxfgv/CyJvJpgoNe0ugA0PBHx2870PHfyk4X0VbXpPXdyEqf0ANQ15VAsrau
         Ng4jZcwYxToaqCgf1NI+aOgXL7fFfO9nUahOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754512898; x=1755117698;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ia3SLEzSRc8nG56lmpcOP8Y+PfXfHWZspV0p+jrskHQ=;
        b=GUjo6piTbHz6ACz8LsDdw8VfXF7Z5ldBUcOddMKkok4CFwCHrsYmZZ52R7qzW1ScDi
         VoQfw1o2Vbf7Lm0WW72hIJf0ie/jsF3q030MztJzD7UbI44iE/wsm7Nkcp4pMhdCVCEz
         sNdIMQWNDfxSyAqvbx214wHCAXnQKwNVvKgVZXCNTFjXt+Sw8MkJpm4inlC5HLiJbzpz
         1M06TRFQeXjHupUzn0IRd0Jr+5ES9H1BW9z4XEZrzLMb1X5TnfiFDE8QIiJF47TT7oSg
         0XF0krRIFtsfeKVqX4MnkeDByQr8y5RUUudqK8Q/zWQTr1kZGwqB22ngbGlDrF7gb0lv
         VHfg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ2RAF70bqZWWURHrPD28WsMn0pWUyMmqTMPi9m4I+oePgTuVyGL8s3kGdkCDpu28eve3xJEy6BtC6uxxf0TRA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6igiZ/NFRNM9FTgjMHa9Pyj3WkCXfzAKAm75t5qPzWNsOko03
	DBSUNRSExwDeNja1asNwFGp553NWKF8owYUk9nfVBlz0oIKPnGXo4puwDM/24Kcf/A==
X-Gm-Gg: ASbGncvsjHyL+SX6mVBZOm1QfYPoSd7KtyeBIYrbBneo4+imkBXxvBMhqzh8BI+JF9H
	JtLHiyMJo+6E+2pipCVA9OlbDpwB3riEWDua5wvLownR7z6N1/FaI5zTMdZSb7rVgXZhLWWllB5
	nY4lhGG7VOC8rdN3kUA6y+15r/iUs2etF1q0+/9rlU52icjtuQH/ACwayivLv3cQyXKZ63gpSb3
	0E8H3N11VGNzwrQfNLfwGgqHqVMPjFfS9q5ciVlZ8IBLqJnFpj11/6rEdovZ7hGqrWzzehF7HW7
	Br0uIDzU1LGkip8EJ1QezvhFS/RtJiWQaXZaBjzSfQy/mzHhDJepfxN82lvlBhOr1qodViNtjTw
	UyzYQ+6RjcS9X5HX4ObyzLt+bgOUwSVOMh9r6XTs4xVBBCoN5xPbTwwgqmpvMtQ==
X-Google-Smtp-Source: AGHT+IGsVmEZizu/BQRtnZByDcXVDlU2OY7UH+LY0vzm1LBEU8C8nipRQoH5hnET3JlTZpJECTO39A==
X-Received: by 2002:a17:903:124d:b0:235:f70:fd37 with SMTP id d9443c01a7336-242a0aa6a40mr53194985ad.19.1754512898109;
        Wed, 06 Aug 2025 13:41:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm167085995ad.79.2025.08.06.13.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 13:41:37 -0700 (PDT)
Message-ID: <0a518bd3-0a20-4b69-a29f-04b5cd3c3ea8@broadcom.com>
Date: Wed, 6 Aug 2025 13:41:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: brcmstb: Add panic/die handler to driver
To: Bjorn Helgaas <helgaas@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250806185051.GA10150@bhelgaas>
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
In-Reply-To: <20250806185051.GA10150@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_214141_226546_CD154504 
X-CRM114-Status: GOOD (  14.52  )
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

On 8/6/25 11:50, Bjorn Helgaas wrote:
>> I'm not sure I understand the "racy" comment.  If the PCIe bridge is
>> off, we do not read the PCIe error registers.  In this case, PCIe is
>> probably not the cause of the panic.   In the rare case the PCIe
>> bridge is off  and it was the PCIe that caused the panic, nothing
>> gets reported, and this is where we are without this commit.
>> Perhaps this is what you mean by "mostly-works".  But this is the
>> best that can be done with SW given our HW.
> 
> Right, my fault.  The error report registers don't look like standard
> PCIe things, so I suppose they are on the host side, not the PCIe
> side, so they're probably guaranteed to be accessible and non-racy
> unless the bridge is in reset.

To expand upon that part, the situation that I ran in we had the PCIe 
link down and therefore clock gated the PCIe root complex hardware to 
conserve power. Eventually I did hit a voluntary panic, and since all 
panic notifiers registered are invoked in succession, the one registered 
for the PCIe RC was invoked as well and accessing clock gated registers 
would not work and trigger another fault which would be confusing and 
mingle with the panic I was trying to debug initially. Hence this check, 
and a clock gated PCIe RC would not be logging any errors anyway.
-- 
Florian

