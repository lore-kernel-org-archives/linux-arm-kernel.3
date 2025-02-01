Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A587C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 22:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZTYWsQ2rXMvswbcnWNhWM5wo7jgjGDZPXJeK35/HXo=; b=FGYBmleQ98Y8m0kyOc3vmzgtuV
	M2c3Tujm+D93XrdF1lEzhmsT6tCJ3vm/Z+nSGEWagsLlKTd+55i6nskizPTbuNkYqGKLwxhHP0N+9
	thj3IzAdC2ct0CjRvMpTxeaIssQPXgVaKJGL9IuSD6qFqqJk6g4OEG6WSmB6zqzjzBzms8jjqXOFE
	5iIWcf1ZYDv4NEVPrPQqn0/rSNt+gvdAxho6O8Jdr5eVIW0MtIgF659vzcsQ5seC+jlxH4tTfc6gG
	LbxOZny2Vtvt8EIsPaHkLff2tVfjCP9u+Z3loikwVpgsiMe1t4h3IgtSxXWcSacEyHrFm6icgaLTE
	WA9ZwSng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teLaY-0000000D9wF-209c;
	Sat, 01 Feb 2025 22:03:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teLZD-0000000D9nz-1Ff1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Feb 2025 22:02:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2163dc5155fso55924475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 14:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738447338; x=1739052138; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yZTYWsQ2rXMvswbcnWNhWM5wo7jgjGDZPXJeK35/HXo=;
        b=W3ifZoI06gBrN4W2qzhaqIohnteagv/Ex9T73vka5mBkqOpj8CicT6hF41zls0ECMC
         1+ROdT+mxblc7ctf0kfrnrmzMBLjZKf1UKxw7C3Ih0tlZKEGDZPB4VuA64WfIZwO1X7P
         tJblqQ55NMQ4XzWB0UMd9y6AwZcYDVxNW/Jbm/dw1MHtgL6o1J6++xoPYA4mOk1bqlI5
         QcXGLtBC9VwO4JOMqtL6Gl8JCQxZimowgTE3YMKDVrzv2Edyolo/JUsMBKKyn+v9sF01
         sXCdLy8v5lkV7X5pHPU52tGAcGFZJ2V9i0ZNl7pbf+O5/vfRt504WVMEwUIEsk+sTt0N
         JqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738447338; x=1739052138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZTYWsQ2rXMvswbcnWNhWM5wo7jgjGDZPXJeK35/HXo=;
        b=BA5ql1uqWC3Ztle7r2iYzOwEdQyGlL0QQG7OOpdguWZdbMsLz7xEGyf0+oNSxDA+RO
         Ir8dfO5qq+PrgxkFB9mAu9W6n+CcubmophqashZ2tPG8wb9VHxZ+Wdn7PYTXfjZpvnhY
         hDW4Bq3QkHBCb6MeOFixAmlP1ofGCncsEDJybyMjmVZEMhVtlHI4SoL2Z02hciTVf9LQ
         mromPvoUojCo96kClylrPryiYA5ouLr65roGotBeKU6dcIrVK9Aluh1Crsegb1NaW+SN
         p3nLsx09Jf7a79uR03QZB0gXoIqKS/FA7M3T/wJqzXTU6FmmiXBiTp/cSeA3CI4lR9pg
         m5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW5JbQUK3Z2i4EgR0g/uQfgiPoc/TEtB6Qqg2VYEIcA4Hm2dqLWAdHqk24ow0agxkoUKGRSrwBwRL/IewURrq5r@lists.infradead.org
X-Gm-Message-State: AOJu0Yw855mwoWvPbMdIR96rEZevYr7lh0AOWlTg/IfZW8FGzaVR4IgR
	NpEJmy4suH+0brjwVatIPQZNLDL4CGOrV7ZPneO5JGQxKoKcCW5X
X-Gm-Gg: ASbGnctVY8Z1tb1fdIEm3DzTSpI0X4m6fKPqeoOi32R2NRY8frnABo6oiv9ekmB3KmP
	KvJ5ubqUDDg8cBxfh6SqlHQ9l3qNYkB8AFTkb34auSLNS7yDiF4x8ahJM9JzCz47H5TOqvlq1Of
	x8wlOFfkKv62Y+cCIOgAYhGomoBl2bgoxA7gr0YXnroMcPwM0jcaO8HhCmopF5ELi0stZ96f7Iv
	+zMdZzQJBynPgnAf8W02/7kGUdI1nFLTkdReT0adt4S83sAp6hFzrshT/IYAYNxFNuCdKSu+Bf4
	WvfpvdBWViFcoAY0nBjr9T/cfELM6V5MnYfswBk3iRaAEAmhoafGcb4jgr0Ah1hD
X-Google-Smtp-Source: AGHT+IESOLZrNPRE8eNq6AjXqLjXF+vkm3bCDTeO+deTf9IYocKz/OepfOidluOgF5vpIheeDhFc5g==
X-Received: by 2002:a17:902:f606:b0:215:89a0:416f with SMTP id d9443c01a7336-21dd7d82c71mr242374595ad.30.1738447338310;
        Sat, 01 Feb 2025 14:02:18 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ebabasm49881245ad.129.2025.02.01.14.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 14:02:17 -0800 (PST)
Message-ID: <8c2ecfb0-cfbc-439c-a0b5-b9e18a5eef98@roeck-us.net>
Date: Sat, 1 Feb 2025 14:02:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 3/3] net: stmmac: Specify hardware capability value
 when FIFO size isn't specified
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yanteng Si <si.yanteng@linux.dev>, Furong Xu <0x1207@gmail.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250127013820.2941044-1-hayashi.kunihiko@socionext.com>
 <20250127013820.2941044-4-hayashi.kunihiko@socionext.com>
 <4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net>
 <Z56FmH968FUGkC5J@shell.armlinux.org.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z56FmH968FUGkC5J@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_140219_356196_ADA45CD5 
X-CRM114-Status: GOOD (  17.27  )
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

On 2/1/25 12:35, Russell King (Oracle) wrote:
> On Sat, Feb 01, 2025 at 11:14:41AM -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Mon, Jan 27, 2025 at 10:38:20AM +0900, Kunihiko Hayashi wrote:
>>> When Tx/Rx FIFO size is not specified in advance, the driver checks if
>>> the value is zero and sets the hardware capability value in functions
>>> where that value is used.
>>>
>>> Consolidate the check and settings into function stmmac_hw_init() and
>>> remove redundant other statements.
>>>
>>> If FIFO size is zero and the hardware capability also doesn't have upper
>>> limit values, return with an error message.
>>>
>>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>>
>> This patch breaks qemu's stmmac emulation, for example for
>> npcm750-evb. The error message is:
>> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
> 
> Interesting. I looked at QEMU to see whether anything in the Debian
> stable version of QEMU might possibly have STMMAC emulation, but
> drew a blank... Even trying to find where in QEMU it emulates the
> STMMAC. I do see that it does include this, so maybe I can use that
> to test some of my stmmac changes. Thanks!
> 

Support was added in qemu v9.0.0. See qemu commit 08f787a34c
("hw/net: Add NPCMXXX GMAC device"). It doesn't directly say what
the emulated hardware actually is, but the commit message says

     The following message shows up with the change:
     Broadcom BCM54612E stmmac-0:00: attached PHY driver [Broadcom BCM54612E] (mii_bus:phy_addr=stmmac-0:00, irq=POLL)
     stmmaceth f0802000.eth eth0: Link is Up - 1Gbps/Full - flow control rx/tx

so that is a bit of a hint.

Guenter


