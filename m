Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA604CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/v0zo/mXJp1eqDSZs81X2kYmENmq+DmgWPaQLy4E3g=; b=Ppk25i5QctU2mB6wOMeK6PSOhe
	Pwo/Sr744VwpyBSLfihfJKIpVtP324kUHMgL6ODOmm71Q8jkQBhOCifs/pr90jvem7mhLBeL3IYT/
	C09zS9l5niR2rAMHxdATdNG/vidssR2gDG9uXWelUdTFykCod8bKYenIGZqyIE9z1eBtiM8V828s4
	W2BpdKcXfzSfyKe7dHmE9jr66tT+RSlEehV23W3dPMmIr7/If/sGzZ2+NJYHuL2nJkxiQQNbGsAYu
	ltRYQU+8U6LqkbznB/1gWblKgIbRt5cseh6AC8fN+e/L8pQeZ/XQ8h++GV3/9i4RtkHf6bHmnoDh/
	rjeus27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ig-00000001pux-3rfh;
	Wed, 29 Oct 2025 15:41:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ie-00000001pt3-2yG9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:41:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7a27c67cdc4so45442b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761752483; x=1762357283; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/v0zo/mXJp1eqDSZs81X2kYmENmq+DmgWPaQLy4E3g=;
        b=Zh9TztBQyH7q4CjO6yUPxvi9/SzjFV/GW0LYqzmQ1vaZxn74iucSm6V16K3JFeTyCv
         JKakvSibWqyWvH+13quYH7ixetW1KowcBYm3eVD77TTfB8WKrW3rvRb7GwCPaj3+GSHM
         de46DQWV5pbsFeuILgZt+CArsgITewfjt4/dqdvNswZV8b7usW4VGaKYkUwn/b5MUSLd
         QKcqkU5NC5tEjUnRZb/eB+eVmPvjGvgOpCf/vLWQdgXVwn3pRn9oBDR8Ca3RHbWs4oxd
         M/4L2u/0Jm14mD92qE/lZXsioYZaWva7xK1NKvvL0LlW+B673/fRtr0937dIezmFTl6n
         Kndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752483; x=1762357283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/v0zo/mXJp1eqDSZs81X2kYmENmq+DmgWPaQLy4E3g=;
        b=CS6VBVA0AJL1qAyzaQKuQYdQ0U0U4h977m8yADOotoQCa+gyr+bopAXVlfCM9cvswh
         mslM65PC8gdVdkQkgCacRv6GgjsgTXRKxDb2hvd4fqkZarFL7rxSa3nO9uiUeUTqCiXy
         wg21sOc0L9r8uTBbeTn2ljOzT9Q7b6o1Z725c02nrjWhgnO8sIBWb1e5A2LE35jvpoQ7
         8m2tZOzzztNfBVBC9VqX7GPDGZzwGMUJJr3uyvhPxxaBKOt97U5ckvKMEG3tYk5CP1YP
         5U4ncoAnYaE2NwkW9Ob4jppJvNsYIsmrNdquqt5yVsvsBBmfNCGj3+83b6bnoWafZGQd
         R5fg==
X-Forwarded-Encrypted: i=1; AJvYcCUAY3Hh8IlKM+N3vrvfO3wnzyCMDvIqJ9BIx+nBq54W8drRPmNv+uV463yN10o+ake09ocAxlQmJ0RpoF/cTXPX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9mz4Xp1+v51h93mZgYBYNjXS1wA+RPEbSDfu9tlKOplzK9pGa
	VCM+UhkbdssRd0DcI7ZdsJpDcw1uIsTLFE1S7PC07NiKlCyFYC0d5HbW
