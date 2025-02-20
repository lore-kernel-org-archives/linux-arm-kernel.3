Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DE2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdikSYRCknu87r4IRD4jNLLC13le+VI+y2JvXDGCpPM=; b=VSkp49grj1kU8EN5Vs8OjfXPsP
	ZKqBu3JNgP7SMpep5tJMXT0Y3MjBf4Mdk3qMLDZcisNHXARn5egJR8EVnIEY3ExUKpj+EIiffhH1z
	kqjO69QjtFidpc3937isuiEpqliUIbcKa56w7IgoOg/096S2Qy2V+lriJVAZSueIXFmmC+cXMZF/n
	KX1/WFwa3BPiMnCiK2QlD3iSz1OzacqhTiMJnVtQil/BNj0IkxqlYyNd/uvKID908BBTRvUb6pBhM
	58Saiykioq7CUygI/50o/c1EpuwMtTL2IPCIanXgfzLAem6r88rgRnDI8AiUdybxNOAD+/HJjaDGY
	Sd7EXjZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlARC-00000002ABt-3zGB;
	Thu, 20 Feb 2025 17:34:14 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAMj-000000028u4-1gSZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:29:38 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72721c2ec6aso651142a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740072576; x=1740677376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kdikSYRCknu87r4IRD4jNLLC13le+VI+y2JvXDGCpPM=;
        b=E/Bhk8aQCP7u3OsniqPGKiex2/N8S6tzQFjSY6zazUaeIyozy4vP+wsz3yrx8nPG3L
         a+4uCWABuNStSnwVvyxy/sBxilPxLj4TguxcZJto85Wz7RRAYZY/irFSrY8bVN0ShBHe
         KkWwZbEDcVo8PzXaHTp1VAOH8Ok1z8oZrUJOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072576; x=1740677376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdikSYRCknu87r4IRD4jNLLC13le+VI+y2JvXDGCpPM=;
        b=maZXvKOy7arkIh/KOlov1VMeZRlPBbVso8bBKtnAxyIg95/ZuEWoRfBiC0aLF3hKlI
         J6FWLl82Yx2MW/TgWh9NZzpZAxLpnCgcMhXNZj2na8/1oByFO8JwZdDjPW7tn0tpW07u
         l/ZuNK0u4ksVRoDF4dQDIcTgjw/ZcIWj3JlNvRFNmZOVOVJwBTZuz3mIm/BjtYeEbKAp
         a0GXLjTOrVAhP5rOooUliVxiTKaRJtRpXQ3+jah+ptW416gfmJY8JJcH0Q1F1UW0lPN2
         Y5U8Phi7Ziw4nI+Ew9HZiqblE5w9NErpUjD3U7b6OLYSi3jeaqwaBjfSptSl89GBO1jV
         9loQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlt8d2lkV1X/aMB9I33dMJyT/hoMPdtQvI4e6Pk8ML8wI89P20YlApX+kmwqrVbINRY/8+1s7X+TUByf6tLgnS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3xmdS1t9tawgGcK12hAK5CbPpsy6rWZN32bJtwAAyW1N7Veyk
	0CjEDRBMN+6FT6eJnqE+NnVzFXITVnZR3p2MmSTmhlf98c18mw78JEXHJsaWTQ==
X-Gm-Gg: ASbGnctlBAgmulSsYbl27ek65skl14RVk8E+C4BWRbywkoI2iJpodPt2T7E+iD9FVIu
	9lvIZCS7W5msX6jWQCpVrQ5lqoDvukk6+WfOXvOVzI3gHs9/JgwmMVrcDpjHsnVPQPcsNVwFezE
	RJBjbWLgsjLCqOLzzdFLVvcR+dUTz8Ch3R8H/BknMQg25kIOhgkti1FZWiKnXBjyLaNlz6YIzYa
	mNXyLqrPSA8Yy2elAJ6wuS9TRYNqC5rQE0e9bH4dar5Q+aoToI4/rprhxrHuaYuwzYS/+fJjdPf
	fjxK4QjTAgCrtHcU7/+kxS177u38cUyI2mDiT6sZ7j40V1VjGkWlTBHOdOIirMYjEk4Xx6eqkq+
	1n8/y
X-Google-Smtp-Source: AGHT+IGZA+a9XGOETQCq4mTPzcDC3M3BrXfb2U/dru5rUVJw0B01xbMp+b+QPk3A39iTP91d5M6t3w==
X-Received: by 2002:a05:6830:2aa7:b0:727:2f9d:284c with SMTP id 46e09a7af769-7274399117dmr2635918a34.10.1740072576341;
        Thu, 20 Feb 2025 09:29:36 -0800 (PST)
Received: from [10.171.122.29] (wsip-98-189-219-228.oc.oc.cox.net. [98.189.219.228])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7272737d70dsm2344358a34.42.2025.02.20.09.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:29:35 -0800 (PST)
Message-ID: <d1ead47b-4b82-4657-88c3-defb44647b64@broadcom.com>
Date: Thu, 20 Feb 2025 09:29:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
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
 <20250214173944.47506-5-james.quinlan@broadcom.com>
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
In-Reply-To: <20250214173944.47506-5-james.quinlan@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_092937_448592_22FFEE62 
X-CRM114-Status: UNSURE (   9.69  )
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



On 2/14/2025 9:39 AM, Jim Quinlan wrote:
> If regulator_bulk_get() returns an error, no regulators are created and we
> need to set their number to zero.  If we do not do this and the PCIe
> link-up fails, regulator_bulk_free() will be invoked and effect a panic.
> 
> Also print out the error value, as we cannot return an error upwards as
> Linux will WARN on an error from add_bus().
> 
> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


