Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC48E67819
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 02:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jvw/ZQBeWQ3+pp2+arW6SZ/WRcMC/sbq14XtrisQ4ug=; b=CUIOJtouJr47doTQAJaI9o9DQK
	uXyXT0TWOZJ+clNK1p6FtboNLm/k8HWCHRovAscu+FGR6exnyAyIFN8aOXbp2rmtkNaV35gwJwRVZ
	cOiwwRSqT+78z5LO5Qy7g5YsrTwB8VVR3+OKfBvcIQwlOP6a/sB3QdwUouthpHJnswVabZC/BNu38
	vWwYRxcOjIygBOlq9521ODxvQYffrd9x0c4R6zoCRK37N00y1CO0r00Vr3WHMrrViVv/n5IUKuEUr
	VLo7k+2CBzRQ4AXMub0zvTbN9Zd7FG7Zrrc1lpb7QC5CNn4k5NTMYwJH5lYoEuKyUkxyXtw8SZAXG
	SIkGnmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Q5V-0000000AnLc-1Lwx;
	Sun, 03 Nov 2024 02:11:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Q3o-0000000AnF1-0VpF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 02:09:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C45497;
	Sat,  2 Nov 2024 19:10:15 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E0EF3F528;
	Sat,  2 Nov 2024 19:09:43 -0700 (PDT)
Date: Sun, 3 Nov 2024 02:09:29 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Nishanth Menon <nm@ti.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Parthiban <parthiban@linumiz.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/13] clk: sunxi-ng: a100: enable MMC clock
 reparenting
Message-ID: <20241103020929.2298633f@minigeek.lan>
In-Reply-To: <885047f813d0c55eae13f26b0bfe041d@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
	<20241031070232.1793078-9-masterr3c0rd@epochal.quest>
	<20241031120857.60bc0d94@donnerap.manchester.arm.com>
	<885047f813d0c55eae13f26b0bfe041d@epochal.quest>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_190948_296511_789DCF9E 
X-CRM114-Status: GOOD (  44.29  )
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

On Sat, 02 Nov 2024 18:44:41 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

Hi Cody,

thanks for staying on this issue!

> On 2024/10/31 9:08 am, Andre Przywara wrote:
> > Well, while this change indeed prevented that error message you mentioned,
> > but the SD card still doesn't work for me: it probes and I can mount a
> > filesystem on it, but then it hangs, for instance when running an "ls" on
> > it. It could be my setup (lacking DT or device issue or missing kernel
> > config), though, and the eMMC works for me this way, but it would be good
> > to have that sorted.   
> I'm investigating this now; it appears mmc2/eMMC is more consistent when
> CLK_NO_REPARENT is set

What do you mean with "more consistent", exactly?
I still don't get why NO_REPARENT would help here in the first place:
we have three clocks as potential parents: OSC24MHz, PLL_PERIPH0,
PLL_PERIPH1. The first one is too slow for typical MMC rates, and
PERIPH1 is typically disabled (it's the same rates as PERIPH0, so
there is little need for it). So PERIPH0 is to clock to go, and I don't
see what NO_REPARENT would change here.

So those are my observations:
With NO_REPARENT (current mainline):
- SD card fails to probe:
  sunxi-mmc 4020000.mmc: fatal err update clk timeout
- SD card is still parented to PERIPH0-2x (probably because U-Boot set
  that up), but uses a divider of 256 for a clock rate of 4687500 Hz.
  This probably leads to the failures.
- eMMC works, but is parented to the 24MHz OSC, probably because U-Boot
  did not touch it. The clock rate is 12MHz, the read speed is 10MB/s.
With removing NO_REPARENT, so with this patch:
- SD cards probes, I can mount a VFAT fs on it, and sometimes "ls"
  that, but it hangs soon afterwards, for instance when trying to
  benchmark it.
- SD clock is set up correctly: parent is PLL_PERIPH0-2x, rate is 50
  MHz, correct for High Speed@4bit and its 25MB/s bus speed.
- eMMC works fine, clock parent is PLL-PERIPH0-2x, rate is 100 MHz,
  correct for HS-200 (100 MHz * 8 bit * 2(DDR)). The read speed is
  72MB/s, which sounds alright, and might be a limitation of the flash
  chip.

So NO_REPARENT is always worse for me.

> > Also it would be good to know why CLK_SET_RATE_NO_REPARENT was put there
> > in the first place: I don't see it in any other MMC clocks in sunxi-ng, so
> > it wasn't just copied&pasted.  
> Seeing that mmc2 acts better with the flag, perhaps it was copy + pasted
> from that config. Or perhaps the issues we're running into comes from
> elsewhere in the chain. At the moment, that's only speculation, though;
> I'm waiting on a device that has an SD card slot so I can perform more
> testing myself and debug these issues.
> 
> > So was there a problem that this flag was supposed to fix? Is that
> > something that only applied to older kernels (back when the MMC patches
> > were first posted), and which has now been fixed/changed elsewhere?  
> Yangtao Li/Frank Lee assumably no longer works at Allwinner, as the email
> he used to submit this originally no longer exists, but I believe the same
> Yangtao is now a maintainer of the Allwinner cpufreq subsystem, and is
> CC'd on these patches. I'm sending this reply to him as well; perhaps he
> may have some additional insight.
> 
> > I feel a bit uneasy of just removing this just because it works(TM),
> > especially if it doesn't really (SD card for me, for instance).  
> I agree; I was quickly preparing V2 to hopefully get this in before the
> 6.13 window for the sunxi tree closed, and added this in last minute after
> verifying it worked on my current device, which lacks an SD card slot.
> 
> This patch can be skipped for now, as it's apparent MMC0/1 require a little
> more love before we can merge it in. I'll submit new patches in the future
> once this is figured out.

This patch would be a fix anyway (with a Fixes: tag), so we can push it
still into 6.13, after -rc1, and it would be backported. So it's not as
critical, timing-wise.

Cheers,
Andre

> 
> Thanks!
> - Cody
> 
> > Cheers,
> > Andre
> >   
> >> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)  
> 


