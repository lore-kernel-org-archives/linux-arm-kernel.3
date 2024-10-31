Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C3E68960
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yRVDQpV+hUXvvZ+d81+vLy4HFzH/pZtNnyV5rKLdBNk=; b=miRqp5lTZB6g2ooRGYYlVyHRi2
	1ORpBQjq6dGE731nqV4Nv6lpcQ0tgz6SK4h0fdtj5r6Ut38X+acQaiJ1EJ8Go9rrv3BF90cKSIsaE
	Tk6fdANJGnP3tRbntcjcH9r73Adfa7WMeo98udOm6UEXUIDxCaYk7wrr+9a4H/DDrNpnmQlAAF9ZI
	SI0ahGbpxlMRhhhCA3HSoL/tFL6yrNB/eTtpOXFNigiLp7n/pCcGzPqkQPzq3f4wyqih1qcos3rnL
	JwP46Dq3f19B8L/SYHr8MlGwrcksGa6/zJ6il6HxwJ+N78qhXHd4UtwYWN9LdG2GpS8VulNhHoDfv
	xxpxO3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qor-00000002yrz-42xo;
	Thu, 31 Oct 2024 08:46:17 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QjD-00000002yDD-3B42
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 08:40:29 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-50d4780a24eso256135e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 01:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730364026; x=1730968826; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yRVDQpV+hUXvvZ+d81+vLy4HFzH/pZtNnyV5rKLdBNk=;
        b=Wb1eC9quDo2LESOLRT+bnpnT74yK6XtRMuHAJRiD4t8CyWXTIwtTV5LGCkWoorQfx3
         2dsCGY/fVTOXy+vNcV6dISqr9yYei+cR79E5apO24xn0k8oGsuw/wQsWx0i/EJGBfNvR
         dQS4rDL57IK2XGqaQd2o3HaZ/olLc5rbNq4rKQjH3wjUeExx1Ga0RitWLDvCDhj0glOc
         5QdBAmPyuLAyGlX+Nrc8U++A9XR3WjcWtqFx/W93fyfv3i7YiJiuiGxPke357FBvma2U
         Iui7LzUe8T+wv2vDFpOD/88DRRcBz0+APkN7NFoFiUPPUIW9y5i9Fbj/7fm/7XDHaEFo
         grag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364026; x=1730968826;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRVDQpV+hUXvvZ+d81+vLy4HFzH/pZtNnyV5rKLdBNk=;
        b=E5z+rhJb6vP9rsF3rSDzHegqF1DM0MsZz6nV/BnDkLrSp4xJ1wKLbI4GVuxnQU0EXl
         2iLpoiaRR2EdLbhXt23PWptshgcnGZ1CbyeLV2hVlL9HrRDMWLs5Muun3zszuV/rJ2kx
         6KSREmXq6006cHAn8qMpdowwwD9nkk8m3+7D0DvJRhmvNpw8no3XtDOxF2x5h9t3qQvH
         Hcme0nnQcIXFUnolbWS5YLXn/vQf2scfbdwtSLghP6mBde49dDBJNwI64MCCsUdY3lVp
         JIrxbF+/fQdwVIKlCO7mAvHP2YAz/qE1rbnhlMFpOZFbhCvVl8nUQ+hZDMUJKsdC9Um8
         xsTw==
X-Gm-Message-State: AOJu0YyHUFCcSIhRax+IRV1eHunMERNRx2RWdKOXGA0b6ikDmIPMPOse
	ZiTa9ezjUfIXbVS2V0x5AyK0RKtDMgTFmJMedFhyhBEBB9aHl//OJ81AEneqIbB4hlTWXroX2fz
	ys7on8qM+vAwS7Ggq0Ql6h+ZD1/HZb1DidyDdrMScHCeNTKw/VDM=
X-Google-Smtp-Source: AGHT+IGR/MPyH3IolNU4N1H3KPOJfa7bE8GqUDT765g/usV3v7bfC6kWkOhjTjRmP547kzqlXxsbmIBpPjVVnaUU3uw=
X-Received: by 2002:a05:6122:891:b0:50a:caec:70a2 with SMTP id
 71dfb90a1353d-5101501c00bmr17269880e0c.4.1730364025759; Thu, 31 Oct 2024
 01:40:25 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 31 Oct 2024 14:10:14 +0530
Message-ID: <CA+G9fYtb5vAnEiHupwsnaeZ7uzdko_WAcjw9ZAFkHNXBVhi1EA@mail.gmail.com>
Subject: next-20241031: kernel/time/clockevents.c:455 clockevents_register_device
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, rcu <rcu@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Aishwarya TCV <aishwarya.tcv@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_014027_856292_5BEC4209 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

