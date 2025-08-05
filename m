Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FCDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odN3U5wUIKDj5D9hqrCcLp+EmyeB4OlgDk3ZQxZOpZg=; b=BZHZ6cDKdPetLovZDEDVWFfS+K
	nyFR4QtE0oF0YgHn2If9lhOOAxpzShaarYOAZrOgbR6ikpwYDymdV7tsx8+S1vJASSEhWeHwQKsEI
	N7ZJ/ko0k+AHQJ+CeivQIiTUmku8uV68pZ10/CAp+l1MRfvgZpxw03JVxu0aG0x2GgTSiH9wCybgV
	lrDV6ANONUtuJh1WOQ9KMteaMyHS5w0Ek4lxwHZU2bRuhIsF1AQwDWfpY7/mn2bxkG6V+hdVRlNN4
	dxPXdzOKIPnyWoktQZfrei292EEXkaBQv/JTW/PCJ7k4ShtDQ1o2zZ9/qc+jTJ0/phSNC5hgP0Kfw
	C1wrRV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQ7x-0000000DuVE-0FQg;
	Tue, 05 Aug 2025 22:27:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujQ5L-0000000DuNa-34TX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 22:24:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9955942E80;
	Tue,  5 Aug 2025 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754432679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odN3U5wUIKDj5D9hqrCcLp+EmyeB4OlgDk3ZQxZOpZg=;
	b=S4TKYGXUfH31hW2weWUZO71JDvk6rqhsZQxcPW8T5sNn+sod7h7caFPj0PJ2+yKvfOsCWK
	WVefcWIJG8YSSUhhFPPRY5Em6TeJl2qSc8t/CNjCoPksDBxlSDd2sBM3KjeveNTUiKxpZb
	M/rnmaMWe730LXhWhTOAYb9avHWHAVN5YotelgrhriW5aZe8O4Wab0Cf+1k/WDAHFPL+v9
	+7Q0EHtJrzIUsCxkjb48Bx23sE0sFj1LzN9mNq6FlhBqqeAl12Z+XVvb0e30wShpF6OdXt
	8icQt4CTOKKhp2Xx1EP7zbQLO0lpeots2Oq2s1TNQDNmeeOBI+u82XrkwAGCrQ==
Date: Wed, 6 Aug 2025 00:24:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lothar Rubusch <l.rubusch@gmail.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ivan Vera <ivan.vera@enclustra.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
Message-ID: <202508052224366c9bb920@mail.local>
References: <20250804154750.28249-1-l.rubusch@gmail.com>
 <20250804154750.28249-2-l.rubusch@gmail.com>
 <20250804213213d4844d4e@mail.local>
 <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudeifeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheeuieeikefhgfdvhfehiedvhffgjeetfffgtefhudfgtefffeevledtleejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepgeehrdduuddrieekrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeehrdduuddrieekrdduudegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheplhdrrhhusghushgthhesghhmrghilhdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehsrhhinhhivhgrshdrnhgvvghlihesgihilhhinhigrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehivhgrnhdrvhgvrhgrsegvnhgtlhhushhtrhgrrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_152443_907312_00073886 
X-CRM114-Status: GOOD (  43.07  )
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

On 05/08/2025 23:56:46+0200, Lothar Rubusch wrote:
> On Mon, Aug 4, 2025 at 11:32 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> > > From: Ivan Vera <ivan.vera@enclustra.com>
> (...)
> > > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > > index f39102b66eac..0c063c3fae52 100644
> > > --- a/drivers/rtc/rtc-zynqmp.c
> > > +++ b/drivers/rtc/rtc-zynqmp.c
> > > @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
> > >               if (ret)
> > >                       xrtcdev->freq = RTC_CALIB_DEF;
> > >       }
> > > -     ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
> > > -     if (!ret)
> > > -             writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
> > > +
> > > +     /* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB entry. */
> > > +     writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
> >
> > Doesn't this forcefully overwrite the proper value that has been set
> > from userspace and so trashes the time at each reboot?
> >
> Yes, it overwrites the calibration, i.e. counting 1sec in about 1sec.
> No, the time/date is not actually "trashed" (I double-checked that
> with timesyncd disabled, having and not having register content and
> over several reboots keeping a bogus date/time - it psersistet in the
> same time space. The current patch always overwrites the calib
> register content. So, a manual userspace setting will be lost after
> reboot. That's true.

It is about 1sec on your platform because it didn't deviate too much
from the expected value but what if another platform needs a way
different value? Then you are introducing the same issue as the one you
are trying to fix but it will have it at each reboot.

> 
> Would it rather make sense to extend it, say, instead of merely
> checking whether the calibration register contains any data - which
> could potentially be incorrect - also check for the presence of a
> calibration property in the devicetree (or a similar property, since
> 'calibration' may be deprecated)? If such a property exists, perform a
> re-calibration based on the devicetree at every reboot. Otherwise,
> retain the current behavior of checking whether the register is empty?
> 
> > Isn't the proper way to reset it to simply set the offset from userspace
> > again?
> >
> Hm.. I'm unsure if I understood you correctly. You mean the way as
> described in AMD's link to perform the reset by executing the devmem
> from Linux manually? If so, why is it preferable to adjust the RTC
> calibration manually every time this happens, rather than to simply
> put a correction value into the devicetree properties for problematic
> setups? Or do I miss something, is there a config file for RTC
> calibration for doing this persistently from Linux, that I'm not aware
> of?
> 
> Before, the devicetree properties seemed to have generally priority
> over userspace settings. Now, after the calibration rework, this
> priorization seems to have changed and a devicetree calib correction
> for such problematic cases will generally be ignored, with a
> recommendation by Xilinx/AMD (see link in cover letter) to execute a
> devmem command from off Linux (...). I mean, can't this be elaborated
> a bit more to allow for a persistent correction method?

The value depends on each manufactured machine/board as it is supposed
to correct for imprecision on the input clock which is either a crystal
or derived from a crystal. This crystal may be more or less accurate and
its accuracy will change over time notably because of temperature
changes or simply because it is aging. Having the value in the device
tree is as good as having it hardcoded in the driver which is not far
from what your are doing here. It makes the feature useless.

What I was suggesting is simply to do the right thing, compute the
inaccuracy and correct it from userspace, using the proper interface
that is sysfs or the RTC_PARAM_SET ioctl for RTC_PARAM_CORRECTION
This has to be done regularly anyway so I guess it would catch and
correct any corrupted value in the register.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

