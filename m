Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163E4C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V879Iy5VcztBBIWmczzB/FWi9rCG1hoQENLoZiXnBvA=; b=JPU+Zdmoe6xsZO7yxF81VoWHgj
	XVJeH2z+4uNC4r1YWQXlykuHRkc6uJiYHz5eIrtNWPAtzM0VuShiTqtgtY0ywfOpcxM767qsMXE9V
	wN9vcieRL9DxyHTGtMAF0aE6bs/Go2Muxv8dedoMvyfi2ABo45IaYuwC6PD+wkdeHY8gXk1QQuBp9
	6yiSKA8TM+TA50AkZmN2DtiERrh+kMIFlp+qqL0r9R6B8vd6HJetZtM1l2hwExredLGx8/Ll9M3uS
	3UJlA5AnmrTtEmHT30HJY4yQGxXW3BNWsiYvvdAwiqDwXUyJN1341dGYH1pVpQawfbN9FzHmbFj0h
	K5T8njUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9I3-00000001pNw-3SZS;
	Thu, 20 Feb 2025 16:20:43 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9BD-00000001nBp-1yYf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:13:40 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-868f322b8dfso711347241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 08:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068018; x=1740672818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V879Iy5VcztBBIWmczzB/FWi9rCG1hoQENLoZiXnBvA=;
        b=O9WRNh3H32TSNDvcus8AbEGiy+wkiuua+G2RzZhLKXhab5YOxGnKGUefvdM1s61sxM
         +8MITGULNOdadXcIh1mVwTXnhwpPR7/wFd6D7SA9fqtcSUEnLJRwO5ISh0U2zHngmZ+9
         32/V6jyBRmN+IaU/pEDxQJcd5xkmCBCrSThRx2FQ6xoSeFCBaP59U9ivgNMSDDRC1y27
         fU/r8UvGpbHa5+V2ypeuLQDC9Sc1H5uqQ8Z6ch/YzemY3FND4vTs85HQHbjsYYhdWk3V
         puyCTEBQBGIH691KugIMIOZnD3wMxtcapaVN/qQxk0+FN/rS+zcFL9So5zp9jXcvFrX5
         +Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068018; x=1740672818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V879Iy5VcztBBIWmczzB/FWi9rCG1hoQENLoZiXnBvA=;
        b=eYHz2Gq54fUoHWBktqKUYdOysCjZsZl736GGEIBAN2S2EGqbtsjkiZr7xRYuBDrBzX
         nKRWaGa0ZAj6bNEkEmpT4QwXT0Ye8hRMkvQc3fq+1wIfnm5Xr6taKcc9SgO6d/W8pPiK
         JMHZLXNhlpVOuR2AEawzTi37KgGCAUfFQ3i412vCjjGzjoHjhK/K9z2s2OvDGxk5XqJt
         bZcbm7tV/soLtF3AiYA+CWQvI73ti3I4hpPg0Y14/7aP8ue7FkWj6gnvztoXYlrbDOjC
         swsAe5ppx7twjlxyqADwTSRAdRtHg3Ulpc1UiedhkO7pxWWqEMRYH37H8C3cHEeHCaHC
         W2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhf798+l5rAPELRq76wW8L0PcoSlklO4Bw+g5LpSAw4ig8NLdciECFmDzaRQsb6ObKONH/I59SFm4BDDz2vFoC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3XoNfaq1tcEEYCK4BsiuzD3uMsHTGm5OZeNAUl6Cm4V2jmj+R
	S2TIzZtV1VZJZXyws7uIj+uHRCE2wnaQpOhThrYXxVLR1382Wek/RzwFIqGcg58iTNsjWAQ8KfE
	CX2whntlws5okMdM+G7yJmkAcxuvX+NqyyYbeHg==
