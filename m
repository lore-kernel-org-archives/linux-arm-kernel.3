Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BEFCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjFpI9BYeJIGawQior8vsJoD7SmwJll5ZNIMlbkQNe0=; b=IFntSctdwQBGpkTYt4crLvbnQj
	DtDCtc4HcE4QQLK1N5vHI9i6XPevoC9LWbnXiZ0PWzvOrSp1uTL5tO3cgpxJfLuR4uCEKGCeZkExo
	N3QJGP10e7Mw+VkX0c390JmbmeLmInY2/t+JYU/F4Y/5akbwC3WzHQoicD6ADHRd9uQBbVONgY3J3
	WAoBQPnF5euwvbVUIZoq2G44gIYHPaoaoBXFXmMpRyZQB1VH7wmW6I+XpN8o04ylNALNKXlfEDlS/
	jHIpeUEXoKtihrbTPCr25WAP1iuI3az2qRMEPt2+X1/aSHzUS4v6Ru+ENoYgyTLxpoRGG2BflAnwf
	MYskbwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDhej-0000000FpNR-0RAW;
	Tue, 28 Oct 2025 11:14:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDheg-0000000FpMK-1jv9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 11:14:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so913592866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761650060; x=1762254860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YjFpI9BYeJIGawQior8vsJoD7SmwJll5ZNIMlbkQNe0=;
        b=D5w23G0qbK1ZR4EQQ7ftA/efD33EO05BkwtmHT4hARdzB81kGtKTTRzedXeVp767zo
         xuhnr9Y/w6lFTa4gUomIxICzzsZM4z7ip8tED/MKCkMduDAIHLzYd+PTGHlFk/LjHMBQ
         gtOILzhX9wYaf26kpf+MR0ihuMfnvreBCATEszK2eUUaOda5YKrYDLoNCVVoSyfLVkGL
         eSyRiOlbogqN6GV4R6ilhfrN3GxnCRFF5L4fS07ABj3GeJHChprSt3C0gkLF1YgOruzp
         fBVciqjXkObPq8aEl7/9zQHxHUFGYtjhFlv/ai3ps/7NlpnN+YiLE40B/tKfkPep385+
         8/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761650060; x=1762254860;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjFpI9BYeJIGawQior8vsJoD7SmwJll5ZNIMlbkQNe0=;
        b=S52h7mztptdZfWr5E6pTi8/GjDqfCr2ydcp4bC6jzMZpde3HG8Uol2vkBAA3lEIaYc
         HvOyHZcGIn2QbEoDG0DoUyA5Y57Pt4BOVy5cpYZeisU23zsb5TAUdl7G7CNWDt63uxhP
         VEhAD8Mb5NCFhY07ABJsmyKzkVISmEB8fqYLor1J8+QfTcMwK0kBTXz0uxBkIM84PL9b
         0/G5stOtnCGufHrn9b3R9rWjAHX022JWKOFEDqJS/QTbe+yY4es/9f2lFKPhNLIOqfQE
         sN2iT6Jca3yeZqoisLMxjmesWpzgF9spf5i4MuWZitWhu+lf0J1jqJat+29lZvVSvuPX
         JzQA==
X-Forwarded-Encrypted: i=1; AJvYcCUYOxwJcHSk3GV7fwz0iHuaHUT+fa9qS1olpz/TMN94JUtPRWOLq8O7SzdoXMPVtYH9Hn9WAdRqKmyW67F/ZuK2@lists.infradead.org
X-Gm-Message-State: AOJu0YztTOGqb18UrBvsiJoWz8+Al4o1oxsAH/15l+s0VgqdOcaztg8X
	nrWnP5GcihJ5ZbonCch+U6vhIEVKHzxeTHZwAYH+pwL7PyENHLM7+8hY
X-Gm-Gg: ASbGnctjoO5A4pilf9fcJxIKKYDJMQV0GfGZM+IvhCBkDiEPMW+0g7f3x8cuMnPgHVH
	cHyk5nZdTiDAvKrXR62sS+yDOt7t3ut2t2VTiqtlCQWT8c+s1r2vP1Vanu/Hap0UUdAzxv9Idqb
	Gxaz/z/L6T3SITq3xEjzIwKlCWwLuQ3uusinzn+DBVWCQGGin1dN0vkHT00akrrK8R16cSBis/P
	fPMO+evyLqHwIVqywM+jjYzMigssad0aM0eUV8EEBvAYoE1DRSYObHvUvapjAy3KYtRWibO5Xdu
	XAst5AAoU+gkPfnFo0dwW3Cbyc4Qz+69bfeS1xzjsDco0DY++RSk7a0tQqvbXBe6AywhMEOEqrK
	g759S4WrIx/WRq0G3Tng4ezEBqiYvUW7HEiRVZGBzOEIJzXDee9FlunpC9AOVpU2DTxuAoI4HmJ
	smhhVnsuTtS6VOeYkXgA3Dvq+OnwApSd/XT5qupNBcnIuy6UI78LPrybKVB7K+No0cz4lKuK5vF
	Xzfn07qp8d8rJbpVxbGhb/rZsX6509w0FrPfnvINYNT9Tk12uwpOg==
X-Google-Smtp-Source: AGHT+IGFhB1uFC3jfUFSa2Q1GaChneZzYP9rrCvUKq1g/2kn74sMQ9tiDca6CquKILqpFbpXF/Q/Kg==
X-Received: by 2002:a17:907:7f0a:b0:b4a:ed12:ce51 with SMTP id a640c23a62f3a-b6dba498fe6mr339684266b.23.1761650059938;
        Tue, 28 Oct 2025 04:14:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077ddsm1052436566b.11.2025.10.28.04.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 04:14:19 -0700 (PDT)
Message-ID: <05610ae5-4a8a-47e9-808b-7ff98fade78e@gmail.com>
Date: Tue, 28 Oct 2025 12:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
To: Sjoerd Simons <sjoerd@collabora.com>, Andrew Lunn <andrew@lunn.ch>,
 "Lucien.Jheng" <lucienzx159@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-12-de259719b6f2@collabora.com>
 <4f82aa17-1bf8-4d72-bc1f-b32f364e1cf6@lunn.ch>
 <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_041422_479730_2D3717D8 
X-CRM114-Status: GOOD (  13.55  )
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



On 10/21/25 10:21 PM, Sjoerd Simons wrote:
> On Fri, 2025-10-17 at 19:31 +0200, Andrew Lunn wrote:
>>> +&mdio_bus {
>>> +	phy15: ethernet-phy@f {
>>> +		compatible = "ethernet-phy-id03a2.a411";
>>> +		reg = <0xf>;
>>> +		interrupt-parent = <&pio>;
>>> +		interrupts = <38 IRQ_TYPE_EDGE_FALLING>;
>>
>> This is probably wrong. PHY interrupts are generally level, not edge.
> 
> Sadly i can't find a datasheet for the PHY, so can't really validate that easily. Maybe Eric can
> comment here as the author of the relevant PHY driver.
> 
> I'd note that the mt7986a-bananapi-bpi-r3-mini dts has the same setup for this PHY, however that's
> ofcourse not authoritative.
> 

Lucien would have access to the correct information about the interrupt.


