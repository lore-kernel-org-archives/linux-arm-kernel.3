Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE76C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeR748Kqcp8Ecn+7OwBivcVoxs7eFxEnihqMB/P4pQo=; b=cdSUqxUbRoRqLQOtxOh+ziA2Gx
	gMt6bGdf9eIeFnxi/tvwdFT9i46xAKShPD/9ecls6hoiukt9RRTkaYUqjosRS0tw5BfzD+7AgzSWP
	ldkJGPWywFVoiYmyvb9JibVEeUZ4/UjRX8Y6fDlrxTEtHvyDGv9VyZzZsxRNPiaasqADfm0Y43MlU
	FNXvF7+A+JkTY826q/HO1rm9IicrQkGHndQVdeUUYXQ0MBT93oIGyGxRi/qBp937855bMqP8Zt0kk
	Iw7umY0Oa7zaaVh5SYDisO0YthOV3T5wwJDIsz1C51541IvMLK4TBIvi1noWae81J5KJQUzqIAklW
	PAqODsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBXE-0000000Dlog-296U;
	Wed, 13 Aug 2025 13:28:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umB5w-0000000DhXG-1FDr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:00:46 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b792b0b829so6567120f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755090043; x=1755694843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PeR748Kqcp8Ecn+7OwBivcVoxs7eFxEnihqMB/P4pQo=;
        b=gBAsOp2admxgJ2x8VPLYEi/5E86bHbFhnHmJ31f0YAZ7gFbVmwfpo3KOH+TYCALMtL
         YzS9IPND+umNW3ZA/BJK8erFGoMHTOhfc2S+wph21l3u87ShMuz0kfdFr6VekkB+lse9
         AZmDplWyspeDFHREekpHaMc/u8HlIyxbQYI6JkQzs79jD2khR1y5QPZlzEMF3a2NGYCi
         P0wwAt9kVc8Pg9M7UES5moYi2hipGwAZ3t4fjSitdRY4yMAaHk2T2ld9fZD3UdWADUsn
         kgtO38mkihhqneTY0BDVMbSk/lZLQOJI0ix35F+8uE0HWyoahZ6ZE6x6iZHOnw5AfKd3
         tgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090043; x=1755694843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeR748Kqcp8Ecn+7OwBivcVoxs7eFxEnihqMB/P4pQo=;
        b=i49lub8fMwK3yPh4tu1u1uYR6mWfOPqAtvqMFwtzyFWlJdBSP6tnIka0K9JMss84mF
         GCygu7hxYB0Sr54sPIdHOl8O6O7KvmGT4pyzlFvz2QlKrh2AqZh9V0yZ8rRL5Tes0ThS
         muej0sOmWED4Gcj3Yywkpq+P1/12hqoc+W3WsboKG7Oz67AlYo1Stmm9GuOhTTXyiJJC
         DnMSmVbkdoTDXtABR5KLsdltmvCoyHZsjenptH/VkmLjboxLkP30cGufnbQw/+gYgbmy
         fHsb92sXEUEcy6W8hbalBc68OnZiDtnQbSN711Ua9mKwp5QC/FDun+Dma+cQggOnzEiZ
         3bNg==
X-Forwarded-Encrypted: i=1; AJvYcCWRZKy79VAvdqv3EHeYnejDKkF8I6b4NjmOWK+tFvR5SGB4PmssJpTTCoiZmW6iRAkzD8lpkIKouUAhZ7U5q5dZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9QhEQRwB8WC3Jchq/NK7uN4+sXLrAcJfTc+fSSavdNYAbydTs
	nSWnrzIcHgAKvTC4gmS5SwMfYbV1/0SYo+5hVdjMCFmsUiVExBCnhXd1LZ7hIszo4HE=
X-Gm-Gg: ASbGncsIifKwXcxvb8o2/aJS95LNgkLbQ7HAQMKYORN8jEaKapOQVAdaRHsZ5w5X4mb
	XQL6f8zJVM3dvB6VjAQRdwbd1EOMgUkRSmGOEhdQgEFoZMNs0daa76EeYIb20/OWIKTiE32vylH
	SA7jS4dCT840ZCycFIEhCIjNoU9XHwdek3chDbh6TetaVdiQGG4imnc9S/RCDGxP/uykrFbPpwj
	bDjyHElBtrmtZUYfkfUt1B6j5TPDbG6Fhlb4IaY5y8ArpDA+0m3LRDeD1gTMDaSypB797QOKey7
	edJjmQNcoKGAXnxROWkqI8Avm77SIwSiVKXvIYLAz0XTSB2U20id1Mg6xC+9nXJQYl89vMCxW+N
	pDeVewO2a0aYy3QjoWjC9U8iKxQxnNP8KUYtFvxZPMDtj2eOfuKKlaQ5ToDYa9g==
