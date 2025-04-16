Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4112FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VGTw2OCtCwNoikhMS1xSw/P9HzEaDz2YmQHVZNP6Cw=; b=ccdD+Stou2Ax3OC7y9nAOun79B
	wBoULcW/9Y+KuKE9uM0/ZQuRt69p7mJhQK9kMo0KigA5PbkFwf3RDlM3ONw3V8bGDtZq1aotQ20Gn
	jQiznluDvbcphYYuUsOj1DQo/8T21/aBrfOTESqJkxonTwGVA/GhRQOAVFxZq+QQvuN7+M0z2k09R
	CT9KUKI1lg9yRNW87ROsEMNnOcePJD31e0RTURPzncGRS8gv18FDnwoEK3wu7/fnJ6j0vpJUTpyES
	o9rDbgDKRG2NnVVzN8l8QDCxwlgn3p3oIBvirGR2LI2TpzU3RXb6iyey/no3UP0IJc+Rb7XRrYKCS
	jQjcOIXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u544o-00000009xQw-2FCy;
	Wed, 16 Apr 2025 14:49:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u535e-00000009i6G-2MSu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 13:46:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39d83782ef6so530980f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744811169; x=1745415969; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/VGTw2OCtCwNoikhMS1xSw/P9HzEaDz2YmQHVZNP6Cw=;
        b=r9CVmpIqoGqmJkQVQcu+22VIZqHzi4qnnVAy1LUEaYc/LE/q13K/onNcL0gL/JgZI+
         m3AODXLaHntT5QZzC47mrtvQnQeBRUgushEfVG0ZE3sUCPp2fQb7MeXM2l5zV3bx9zDl
         Fbm+Pk+w2yAxOINW/RFG5WztxWATC7zZCwibUBfAWat4yJx9PGxHyqBVC3AlrztTAJUT
         OAi5D+hIwHZoRMGxsM9VYByHKfVdktSe4wLpyUBhbU7I/pZ/ISmWVj5XwHMhdST+7A1k
         j/pt867yEcmemZ9MzrqIcYrOiUVOcJ5VkZb4GdHJQbUF6j9pvvkdtitxQNUJ9VFAqisA
         9f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811169; x=1745415969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VGTw2OCtCwNoikhMS1xSw/P9HzEaDz2YmQHVZNP6Cw=;
        b=IRSr7IjQ7hLzsqiMDZimx765Mwovzsfwst62/CCLl65lMQ5rErsDVNFtt69nbJ2MeB
         IUwrG4g2URyXNIkVpOMf51WqChbl0r+lbPY3hoaifVI8NVXnbDPvoVCw9xVtWZ3Refu8
         qJSwtR5EjLmFjHeLNfMIa74120jhj5otTWzRyDl2OSFmvNf+/MDtru4BuKYUS7wnktT0
         zKfKSmirMyRCE2curdMPTwTfAbbc3hPl7yCs98batV2qEa+e+FUqvGi4cvfGF7noxCF2
         bVkdkBqyTIkIOt+zFmY4kNH9fMDXW6p5sBqmxZzPJOCfDEv+9N+S7MB7jMlOhsCxpme7
         kHaA==
X-Forwarded-Encrypted: i=1; AJvYcCVQfr2I86jjnI9GP48s2Lc9K/RXImT7tMiHl/Aajuce0iwL2KbLZp+YAjDIqhOSHIepYjUfXl++RrGaZ8ltgvhh@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3yrwxIpz8vDLHTL68nXdwMyqubs2nkB2cmLystGgEROjuA2m
	kxOjkYb/aZXJhkBaYtcggiYRhXPi8zM4dosQT9Ycd4jbJOk02AIKwOy8zY4beqc=
X-Gm-Gg: ASbGncsDt/BK/cNctuTykrgvE3kfNwhE2xoy3A0WvfJ+IyS5QhI7VdwkwqMrTwgycZF
	8UqkPoou8kVOHXSAqYnKTHURMu79gLDo0PA1PHGbHFFiYn5QEdxnwvHL8Xwsf0Yc3WkkCTsYHs6
	TpMgdBWnGWAJCxCkQQfKXFdWYue8DplgjuVccI3XG96fwJwb9up0OtmzPnOB5o85ahRnJBjUOFY
	JTENthHua8Lzr8D4S50S7PVdJWAKkhtcNw1qS174LDj3hnsKlg1HZoM0votjxI/ZrwWhArh/stY
	a119RFxgydz+ZzeAh5bAFCy9IoDXwlDnCYDulssW2gMea13Ay0HabW33bbe4xNovFBwLf5Xe2MP
	FKQQ=
