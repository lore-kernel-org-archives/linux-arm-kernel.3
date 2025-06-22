Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBE3C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 08:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BLU3t4043mrGl729/s9rPu+SBgK5zQF6oZKqSHqOcQ=; b=v8CjP0lkfWvawaJ64HlzEoVBjj
	x/7gY0iCYjVDQKgtoBsIa5Uqj6V+OTVkOrkWxldUMR152DOw+/qnt+KTg6/PCvQfjVg9tS3HXahGp
	nplMYksCTNse9TfS5STyQ7atpAoyvNSigLjuumoCUNzi/nuGEYUExU0yFTjyL2mTsxhKgehOAiObr
	NmCEAtEl8bCSHj8s/6VsQMxenDLq/XcCvwcJ1r8i5KvHMufwskqAfHBnS+nZwJk/2dbR4QjL89EyP
	1XzhahJltHLFfj126MwkMMdZQcw+ssYgplIgo2vmvpeRZ7TEGj1LVP4ft7Z7FQcIl/Z7eUPibdV4J
	ZjOw1uBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGTh-00000000e6V-4BM2;
	Sun, 22 Jun 2025 08:55:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTGRR-00000000dx7-0YPH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 08:52:47 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so2527480a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Jun 2025 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750582364; x=1751187164; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9BLU3t4043mrGl729/s9rPu+SBgK5zQF6oZKqSHqOcQ=;
        b=wA7HqxFRU21AH4oForiHdlbdW+g5xAGDzgmJ3v9PTYJGZiqX8tkFx/4fXWQVYmlb42
         ifqpRH7XoaVA9N53dI7fd8jQSXYfdBe7jSvxzAR3LGRigVJsmBSTelk5ABliuuDa+koR
         bwFgbb7WFTxqxUfAqGuJWxsPsko4F4Lu1KeCzj2SGLHMZWHA8iE98ZS518SXSuJ55UaG
         QDV2UxSKkS448ibc9HrdG4GRKts4iD/WxK35UFgE1YpPUnnIfhZGASzN9zFPNlil1qQW
         j6SYP5sSdXapusGPhU+zcJQ9GUrsGKWqL4w6vwSR0mI20FjLqjdRV565o6Z9axEi0AFr
         Eveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750582364; x=1751187164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BLU3t4043mrGl729/s9rPu+SBgK5zQF6oZKqSHqOcQ=;
        b=h4IwnwMXtE7MEHPITi54sQVhPnYURzoKI7YRXzn/WzuFhO726LROY7lROe6vNrBPML
         OpgmpDEJO24fehIaWcI+YV/klRFX8pMh+nrMbgwE8pIHcu6a2ZKAKRSTyq/fVgE7iLJk
         EreM0fj5Di1xheLt+4ERoCCJPi7KP2Q/IdepErMW/oOed7pjLIbSVRNKABFrAakCsSCo
         qaBxf7fIGq9ZrDo0m3FpbiPVGUOmYS/ZxFJvFSDD0tuLWmWIPxuis3TGpCdJMRZY9jEd
         3NdE4XSDlH7Ib25ZPHUF2Pad7g5S2HxlP7kCsisuFqZWnPBnjWJ+/OM6xg0+aneJVJfj
         ZyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPwV5sKQwCcz0pGK6ydePZKs4q5+r2SXiVlyAVL2MHtHoId6T9xjjhm9yFvVF0Wsknerc3jO7vWc0OrFTw5S76@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc0L/rPhAfHaMaAxUXRLyNsaqW29IlRWbpOBomxpQVARgXzCP4
	V15QDNrHeeE1oQV1HUKvU+79Ml4ktrqCaEA9eaATjITwR3fDBq0rXvy1dppRSFxXpZmXKGYC/xg
	huahMU7CYzhk2adpbI71tnk/4iZNQfWgR2HNLKLAWUg==
X-Gm-Gg: ASbGncv6dixft2/8H32eUXa2BLy25/hWCoGtSrGEbEjp2WRo/Ih8PqCSH/LPzj6fLX4
	6T/z25FpZC+EHNd04HA68JkDhlcbITrjUi7UAwlKoM9Jk/hGJk5UtrTHUcB6oaLmBFoVKwwDTQv
	o/XCduK96Rg68UbkCvWWir3g1NzDvEUu3lWMHBl/p2SOM=
X-Google-Smtp-Source: AGHT+IH/IL+sn0J++VuMFMn3Ssy6xh6L2w/TOmmo99fhFEdAfQ+RuuiEvSWikY/C09uHY+qA3p3zTm8mZa3KAWOuEhE=
X-Received: by 2002:a17:90b:3802:b0:312:e8ed:758 with SMTP id
 98e67ed59e1d1-3159d64cb4cmr14736419a91.13.1750582363640; Sun, 22 Jun 2025
 01:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuOnfvm7N0pa=PNvq=tQsp6CVA34eDq5=rGthEBrdMJuQ@mail.gmail.com>
 <e392a025-2417-4df8-b3f6-853a33cc8fe2@quicinc.com>
