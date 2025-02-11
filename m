Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133D0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oOfjVZVb5Y6iDzKKUHv6/nHA/mRe1wtMuOb87tFD/sY=; b=Gc86j49+B+UWHOX1mYzXoJWonj
	kxp0qcFyTTaFEMjVhHg9Jy1moYJLp/WZ2kl2G18zyEgZuKuhpPpFtRzwHXrQCcIvHhW5bRiq7Ao+p
	BO/gmybbUCfbsOldFSRSH3OyYoDbeR+u3fLWjuQZAwBXHWU9rCkxD/SuGTIeQVv6imKU0ad2qaa8F
	ZURNfXqchjqNzGt3PyqNf17KK6iDDXImQfrSIirj1FTvpv2eHc44JEfSjIwpuhwMmNGoyoxYN3WN6
	rEw2kzaHRbodoYg1aFIMPVptGMGr7W//TTQrzq69oWpQJJP5/scIWLcez6moFjibQKA4LqeyQfjFD
	cZGASvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoOg-00000003X18-40F2;
	Tue, 11 Feb 2025 11:25:46 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoNH-00000003Wlj-10g6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:24:20 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-860f0e91121so4217950241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739273057; x=1739877857; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oOfjVZVb5Y6iDzKKUHv6/nHA/mRe1wtMuOb87tFD/sY=;
        b=XORwCtwE44k7EEcfE1YccO7zvv3ZxyVzeC4EjSyB32VP+4SmSyCqLnVuYTjXX4iopc
         CI4Pn+7N3T7p8j3L9hE5qKNSmAPNkTpT36OKFHZRFjbhJ3gvAEFoql7AZpf0q3C7ZdDe
         fCrUTRA0dP2ryNAvOjMdC+fIZsqZV9aWTiydHq9aPa0by9JzLop6LPgFIIKZk5qLpwaC
         KREjMu7iY8BskH3eToR7yLMWcCvqKXz2LD20uNDAezlRNlB+uFuXAGc4G3IV/ze/am64
         AHWpoafCL1UXdwINBrX0oYFIL3ROrOrSsJ9LTODFpTB3WQ/dPARhJ/1Irb+HwcsMD0/s
         A52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273057; x=1739877857;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOfjVZVb5Y6iDzKKUHv6/nHA/mRe1wtMuOb87tFD/sY=;
        b=fMRNVHiDtN3o6jjaTWGOFaeA9VUUckftKydo5gMFDtJBEYxbIfPpBI4aM/HLTI9XAq
         gEf1+doUc5/EJJsFb4Uv84wRx9KT9Q8K9Nzm59i5TZewpGXCOQMVxARpyqEaY6VBx2j2
         4Bt6EwBSkJsWe9PxGtAS91JsLkeX4uPO4/Z9pbLvPStEkf6PIfISjXdZ3GNCdA/s8KRS
         UIRdcqVFGv/ciePUTchE+DWwAd5swy7nY7C05l8lfxzCluvmhN+ZRP753gJiTK/V8E8A
         oTEwpyzH4QYAf0DBIVWgtV5MFVFycYa1i5D1ZF1eoNfZA3YcJ8nRbsdcFUUriRrwFe0C
         q6dw==
X-Forwarded-Encrypted: i=1; AJvYcCUZvhdyZn1cLlhOiVysrCgm306W7iTylWjAfeIzLtwi/Ts/Dpo6rHq8wN1bxsKk4eL+QOUj2xa1zHq6Ec0y1FOi@lists.infradead.org
X-Gm-Message-State: AOJu0YzQSOctta/WkosK402KLnfOqSHkhWf3mdfhsZCsn1O9i4VWmy18
	1BP309dvGCA8/0qRypNCn8mJmK6hfDiIOyie0U9CvdARdDgTCrCew6URo197ZVH8RCGnKFm4mnh
	RMpNfoTMdUVcZBwTwayFNbKKyPi6pgYzon5DjwA==
X-Gm-Gg: ASbGncvIwGwkLDXlgKWf/pQki2/vVqqc2aNEqJ+8dtG3EZ5KihE8xdI19oJog4OEZvk
	3hHI7/ZauLsOM55PvwYoOR7qdXofLfsCRYhB37z1OBgrxp0PtP8uKf8FIoQ5rFfWCYHcHdEbA3M
	Ib72mDnWYj7x1Eh/1lvBVDhZsfBzb9zQ==
X-Google-Smtp-Source: AGHT+IEf4bAlc932Y8RjCqsdcVpRLNvZ7hqGahdwLKUrVi5zwhpmjI32Ih4rNqM1YHJ6OXhvHscn0v0mxu3EPZ63IlY=
X-Received: by 2002:a05:6122:e53:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-520584235ddmr1279904e0c.2.1739273057471; Tue, 11 Feb 2025
 03:24:17 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 11 Feb 2025 16:54:06 +0530
X-Gm-Features: AWEUYZn5KxAHY9nEhuLeVWZbiZhT9c81arMsoOohC1GNLVg1Ec6S2mvTF4MpJwg
Message-ID: <CA+G9fYt6Cuu6=OO9w80yhJbZB77Q0qf7nzYdvjbgDbgAw6t1jw@mail.gmail.com>
Subject: kvm: nVHE hyp panic at: __kvm_nvhe_kvm_hyp_handle_sysre
To: kvmarm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, virtualization@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_032419_295141_42D518C1 
X-CRM114-Status: UNSURE (   5.35  )
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

Regression on rk3399-rock-pi-4b while running kvm-unit-tests with
nvhe, protected and vhe mode with virtualization enabled.

First seen on next-20250120
Good: next-20250117
Bad: next-20250120 till today's next-20250210

This is always reproducible.

