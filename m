Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A252C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFoKwRv8+iHXzA4sW8NR+HMTovNN52QXmnRE1AZkRlg=; b=Reh64ghVj22CrebMEtvpncBDGN
	FDtj+Dft5vDx8xGgmomSXJMIWxv0Y9+nvSJbISAFE87SRz4wvd4/ayXYwG3CcKKHk4rgj5IOg/c+z
	ZA38t7qjxw9zN8vOAZmQJgbPgEU3K9c53sNPpLK87vmsz5hVNuWihmsZlb2wfhsNBP38gHoCxbZQy
	VgelF6UiiGhnpfsJyOZ7d6yar16eka4QscT0kohYxW8ogOs5l+Osk1ga4756W2/7a7qvJtrbMdMkd
	pIh45cDhD84yHN8bzjGhI86/+jL1JGE/hkye+uitR3NxmEpVsYVrtcF0bJVnZ9VGy4O7ntmBh6kng
	2XfRUPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBCL-00000002LPK-2FVe;
	Thu, 20 Feb 2025 18:22:57 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlB43-00000002JWK-1sQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:14:24 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-727295a84c3so331677a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 10:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740075262; x=1740680062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XFoKwRv8+iHXzA4sW8NR+HMTovNN52QXmnRE1AZkRlg=;
        b=h4efopPf0E3w4AWAUGSalrjxXKBWJQqFt8F0hZ1xQWEE9h55eYxxv6SDInkSlX4mg0
         UK8sXqJqS6gp+6WkxZCMtW12ytGCuqYvrzP72xLz9eqOFVmEPbjOI0jjvyeAbXoZM5Gz
         V8mSrUZPMPf3POd6NdSliSDZGcJRGwkMNcPuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075262; x=1740680062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFoKwRv8+iHXzA4sW8NR+HMTovNN52QXmnRE1AZkRlg=;
        b=F96al32S+XYajB1myRj/+9E89EDkL3HRvmOGT41jocm8oc1idQ5pwqdN5+e/P7M28x
         x7udpIZtH6fMg9WsVJH8i/u6C+4JqEKerhuzyOA41FPXZYSeJSEK5trZZEIgaw1GyDg3
         r02YPpZ52EVHvtkj+8BkHMTYjPBDAeDJonvdjW+4CA4iibNGc0Iw66hQFcM20+c31vQk
         k59cT4bjxIqCdjwk2Ushss2gkF85hSzqMpdrwN8POb6j3s+3Ta/6dXn/oACxxvkd1Pic
         cYcT+QF1PZpaU3Nt24d+FeeGW1TJ8RyS7UaR4kEzewokIHArR847eChBWnSLui44syW9
         bzHw==
X-Forwarded-Encrypted: i=1; AJvYcCWAfFaX+Xi47jaNDjCylxAjT64RICOY0dMxe1hcP2i27weUgsciKqlNAV2XWrzT+6LioblWtNDP2M0eFKeqAPtu@lists.infradead.org
X-Gm-Message-State: AOJu0YzfnbTut2Ot8Dfd0Q89BWJzXBTlaHyN7vUSXRzE4SxREuZMXrSX
	ZkmQtbuOTTjmEv9fhjaH1/1COOpFGtdsYkwuIQMNltRjJpv1YOy5llmKg8Kzqg==
X-Gm-Gg: ASbGncvkOGJogY3LOaor6qpCKgTxgPsLIJoNqId0ZaeLWzpcq9mzAVezipk8g8Anh8O
	+gudojV2oykWvmQZ07r6YRUiXu4gHhF39ths4r3LliaaI0lzE/e5Sv4skDYDKpkLsuJdTcr33SW
	2c8t2eqofBcLnDEKKE4t9atGPfMBkPz1h1xI5L4c9CXcFZmDfKnP4hjRRg0NLsHZ3cVkir0sIpy
	vXgCr2p44I9f5zLxkZ1CNuDeyVvC1EhbagOu8PVWI+mvdM+lype1FDVPTwQUacUPcyV7a+AjMge
	fgKQ8GZisf8TE4WdWUjdGUF8U4qtHYdlL2KXH+DIj2mqFmr2yMmGg4Zfwb3AKnxytQ==
X-Google-Smtp-Source: AGHT+IEV44L/jP80xEFxHDxYslNjpr4vxk6yxSG6deheV670R1As9ApbDG8AlvPhEH38+8Glf9FKlg==
X-Received: by 2002:a05:6830:210c:b0:727:345d:3b72 with SMTP id 46e09a7af769-7274c1ebaa7mr20788a34.16.1740075261611;
        Thu, 20 Feb 2025 10:14:21 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727329c37d0sm1563186a34.31.2025.02.20.10.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 10:14:20 -0800 (PST)
Message-ID: <c67c10fe-e279-4b37-ac9d-20485e86fc8f@broadcom.com>
Date: Thu, 20 Feb 2025 10:14:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] PCI: brcmstb: Use same constant table for config
 space access
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Stanimir Varbanov <svarbanov@suse.de>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-7-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-7-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_101423_685412_AAC7FDCD 
X-CRM114-Status: GOOD (  11.15  )
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



On 2/14/2025 9:39 AM, Jim Quinlan wrote:
> The constants EXT_CFG_DATA and EXT_CFG_INDEX vary by SOC. One of the
> map_bus methods used these constants, the other used different constants.
> Fortunately there was no problem because the SoCs that used the latter
> map_bus method all had the same register constants.
> 
> Remove the redundant constants and adjust the code to use them.  In
> addition, update EXT_CFG_DATA to use the 4k-page based config space access
> system, which is what the second map_bus method was already using.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


