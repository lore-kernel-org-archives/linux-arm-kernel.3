Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98F0CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1Na1G1GEfTB1Z7+rFe2hu/qJ/LK+DYFvyX3BQfjabc=; b=MF61p/w+TU+QyiAAoRDggHSJcR
	tCCbiKBSedLie+Psfrvyv55I/u5IPUPvedntvUs282miqK6ntIxgUCWCUfkI5hIhClDR0oNX+GZ2B
	sVkZp+pYH4Bc/4b/0PpaSNd6JVMXflh649dnYnLtzzNWV29vN1mCDjAljl7SLKmFQwFxA0Q9M08S9
	Fo0vma3DNAgqvzQSC1/S5k5VFROJh9MkTwFJFXDLQFvy8gq42X0laxitKcg8MqCPfiLJkL4uEDp9O
	SOifYbBjxuJpW+WFevA3EglDd8V3n+X9lZQJr/21dMxiLgPHGvvcy63xKPFEF400kAbv7VdxtvVAg
	SfUGSNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5PL-00000008V3T-4C02;
	Mon, 18 Aug 2025 19:20:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4uU-00000008P0R-1c8a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:48:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2445811e19dso35147445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 11:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755542925; x=1756147725; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O1Na1G1GEfTB1Z7+rFe2hu/qJ/LK+DYFvyX3BQfjabc=;
        b=XevXCRNVREUOZK8iGE6GTsfZCH3CeXOV0cEOLlQMB9M5Q0h/PVQPTFr0+gMRvgWAOb
         i7Zu0so6rTipWXB82/3b1znizJL7g+uGvWVV6Jz84OL0qPh1XUnbBmpbqG2N+bC8YBmk
         NEDkjuU5AIETcLAFEelX4mKPn81yoL/jBInl+AoeS3KZuFXmUwu2ZCwxjjDyLldWodLg
         8OJaPfH3rPKqw0Hrl0B0p7llJAVPb8tYaq8T4yzxGJ42L1rnG1wN59qBp2tL1tG1mMrw
         l+JEQ0onBqGr8LrxMVkw4Ik88f45Gcpgrq7T42mulJsMUZPdzv2jzyk6+w2BAul07NHS
         bDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755542925; x=1756147725;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1Na1G1GEfTB1Z7+rFe2hu/qJ/LK+DYFvyX3BQfjabc=;
        b=QOklk6gTcfuMjWRHY/a5YTPXC7uBWscwOtJxHyZQAsgHDs8v6TFnMvs+dPy1DX5QWo
         f0F+mXs+VMmh0d3TT7h01cyV14oGhgOaIPRnlOTzdkI221/kvgKZn22meaU7NeGcyYR/
         10UijkIw067yXhIBmcX2F+bO3RBVjDdI329GiMGNU0va91LXSUonZL+hLf/hfEKNgH0U
         l197r+IlVyMfl0ECPXYinfsYS7inUyeAJ7H2fD9Zz2LDDPWOQ66P9VPiUyABhq1AjGoj
         f1Y+zZWyVMrtElZFDFZOSUHYZNuWJDlw4iQ8RiQ/ZlAZKM/8/BBYWUDPhVN2gRK+FJie
         N7/A==
X-Forwarded-Encrypted: i=1; AJvYcCWYHx/aapXXpNbWeE0DpsUVTPv9jy+5t41zjvumFzfsexpXEUB03ZsBen6UBAapUTUVV2D1A/bw+LTKgv/yD6+J@lists.infradead.org
X-Gm-Message-State: AOJu0YxrOA5VwtjA8wR2oUAFm6Vqi2VEEqN6PAUrwx+TEppRsQbDLE2D
	5YiMX3LcWjY64W2HFiTmCaEgl0BnefmUV2yoYYBdOnfuTR5Jw0yVE/k2yXbcN+JnrnVsZWEPino
	ufTI47MD8qFwene89my/TOHhTHGte8adSSk8kU1OkFA==
