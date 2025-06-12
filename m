Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD42C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOgI8wkRh/TcHLzM6q6KrFLM1z1tv99KRwudvZ99sGo=; b=FHGhkVgb8g9q4B4+9Kf27ANeME
	Fzn4BQrxuqmI7uNhc5LcWXtoVeymn7LB7MoI5F51o7Xg3T2vYT57wNpn+MvubMicec51LP6H5la4r
	AA1Fni+yZpvJ07ezO+IGhygwUMe6NWuAhgONBV/xpIOLyzcqRmKdLnha0Qs079yZGFpypZgoHEmBa
	MWUHIRCobKgYe8Xp5CFnfzLXnyqSbYjieOPBMm0p5vc/ZvM/5aKlSZR+4ZIYX8APTXJ/gEgUsBggp
	CGbeSGg9+N5+8sTqHfPZ5vsDggZMCLZUhhDyr6TGrI3lvIWGE9TB04EZbXgbzL/6gFuuxh9G0rs4W
	Exk4zvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPogO-0000000EViG-3MWN;
	Thu, 12 Jun 2025 20:37:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPocY-0000000EVGE-2Fvf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Jun 2025 20:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mOgI8wkRh/TcHLzM6q6KrFLM1z1tv99KRwudvZ99sGo=; b=m5lkMgGvVSjNMfNuipZ5KPt0NR
	EYnBboBVWqBG1YHNmIQP8vQqne3+6yuRE3K7nM5r8gttCQP2YoGv6WDe7lYLV5R+CrhpmldOgYGBn
	N4Ct3OLewax77vO0RY5KT/FxgCcpxb1PgrucVMWr2wmBoQLfw0SvoMEJTANWBBccwSEoOPnpO9oAH
	k/s3mIiAyQMwkdeQn5wu4bX/9MZMtlVvXsLrBiZPz1LD9FLEXxC4ReA1PfkulF+IIEgMwTwggpZ7Y
	NCKYplfYrrC/rnM5yZlfmgAlnFCPmdpG+nenrG02x6d2ShzuTNKDz6Mcs6lcQNBqtvkAJ3EzTh0na
	kTH69eMw==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPocH-00000002gbE-3hd7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 20:33:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so2426127b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749760419; x=1750365219; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOgI8wkRh/TcHLzM6q6KrFLM1z1tv99KRwudvZ99sGo=;
        b=Fbdmk+zkyHmfx1Fzo0IT0S8SNQLVDLloaeEY41G+YoO1oskt58ApkqcFv8WpTjGkQv
         Daef1egyYDPnIG/7szYhNLpm6H1P8p91SH1Dj9VK1e48nr4WLKvQF8V2CMDjidKu8Yq3
         T5yQ2TKy2V0ekBc8EmLEeDvK17KscYRkYbNUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749760419; x=1750365219;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOgI8wkRh/TcHLzM6q6KrFLM1z1tv99KRwudvZ99sGo=;
        b=ZsDfdto7uiGa+7gJTeLCOXNsQqFWst5rBXYAtv+VFPzYKfSs04Of3kEdK9MW1NCazN
         DdHd23epZqmxsp1BVYJpFzygFLM4gEQi+Eec8kJjwqcPy331RAU8XJSqGHjTGJoGxi0S
         D2gvgsA4ilq5Kl+2RwS62kJg3oXii4s/InNztGclX1/GgvMfhi8/A+8ro/XuM4/ymYwO
         k+IlL7KHI8sYb+Ex/5D/ahkZHFt9Xa4WOqHY2peqOeCMHnOlu2PbM3gBLMM3keEzv38t
         MGp8nvU2RiLe8tS2uL/qw8mpDZtmcxisl48hGNacEVMOr8QgqGYLBmBMrt5R32OEVQZu
         A8MA==
X-Forwarded-Encrypted: i=1; AJvYcCVDcJ1W4HsMC64SfaPYdm163SQw2jpG+lEh0Xm4QrBogXto/YW8vT6XSPKlLpnAbAFdLTrSlntr/cO769BhZTw7@lists.infradead.org
X-Gm-Message-State: AOJu0YzWBEzu0kvTOCuejSiVypi/8Nv8FWBnjYck6srGKZkYTE22AmVY
	N0xMCvHHAAsxuVEkp31pYBfzVCS3JsyPaLhoyiRQpzmEsHbfnmlgEtUD4lg14MH15Q==
X-Gm-Gg: ASbGncucJO0MNAJFj/eMtAMqVZrejAE/h++vaMxnDAM7T0ld8aeapeTq9WmiPxUiOPC
	AawQqPEYC2cJ0Iaz5V7RZvGWszVvM6Q/tWGdQ6/ZIBFgqq65fxNrkkioU2SAr2RW6H/NBFJxDvm
	lRMg8enW0Yz0yh7clibIH0E58P8iaZblKKuS6IGDvO2WHug0xkhD9jc+mKrTBdmiCsu6HLRd7gs
	+vkU1pcEb3D6RlTUBfslKJ8sYQJpilH/LR4SGrk5qO2exE1pJ+Mc8teu5GbS+ohVwOM4WPP3NtJ
	vtJdbjceVHakeB2YSY8b7DfIuYfPGqNUCu0fx5+LCgAyvDblCZDRPWChlp9qzi4wiYKrZBNQs11
	6SfA4sP7J0zBDds5uNs0UfrVQcg==
X-Google-Smtp-Source: AGHT+IGxWTQ3G8N7AIkSjljWYpk+4BK9api3JAi+StL69DOF4TENkbk77s1blE3dNgT6Hnjl5aDBjw==
X-Received: by 2002:a05:6a21:9005:b0:201:8a06:6e3b with SMTP id adf61e73a8af0-21fac38085amr604842637.9.1749760419027;
        Thu, 12 Jun 2025 13:33:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ce7adsm155996b3a.149.2025.06.12.13.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 13:33:38 -0700 (PDT)
Message-ID: <39805e5d-fecc-401b-a11c-871e215f08b3@broadcom.com>
Date: Thu, 12 Jun 2025 13:33:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] PCI: brcmstb: Refactor indication of SSC status
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250609221710.10315-1-james.quinlan@broadcom.com>
 <20250609221710.10315-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250609221710.10315-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_213354_940910_F9DA268B 
X-CRM114-Status: UNSURE (   7.72  )
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
> Instead of using a bool to track the Spread Spectrum Clocking (SSC), just
> use a string constant since that will be the end result anyway.  The
> motivation for this change is underscored by a subsequent commit that adds
> Cable Modem SoCs to the driver.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

