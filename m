Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9261CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OArZmZCBEmYP7y3bIIzOW7qMmS8JsL1mct+2P0vjlgA=; b=12AfIu9Sa7I2VlY8Zg31ewGh40
	vWhkz0Yflzb29IdM3rAZxhW3WlcIXaYPkERDffygI/AttLKpeowQ27ucjR/HXv3QwxNXZrbzk/bnc
	QbjNdn+iSQT08UyEryER0fyCnrjkvR+VkJBnDptg/foXObBeVPlyeVnlvijeAOCMIY69XJH7nl94v
	egs9spmzWNhpclrPiCfjxmNizHGgzJpsiQdhzBw+OoV80vm4h0GhAOt5gGAhKSkIDGdXq/5FMKU4+
	iuYrA2y9K2RSeuCtGeuE9MkOqov+qXgWX7KAcaPLO/faNdjXqH32BMoZXNYb9QXRlCFlCX+mLAmcB
	I22gU2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb5B-000000092p2-18fv;
	Thu, 11 Jun 2026 08:48:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb59-000000092oV-0Xit
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:48:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45eeba68948so5523091f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781167689; x=1781772489; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OArZmZCBEmYP7y3bIIzOW7qMmS8JsL1mct+2P0vjlgA=;
        b=L81z3Rj4cWrI3YE4xV+D9NMFykAtt8qdc8w5xEUyjLSgyIo3i1KCvQ+ALBjYhm654K
         eVSW0HxQN5+JNof+n0Tj+0shY8gIyUYjlO6BxH5hJYzIRTw1eTI4JI54OYFJoNrkAAQ4
         YR0fZqcx0b4fALLG7MLHygr8YJ3cWfx7fS8s0Ru/hfRPH8WT3D+LcQq4EEqO5ktCKlJK
         uhZJQiZrv1Le3MzANjfzHShbKWFXcgPiIB6OR3A/1gKDCH28+f299GZ3qsi7sC3kpc2c
         x55hZ4ji5+gZJCttC77eDGRZDth8Xvhh3QhRUtHTS0UNxyBbu3t11K+pqNWmIODpSlQw
         9g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167689; x=1781772489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OArZmZCBEmYP7y3bIIzOW7qMmS8JsL1mct+2P0vjlgA=;
        b=BiND5CtoWUzpiQiscRNU/NuWkkGE1PkAL49vV8ZBBmAw3WeBO6qT8sGnTqK3LH4JJD
         paP65EtCHBf1ltrVKMa2NzOoVtsPauXZJh/LMbqGA6ZQc9fbllDLDhLN5CEezQygoanG
         sa43cbOnil/I4jMxhC2ER+wFpAtsQ5GsH9b5leY6mKMIOQRNx6B82w/GurF8JAD2jNda
         SCrjMqEW1tlNDRgVrYfHH8JjdS3yEL7StDBnETUdsB0UcMUE7uTpP5VxychbmN5gkNup
         xf166RAkTItpUtyqMLrLlg0Q2b0G1W7QkfivAivFi7eux+sR/mMcWulkDSY0+O2cLCpz
         ccBg==
X-Forwarded-Encrypted: i=1; AFNElJ8g2SQdw6BpY6m4QJ7n+yXGOpvjcXgND7/TLczTXhdAg28Pf+VE0H9s56ca7gdh8BsFO/zAE5KvzIbuKAn1qhTz@lists.infradead.org
X-Gm-Message-State: AOJu0YxDSZFgndBwb7A6C/D1x5DbTkNeR0Zb8ywS08RJfu0w0VK6Glvv
	Go7xTF7XYt3Yu6BBDAOSJKm3AQvOQDalHjbgPFq1O6zAqnCsaxInO5cmLStaKbMmoQA=