In-Reply-To: <e392a025-2417-4df8-b3f6-853a33cc8fe2@quicinc.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 22 Jun 2025 14:22:31 +0530
X-Gm-Features: AX0GCFuwK_fLzRnHAMONJfy4_7WQeRpvuzgRntsj1bgnXdNdU52-Ai9emdo908o
Message-ID: <CA+G9fYuFQ2dBvYm1iB6rbwT=4b1c8e4NJ3yxqFPGZGUKH3GmMA@mail.gmail.com>
Subject: Re: next-20250620: Qualcomm Dragonboard 845c Internal error Oops at ufs_qcom_setup_clocks
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-phy@lists.infradead.org, 
	linux-scsi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, konrad.dybcio@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_015245_191174_99062C76 
X-CRM114-Status: GOOD (  18.32  )
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

On Sat, 21 Jun 2025 at 22:45, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>
>
>
> On 6/21/2025 1:40 PM, Naresh Kamboju wrote:
> > Regressions noticed on the Qualcomm Dragonboard 845c device while booting the
> > Linux next tags from next-20250616..next-20250620 the following kernel oops
> > noticed and boot failed.
> >
> > Regressions found on Thundercomm Dragonboard 845c (DT)
> > - Boot
> >
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? Yes
> >
> > First seen on the next-20250616
> > Good: next-20250613
> > Bad:  next-20250616
> >
> > Boot regression: Qualcomm Dragonboard 845c Internal error Oops at
> > ufs_qcom_setup_clocks
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
>
> Hi Naresh,
>
> Thanks for testing and reporting this issue. Can you please
> test with the attached fix and let me know if it helps.

The attached patch applied on top of the Linux next and
boot test pass and also LTP smoke runs smooth.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot test pass LAVA test jobs runs links,
- https://lkft.validation.linaro.org/scheduler/job/8324919#L5075
- https://lkft.validation.linaro.org/scheduler/job/8324918#L5105
 - https://lkft.validation.linaro.org/scheduler/job/8324917#L5120

- Naresh

