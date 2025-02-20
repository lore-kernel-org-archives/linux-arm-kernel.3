Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56919C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P53/KIPJfrzEGuva0GsD1NlBE3MhvRVPB9M6JxDtYlQ=; b=yHAlyRS/7wWZBX9v7cBFaQzaaW
	gkcr3Cmg9EU2pYwOmB4BZlbh22ABLTfFHL05bKN+2/995UVAQzDdCNM4+/dre6ilAVneTA+c7XDF7
	/oO8CUSyLrQMx8NRxB3IM4gbohrmRh+xc8NJYdE711yWD6iZlHLg2/NOGaCn5WdbCa8RV9bl49xIO
	jzRbtSrPwR6lyxqs8D4a3GoUdD8yjwV0VsaAGNIagO3IHQCFkKozFwI996BfYbOhLG4OrqkeAnTfu
	QL9FUxNYoDh8EgMnr2lv89JtpWjNedWrl3ddkAnZjblKuhDV+TPHPy05hau3RkXqJy+wj5Yiw4f1r
	bTTTpJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlASg-00000002AV8-0boJ;
	Thu, 20 Feb 2025 17:35:46 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlANP-0000000295m-2oP0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:30:21 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2bc66e26179so207800fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740072618; x=1740677418; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P53/KIPJfrzEGuva0GsD1NlBE3MhvRVPB9M6JxDtYlQ=;
        b=gkMk7gN4lgfj4X8elj+PFKv18LavvmvRvtPuyLXDMqL8Ot2HdwR3Ze8pFwVdRzKP6k
         bCIPq1IlfWZT7U73ffXjue1doyX5k1uqG2ZQEafVVlHEAvJAk0sqf2ek6n4qJ4Ld9fm2
         HjNv0fphtPD8NLvGQRZjU6qSD0QmSBfUXeh/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072618; x=1740677418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P53/KIPJfrzEGuva0GsD1NlBE3MhvRVPB9M6JxDtYlQ=;
        b=o/BbAIOCClomzfNT/DTYoyIN81LaZJ2bnfqn+FYbZkKltXMfxRTbIf49Lr1dGe4AoH
         /BWS2NfnBpUWNdOw9wZjlbkNbhrlBeEeAyOu7d454nMhIvfUiJ7pmpwuBprgMuijdM+I
         vJrNb8el2H7XUdGr5hDoCx8wTx32Ims6gYLrQcqYRJSyTb+zCvpuSAVhPGq8XJvyo7Sy
         he0dKPPfEBfIOHNjKqY7imgaX4mFJ/W0BYsWBQyH4Og4chzli1LjaRTYckJlZQZrbrRq
         fphdRG68HVvRPsoXiXP8C1kko3iys2JkzzrafZfZPK2PHPP19/bC29Jq1klR+HpYjSbz
         7e8g==
X-Forwarded-Encrypted: i=1; AJvYcCWHtz4sesBJhdhxdkqKz8RkGO2xQtqX27rrEmbMpMosiPsb73GxBNyg33G7MWqoWXaNDoZ7C8liYs61mNhN+vwA@lists.infradead.org
X-Gm-Message-State: AOJu0YwbTTDu6VP8Mert8GYLk/FgtRwreGr080T9c3kxkID4wJCkqKJU
	qe4WSgms8Kjv9oDohVmQFFVA8a8SYSdGI7y+S2FnaqtmD96n7bL+icMnRjPL7g==
X-Gm-Gg: ASbGncs/oeetCV78Sh8tG2QN/enp2+eYHlMJLQPO2mAFYEyCIvWMh7eM+W+NTIyRnet
	Udw2sxqDB/7J6CCm5jXPqprHMZs4JFMY1ET3XBZ34V3pOlbX0/zf0lwV1Oz+Hr/PjkNMsxXwBYx
	NFHbfQbpAZaUKblEn3HYNKaH0RM/7OEfm/ep7XTbpi8U4NVO7h7Ez9+qhZGyvkRgBMBc6g/owU1
	9eNYzrPqaRXASOsudJBLKu2F0ZEUDp+/vcqbSji2j1Te70gmHaK2JWlKL91C/enstR8b0a+i77b
	2RMpxLNv9a5untcUraOpvGfRZqlA5spbdLq2nLDYVtwfPBh9bdARvxzTwrhWTqyi2IbGm5f35bg
	VgnC/
X-Google-Smtp-Source: AGHT+IHw53AD66TKeGeMiB8+rYPW86zzfv0+S/8Z29ElnOO82punMyMQt7RDXRZ5XmCphUXfk9aEGw==
X-Received: by 2002:a05:6870:8a2b:b0:29e:3c14:2bb0 with SMTP id 586e51a60fabf-2bc99d41a60mr18203220fac.30.1740072618592;
        Thu, 20 Feb 2025 09:30:18 -0800 (PST)
Received: from [10.171.122.29] (wsip-98-189-219-228.oc.oc.cox.net. [98.189.219.228])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b95481ab73sm6402536fac.8.2025.02.20.09.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:30:17 -0800 (PST)
Message-ID: <213fd5f9-405d-403c-8ebb-a2b371f0ab22@broadcom.com>
Date: Thu, 20 Feb 2025 09:30:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] PCI: brcmstb: Fix potential premature regulator
 disabling
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
 <20250214173944.47506-6-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-6-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_093019_727290_57318DE9 
X-CRM114-Status: GOOD (  10.64  )
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
> Our system for enabling and disabling regulators is designed to work only
> on the port driver below the root complex.  The conditions to discriminate
> for this case should be the same when we are adding or removing the bus.
> Without this change the regulators may be disabled prematurely when a bus
> further down the tree is removed.
> 
> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


