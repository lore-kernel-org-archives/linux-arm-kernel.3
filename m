Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643C5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PR93AUCuHx4BvFFne4zA1X1VhGPQ7Re4xvHDc2Jr1Is=; b=yPDwrCV4XRa5fMq9Ta1UXu8IQ8
	A9CBl67wZR6VRmbzx2qi0i+oCq73pFWfxBYT5QVLCKL6IY6byVhTYKzouCBuUobn282LXTlee9zIk
	PUcJkC7YOdIcsTA4Fv+pRlXXoPKCmVjwjSa/rwKa/hRNNSr9ncEkNFLOONvRuBLsPEI7nzrYxUGhC
	ata8kL+sNzyHAnmDhKOtp9OZ9N9nkRrlciPR6Kl7DRIzqOA4ZtmzZKT8mSgVwCcJebxsmpzLI5XZS
	yXM3ai4KQhkYGCGJRVF2MBsDLJ8S97NA4j0uCFJcwCkVwoP9D3VA6g5YH9VsM35zxiaSez523p4+A
	w1tWBfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDph-0000000F3Qp-2LIY;
	Mon, 29 Jun 2026 15:23:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDpf-0000000F3Pt-3kDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 15:23:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-46cbe01d4b6so2029807f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782746613; x=1783351413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PR93AUCuHx4BvFFne4zA1X1VhGPQ7Re4xvHDc2Jr1Is=;
        b=hmoHVtHwuj1rOOyxdULUFiaxZDZyLbGmHOsBc+8PthNDjJ8Ulq/u3Zg27mV8xdo85g
         QcCrt4LnXG59GpUUTI107u0zG8jOP7S0479CTL8O8AoyQe5ZlwR+7/+VZ6jkZDb1cwoc
         yCUFLMyrcph3vO8Fg5TRXxfrVtW8OOdz3IfKcpW5746PoaK2LBs8nDL6AtuTgpOsyDSc
         7wgNtdvmsjSchPIqFzx+26biJMor/SbGADH+GGt6SECmCJf6awlhqQHsCEZJ6J3QW+kY
         Wla/R7cukrqBh1hVDTG1SnqSVZ/ud4gF6BqhgAV0CawBCqat9eV7aLg+1fgpPQCGX5bM
         B0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782746613; x=1783351413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PR93AUCuHx4BvFFne4zA1X1VhGPQ7Re4xvHDc2Jr1Is=;
        b=hS1hGLsua8isYAtG8lt0tLfEu7cyZhw0qQdYKCpBOx4eQ+AW+p4Qe2ZTdvMb4kAUr4
         6LHewZfcpWrWje8gftolLwxYr2DMrCQwqnZ/xq4Zihsnb0VqWkVqGtA/vWvA+mv8wG9k
         5vaLj7Ugj3mVnZMMT6JaU7DKeBC4i9HGYDCn44dqNnlLPvGpniqoKVd5PqHY7rqoxVkR
         82pPWvrLg4EL0EX0UTM4pRoeNo6It7HR8wzz7+Dho+S+4JhnxT6MJI9y4otwTNh0HoAM
         vTpuSvsJTqFI+GTBwe26U0p/vfsbwofpgnQQFBx9P4t0L0wfRVEzTIdQ5svUi7WybFqj
         sXkg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/M4K6i02ZLzlMT+Ir9S9UvefbfumBReYCO4H5CvS9vx9PXq/SEwGWhbQjeBPGUBXERgcPKPZ+qYmT3pjzDJB+@lists.infradead.org
X-Gm-Message-State: AOJu0YyLp0zhZqsguNmkb3v0cumFCaqEicl0byeN4wVmVdSZFYug12wM
	8DJzkWrVTybb/58o8YjS/BCOqcRaaVhXD8MzKalEnu7TuMoHlVM75TX6igoXGA5Ow9Q=
