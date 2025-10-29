Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B05CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 06:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+KTjI1TM7mg6rcCTezA/+UdyBmDty2R5itDbwstprQ=; b=eUtXcg+DykQBB7IOtSc81SAwOQ
	ubXFtGtlQ1zjfs9UvKPIhOHY3L8JeJo2tck+oKpX5xyVI+AWngGUKpZPR3PLbHath4fdTk9p8JZ5S
	rILk42Zq/0MT9U84lRt91bXIhiUfCwexy4zJN9kCceW83zZ+aCRtWUfypikUUTjNH4YBfPdy3YycI
	zmr6h+8IfEoaFVANbCSWR4v+KLGgPPkz/NHlfcKkMx0409/3Z5fjGZzUvamE+gADLTk7Xvd3UQL0U
	g+aPe+RMbMpyy2j3hWF+/5G5AIG00vBUkWTNhcn/X72GjlRn6aB8d+eTQTghXnVM1zV8nDAaT8MyN
	yLs+olaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE09c-0000000HaLQ-1qFT;
	Wed, 29 Oct 2025 06:59:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE09Y-0000000HaJq-2a0Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 06:59:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EFDE11A1722;
	Wed, 29 Oct 2025 06:59:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0F63606E8;
	Wed, 29 Oct 2025 06:59:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D513F103115AD;
	Wed, 29 Oct 2025 07:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761721162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=F+KTjI1TM7mg6rcCTezA/+UdyBmDty2R5itDbwstprQ=;
	b=o/f2BvsK1UFERMGggVndtxtQP6Off6yNARbRDm45ax8eVzx6q68dtBRTepmeXOju2Zrq3a
	jaH+noqfpaC8Gu9aTjShhjImZRq0X0lMCzzDXyVJkOV7o4wSw+RMjBH+bXzHKaF9tkTROV
	xfMczXjE0dkfTw6GY31uyOk+FWRoY+ASP+3TunTC9hMPsZKyBfeTrlkyznVPrxgBCea9mQ
	2Xi6esdXpqoG2p1KkVm/nKFR0lzaKIy8qT0jhpGlqno5jw0YDmn+UgDngAdIfvQmhRa5BL
	6T0m1GLtxuLgtVRF0l+z7bz9fdL2atrz2GKf0Q2UD7zXVuJDHwzF8H2BIqxAaw==
Message-ID: <71310577-7cea-42ce-8442-49e09e0b958a@bootlin.com>
Date: Wed, 29 Oct 2025 07:59:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Add a devlink attribute to
 control timestamping mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251024070720.71174-1-maxime.chevallier@bootlin.com>
 <20251024070720.71174-3-maxime.chevallier@bootlin.com>
 <20251028151925.12784dca@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251028151925.12784dca@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_235929_020042_9FD706BF 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Jakub,

On 28/10/2025 23:19, Jakub Kicinski wrote:
> Sorry didn't get to review this in time.
> 
> On Fri, 24 Oct 2025 09:07:18 +0200 Maxime Chevallier wrote:
>> +   * - ``ts_coarse``
> 
> This is not a great name IMHO. Is "coarse" from the PRM?

Yes, it uses "fine/coarse"

> It's the increment that's coarse, right? Not the timestamp
> This naming confuses me greatly.

That is true, the ts_ was added as this configuration is done based
on the timestamping control registers, and is refered to as
"timestamping control fine update" in the register defs :(

So you are correct that in the end the clock frequency is coarsely
adjusted.

The patch was applied, should we revert or add another patch to rename
that parameter ?

> 
>> +     - Boolean
>> +     - runtime
>> +     - Enable the Coarse timestamping mode. In Coarse mode, the ptp clock is
>> +       expected to be updated through an external PPS input, but the subsecond
> 
> I guess the definition of "PPS input" got diluted but technically it
> means Pulse Per Second, right? Here IIUC we need an actual 50MHz clock
> fed in?

For GM, yes indeed. I can update the doc accordingly.

> 
>> +       increment used for timestamping is set to 1/ptp_clock_rate. In Fine mode
>> +       (i.e. Coarse mode == false), the ptp clock frequency is adjusted more
>> +       frequently, but the subsecond increment is set to 2/ptp_clock_rate.
>> +       Coarse mode is suitable for PTP Grand Master operation. If unsure, leave
>> +       the parameter to False.
> 
> My understanding based on your previous explanation is that basically
> in one of the modes the frequency cannot be adjusted. It's only usable
> if a very stable reference clock is fed into the device (or otherwise
> we "trust" the clock that's fed in). So that's why Grand Master.
> 
> In the other mode we can tweak the frequency more accurately.
> But it comes at a cost of the HW time incrementing 2x larger step.
> 
> If that's the case I think we should update the documentation and
> rename the knob to indicate that it's the frequency adjustment that's
> coarse.

That's fine by me, just let me know abut the exact process, I can followup
on that :)

Maxime