X-Gm-Gg: ASbGnctl2CEGfD2eGJCyPOPko4kxrWuWvhdbjpAdeR4NDceDA4seF/o/OGOItvOA1PT
	UEzkFzGHxbeuyGelGGLY1+CgeeqWrxRxZQ4ZGoOO+26KF4UgNteUutInr36rghrxS/kPef6Xrrr
	+5UhlbxtjviEVKmg/lgMI8oWOnu2UmjnIbWS1YivF4oy1lSZbMYvVaKHE1Z2q0q7qzpOkxQVjm8
	hmzukCdyOaw0HBsQajMO2o3sDdTPoo/LX6uZQ5nf8Uwl/V0lQRebWHES6WSLEviJgIQEm12jFji
	xmVxWPCwKitGFsuUwPzbr56iY99EKAoAyd8rBrLPyjsggCFkImrgIFdzNLjVfGgpGt2vAPZP9Qb
	fh6HBnbbf+GxLqfLMgeBmjK9+PcYAiyxwkJx1xGucA4A1I/4lUjKh2vbdHXy2Wpnt5SrMNNBmlT
	E85FVnLfaq0pmQwnTptR3tYWl6DLBaz/j0aP/ViNcsz+n93VoKmgcFpyz9dp6f
X-Google-Smtp-Source: AGHT+IHTX+Ow2y8Hi8c0rRLKMQlmI+u7C/NGkFheWrGjKnKPUoBmwC8nhsbP1FbgqylJ1UJ/aCLp7g==
X-Received: by 2002:a17:903:234c:b0:28e:7841:d437 with SMTP id d9443c01a7336-294deea30e2mr37900855ad.38.1761752482989;
        Wed, 29 Oct 2025 08:41:22 -0700 (PDT)
Received: from [192.168.0.3] (124-218-201-66.cm.dynamic.apol.com.tw. [124.218.201.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm153773295ad.12.2025.10.29.08.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 08:41:22 -0700 (PDT)
Message-ID: <d2d031ab-6a88-4c7e-bf61-29ad95d8ecaa@gmail.com>
Date: Wed, 29 Oct 2025 23:41:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 Ethernet
To: Sjoerd Simons <sjoerd@collabora.com>, Eric Woudstra
 <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>
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
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>,
 albert-al.lee@airoha.com
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-12-de259719b6f2@collabora.com>
 <4f82aa17-1bf8-4d72-bc1f-b32f364e1cf6@lunn.ch>
 <8f5335a703905dea9d8d0c1840862a3478da1ca7.camel@collabora.com>
 <05610ae5-4a8a-47e9-808b-7ff98fade78e@gmail.com>
 <408842eda1caa53247ff759cd9ea75dcab624594.camel@collabora.com>
Content-Language: en-US
From: "Lucien.Jheng" <lucienzx159@gmail.com>
In-Reply-To: <408842eda1caa53247ff759cd9ea75dcab624594.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_084124_793050_532B1594 
X-CRM114-Status: GOOD (  16.85  )
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

Hi

Sjoerd Simons 於 2025/10/28 下午 09:24 寫道:
> On Tue, 2025-10-28 at 12:14 +0100, Eric Woudstra wrote:
>>
>> On 10/21/25 10:21 PM, Sjoerd Simons wrote:
>>> On Fri, 2025-10-17 at 19:31 +0200, Andrew Lunn wrote:
>>>>> +&mdio_bus {
>>>>> +	phy15: ethernet-phy@f {
>>>>> +		compatible = "ethernet-phy-id03a2.a411";
>>>>> +		reg = <0xf>;
>>>>> +		interrupt-parent = <&pio>;
>>>>> +		interrupts = <38 IRQ_TYPE_EDGE_FALLING>;
>>>> This is probably wrong. PHY interrupts are generally level, not edge.
>>> Sadly i can't find a datasheet for the PHY, so can't really validate that
>>> easily. Maybe Eric can
>>> comment here as the author of the relevant PHY driver.
>>>
>>> I'd note that the mt7986a-bananapi-bpi-r3-mini dts has the same setup for
>>> this PHY, however that's
>>> ofcourse not authoritative.
>>>
>> Lucien would have access to the correct information about the interrupt.
> Thanks! For what it's worth i got around to putting a scope on the line last
> night. It looks like the interrupt line is pulled down until cleared, so it
> appears it's indeed a Level interrupt as Andrew guessed. But would be great to
> have this confirmed based on the documentation :)

The Airoha EN8811H Interrupt behavior is as follows:

When the line side link changes (up→ down or down → up), GPIO 8 will 
output low.

After you clear the interrupt, GPIO 8 will go high. Regarding the 
documentation, let me check where I can put it.

If you have any questions about the EN8811H, please feel free to discuss 
with me.



