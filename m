Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F786C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAvOK/vXUJ3DR3zGC7PEbA5edbkAP+/9CECVTn9NqUM=; b=u4ITQkJqv9qse5P2ApTycgDRDQ
	P95O6qISndu7yhTstgc2wVa0kWluF6+BfPs+w3Hk+sGvqkr9PW1aGEOlfVAhTWrILld9MEG6r4P4K
	KRgq7Umc8T7pluSGwX49FTEONlFFXs8mynvLOmOktRCVe9Ty+e8EZipIeBf7MF2NHKpNugUpOS9vf
	BAmZgpNVHMwOuGBHmGxT9wOSac7KCjCi6ixOa4GTauHxF7wd74zAYeRJOggWKVUibvzkkVvqJ1+8b
	BxLOD4umXqdxvPibaRlflVTgCtlHvvJj3FnsWrx1fFVI5lKkafHcw7t6eD7ZxWBXwPwI7uU012/mK
	I2GbumQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ3W-00000008bmF-3Cai;
	Tue, 21 Jan 2025 18:32:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ09-00000008bGW-2yxh
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jan 2025 18:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CAvOK/vXUJ3DR3zGC7PEbA5edbkAP+/9CECVTn9NqUM=; b=mvVm/PZ+JBPXfnvNaKEH2gjOQZ
	XDJVeAH3g20yhQJ7aXpMKORKRexrTPl1Ii+sEt0iQvRxsC0apVVpSeJbJehDUztr+gRYYbytJtWth
	kY8kevbORHXHK+TW+ZpuwVXS5bAgS8ilLPOiTbpftG6vDOKXEGD8mzKqAhK25K/TAVhCj0cvF4XaZ
	UjUuJZxqZeqc+X9H1J1RfjpBSFVaZZqKQBk8CVK5hsz1XIsbiedSxuwMmfSqaoO7gI0/0IsAGSdTI
	LlDt3H95pPk82wFRWBNegFjvUau3fQnh8vsBaa4QCh6Ou+SifjGPQSrTEZ+dN/G/4IbG6XW/+HZTx
	YPORAs9g==;
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taJ05-0000000DL8W-43RQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 18:29:24 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-29fc424237bso5359708fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737484159; x=1738088959; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CAvOK/vXUJ3DR3zGC7PEbA5edbkAP+/9CECVTn9NqUM=;
        b=SjNZKCKE/86h89IhZl5c2+ZdN9ulitffoL6mgrTgjjx7xNLCqKEitazVM1jddSHifR
         zXYejtrQPsxI9A1IyIZXHZOQkZ5hYmtKk3DmooJIKZb7ADHp29SZwHpNgv2OoAMeeJ+u
         g/y2FAWVb6c9n/gWbRtrqkLSEFytkz1ojIQhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737484159; x=1738088959;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAvOK/vXUJ3DR3zGC7PEbA5edbkAP+/9CECVTn9NqUM=;
        b=MIImj218rqqZMNCOm7+QQkU+zhLUNiGKK37NCg71c79hmJuqiSyPzU72rgqH495Sou
         FvTLEREo66R6W68LgjHP0wTj3WBWlZxE5rdQ5/KrHLy93/Ko9BfSFLpJ5tuCxyubnF9b
         yuz628wq5Z2uVDFcsUeXoiQ5R7WdFmC5s1b523P0fZf0VugTry2IPYBYT5YF7ZU6KIyZ
         78m0TSOodkNOxt0BkeFMFUSdPE2ubrj+btLpkC0jK1gmFhozKKCGeVU2WUlsz0Gmm22b
         cU9xWeDu4dr0Y52/CgL0xYnuFOeAP+Z0TR1fZ7QKoamOWPy10hytjBqBI71hBK/S7Hx8
         mD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQzZ8hwAjlliae7D1YTai2cmg+7sG8GoAjhhY1+WRStdUn+pQEM1YxHtA1z3bAnL6GEZpP/ujQ9Ej9bZ6q4X4E@lists.infradead.org
X-Gm-Message-State: AOJu0YzkniddBJiBfdEOWu3FCPspIuIbk7k/jv19kNGGNS8EsBFKvhtI
	UmKUvcLfw1k6g3rBNP9hLyXA3p3cwjFENtVV7F5uSfDF9JJypTssArxENzHQog==
X-Gm-Gg: ASbGncsKh1l1t69N3T/vflEe0JINL2op39zecQTP936EBeSnZfco86VXuK9isezTLSD
	po4VxhKPFzpyrjRpt1ehOjHOvyJ7lrS9Fg+EOMp9diqPJjjHIAD5+v2ZPAwq3HtVJ86agra306z
	VEk2LIKTRZKTLjpxt54/qE89Adn/yr1Qg3c5WiodZPznWV2qLcaEcTaRoRd94TAT0taOhWmx/D3
	Q5Adp3aKg130TZ892EGg/TiKP+4BU7PARac9lVl2nz8I0PEhxrS7msjYpDjG4HUhTchFQLnFX7c
	KZ+vvKu8fjatA73+VWFgWCwAYlVNKL8ddg==
X-Google-Smtp-Source: AGHT+IFSsOMr97oNRmSERDhQ0fDUB3aBFX5IWM/A/ZTN4m/C1LuCKfN/vp7fge9pEMOwqfeC94zaTA==
X-Received: by 2002:a05:6871:538e:b0:29e:5894:9de7 with SMTP id 586e51a60fabf-2b1c0cd8350mr10775730fac.33.1737484159544;
        Tue, 21 Jan 2025 10:29:19 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b8f75872sm3864256fac.36.2025.01.21.10.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 10:29:18 -0800 (PST)
Message-ID: <be8fdeba-4707-467b-be18-d132de9f89f7@broadcom.com>
Date: Tue, 21 Jan 2025 10:29:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 08/11] PCI: brcmstb: Adding a softdep to MIP
 MSI-X driver
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-9-svarbanov@suse.de>
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
In-Reply-To: <20250120130119.671119-9-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_182922_343861_178F5948 
X-CRM114-Status: UNSURE (   8.76  )
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

On 1/20/25 05:01, Stanimir Varbanov wrote:
> In case brcmstb PCIe driver and MIP MSI-X interrupt controller
> drivers are built as modules there could be a race in probing.
> To avoid this add a softdep to MIP driver to guarantee that MIP
> driver will be load first.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

