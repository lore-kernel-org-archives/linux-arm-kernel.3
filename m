Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CED33998
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75XNMAa64Nrib7pgLMg1Z1XYi4OYy86joo0hy0CXwKI=; b=bJIsQUgwxMFz77iXWKPiTB5AEy
	FDILeL8gtJ8k3EoF1XnRIzQwaUWVEhOhog/HTpxmvAwo0dDnnUz33qaAxO6hbmKg7L9Aidn23et+l
	wTBxfEaDCGD+oQOHQb00VCBE8VPcx3gq/aj1qVIBw/9u1DjMb9vJ8NmrSbMD1Ita50sJ8povpUeLn
	E2K2p6mlWg+bsB0FGJhVH0aADkTyH3NCIQbdudnrVJLQ7bkt/7qq3IaGl+Kkt2uNgGBb02fFzHLn5
	KZZToLEp2BesrQy2gd40u0zqolDhN7qz+F2e5ioBxKdbEJVjc7KsDSN2EmqoZc/FkFhFubJasyNv5
	m5HyCYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SKI-0000000BRCQ-34Vu;
	Mon, 28 Oct 2024 16:10:42 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Rvb-0000000BMHU-2ZGE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:45:13 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4a47cdaf158so1495762137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 08:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730130310; x=1730735110; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=75XNMAa64Nrib7pgLMg1Z1XYi4OYy86joo0hy0CXwKI=;
        b=K/yq9NKshD73LNtM4xaCjPxZa1BvfE8196ZYG3mhgWIOQk9FVmQNf32U088pX3fbBv
         6KLdN2dB4JFN/SDlPc406W53epf8Cq4L8ly2iM9/8FkTve23wk3/cMzcLizyklSvVmKb
         Wa63T+0MHGRlYj0XwFVZuzZ9kpCs5HQYdGewz+rnxilToCxGmRDBcPQsn24fiTgOMR2n
         04McVen1mWWZRfOzrDQ8Ik/3iZi0F8sid1MXbB9pLaZt+mckJtP8MH9Gbj818zvZwan6
         g9NkhbwIoA9GlKxk656YN2PZPMVec86Ur+CrUoqh5r7de8qjsgnx/EiBL0ijgl6NjUDo
         BKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130310; x=1730735110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75XNMAa64Nrib7pgLMg1Z1XYi4OYy86joo0hy0CXwKI=;
        b=Lf0QnavcL2F6zmNFIPvYnyJsbLUG0cWetIcyVyxpEnRcSCCykTnk9c+ZA5rTcCDgTs
         zAVhUNl5qYjmy/RYC3Dh0cg9EY2PwXVD4gbmNc9UDxgMx6kugJnOpr4SOIXbSSP/Gn2M
         ivNDnnJvMGFEKwNtkAGv898+NHSHEKI859Tn9RWtpONfn70Cg/j7pCdJ4W3YubAlbcib
         MX91RE9A0b+j0xi4+YHSBFs7eaI+htv6MwqtA8Uq+UlCflZJAD8OyAwYlV97s+i3JUhd
         msi0P0Iz4FGxoafmRmWtUkGAWAqSoTv+/ztYu7vmYAjC4IlDoYJHDCZY+rlLoyxvwNcB
         r3mA==
X-Forwarded-Encrypted: i=1; AJvYcCVBAJ3tevynVDCxVInq+46JzPX8Cnu3YOnHjmZCe9ma2ZW7YnH9i9FqshyzWXa1uldGMum7v6PgGSRbSHWzaXoT@lists.infradead.org
X-Gm-Message-State: AOJu0YwdQLsKjEC6cycwm5OnM/JYuWb7I3FL3uTKtSEwqaTh7jP9mZ/I
	utGBN6BQjvc5czNDBJAJVz8YRWPRLbQZEFOZbaZLbFrR6Ukg9fDTvDL8smfhZOs4c70x4uq4fWj
	1x0sI/eEcoVvq/7nyssL07AvmBU6eErExay9P3g==
X-Google-Smtp-Source: AGHT+IGLxPJJ2NCoGI8hRsiiwLEAN/a5Dqx+FocGdkHpFfwjM3keyeu4LatSC2h948xtYi1UWvkv7JVZmh/VHgunRi4=
X-Received: by 2002:a05:6102:2924:b0:4a5:b543:ee64 with SMTP id
 ada2fe7eead31-4a8cfb5f764mr5871139137.11.1730130309682; Mon, 28 Oct 2024
 08:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241028062312.001273460@linuxfoundation.org>
In-Reply-To: <20241028062312.001273460@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 28 Oct 2024 21:14:57 +0530
Message-ID: <CA+G9fYu-tpwX=09=VOjniFnBz3MSXpaHb_gir2AqyNpihERT2Q@mail.gmail.com>
Subject: Re: [PATCH 6.11 000/261] 6.11.6-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, allen.lkml@gmail.com, 
	broonie@kernel.org, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_084511_690265_642D102B 
