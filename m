Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A2BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fO/4KVyqLd7BgsoaaqAUu12+AA5eN8Wk8zQzu+oUQLU=; b=08/bCGlDU2ntvOAPi7WsKXm9vU
	VlCQpzc/9XZ92Omwocs3QOe6RNgjH2EdRjc+WTM+3OWFD3f4/FijV2xBQBi7v7EL++OkGW07cFjIU
	z/38M4aSlguwKX43LMm741JnDJ6DasR/4hFOqeUJqmKy9YYx5kCAB8iNX1zkZSIUcGVOgNflCIcQd
	fAUV4p9aqdW6vci563GiIaiYevxVrHR8YNrIwp8qa/d6CUv/IfJ8dqCIVjFCKVZjRhyd2wwUJ/Hwe
	8Rz9HRR1EJxUd86Ww0skUsAKo0dU7jSn4SN2ylTXQdyc60hsIpHk24G3IxWP6VT8MKPevzj4/HiQD
	PoBZ2MJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9Fr-00000002OX7-0Nyt;
	Fri, 30 May 2025 23:35:15 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL9Di-00000002O3c-1rzt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 23:33:03 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234d3261631so18561105ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 16:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748647981; x=1749252781; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fO/4KVyqLd7BgsoaaqAUu12+AA5eN8Wk8zQzu+oUQLU=;
        b=WScgaHOfZ3Jp+tz4HAI/DPd40LjdFsmJxkiK++GRN5j1yu2XA/fX9rqNKCuw1wihCn
         458Bo//AgA6AiJndj2FoMJ1VcnPSEzog/YLHxsqjVnF73jUUM+kPWyAOf1ldu022QZH+
         aHZxzG11HWWtIltS+03yME+uNDqnvHTkLlse4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748647981; x=1749252781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fO/4KVyqLd7BgsoaaqAUu12+AA5eN8Wk8zQzu+oUQLU=;
        b=tHXzM9ObKBGSIJ6yRDYCjcOmcmeA2TQuagZL/le1oqOdZqvz3NQaIUCUkqgu2bIJdi
         k/8CcL45Dg4Hc+GSqdVa5027Giie+c5VCDX8EVtHUvRsYq4R0AHWqfIwaUyTaC0GMMWj
         exz7/c7Xs4NJ3WvN9v6qnzRoiM3Wvwp1IYt72/ZGzuvNV2pd7PKlPPY+kLru83rMDguc
         csKh468MWJnvaBhySGSqOPzPfEvyCTbWHqac5Wd54PGqHSwTglVSXJdZ6Mn8Ywmt20Zw
         K5QsY2hW0LC5BV4F3QdzbrLOASRADLOrYv+5prhbWg7n/MgJ3F8QhZaNw5fxxj2cRBUw
         fyPg==
X-Forwarded-Encrypted: i=1; AJvYcCWD9yrBPGIbVX8z+S0PuTLCJH2pIQ2rnklNzkZLxkozDAwqzvBp3/OSBUCNdgh66Qtgko+UCVrgD1LIhvcdqfC/@lists.infradead.org
X-Gm-Message-State: AOJu0YzuLg0ykpsYIAdvnHaIuV5qHpZb6p2YeVIcww7mW6e/Z/tAwjZr
	sC0svv7wn4n/0Xy3eHd1VQd0+XX8J1+QKGRLo3VuDresiiiaeboENwkAzpFl/RxP8Q==
X-Gm-Gg: ASbGncuGBQSu9inS9lsc5SgKuACJITj4R9bTpUGGRe3Qcc6n0UTGlcGfVQsHQm/Yajg
	s8n70O00/7as7SBJtCAYVlUXivH5QqtFc7bU5QV1l4f90PMN9bN3Ca4H90ybq/UBaQ1XD779j+3
	/TiC27UBsTVd3sZKmAez3ST+oa17y286GA5JqmZBL7BwsdA7TXjnjwG20hdsRwN/TuU3iU+hIpH
	j9gUahibyMFhVdaMe4muWHRB2hSSQ/5SFpzWRCoI26tl7uRTzr8LkTFxQ42pkhp5YE3DdjIRTkd
	m0XnuVrF2H5TfNIv1YClWpIFtth7PWwP70cJ0STfm6kYWPaCR4WLhNyY8hyv6oroRZGeWRQykP1
	XElIn5TXU5knvXEnouOC1l0g2Pg==
X-Google-Smtp-Source: AGHT+IF9TsYKCXhHP+BKtTXbH09zwj1ypcFvEuEq452X4UyJrKl9DCN8BMUbAtxtyBD0jYmN+eERjQ==
X-Received: by 2002:a17:902:ba85:b0:234:909b:3da9 with SMTP id d9443c01a7336-235395b1dcbmr39401845ad.27.1748647981175;
        Fri, 30 May 2025 16:33:01 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd7618sm33196345ad.152.2025.05.30.16.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:33:00 -0700 (PDT)
Message-ID: <6c3ec1c3-8f62-4d76-86d3-c1bbe3e1418f@broadcom.com>
Date: Fri, 30 May 2025 16:32:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: PCI: brcm,stb-pcie: Add num-lanes
 property
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
In-Reply-To: <20250530224035.41886-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_163302_617871_AB0370DC 
X-CRM114-Status: UNSURE (   6.27  )
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

On 5/30/25 15:40, Jim Quinlan wrote:
> Add optional num-lanes property Broadcom STB PCIe host controllers.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

