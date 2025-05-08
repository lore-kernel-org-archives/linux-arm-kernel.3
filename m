Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540DBC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Hp/Zx088l7ufNM7/gEglcaYvteforqJCTr5utu/Y/M=; b=EjbuWn9G7folahR21u7qNQPaZM
	iOKLWT+clGSRO0b6oE8pB59x+jG5x3hhmEseAO95uBiojucqqtifa5ZrlKfXn4p3VP01vaHZcTnEZ
	Ny1eP8g6jhkgjcatBXRNXQVIwTaf86U/nP8SR6UBcbsu3BUA8N0qo3V7YKpPvbMrvfzHavxxHdLiK
	ZleGXbrX5MxWDfE6NWn4i3C+wASq4lg1Iov830j+RgjSeqLK01y5jw4tdtaPpsKHj2KOPa3whg4QW
	mEyH0u3v2HJCRCEpobSg6hIEhGXrx8pY4M6AgaI62uKPV1TRypp5VORmOtDm6smTHWgFfFjn6xbRK
	iig+XWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzi7-00000000WYe-1bVj;
	Thu, 08 May 2025 11:46:43 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzg9-00000000WLz-3ikb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:44:43 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-72bd5f25ea6so263702a34.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746704681; x=1747309481; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Hp/Zx088l7ufNM7/gEglcaYvteforqJCTr5utu/Y/M=;
        b=x3bPM1aqME95+G7JIc3ep++5j2+d6htwRg3nWeYNZqyNc6oy4O/GHwIDbYM+Lx2OmC
         AS6Ff/ttBhcO7Wk4xtujLBup65uhNT8Ohyrxe9Qs346Ft5t4DQvsJzDcIpJLvWKVTPyN
         bqD4PHbVYPLi94SJt+hGOD0RrfEOfIG3jqmvbf4wiu0z4IT0lGBJdx9LacHtJBhgodJO
         /zqYK3+rF6IuYzCZdsNGB6MI0zKRjnYBVfFqmo3mYQEq1SZOwA7NBR0QoreRGsVZl5OW
         ynPE7gwOans7/mM1sVCA6PiRaKdTf5X2PhPmWdMeCSusqAV7Tj38aBTBSpOWMWLLrOjp
         B5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704681; x=1747309481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Hp/Zx088l7ufNM7/gEglcaYvteforqJCTr5utu/Y/M=;
        b=jnMwgwnnz0ewiBwaIVcQcsktdqKQQff2MuogynXZSdCUDdZPJIn4UQagJxu080yFw8
         Z35LLYLvtkns6S7VtL4W3jl6zdu9L6ogLwkil2PnUAKIA9V8kwifxuqO0ZWRdmA9doDz
         toopumWm/KX+XCLGpJ5MfQ3rngCHTIS3y0W9hkHNjEFlcG+6C013ewm7pTRUhNsmZpb4
         vyxDmFYCd6cDcRGNvTmDJs5tzoJo+VzGNkxVBmEc+Fu1v0HnpqdOghtT7BfIclUFO7j3
         hL70y/NX8kNq414YJwjAmmklauWGTD49fVdmC9QfpLIp7KJYJ4xHzu0rCMsYUKArdoXB
         ETbg==
X-Forwarded-Encrypted: i=1; AJvYcCVztgI5hvHcuoquKhSCgAyZOiESUISbBMyKKJLXDF+Szt4btLZTNFXgBDp096150NXl9HGk+fhaa8Jf5VSFN2p2@lists.infradead.org
X-Gm-Message-State: AOJu0YzP57Kguu5IoSEVFMu0EnYFuDDBxmQhC3NozVLwXUazekNSUs1m
	ID2cub96bH3yr06qNql8yEobzUwxy4gWeRXhCJAqR0yLi+ktPtZNRLhd9TBXhjr6QNozE4FsWKG
	YxHxRAvOj1zoD3dmpP0wOKeQ91ds4dyqYe/RuKA==
X-Gm-Gg: ASbGncsfpIfVNmiL7ZGFRALUty1MOg1BulRGfxcAmehdCLQS09BVjFXMsb0q3DlZQ06
	FYyKg4K8zhAi6mcu5/4vdZX3ArwB6oDwz8SZQc7u6E1nKNYIq+z5q1jii3XD8JPU/A+fp07gYeA
	9HXBZ1Hbi0ltV0Ir8rAIaaJIU=
X-Google-Smtp-Source: AGHT+IHR8KYLZfRaxr/JXt1MbDStXnfYLmh12kfUK55ebtZ9Q6Un3DnFf5DzZhGiLaPUsqdPll0N8Q4dykGFdmsvGsI=
X-Received: by 2002:a05:6870:891b:b0:29e:69d9:8834 with SMTP id
 586e51a60fabf-2db5b915d6cmr3889315fac.0.1746704680699; Thu, 08 May 2025
 04:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <Z_7O1xi2-ZGhJ1r_@google.com> <Z_-RaYcXHR9--zXA@mai.linaro.org>
