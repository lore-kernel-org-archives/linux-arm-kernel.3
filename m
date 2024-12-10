Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE308E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=; b=EKzxO6F4dHZIXCZ/c7t3EP6dty
	SHq6o3a8XyWrfnLJW0AJ1CqUwaSmKHkESOMHV4GAeYoMKI18fbgp+eeDWA51Wn8rZ3Pb0TrOXOnPN
	04ChtjH+SL57Gfx6zdP9C0AX/W+dSRtuBNETUqIX+0HBlp7KxJG6jnGrVTDoP+tIzMGHMKQrTKHAZ
	kC9HNNDz55dTM/U1F/rDZuIvXjH4sIW7BBymD8rVga7VMXXQxSVGnxGqoGPewfUFu1B2XYNZ8JSDZ
	Y6/2Th/8wE1Fpy0ShjcFP7rdQtw1hPh5nNSWG+20OFZn3DuiRGdK/qRqSUtBoVKpo7CTtmJWaE0xM
	GsdQetSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL497-0000000CINb-42Gc;
	Tue, 10 Dec 2024 17:35:41 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL44J-0000000CHEY-2LkJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:30:45 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6ef7640e484so67709177b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851842; x=1734456642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=Yo5KdLUSewousEy8WSpHqbuQUXr63HSucAqFajncHLpfADsD9o45A0w8VQd99CzxHB
         SRumy/iaO1/iKKnpOh8CgtZIJFJbCUTlyY+H2ngAh/KDjiLO5rpojaEsF+mkHOP0RUWf
         Dp1QLf2TRpJk85HGzVeBgWJnUjFcKQb3c+p18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851842; x=1734456642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=wNMyJkDEknwP914ije9ZY465Qi2wNaq+WoSQZxHW1C9seRHVsMDSSDxjwKUHDGaDut
         n5ch84U5vAa9hhZscPSk45fwKt6/k0c+cy8joPhiE+EuET028QPE6TubfKONoO0HSkd3
         rKtZRdJCG1HelMnf8ObWKHu/FNXOJFuD1n6GhUqIQKn2IToiBLrFC6R7dZpaCS7gL7Oq
         Y4PIr44wkCgZjlsaNZQ8Rw4Y/zJEZxMDhszmPVBHrs1Lh3I2Yu/CjvLtRrNLOILIAjuC
         3Jg2KvQ9gFGwOVV+a1vdwyWki0vnubcPvWgoLnqtKkdu9g0K8M2IgU8RSHH08RAGdtuq
         5WFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYZA4EsA4XcZpz87+JuQ0Y8zGysRmloSCEmdp56/R/E0V1TXvL+/ZKDOZ2mhjywnm946iFNOJV3XFjkAXIgHNA@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ6STipCFwOQQd3iggeqSDPMFoBq49XR3CXwyyM6wGTtotsITS
	alqCXQih5P6ozInlAeqdmhWBFL+Log/o3YmqTkI2JndPSgWGyZRjo1OAJf553A==
X-Gm-Gg: ASbGnctRjD+JZx1DzscESwwwIaLVZufdiZr0rzSa4a1wp39o/EEwHUr6WF87iIfd49u
	Sd96Z4AcdXNbRqCH8WRh+hS0Z2N5Q8WqVybTUd5al+powld+9NjQ9ll6EjNHeU2JJtqOy99WAPI
	0mGzCP1lV9vp9tuk98CYPw8sJL9eiGpZwnWxZ5k3FO/DWwXOnVFxNnWvJiRVju43lecNUJiIRtn
	zuBF2W2MfqWaTOshWjx3iVdpSgjUpoe+nRwNnGlY6V2zLMgugs96wbDTR1ozxIVbsayA1olBa1S
	1+Dqszzl35N4fFYZeA==
X-Google-Smtp-Source: AGHT+IFAU801Dt6zTWCJn1TrhyNfAisMPlKuytisjokiJmnDVtGZDPAs0pqApy7yUxYxSg524ryRDA==
X-Received: by 2002:a05:690c:62c2:b0:6ef:9dbe:9f82 with SMTP id 00721157ae682-6f022f74f6dmr65176287b3.29.1733851842073;
        Tue, 10 Dec 2024 09:30:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d90299bccesm33827546d6.60.2024.12.10.09.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:30:40 -0800 (PST)
Message-ID: <572fb811-c42f-45c5-9c76-2a25601192e2@broadcom.com>
Date: Tue, 10 Dec 2024 09:30:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 7/9] net: dsa: mv88e6xxx: implement
 .support_eee() method
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
 <E1tL14U-006cZm-2K@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14U-006cZm-2K@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093043_596288_B699D3B6 
X-CRM114-Status: UNSURE (   6.80  )
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