X-CRM114-Status: GOOD (  19.17  )
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

On Mon, 28 Oct 2024 at 12:16, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.11.6 release.
> There are 261 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 30 Oct 2024 06:22:39 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.11.6-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.11.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


The selftests: kvm: vgic_init test failed on stable-rc linux-6.11.y,
also seen on Linux next-20241023 onwards and Linus v6.12-rc5
on the Graviton4 and rk3399-rock-pi.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Test log:
---------
# selftests: kvm: vgic_init
# Random seed: 0x6b8b4567
# Running GIC_v3 tests.
# ==== Test Assertion Failure ====
#   lib/kvm_util.c:727: false
#   pid=2680 tid=2680 errno=5 - Input/output error
#      1 0x0000000000404eaf: __vm_mem_region_delete at kvm_util.c:727
(discriminator 5)
#      2 0x0000000000405d0f: kvm_vm_free at kvm_util.c:765 (discriminator 12)
#      3 0x0000000000402d5f: vm_gic_destroy at vgic_init.c:101
#      4 (inlined by) test_vcpus_then_vgic at vgic_init.c:368
#      5 (inlined by) run_tests at vgic_init.c:720
#      6 0x0000000000401a6f: main at vgic_init.c:748
#      7 0x0000ffff8620773f: ?? ??:0
#      8 0x0000ffff86207817: ?? ??:0
#      9 0x0000000000401b6f: _start at ??:?
#   KVM killed/bugged the VM, check the kernel log for clues
not ok 9 selftests: kvm: vgic_init # exit=254

Upstream discussion thread on this failures,
 - https://lore.kernel.org/linux-arm-kernel/20241009183603.3221824-1-maz@kernel.org/

Test failed log:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.11.y/build/v6.11.4-397-g4ccf0b49d5b6/testrun/25583294/suite/kselftest-kvm/test/kvm_vgic_init/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.11.y/build/v6.11.4-397-g4ccf0b49d5b6/testrun/25583294/suite/kselftest-kvm/test/kvm_vgic_init/history/

## Build
* kernel: 6.11.6-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: 4ccf0b49d5b6ec739a290593658bebd035bb5f10
* git describe: v6.11.4-397-g4ccf0b49d5b6
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.11.y/build/v6.11.4-397-g4ccf0b49d5b6

## Test Regressions (compared to v6.11.4-136-g96563e3507d7)
* graviton4-metal, kselftest-kvm
  - kvm_vgic_init

* rk3399-rock-pi-4b-nvhe, kselftest-kvm
  - kvm_vgic_init

* rk3399-rock-pi-4b-protected, kselftest-kvm
  - kvm_vgic_init

* rk3399-rock-pi-4b-vhe, kselftest-kvm
  - kvm_vgic_init

## Metric Regressions (compared to v6.11.4-136-g96563e3507d7)

## Test Fixes (compared to v6.11.4-136-g96563e3507d7)

## Metric Fixes (compared to v6.11.4-136-g96563e3507d7)

## Test result summary
total: 143710, pass: 118866, fail: 1602, skip: 23242, xfail: 0

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 131 total, 129 passed, 2 failed
* arm64: 43 total, 43 passed, 0 failed
* i386: 18 total, 16 passed, 2 failed
* mips: 26 total, 25 passed, 1 failed
* parisc: 4 total, 4 passed, 0 failed
* powerpc: 36 total, 35 passed, 1 failed
* riscv: 16 total, 14 passed, 2 failed
* s390: 14 total, 13 passed, 1 failed
* sh: 5 total, 5 passed, 0 failed
* sparc: 4 total, 3 passed, 1 failed
* x86_64: 35 total, 35 passed, 0 failed

## Test suites summary
* boot
* commands
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-cgroup
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-cpufreq
* kselftest-efivarfs
* kselftest-exec
* kselftest-filesystems
* kselftest-filesystems-binderfs
* kselftest-filesystems-epoll
* kselftest-firmware
* kselftest-fpu
* kselftest-ftrace
* kselftest-futex
* kselftest-gpio
* kselftest-intel_pstate
* kselftest-ipc
* kselftest-kcmp
* kselftest-kvm
* kselftest-livepatch
* kselftest-membarrier
* kselftest-memfd
* kselftest-mincore
* kselftest-mqueue
* kselftest-net
* kselftest-net-mptcp
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-rust
* kselftest-seccomp
* kselftest-sigaltstack
* kselftest-size
* kselftest-tc-testing
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-watchdog
* kselftest-x86
* kunit
* kvm-unit-tests
* libgpiod
* libhugetlbfs
* log-parser-boot
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org

