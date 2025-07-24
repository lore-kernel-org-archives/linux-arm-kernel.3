Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BD2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FqEL4g/LxcX7JeUfckRjpcaLArWuCpU4wQM67cp5yc=; b=BHmikDxIttcynFDRuNzpPh8j1J
	m6MlJTveVcoFKYGdOaIQNBVModpuoOKrOklO5bxv4YJhGqbu6o51k5Qxj/2AGq7BIju3OIphMRaBN
	dkDt+hU3+owFwJtSJ3yKTQiD8Qjw+DpasXb/2hG1SIhKVR0XEAmlhiuy1WSiDWoYmOoayBzUpMToe
	/aOuLuoQA/+zGUqjKBXOHx0d0x+JwRSEHOMG3M2dk9Njonyw3mnzcLydRf10gE8gVU/0uck+MOXOH
	TJHbcVmzrvQMCTQWmHSK3pox9FUiyYdtbKbUzf+mRFY/49IYOm4xFPuz2bXlamzm4fJ0V9dQH7kd8
	31f7+oDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf1Yk-00000008JtZ-3TxE;
	Thu, 24 Jul 2025 19:24:54 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf1WJ-00000008JWE-3I0K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 19:22:24 +0000
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b3f2f8469b7so20497a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 12:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753384942; x=1753989742;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FqEL4g/LxcX7JeUfckRjpcaLArWuCpU4wQM67cp5yc=;
        b=NTdWRhAAnT9dcIKvwHU27Xi2Dq3/lU0/0y9vsgHhv1fZMdfNeGaZeuYBZ4VKcvqRTe
         jlJ3kg7v2gFE1Idwtp36xucP+VoLF1GvjWdde8/hodvTMP8tJkNQOoWt9oBgmQRx7nPk
         w+zK5lPmiTn0+3S6jT8Wo2H2pzSS86Pr62Y+fa2Mb1/G17jzUn//GJjq5KPgQ+MndZDO
         IFR0v/94ZDKFuoas+4S3BCoYOnPkSB8yVlOFQFQ0cPPRNU0dt2Yu18Sst0+Y5PHptsKL
         eL4sOhC2F6hcUOR3URJEVVRj8qfGySRpEO69EOHElqcWS9dXEIRjqnueqrVKCd9MGFYN
         Ol4A==
X-Forwarded-Encrypted: i=1; AJvYcCWowVQmB/GvCV9E8XcF+HGhWqGBV1gLuWTQ+DgQ/iAYELpI1t/uqTiPBedRETH+pAjbGBNw4gpT7lmoKQyX5LJM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6skyQ/VvcK7V5NnsID7yoaHTmOiw02H0v8pLAS8yb41Z2E7ox
	ZA8FGPEWQQX+9hOv7eqkJuw/lzDy9E8n6QHdW2ZH5HtY3bjrWpM6EX9o
X-Gm-Gg: ASbGncsHegwl3AP2gsgmddq+FFOovjZZlsgNlYWdSn5GXtGxWWA9qRSH4CJt+VUQuNi
	OjO5r4z25/zudR90nfIzR9zkX7hzrT7Ktoo41HNS6ymDWLtLe1dyFxlyGiCej0JEiyd/9MomzHS
	vUWb0ibCRx/aj9vH0T7CrpauwSM1T/NYeSfmSKHViiFKFC7DZ0JuKo1Bswp8212Gzrn+lCJbbi6
	4JqaJhv384jQour3zgpGUCYlTlO1P+cpvvKmasC6bNboTgddE7V7E9ug6cl0yCnpUrAQjZWxL21
	KDawH4JPcPpDc+vMdhTnT3Xih77O2llVzXok8LAehDtX89cRA3wr/TV3+YuRGf5dEElcYzvpE2E
	mbSWgU92sTCItlNOhUJ06lzMsAGgBscHe
X-Google-Smtp-Source: AGHT+IFX5adxsqeKZctcbhU2zEavqqTurHQyVIap+3NBCTV52HK27Sf7F/VXb+tZALzo3yoHWLkSKQ==
X-Received: by 2002:a05:6a00:ad0:b0:725:f1f2:43eb with SMTP id d2e1a72fcca58-760351e04d4mr4811345b3a.6.1753384942233;
        Thu, 24 Jul 2025 12:22:22 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76273eaa67dsm979134b3a.87.2025.07.24.12.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 12:22:21 -0700 (PDT)
