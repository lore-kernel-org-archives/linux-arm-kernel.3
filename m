Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041A7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6J3bLH3lxnU1wq9lp33HkB5R033P8bBP3qGJYX3dOFU=; b=iZyweZOnNAay44kWWpBiMpymjB
	DZ4FIOkcio5s4j++6+Qnk8sEcwimxbNwJx5eG67dj9WBTw1uV+BNQI71vGEf7EabCT3mXm/2ImxHc
	sbTzZbDDhT+Xc6srxSomI3viBcKFql7LCoS67uI6RW5pK9cz35KyT2s73b3jDHf3AhbdG1Ig4R74E
	fjL0UIFwZpsQ1EsVgdcCNFwmmtGumTjQTVjiFye91HkTwUl+vXBXUX/C7ywM+Wp/wb723rgsVVzqB
	TlVZEDxQCPP4ZmaWJyXejcya1L3OrGokr/iUJ/dStflmemb10EB+VwKYyPHWkRaostOLn7GNuxHIF
	mTkVX0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolPK-0000000EMCc-2ZBL;
	Wed, 20 Aug 2025 16:11:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojjg-0000000E27u-3WjU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:24:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so3361639f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755699859; x=1756304659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6J3bLH3lxnU1wq9lp33HkB5R033P8bBP3qGJYX3dOFU=;
        b=sJxJ3zspXP7GW/+eMDeZf3DF8NMfXx6q1MDBQLbDK6chKwT2T6/WnFTbAhO0ZeOScK
         o1yRgh0jc04W5w0I9a2RT/Ga77sTbuRkgUHxDG0SK4C0BwXl3AlhLAOE5ay34cMa684W
         PsD7q3AKdAhP8Ha0l0dtzKNbp2CuCAH0vY+144GeOXvfPrCxjEfu7FK7wd1uhXPhnRl5
         geSjZMOf3VXbeIj1MGVPMkrZGm61yPu3sw7eAV217x8xXL5A2jMng2Fjh5J0iw9JBNR7
         KljlEMj2U5gyFPAJXRNlOvwbU008/+5vF2TzNR7CPPr8apFZCzERWFQH3+/yhAm3iRf7
         dimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755699859; x=1756304659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J3bLH3lxnU1wq9lp33HkB5R033P8bBP3qGJYX3dOFU=;
        b=e+BrMGM9fMNQXhyqmVqHpe15eG+uO336IlTj1yetNu19nTqhPi4rATCcCDu+DJZco4
         uph12zQ0BZQ+V6uTuwwKPxleXKptY7yiI6IuHKt0H1hUllI/Yjx04GYgnj4sozMUxesh
         KvWseLrAwJYoksggYgCNRrpd4BJkD6pUPyer6bUfQOkAC/7fpcDuf/S+GqveO9f4I6DD
         c5hEc7EsrFaZBMg5SEiEpHh10+LI1VgHNjeLnpsnp/X9o5ybsfFf4XjEj5Y7W90IUPj3
         kx7MaUX3H0bB2Q6KR8zRJmSW2tBYs2ZGprirlKwxvuY0g3jYVtGUTzdAXy4WidT0Pb4K
         l6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkptyU220i/rIb6E6vd3X+ghZfRTLcfZwUWlL9AlKawduYdUB916WaWLhzhgGJ1jR77qkYSD3n5lGBcq+LsnLV@lists.infradead.org
X-Gm-Message-State: AOJu0YwhYG08cDyr8djlC6I1/OpvvU1s9S6vrPYmZd04G6tnPCuP2ahQ
	/QdBIaBI086BfFu8y+DGgzHTefu2/DNrXNRqbry+x3G1HL7X83kph1h+Bm2dldRhcgY=