X-Gm-Gg: ASbGnctVThkbCKEyqnjIisy1CwYm96FbkwGHzvn6WACCHer/5Vl1rve/zABEdmnjbBN
	FN/lgDqx1xQLmZscFInRwZ97e4noHumWINIIHYLhYBKKJFPW6C2pIKd4W2dzK0JVcn4wMfiltl3
	K4BLwt+GoarsTDS3WP8jfQ/JnsbQuSSA==
X-Google-Smtp-Source: AGHT+IFOiwZCl0rxvNfwH8m/y6qEhO2vlqH8zC1rbxAsDQ/BH7O5MpliguoeJImu0JZ1xu0+r0UbS2zjSMnKnLqd9RA=
X-Received: by 2002:a05:6122:17a7:b0:51e:ffd1:67f3 with SMTP id
 71dfb90a1353d-521dce38ba8mr2135245e0c.7.1740068018212; Thu, 20 Feb 2025
 08:13:38 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Feb 2025 21:43:26 +0530
X-Gm-Features: AWEUYZkFcm73g8zLPsZavQg0Lht5rrlBSiureL7_1d0H-gYUnSDy_oWi453RMyo
Message-ID: <CA+G9fYuVngeOP_t063LbiJ+8yf-f+5tRt-A3-Hj=_X9XmZ108w@mail.gmail.com>
Subject: next-20250218: arm64 LTP pids kernel panic loop_free_idle_workers
To: linux-block <linux-block@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	LTP List <ltp@lists.linux.it>
Cc: Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_081339_518990_D054F72E 
X-CRM114-Status: UNSURE (   9.49  )
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

Regression on qemu-arm64 the kernel panic noticed while running the
LTP controllers pids.sh test cases on Linux next 20250218 and started
from the next-20250214

Test regression: arm64 LTP pids kernel panic loop_free_idle_workers

