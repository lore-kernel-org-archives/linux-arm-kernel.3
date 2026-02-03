Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4860EE87847
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=; b=gmczM5pEpEaVYzgIfsFrdCItN9
	kxLfXCH4u8a+HqZAxLId9v46U1cHUdaqO2Eq6DbQyn38gjFtjEKVLQtyTxADAulCk7xQdec/fhiyY
	dSO9m3JW/crjUZdrC4B3FhqW7pWevKBp95O00BXfyylmqRTPyn2+SOomVnwW6zbsjLCz9Bh3oC3fS
	IE1EqhCVOZrfSMVPSmHyID+GfR5skhbhGU11P0WzGrQ6U+ZNCosBYrzmPCgS7f1k92p+DccbpHJV+
	O0riHl+h6EjZOfKbG94P3kHCiQNuDZ/5AOzYnDvQa6OW5My4xtoKmc3ExOJPk9c9kJQJjRezmv59m
	XpkQW8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJGm-00000006wvC-0pq9;
	Tue, 03 Feb 2026 16:28:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJGk-00000006wuL-0DNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:28:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43590777e22so3658408f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770136128; x=1770740928; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=;
        b=YP8T/O4qUwuwot8vXKD7yFG7gtr5/jSXTsblVTnZcxR/saIUncgNfKoNMGHwlRHaXP
         x5XcTtJdzKhYFr71llT7G6LroawLq7mUcXWgXb0pNZz2Dse6RiSF6zptf6TDOxHDEtnq
         GumshhlDZKZT5W5XqQBgrfU9rH3FgEQDrZ8f/UszHVCvqhusn/3S7EWZhIoXNljOz5dV
         oi9asSUeP3xRItfgRbGYC0Wnzpiskwf8HQ9ksdowny4sKFZasXDrNkQdDuj4oN/GUsEI
         VYAAglSNf+kEcL7zWfqQtEB9jU8GLqZLrw6CPHGXTlgfGMPcMac9F1rv2jFZkTMgD3bz
         hPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770136128; x=1770740928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K10+Z/PfLLLC2tLsBMJ7x0EDY9z49CyvtmsqUUYjuGg=;
        b=GRjsEH5iHjYfXmUISF5x6EG9kxQI0Ldtf8ZSKkd4+9trDj9GRqnzgH+AG2uSaexZhe
         vKjjO6/C94KW4LfwXljzDQG/MiD160fZUNypyZDSU5ZSCIyhyCCkJYhB03caE8Ndbiu6
         /YiLej/+I+ndPbKS8/sovfp/iUDRhdfRPrVpeke2AeP06s91LfEDZI5FWsOxuF0CDuqp
         IvtWmrqP05KLAwXb2FqF3lWiRs282+XN+JEbQEMaP0W0XL0RNX5ZmcqqG0LQzT58Riw6
         vqPvsOHybXugSE/wj7EcEViRzpggA4YvPdnjIabxSbPK2m3iMSlEK9PcceIlIWre1Btf
         xRJw==
X-Forwarded-Encrypted: i=1; AJvYcCVYR9r1XQCJXpERB2dJJbyVnbjTwq2uyBhxzrJXm06tqETokmps9tPo2bwsSeVFSzbO5JRab/gzlg2OpgzMB2le@lists.infradead.org
X-Gm-Message-State: AOJu0YwQl3DXNlCJwAl/c9pbGbH6kycptW9iC3vpgLV6a4Z60WLx6LzT
	k7jRNxth6M93AUslW33dknB/elb0UvS8M5p+FBGO9rELldPTXkL862nZ
X-Gm-Gg: AZuq6aJ0le059Ry08oRZcJWU+WlMdQcbXOyaemEhtNJrINN8Ys4Pl5egMtWRnh+fjN2
	U6umh1pB4iFN25Bj7W/bSHSPk+bAt8fwnJuwu7wAEyLeaoTG6mZg04O05CYjeF/pluPs5sc+Egb
	1UZw54nr6V39ZdHLXIJP/+yIK6WIM7S6gWSxt9eAggawWQU9KmLQvwrWofRXsH1AaMr1iX4ZJnE
	EvRnJ/D1ZO38RsnGrPqsOS+mjIUnfjBhTVZvYW3fF4tvsEMj9B79SZ1CodyGOb3b5UdL+JZQOmy
	FSS8di8l4pqbbfWvQ201TS28TwM1TE2fPqKe5w/jPwave26ZCLTwaeNWywttkaQHZMKPrpvbrPV
	Z39pvpAhkQot5Sn0rrecBKFn3QSRCnBwKI23Xl3GC24X9Y8RMgo/+sVT5/puObnejQD/0Gd80xN
	mR/gN8LL2RNUEEJG7U8266PtOZ