X-Gm-Gg: ASbGncsr8FzH1uPxSzaybDudMwW5mBHMeBk+ILB4pPXcvEK6XWb8B+rGbMRR+wbfs8k
	Z4/XyLH1mMCwdVRj5+ZleK+woqjcNbU2EJA2p9XWV3pGpigh35pz9Gxz4/ktfyl7iToDpD37lQl
	pRz5u/X0uWN9M4956ruWSmu9hCbP9QacXWT3AlECh2vIyBatzjEa0Bgz7pkxhYVbtZ3C9vnUcDR
	K/hrO9aUjkje4bNW83+cVk2hMVUVc3kHQjPd9qa9djI5Zee6QI=
X-Google-Smtp-Source: AGHT+IHmOMJz7nCYS/tZ+DC/rzqutFB5PsuRPGV79kAw2iKn1BK0MGU5HrYZKUaPZJ8Wp385fx6Fyv1c//DR81jG32o=
X-Received: by 2002:a17:902:f78a:b0:240:84b:a11a with SMTP id
 d9443c01a7336-2449cf43f7fmr5618825ad.17.1755542925263; Mon, 18 Aug 2025
 11:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org>
In-Reply-To: <20250818124458.334548733@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Aug 2025 00:18:33 +0530
X-Gm-Features: Ac12FXy3q6ijpYJlZM9lDBDRg0-eeJWhMQBu6-QX-xroiq3SJXWRlW-B4Umf5T8
Message-ID: <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, achill@achill.org, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, srinivas.kandagatla@oss.qualcomm.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_114846_463187_613D0131 
X-CRM114-Status: GOOD (  21.09  )
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

On Mon, 18 Aug 2025 at 18:45, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.11 release.
> There are 515 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 20 Aug 2025 12:43:43 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.11-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Boot regression occurs on the Qualcomm DragonBoard 410c (arm64) with
stable-rc 6.15.11-rc1. The kernel crashes during early boot with a
NULL pointer dereference in the Qualcomm SCM/TZMEM subsystem.