In-Reply-To: <Z_-RaYcXHR9--zXA@mai.linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 12:44:29 +0100
X-Gm-Features: ATxdqUEvbDcAFOTGHzLMBK8svR6T90akaQxSMqcut79zelUxyv-arjNE7fwYfi0
Message-ID: <CADrjBPoePtodu-yYaFBcOMmvv0r2x+gCAdVnZypJ=G_BN4Sn-w@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: William McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_044441_936993_60A7156A 
X-CRM114-Status: GOOD (  55.55  )
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

Hi Daniel,

[..]

> > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > >
> > > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > > source for the arch_timer.
> > >
> > > From a previous thread where there is no answer:

Aside from the timer modularization part here which is proving a bit
contentious are
you OK with queueing the other parts of this MCT series?

As I need some of the MCT driver changes to enable CPUIdle on Pixel 6 upstream.
Exiting from c2 idle state is broken for gs101 without some of these
MCT changes.

[..]

> > >
> > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > >
> > > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > > a module for the reasons explained in the aforementionned thread.
> > >
> > > Before this could be accepted, I really need a strong acked-by from Thomas
> >
> > Thanks for the response! I'll copy-and-paste your replies from that previous
> > thread and try to address your concerns.
> >
> > >   * the GKI approach is to have an update for the 'mainline' kernel and
> > > let the different SoC vendors deal with their drivers. I'm afraid this
> > > will prevent driver fixes to be carry on upstream because they will stay
> > > in the OoT kernels
> >
> > I can't speak for that specific thread or their intent, but I can speak to this
> > thread and our intent.
> >
> > This whole patch series is about upstreaming the downstream changes. So saying
> > this will prevent others from upstreaming changes is punishing the folks who
> > are actually trying to upstream changes. I don't think that's a fair way to
> > handle this.
> >
> > Also, rejecting this series will not prevent people from upstreaming their
> > changes, it'll just make it more unlikely because they now have to deal with
> > upstreaming more changes that were rejected in the past. That's daunting for
> > someone who doesn't do upstreaming often. I'm telling this from experience
> > dealing with SoC vendors and asking them to upstream stuff.
> >
> > With that said, let me try to address some of your technical concerns.
>
> I won't reject the series based on my opinion. Answering the technical concerns
> will prevail.
>
> Why is it needed to convert the timer into a module ?

MCT is hardware very specific to Exynos based SoCs. Forcing this
built-in is just
bloat for many other systems that will never use it.

The aim of this series is to upstream the downstream OOT code with the goal of
then switching over to the upstream version of the driver.

I agree with your points though that we should be sure the timer framework can
handle this, and we aren't introducing subtle bugs.

>
> > > * the core code may not be prepared for that, so loading / unloading
> > > the modules with active timers may result into some issues
> >
> > We had the same concern for irqchip drivers. We can easily disable unloading
> > for these clocksource modules just like we did for irqchip by making them
> > permanent modules.
>
> In the clockevent / clocksource initialization process, depending on the
> platform, some are needed very early and other can be loaded later.
>
> For example, the usual configuration is the architected timers are initialized
> very early, then the external timer is loaded a bit later. And when this one is
> loaded it does not take over the architected timers. It acts as a "broadcast"
> timer to program the next timer event when the current CPU is going to an idle
> state where the local timer is stopped.
>
> Other cases are the architected timers are not desired and the 'external' timer
> is used in place when it is loaded with a higher rating. Some configuration can
> mimic local timers by settting a per CPU timer.
>
> Some platforms could be without the architected timers, so the 'external' timer
> is used.
>
> Let's imagine the system started, the timers are running and then we load a
> module with a timer replacing the current ones. Does it work well ?
>
> Are we sure, the timer modularization is compatible with all the timer use cases ?

It's a good question. We can say it's been used as a module on
multiple generations
of Pixel devices in production without issues. Whether that covers all
timer use cases
I can't say.

>
> > > * it may end up with some interactions with cpuidle at boot time and
> > > the broadcast timer
> >
> > If I'm understanding this correctly, no driver is guaranteed to probe at
> > initialization time regardless of whether it is built-in or a module. Taking
> > a look at the other clocksource drivers, I found that the following drivers are
> > all calling `clocksource_register_hz()` and `clockevents_config_and_register()`
> > at probe time.
> >
> >   timer-sun5i.c
> >   sh_tmu.c
> >   sh_cmt.c
> >   timer-tegra186.c
> >   timer-stm32-lp.c (only calls clockevents_config_and_register())
> >
> > So this concern is unrelated to building these drivers are modules. Please let
> > me know if I'm missing something here.
>
> We would have to check each platform individually to answer this question.
>
> The interaction between cpuidle and the timer module is about not having a
> broadcast timer when cpuidle initializes and then having it later when the
> module is loaded. Did you check the deep idle states are used after loading the
> module ?

For gs101 / Oriole deep idle states are used after loading the module as if the
MCT timer *isn't* used then the CPU can't wake up from c2 and eventually there
are no CPUs left leading to a hang.

>
> The discussion is not about only the Exynos MCT but as you are not the first
> one asking to convert the timer driver to a module, we should check what could
> be the impact on the time framework and the system in general.
>
> Others proposed to convert to module and I asked to investigate the impact.
> Nobody came back with a clear answer and there is no feedback from Thomas.

Hopefully the above answers go a little bit towards giving a degree of
confidence
that this is a safe change :)

regards,

Peter.