X-Received: by 2002:a5d:5e01:0:b0:435:b068:d3be with SMTP id ffacd0b85a97d-435f3aa90cemr24034054f8f.41.1770136128003;
        Tue, 03 Feb 2026 08:28:48 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm50668256f8f.25.2026.02.03.08.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 08:28:47 -0800 (PST)
Message-ID: <434bff80-0b89-4fe5-beb2-4b70a4b600d8@gmail.com>
Date: Tue, 3 Feb 2026 18:28:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Wei Fang <wei.fang@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
 <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_082850_153144_E85CEDA2 
X-CRM114-Status: GOOD (  29.73  )
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



On 2/3/26 5:43 PM, Russell King (Oracle) wrote:
> On Tue, Feb 03, 2026 at 05:42:07PM +0200, Ovidiu Panait wrote:
>>
>> Hi Russell,
>>
>> On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
>>> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
>>>>
>>>> Hi Russell,
>>>>
>>>> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
>>>>> Some platforms have problems when EEE is enabled, and thus need a way
>>>>> to disable stmmac EEE support. Add a flag before the other LPI related
>>>>> flags which tells stmmac to avoid populating the phylink LPI
>>>>> capabilities, which causes phylink to call phy_disable_eee() for any
>>>>> PHY that is attached to the affected phylink instance.
>>>>>
>>>>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
>>>>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
>>>>> to the receive clock domain, and takes four clock cycles to clear, this
>>>>> leads to interrupt storms as the interrupt remains asserted for some
>>>>> time after the LPI control and status register is read.
>>>>>
>>>>> This problem becomes worse when the receive clock from the PHY stops
>>>>> when the receive path enters LPI state - which means that lpi_intr_o
>>>>> can not deassert until the clock restarts. Since the LPI state of the
>>>>> receive path depends on the link partner, this is out of our control.
>>>>> We could disable RX clock stop at the PHY, but that doesn't get around
>>>>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
>>>>>
>>>>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
>>>>> this is insufficient - the problem is also visible at 100M speeds,
>>>>> where the receive clock is slower.
>>>>>
>>>>> There is extensive discussion and investigation in the thread linked
>>>>> below, the result of which is summarised in this commit message.
>>>>>
>>>>
>>>> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
>>>> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
>>>> separate, dedicated interrupt line to the CPU rather than being OR'd
>>>> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
>>>> "eth_lpi" interrupt in the stmmac bindings:
>>>> """
>>>> - description: The interrupt that occurs when Rx exits the LPI state
>>>> const: eth_lpi
>>>> """
>>>>
>>>> Looking through the other glue drivers/device-trees, it looks to me that
>>>> every platform that defines a separate "eth_lpi" irq might have the
>>>> interrupt storm problem.
>>>
>>> That is highly likely.
>>>
>>>> To fix this issue on these platforms, rather than disabling EEE
>>>> altogether, would it be possible to just not request the eth_lpi
>>>> interrupt and let EEE continue to work? Perhaps a new flag could let
>>>> each platform decide.
>>>
>>> Yes, because lpi_intr_o serves no purpose from a software point of
>>> view - see the commit message below for the details. I do like
>>> removing code from stmmac :)
>>>
>>>> If not, maybe this patch could be merged to add the flag that disables
>>>> EEE and I will just send a patch to disable EEE on our platforms as well.
>>>
>>> We still need the flag to disable EEE for platforms where lpi_intr_o is
>>> logically OR'd with the other interrupts, so there's no way to ignore
>>> its persistent assertion.
>>>
>>> 8<===
>>> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>>> Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
>>>
>>> The dwmac databook for v3.74a states that lpi_intr_o is a sideband
>>> signal which should be used to ungate the application clock, and this
>>> signal is synchronous to the receive clock. The receive clock can run
>>> at 2.5, 25 or 125MHz depending on the media speed, and can stop under
>>> the control of the link partner. This means that the time it takes to
>>> clear is dependent on the negotiated media speed, and thus can be 8,
>>> 40, or 400ns after reading the LPI control and status register.
>>>
>>> It has been observed with some aggressive link partners, this clock
>>> can stop while lpi_intr_o is still asserted, meaning that the signal
>>> remains asserted for an indefinite period that the local system has
>>> no direct control over.
>>>
>>> The LPI interrupts will still be signalled through the main interrupt
>>> path in any case, and this path is not dependent on the receive clock.
>>>
>>> This, since we do not gate the application clock, and the chances of
>>> adding clock gating in the future are slim due to the clocks being
>>> ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
>>> requests the interrupt, and all associated code.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
>> with this patch and didn't see any issues:
>>
>> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> 
> Would you say this is a regression or a new problem?

I don't think it is a regression per se. AFAICT this behavior was always
present as long as EEE is enabled, but I only noticed it after I changed
the network switch the board was connected to.

Thanks,
Ovidiu


