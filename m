Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3276BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=; b=XtSBvxEfRD+WUwooyrjwOZEbP4
	nLUQnzG2b7AsZYsQHKKaNtPj6yNbQaZBWAcvMAd/g3Zo6FlLqZKdLzm8vQzYfMoy+VxsbtFuVIJyU
	LAyBlxoV2JuiyMkUvlkzDXdxJ9QbT+3gFNKWwJJy8RIfH6AAzQpII33gCy5p+kUcxT9/UfvJYhWlz
	/QTyAE4NjWu3y7ownobRoELrHpuaxGZ9Fm1eA4gR6imbeBCKPBjvBJZbsgmsVsHk1IOxOh/7m45mN
	CaPxE3DwSA5I3z+abFaSxWf1J1u92yjZAQZeMXIZ4LODYm38hj8XH2ID2sNZVZDQ8Xbm/JypTAc+4
	RUOZ22KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL474-0000000CHpo-1Zjb;
	Tue, 10 Dec 2024 17:33:34 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL43y-0000000CH7l-07HX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:30:23 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6d842280932so80696136d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851821; x=1734456621; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=HJJeNyWsoO7vFlVl7eM25WbR2f+CznYjYef/JPX22hbo5HyDM2JoGFq839fbp95Bo1
         xI4s/8mpm6peDf/i7J9u54pdK48zlOCHIRJoq2ti8iGhnGOy07K1p+ELRX7i+6xL89xN
         FK4XEcmGv2Byg72Boj+d20oo6S3jEA5mnB7vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851821; x=1734456621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=MWIow7R/d4hZZtyprxe/4/o5uIGw3CttVQAb1DU6V3XgaxYddVDy5z+xuFmTRQNV8M
         EVkKKhV4oZfiVYpn8ehB0CE7CKuBJeJmEkBi+3CU6yUYORvI+Wygjq6DFrlfMT4rIW4B
         DkqgzGJ9W1f8CFqQF8bVKsr6J9ILwCA/swolbAZ8f4nv4N2k3h5eat5IPOwDJ2wjP2J2
         d4BxiLItfqaM1OMQkdiiaKUAIc/qxyd9acB9jaHFIB/W9l9l7x4T93/+3V7+aZQAvmt1
         d4gL9361/rjegS4bcOAl/XZRzjUVnvUjjOlO9rhR7FEtNmVPx/R+ZycZPpvcxQfzB4mJ
         FdOg==
X-Forwarded-Encrypted: i=1; AJvYcCW1qznvS4OxNjryTfaQPKlFH7Alahp2BEMTDPAivOoh9Wl+8JIL5QRrLCDCoNwl41OCBpcbGn3ILOgTDyVEKEdF@lists.infradead.org
X-Gm-Message-State: AOJu0YwAx6kINZmu6J7rQ0octunA6+eVloLSGgomRUxtX0dnL3XudDmV
	nRPFEtYvhHy+a56Pa7ubHqwYmi2QfAZTTgtMZHXoBoLkmWV+ZG+//1O2Q+eMow==
X-Gm-Gg: ASbGncujmzRSQKyK3ZxX5qwForM1v+63YEXGi1/wBkbqFsy2A1VSW6RZf7Qky48il+r
	i/7juwY+n+hA6sOrMjs2PJUSIErlo6Mq/onT6IsN/zUSE50eYQ15fiyzClv7KjNRpOt+QJZfJS/
	oTq9YxC/CYdQH7H48zFNDmkP7yz+8d54mnWZjaE7BXMsuo75LARu+ERcQCqvAxvLqVr+gZ5IE3G
	vkl0A9DZo9/TapisY4QE39unNBbHvapCXR82Xdz2raZgoIKFRvSccZ+I3STuGmI1NGtHhKLanw/
	nNlww6FuC8yxDndS7A==
X-Google-Smtp-Source: AGHT+IGSlwLnkhDmztl6nVFIaXK4bCm/Nqbb2pVJVrqEqNuu1yaCRevEfXGCfMJUDd+wIPCUwOQAZQ==
X-Received: by 2002:a05:6214:2a4f:b0:6d8:981d:529 with SMTP id 6a1803df08f44-6d91e43ea4fmr82139946d6.48.1733851821154;
        Tue, 10 Dec 2024 09:30:21 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d90299bccesm33827546d6.60.2024.12.10.09.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:30:19 -0800 (PST)
Message-ID: <ad11506a-3b11-4584-8efb-8075158527b2@broadcom.com>
Date: Tue, 10 Dec 2024 09:30:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/9] net: dsa: mt753x: implement .support_eee()
 method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ar__n__ __NAL <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
 <E1tL14J-006cZa-Rh@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14J-006cZa-Rh@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093022_067205_0986E3C2 
X-CRM114-Status: UNSURE (   6.90  )
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

On 12/10/24 06:18, Russell King (Oracle) wrote:
> Implement the .support_eee() method by using the generic helper as all
> user ports support EEE.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

