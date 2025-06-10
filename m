Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767CEC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkHumX+B+y86i8MSC5SJDKQ6nFwDO3pplzjQCYTDa/A=; b=AIqTebqCh4ngI9mzKS0FYS0X1g
	nuBC9vzQVO9JeejK7xfAySZTJq0UdXALG1VP64nZABqkPj0z8VocBb3tghQxtrsoUkWo7iDdf0aSe
	dITwJjQHuJYW3MMlFWbwFpatH3z39XaDUEmXNqpOf3S+5MI1eunD9nwpzg34KjPqz1twZ/H/65bYx
	SHPpllLLbC0ZqOLn9Ng5fLnwgZNSYvQfW4Ls7PmT9gkmDwr7tD33es6Pbl9lsg0c2RhMky3iLjjle
	SEuXae2KZnkNvQzfC+e7WG4yKNORCHe0c2HZR1o2QmgCAmjY3cw6HJbBLz18PPai3ED7XCImPQm0y
	5zeNQ83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtIy-000000060wS-1Tv2;
	Tue, 10 Jun 2025 07:21:56 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtFf-000000060Va-3uJP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 07:18:33 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4e58a9bb8fcso1703210137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 00:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749539910; x=1750144710; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkHumX+B+y86i8MSC5SJDKQ6nFwDO3pplzjQCYTDa/A=;
        b=zKvPzM4XJSSM7eOlgTsW3+To8TKG4rSl9qbav3xWo8QkU5xNKdwP/OUtGQUFLytQnZ
         TdXADzwbka4wTuEQkouaYxw/suArmtxzybL6p+uTbHao/LJGbwDnkcEnBqDEOHPRhFtc
         AYt82YMYFtrpUC/jgQv3JuaA27LNG4cSJkyJNjMVrKdaKdL2jVLwQxv1xVp1AhWiSzOL
         j4j5bjAkWylFjJZ6oVVrSJuAAE9xctvKt6ve/WRRosD9egtzl1RhbNYSaobtWM6Nfn9K
         6zbf8h+GvFC2uR78fKxQqhSvXAputXF90F70cQXXYa4pwqm4JugxDuJwnr6JBjryesZr
         ThZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539910; x=1750144710;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkHumX+B+y86i8MSC5SJDKQ6nFwDO3pplzjQCYTDa/A=;
        b=VcaGHGpHHFGYPxtYSIgTornPwj49V5LZ+PI1VeaYKs0I2YZ64+hWRS/YquUpD4P8NB
         IBb9rd2fNdW3T3d536Dbly3I8MExo1ZNazeTkj41Vl5bKjsJPV+4/E2fKH2maRrTUKwT
         fYR3WSi1iAYojet0iDqf1jWGRHwa4//o3Qk+2gBqqqMDdYTIxTCrTWK16qcld9MCv/8M
         J9ixPcoJsDzRfMSxBY/oSzdvwP7Ly7ren+34FYGdOQA9uyaBVksJm5ifgggcjsSc6HfI
         deS2vG3wV/wfxWczDiaupsYnsgVIR1SjlRuZZpQuPH4+CIzXOBZsu96PAl8vzYt+zdC1
         uIMQ==
X-Gm-Message-State: AOJu0YxukRTdavJKNlnFiQ9onJWlatrrh1NuqZRcpQRKF/yokCsA5nzG
	0+eKvbi56GPTVJPPL1LxxjGpBU6lP/sX/tlJ1I51EliLjHTbss8+ISAn3lkgrICbhLvT6sq6rxQ
	3bvjohm2zIwgWCYvLL6+wgJezSAPVMJPOjqxAnwo/fN4CH2CwIt2D+uJ41Q==
X-Gm-Gg: ASbGnctbGpQpTyqBOgFeR4wMnhvJGnzBbSk9KFzEw1Z03EOEVH4SKppnlFlHBWfjN8b
	vQaUwiSKqnX0bUlSPky6EcR697MsCjhI/KYIo2pKdDX/qYMDBNLHQLMBJr0mgnrGiPw3TL66Rhe
	Gu4HL7O0zdL/PH3vvstMG/90vPoRD0+ujwQI2Ml401gFidHiNaFHab5CETwFWzB7ASOgmsCFbI4
	ezS
X-Google-Smtp-Source: AGHT+IEWeK8X5+m8ElJSK5z3+ETpZn+gitvlG/z+JagvODDs6mTjgbOyPmSCoIASAzlc/+Rww7q/dUQ/dbl/qwPi6yI=
X-Received: by 2002:a05:6102:4403:b0:4e2:a5b9:df1d with SMTP id
 ada2fe7eead31-4e7729acf70mr12705549137.8.1749539910181; Tue, 10 Jun 2025
 00:18:30 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 10 Jun 2025 12:48:18 +0530
X-Gm-Features: AX0GCFs5HGZPW_5vlnOtlFErN9wZOl5LWlGniaDfW8i9KS2B_HI6AE7jX17fEGo
Message-ID: <CA+G9fYsYVuEpL5KnYdq4ciRmpnUMQqkNQHmy7y5XvUm48kjxyA@mail.gmail.com>
Subject: Juno-r2 WARNING kernel time clockevents.c cev_delta2ns clockevents_config.part
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_001831_968741_897C886E 
X-CRM114-Status: GOOD (  11.00  )
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