The crash originates in qcom_scm_shm_bridge_enable()
(drivers/firmware/qcom/qcom_scm.c:1618) and is invoked by
qcom_tzmem_enable() (drivers/firmware/qcom/qcom_tzmem.c:97 and :474).
This happens while probing SCM during platform initialization, preventing
the board from reaching userspace due to kernel panic.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
Unable to handle kernel NULL pointer dereference
qcom_scm_shm_bridge_enable

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log oom03
[    1.191790] scmi_core: SCMI protocol bus registered
[    1.194074] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[    1.198306] Mem abort info:
[    1.207295]   ESR = 0x0000000096000004
[    1.209796]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.213635]   SET = 0, FnV = 0
[    1.219095]   EA = 0, S1PTW = 0
[    1.221945]   FSC = 0x04: level 0 translation fault
[    1.225004] Data abort info:
[    1.229874]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    1.232977]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    1.238286]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    1.243409] [0000000000000000] user address but active_mm is swapper
[    1.248798] Internal error: Oops: 0000000096000004 [#1]  SMP
[    1.255110] Modules linked in:
[    1.260744] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.15.11-rc1 #1 PREEMPT
[    1.263622] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    1.271517] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.278199] pc : qcom_scm_shm_bridge_enable
(drivers/firmware/qcom/qcom_scm.c:1618)
[    1.284878] lr : qcom_tzmem_enable
(drivers/firmware/qcom/qcom_tzmem.c:97
drivers/firmware/qcom/qcom_tzmem.c:474)
[    1.290085] sp : ffff80008002b720
[    1.294508] x29: ffff80008002b7b0 x28: 0000000000000000 x27: 0000000000000000
[    1.297819] x26: 0000000000000000 x25: 0000000000000000 x24: ffff00003faf6128
[    1.304937] x23: ffff00003fac6c68 x22: 0000000000000000 x21: ffff0000036ba410
[    1.312055] x20: ffff0000036ba400 x19: ffff8000831a4000 x18: 0000000000000352
[    1.319173] x17: 0000000000000000 x16: 0000000000000001 x15: 0000000000000002
[    1.326292] x14: ffffffffffffffff x13: 0000000000000000 x12: 0000000000000002
[    1.333410] x11: 0000000000000000 x10: 0000000000000019 x9 : ffff8000813e6d74
[    1.340527] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff35302f37
[    1.347645] x5 : 8080808000000000 x4 : 0000000000000020 x3 : 0000000000000010
[    1.354763] x2 : 000000000000001c x1 : 000000000000000c x0 : 0000000000000000
[    1.361882] Call trace:
[    1.368986] qcom_scm_shm_bridge_enable
(drivers/firmware/qcom/qcom_scm.c:1618) (P)
[    1.371251] qcom_tzmem_enable
(drivers/firmware/qcom/qcom_tzmem.c:97
drivers/firmware/qcom/qcom_tzmem.c:474)
[    1.376455] qcom_scm_probe (drivers/firmware/qcom/qcom_scm.c:2256)
[    1.380534] platform_probe (drivers/base/platform.c:1405)
[    1.384180] really_probe (drivers/base/dd.c:581)
[    1.387998] __driver_probe_device (drivers/base/dd.c:?)
[    1.391647] driver_probe_device (drivers/base/dd.c:829)
[    1.395987] __driver_attach (drivers/base/dd.c:1216)
[    1.399978] bus_for_each_dev (drivers/base/bus.c:369)
[    1.403798] driver_attach (drivers/base/dd.c:1233)
[    1.407965] bus_add_driver (drivers/base/bus.c:679)
[    1.411523] driver_register (drivers/base/driver.c:250)
[    1.415083] __platform_driver_register (drivers/base/platform.c:867)
[    1.418905] qcom_scm_init (drivers/firmware/qcom/qcom_scm.c:2362)
[    1.423763] do_one_initcall (init/main.c:1257)
[    1.427409] do_initcall_level (init/main.c:1318)
[    1.430969] do_initcalls (init/main.c:1332)
[    1.435134] do_basic_setup (init/main.c:1355)
[    1.438434] kernel_init_freeable (init/main.c:1571)
[    1.442254] kernel_init (init/main.c:1459)
[    1.446593] ret_from_fork (arch/arm64/kernel/entry.S:865)
[ 1.449810] Code: a905ffff a904ffff a903ffff f9001bff (f9400100)
All code
========
   0: a905ffff stp xzr, xzr, [sp, #88]
   4: a904ffff stp xzr, xzr, [sp, #72]
   8: a903ffff stp xzr, xzr, [sp, #56]
   c: f9001bff str xzr, [sp, #48]
  10:* f9400100 ldr x0, [x8] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9400100 ldr x0, [x8]
[    1.453637] ---[ end trace 0000000000000000 ]---
[    1.459661] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    1.464318] SMP: stopping secondary CPUs
[    1.471696] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Please refer full test log information in the below links.

## Source
* Kernel version: 6.15.11-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git describe: v6.15.9-993-g1cf711608500
* Git commit: 1cf71160850064e9e506eda37e0386948bedd6b4
* Architectures: arm64 Dragonboard 410c
* Toolchains: gcc-13, clang-20
* Kconfigs: defconfig+lkft

## Test
* Boot log: https://qa-reports.linaro.org/api/testruns/29589408/log_file/
* Boot lava log: https://lkft.validation.linaro.org/scheduler/job/8407660#L2708
* Boot details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.15.y/v6.15.9-993-g1cf711608500/log-parser-boot/panic-multiline-kernel-panic-not-syncing-attempted-to-kill-init-exitcode/
* Boot plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/31SjnwYvj7Mmcay6Qa54CFbNfP9
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31SjkxSlW3Ssjf1eGdFHJPPU4Yw/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/31SjkxSlW3Ssjf1eGdFHJPPU4Yw/config

--
Linaro LKFT
https://lkft.linaro.org