>
> Regards,
> Nitin
>
>
> >
> > ## Boot log
> > [    6.446825] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable
> > to find vccq2-supply regulator, assuming enabled
> > [    6.448070] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000000000000000
> > [    6.448080] Mem abort info:
> > [    6.448086]   ESR = 0x0000000096000006
> > [    6.448093]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [    6.448101]   SET = 0, FnV = 0
> > [    6.448107]   EA = 0, S1PTW = 0
> > [    6.448113]   FSC = 0x06: level 2 translation fault
> > [    6.448120] Data abort info:
> > [    6.448125]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
> > [    6.448132]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [    6.448139]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [    6.448146] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010447b000
> > [    6.448154] [0000000000000000] pgd=080000010447d403,
> > p4d=080000010447d403, pud=080000010447e403, pmd=0000000000000000
> > [    6.448186] Internal error: Oops: 0000000096000006 [#1]  SMP
> > [    6.448193] Modules linked in: qcom_q6v5_mss(+) ufs_qcom(+)
> > cfg80211(+) coresight_stm stm_core phy_qcom_qmp_pcie rfkill qcom_wdt
> > lmh(+) icc_osm_l3 qrtr slim_qcom_ngd_ctrl slimbus pdr_interface
> > qcom_pdr_msg icc_bwmon qcom_q6v5_pas(+) llcc_qcom qcom_pil_info
> > display_connector qcom_q6v5 qcom_sysmon drm_kms_helper qcom_common
> > qcom_glink_smem mdt_loader qmi_helpers drm backlight socinfo rmtfs_mem
> > [    6.448278] CPU: 6 UID: 0 PID: 385 Comm: (udev-worker) Not tainted
> > 6.16.0-rc2-next-20250620 #1 PREEMPT
> > [    6.448288] Hardware name: Thundercomm Dragonboard 845c (DT)
> > [    6.448292] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    6.448299] pc : ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom
> > [    6.448317] lr : ufshcd_setup_clocks
> > (drivers/ufs/core/ufshcd-priv.h:142 drivers/ufs/core/ufshcd.c:9290)
> > [    6.448332] sp : ffff800081213640
> > [    6.448335] x29: ffff800081213640 x28: 0000000000000001 x27: ffff00008b633270
> > [    6.448347] x26: ffff00008b6332a0 x25: ffff00008b632870 x24: 0000000000000000
> > [    6.448359] x23: ffff00008b633280 x22: ffff00008b6332a0 x21: 0000000000000000
> > [    6.448369] x20: ffffd7eabf84d618 x19: ffff00008b632870 x18: 0000000000000000
> > [    6.448380] x17: 5453595342555300 x16: 305f666d745f6973 x15: 0000000000000100
> > [    6.448391] x14: ffffffffffffffff x13: 0000000000000030 x12: 0101010101010101
> > [    6.448402] x11: ffff00008188ea18 x10: 0000000000000000 x9 : ffffd7eabd9c3c28
> > [    6.448413] x8 : ffff8000812134b8 x7 : fefefefefefefefe x6 : 0000000000000001
> > [    6.448423] x5 : ffffffffffffffc8 x4 : 00000000c0000000 x3 : ffffd7eab32aa058
> > [    6.448433] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff00008b632870
> > [    6.448444] Call trace:
> > [    6.448449] ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
> > [    6.448466] ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142
> > drivers/ufs/core/ufshcd.c:9290)
> > [    6.448477] ufshcd_init (drivers/ufs/core/ufshcd.c:9468
> > drivers/ufs/core/ufshcd.c:10636)
> > [    6.448485] ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
> > [    6.448495] ufs_qcom_probe+0x28/0x68 ufs_qcom
> > [    6.448508] platform_probe (drivers/base/platform.c:1404)
> > [    6.448519] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
> > [    6.448526] __driver_probe_device (drivers/base/dd.c:799)
> > [    6.448532] driver_probe_device (drivers/base/dd.c:829)
> > [    6.448539] __driver_attach (drivers/base/dd.c:1216)
> > [    6.448545] bus_for_each_dev (drivers/base/bus.c:370)
> > [    6.448556] driver_attach (drivers/base/dd.c:1234)
> > [    6.448567] bus_add_driver (drivers/base/bus.c:678)
> > [    6.448577] driver_register (drivers/base/driver.c:249)
> > [    6.448584] __platform_driver_register (drivers/base/platform.c:868)
> > [    6.448592] ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
> > [    6.448605] do_one_initcall (init/main.c:1274)
> > [    6.448615] do_init_module (kernel/module/main.c:3041)
> > [    6.448626] load_module (kernel/module/main.c:3511)
> > [    6.448635] init_module_from_file (kernel/module/main.c:3704)
> > [    6.448644] __arm64_sys_finit_module (kernel/module/main.c:3715
> > kernel/module/main.c:3741 kernel/module/main.c:3725
> > kernel/module/main.c:3725)
> > [    6.448653] invoke_syscall (arch/arm64/include/asm/current.h:19
> > arch/arm64/kernel/syscall.c:54)
> > [    6.448661] el0_svc_common.constprop.0
> > (include/linux/thread_info.h:135 (discriminator 2)
> > arch/arm64/kernel/syscall.c:140 (discriminator 2))
> > [    6.448668] do_el0_svc (arch/arm64/kernel/syscall.c:152)
> > [    6.448674] el0_svc (arch/arm64/include/asm/irqflags.h:82
> > (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
> > 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:165 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:178 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:768 (discriminator 1))
> > [    6.448685] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:787)
> > [    6.448694] el0t_64_sync (arch/arm64/kernel/entry.S:600)
> > [ 6.448705] Code: a90157f3 aa0003f3 f90013f6 f9405c15 (f94002b6)
> > All code
> > ========
> >     0: a90157f3 stp x19, x21, [sp, #16]
> >     4: aa0003f3 mov x19, x0
> >     8: f90013f6 str x22, [sp, #32]
> >     c: f9405c15 ldr x21, [x0, #184]
> >    10:* f94002b6 ldr x22, [x21] <-- trapping instruction
> >
> > Code starting with the faulting instruction
> > ===========================================
> >     0: f94002b6 ldr x22, [x21]
> > [    6.448710] ---[ end trace 0000000000000000 ]---
> >
> > ## Source
> > * Kernel version: 6.16.0-rc2-next-20250620
> > * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> > * Git sha: 2c923c845768a0f0e34b8161d70bc96525385782
> > * Git describe: next-20250620
> > * Project details:
> > https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250620/
> > * Architectures: arm64 Dragonboard 845c
> > * Toolchains: gcc-13
> > * Kconfigs: defconfig+lkfttestconfigs
> >
> > ## Build arm64
> > * Test log: https://qa-reports.linaro.org/api/testruns/28811906/log_file/
> > * Test Lava log: https://lkft.validation.linaro.org/scheduler/job/8323501#L5646
> > * Test Lava log 2:
> > https://lkft.validation.linaro.org/scheduler/job/8323351#L5682
> > * Test details:
> > https://regressions.linaro.org/lkft/linux-next-master/next-20250620/boot/gcc-13-lkftconfig/
> > * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yj4otvwBRT4UktLTyKEN8ZtUQm/
> > * Kernel config:
> > https://storage.tuxsuite.com/public/linaro/lkft/builds/2yj4otvwBRT4UktLTyKEN8ZtUQm/config
> >
> > --
> > Linaro LKFT
> > https://lkft.linaro.org