The QEMU-ARM64 boot has failed with the Linux next-20241031 tag.
The boot log shows warnings at clockevents_register_device and followed
by rcu_preempt detected stalls.

However, the system did not proceed far enough to reach the login prompt.
The fvp-aemva, Qemu-arm64, Qemu-armv7 and Qemu-riscv64 boot failed.

Please find the incomplete boot log links below for your reference.
The Qemu version is 9.0.2.

This is always reproducible.
First seen on Linux next-20241031 tag.
  Good: next-20241030
  Good: next-20241031

qemu-arm64:
  boot:
    * clang-19-lkftconfig
    * gcc-13-lkftconfig
    * clang-nightly-lkftconfig

qemu-armv7:
  boot:
    * clang-19-lkftconfig
    * gcc-13-lkftconfig
    * clang-nightly-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
-------
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
    0.000000] Linux version 6.12.0-rc5-next-20241031 (tuxmake@tuxmake)
(aarch64-linux-gnu-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils
for Debian) 2.43.1) #1 SMP PREEMPT @1730356841
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: linux,dummy-virt
<trim>
<6>[    0.216503] GICv3: CPU1: found redistributor 1 region 0:0x00000000080c0000
<6>[    0.218511] GICv3: CPU1: using allocated LPI pending table
@0x0000000100250000
<4>[    0.220528] ------------[ cut here ]------------
<4>[ 0.220657] WARNING: CPU: 1 PID: 0 at kernel/time/clockevents.c:455
clockevents_register_device (kernel/time/clockevents.c:455
(discriminator 1))
<4>[    0.221897] Modules linked in:
<4>[    0.222659] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted
6.12.0-rc5-next-20241031 #1
<4>[    0.223100] Hardware name: linux,dummy-virt (DT)
<4>[    0.223480] pstate: 200003c9 (nzCv DAIF -PAN -UAO -TCO -DIT
-SSBS BTYPE=--)
<4>[ 0.223815] pc : clockevents_register_device
(kernel/time/clockevents.c:455 (discriminator 1))
<4>[ 0.223899] lr : clockevents_config_and_register
(kernel/time/clockevents.c:523)
<4>[    0.223951] sp : ffff800080103cd0
<4>[    0.223985] x29: ffff800080103cd0 x28: 0000000000000091 x27:
0000000000000000
<4>[    0.224143] x26: fff06d7e11c1b000 x25: fff00000ff4d7108 x24:
00000000000000ee
<4>[    0.224221] x23: 01ffffffffffffff x22: ffff9282ed4e66c8 x21:
ffff9282ed8ce940
<4>[    0.224296] x20: fff00000ff4ef000 x19: fff00000ff4ef000 x18:
0000000000000010
<4>[    0.224376] x17: 3030353230303130 x16: 3030303030307830 x15:
4020656c62617420
<4>[    0.224450] x14: 676e69646e657020 x13: 3030303035323030 x12:
3130303030303030
<4>[    0.224522] x11: 78304020656c6261 x10: ffff9282eda4de88 x9 :
ffff9282eb3b161c
<4>[    0.224621] x8 : 000000001dcd6500 x7 : 000000003b9aca00 x6 :
00000000007fffff
<4>[    0.224693] x5 : 000000000000001b x4 : 0000000000800000 x3 :
000001ffffffffff
<4>[    0.224771] x2 : 0000000000000001 x1 : ffff9282ed9ced40 x0 :
0000000000000000
<4>[    0.225007] Call trace:
<4>[ 0.225218] clockevents_register_device+0x170/0x188 P
<4>[ 0.225367] clockevents_config_and_register+0x34/0x50 L
<4>[ 0.225487] clockevents_config_and_register (kernel/time/clockevents.c:523)
<4>[ 0.225553] arch_timer_starting_cpu
(drivers/clocksource/arm_arch_timer.c:1034)
<4>[ 0.225602] cpuhp_invoke_callback (kernel/cpu.c:194)
<4>[ 0.225649] __cpuhp_invoke_callback_range (kernel/cpu.c:965)
<4>[ 0.225691] notify_cpu_starting (kernel/cpu.c:1604)
<4>[ 0.225733] secondary_start_kernel (arch/arm64/kernel/smp.c:251)
<4>[ 0.225809] __secondary_switched (arch/arm64/kernel/head.S:421)
<4>[    0.226244] ---[ end trace 0000000000000000 ]---
<6>[    0.228186] CPU1: Booted secondary processor 0x0000000001 [0x000f0510]
<6>[    0.237749] smp: Brought up 1 node, 2 CPUs
<6>[    0.253976] SMP: Total of 2 processors activated.
<6>[    0.254658] CPU: All CPU(s) started at EL2
<trim>
<3>[   21.732871] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[   21.734120] rcu: 1-...!: (0 ticks this GP) idle=0ca0/0/0x0
softirq=0/0 fqs=0 (false positive?)
<3>[   21.735202] rcu: (detected by 0, t=5252 jiffies, g=-1179, q=28 ncpus=2)
<6>[   21.736404] Sending NMI from CPU 0 to CPUs 1:
<4>[ 21.737195] NMI backtrace for cpu 1 skipped: idling at
default_idle_call (kernel/sched/idle.c:126)
<3>[   21.741361] rcu: rcu_preempt kthread timer wakeup didn't happen
for 5251 jiffies! g-1179 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
<3>[   21.742143] rcu: Possible timer handling issue on cpu=1 timer-softirq=0
<3>[   21.742724] rcu: rcu_preempt kthread starved for 5252 jiffies!
g-1179 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
<3>[   21.743583] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[   21.744154] rcu: RCU grace-period kthread stack dump:
<6>[   21.744678] task:rcu_preempt     state:I stack:0     pid:18
tgid:18    ppid:2      flags:0x00000008
<6>[   21.746801] Call trace:
<6>[ 21.747336] __switch_to+0x104/0x180 T
<6>[ 21.747990] __schedule (kernel/sched/core.c:5330 kernel/sched/core.c:6707)
<6>[ 21.748380] schedule (kernel/sched/core.c:6785 kernel/sched/core.c:6799)
<6>[ 21.748717] schedule_timeout (include/linux/timer.h:185
kernel/time/sleep_timeout.c:100)
<6>[ 21.749159] rcu_gp_fqs_loop (kernel/rcu/tree.c:2045 (discriminator 15))
<6>[ 21.749600] rcu_gp_kthread (kernel/rcu/tree.c:2250 (discriminator 2))
<6>[ 21.749966] kthread (kernel/kthread.c:389)
<6>[ 21.750256] ret_from_fork (arch/arm64/kernel/entry.S:863)
<3>[   84.752681] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[   84.753221] rcu: 1-...!: (0 ticks this GP) idle=0cd8/0/0x0
softirq=0/0 fqs=1 (false positive?)
<3>[   84.753702] rcu: (detected by 0, t=21007 jiffies, g=-1179, q=28 ncpus=2)
<6>[   84.754154] Sending NMI from CPU 0 to CPUs 1:
<4>[ 84.754746] NMI backtrace for cpu 1 skipped: idling at
default_idle_call (kernel/sched/idle.c:126)
<3>[   84.756511] rcu: rcu_preempt kthread timer wakeup didn't happen
for 15749 jiffies! g-1179 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
<3>[   84.757462] rcu: Possible timer handling issue on cpu=1 timer-softirq=0
<3>[   84.757880] rcu: rcu_preempt kthread starved for 15750 jiffies!
g-1179 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
<3>[   84.758538] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[   84.759136] rcu: RCU grace-period kthread stack dump:
<6>[   84.759609] task:rcu_preempt     state:I stack:0     pid:18
tgid:18    ppid:2      flags:0x00000008
<6>[   84.760175] Call trace:
<6>[ 84.760454] __switch_to+0x104/0x180 T
<6>[ 84.760810] __schedule (kernel/sched/core.c:5330 kernel/sched/core.c:6707)
<6>[ 84.761218] schedule (kernel/sched/core.c:6785 kernel/sched/core.c:6799)
<6>[ 84.761528] schedule_timeout (include/linux/timer.h:185
kernel/time/sleep_timeout.c:100)
<6>[ 84.761846] rcu_gp_fqs_loop (kernel/rcu/tree.c:2045 (discriminator 15))
<6>[ 84.762304] rcu_gp_kthread (kernel/rcu/tree.c:2250 (discriminator 2))
<6>[ 84.762751] kthread (kernel/kthread.c:389)
<6>[ 84.763168] ret_from_fork (arch/arm64/kernel/entry.S:863)
<3>[  105.768683] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[  105.769169] rcu: 1-...!: (0 ticks this GP) idle=0ce8/0/0x0
softirq=0/0 fqs=0 (false positive?)
<3>[  105.769749] rcu: (detected by 0, t=5252 jiffies, g=-1175, q=27 ncpus=2)
<6>[  105.770219] Sending NMI from CPU 0 to CPUs 1:
<4>[ 105.770939] NMI backtrace for cpu 1 skipped: idling at
default_idle_call (kernel/sched/idle.c:126)
<3>[  105.771924] rcu: rcu_preempt kthread timer wakeup didn't happen
for 5250 jiffies! g-1175 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
<3>[  105.772727] rcu: Possible timer handling issue on cpu=1 timer-softirq=0
<3>[  105.773193] rcu: rcu_preempt kthread starved for 5251 jiffies!
g-1175 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
<3>[  105.773892] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[  105.774494] rcu: RCU grace-period kthread stack dump:
<6>[  105.775006] task:rcu_preempt     state:I stack:0     pid:18
tgid:18    ppid:2      flags:0x00000008
<6>[  105.775929] Call trace:
<6>[ 105.776238] __switch_to+0x104/0x180 T
<6>[ 105.776702] __schedule (kernel/sched/core.c:5330 kernel/sched/core.c:6707)
<6>[ 105.777169] schedule (kernel/sched/core.c:6785 kernel/sched/core.c:6799)
<6>[ 105.777571] schedule_timeout (include/linux/timer.h:185
kernel/time/sleep_timeout.c:100)
<6>[ 105.778041] rcu_gp_fqs_loop (kernel/rcu/tree.c:2045 (discriminator 15))
<6>[ 105.778507] rcu_gp_kthread (kernel/rcu/tree.c:2250 (discriminator 2))
<6>[ 105.778968] kthread (kernel/kthread.c:389)
<6>[ 105.779365] ret_from_fork (arch/arm64/kernel/entry.S:863)
<3>[  168.788676] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[  168.789211] rcu: 1-...!: (0 ticks this GP) idle=0cf8/0/0x0
softirq=0/0 fqs=1 (false positive?)
<3>[  168.789696] rcu: (detected by 0, t=21007 jiffies, g=-1175, q=27 ncpus=2)
<6>[  168.790176] Sending NMI from CPU 0 to CPUs 1:
<4>[ 168.790347] NMI backtrace for cpu 1 skipped: idling at
default_idle_call (kernel/sched/idle.c:126)
<3>[  168.791281] rcu: rcu_preempt kthread timer wakeup didn't happen
for 15752 jiffies! g-1175 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
<3>[  168.791959] rcu: Possible timer handling issue on cpu=1 timer-softirq=0
<3>[  168.792586] rcu: rcu_preempt kthread starved for 15753 jiffies!
g-1175 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
<3>[  168.793343] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[  168.793928] rcu: RCU grace-period kthread stack dump:
<6>[  168.794213] task:rcu_preempt     state:I stack:0     pid:18
tgid:18    ppid:2      flags:0x00000008
<6>[  168.794719] Call trace:
<6>[ 168.794925] __switch_to+0x104/0x180 T
<6>[ 168.795202] __schedule (kernel/sched/core.c:5330 kernel/sched/core.c:6707)
<6>[ 168.795454] schedule (kernel/sched/core.c:6785 kernel/sched/core.c:6799)
<6>[ 168.795690] schedule_timeout (include/linux/timer.h:185
kernel/time/sleep_timeout.c:100)
<6>[ 168.795977] rcu_gp_fqs_loop (kernel/rcu/tree.c:2045 (discriminator 15))
<6>[ 168.796250] rcu_gp_kthread (kernel/rcu/tree.c:2250 (discriminator 2))
<6>[ 168.796606] kthread (kernel/kthread.c:389)
<6>[ 168.797039] ret_from_fork (arch/arm64/kernel/entry.S:863)
<3>[  189.804686] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[  189.805214] rcu: 1-...!: (0 ticks this GP) idle=0d08/0/0x0
softirq=0/0 fqs=0 (false positive?)
<3>[  189.805791] rcu: (detected by 0, t=5252 jiffies, g=-1171, q=27 ncpus=2)
<6>[  189.806325] Sending NMI from CPU 0 to CPUs 1:
<4>[ 189.807068] NMI backtrace for cpu 1 skipped: idling at
default_idle_call (kernel/sched/idle.c:126)
<3>[  189.808147] rcu: rcu_preempt kthread timer wakeup didn't happen
for 5251 jiffies! g-1171 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
<3>[  189.808872] rcu: Possible timer handling issue on cpu=1 timer-softirq=0
<3>[  189.809344] rcu: rcu_preempt kthread starved for 5252 jiffies!
g-1171 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
<3>[  189.809965] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[  189.810600] rcu: RCU grace-period kthread stack dump:
<6>[  189.811112] task:rcu_preempt     state:I stack:0     pid:18
tgid:18    ppid:2      flags:0x00000008
<6>[  189.811623] Call trace:
<6>[ 189.811852] __switch_to+0x104/0x180 T
<6>[ 189.812287] __schedule (kernel/sched/core.c:5330 kernel/sched/core.c:6707)
<6>[ 189.812584] schedule (kernel/sched/core.c:6785 kernel/sched/core.c:6799)
<6>[ 189.812932] schedule_timeout (include/linux/timer.h:185
kernel/time/sleep_timeout.c:100)
<6>[ 189.813394] rcu_gp_fqs_loop (kernel/rcu/tree.c:2045 (discriminator 15))
<6>[ 189.813685] rcu_gp_kthread (kernel/rcu/tree.c:2250 (discriminator 2))
<6>[ 189.813993] kthread (kernel/kthread.c:389)
<6>[ 189.814240] ret_from_fork (arch/arm64/kernel/entry.S:863)
<3>[  252.824675] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[  252.825201] rcu: 1-...!: (0 ticks this GP) idle=0d18/0/0x0
softirq=0/0 fqs=1 (false positive?)
<3>[  252.825675] rcu: (detected by 0, t=21007 jiffies, g=-1171, q=27 ncpus=2)
<6>[  252.826077] Sending NMI from CPU 0 to CPUs 1:
<4>[ 252.826332] NMI backtrace for cpu 1 skipped: idling at
default_idle_call (kernel/sched/idle.c:126)
<3>[  252.827295] rcu: rcu_preempt kthread timer wakeup didn't happen
for 15752 jiffies! g-1171 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
<3>[  252.828099] rcu: Possible timer handling issue on cpu=1 timer-softirq=0
<3>[  252.828632] rcu: rcu_preempt kthread starved for 15753 jiffies!
g-1171 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
<3>[  252.829561] rcu: Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[  252.830012] rcu: RCU grace-period kthread stack dump:
<6>[  252.830503] task:rcu_preempt     state:I stack:0     pid:18
tgid:18    ppid:2      flags:0x00000008
<6>[  252.831137] Call trace:
<6>[ 252.831328] __switch_to+0x104/0x180 T
<6>[ 252.831619] __schedule (kernel/sched/core.c:5330 kernel/sched/core.c:6707)
<6>[ 252.832041] schedule (kernel/sched/core.c:6785 kernel/sched/core.c:6799)
<6>[ 252.832413] schedule_timeout (include/linux/timer.h:185
kernel/time/sleep_timeout.c:100)
<6>[ 252.832689] rcu_gp_fqs_loop (kernel/rcu/tree.c:2045 (discriminator 15))
<6>[ 252.832991] rcu_gp_kthread (kernel/rcu/tree.c:2250 (discriminator 2))
<6>[ 252.833264] kthread (kernel/kthread.c:389)
<6>[ 252.833511] ret_from_fork (arch/arm64/kernel/entry.S:863)
<struck>