X-Gm-Gg: ASbGnctdAs17550Z4QMqQJfOnJrmVNvw9T0zvJ9x7bjMXxnVljLrqAoAMXfJyxFHRju
	P3GDJFHTXwA7DiMjdYEJIpSpg15G0dh7+mOqP8LNepeOVPPgRC8FBrZEC/AFNBKChh8+L4SkHIV
	5E5VuE4U4nHiSSRTsBft0oY3y/rWPW+mswYVs65kWSnhQzOvMtTg9eQpaqwmEIn9lqQA3arldvZ
	n0xRdDx9iocjjFFiz7+LWfNs/C7NN69IZulbKh4bOBCIlIqFflGhTDrOvKkYE7XVKrI5rvlwil6
	IHR491aqMJD6AYDyna6j8E+f8u3w/fQQ1nOaDa3NG/CoVuMzLNRbq7yrWzEnrpgjugsq/KrR8Dt
	d5zTML9JgXmsjnagCxGDerEp2O/g=
X-Google-Smtp-Source: AGHT+IFnea2n21+kS1N+9kldwzmLDXovzHwkQ2dtRizVAVyYeiR3u+rellXeEys1h8pnuViATD2x5w==
X-Received: by 2002:a05:6000:4007:b0:3b7:94c3:2786 with SMTP id ffacd0b85a97d-3c32e2294d9mr2203490f8f.34.1755699858694;
        Wed, 20 Aug 2025 07:24:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c3a8980ed5sm2231742f8f.16.2025.08.20.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:24:18 -0700 (PDT)
Date: Wed, 20 Aug 2025 17:24:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: Juno-r2 WARNING kernel time clockevents.c cev_delta2ns
 clockevents_config.part
Message-ID: <aKXajiHqhhkFeV4a@stanley.mountain>
References: <CA+G9fYsYVuEpL5KnYdq4ciRmpnUMQqkNQHmy7y5XvUm48kjxyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsYVuEpL5KnYdq4ciRmpnUMQqkNQHmy7y5XvUm48kjxyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_072420_884903_0A6C876A 
X-CRM114-Status: GOOD (  21.76  )
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

Hi Sudeep,