Message-ID: <714b7ba2-693e-42e4-bce4-feef2a5e7613@kzalloc.com>
Date: Fri, 25 Jul 2025 04:22:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: arm_pmuv3: Fix kernel panic on UBSAN from negative
 hw.idx in armv8pmu_enable/disable_event()
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Austin Kim <austindh.kim@gmail.com>,
 Michelle Jin <shjy180909@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, syzkaller@googlegroups.com,
 Kan Liang <kan.liang@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Namhyung Kim <namhyung@kernel.org>
References: <20250723104359.364547-5-ysk@kzalloc.com>
 <aIDXE3GsRVUbPmaz@J2N7QTR9R3> <aIEePonPatjNrJVk@J2N7QTR9R3>
 <14fb716a-dedf-482a-8518-e5cc26165e97@kzalloc.com>
 <aIIT7fq3xG9qtRD8@J2N7QTR9R3>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <aIIT7fq3xG9qtRD8@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_122223_831898_B2B62D11 
X-CRM114-Status: GOOD (  39.19  )
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

I really appreciate the detailed explanation, Mark.

On 7/24/25 8:07 오후, Mark Rutland wrote:
> On Thu, Jul 24, 2025 at 03:57:42AM +0900, Yunseong Kim wrote:
>> On 7/24/25 2:39 오전, Mark Rutland wrote:
>>> On Wed, Jul 23, 2025 at 01:35:31PM +0100, Mark Rutland wrote:
>>>> [ dropping Hemendra, since he doens't need to be spammed with ML traffic ]
>>>>
>>>> On Wed, Jul 23, 2025 at 10:44:03AM +0000, Yunseong Kim wrote:
>>>>> When 'event->hw.idx' was negative in armv8pmu_enable/disable_event().
>>>>>
>>>>>   UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:716:25
>>>>>   shift exponent -1 is negative
>>>>>
>>>>>   UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:658:13
>>>>>   shift exponent -1 is negative
> 
>>> I can reproduce this locally with:
>>>
>>> | #include <stdio.h>
>>> | #include <stdlib.h>
>>> | #include <unistd.h>
>>> | 
>>> | #include <sys/syscall.h>
>>> | #include <sys/types.h>
>>> | 
>>> | #include <linux/perf_event.h>
>>> | 
>>> | static int perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu,
>>> |                            int group_fd, unsigned long flags)
>>> | {
>>> |         return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
>>> | }
>>> | 
>>> | struct perf_event_attr attr_parent = {
>>> |         .type = PERF_TYPE_HARDWARE,
>>> |         .size = sizeof(attr_parent),
>>> |         .config = PERF_COUNT_HW_CPU_CYCLES,
>>> |         .sample_period = 1,
>>> |         .exclude_kernel = 1,
>>> | };
>>> | 
>>> | struct perf_event_attr attr_child = {
>>> |         .type = PERF_TYPE_HARDWARE,
>>> |         .size = sizeof(attr_child),
>>> |         .config = PERF_COUNT_HW_CPU_CYCLES,
>>> |         .exclude_kernel = 1,
>>> |         .disabled = 1,
>>> | };
>>> | 
>>> | int main(int argc, char *argv[])
>>> | {
>>> |         int parent, child;
>>> | 
>>> |         parent = perf_event_open(&attr_parent, 0, -1, -1, 0);
>>> |         if (parent < 0) {
>>> |                 fprintf(stderr, "Unable to create event: %d\n", parent);
>>> |                 exit (-1);
>>> |         }
>>> | 
>>> |         child = perf_event_open(&attr_child, 0, -1, parent, 0);
>>> |         if (child < 0) {
>>> |                 fprintf(stderr, "Unable to create event: %d\n", child);
>>> |                 exit (-1);
>>> |         }
>>> | 
>>> |         for (;;) {
>>> |                 asm("" ::: "memory");
>>> |         }
>>> | 
>>> |         return 0;
>>> | }
>>>
>> I attempted to reproduce the issue with the code you shared, but it didn’t seem
>> to work on my end. Do I need to run it with multiple processes?
> 
> This should only need a single process. On my machine it triggers the
> PMEV* warnings and the UBSAN splats immediately. I'm using v6.16-rc2
> defconfig + CONFIG_UBSAN=y + CONFIG_UBSAN_SHIFT=y, built with GCC
> 15.1.0, running under KVM on a ThunderX2 host.
> 
> Just to rule out the obvious, are you sure you're testing a kernel
> *without* your proposed fix?

Yes, that’s right. Restartingt the program makes the issue appear reliably.