Regression while booting Juno-r2 with the Linux next-20250606
the following kernel warnings found.

This boot warning was reproduced with juno-r2.dtb and juno-r2-scmi.dtb.

Regressions found on Juno-r2
- boot warning

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250606
Good: next-20250512
Bad:  next-20250606

The suspected patch that found between tags is,

# git show next-20250512..next-20250513 --
arch/arm64/boot/dts/arm/juno-base.dtsi
commit 1fa3ed04ac55134063e3cd465b41aeb26715e52a
Author: Sudeep Holla <sudeep.holla@arm.com>
Date:   Mon May 12 11:11:32 2025 +0100

    arm64: dts: arm: Drop the clock-frequency property from timer nodes

    Drop the clock-frequency property from the timer nodes, since it must be
    configured by the boot/secure firmware.

    Cc: Liviu Dudau <liviu.dudau@arm.com>
    Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
    Cc: Mark Rutland <mark.rutland@arm.com>
    Message-Id: <20250512101132.1743920-1-sudeep.holla@arm.com>
    Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi
b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 055764d0b9e5..9ccb80821bdb 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -10,7 +10,6 @@ / {
        memtimer: timer@2a810000 {
                compatible = "arm,armv7-timer-mem";
                reg = <0x0 0x2a810000 0x0 0x10000>;
-               clock-frequency = <50000000>;
                #address-cells = <1>;
                #size-cells = <1>;
                ranges = <0 0x0 0x2a820000 0x20000>;


Boot regression: Juno-r2 WARNING kernel time clockevents.c
cev_delta2ns clockevents_config.part

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot warning
[    0.000000] timer_sp804: timer clock not found: -517
[    0.000000] timer_sp804: arm,sp804 clock not found: -2
[    0.000000] Failed to initialize
'/bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/timer@110000':
-22
[    0.000000] timer_sp804: timer clock not found: -517
[    0.000000] timer_sp804: arm,sp804 clock not found: -2
[    0.000000] Failed to initialize
'/bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/timer@120000':
-22
[    0.000000] arch_timer: frequency not available
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:38
cev_delta2ns (kernel/time/clockevents.c:38 (discriminator 1))
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.15.0-next-20250605 #1 PREEMPT
[    0.000000] Hardware name: ARM Juno development board (r2) (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : cev_delta2ns (kernel/time/clockevents.c:38
(discriminator 1))
[    0.000000] lr : clockevents_config.part.0 (kernel/time/clockevents.c:499)
[    0.000000] sp : ffff800082923cd0
[    0.000000] x29: ffff800082923cd0 x28: 0000000000000400 x27: ffff800081650000
[    0.000000] x26: ffff80008292fcc0 x25: ffff800082425888 x24: ffff8000829343c0
[    0.000000] x23: ffff800083210000 x22: 000000000000000b x21: ffff8000823cf178
[    0.000000] x20: ffff800082433880 x19: ffff00080021e240 x18: 0000000000000000
[    0.000000] x17: ffff00080021a400 x16: ffff00080021a200 x15: 0000000000000100
[    0.000000] x14: fffffdffe0008a00 x13: ffff800080000000 x12: 0000000000000000
[    0.000000] x11: 0000000000000068 x10: 0000000000000100 x9 : ffff8000801b50f8
[    0.000000] x8 : 000000001dcd6500 x7 : 000000003b9aca00 x6 : 0000000000000020
[    0.000000] x5 : 0000000000000020 x4 : 0000000000000000 x3 : 0000000f00000000
[    0.000000] x2 : 0000000000000000 x1 : ffff00080021e240 x0 : 000000000000000f
[    0.000000] Call trace:
[    0.000000] cev_delta2ns (kernel/time/clockevents.c:38 (discriminator 1)) (P)
[    0.000000] clockevents_config_and_register (kernel/time/clockevents.c:519)
[    0.000000] arch_timer_mem_frame_register
(drivers/clocksource/arm_arch_timer.c:1319
drivers/clocksource/arm_arch_timer.c:1580)
[    0.000000] arch_timer_mem_of_init
(drivers/clocksource/arm_arch_timer.c:1653)
[    0.000000] timer_probe (drivers/clocksource/timer-probe.c:31)
[    0.000000] time_init (arch/arm64/kernel/time.c:62)
[    0.000000] start_kernel (init/main.c:1014)
[    0.000000] __primary_switched (arch/arm64/kernel/head.S:247)
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 50.00MHz
(phys/phys).

## Source
* Kernel version: 6.15.0-next-20250513 to 6.15.0-next-20250606
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 4f27f06ec12190c7c62c722e99ab6243dea81a94
* Toolchain: gcc-13

## Boot details
* Boot lava log: https://lkft.validation.linaro.org/scheduler/job/8309469#L622
* Boot log: https://qa-reports.linaro.org/api/testruns/28679128/log_file/
* Boot warning:
https://regressions.linaro.org/lkft/linux-next-master/next-20250605/log-parser-boot/exception-warning-cpu-pid-at-kerneltimeclockevents-cev_delta2ns/
* Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2y4wgEvmeoVH3Vr528M4YN2OBXY/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2y4wgEvmeoVH3Vr528M4YN2OBXY/config

--
Linaro LKFT
https://lkft.linaro.org

