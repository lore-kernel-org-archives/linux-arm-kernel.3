Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52496E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thZ6HBScxy6hjzTPhBEM1jXA6AkJmhpnW61fmrZJx8k=; b=NCBycsT6aHClme7QgwORvZkuNP
	cdIbYp7aQRt+qHtx8d2KPPyz/wTszipw8CRzHnvlGcadkcWIyWV1rf+0CnJx+AnwQ6hQqSk37jlFo
	5PMPeiX2atBdEsMvet3ZcCQcQiQyfydHtABPOo5yO1nCqXuRnkdejXNm+LD8y5REy+j0Z69XqUqb4
	n2A9+xcXUljhkmqhJ+YF7gLNlIcKJXGqyMrGY/ll7kv4AplSeTEe/KiHFYes6reyU85oE2O+GZ0JT
	b6XT2A3NnjzvgmbM2UEd9mZeSRtv5EfiaP6CdREqpXVaBGr3toVgZMNQMedbKQU90uv5mDYdkZHLg
	RGC+U09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL43z-0000000CH8z-3nZL;
	Tue, 10 Dec 2024 17:30:23 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL42v-0000000CGyy-1bii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:29:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-725c86bbae7so3596635b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851754; x=1734456554; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=thZ6HBScxy6hjzTPhBEM1jXA6AkJmhpnW61fmrZJx8k=;
        b=Pcl3F6Nm7nuHoFZMkB00XvRJmvcsj/ssr5FmT3QT+238Tnle+PMFyJCwdWZ1cbWl3V
         AHu8EzENTTvB458jpBqT9216Y4QZCOyjJRjPrftmOsNOeb90TVnM9Wjj1HZPTPQZQkzq
         fuMjTnQ/sw6HnfzMo/rrVGZVJCH6Gv5Dmv4qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851754; x=1734456554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thZ6HBScxy6hjzTPhBEM1jXA6AkJmhpnW61fmrZJx8k=;
        b=LpfWRdTD5wN39XumUXp5tq/f4gQVFC5kvlloyR0zT6BLQ1AcI1VI7y31OHwNkQnkNz
         8z9xd49/VeKemamE2FTiyMm7QgspitIcxZmSYs561xX0damSrXADTt2UZnaPgvvea8lM
         Lld7SiWIVMN266+JleaR23zMKOKmAmlx9L5T0U0cA5j/6faB1XwRp/nA5blexoWUEFxM
         eiSLfBodqO/RLkzNPqEZamFed2h+nVfgN5kkpnjc6HcyBago+dF0lDnxtQMNj/Fk1APX
         ivU1X399vLXgNBFTw99I3YrapQ+/v0nsw+gzbZ9TpQGdZHKS9G22NN6ZzyJigSnDDQu7
         MxXA==
X-Forwarded-Encrypted: i=1; AJvYcCXMbZeGSIySfnkPLNkvbORydSctfkKyxqVRyr7ndF4yVgkQvfi46A13V8wxOMQxwHICA309/kHPy829d4E1ph1t@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6gggW3BzdleCeA8sJoH6ykp6mtKaBaQrZNG7OzyJVZxwa0Dec
	V7jGp+IywvKoRUysnYNXm9NjxPzJZYv7X7S46s6L8zTJdcKkiptdQoVr4qRhPQ==
X-Gm-Gg: ASbGncv2oca0HEMthG3UBUYw9SgXJExNLsXHgFLYdOWXQPnOfearMThlBeN3XzcBimf
	v9IInPxJP4BS6LvfqOF781LJnQ5o5d6vpup/sSk6/IYrZsybkNGHMM8aA3ZF7KBLNqJA/WrH3O9
	4JJ+sEfMwekSq5y2PUMxNQk8A4WuY+ExIbJHloapORJ/Jq+lNxul2OFvgeN5NtiX7Oxrwue76wJ
	ZQmvQSr7dmev/t990TDToxJKhYHd1f4aAUx0GhzzMSpZYZ+C0qhPRa3dxxybvk1uMKls/DASzIr
	fYba4MgxWpeqr72y1g==
X-Google-Smtp-Source: AGHT+IGswyqLLELjtBCArvNLOpVscRIPHwqHRgt711FovFWA1BmClq8upJlUYZEQIZa8zi/YjLEFzg==
X-Received: by 2002:a05:6a00:1acc:b0:725:ae5f:7f06 with SMTP id d2e1a72fcca58-7273cb9e915mr9683950b3a.23.1733851754514;
        Tue, 10 Dec 2024 09:29:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725dc0b3ed5sm5585584b3a.87.2024.12.10.09.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:29:13 -0800 (PST)
Message-ID: <26fb01e6-a735-4bdc-a074-5dd141d9db48@broadcom.com>
Date: Tue, 10 Dec 2024 09:29:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/9] net: dsa: remove check for dp->pl in EEE
 methods
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
 <E1tL13z-006cZ7-BZ@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL13z-006cZ7-BZ@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_092917_676691_22C66292 
X-CRM114-Status: UNSURE (   8.91  )
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
> When user ports are initialised, a phylink instance is always created,
> and so dp->pl will always be non-NULL. The EEE methods are only used
> for user ports, so checking for dp->pl to be NULL makes no sense. No
> other phylink-calling method implements similar checks in DSA. Remove
> this unnecessary check.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

