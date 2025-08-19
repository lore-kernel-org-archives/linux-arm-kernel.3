Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C13CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Tie29oHnSkpqRj0PkQrVbAiuDpnacf08DzUmAHW7uY=; b=Vlui03rmmMaLSP5sib5UYYnPza
	0yKY4A8Z2q508ErELzbfWdC5I1oWI2qNL7L1/Bt3ILBj0aDzUBDEzCXFAemNbgyf/P8TmqZkP/8gh
	HYEEzPQYrrUZEnDlj/9nCn807jxWFLiLQQzDhLtMgbvsS0Oz7BWgjz+1iZ/vRUr1LYl3s/qMxcV14
	OlghYGzENkwMnCRpZcWcO4lhJBXGVo/5u7wLpy1acyjM85myRXlqMDNzJO3Wu5thEwQf8znVog8V2
	a1I72SzA9VwZAh6wcz8fKOwN9KxH6x4IxHgRu1uPXYrjunkOxwGLfmZrg2Mp4lAGOvIdJAbyRRpDl
	t6u41Puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKqQ-0000000AL2e-0CCg;
	Tue, 19 Aug 2025 11:49:38 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJBA-0000000A47e-0Vh7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:02:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b47174c8e45so4577728a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597775; x=1756202575; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Tie29oHnSkpqRj0PkQrVbAiuDpnacf08DzUmAHW7uY=;
        b=Ey8NYBRfsqpaqDn6RO8xTINWfk9JIpFObNDyQDfbY1Q0P8DNq0EXBBKh6I+QMKHVeW
         wVU6EfFEHgbM+ytVdLQVfhhK+hdnipUkdq9AbUglfCsmStpSzK4kmS5z+Is99AAPD5YR
         T7TAQ07vPM2WKpFrJJMAHyrr8lR3+yYKJ+jIZeTX74Jfq98dBcrkYCD4bV8/Bv+SI01i
         4SrSIa05mstecFvM5aQD+ZoX5IbqEK0DVy3KdSTTPWcJFXrpuU9awWdYxmMtiN/ijMsK
         hIwGaxeAWL9rbWY309zvfB+MCaIkfiZqYNGdRSPPt1gXAKrVV1WNeywGN1NcmtjSsIDo
         wBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597775; x=1756202575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Tie29oHnSkpqRj0PkQrVbAiuDpnacf08DzUmAHW7uY=;
        b=LZJtqA0pH8AukTMoCxbLzfnvW8kJNcWLfPbU695YRBdXpqfZe5ed85wdxVqpMbY/DB
         BHDczY32TGMxff8P5wl4D7SYAjaR4qyQM/lT3mNzz2i7WRJiWhh1f6vQzBCMRX9thcQa
         10I0JTbfTOJgtvqjKrXcLDTl0Ee0jSp1wm0K7ygDT3qphiP46QolDRh77VG6bMCKsuhK
         4YGBjjLa5BwN1cLOIOD0n2JKSHGG83+HSeRF0yx01TKeqB5FMPncT0ceh6+kVHBY7ri1
         4CkQp2QedoIsdgkTF4amqfuae31kJ4uu7eMNKboCCbnyRPo8fID7VvZZUuaJyxFpPpJM
         Chow==
X-Forwarded-Encrypted: i=1; AJvYcCUWuWU55n2BEzkuRkVC0RCCFT2V5aW6FfsWXOqr7qHptf+cgwi7PE2gR9DT3pgY5tPTIYMzfBJa1boXmNSQncD1@lists.infradead.org
X-Gm-Message-State: AOJu0YzGH05ksvoKx0inpJi+XGs314FyVaM2nI88/S8D5Ghsf2SZQU6N
	9Cy6I1kmoGlnmb1k1nd5JOe3RquNYL97DvS4sYNbsU/2UJX0IXmwdfLVXo1/VKapTVPX9xaYVZp
	sJog+zSOteuK6ejH7bbzyNsAg2xPJ16lntlVT0O2C8Q==