Started noticing from next-20250214.
Good: next-20250213
Bad: next-20250213..next-20250218

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
---------
[    0.000000] Linux version 6.14.0-rc2-next-20250214
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 13.3.0-12) 13.3.0,
GNU ld (GNU Binutils for Debian) 2.43.90.20250127) #1 SMP PREEMPT
@1739528119
<trim>
command: pids.sh 6 50 0
<12>[  221.776255] /usr/local/bin/kirk[262]: starting test pids_6_50
(pids.sh 6 50 0)
pids 1 TINFO: Running: pids.sh 6 50 0
pids 1 TINFO: Tested kernel: Linux
runner-ykxhnyexq-project-40964107-concurrent-0
6.14.0-rc2-next-20250214 #1 SMP PREEMPT @1739528119 aarch64 GNU/Linux
pids 1 TINFO: ceiling LTP_TIMEOUT_MUL to 11
pids 1 TINFO: timeout per run is 0h 55m 0s
pids 1 TINFO: test starts with cgroup version 2
pids 1 TINFO: Running testcase 6 with 50 processes
pids 1 TINFO: set a limit that is smaller than current number of pids
<1>[  224.406844] Unable to handle kernel paging request at virtual
address dead000000000108
<1>[  224.407052] Mem abort info:
<1>[  224.407100]   ESR =3D 0x0000000096000044
<1>[  224.407219]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
<1>[  224.407315]   SET =3D 0, FnV =3D 0
<1>[  224.407400]   EA =3D 0, S1PTW =3D 0
<1>[  224.407459]   FSC =3D 0x04: level 0 translation fault
<1>[  224.407536] Data abort info:
<1>[  224.407577]   ISV =3D 0, ISS =3D 0x00000044, ISS2 =3D 0x00000000
<1>[  224.407621]   CM =3D 0, WnR =3D 1, TnD =3D 0, TagAccess =3D 0
<1>[  224.407697]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
<1>[  224.407809] [dead000000000108] address between user and kernel
address ranges
<0>[  224.408307] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
<4>[  224.416979] Modules linked in: btrfs blake2b_generic xor
xor_neon raid6_pq zstd_compress sm3_ce sm3 sha3_ce sha512_ce
sha512_arm64 fuse drm backlight ip_tables x_tables
<4>[  224.421352] CPU: 0 UID: 0 PID: 3368 Comm: pids_task2 Not tainted
6.14.0-rc2-next-20250214 #1
<4>[  224.422657] Hardware name: linux,dummy-virt (DT)
<4>[  224.423946] pstate: 224020c9 (nzCv daIF +PAN -UAO +TCO -DIT
-SSBS BTYPE=3D--)
<4>[ 224.424677] pc : loop_free_idle_workers (include/linux/list.h:195
include/linux/list.h:218 include/linux/list.h:229
drivers/block/loop.c:917)
<4>[ 224.426548] lr : loop_free_idle_workers (drivers/block/loop.c:911
(discriminator 2))
<4>[  224.427338] sp : ffff800080003d50
<4>[  224.427910] x29: ffff800080003d50 x28: fff238a88301c500 x27:
fff238a883084c00
<4>[  224.429587] x26: ffffa298bac57000 x25: ffffffffffffc568 x24:
dead000000000122
<4>[  224.430697] x23: fff238a880370ac8 x22: dead000000000100 x21:
0000000000000000
<4>[  224.432004] x20: fff238a880370ab8 x19: dead0000000000b8 x18:
ffff800083d9bb90
<4>[  224.432538] x17: fff296100496b000 x16: ffff800080000000 x15:
0000ffff8d0a9fff
<4>[  224.433866] x14: 0000000000000000 x13: 1ffe47151065cc61 x12:
fff238a8832e630c
<4>[  224.434769] x11: 003a9cb01550c679 x10: fff238a8bf4b7f70 x9 :
ffffa298b8fc3cd0
<4>[  224.436209] x8 : ffff800080003c28 x7 : 0000000000000101 x6 :
ffff800080003ce0
<4>[  224.437070] x5 : fff238a880eba680 x4 : dead000000000100 x3 :
dead000000000122
<4>[  224.438027] x2 : 0000000000000000 x1 : 00000000ffff50fc x0 :
00000000ffff7b68
<4>[  224.439174] Call trace:
<4>[ 224.439882] loop_free_idle_workers (include/linux/list.h:195
include/linux/list.h:218 include/linux/list.h:229
drivers/block/loop.c:917) (P)
<4>[ 224.440765] loop_free_idle_workers_timer (drivers/block/loop.c:932)
<4>[ 224.441223] call_timer_fn (arch/arm64/include/asm/jump_label.h:36
include/trace/events/timer.h:127 kernel/time/timer.c:1790)
<4>[ 224.441822] __run_timers (kernel/time/timer.c:1841
kernel/time/timer.c:2414)
<4>[ 224.442389] run_timer_base (kernel/time/timer.c:2427
kernel/time/timer.c:2418 kernel/time/timer.c:2435)
<4>[ 224.442855] run_timer_softirq
(arch/arm64/include/asm/jump_label.h:36 kernel/time/timer.c:342
kernel/time/timer.c:2448)
<4>[ 224.443547] handle_softirqs
(arch/arm64/include/asm/jump_label.h:36 include/trace/events/irq.h:142
kernel/softirq.c:562)
<4>[ 224.444121] __do_softirq (kernel/softirq.c:596)
<4>[ 224.444755] ____do_softirq (arch/arm64/kernel/irq.c:82)
<4>[ 224.445204] call_on_irq_stack (arch/arm64/kernel/entry.S:897)
<4>[ 224.445670] do_softirq_own_stack (arch/arm64/kernel/irq.c:87)
<4>[ 224.445964] __irq_exit_rcu (kernel/softirq.c:442 kernel/softirq.c:662)
<4>[ 224.446295] irq_exit_rcu (kernel/softirq.c:680)
<4>[ 224.446808] el1_interrupt (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/entry-common.c:280
arch/arm64/kernel/entry-common.c:563
arch/arm64/kernel/entry-common.c:575)
<4>[ 224.447585] el1h_64_irq_handler (arch/arm64/kernel/entry-common.c:581)
<4>[ 224.448079] el1h_64_irq (arch/arm64/kernel/entry.S:596)
<4>[ 224.448796] try_charge_memcg (mm/memcontrol.c:1803
mm/memcontrol.c:2222) (P)
<4>[ 224.449589] charge_memcg (mm/memcontrol.c:4541)
<4>[ 224.450399] __mem_cgroup_charge (include/linux/cgroup_refcnt.h:78
mm/memcontrol.c:4558)
<4>[ 224.451234] __handle_mm_fault (mm/memory.c:1059 (discriminator 1)
mm/memory.c:5462 (discriminator 1) mm/memory.c:5574 (discriminator 1)
mm/memory.c:4091 (discriminator 1) mm/memory.c:5935 (discriminator 1)
mm/memory.c:6078 (discriminator 1))
<4>[ 224.451763] handle_mm_fault (mm/memory.c:6247)
<4>[ 224.452307] do_page_fault (arch/arm64/mm/fault.c:647)
<4>[ 224.452881] do_translation_fault (arch/arm64/mm/fault.c:787)
<4>[ 224.453358] do_mem_abort (arch/arm64/mm/fault.c:919 (discriminator 1))
<4>[ 224.453890] el0_da (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:605 (discriminator 1))
<4>[ 224.454329] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:766=
)
<4>[ 224.454897] el0t_64_sync (arch/arm64/kernel/entry.S:600)
<0>[ 224.455654] Code: 8b190000 eb01001f 54000684 a9448f84 (f9000483)
All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0: 8b190000 add x0, x0, x25
   4: eb01001f cmp x0, x1
   8: 54000684 b.mi 0xd8  // b.first
   c: a9448f84 ldp x4, x3, [x28, #72]
  10:* f9000483 str x3, [x4, #8] <-- trapping instruction

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0: f9000483 str x3, [x4, #8]
<4>[  224.456945] ---[ end trace 0000000000000000 ]---
<0>[  224.458162] Kernel panic - not syncing: Oops: Fatal exception in inte=
rrupt
<2>[  224.459437] SMP: stopping secondary CPUs
<0>[  224.460808] Kernel Offset: 0x229838400000 from 0xffff800080000000
<0>[  224.461525] PHYS_OFFSET: 0xfffdc75880000000
<0>[  224.462166] CPU features: 0x000,000000d0,60bef2f8,cb7e7f3f
<0>[  224.463148] Memory Limit: none
<0>[  224.463861] ---[ end Kernel panic - not syncing: Oops: Fatal
exception in interrupt ]---

## Source
* Kernel version: 6.14.0-rc2-next-20250214
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
* Git sha: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
* Git describe: next-20250214
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/

## Build
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next=
-20250214/testrun/27292264/suite/log-parser-test/test/panic-multiline-kerne=
l-panic-not-syncing-oops-fatal-exception-in-interrupt-89d94046139a63ab8ef65=
7ef456dab84b63ef36eb42dc7c556dfa0f7a59423da/log
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/te=
strun/27292264/suite/log-parser-test/test/panic-multiline-kernel-panic-not-=
syncing-oops-fatal-exception-in-interrupt-89d94046139a63ab8ef657ef456dab84b=
63ef36eb42dc7c556dfa0f7a59423da/history/
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250214/te=
strun/27292264/suite/log-parser-test/test/panic-multiline-kernel-panic-not-=
syncing-oops-fatal-exception-in-interrupt-89d94046139a63ab8ef657ef456dab84b=
63ef36eb42dc7c556dfa0f7a59423da/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2t1m4RtgCbRZ2vhQrdEI=
wwj3DIY/config
* Architecures: arm64
* Toolchain version: gcc-13

--
Linaro LKFT
https://lkft.linaro.org

