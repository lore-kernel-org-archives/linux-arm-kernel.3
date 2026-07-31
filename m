Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5918C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEplQyDJV/hD+jMr1nJP3q3x4a/yIY1QGzHv0URj6Fk=; b=BGOEHQJC9ntHROibdvUUMZWnUY
	TMzIRZ3RC4DLRRW7+4VwM7q8MB10HZcdX7kfbIPEOrSfee8JeHR0PhSfbKxzK/NFfacin4HxStq1N
	IpxwtFaDV3t6MzwgsojRymISw+v/NOGCH1XFYDDFdRVvgnNOrAznvS23y7PW7A4I8uPVDCaphAWqV
	SeKOJWZJGwzbfnvh4E6TAjEjgc2AJxkitvyBcO/2B/4jM+xmF0IXVI0nMRDVxNANfMTsojK5kkbzS
	NM0N40fy5BqZFQ5Z9yUQB70eiJ07h6AHr1pstCoRJgdEiBTPKmzgvBLt9aq8sVZEviugx2JxdP6jr
	GoGBLhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmyc-0000000CXi0-3WvL;
	Fri, 31 Jul 2026 13:08:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmya-0000000CXhe-1oWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 13:08:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9F3204C;
	Fri, 31 Jul 2026 06:08:30 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB6083F7B4;
	Fri, 31 Jul 2026 06:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785503314; bh=nrcar04cvFJC+ca/pCx8J0BMjodvp6Ms01tyJ+xahhM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=luulRorDkUZw5bQbnYOwknuhMOVqwtfWZBwjZS1beSAGvPqWlCk/AKViaAV8nJFDd
	 X/oZdIAdREdxYv9/Biq/AMVH1r/LHDRzneFlfUYeuAgYU2/qAG2KwTlYI+PnQa3pUy
	 xiSbpk/pvpG9HohXT7O6Ai0dUX7NZGPnIlf6BnFo=
Message-ID: <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com>
Date: Fri, 31 Jul 2026 15:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com>
 <20260723002319.2793cdaf@ryzen.lan>
 <CA+c=wxVB-cEncgBE12S2YgXhL7DVgRyg12_4jJ-CjxzBjK62kw@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CA+c=wxVB-cEncgBE12S2YgXhL7DVgRyg12_4jJ-CjxzBjK62kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_060836_569628_489E714B 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Juan,

On 7/30/26 19:40, Juan Manuel wrote:
> Hi Andre,
> 
>> There is more to enabling Ethernet on the box, though, right? The
>> EMAC25M pin needs to be configured correctly - not even sure that
>> works cleanly with mainline? And what are the delay values that work
>> for you?
> 
> Right, the withstand fix alone isn't enough. Three things were needed to
> get GMAC1 up on the OPi 4A:

Sorry, there might be some confusion here: I think Chen-Yu already 
mentioned that Ethernet works on his OPi 4A, with just the withstanding fix.
I think I was mixing this up with the X96QPro+ TV box when asking, which 
also uses the second MAC, but has a different setup.
So are you talking about the Orange Pi 4A? Because ...

> 1) The PJ pinmux. Mainline's rgmii1 group was missing PJ10, which left
>     one RX signal unmapped, so I got rx_packets=0. The BSP muxes the full
>     PJ0..PJ15 (16 pins) as function "gmac1" (mux 5); with all 16 mapped,
>     RX comes alive. I don't mux any separate/dedicated 25 MHz clock-out
>     pin beyond that gmac1 group, and the link is rock solid, so on this
>     board the PHY's 25 MHz reference isn't provided by an extra SoC pin.

I think there is some misunderstanding here, probably caused by 
Allwinner's naming of that pin. Pin PJ10 (and PH13, inside the GMAC0 
group) are mere clock fanouts, they connect internally to two gated 
divider clocks, with the main peripheral PLL as their parent. They 
produce a 25 MHz clock signal, which is simply routed out to those pins. 
They work independently of the MACs, and could be even used for 
something else.

On boards which do not use a crystal oscillator to clock the PHY (most 
boards, including the OPi 4A, have an oscillator!), the pin is not 
needed, hence we didn't include it in the pinmux. According to the 
schematic, PJ10 is not even connected on the OPi 4A, so whether you 
include it in the pinmux or not doesn't matter.

So can you please double check this? For PJ10 to have any effect, it 
also would need the associated clock enabled.

And for the records: I think I found now the proper solution to enable 
Ethernet on the X96QPro+: the pinmux for PJ10 gets added, either in the 
PHY, or the MAC DT node. The associated EPHY_25M clock must then be 
referenced by the PHY node. And the respective PHY driver needs to 
enable that clock (some do, others don't).
With those things in place, Ethernet works on the X96QPro+ board, which 
does not feature a crystal oscillator, hence relies on that 25 MHz clock 
output to step in.

> 2) RGMII clock delays. The board has a Motorcomm YT8531 PHY:
>       - phy-mode          = "rgmii-rxid"
>       - PHY node          : rx-internal-delay-ps = 1900  (YT8531
> RXC_DLY_EN, ~1.9ns)
>       - MAC syscon        : tx-internal-delay-ps = 100
>                             rx-internal-delay-ps = 0
>     That combo gives a stable 1 Gbps / full-duplex link, 0% packet loss.

Those settings differ from what's in mainline. What are the results with 
those delays? Does it work as well, and those are just other settings 
that happen to work, because the math works out the same?

Cheers,
Andre

> 3) Your withstand encoding fix. Before it, the PJ bank was driven at 1.8V
>     while the receiver sat in 3.3V mode, so RX was effectively deaf. With
>     your patch RX reads correctly.
> 
> All of the above is validated on my board (2026-07-08): link up at
> 1 Gbps/full, ping 0% loss over a sustained transfer.
> 
> Thanks again for the withstand fix - glad the POW_MOD_SEL patch helped
> connect the dots.
> 
> Cheers,
> Juan


