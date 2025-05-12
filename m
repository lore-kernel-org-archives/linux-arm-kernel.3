Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C22C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrpxL/mP+K+cLskpsPY5dwSCo1u/ESSLzrBP8HUOFWY=; b=kifgujzTppHC/0iIr6dYwRIlB2
	/kxEVLJLPhKjkkcEngmH6dl4t11uNcW2sF93EiQLlWXzGhWOT8IEI1Mzm6exH0CUOgukxkiBEjFqU
	h0GN2EtR7yIaSr80bqyZJ89qGFvKYLfLTRalhSksH8rEma/jD8RNLigT4Lhwo3jAoGUhd3jLceUep
	ST6tm9nGtptZB+Snc0HkNhkJ9sJMAFOdJytHm9IlgEe/6gLroIhhiHSsWJ4U+Kz3Ig3lbPoA66waJ
	ipnJm6hDGINe1Cvkovv24y/Ons7LwK47EsQNdY1vojtnh+k/hUUM7QHoi8xzHF56JY/RDT+59WG2L
	TNbI6EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVBe-00000009t88-2Wv8;
	Mon, 12 May 2025 15:35:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUYl-00000009oC9-1MdP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:55:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-73972a54919so4484960b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747061714; x=1747666514; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lrpxL/mP+K+cLskpsPY5dwSCo1u/ESSLzrBP8HUOFWY=;
        b=G4l8h82h67ch/hYs8knWGXbZFmjdxUXeZjwfVlEYhPAkHkS9HU/9oFEAPDxltLPid8
         /vVy4i13qDkyjamEsTLWtFbRXXDJbHbYOs8FX/t8jLXegsPP/ApR/r9yUS2Jo7NlZrVz
         EZThR9YLZhex5U0bFWNcEFF0MAfm47bV4REt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061714; x=1747666514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrpxL/mP+K+cLskpsPY5dwSCo1u/ESSLzrBP8HUOFWY=;
        b=ayFvqohf0eCav15seY9zN8mTGKYJWN5AHG0vUmo7K24SJ7RfhjYGgGg35X2bBkSot0
         nIrMyNebs4EU+L9j1tfvOPM/Vt7Ob4ft7NMn6/VCWabLZT1NowCedmBcjIvX/PFkW+la
         PRDKj9eAdYPhpVAVgzCPWbbLiN3MVakxeFiwFr6fygQjTKcssktcc3qN1jC2Yfpel1iq
         sDEZ53pYW4CSOilIkz1DTwxnNjyCnzUAPgHqo+NJW0g5y0leTbootrqLh1LIGGiVkWFX
         AuQQOcudEYqniOyvZ876mqllmd1isxCCrU2bzMModZbXIgTxUN9ZaU6UJstlfon6j3Ry
         in2A==
X-Forwarded-Encrypted: i=1; AJvYcCW8n5brkmoF1vtWd14Ja5StrCmFcrVlH4k6pcPUuUxHY9gYAascYU7Xl0nHKHOei+y0CwbwWA6Gc1IVIU2hl7nx@lists.infradead.org
X-Gm-Message-State: AOJu0YwfQIB6xirf6529Qoob3E3IZWQNlyg/XEueUt+3y4GdEJ8M8yHR
	F7RkSc5TVgQxdiL9K7wTAc+FlqKp4D95aBdB7D6sR7ujI+ci20t5Op/oO+SPeg==
X-Gm-Gg: ASbGncuetvd4KTA+aATxfUZgbkPk1LoVGP1uH2jeRROxGHoV8Y14tc+x3j0yjgViApY
	bd7y87mhwCYfX2TdnwYzNisJwmoC2owuqN6Ha1yda6E6zhevaYiGXcGQXtSYdQZxSTZQBdZ51dI
	/bw6inMQ4tj1TgbIJT5+HHAC5knJJfMmOYD3tGEevzQqxMpHsGc8PpCykd3ufsM4q2yKCDRb8o5
	aKblyDhH57ijLsVMaS2hyWqSfugjW7hTiAv92i+2x5G9MsF7GkKVdFKXfc+DRcrQEeWv/E9SQvE
	U49j/hfa8tEoZgxVsqjcTkUNZAy8gaIB1sO9Ea9F16L8mCOaul5eeSbQ6/9QoMQQThTsHqntf4P
	30y2qULFnyJrTfswL2AxU94Kp46TKF0yUoRGqY6MtjoKrY4e2+GpdUgJTGzqh
X-Google-Smtp-Source: AGHT+IFWjn0dJiD3AV+D+E2/RWGbXOX04UoyHDA+cM00iL+OwBsqv4BjXvQjc1qrjaVcQ5oZZ1BPZA==
X-Received: by 2002:a05:6a20:3950:b0:1f5:7f56:a649 with SMTP id adf61e73a8af0-215abb0471bmr17222493637.13.1747061712886;
        Mon, 12 May 2025 07:55:12 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0f141sm6133891b3a.117.2025.05.12.07.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:55:12 -0700 (PDT)
Message-ID: <a91a4ec4-76f7-44d7-932a-de7e4eb41277@broadcom.com>
Date: Mon, 12 May 2025 16:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: brcmstb: Use "num-lanes" DT property if present
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
References: <20250509222815.7082-1-james.quinlan@broadcom.com>
 <20250509222815.7082-3-james.quinlan@broadcom.com>
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
In-Reply-To: <20250509222815.7082-3-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_075515_374711_F0670057 
X-CRM114-Status: UNSURE (   8.06  )
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



On 5/10/2025 12:28 AM, Jim Quinlan wrote:
> By default, we use automatic HW negotiation to ascertain the number of
> lanes of the PCIe connection.  If the "num-lanes" DT property is present,
> assume that the chip's built-in capability information is incorrect or
> undesired, and use the specified value instead.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