Mark, would it be okay if I submit a patch to include the C program you wrote in
the perf tests?

I recorded a video demonstrating the reproduction.

Link: https://youtu.be/nR75y0x85JU?si=ws-UsE2ARkTmNxk0

In summary, my environment is as follows:
- Linux Kernel v6.16.0-rc2-g5982a539cdce
- Built with GCC version 14.2.0
- Guest running under KVM on a RADXA Orion6 host

It’s based on the syzbot ci-upstream-gce-arm64 config, with two configs enabled.
- CONFIG_UBSAN=y + CONFIG_UBSAN_SHIFT=y

I’ve uploaded the C program you wrote along with a shell script that runs it
repeatedly at the following link.

Link: https://gist.github.com/kzall0c/8421978c6628b9596cd7a8e3d690fc71


| UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:658:13
| shift exponent -1 is negative
| UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:730:26
| shift exponent -1 is negative
| ** replaying previous printk message **
| ------------[ cut here ]------------
| UBSAN: shift-out-of-bounds in drivers/perf/arm_pmuv3.c:716:25
| shift exponent -1 is negative
| CPU: 5 UID: 0 PID: 7676 Comm: perf-disabled-c Tainted: G        W           6.16.0-rc2-g5982a539cdce #8 PREEMPT
| Tainted: [W]=WARN
| Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
| Call trace:
|  show_stack+0x2c/0x3c (C)
|  __dump_stack+0x30/0x40
|  dump_stack_lvl+0x1e0/0x2bc
|  dump_stack+0x1c/0x48
|  ubsan_epilogue+0x14/0x48
|  __ubsan_handle_shift_out_of_bounds+0x2b0/0x34c
|  armv8pmu_enable_event+0x3c4/0x4b0
|  armpmu_start+0xc4/0x118
|  perf_event_unthrottle_group+0x3a8/0x50c
|  perf_adjust_freq_unthr_events+0x2f4/0x578
|  perf_adjust_freq_unthr_context+0x278/0x46c
|  perf_event_task_tick+0x394/0x5b0
|  sched_tick+0x314/0x6cc
|  update_process_times+0x374/0x4b0
|  tick_nohz_handler+0x334/0x480
|  __hrtimer_run_queues+0x3ec/0xb78
|  hrtimer_interrupt+0x2b8/0xb50
|  arch_timer_handler_virt+0x74/0x88
|  handle_percpu_devid_irq+0x174/0x308
|  generic_handle_domain_irq+0xe0/0x140
|  gic_handle_irq+0x5c4/0xaa8
|  call_on_irq_stack+0x24/0x30
|  do_interrupt_handler+0xd4/0x138
|  el0_interrupt+0x6c/0x1dc
|  __el0_irq_handler_common+0x18/0x24
|  el0t_64_irq_handler+0x10/0x1c
|  el0t_64_irq+0x1ac/0x1b0
| ---[ end trace ]---

> The idea is that the period for the group_leader event is tiny and
> should cause some throttling, and the for-loop at the end should spin
> for long enough in userspace that multiple overflows occur and result in
> throttling. I don't currently see how that couldn't trigger the issue.
> 
> FWIW, it also triggers a warning on x86-64 defconfig, e.g.

Thanks for checking it on x86 as well!