Regression on these devices with kernel command line boot modes.
* rk3399-rock-pi-4b-nvhe
* rk3399-rock-pi-4b-protected
* rk3399-rock-pi-4b-vhe

Test regression: kvm nVHE hyp panic at __kvm_nvhe_kvm_hyp_handle_sysreg
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
ok 139 - psci: psci: cpu-off
[  674.423092] kvm [6196]: nVHE hyp panic at:
__kvm_nvhe_kvm_hyp_handle_sysreg (include/kvm/arm_arch_timer.h:174
arch/arm64/kvm/hyp/include/hyp/switch.h:506
arch/arm64/kvm/hyp/include/hyp/switch.h:559
arch/arm64/kvm/hyp/include/hyp/switch.h:604)
[  674.423987] kvm [6196]: nVHE call trace:
[  674.424331] kvm [6196]: __kvm_nvhe_hyp_panic
(arch/arm64/kvm/hyp/nvhe/switch.c:415)
[  674.424950] kvm [6196]: __kvm_nvhe___kvm_vcpu_run
(arch/arm64/kvm/hyp/include/hyp/switch.h:750 (discriminator 1)
arch/arm64/kvm/hyp/nvhe/switch.c:355 (discriminator 1))
[  674.425619] kvm [6196]: __kvm_nvhe___kvm_vcpu_run
(arch/arm64/kvm/hyp/include/hyp/switch.h:750 (discriminator 1)
arch/arm64/kvm/hyp/nvhe/switch.c:355 (discriminator 1))
[  674.426288] kvm [6196]: __kvm_nvhe_handle___kvm_vcpu_run
(arch/arm64/kvm/hyp/nvhe/hyp-main.c:231)
[  674.427004] kvm [6196]: __kvm_nvhe_handle_trap
(arch/arm64/kvm/hyp/nvhe/hyp-main.c:640
arch/arm64/kvm/hyp/nvhe/hyp-main.c:673)
[  674.427651] kvm [6196]: __kvm_nvhe___skip_pauth_save
(arch/arm64/kvm/hyp/nvhe/host.S:67)
[  674.428313] kvm [6196]: ---[ end nVHE call trace ]---
[  674.428755] kvm [6196]: Hyp Offset: 0xfffea0df7d800000
[  674.429208] Kernel panic - not syncing: HYP panic:
[  674.429208] PS:600003c9 PC:0000df2103dc1610 ESR:0000000096000004
[  674.429208] FAR:ffff00000d031ba0 HPFAR:0000000000000000 PAR:1d00007edbadc0de
[  674.429208] VCPU:0000df21077a1bc0
[  674.431040] CPU: 4 UID: 0 PID: 6196 Comm: qemu-system-aar Not
tainted 6.14.0-rc2-next-20250210 #1
[  674.431815] Hardware name: Radxa ROCK Pi 4B (DT)
[  674.432219] Call trace:
[  674.432437] show_stack (arch/arm64/kernel/stacktrace.c:468) (C)
[  674.432763] dump_stack_lvl (lib/dump_stack.c:124)
[  674.433090] dump_stack (lib/dump_stack.c:130)
[  674.433384] panic (kernel/panic.c:354)
[  674.433657] nvhe_hyp_panic_handler
(arch/arm64/include/asm/current.h:19 arch/arm64/kvm/handle_exit.c:452)
[  674.434056] kvm_arm_vcpu_enter_exit
(arch/arm64/include/asm/alternative-macros.h:232
arch/arm64/include/asm/cpufeature.h:453
arch/arm64/include/asm/cpufeature.h:498
arch/arm64/include/asm/virt.h:139 arch/arm64/kvm/arm.c:1084)
[  674.434448] kvm_arch_vcpu_ioctl_run (arch/arm64/kvm/arm.c:1191)
[  674.434855] kvm_vcpu_ioctl (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4377)
[  674.435194] __arm64_sys_ioctl (fs/ioctl.c:51 (discriminator 1)
fs/ioctl.c:906 (discriminator 1) fs/ioctl.c:892 (discriminator 1)
fs/ioctl.c:892 (discriminator 1))
[  674.435542] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[  674.435875] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[  674.436289] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[  674.436583] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:745 (discriminator 1))
[  674.436860] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763)
[  674.437243] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[  674.437567] SMP: stopping secondary CPUs
[  674.438032] Kernel Offset: disabled
[  674.438338] CPU features: 0x100,0002082c,00800000,8200421b
[  674.438819] Memory Limit: none
[  674.439090] ---[ end Kernel panic - not syncing: HYP panic:
[  674.439090] PS:600003c9 PC:0000df2103dc1610 ESR:0000000096000004
[  674.439090] FAR:ffff00000d031ba0 HPFAR:0000000000000000 PAR:1d00007edbadc0de
[  674.439090] VCPU:0000df21077a1bc0 ]---

## Source
* kernel version: 6.14.0-rc2-next-20250210
* git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* git sha: df5d6180169ae06a2eac57e33b077ad6f6252440
* git describe: next-20250210
* project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/
* architecture: arm64
* device: rk3399-rock-pi-4b
* toolchain: gcc-13
* build config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/config
* build: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/

## Boot log
* test link-1: https://lkft.validation.linaro.org/scheduler/job/8117232#L1395
* test link-2: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250210/testrun/27250834/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-hyp-panic/log
* build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/
* config link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0brZaSpWe7z5aIqZfQx4GhT/config
* linux-next-history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250207/testrun/27226044/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-hyp-panic/history/
* linux-mainline-history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-rc2/testrun/27248845/suite/log-parser-test/test/panic-multiline-kernel-panic-not-syncing-hyp-panic/history/

--
Linaro LKFT
https://lkft.linaro.org