X-Gm-Gg: AfdE7cm6s+f+67lFwlbpuvrVs3KwLmYGaMUyXXSzhbL2r/beGSYFsywk7xIXhoQ+v0b
	yV3IyChdSa/03tFx6srOi91h2UJw+iykZOIfuSBXNPNw/wJd7iwAUxlhs6u/ZPka3cSpFAeTf/k
	1S64BJKqivYV6n/A5BeaIosNhUJ1AgpYG7fIH5FUn3AbMWltecrNoe+KpMoAnSAcM9v1d2gzgzz
	YKDo3YUZJ0mPfz2MEjdRbRG1sdsvyxsj+fxWAfzwrLq0PkCKnUszCzX9dKy0EUTzU7v/0NRRxWi
	7xJ0iJ36Ua9mjXIUAX3xp2NeollL37iVSScFf++c88SzxARBnzVRaZw6ya+YWf1Dy8VGBmgx3As
	TfaJXQfVagg1QJnh/AX/1b0pJWraZ5sLcV+GkRYIM/7LWgsr6HyQJqqDgxow4n1Oikyw6TQkehL
	+Ttlnu7afCAp9QQlF1dAKSd2o=
X-Received: by 2002:adf:ff89:0:b0:473:1706:7f01 with SMTP id ffacd0b85a97d-475017f6871mr1213528f8f.43.1782746613293;
        Mon, 29 Jun 2026 08:23:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:5f1:38dc:c145:9ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee018e8sm56854684f8f.11.2026.06.29.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:23:32 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:23:28 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Message-ID: <akKN8EKAOT7GTzdV@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
 <87se6t8q3s.wl-maz@kernel.org>
 <aip2Pnmi-LJPKwW7@linaro.org>
 <87qzmd89ih.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzmd89ih.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_082336_010995_F7BB4D76 
X-CRM114-Status: GOOD (  62.24  )
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

On Thu, Jun 11, 2026 at 02:57:42PM +0100, Marc Zyngier wrote:
> On Thu, 11 Jun 2026 09:47:58 +0100,
> Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > 
> > On Thu, Jun 11, 2026 at 08:59:19AM +0100, Marc Zyngier wrote:
> > > On Wed, 10 Jun 2026 18:53:09 +0100,
> > > Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > > > 
> > > > Jack reported a regression for some single-core Qualcomm platforms (e.g.
> > > > MDM9625, MDM9607) that no longer boot because no timers can be found during
> > > > early boot [1].
> > > 
> > > Again, this is *not* a regression. These machines were *never*
> > > supported upstream.
> > > 
> > 
> > Sorry, I'll reword this next time. MDM9607 does have all required
> > drivers and compatibles upstream already and is just missing the actual
> > DT so it does feel somewhat supported to me, but I'm fine treating this
> > as a feature extension without stable backporting etc.
> 
> "Supported" has a different definition for me. Cortex-A5 without the
> A9-style TWD was so far never seen in the wild. The Generic MMIO timer
> was introduced way after Cortex-A5 shipped, and was designed to work
> with the CPU timers, making this QCOM contraption a franken-hack.
> 
> So calling this supported is very much pushing the boundaries of what
> was supposed to be put together.
> 

Got it.

> >
> > > > These platforms rely on an obscure timer setup where the
> > > > global Arm MMIO timer (arm,armv7-timer-mem) is used as the only available
> > > > timer for the CPU. This setup used to work fine until commit 0f67b56d84b4
> > > > ("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
> > > > driver") when the early timer initialization using TIMER_OF_DECLARE() was
> > > > removed when moving to the standalone MMIO driver.
> > > > 
> > > > There doesn't seem to be any other usable CPU timer on those platforms, so
> > > > this series restores the early timer support using TIMER_OF_DECLARE()
> > > > inside the new standalone arm_arch_timer_mmio driver. This is pretty ugly,
> > > > but I could not think of a better solution so far. I tried to keep the
> > > > ugliness for the two probe paths as limited as possible. :-)
> > > > 
> > > > If someone has a better idea how to solve this, I would be happy to try it.
> > > 
> > > I would suggest finding out what is the latest point in the init
> > > sequence where the timer can be probed without preventing boot.
> > > 
> > 
> > It doesn't get far without having any timer:
> > 
> > [    0.000000] timer_probe: no matching timers found
> > [    0.000000] entering initcall level: console
> > [    0.000000] calling  con_init+0x0/0x354 @ 0
> > [    0.000000] Console: colour dummy device 80x30
> > [    0.000000] initcall con_init+0x0/0x354 returned 0 after 0 usecs
> > [    0.000000] sched_clock: 32 bits at 300 Hz, resolution 3333333ns, wraps every 7158278824300949ns
> > [    0.000000] Calibrating delay loop... 
> > <board hangs>
> >
> 
> This is nothing that "lpj=[some value]" on the command line can't help
> getting past.
> 
> > If you look at start_kernel() in init/main.c it's basically time_init()
> > that would normally probe the TIMER_OF_DECLARE() timers and
> > calibrate_delay() that needs some timer to finish. There is also
> > random_init() that comes directly after time_init(), which already wants
> > to have access to timestamp counters. I don't see any other suitable
> > place to hook into. :-/
> 
> None of that should be a problem. I can boot a hacked arm64 kernel
> without any timer all the way to the point where it is waiting for a
> tick to enter the scheduler and run userspace. There's no reason why
> 32bit can't do something similar. Heck, 32bit doesn't even have a
> standard timer to rely on, so that's very much possible to do.
> 
> Can you at least give it a try?
> 