X-Gm-Gg: ASbGncs4DlT7MAxwEERm/52SGa6Vc3sDWdxhddWb9xiyZck5oTt2FZy9RUIm+GVHH2B
	pWN4X1QDxT+cL7iRUoR9bGSjgsjZdzSfe4S1XTgiU4jNqy/DARqV1meWmTBdmY9kno7/fWm5uwr
	gMaMX67lJyKPHGdi+QkiRKWRGah3sqb2HcSHNZoNGU5holpG8tfCrA5r9cvfadfOTzMsTO3NYOi
	ypzFb/1D5ZhDWAUKCHQGJ4UAaxUrfj+0FoOZk4j
X-Google-Smtp-Source: AGHT+IH1qxD/L9DxRM8R/fDvVjrbOUmUPO9iHU2aUwxAmMLh4FdPNuZ8L5bEMDEdaSHPM/UEntNsAe2gMB9oyWpHlZM=
X-Received: by 2002:a17:903:37ce:b0:240:4b3b:334f with SMTP id
 d9443c01a7336-245e04926b5mr28060595ad.34.1755597775110; Tue, 19 Aug 2025
 03:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org> <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
In-Reply-To: <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 19 Aug 2025 15:32:42 +0530
X-Gm-Features: Ac12FXz6P-B_kAS475NZwJ3Ob5a2gv9_oBn8wEtJFzyE39LwJZxKuVFTST5CNfg
Message-ID: <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250819_030256_163436_016A2176 
X-CRM114-Status: GOOD (  28.43  )
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

On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Mon, 18 Aug 2025 at 18:45, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.15.11 release.
> > There are 515 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Wed, 20 Aug 2025 12:43:43 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.15.11-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.15.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> Boot regression occurs on the Qualcomm DragonBoard 410c (arm64) with
> stable-rc 6.15.11-rc1. The kernel crashes during early boot with a
> NULL pointer dereference in the Qualcomm SCM/TZMEM subsystem.
>
> The crash originates in qcom_scm_shm_bridge_enable()
> (drivers/firmware/qcom/qcom_scm.c:1618) and is invoked by
> qcom_tzmem_enable() (drivers/firmware/qcom/qcom_tzmem.c:97 and :474).
> This happens while probing SCM during platform initialization, preventing
> the board from reaching userspace due to kernel panic.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> Unable to handle kernel NULL pointer dereference
> qcom_scm_shm_bridge_enable

I have reverted the following patch and the regression got fixed.

firmware: qcom: scm: initialize tzmem before marking SCM as available
    [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]


