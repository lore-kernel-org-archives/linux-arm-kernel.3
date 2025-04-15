Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A565C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwJG8J1iyTH8V+SfRmZi+ISFZpJOYpkT7vaEBR18O5k=; b=cmxRvyn0fkh85o6TVWEvK+vrdU
	qzwJXlMB7oseNMx+2elagqIrW1CUnzEpjnuPVo5FzxN5pJLc4Rrc2cLYdDRVUCLDvwGlqhKXHB0/4
	4UA3sWUS2GeiPlW6yDZidTptxWrvDZbsYkkcOYuNkHqdrq/Np7E7HMJNCtcG5UoPv6bD+YNK2C7UL
	6RsFhTgw6izGQmeRrarjbsX1Qs6vqfMmHignuCzTnpApjihJX8XC2MT618HezPThqmwDzM80CEYMx
	vEX/p69B8xzNbKlaHKFX56gXHbRpg24T7vu+X2FBkP5p+DWKcNfBMqZU7vTDqfBKx0S50kcDOtUQB
	naufw6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4nol-00000007BKZ-2HVf;
	Tue, 15 Apr 2025 21:27:43 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4nmv-00000007B6H-0L7K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 21:25:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22548a28d0cso87530255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744752347; x=1745357147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwJG8J1iyTH8V+SfRmZi+ISFZpJOYpkT7vaEBR18O5k=;
        b=eOEJnmkMb4+z8ku2oR+CSs75V7K5BQ64AsBd2ejtSu+vwNxjnfVEDaVytBC01tbPRI
         zZQ/rMflokQXkCq4proMybcEtg2ngAcigP9bUlyFmuX2X3/KSvX9XV1fke5SW3eAZzi/
         vqEKhpfz0Y6Qalg0nZenFxw2b53rm29sMFHLArI3BxIvASKezT0VeBmMuB7ekOXS7srW
         m3onlw6EdmSXTrpqAq4WiioeHgeE1c8xyPzuW2okSUgDOPS9qMLv3Abf7JcMWlp3xkvL
         bzEVvW0JLhmi6Rwrk9ovVMFY74GQMXETjY00X0fsSptImUdqiKW8zyJkFW3HDtHjWgKw
         wmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752347; x=1745357147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwJG8J1iyTH8V+SfRmZi+ISFZpJOYpkT7vaEBR18O5k=;
        b=K3UlgdLSPYdmkp107mj4WFLW0nx6LVR0dLYQna7ARULmesm91I0lH7J8q2vX2xzSrC
         2V7dkVpnhSMI+42p9kg8LWscn71j6AW+o42o2RaVatrLhq9uritQL4h7NcicOD06FK28
         bbH/B3tO77F4vAgCrbHsv4UjDAqrDpNhV+HZpB1C+HGzyHAbRM7KwJZ9h8AwgQj3luHU
         umwiw24BaamSG/KTA06xHXVF558Y9GJ6Qo+3nmpnujXYbmK6f5lznYoXVqU5dQOcSfAa
         kwzbgQfpiiAl3bt66V8Rm9M3VNHSoMUfIB5zP3ItVz7+R67K2PbHQwiZvqCMMl6+c+7L
         xUmg==
X-Forwarded-Encrypted: i=1; AJvYcCUENbZIxWSilXfk2d5n57Rh3qFtynhETTXKPyHJcQOVnRMKIsdVAY09vfRKQQdWwi8NoWXiADv/1GN263vNWxrX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4j4jadbBb2rWw8/UgfbR1WJnxTcxM3Eic8AAQcHp9UrDuzW5C
	uJfOgfDP0Ap0RwsKII3DMxG7tRUPeqPAUd6e46JFUB9YghKUUYOCTVz4N0R8Bg==
X-Gm-Gg: ASbGncvv8o6HiMaj8JPnRdx1cClvbnSby7gIxMd4xiE3baxeyS1WKJZm+ecp9SAN1ki
	b8hU3/RZx7VebgOypWklRCD2zJCLu4diA+dTzHuEpiOmQYmyJVa3rAk+bbFyzttKPZUvJDXvTZk
	At5DKEs3mZdDmvNVcisaFyk1EvO6sLI/C4w227tdtkH7ZHzERo5H7z67wPDpqFjlJUlM1h64FGT
	y8us07dfPVel6WvwFiigaws1Ok3qhL06kjDByxlcBR3jQQjLc3JfxcJc25DQzaePwLm3I9P/8hn
	TDxiOY5ssNdDYXkRjO4tywR+KUV69whbUPSh+k8lAsVWJF9SMBCnWSB+2ZWSiKOFQaH5d+0oeH6
	pjVBrxA==