Thanks for the suggestion and sorry for the delay! I started testing
this, but then ran out of time before my vacation when trying to get the
CP15 timer working on the Cortex-A7.

With lpj=2658304, it proceeds until raid6_select_algo for me with my
current kernel config. I probably don't need the raid6 stuff on this
platform. Also, raid6_select_algo is subsys_initcall() so if I move
arm_arch_timer_mmio to core_initcall() instead of
builtin_platform_driver() (device_initcall()) it does indeed boot
successfully to the userspace login with the lpi= parameter. Nice!

> > 
> > I also don't see any other timer we could use, at least for MDM9625.
> > It's a single-core Cortex-A5 and the downstream kernel defines only the
> > arm,armv7-timer-mem, which seems to be used for everything... (The
> > situation for MDM9607 is a bit different, but not any less messy,
> > unfortunately.)
> 
> MDM9607 appears to be a Cortex-A7, so it *definitely* has all the
> bells and whistles that we need. The DT I found doesn't make describe
> the timer, but it is absolutely part of the CPU.
> 

The CP15 timer is indeed *definitely* there for the Cortex-A7 in
MDM9607, but it's also *definitely* not working for me ... :(

As you saw, it's not documented anywhere for MDM9607. I tried to enable
it a few years ago already, but I couldn't get it working. I tried again
and it's still unusable. The CP15 timer is certainly there and it does
tick just fine. It also signals interrupts (ISTATUS gets set).
But I can't find the interrupts in the GIC:

 - I tried some common options (PPI 13+14+11+10, 2+3+4+1), but it hangs
   in raid6_select_algo like above (no timer interrupts).

 - I created some brute force probing code that fires the timer and then
   scans literally all GIC IRQs using GICD_ISPENDR. Nothing.
   (It finds the correct PPIs on other platforms...)

 - I asked Konrad if he can find something helpful in the chip
   documentation, but apparently there is no clear mention of the CP15
   interrupts there either ....

In other words, it looks like whoever designed this hardware didn't
think it would be useful to hook up the CPU interrupt lines to the GIC.
Or something like that ... Unfortunately, this means that we probably
need the MMIO timer even for the Cortex-A7 in MDM9607. :(


Since you mentioned that we don't need a timer early, I played a bit
with using the CP15 timer only as clocksource (without interrupt). That
seems works quite well actually to bypass the delay calibration problem.
In fact, then it skips the calibration entirely and uses (presumably
more accurate?) timer-based delay loops instead:

[    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.000000] arch_timer: No interrupt available, NOT giving up
[    0.000000] arch_timer: cp15 timer running at 19.20MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000002] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.010688] Switching to timer-based delay loop, resolution 52ns
[    0.019028] Console: colour dummy device 80x30
[    0.024932] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.00 BogoMIPS (lpj=64000)
...

Still need the core_initcall() change, since it looks like that
raid6_select_algo code really wants to have some timer interrupts.

Aside from that it's just a couple of if conditions in the
arm_arch_timer driver to bypass the interrupt handling, but I imagine
you wouldn't be very happy about that kind of butchering either ...? :/

> As for the A5, if we can't get this machine to use the driver as is
> without butchering it and going 15 years back in time, then I'd rather
> hack together a minimal driver that only this contraption will make
> use of, and be done with it.

To be fair, if you look at PATCH 2/2 in this series, the actual MMIO
handling is completely unchanged. It's just some reshuffling of the
init/parsing code. The primary annoyance is probably use of pr_*()
rather than dev_*() logging and some minor manual resource management.
We could duplicate the parsing functions to avoid this reshuffling, but
the actual MMIO code would be still exactly the same. I'm not sure if
we should duplicate that.

Thanks,
Stephan

