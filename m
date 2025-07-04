Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECAFC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q4W9N7qK+Wuy6yg62v5/iQ4NUV7tbbrVCXiTiMRs7Q=; b=BIucbnl+Rebr5QpF3jhKj72HKz
	Vj70jrwFbSrt8lMzIwkHDUwjImXc6GuzFpmj5YFCScNFpXiivqopp4b8JSnb+ZZsw8ScWY1/3bJG/
	1lZoB1FKuOA1kAoXtWESOAKgjLi4gmxozvxwu0clZKoNHLoI+xYsOD1c+o8JyY0KvYDyO8kvsatI/
	CDiMfR+J7VdT7GMUTxvAnjITa0SSX68DTzgG1+VGXCAKccpywuOvF9lfjILmCzynm2s9S+DHvnkA+
	qwuwU5NFf4E/XzHlnaId5JRO0/9kODyeXY6VSYvsTfP4Qf4cyK5FaFr5vR5kVHsJafUsmWxGwwZmR
	tYI2izYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWME-0000000D5YR-37Eb;
	Fri, 04 Jul 2025 02:40:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWJr-0000000D5GM-20aw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:38:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso499083a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 19:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751596710; x=1752201510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5q4W9N7qK+Wuy6yg62v5/iQ4NUV7tbbrVCXiTiMRs7Q=;
        b=bVcjBO9jcXUObF8YTg1mMh2tV+2BwmqKu/u0+01E+UbGY9196C3iBFq2t76qoH8Zsz
         yhT11Oi1K/o35Tf70EjpfyYHYH2gT4e6NNPGd4sTQ7kAWQ4hkJpvVLeeU9twe0xWfP7r
         yUhS0ezl30tam7Mr+NwrMocGYzaf8tqAnktS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596710; x=1752201510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q4W9N7qK+Wuy6yg62v5/iQ4NUV7tbbrVCXiTiMRs7Q=;
        b=YaMGDqq9i97c+mbWMdp1h31ek4TDt+3TD/n8aprdqL34rdgUw5LFDJlEcNpduW0T0M
         CAEEkDH6oGdpMGgk4eQvCWPSvH76ac+tVi35GOvS8jughfX76ZUlI/PmdMqsWLT6RqfH
         FqPqgr4t2G5uBOqkmQD8yJKNlgBq1Et8+gNB9/LsOayP3AycGu46M4PeH/0l8sE96xqB
         CsIrXyKBoQuw8UQSsjYG+5XbDRzHYasLPqx0LJ8/OtG5ryAIM2U3oD5T5ZvHFy7yqVzy
         96/g4tNNWeGXb6f9U7VtTcyG+eRRhFZFMHKntprG9Uued4+iZ5Nh1OTywi33Z+Z5BXOm
         shig==
X-Forwarded-Encrypted: i=1; AJvYcCW3JP8rYHyuCwZeAKcCKgVkL4N8Hss39Ey96HyN2CfrP1mmrHRAntAkzDhBFlodzv7fs59WpoKIKWbv/56iuwki@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7n9otUof/xCMUFxcVCR9vQWF4jeTfwgODz1uryMVjICZvlQPI
	2l0QlBBEdK/YTwy4b/hmhbRLDa8S1B/PIZ/TTHOlyIMtM9wBOT/JUaRCTBzzy+in7g==
X-Gm-Gg: ASbGnctaU5KiH65iNLoXbBxx7mlhvxCJ2rWmX4eg9WdIM3lHwD1ENle9iyuPojRcLYU
	RQnW5k6YKP+k4BJt5k7j+aFEbwLOEqCSxD+Z96PVaJ8xVOI7wZZA2CJ4QdIayuZh90rC6KE93VK
	prryHpHWkfiK6h+l+WL6B0s08VjZyRxIpXePVxF3hsdS6CijxC2Plli6leKh53sybjaUQA26JYi
	Tl1jSqPQutd+NQU+3kTdTYCS1t+nYOt+DntqY/z3dJkYeAOpA/LY7lR8sDXvCWUUlkjdHL+HW3E
	VD6PMYYAafHhytMk5zITxRZlZBCtXaZL+JIb0onyS5GVaylO4wkEiWACh6hapLI5SKNpXBu5aYy
	NsibC4KLq2tDAU21ajfVFqiR2PgIQrRo2DfI9ZZdJ
X-Google-Smtp-Source: AGHT+IFP2Imb1D5Oqqdh7ad00SyRc+ove3xbG3fR465FpmV+kHbhkPwjj7ne8HRgVGhPkEwVcQd/Wg==
X-Received: by 2002:a17:90b:3b90:b0:311:ea13:2e63 with SMTP id 98e67ed59e1d1-31aadd27f55mr601908a91.13.1751596710304;
        Thu, 03 Jul 2025 19:38:30 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e2c5sm8054455ad.39.2025.07.03.19.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:38:29 -0700 (PDT)
Message-ID: <215c9cf4-9062-4546-8237-8d02fcb5b6f9@broadcom.com>
Date: Thu, 3 Jul 2025 19:38:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com,
 jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
 <20250703215314.3971473-2-james.quinlan@broadcom.com>
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
In-Reply-To: <20250703215314.3971473-2-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_193831_560837_19108A98 
X-CRM114-Status: UNSURE (   7.55  )
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



On 7/3/2025 2:53 PM, Jim Quinlan wrote:
> Adds BCM74110, a Broadcom SetTop box ARM64 based SoC.  Its
> inbound window may be set to any size, unlike previous STB
> SoCs whose inbound window size must be a power of two.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


