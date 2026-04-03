Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D653D730A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 06:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sxqu5R5Wk043JMyFgXFiDt3SNRh3XWkGz4XQz5WOSM=; b=Rc5QKCbYQKRBQdH6CetQB5gC0H
	PM4VIGi06nN4BYMfPFkokg1sGMaUbcadl815jlToEm4anOexuixHBFYJsf93xzbhmTx01ujFCaQMw
	jrMdpg6PyhLvFFQ8yZtLEi35BKTPxFURjqXLP3cn0IuAXyf2LBciF3mvL+IEA5T8opxyurScjrecS
	A2cnUEGDyLMyA0jzN+RXcTXanQt3RJ1P/pJtmPIsg6sR4fbi1oNQ8j7EvJ7LdcDUuJfYUIYPtzUu1
	ELEXIHd365iGNLe+pu2OYAUuuffsTTZOcggVqJIfh2HgFNZeFfWAUUwCb1ItfMbes53ffKinSBnpl
	Ye0fS8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XoL-00000001NlS-2dEU;
	Fri, 03 Apr 2026 06:15:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8XoH-00000001NkS-0kjf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 06:15:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 664B1C59F56;
	Fri,  3 Apr 2026 06:15:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68BD1603C1;
	Fri,  3 Apr 2026 06:15:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28CAE10450264;
	Fri,  3 Apr 2026 08:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775196906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2sxqu5R5Wk043JMyFgXFiDt3SNRh3XWkGz4XQz5WOSM=;
	b=sxB8E5585jew5frnLVqXXVpr/xBG7/82juZnbfFT743AWuaB9hvQwWPL67A/pTTqUWhFGT
	aFzC6ODrmTlAux5ytSvQbl8lEQ6dyl8Z7FXLkogZt34gPDd46An9c/QwKn0P0M2QRf3tw/
	a/PrszfKdlYbBXzShSv++h8KhMjUYLsV4fIPdocY/6Uuhyc36XlyCiLm93UGDCx4bilv4D
	kJ3yzpQ+l7x4rpDgZXVQlDm8MEqv/PEA4yx8Pw/RXb5tvucga0JNctndBr33q1k4ly2aIn
	PmKY2a6exIKeM/D3+h9EQYAzTUtotND/2a/sdHgcuUWC9qsHkaS+VcpOMUDudA==
Message-ID: <8f780d3f-c4ef-4976-ad0b-60718c29e06a@bootlin.com>
Date: Fri, 3 Apr 2026 08:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory
 pressure
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Baruch Siach <baruch@tkos.co.il>,
 Serge Semin <fancer.lancer@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_231513_858506_C932FE89 
X-CRM114-Status: GOOD (  21.91  )
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

Hi Russell

On 02/04/2026 19:16, Russell King (Oracle) wrote:
> On Tue, Mar 31, 2026 at 09:19:27PM -0700, Sam Edwards wrote:
>> Hi netdev,
>>
>> This is v4 of my series containing a pair of bugfixes for the stmmac driver's
>> receive pipeline. These issues occur when stmmac_rx_refill() does not (fully)
>> succeed, which happens more frequently when free memory is low.
>>
>> The first patch closes Bugzilla bug #221010 [1], where stmmac_rx() can circle
>> around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
>> a filled descriptor (due to OWN=0), and attempt to dereference the buffer.
>>
>> In testing that patch, I discovered a second issue: starvation of available RX
>> buffers causes the NIC to stop sending interrupts; if the driver stops polling,
>> it will wait indefinitely for an interrupt that will never come. (Note: the
>> first patch makes this issue more prominent -- mostly because it lets the
>> system survive long enough to exhibit it -- but doesn't *cause* it.) The second
>> patch addresses that problem as well.
>>
>> Both patches are minimal, appropriate for stable, and designated to `net`. My
>> focus is on small, obviously-correct, easy-to-explain changes: I'll follow up
>> with another patch/series (something like [2]) for `net-next` that fixes the
>> ring in a more robust way.
>>
>> The tx and zc paths seem to have similar low-memory bugs, to be addressed in
>> separate series.
> 
> I've tested this on my Jetson Xavier platform. One of the issues I've
> had is that running iperf3 results in the receive side stalling because
> it runs out of descriptors. However, despite the receive ring
> eventually being re-filled and the hardware appropriately prodded, it
> steadfastly refuses to restart, despite the descriptors having been
> updated.
> 
> What I can see is there's 40 packets in the internal FIFOs via the
> PRXQ[13:0] field of the ETH_MTLRXQxDR register.
> 
> With your patches applied:
> 
> root@tegra-ubuntu:~# iperf3 -c 192.168.248.1 -R
> Connecting to host 192.168.248.1, port 5201
> Reverse mode, remote host 192.168.248.1 is sending
> [  5] local 192.168.248.174 port 43728 connected to 192.168.248.1 port 5201
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-1.00   sec  30.3 MBytes   254 Mbits/sec
> [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec
> ...

Ah !!

I have been struggling with that problem this week too. I stumbled upon
it while trying to test your TSO series, and at firts I thought it was
because of the TSO patches, but turns out it's not, I reproduce it on
net-next.

The main problem for me is that it's not always reproducible, it may or
may not show up when I run iperf3 after a fresh restart.

This is on socfpga (dwmac1000), so it seems the problem exists across IP
versions.

I've been on and off trying to make progress on that during the week,
but without success so far...

Maxime

