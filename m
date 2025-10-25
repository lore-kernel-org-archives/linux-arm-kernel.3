Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0222FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xS9DWYbPS5RAJNziak57osAtFOJp0n29KoRjK/Vqiag=; b=ZNuqkciiJ/LylNwpB2txGpBHfN
	FGEgU9Zb2FN5j7ySO01FobC/Gz9pKy2K7RQuA8aSmFqfO7QoEGcGiZEw9tzHPVCIxR9On1t7geiGs
	B/fDeKuJdTn0KbPAL3GxI//4rkjUmET8y51zSNv9F+jjFdiyWqSIAkcum4CnN53xZ89ubpmwEsdm6
	Wy4EkARFZtxd5nnesKlmvgYgZ268FAywNHKnf2pzlQt3mCCYDbAB53mEg7LnrbuUUZOSQvvLcnTTt
	TRaA3NZbkTBV55egxU+VamR89b34+2+TSPJwEXkdpMpVoS1ISSUpD2/wwZ/XqjJVavHg81PcX+W7i
	KP07SHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCkHz-0000000Bgkb-3Q70;
	Sat, 25 Oct 2025 19:50:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCkHw-0000000Bgk8-0XmQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 19:50:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BDBE04E4120B;
	Sat, 25 Oct 2025 19:50:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 755AE60704;
	Sat, 25 Oct 2025 19:50:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E817F102F24B4;
	Sat, 25 Oct 2025 21:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761421849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xS9DWYbPS5RAJNziak57osAtFOJp0n29KoRjK/Vqiag=;
	b=dIoYniUpURM/Ww/98Jgc69HzgHGZtZ44HlfJXzhx1To69jb+uLJOEFOdZ+2KT9UHK9wlQa
	FH297d2+YdBS5/lJLw0Ai+Tn3P1EziTuLp3UVi6RIR+a05xjKvFjfaqhevpHGIViMv9+wj
	/U+f1kvAEgPFWDwF79hq2D/MCEFt+4YJCnEVGqzB+FsS/NsFGmKOlHTqbdHwZSeZiO+NHb
	kUI3/HhCZt/2P1ZtQkXseoLCs4qRayzrN2u16Ij8mOYmRKtr+CjC7RlwCH8NDKnzHHXfl2
	KyZxahDikrJ0+gGECfT+SUg6ru5El+UW4HX2zVCHeTvN+RuWJGlCbkcf7zr+lA==
Message-ID: <fa194ce6-8fca-4974-8dc7-2eb22ec50bfb@bootlin.com>
Date: Sat, 25 Oct 2025 21:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: stmmac: add stmmac_mac_irq_modify()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPn5YVeUcWo4CW3c@shell.armlinux.org.uk>
 <E1vBrtk-0000000BMYm-3CV5@rmk-PC.armlinux.org.uk>
 <20251024190159.60f897e5@kernel.org> <aPyEKGCeXwnsn4OC@shell.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <aPyEKGCeXwnsn4OC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_125056_655055_42DCEC93 
X-CRM114-Status: GOOD (  20.00  )
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

On 25/10/2025 10:02, Russell King (Oracle) wrote:
> On Fri, Oct 24, 2025 at 07:01:59PM -0700, Jakub Kicinski wrote:
>> On Thu, 23 Oct 2025 10:46:20 +0100 Russell King (Oracle) wrote:
>>> Add a function to allow interrupts to be enabled and disabled in a
>>> core independent manner.
>>
>> Sorry for a general question but I'm curious why stick to the callback
>> format this driver insists on. Looks like we could get away with
>> parameterizing the code with the register offset via the priv structure.
> 
> Not quite - some cores, it's a mask (bits need to be set to be disabled).
> Other cores, it's an enable (bits need to be set to enable). So one
> can't get away with just "this is where the register is", it would need
> three pieces of information - register offset, type of regster (mask or
> enable) and then a core specific bitmask.
> 
>> Mostly curious. Personally, I'm always annoyed having to dig thru the
>> indirections in this driver.
> 
> Me too, especially when it's not obvious what is an indirection and
> what is not.

Same here...

> There's the fun that a lot of the PTP-related indirection
> actually has no difference. For example, at the bottom of
> stmmac_hwtstamp.c, the struct stmmac_hwtimestamp initialisers have
> almost all of the methods pointing at the same implementation
> with the exeption of .get_ptptime, .timestamp_interrupt and
> .hwtstamp_correct_latency.

Well I introduced that last year. GMAC1000 and GMAC4 have what
appears to be different versions of the timestamping IP, registers
are either at a different address, or same address with a different
layout bitwise, or with just different behaviours.

There used to be a single instance of the stmmac_hwtimestamp ops,
which didn't even account for the differences between these IP
versions. TBH I don't even know why we had a stmmac_hwtimestamp
struct with a single instance back then, but I figured that using
that was a good way to at least split the gmac1000/gmac4 diffs
back then.

We coud now very much get rid of the common ops and avoid the
indirections for the TS ops that are the same between all IP blocks :)

As I'm doing quite a bit of timestamping in stmmac right now, I may
find a bit of time here and there to do that at some point :)

Maxime

> 