> | # ./perf-disabled-child 
> | perf: interrupt took too long (6615 > 6612), lowering kernel.perf_event_max_sample_rate to 30000
> | perf: interrupt took too long (8399 > 8268), lowering kernel.perf_event_max_sample_rate to 23000
> | perf: interrupt took too long (10626 > 10498), lowering kernel.perf_event_max_sample_rate to 18000
> | perf: interrupt took too long (13313 > 13282), lowering kernel.perf_event_max_sample_rate to 15000
> | perf: interrupt took too long (16644 > 16641), lowering kernel.perf_event_max_sample_rate to 12000
> | ------------[ cut here ]------------
> | WARNING: CPU: 5 PID: 445 at arch/x86/events/core.c:1521 x86_pmu_start+0x72/0x90
> | Modules linked in:
> | CPU: 5 UID: 0 PID: 445 Comm: perf-disabled-c Not tainted 6.16.0-rc7 #1 PREEMPT(full) 
> | Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.2-0-gea1b7a073390-prebuilt.qemu.org 04/01/2014
> | RIP: 0010:x86_pmu_start+0x72/0x90
> | Code: 00 00 00 00 4a 89 5c e5 00 48 81 c5 00 02 00 00 4c 0f ab 65 00 48 89 df e8 fb f9 00 00 48 89 df 5b 5d 41 5c e9 8f a7 1e 00 90 <0f> 0b 90 5b 5d 41 5c e9 c2 4d f8 00 90 0f 0b 90 eb f1 90 0f 0b 90
> | RSP: 0000:ffffb79441017d68 EFLAGS: 00010046
> | RAX: 0000000000000000 RBX: ffff95f502618468 RCX: 0000000000000020
> | RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff95f502618468
> | RBP: ffff95f57d154ca0 R08: 0000000000000001 R09: 000000000000000b
> | R10: 00000000000000c1 R11: 0000000000000001 R12: ffffffffffffffff
> | R13: 0000000000000001 R14: ffff95f502601330 R15: ffff95f57d15bb00
> | FS:  000000001188d300(0000) GS:ffff95f5e3e3f000(0000) knlGS:0000000000000000
> | CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> | CR2: 00000000004a2d58 CR3: 0000000004170005 CR4: 0000000000370ef0
> | Call Trace:
> |  <TASK>
> |  perf_event_unthrottle_group+0xc9/0xf0
> |  perf_adjust_freq_unthr_events+0x14c/0x180
> |  perf_adjust_freq_unthr_context+0x8b/0x120
> |  perf_event_task_tick+0x5c/0x70
> |  sched_tick+0xce/0x220
> |  update_process_times+0xa4/0xd0
> |  tick_nohz_handler+0x88/0x120
> |  ? __pfx_tick_nohz_handler+0x10/0x10
> |  __hrtimer_run_queues+0x12c/0x2a0
> |  hrtimer_interrupt+0xfa/0x220
> |  __sysvec_apic_timer_interrupt+0x50/0xf0
> |  sysvec_apic_timer_interrupt+0x31/0x80
> |  asm_sysvec_apic_timer_interrupt+0x1a/0x20
> | RIP: 0033:0x40169d
> | Code: 69 9c 04 00 85 c0 78 24 45 31 c9 41 89 c0 83 c9 ff 31 d2 31 c0 48 8d 35 71 0a 0b 00 bf 2a 01 00 00 e8 47 9c 04 00 85 c0 78 02 <eb> fe 48 8b 3d 22 11 0b 00 89 c2 48 8d 35 55 59 08 00 31 c0 e8 7a
> | RSP: 002b:00007ffc74f22e10 EFLAGS: 00000202
> | RAX: 0000000000000004 RBX: 0000000000400488 RCX: 000000000044b2f9
> | RDX: 00000000ffffffff RSI: 0000000000000000 RDI: 00000000004b2100
> | RBP: 0000000000402ba0 R08: 0000000000000000 R09: 0000000000400488
> | R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000402c30
> | R13: 0000000000000000 R14: 00000000004b2018 R15: 0000000000400488
> |  </TASK>
> | ---[ end trace 0000000000000000 ]---
> 
> ... so I think this is pretty clearly a bug in the core code, but I'm
> not sure *exactly* how that should be handled, and I suspect there are
> some additional interactions with other concurrent enable/disable.
> 
>>>> Has your syzkaller instance managed to generate a C reproducer that you
>>>> can share?
>>>> It should be possible to manually build a test from the above, but
>>>> that's rather tedious.
>>
>> I’ve attached both the 'perf.syz' and the generated C reproducer file 'perf.c'
>> for the reference.
> 
> Thanks!
> 
> FWIW, I had a go with the generated C reproducer, and it didn't seem to
> trigger the issue, even with ~100 instances launched in parallel.

Oh, I think I made a mistake while adding line breaks. Sorry about that!

> For the benefit of the mailing list archive, I've included your
> reproducer(s) inline below, but I've dropped the config as I don't
> belive there's anything important there beyond CONFIG_UBSAN=y +
> CONFIG_UBSAN_SHIFT=y.
> 
> It should be possible to figure out the exact perf_event_attr values
> used, but it's a bit painful to extract those manually.
> 
> Mark.

Thanks for summarizing the key points so clearly.