X-Gm-Gg: Acq92OFV0EkSX7E/WIVbZgAE8z8GXYSpuzBZNCGBQgUyy0KAnjg2eM+Bz0TjmFslOp7
	Ldpm3XHuA1D50EPThirxOz236IS/VSY7y3KM7GMRMArxxNOtAC6H4yVAKRpL7KDc0RcE4JEp7fQ
	enP8j4aBc5Yt+Dl0USnNduabJyCE3JRPNzJzeiOt62Ws0feX3qy7YzSaiFHqnfJkdLl3xFmvRlU
	msvkfliP8zM3a3ruBh3+xWEF8XpQSGJ/u+qip4LJLPavYDbn9UcVzVPZ2JD+EHBFD9M15S0ZJWK
	5HW5u/en6Mx/wepY6RNJBwbxxQ/vxO5vqOrhqmlLZtYUe94et8iSlXDeCT9DBMVG4laSrqjTyB9
	ORJFkmuluv7/55AkxllTXM4ai+hyx+Dk3P3GuJQivhN36KtkcO4XYSZGEf7wJS/nNgl8TRRwctK
	/UtZhZG5KxHuDhEMltwxZQfeHj4AwM+LnysYfws50hVg9m4w==
X-Received: by 2002:a5d:5989:0:b0:460:1f32:628d with SMTP id ffacd0b85a97d-46067598f37mr2701664f8f.11.1781167689135;
        Thu, 11 Jun 2026 01:48:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm80809393f8f.3.2026.06.11.01.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:48:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:47:58 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
Subject: Re: [PATCH 0/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Message-ID: <aip2Pnmi-LJPKwW7@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
 <87se6t8q3s.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se6t8q3s.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014811_193991_00BEC7E4 
X-CRM114-Status: GOOD (  30.01  )
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

On Thu, Jun 11, 2026 at 08:59:19AM +0100, Marc Zyngier wrote:
> On Wed, 10 Jun 2026 18:53:09 +0100,
> Stephan Gerhold <stephan.gerhold@linaro.org> wrote:
> > 
> > Jack reported a regression for some single-core Qualcomm platforms (e.g.
> > MDM9625, MDM9607) that no longer boot because no timers can be found during
> > early boot [1].
> 
> Again, this is *not* a regression. These machines were *never*
> supported upstream.
> 

Sorry, I'll reword this next time. MDM9607 does have all required
drivers and compatibles upstream already and is just missing the actual
DT so it does feel somewhat supported to me, but I'm fine treating this
as a feature extension without stable backporting etc.

> > These platforms rely on an obscure timer setup where the
> > global Arm MMIO timer (arm,armv7-timer-mem) is used as the only available
> > timer for the CPU. This setup used to work fine until commit 0f67b56d84b4
> > ("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
> > driver") when the early timer initialization using TIMER_OF_DECLARE() was
> > removed when moving to the standalone MMIO driver.
> > 
> > There doesn't seem to be any other usable CPU timer on those platforms, so
> > this series restores the early timer support using TIMER_OF_DECLARE()
> > inside the new standalone arm_arch_timer_mmio driver. This is pretty ugly,
> > but I could not think of a better solution so far. I tried to keep the
> > ugliness for the two probe paths as limited as possible. :-)
> > 
> > If someone has a better idea how to solve this, I would be happy to try it.
> 
> I would suggest finding out what is the latest point in the init
> sequence where the timer can be probed without preventing boot.
> 

It doesn't get far without having any timer:

[    0.000000] timer_probe: no matching timers found
[    0.000000] entering initcall level: console
[    0.000000] calling  con_init+0x0/0x354 @ 0
[    0.000000] Console: colour dummy device 80x30
[    0.000000] initcall con_init+0x0/0x354 returned 0 after 0 usecs
[    0.000000] sched_clock: 32 bits at 300 Hz, resolution 3333333ns, wraps every 7158278824300949ns
[    0.000000] Calibrating delay loop... 
<board hangs>

If you look at start_kernel() in init/main.c it's basically time_init()
that would normally probe the TIMER_OF_DECLARE() timers and
calibrate_delay() that needs some timer to finish. There is also
random_init() that comes directly after time_init(), which already wants
to have access to timestamp counters. I don't see any other suitable
place to hook into. :-/

I also don't see any other timer we could use, at least for MDM9625.
It's a single-core Cortex-A5 and the downstream kernel defines only the
arm,armv7-timer-mem, which seems to be used for everything... (The
situation for MDM9607 is a bit different, but not any less messy,
unfortunately.)

Thanks,
Stephan

