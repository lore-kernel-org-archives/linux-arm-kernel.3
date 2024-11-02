Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD8E67816
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 21:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OwgWdNGQAWKqUKZWXZmeHNp5iV37VW/2g3OwmMtsnk=; b=AJq27/jPonYNTS/oFB0ehcBQiQ
	sY5kp5AG0hsiqsJgNI641a4yDe6p184AVSjCkJWJno9fjuLGjp/VUxKj+a5YORwKXHj3keM/G5Sgd
	TBaGYuE8Jsbe5LOEqeITbOuG/ehp5D+MpGGAt2Rk/xA8w0lADjrRnqbOG0hNeDpIvvIZUTub6e5iu
	Z/6sdjjnVWoLVntCVi+zmjVxDpQvVftbsc1hiPqdPq6KHFqpQ0D6nY8FQj0eMGwx0nCa01F+PfEnM
	qIDUmxVYvRS8PhsA4oZktJpMmISIZ14U/KqbOnufv/rYCcVBYR1rpPOIng37SFvzsPPCBilFoWj1I
	SDUn49+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Lwy-0000000ASnT-0Cub;
	Sat, 02 Nov 2024 21:46:28 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7LvI-0000000ASZC-3KHB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 21:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730583882;
	bh=Lu/8kzBZcinrEdsRMpHobonycBFaKkQUKqIBgEOAOog=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YRNtUsgbeXSuR+N83j0SDxH5tvMaogSfMyQ3WPAd0pjOdHFX8tQXrlutFALSolz2h
	 CHmTkNr9obUuqNG5umh/Mg63FdHkf2uVBKvCMKTYp5CO9vuKJEVSuslYcDxZvdYYWx
	 nlIg6qiGrFKDEFUkTPnm5vj8T77TP3q79P0irGaOew4T/VrY8qd5lPGxTKj92ICOnI
	 99YnuppdjAhXOYkKmsArBCttjrHFm6qMO9YWzUYYavigE+phV0zYwPi/a+LzwzEWrN
	 z+tbRwvQnjY8nZ3ANlo4sH2y/ZiHJe6ajESDpoe4G9YFeYghB05vXyCm2fPBslErNM
	 kd2lc5J4rc6Ow==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Sat, 02 Nov 2024 18:44:41 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Andre Przywara <andre.przywara@arm.com>, Yangtao Li
 <tiny.windzz@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Conor
 Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Parthiban
 <parthiban@linumiz.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/13] clk: sunxi-ng: a100: enable MMC clock
 reparenting
In-Reply-To: <20241031120857.60bc0d94@donnerap.manchester.arm.com>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-9-masterr3c0rd@epochal.quest>
 <20241031120857.60bc0d94@donnerap.manchester.arm.com>
Message-ID: <885047f813d0c55eae13f26b0bfe041d@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_144444_942999_8B303FAE 
X-CRM114-Status: GOOD (  27.38  )
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

On 2024/10/31 9:08 am, Andre Przywara wrote:
> Well, while this change indeed prevented that error message you mentioned,
> but the SD card still doesn't work for me: it probes and I can mount a
> filesystem on it, but then it hangs, for instance when running an "ls" on
> it. It could be my setup (lacking DT or device issue or missing kernel
> config), though, and the eMMC works for me this way, but it would be good
> to have that sorted. 
I'm investigating this now; it appears mmc2/eMMC is more consistent when
CLK_NO_REPARENT is set

> Also it would be good to know why CLK_SET_RATE_NO_REPARENT was put there
> in the first place: I don't see it in any other MMC clocks in sunxi-ng, so
> it wasn't just copied&pasted.
Seeing that mmc2 acts better with the flag, perhaps it was copy + pasted
from that config. Or perhaps the issues we're running into comes from
elsewhere in the chain. At the moment, that's only speculation, though;
I'm waiting on a device that has an SD card slot so I can perform more
testing myself and debug these issues.

> So was there a problem that this flag was supposed to fix? Is that
> something that only applied to older kernels (back when the MMC patches
> were first posted), and which has now been fixed/changed elsewhere?
Yangtao Li/Frank Lee assumably no longer works at Allwinner, as the email
he used to submit this originally no longer exists, but I believe the same
Yangtao is now a maintainer of the Allwinner cpufreq subsystem, and is
CC'd on these patches. I'm sending this reply to him as well; perhaps he
may have some additional insight.

> I feel a bit uneasy of just removing this just because it works(TM),
> especially if it doesn't really (SD card for me, for instance).
I agree; I was quickly preparing V2 to hopefully get this in before the
6.13 window for the sunxi tree closed, and added this in last minute after
verifying it worked on my current device, which lacks an SD card slot.

This patch can be skipped for now, as it's apparent MMC0/1 require a little
more love before we can merge it in. I'll submit new patches in the future
once this is figured out.

Thanks!
- Cody

> Cheers,
> Andre
> 
>> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
>> ---
>>  drivers/clk/sunxi-ng/ccu-sun50i-a100.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)

