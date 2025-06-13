Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78463C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 23:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsGrhJXcxJgF9VRXxhbt01P3WngGl8j8Fa4zh6eSNp4=; b=IXgXO59pE1yqlcjWJD28RYDSMW
	g574jJfSCTrzJcqYHPWUg0HUiV5CKeFrfvIW8KZl8kLezJfMf6TF97N4ZW36oc6p+i4OfOCxEIjbD
	SmTX15sulJ57N1eg1q5cmwbDRvqitRQTnnYhYrRbwxj8ywfEL1e4gc3zXmCTBCHCr7Sm/+HYgDvsa
	SAxAAMl4gaGIGkpzQR+QZ+zUY+Ktxa1z47aqs65AZm5ZACMRQ8TJS/E70IFfNfWR59RM+cThQEFzo
	3QKwZbdFGtWfKW17MtU2END/6ByKsHfW4KICksfmVg7cG7dtum47RTQwtWSP9z2Kw7aA+f0NHQK89
	0X4eoxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQDoR-00000000JG4-3lbB;
	Fri, 13 Jun 2025 23:27:55 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQDkC-00000000Isi-2UHR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 23:23:34 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so2682232a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 16:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749857011; x=1750461811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wsGrhJXcxJgF9VRXxhbt01P3WngGl8j8Fa4zh6eSNp4=;
        b=LCDPIcA8UviwqEWt1l2AKQ8qHRsbmr3HLu9h0JG4VVhxstYQ4c06rakvA8MWUH/AXq
         En4NbLE6oa10mAuMaFE0zM7iQio/INTWo3sqHUE51rbmR/zLz3vt6TodBEoCbOVTt/hd
         9BtXenYILxu8VwHJYqhjFyswXsaY/XZqqNusE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749857011; x=1750461811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsGrhJXcxJgF9VRXxhbt01P3WngGl8j8Fa4zh6eSNp4=;
        b=qu68ISqVoi2SRkjevkzNxtYH9P0SZcD7w7b2nxEs51pcA+KZEc7O51yBoMkrC6BmHn
         VgfSRZCFffCy1nSfQdkNif8kW0rF9+lvX5NCLV2gxyOnWYnWK/atym4xmWsIhG+yizrg
         yvH7ReVM6lO9p9kEBEnxoK5iVT9SSMiuGMx6IuMGA97ZpgsOxP8mGWRhK6HX2+VdLLdO
         PFpGcoYvtuFb5brB5C3EHyZIRfpH9NURKLcwqIb0LTzOTe7uuuYRR7PJTzrI4EDg6aHv
         5NXzocuVNKlQinAWITGfjKtsW8AKQeisn/EU1a1RVCNMesawyabTnZxdUDOge+VqweE9
         zvig==
X-Forwarded-Encrypted: i=1; AJvYcCW3lc0X0RDxt179TpX9Jjgf+0JTQj2cvsZ0+5JTZ1T2x3VuNWB1ZlrIVvBd3MdVYXB8mvUtguiMnxI9m1aVkCNq@lists.infradead.org
X-Gm-Message-State: AOJu0YzpAUl7HyhhOKa5G5Bh/UpsggdOtrbz1/ANNKtB/7fKz8L78/ns
	UPNF9Q51HUyR9nybTVKxgyOBByJVVknDyvpN5ipMAsymUEE+0iK84zC85L2+AESDJA==
X-Gm-Gg: ASbGncu2zU7zGD02PhKhOSuj8zzoHKW2+6VyQ8efyyZbtz3IkwMazX62crWhQ/9YOxK
	+CNFln5yY+tqtkAxLuvS9Nzb5vD7gbs2EfJ2eXBFJAm81sedDCpRdtGT4TD1CiV2aZoIsVv7syk
	2UNYMpvXSQ/OeZ9RwkAOP0dCCYE9kp0X+CfyRDmsQaDszSVNTtVWBhuoN64GASDek/llSlD9IPB
	p/4EQ46FeyeZ7sqpN8gg9FRM/YHcosZ1jl1FVeaZuBr0SDSbBkhPTn2aWe318niglijeTp6gTF6
	hKboj8nMTsOKsmghD0CUgV2VgtroGiv3QLPVNPOhUtX3gZLVHojZN/8MsM1YHrHnDtC8EJrL1qN
	U5790WoeO2l7pOlwTuZ/FnxMQfBw+6XGe67ff
X-Google-Smtp-Source: AGHT+IHzddnp7KM3N56jQdvyzbz93g/Cb+xVlnLYpRToONj9z9618Uu+cO70x4fNDe4E/9ITIFSUcg==
X-Received: by 2002:a17:902:f689:b0:235:1ae7:a99c with SMTP id d9443c01a7336-2366b136380mr18330975ad.32.1749857011198;
        Fri, 13 Jun 2025 16:23:31 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca282sm20135825ad.205.2025.06.13.16.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 16:23:30 -0700 (PDT)
Message-ID: <37f6825e-fba2-49c9-a802-abba1e5343a9@broadcom.com>
Date: Fri, 13 Jun 2025 16:23:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is
 active
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613220843.698227-1-james.quinlan@broadcom.com>
 <20250613220843.698227-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20250613220843.698227-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_162332_638484_5370A5EA 
X-CRM114-Status: GOOD (  14.50  )
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

On 6/13/25 15:08, Jim Quinlan wrote:
> In a future commit, a new handler will be introduced that in part does
> reads and writes to some of the PCIe registers.  When this handler is
> invoked, it is paramount that it does not do these register accesses when
> the PCIe bridge is inactive, as this will cause CPU abort errors.
> 
> To solve this we keep a spinlock that guards a variable which indicates
> whether the bridge is on or off.  When the bridge is on, access of the PCIe
> HW registers may proceed.
> 
> Since there are multiple ways to reset the bridge, we introduce a general
> function to obtain the spinlock, call the specific function that is used
> for the specific SoC, sets the bridge active indicator variable, and
> releases the spinlock.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