Could we revert commit 1fa3ed04ac55 ("arm64: dts: arm: Drop the
clock-frequency property from timer nodes")?  We're still getting this
warning on our Juno systems (with admittedly ancient firmware).

regards,
dan carpenter

On Tue, Jun 10, 2025 at 12:48:18PM +0530, Naresh Kamboju wrote:
> Regression while booting Juno-r2 with the Linux next-20250606
> the following kernel warnings found.
> 
> This boot warning was reproduced with juno-r2.dtb and juno-r2-scmi.dtb.
> 
> Regressions found on Juno-r2
> - boot warning
> 
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
> 
> First seen on the next-20250606
> Good: next-20250512
> Bad:  next-20250606
> 
> The suspected patch that found between tags is,
> 
> # git show next-20250512..next-20250513 --
> arch/arm64/boot/dts/arm/juno-base.dtsi
> commit 1fa3ed04ac55134063e3cd465b41aeb26715e52a
> Author: Sudeep Holla <sudeep.holla@arm.com>
> Date:   Mon May 12 11:11:32 2025 +0100
> 
>     arm64: dts: arm: Drop the clock-frequency property from timer nodes
> 
>     Drop the clock-frequency property from the timer nodes, since it must be
>     configured by the boot/secure firmware.
> 
>     Cc: Liviu Dudau <liviu.dudau@arm.com>
>     Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>     Cc: Mark Rutland <mark.rutland@arm.com>
>     Message-Id: <20250512101132.1743920-1-sudeep.holla@arm.com>
>     Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi
> b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 055764d0b9e5..9ccb80821bdb 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -10,7 +10,6 @@ / {
>         memtimer: timer@2a810000 {
>                 compatible = "arm,armv7-timer-mem";
>                 reg = <0x0 0x2a810000 0x0 0x10000>;
> -               clock-frequency = <50000000>;
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 ranges = <0 0x0 0x2a820000 0x20000>;
> 
> 
> Boot regression: Juno-r2 WARNING kernel time clockevents.c
> cev_delta2ns clockevents_config.part
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot warning
> [    0.000000] timer_sp804: timer clock not found: -517
> [    0.000000] timer_sp804: arm,sp804 clock not found: -2
> [    0.000000] Failed to initialize
> '/bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/timer@110000':
> -22
> [    0.000000] timer_sp804: timer clock not found: -517
> [    0.000000] timer_sp804: arm,sp804 clock not found: -2
> [    0.000000] Failed to initialize
> '/bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/timer@120000':
> -22
> [    0.000000] arch_timer: frequency not available
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:38
> cev_delta2ns (kernel/time/clockevents.c:38 (discriminator 1))
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
> 6.15.0-next-20250605 #1 PREEMPT
> [    0.000000] Hardware name: ARM Juno development board (r2) (DT)
> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.000000] pc : cev_delta2ns (kernel/time/clockevents.c:38
> (discriminator 1))
> [    0.000000] lr : clockevents_config.part.0 (kernel/time/clockevents.c:499)
> [    0.000000] sp : ffff800082923cd0
> [    0.000000] x29: ffff800082923cd0 x28: 0000000000000400 x27: ffff800081650000
> [    0.000000] x26: ffff80008292fcc0 x25: ffff800082425888 x24: ffff8000829343c0
> [    0.000000] x23: ffff800083210000 x22: 000000000000000b x21: ffff8000823cf178
> [    0.000000] x20: ffff800082433880 x19: ffff00080021e240 x18: 0000000000000000
> [    0.000000] x17: ffff00080021a400 x16: ffff00080021a200 x15: 0000000000000100
> [    0.000000] x14: fffffdffe0008a00 x13: ffff800080000000 x12: 0000000000000000
> [    0.000000] x11: 0000000000000068 x10: 0000000000000100 x9 : ffff8000801b50f8
> [    0.000000] x8 : 000000001dcd6500 x7 : 000000003b9aca00 x6 : 0000000000000020
> [    0.000000] x5 : 0000000000000020 x4 : 0000000000000000 x3 : 0000000f00000000
> [    0.000000] x2 : 0000000000000000 x1 : ffff00080021e240 x0 : 000000000000000f
> [    0.000000] Call trace:
> [    0.000000] cev_delta2ns (kernel/time/clockevents.c:38 (discriminator 1)) (P)
> [    0.000000] clockevents_config_and_register (kernel/time/clockevents.c:519)
> [    0.000000] arch_timer_mem_frame_register
> (drivers/clocksource/arm_arch_timer.c:1319
> drivers/clocksource/arm_arch_timer.c:1580)
> [    0.000000] arch_timer_mem_of_init
> (drivers/clocksource/arm_arch_timer.c:1653)
> [    0.000000] timer_probe (drivers/clocksource/timer-probe.c:31)
> [    0.000000] time_init (arch/arm64/kernel/time.c:62)
> [    0.000000] start_kernel (init/main.c:1014)
> [    0.000000] __primary_switched (arch/arm64/kernel/head.S:247)
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] arch_timer: cp15 and mmio timer(s) running at 50.00MHz
> (phys/phys).
> 
> ## Source
> * Kernel version: 6.15.0-next-20250513 to 6.15.0-next-20250606
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 4f27f06ec12190c7c62c722e99ab6243dea81a94
> * Toolchain: gcc-13
> 
> ## Boot details
> * Boot lava log: https://lkft.validation.linaro.org/scheduler/job/8309469#L622
> * Boot log: https://qa-reports.linaro.org/api/testruns/28679128/log_file/
> * Boot warning:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250605/log-parser-boot/exception-warning-cpu-pid-at-kerneltimeclockevents-cev_delta2ns/
> * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2y4wgEvmeoVH3Vr528M4YN2OBXY/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2y4wgEvmeoVH3Vr528M4YN2OBXY/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