X-Google-Smtp-Source: AGHT+IE4YAl2mZjXep57P1NBcGIHNuPRNP7vshUejNnQtQU0uCb6wkLBjcmMTW/advV5IiWmlcYETQ==
X-Received: by 2002:a05:6000:2901:b0:39c:30f7:b6ad with SMTP id ffacd0b85a97d-39ee5ee2546mr1463106f8f.18.1744811168641;
        Wed, 16 Apr 2025 06:46:08 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44579bsm16937709f8f.87.2025.04.16.06.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:46:08 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:46:05 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: John Stultz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z_-0nX3Z-DLPjL_j@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_064610_613463_870C25D9 
X-CRM114-Status: GOOD (  49.85  )
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

On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > >
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> >
> > From a previous thread where there is no answer:
> >
> > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> >
> > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > a module for the reasons explained in the aforementionned thread.
> 
> I wasn't CC'ed on that, but to address a few of your points:
> 
> > I have some concerns about this kind of changes:
> >
> >   * the core code may not be prepared for that, so loading / unloading
> > the modules with active timers may result into some issues
> 
> That's a fair concern, but permanent modules (which are loaded but not
> unloaded) shouldn't suffer this issue. I recognize having modules be
> fully unloadable is generally cleaner and preferred, but I also see
> the benefit of allowing permanent modules to be one-way loaded so a
> generic/distro kernel shared between lots of different platforms
> doesn't need to be bloated with drivers that aren't used everywhere.
> Obviously any single driver doesn't make a huge difference, but all
> the small drivers together does add up.

Yes, I agree.

So the whole clockevent / clocksource drivers policy would have to be making
impossible to unload a module once it is loaded.

Do you have any ideas how to ensure that the converted drivers follow this
rule without putting more burden on the maintainer?

> >  * it may end up with some interactions with cpuidle at boot time and
> > the broadcast timer
> 
> Do you have more details as to your concerns here? I know there can be
> cases of issues if the built in clockevent drivers are problematic and
> the working ones don't load until later, you can have races where if
> the system goes into idle before the module loads it could stall out
> (there was a recent issue with an older iMac TSC halting in idle and
> it not reliably getting disqualified before it got stuck in idle). 

Yes, that is that kind of issue I suspect.

> In
> those cases I could imagine folks reasonably arguing for including the
> working clock as a built in, but I'm not sure I'd say forcing
> everything to be built in is the better approach.

When the first driver converted as a module will be accepted, I'm pretty sure
there will be a wave of patches to convert more drivers into modules. 

What tool / use cases / tests can we put in place to ensure it is not breaking
the existing platforms for the different configurations?

> > * the timekeeping may do jump in the past [if and] when switching the
> > clocksource
> 
> ? It shouldn't. We've had tests in kselftest that switch between
> clocksources checking for inconsistencies for awhile, so if such a
> jump occurred it would be considered a bug.

But in the context of modules, the current clocksource counter is running but
what about the clocksource's counter related to the module which will be
started when the driver is loaded and then switches to the new clocksource. Is
it possible in this case there is a time drift between the clocksource which
was started at boot time and the one started later when the module is loaded ?
 
> >  * the GKI approach is to have an update for the 'mainline' kernel and
> > let the different SoC vendors deal with their drivers. I'm afraid this
> > will prevent driver fixes to be carry on upstream because they will stay
> > in the OoT kernels
> 
> I'm not sure I understand this point?  Could you expand on it a bit?
> While I very much can understand concerns and potential downsides of
> the GKI approach, I'm not sure how that applies to the submission
> here, as the benefit would apply to classic distro kernels as much as
> GKI.

Ok let's consider my comment as out of the technical aspects of the changes. I
can clarify it but it does not enter into consideration for the module
conversion. It is an overall feeling about the direction of all in modules for
GKI policy. I'm a little worried about changes not carried on mainline because
it is no longer an obstacle to keep OoT drivers. The core kernel is mainline
but the drivers can be vendor provided as module. I understand it is already
the case but the time framework is the base brick of the system, so there is
the risk a platform is supported with less than the minimum functionality.


-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

