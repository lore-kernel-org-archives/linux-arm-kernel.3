Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B756E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=log8kXEqpuK744XdboVARaUSdfYZkSA14nYsYjP8ez8=; b=SFR5sP3akSEq9F0rP/D21mbTkN
	qJzS/A37SMRs/p1z9P+7Q5ljCbzgxweWDguEqtnVpPTxQmn/iNV4PIIIlZBbqtd1MZgfxd93MNne+
	V84n4K9f1Lof5p8T7Nf+pXIqZ9IGkHBRHRjKWE2cJqRiB64ffds9qdqMPRXjrBVvOZ3O+J0ZpBgDJ
	V/F7yFKyYvdgOEFSDpp/JKuXfLU5o+sgde6jMxaMJkeFMRh3vCnDt586WFkrEowy/XJuNXGy56IrT
	DFo6DNcd9W618Jtho+pA/1BgdC5rytdNrQmDaR5064BOwd5cAXtCA5ptTpBTj7bM57P03ioxrG4pl
	j+3+if5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4A8-0000000CIWx-3Yv8;
	Tue, 10 Dec 2024 17:36:44 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL44i-0000000CHJj-2py9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 17:31:10 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d92cd1e811so5520796d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851867; x=1734456667; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=log8kXEqpuK744XdboVARaUSdfYZkSA14nYsYjP8ez8=;
        b=GH1HefU7NxgbnJoQuovO3CETT7QKiHbs4W3d7mCHy1zlJxykTQm8scmALkdX2Ykyt3
         oZQJO5Xj5m+jaLl0vk1H6+9fQ2Se8Oa5929rBLDN+A6b+9qA9puOi7kJ58/CUABbDBrs
         t8IHP0NVZpfNaDg7KFif18R1Ty6CgrngoFheA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851867; x=1734456667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=log8kXEqpuK744XdboVARaUSdfYZkSA14nYsYjP8ez8=;
        b=sJQG6bxFJldvjivsCE9lyiUExdLaQgO2G4Mw3Lafjjc6JpUrj38t4QLXflk+XimCMW
         iH/ybRwTLlk2Za1K3XYYAt7wS2T23D9CRUHursDabiZYkVeWO0lZcid0kcs51ofPk/xu
         j2Q6d0n1A5iXbBLXEsbz33laavUG13Ahe8SFge//DJzBjbCMkDd9Aj5GPbwSyqhZ+xUz
         8DZxLNf/nPkSqsEetxc2H8PUS070uanxyZzHKfXyVgnk6D4W/WHgtQ2Khi+4QUJ2UVkL
         8cgKO4h4OVtOsyEGl/g4Fu91bzPUBx9WlW59A7tUuSe7pXMO1qd2Cz+KBolIpzT/UAKU
         eAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiLWvvXTI8WOBByo24lBlaWMtNWvUs39Tx2rAa/C/DTVknPAdX45ktDq22dGRtPT6DA7ie569bP9T66AkuAuwZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyF28okiTSvgd4CCU+nbVrsaTpSor1TnZRgRe34PHR+4/KKrjyG
	f1ML63ZNtzLp8+GbWM8rhonI8z2k4gQjPd+CE9I5aeKYvP5uC2xkheyTl2ZjPg==
X-Gm-Gg: ASbGncvjYZenrxta1SM6mv7czD7pEHcLLnhI/YEsKFI9B/D1tadsj+Co/zmitWLnpey
	GqQfvO21Pt8OfrZX/5vmfL42lr0Ewi6r9dncSzHkpXvncyF5FjXNpm6Tis6AsDmyF1ZZ8/+KpDp
	wJs/FRAjUvI1ZfJmOQe+IeceVzImllmsRC6qpM8TNUixb7YAS7lKBTdHPAAi/6BU9UyIcPN4DAX
	HB5W0TiBc3ZdTXRDD1T4/q281u9yI+rPN+pkl2PDrrsw/oh5giHp/l/aInWKEtc4foqQ28/bAYM
	/vjvFCHKvXUJNP0CFQ==
X-Google-Smtp-Source: AGHT+IF/4xJ59ARU3WYksPUtImtmV38OpHKa3QhPpiCDikzZ3ElPZ/9NL7hnDna6l/f0hs691/ko6A==
X-Received: by 2002:a05:6214:246f:b0:6d9:318:824b with SMTP id 6a1803df08f44-6d92127f73amr68969156d6.3.1733851867206;
        Tue, 10 Dec 2024 09:31:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm44010436d6.72.2024.12.10.09.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:31:03 -0800 (PST)
Message-ID: <e92574b2-3698-4eeb-834b-fac780a6308c@broadcom.com>
Date: Tue, 10 Dec 2024 09:30:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 8/9] net: dsa: ksz: implement .support_eee()
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
 <E1tL14Z-006cZs-6o@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14Z-006cZs-6o@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093108_720690_21FF1F06 
X-CRM114-Status: UNSURE (   8.07  )
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
> Implement the .support_eee() method by reusing the ksz_validate_eee()
> method as a template, renaming the function, changing the return type
> and values, and removing it from the ksz_set_mac_eee() and
> ksz_get_mac_eee() methods.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