>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Test log oom03
> [    1.191790] scmi_core: SCMI protocol bus registered
> [    1.194074] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    1.198306] Mem abort info:
> [    1.207295]   ESR = 0x0000000096000004
> [    1.209796]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.213635]   SET = 0, FnV = 0
> [    1.219095]   EA = 0, S1PTW = 0
> [    1.221945]   FSC = 0x04: level 0 translation fault
> [    1.225004] Data abort info:
> [    1.229874]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    1.232977]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    1.238286]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    1.243409] [0000000000000000] user address but active_mm is swapper
> [    1.248798] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    1.255110] Modules linked in:
> [    1.260744] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.15.11-rc1 #1 PREEMPT
> [    1.263622] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [    1.271517] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.278199] pc : qcom_scm_shm_bridge_enable
> (drivers/firmware/qcom/qcom_scm.c:1618)
> [    1.284878] lr : qcom_tzmem_enable
> (drivers/firmware/qcom/qcom_tzmem.c:97
> drivers/firmware/qcom/qcom_tzmem.c:474)
> [    1.290085] sp : ffff80008002b720
> [    1.294508] x29: ffff80008002b7b0 x28: 0000000000000000 x27: 0000000000000000
> [    1.297819] x26: 0000000000000000 x25: 0000000000000000 x24: ffff00003faf6128
> [    1.304937] x23: ffff00003fac6c68 x22: 0000000000000000 x21: ffff0000036ba410
> [    1.312055] x20: ffff0000036ba400 x19: ffff8000831a4000 x18: 0000000000000352
> [    1.319173] x17: 0000000000000000 x16: 0000000000000001 x15: 0000000000000002
> [    1.326292] x14: ffffffffffffffff x13: 0000000000000000 x12: 0000000000000002
> [    1.333410] x11: 0000000000000000 x10: 0000000000000019 x9 : ffff8000813e6d74
> [    1.340527] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff35302f37
> [    1.347645] x5 : 8080808000000000 x4 : 0000000000000020 x3 : 0000000000000010
> [    1.354763] x2 : 000000000000001c x1 : 000000000000000c x0 : 0000000000000000
> [    1.361882] Call trace:
> [    1.368986] qcom_scm_shm_bridge_enable
> (drivers/firmware/qcom/qcom_scm.c:1618) (P)
> [    1.371251] qcom_tzmem_enable
> (drivers/firmware/qcom/qcom_tzmem.c:97
> drivers/firmware/qcom/qcom_tzmem.c:474)
> [    1.376455] qcom_scm_probe (drivers/firmware/qcom/qcom_scm.c:2256)
> [    1.380534] platform_probe (drivers/base/platform.c:1405)
> [    1.384180] really_probe (drivers/base/dd.c:581)
> [    1.387998] __driver_probe_device (drivers/base/dd.c:?)
> [    1.391647] driver_probe_device (drivers/base/dd.c:829)
> [    1.395987] __driver_attach (drivers/base/dd.c:1216)
> [    1.399978] bus_for_each_dev (drivers/base/bus.c:369)
> [    1.403798] driver_attach (drivers/base/dd.c:1233)
> [    1.407965] bus_add_driver (drivers/base/bus.c:679)
> [    1.411523] driver_register (drivers/base/driver.c:250)
> [    1.415083] __platform_driver_register (drivers/base/platform.c:867)
> [    1.418905] qcom_scm_init (drivers/firmware/qcom/qcom_scm.c:2362)
> [    1.423763] do_one_initcall (init/main.c:1257)
> [    1.427409] do_initcall_level (init/main.c:1318)
> [    1.430969] do_initcalls (init/main.c:1332)
> [    1.435134] do_basic_setup (init/main.c:1355)
> [    1.438434] kernel_init_freeable (init/main.c:1571)
> [    1.442254] kernel_init (init/main.c:1459)
> [    1.446593] ret_from_fork (arch/arm64/kernel/entry.S:865)
> [ 1.449810] Code: a905ffff a904ffff a903ffff f9001bff (f9400100)
> All code
> ========
>    0: a905ffff stp xzr, xzr, [sp, #88]
>    4: a904ffff stp xzr, xzr, [sp, #72]
>    8: a903ffff stp xzr, xzr, [sp, #56]
>    c: f9001bff str xzr, [sp, #48]
>   10:* f9400100 ldr x0, [x8] <-- trapping instruction
>
> Code starting with the faulting instruction
> ===========================================
>    0: f9400100 ldr x0, [x8]
> [    1.453637] ---[ end trace 0000000000000000 ]---
> [    1.459661] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    1.464318] SMP: stopping secondary CPUs
> [    1.471696] ---[ end Kernel panic - not syncing: Attempted to kill
> init! exitcode=0x0000000b ]---
>
> Please refer full test log information in the below links.
>
> ## Source
> * Kernel version: 6.15.11-rc1
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> * Git describe: v6.15.9-993-g1cf711608500
> * Git commit: 1cf71160850064e9e506eda37e0386948bedd6b4
> * Architectures: arm64 Dragonboard 410c
> * Toolchains: gcc-13, clang-20
> * Kconfigs: defconfig+lkft
>
> ## Test
> * Boot log: https://qa-reports.linaro.org/api/testruns/29589408/log_file/
> * Boot lava log: https://lkft.validation.linaro.org/scheduler/job/8407660#L2708
> * Boot details:
> https://regressions.linaro.org/lkft/linux-stable-rc-linux-6.15.y/v6.15.9-993-g1cf711608500/log-parser-boot/panic-multiline-kernel-panic-not-syncing-attempted-to-kill-init-exitcode/
> * Boot plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/31SjnwYvj7Mmcay6Qa54CFbNfP9
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/31SjkxSlW3Ssjf1eGdFHJPPU4Yw/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/31SjkxSlW3Ssjf1eGdFHJPPU4Yw/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh

