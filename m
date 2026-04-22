Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88892F9B5E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EMnjefoZVtE6qyXWNiSeQYJ6N4rmREqzBA+4f1h/1g=; b=n59DJw2rgPS8gPVLL6YD9vkVDw
	kgWvDrgZOukZaYJ77k8MkBq03gzXChnStyUkzyAyDmrRs33KNegAJDRta34lqKcY4SY/Svom2S5LO
	/ty8nc5N9dkZ5JNwBrrdipLgy2aDOj2mfv4FhNwz6/X+VxDxNobl6XLK8/GKUc8U8zMm+of1BwgBT
	jnk/fOtgWmNv4YTeEPl5d/H/LiB5WkYin0X3lT6GehhulXy5XLB0sl1f3Z4IsE3l9t8rRxPIlUr4W
	W4cstiyoHA9tH37QgQGxybq4SUm68u8yrBWozvzhuIPy9h+4fjOstTmFdJrqnASxc0frlaqWzo8oo
	89ZZeayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT11-00000009mXc-1qhv;
	Wed, 22 Apr 2026 08:32:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT0y-00000009mWz-1fKs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:32:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso55526345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 01:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776846774; x=1777451574; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EMnjefoZVtE6qyXWNiSeQYJ6N4rmREqzBA+4f1h/1g=;
        b=AI8z9Ohqt2vhz4oWLPkTgqP3VU1b0x9i+KMwsKG86mdL5tCJM47PN4446W4NLUXcDj
         xOAyaGiwp+LniP7epaVTwls6oOu0gJVSsGaxdramlMi49TXeHxN5Zu720sZP7I9gSHlK
         fMUtiLOm3p4PD+yir2ZJidOkM6HTz3CiO06t0hAaX1QvUl0fS/NTRiKWf0iEDny/hPUp
         Cj9FIfPpWZCMPqjmEGcWvzOPEiCEgVF6++KLeCrVM7FqV6mlGL1xcYpCw0raB4costxx
         MFTVLVIwwH9OV9cpRrnBpl87nvopz+sx0t0Hq7aLUICgq9IrH+KbPqZGQwOjIFUDfzm/
         kpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846774; x=1777451574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1EMnjefoZVtE6qyXWNiSeQYJ6N4rmREqzBA+4f1h/1g=;
        b=qxAeMhvo6/4GZHAa6yrQW48baq/gV89vcgxyRjCZZmn56ypMpqAKGagFI/5udOZDVN
         SQ3sdleQPCdJ57mAE2AOKnKCt0Io+WBlM9r/a+wAFd1QaRo5jh8igpnycyIGsWkyMd4M
         ItBnJ4ikGYn8k8icxAfz06GRyq3aXNyQ0eX3Hf5xBCDJGvwRWQuIkIsFe3sDJnx+ee7n
         oZ5fMP5N6Sfo6RB8nDY+B4Cvqg6SVmRa3s0QurPpDmE8kO1AnrRb/MpRFCW0DHLJ4Yjz
         96jZNtY8s3OAFUAxovBI8B4G+qkV9XR7MhfJuCJg4/EznyyC7ElTR3ugTYW84MMiO5N/
         xEzg==
X-Forwarded-Encrypted: i=1; AFNElJ8yHR0+dd8l8ODnKW1LHo7joq5fyOMY4hDLwL1TBbSv/cCUWXpGwpVLmEl7AHVoF7HTS5mPkdSPJWpbSp4z/9ay@lists.infradead.org
X-Gm-Message-State: AOJu0YwantJLTdFbcBMqiB9AuaRvYFe7CHYKNObc2wrGyDAfT7MGLPeJ
	208wSaiq3Dti3hAcQ4SKy/TXGaMgjnNKQJnEIN4/nX/O2rrGITra7UzMJFMv99+gM94=
X-Gm-Gg: AeBDiesBT8VH3wbI1s6jeJCpc4+SrzLwLo4ARGsph+qDSwQKHHla3vL/G4fUvVyj9Vq
	MNwZrR+hJF6Le4SBgdVvX37kG0c1TO4GnGzaUKDGXMSWt5EtV28zvVdddUGJsRojUGXyhg+A5Rj
	Kxbri79T+IThCWjlzrXNbI8PBiTCo62Kr/DnO1H2gy+HP+7MuXQxxiBs9qIa9iO7ymC6oMrdYbH
	T2uGJMCNzGia6EtSKM+C6vZHjmy+PZql+e0faZKQPx7Az5rSwVSMJUC6jTMnSjUZh82fyOfdK3d
	aX+yooAPZjx+NSwXyCPXDPHRjJO/BDo97SDA5ZqEMOE5Mj1VoPBNlSPf41qxBZXJKgtImkXMkEq
	lQFGP65sD/VCBHYgac85LLsUfegKHdo8IL9LCX+kPh2WbGuW50v361AfZvmuCPa55dswe3CteVY
	gCCcU5TckTFc0Zaq5wV1hblnDXnFmA2/G2WDSbopbdB3fmHnkm36cOf13BjaRdt5hr+9ZrcBO/R
	1Di1ZA=
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48a534af0ffmr110795305e9.1.1776846773750;
        Wed, 22 Apr 2026 01:32:53 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7b2634sm135796275e9.28.2026.04.22.01.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:32:53 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 22 Apr 2026 10:36:04 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aeiIdLL48Wn_svGZ@apocalypse>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
 <aeC6U7D6TfWm8JPx@apocalypse>
 <aeDmk-t5Lc1zpkg9@monoceros>
 <aeH373a_xmr6fnAy@apocalypse>
 <aeIGxfQ7AoIVR5n6@monoceros>
 <aeZUAaQkHGqBL8st@apocalypse>
 <aeeMp1XBDxSZ1qrl@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeeMp1XBDxSZ1qrl@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_013256_464786_28E48854 
X-CRM114-Status: GOOD (  43.06  )
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

Hi Uwe,

On 16:50 Tue 21 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Mon, Apr 20, 2026 at 06:27:45PM +0200, Andrea della Porta wrote:
> > On 12:50 Fri 17 Apr     , Uwe Kleine-König wrote:
> > > What happens if sync is asserted while a disabled channel didn't
> > > complete the last period yet?
> > 
> > The output stops immediately without waiting for the current period to finish.
> 
> This is a good info for the Limitations block.

Yup, already added, plus a couple other edge cases.
 
> 
> > > Maybe it's worth to test the following procedure for updating duty and
> > > period:
> > > 
> > > 	disable channel
> > > 	configure duty
> > > 	configure period
> > > 	enable
> > > 	set update flag
> > > 
> > > Assumint disable is delayed until the end of the currently running
> > > period, the effect of this procedure might be that no glitch happens if
> > > the update flag is asserted before the currently running period ends and
> > > the anormality is reduced to a longer inactive state if the updates are
> > > not that lucky (in contrast to more severe glitches).
> > 
> > The disable isn't delayed as explained above. Setting just the new period/duty
> > (which do not depend on the sync bit) correctly waits for the end of the current
> > period without noticeable glitches (tested with a scope).
> 
> So if you happen to change both and one is done before the end of the
> current period and the other shortly afterwards (which might happen as
> those are configured in two different registers and the update trigger
> isn't used), you get a mixed output for one cycle, right? If yes, please
> also mention that in the Limitations paragraph.

Confirmed, tested with the scope and a very long period time.

> 
> > > > Let's say that teh user want 10 tick period, we have to use
> > > > 9 instead to account for the extra tick at the end, so that the complete period
> > > > contains that extra tick?
> > > 
> > > I would describe that a bit differently, but in general: yes.
> > > 
> > > The more straight forward description is that setting
> > > 
> > > 	RP1_PWM_RANGE(pwm->hwpwm) := x
> > > 
> > > results in a period of x + 1 ticks.
> > 
> > Exactly. So whatever the user request I have to subtract one from the value
> > to be written to the RANGE register.
> 
> Unless the calculation is already rounded to 0, in that case don't
> subtract 1 and let the tohw callback return 1.

Sure.

> 
> > > > This also means that if we ask for 100% duty cycle, the output waveform will
> > > > have the high part of the signal lasting one tick less than expected.a I guess
> > > > this is the accepted compromise.
> > > 
> > > I assume you considered something like:
> > > 
> > > 	RP1_PWM_RANGE(pwm->hwpwm) := 17
> > > 	RP1_PWM_DUTY(pwm->hwpwm) := 18
> > > 
> > > to get a 100% relative duty?
> > 
> > Ah right! It's working fine and I've got 100% duty. So at hw register level
> > the duty can be greater that the period.
> 
> In that case please make sure to not use the maximal value for
> RP1_PWM_RANGE(pwm->hwpwm) to ensure that for each (possible) period
> length a 100% relative duty cycle can be configured.

Ack.

> 
> > > My (not so well articulated) point is: Please be stringent about clock
> > > handling to not bank up technical dept more than necessary and such that
> > > the driver can be made unbindable if and when syscons grow
> > > that feature. Optionally wail at the syscon guys :-)
> > 
> > Hmmm not sure I've understood your point: is it a requirement that the driver
> > must be unbindable? In this case I should avoid registering the syscon. Or
> > should I just provide a .remove callback in case there will be a way to
> > unregister the syscon (even if this callback will not be called as of now)?
> 
> It's a requirement to properly manage the resources you allocate. If a
> driver isn't unbindable due to restrictions of other subsystems that's
> unfortunate and I don't like it, but I wouldn't block a patch because of
> that.

I totally agree, of course. From a practical perspective I take it as "even
if it's not ideal, you don't need to do further coding action on that side".

Many thanks,
Andrea
 

> 
> Best regards
> Uwe