X-Google-Smtp-Source: AGHT+IFbV5rZHgTJXmvY63NNUPHF83MLOSfyfSDJgneqMsKOmSCLVHVGlipkv2ZUH8ySI1osZFQGUA==
X-Received: by 2002:a17:902:ef4c:b0:224:f12:3734 with SMTP id d9443c01a7336-22c319f7f6bmr11029435ad.30.1744752347289;
        Tue, 15 Apr 2025 14:25:47 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e8b1sm9292900b3a.148.2025.04.15.14.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 14:25:46 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:25:43 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <Z_7O1xi2-ZGhJ1r_@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_6OZHYfC0bC5289@mai.linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_142549_137287_B3864822 
X-CRM114-Status: GOOD (  33.25  )
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

On 04/15/2025, Daniel Lezcano wrote:
> Hi Will,

Hi Daniel,

> 
> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> 
> From a previous thread where there is no answer:
> 
> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> 
> I don't feel comfortable with changing the clocksource / clockevent drivers to
> a module for the reasons explained in the aforementionned thread.
> 
> Before this could be accepted, I really need a strong acked-by from Thomas

Thanks for the response! I'll copy-and-paste your replies from that previous
thread and try to address your concerns.

>   * the GKI approach is to have an update for the 'mainline' kernel and
> let the different SoC vendors deal with their drivers. I'm afraid this
> will prevent driver fixes to be carry on upstream because they will stay
> in the OoT kernels

I can't speak for that specific thread or their intent, but I can speak to this
thread and our intent.

This whole patch series is about upstreaming the downstream changes. So saying
this will prevent others from upstreaming changes is punishing the folks who
are actually trying to upstream changes. I don't think that's a fair way to
handle this.

Also, rejecting this series will not prevent people from upstreaming their
changes, it'll just make it more unlikely because they now have to deal with
upstreaming more changes that were rejected in the past. That's daunting for
someone who doesn't do upstreaming often. I'm telling this from experience
dealing with SoC vendors and asking them to upstream stuff.

With that said, let me try to address some of your technical concerns.

> * the core code may not be prepared for that, so loading / unloading
> the modules with active timers may result into some issues

We had the same concern for irqchip drivers. We can easily disable unloading
for these clocksource modules just like we did for irqchip by making them
permanent modules.

> * it may end up with some interactions with cpuidle at boot time and
> the broadcast timer

If I'm understanding this correctly, no driver is guaranteed to probe at
initialization time regardless of whether it is built-in or a module. Taking
a look at the other clocksource drivers, I found that the following drivers are
all calling `clocksource_register_hz()` and `clockevents_config_and_register()`
at probe time.

  timer-sun5i.c
  sh_tmu.c
  sh_cmt.c
  timer-tegra186.c
  timer-stm32-lp.c (only calls clockevents_config_and_register())

So this concern is unrelated to building these drivers are modules. Please let
me know if I'm missing something here.

>  * the timekeeping may do jump in the past [if and] when switching the
> clocksource

Can you clarify how this relates to modules? IIUC, the clocksource can be
changed anytime by writing to:

 /sys/devices/system/clocksource/clocksource0/current_clocksource

If there's a bug related to timekeeping and changing the clocksource, then that
should be handled separately from the modularization code.

For ARM64 in general, the recommendation is to use the ARM architected timer
which is not a module and is used for scheduling and timekeeping. While the
Exynos MCT driver can functionally be used as the primary clocksource, it's not
recommended due to performance issues. So building the MCT driver as a kernel
module really shouldn't be an issue and has been thoroughly testing on several
generations of Pixel devices which is why we are trying to upstream our
downstream technical debt (so we can directly using the upstream version of the
Exynos MCT driver).

Thanks,
Will

[...]