X-Google-Smtp-Source: AGHT+IGVgvf1Uge8sHIDUuFP1oPvQwNSsudB+wr24LhPfVIfTvW2P80/tIqYbrFHm8v3paEcs2k0Bw==
X-Received: by 2002:a5d:5f95:0:b0:3b7:8dd7:55ad with SMTP id ffacd0b85a97d-3b917f14804mr2270522f8f.39.1755090042622;
        Wed, 13 Aug 2025 06:00:42 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3abed3sm47465915f8f.10.2025.08.13.06.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 06:00:42 -0700 (PDT)
Message-ID: <5a4e8480-a291-409d-acc3-f053d4e99981@linaro.org>
Date: Wed, 13 Aug 2025 15:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Setting the scene to convert the timers into
 modules
To: tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
 Will McVicker <willmcvicker@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Saravan Kanna <saravanak@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_060044_376592_23754255 
X-CRM114-Status: GOOD (  40.07  )
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


Hi Thomas,

was this series dropped ?

I'm not able to find it in v6.17-rc1 but it is in the master branch of 
the tip tree (v6.16-rc7)


On 02/06/2025 17:18, Daniel Lezcano wrote:
> The timer drivers are all compiled-in. The initial pre-requisite is to
> have them available as soon as possible in the boot process. While
> this statement made sense a long time ago, the platforms have today
> multiple timers for different purposes along with architected timers
> which are initialized very early. For example, a timer can be used as
> a backup timer when the local timers are belonging to a power domain
> which is shutted down, or used a watchdog timer when the counter are
> shared, or also as a pulse width modulation counter. Another use case
> is the platform user may want to switch to a timer different from the
> architected timers because they have interesting characteristics in
> the context of a dedicated platform (eg. automotive).
> 
> In some existing drivers, there is already the code to load and unload
> a timer driver even if the Kconfig does not allow that. It means, the
> need is there but partially upstream.
> 
> There were multiple attempts to configure the timer drivers into
> modules but it faced the fact that we were unsure if it is correctly
> supported by the time framework.
> 
> After investigating deeper in the core code it appears we have
> everything set for the modularization of the timer drivers.
> 
>   - When a clocksource is registered with a better rating, the current
>     clocksource is swapped with the new one. The userspace allows to
>     change the current clocksource via sysfs
> 
>   - A clocksource can be unregistered
> 
>   - When a clockevent is registered with a better rating, it becomes
>     the active one
> 
>   - A clockevent can not be unregistered
> 
> A timer driver can be loaded later because of all the supported
> above. However unloading is unsupported because a clockevent can not
> be unregistered and that will lead to a crash.
> 
> But if the timer driver has the module owner set, the core framework
> will handle the refcount correctly and will prevent to unload the
> module if a clockevent is registered. All the refcounting is working
> in different use cases.
> 
>   - A clocksource is the current clocksource, the refcount is held
> 
>   - A current clocksource is switched to another one, the refcount is
>     released
> 
>   - A broadcast timer is registered, the refcount is held
> 
>   - A local timer is registered, the refcount is held
> 
> Consequently, it is possible to unload a module which is only used as
> a clocksource. As soon as a clockevent is registered, the refcount is
> held and can not be released thus preventing the module to be
> unloaded.
> 
> That mechanism ensure it is safe to convert the different timer
> drivers into modules.
> 
> This series adds the module owner in the different driver which are
> initialized with the module_platform_driver() function and export the
> symbols for the sched_clock_register() function.
> 
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Nam Cao <namcao@linutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-tegra@vger.kernel.org
> Cc: John Stulz <jstultz@google.com>
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: Saravan Kanna <saravanak@google.com>
> 
> 
> Daniel Lezcano (7):
>    clocksource/drivers/scx200: Add module owner
>    clocksource/drivers/stm32-lp: Add module owner
>    clocksource/drivers/sun5i: Add module owner
>    clocksource/drivers/tegra186: Add module owner
>    clocksource/drivers/stm: Add module owner
>    clocksource/drivers/cs5535: Add module owner
>    time: Export symbol for sched_clock register function
> 
>   drivers/clocksource/scx200_hrt.c     | 1 +
>   drivers/clocksource/timer-cs5535.c   | 1 +
>   drivers/clocksource/timer-nxp-stm.c  | 2 ++
>   drivers/clocksource/timer-stm32-lp.c | 1 +
>   drivers/clocksource/timer-sun5i.c    | 2 ++
>   drivers/clocksource/timer-tegra186.c | 3 +++
>   kernel/time/sched_clock.c            | 4 ++--
>   7 files changed, 12 insertions(+), 2 deletions(-)
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