> // perf.c
>> // autogenerated by syzkaller (https://github.com/google/syzkaller)
>>
>> #define _GNU_SOURCE
>>
>> #include <endian.h>
>> #include <stdint.h>
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <string.h>
>> #include <sys/syscall.h>
>> #include <sys/types.h>
>> #include <unistd.h>
>>
>> #ifndef __NR_mmap
>> #define __NR_mmap 222
>> #endif
>> #ifndef __NR_perf_event_open
>> #define __NR_perf_event_open 241
>> #endif
>>
>> #define BITMASK(bf_off, bf_len) (((1ull << (bf_len)) - 1) << (bf_off))
>> #define STORE_BY_BITMASK(type, htobe, addr, val, bf_off, bf_len)               \
>>   *(type*)(addr) =                                                             \
>>       htobe((htobe(*(type*)(addr)) & ~BITMASK((bf_off), (bf_len))) |           \
>>             (((type)(val) << (bf_off)) & BITMASK((bf_off), (bf_len))))
>>
>> uint64_t r[1] = {0xffffffffffffffff};
>>
>> int main(void)
>> {
>>   syscall(__NR_mmap, /*addr=*/0x1ffff000ul, /*len=*/0x1000ul, /*prot=*/0ul,
>>           /*flags=MAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,
>>           /*fd=*/(intptr_t)-1, /*offset=*/0ul);
>>   syscall(__NR_mmap, /*addr=*/0x20000000ul, /*len=*/0x1000000ul,
>>           /*prot=PROT_WRITE|PROT_READ|PROT_EXEC*/ 7ul,
>>           /*flags=MAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,
>>           /*fd=*/(intptr_t)-1, /*offset=*/0ul);
>>   syscall(__NR_mmap, /*addr=*/0x21000000ul, /*len=*/0x1000ul, /*prot=*/0ul,
>>           /*flags=MAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,
>>           /*fd=*/(intptr_t)-1, /*offset=*/0ul);
>>   const char* reason;
>>   (void)reason;
>>   intptr_t res = 0;
>>   if (write(1, "executing program\n", sizeof("executing program\n") - 1)) {
>>   }
>>   *(uint32_t*)0x20000240 = 0;
>>   *(uint32_t*)0x20000244 = 0x80;
>>   *(uint8_t*)0x20000248 = 0;
>>   *(uint8_t*)0x20000249 = 0;
>>   *(uint8_t*)0x2000024a = 0;
>>   *(uint8_t*)0x2000024b = 0;
>>   *(uint32_t*)0x2000024c = 0;
>>   *(uint64_t*)0x20000250 = 0;
>>   *(uint64_t*)0x20000258 = 0;
>>   *(uint64_t*)0x20000260 = 0;
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 0, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 1, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 2, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 3, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 4, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 5, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 6, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 7, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 8, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 9, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 10, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 11, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 12, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 13, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 14, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 15, 2);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 17, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 18, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 19, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 20, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 21, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 22, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 23, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 24, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 25, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 26, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 27, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 28, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 29, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 30, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 31, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 32, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 33, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 34, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 35, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 36, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 37, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000268, 0, 38, 26);
>>   *(uint32_t*)0x20000270 = 0;
>>   *(uint32_t*)0x20000274 = 0;
>>   *(uint64_t*)0x20000278 = 0;
>>   *(uint64_t*)0x20000280 = 0;
>>   *(uint64_t*)0x20000288 = 0;
>>   *(uint64_t*)0x20000290 = 0;
>>   *(uint32_t*)0x20000298 = 0;
>>   *(uint32_t*)0x2000029c = 0;
>>   *(uint64_t*)0x200002a0 = 0;
>>   *(uint32_t*)0x200002a8 = 0;
>>   *(uint16_t*)0x200002ac = 0;
>>   *(uint16_t*)0x200002ae = 0;
>>   *(uint32_t*)0x200002b0 = 0;
>>   *(uint32_t*)0x200002b4 = 0;
>>   *(uint64_t*)0x200002b8 = 0;
>>   res = syscall(__NR_perf_event_open, /*attr=*/0x20000240ul, /*pid=*/0,
>>                 /*cpu=*/0ul, /*group=*/(intptr_t)-1, /*flags=*/0ul);
>>   if (res != -1)
>>     r[0] = res;
>>   *(uint32_t*)0x20000280 = 0;
>>   *(uint32_t*)0x20000284 = 0x80;
>>   *(uint8_t*)0x20000288 = 0;
>>   *(uint8_t*)0x20000289 = 0;
>>   *(uint8_t*)0x2000028a = 0;
>>   *(uint8_t*)0x2000028b = 0;
>>   *(uint32_t*)0x2000028c = 0;
>>   *(uint64_t*)0x20000290 = 0;
>>   *(uint64_t*)0x20000298 = 0;
>>   *(uint64_t*)0x200002a0 = 0;
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 1, 0, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 1, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 2, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 3, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 4, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 5, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 6, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 7, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 8, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 9, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 10, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 11, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 12, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 13, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 14, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 15, 2);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 17, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 18, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 19, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 20, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 21, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 22, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 23, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 24, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 25, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 26, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 27, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 28, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 29, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 30, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 31, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 32, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 33, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 34, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 35, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 36, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 37, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x200002a8, 0, 38, 26);
>>   *(uint32_t*)0x200002b0 = 0;
>>   *(uint32_t*)0x200002b4 = 0;
>>   *(uint64_t*)0x200002b8 = 0;
>>   *(uint64_t*)0x200002c0 = 0;
>>   *(uint64_t*)0x200002c8 = 0;
>>   *(uint64_t*)0x200002d0 = 0;
>>   *(uint32_t*)0x200002d8 = 0;
>>   *(uint32_t*)0x200002dc = 0;
>>   *(uint64_t*)0x200002e0 = 0;
>>   *(uint32_t*)0x200002e8 = 0;
>>   *(uint16_t*)0x200002ec = 0;
>>   *(uint16_t*)0x200002ee = 0;
>>   *(uint32_t*)0x200002f0 = 0;
>>   *(uint32_t*)0x200002f4 = 0;
>>   *(uint64_t*)0x200002f8 = 0;
>>   syscall(__NR_perf_event_open, /*attr=*/0x20000280ul, /*pid=*/0, /*cpu=*/0ul,
>>           /*group=*/r[0], /*flags=*/0ul);
>>   *(uint32_t*)0x20000540 = 3;
>>   *(uint32_t*)0x20000544 = 0x80;
>>   *(uint8_t*)0x20000548 = 0;
>>   *(uint8_t*)0x20000549 = 0;
>>   *(uint8_t*)0x2000054a = 0;
>>   *(uint8_t*)0x2000054b = 0;
>>   *(uint32_t*)0x2000054c = 0;
>>   *(uint64_t*)0x20000550 = 4;
>>   *(uint64_t*)0x20000558 = 0;
>>   *(uint64_t*)0x20000560 = 0;
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 0, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 1, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 2, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 3, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 4, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 5, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 6, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 7, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 8, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 9, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 10, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 11, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 12, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 13, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 14, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 15, 2);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 17, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 18, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 19, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 20, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 21, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 22, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 23, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 24, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 25, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 26, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 27, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 28, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 29, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 30, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 31, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 32, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 33, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 34, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 35, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 36, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 37, 1);
>>   STORE_BY_BITMASK(uint64_t, , 0x20000568, 0, 38, 26);
>>   *(uint32_t*)0x20000570 = 0;
>>   *(uint32_t*)0x20000574 = 4;
>>   *(uint64_t*)0x20000578 = 0;
>>   *(uint64_t*)0x20000580 = 2;
>>   *(uint64_t*)0x20000588 = 0x20;
>>   *(uint64_t*)0x20000590 = 0;
>>   *(uint32_t*)0x20000598 = 0;
>>   *(uint32_t*)0x2000059c = 0;
>>   *(uint64_t*)0x200005a0 = 2;
>>   *(uint32_t*)0x200005a8 = 0;
>>   *(uint16_t*)0x200005ac = 0;
>>   *(uint16_t*)0x200005ae = 0;
>>   *(uint32_t*)0x200005b0 = 0;
>>   *(uint32_t*)0x200005b4 = 0;
>>   *(uint64_t*)0x200005b8 = 0x81;
>>   syscall(__NR_perf_event_open, /*attr=*/0x20000540ul, /*pid=*/0, /*cpu=*/0ul,
>>           /*group=*/r[0], /*flags=*/0ul);
>>   return 0;
>> }
> 
> // perf.syz
>> r0 = perf_event_open(&(0x7f0000000240)={0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, @perf_config_ext}, 0x0, 0x0, 0xffffffffffffffff, 0x0)
>> perf_event_open(&(0x7f0000000280)={0x0, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, @perf_config_ext}, 0x0, 0x0, r0, 0x0)
>> perf_event_open(&(0x7f0000000540)={0x3, 0x80, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x4, @perf_bp={0x0, 0x2}, 0x20, 0x0, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x81}, 0x0, 0x0, r0, 0x0)

Next time, I'll make sure to submit it in a clearer format. The way you've done
it looks really nice.

I sincerely appreciate your detailed explanation once again!


Best regards,
Yunseong Kim

