Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72886C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwZraCb/toXwxJFa7U6Iu6ktQLnnjzZR5/ifzAHb2qM=; b=gkIL8M8GNVky3+Aur9UXBexjV/
	UW+ZJHa4QwKQccdi0BXEUU6xN2m+dvS4MFZiunbrOcJGSFseBrLipKMZ+aKCyPGI5nYLqoMJPu5g0
	lsBYxWxO3nIZ2EWMWwuQZu5eU+ZC9qsbPYUD3+m2rki06AAHAuNqCqfqS3rBJ/5MhxfKJir1vYIHl
	2GBkZJJVCNFtLLgxlsYfi7wWAHw1kw+3H250eSxUAggB3RIs23YzWV1dyU15IVNVHb+2Nb9BJwilR
	HsqB+Y8jtefuFA5wkojizGY05YuIPvurMT8l/1cu5QU0KHt9bzHSZNYdAMmuI5+oUpfsaz/CNeO8W
	2X93MRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphR-0000000EfRR-0f08;
	Thu, 12 Jun 2025 21:43:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoc1-0000000EVCL-0nCF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 20:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qwZraCb/toXwxJFa7U6Iu6ktQLnnjzZR5/ifzAHb2qM=; b=XkdtAnxphfF62pbDGTqdWcZ7eF
	WuwwRZSldz9yPYTCDDBpsbj5ERJIRJfBAT5oQlZ1pjcOaNW2PvTAI9Ys191CH4Qu/D1YFlO1Z8roS
	ZRLMUpmZD77e5hNxkEMDqfCsOUPcQfgWfGJ3M6l2HV71EXDQf4qIwzqESo3SuQvwKTRIefId9JtNY
	c+mIhmUU28xRXVYw8WUyGReIjzXZoMGBbfaAhXs++J41o4IbBOG+ZRO2m1HTKKmC3cW5uw8vd0E3I
	wWFaGWOwHqa3X3vFqUzxHfo+jULJ2/OIkBcBFqTR6o8fTk3wHSbw69YO2fBbfH0A8xDTEje71XYFL
	EsXC7kGA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoby-00000002gaD-43Mg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 20:33:24 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7487d2b524eso834966b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749760399; x=1750365199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qwZraCb/toXwxJFa7U6Iu6ktQLnnjzZR5/ifzAHb2qM=;
        b=CUSaR+w1nq9cEdex+2XYdgM+9favehvlcSSqnRAixlAkMAyperpnVLgIgNqsSossKo
         RK0W59kDiNIZysKkaI06U/GiHVNkB1A80phaYmETNDWI3NCq5DSKS0vjowMJkI1z8cTY
         XbWOT/wLRrGW0WUci4RVsQlGbCcgezSrma0xY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760399; x=1750365199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwZraCb/toXwxJFa7U6Iu6ktQLnnjzZR5/ifzAHb2qM=;
        b=LnRxlDTfnA7uM5qufFNUSmNuhcNXYs54BVoCAx0WdBpDw5ncCdqJnBBU4VB+RdjxFi
         nX7zyCbNBvEOKd6PHe0QxwyFsW4kZqJT89wHHx9WzV/AE+ic/Pojlka9iy6JmVrtI1ba
         TR/tD1lmKpoi2qFKMPLVnyS1eWVIlOpbn9TCBUqnWO0JclZnhq88atobqMI2MjLam1g2
         k977eGeN+Sv0fV7Y+d0B7W5C2ni3Ki0buP38Qo0qRENsnl0cEcigknQ2RhALw5ZRzNdY
         6XJrY5ZpXCJ9+nt0R8qU7DxrAdfuBc7OxZXBVUPgEM7X8mgNInK30VFlOHfuLcE2dAfW
         +CDw==
X-Forwarded-Encrypted: i=1; AJvYcCURwwP9XHvgptQmADKxuaG3z6qJ7wkMGRNtfyZ3/O69bOQgA4f1e6gvZowlJ5G0TbmzRFLLkmWIQ3dIxHXThNo7@lists.infradead.org
X-Gm-Message-State: AOJu0YwAgolLEYc6dox6dofU/JBXWPbriwyOcqR/HQ7sXgLAyxNgxqCF
	LTtPbe+k3V1nYOJlZwS1Cs406axmXgLZca1cD61/icDVFmxXTP06C5av4MgmfPODuQ==
X-Gm-Gg: ASbGncuR4eSGqxcCe09aASD4PefE2vk4AzqAs/GkQ+2t/FNXfQR1E8gno5caXdgN6qJ
	nCS4fQNR/7gJDnXr9xgDjCT3dKvLSaCkizpn3A0yj204pk+IV4UyfyRUaHzjHEoIN9P9EZX+qm+
	Of50lMgnNFfA4u8MkiP2lOsQiKE0u2XkhUNUYCoFTP+T6rII6ydP+V/I8MN2RRtM99ebkX6ddj0
	WUiHK8pnimBSxVcSZ2m/FTvdnuDL+bplomn1H4rzR926R6kxZKaym9PREDjZ9rq8SloqYg+MNxj
	e6LOTR++44xg8k1uwTpphYxfQk1NQ5Z8RIJxSi5/dp5nJ0K/YYabQsPqbz0xEWkggUhFlzFLEL9
	hnTF1B5YfCr0Xz6biiOvVY4pkXQ==
X-Google-Smtp-Source: AGHT+IGmDN5dx5IZAbkRjssr+2utVCHnvk8DVR8P7vF8WVwd5EOmE77VMLC93zSUoOrUzZXL5NP8+g==
X-Received: by 2002:a05:6a00:2e90:b0:740:596e:1489 with SMTP id d2e1a72fcca58-7488f73f776mr864997b3a.23.1749760398965;
        Thu, 12 Jun 2025 13:33:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffec9d1sm161700b3a.30.2025.06.12.13.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:33:18 -0700 (PDT)
Message-ID: <b24a0359-50e2-482d-9241-7889af85c365@broadcom.com>
Date: Thu, 12 Jun 2025 13:33:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt bindings: PCI: brcmstb: Include cable-modem SoCs
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
 <20250609221710.10315-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20250609221710.10315-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_213323_213638_516E7CD2 
X-CRM114-Status: UNSURE (   6.00  )
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

On 6/9/25 15:17, Jim Quinlan wrote:
> Add four Broadcom Cable Modem SoCs to the compatibility list.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