Boot log link,
-----
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241031/testrun/25617342/suite/boot/test/gcc-13-lkftconfig-debug/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241031/testrun/25617342/suite/boot/test/gcc-13-lkftconfig-debug/details/

Build images:
------
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2oBwuVtvQdiUyZ16JGOe1JsS6KY/
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2oBwvKQrvbVwqhTKdkXN0BXivv2

Steps to reproduce via qemu:
----------------
/usr/bin/qemu-system-aarch64 -cpu max,pauth-impdef=on \
   -machine virt,virtualization=on,gic-version=3,mte=on \
   -nographic -nic none -m 4G -monitor none -no-reboot \
   -smp 2 -kernel kernel/Image -append \"console=ttyAMA0,115200
rootwait root=/dev/vda debug verbose console_msg_format=syslog
systemd.log_level=warning rw earlycon\" \
   -drive file=rootfs.ext4,if=none,format=raw,id=hd0 \
   -device virtio-blk-device,drive=hd0


Steps to reproduce with tuxrun reproducer:
---------------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2oBwvKQrvbVwqhTKdkXN0BXivv2/reproducer

Boot history compare link:
------------------------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241031/testrun/25617515/suite/boot/test/gcc-13-lkftconfig-kselftest/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241031/testrun/25616350/suite/boot/test/clang-19-lkftconfig/history/

metadata:
---------
  git describe: next-20241031
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2oBwuVtvQdiUyZ16JGOe1JsS6KY/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2oBwuVtvQdiUyZ16JGOe1JsS6KY/
  toolchain: gcc-13, gcc-8 and clang-19
  config: defconfig+lkftconfig
  arch: arm64

Please let me know if you need more information.

--
Linaro LKFT
https://lkft.linaro.org

