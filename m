Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBA6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUMbmifnedLYok5Fwkc4vdyttxlB9DULmiFjDSvi1TE=; b=qd+L++GW8qcR8L8psmcDIZr4t/
	CXUDkXUn/8z55OWSh1xtVRzXJ0tt0LMoD4tCCFzK9AcKMan+++pve/tspErHLwW9OK/9/no7HimG+
	dTuygvgXA8fRpW516iK3e+rdVGRKwExSV5N8WOGA5GwHgdTSOG/qxbz3wlxTeVxcz61G+rd/jxvo/
	d+wyJhidZXkAQVVCqArFSltj22AJp7y//B3KB1SrD7/XW6QotAJSVzTbUOV4X+QqoPTIXSJ6MgaP4
	NJN6jPFwD3pfjVOSZ64OetKWdl3YbfC3p9kb4Bz1syQhZCzwqN9L51gpOySC+AGyKJsawhTe3s/EK
	pUU3H17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMFK-00000009B7m-1TSF;
	Wed, 12 Feb 2025 23:34:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMDt-00000009AuE-42AH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B9375C62ED
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DC7C4CEEF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739403172;
	bh=Hmnx3euZz8MalQbbAuJ98cvoy8uSGY/+9mdYoogJnxc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LvD/aFa6GZjMA1MRZG07RQqmEdBUMjnxup6ONAP4HiF70NXD5icb0PdZ3gy/KQ463
	 MNmSH719EpAXfIuTFC7Vhj+7tTGZEk+OBEv9T0p3JmG2NfUX8NoejfAfS4RH8O/BGC
	 v70kk0qRxZoa7N79w6RmCug/MdI68bIvdyKHcF7A8Hi+upTNxEctJerQm+ErwOvK1a
	 45pHPhZ2yvWB8PwD+P3pOS9UD2uH/MaMO4LYz4FCbMSN9rrZygd94GGMjwwtmz+qy0
	 uCauounx8tnntViUfx/MnBDKnLKWZCDAr1QxoguhnTgcP/H3KVlKhMIfDPzXq22tBw
	 vbFOJ84/HaCHw==
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-851c4f1fb18so7605439f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 15:32:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1z5BYwKLv5QDcTdAktHVHf6JQk22HcfYev/d+d1NEH8XSstJjK2cNr+k9ZHlJDqZIAyJq3g0DZmIFJbmyAw1/@lists.infradead.org
X-Gm-Message-State: AOJu0YymQqiYiyRBMcEomyWG7yVNHj+EoEALjzF1myILh4IQ6acPRR6N
	FcrDRl3/zu0Ofs1dQq26rXd/JC1Z5t5AV/gCQPO0ABMjbm9P9OENji5o/m/r4K59W53Q6a+rejf
	04D98x/eSpzjbAIO8j5Wsk8ujeBY=
X-Google-Smtp-Source: AGHT+IGo2Dt0bip65NyTzJBkwHzuA4Wpw3S2TPoeG3erdbq5J7wg2oLMnY5MROFDa2xa1zyfRJTB11F5SlTIyJslYiI=
X-Received: by 2002:a05:6e02:1ca4:b0:3cf:bc71:94ee with SMTP id
 e9e14a558f8ab-3d17bfe4532mr39375465ab.14.1739403171523; Wed, 12 Feb 2025
 15:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
From: Song Liu <song@kernel.org>
Date: Wed, 12 Feb 2025 15:32:40 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
X-Gm-Features: AWEUYZndBmDrBZy9fhyL-_OcKK1ZiK6tHmTiarUIZe6-3QAec1P2Eq0NP65vLRI
Message-ID: <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Weinan Liu <wnliu@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Puranjay Mohan <puranjay@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_153254_111336_4F87B41B 
X-CRM114-Status: GOOD (  23.46  )
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

I run some tests with this set and my RFC set [1]. Most of
the test is done with kpatch-build. I tested both Puranjay's
version [3] and my version [4].

For gcc 14.2.1, I have seen the following issue with this
test [2]. This happens with both upstream and 6.13.2.
The livepatch loaded fine, but the system spilled out the
following warning quickly.

On the other hand, the same test works with LLVM and
my RFC set (LLVM doesn't support SFRAME, and thus
doesn't work with this set yet).

Thanks,
Song


[   81.250437] ------------[ cut here ]------------
[   81.250818] refcount_t: saturated; leaking memory.
[   81.251201] WARNING: CPU: 0 PID: 95 at lib/refcount.c:22
refcount_warn_saturate+0x6c/0x140
[   81.251841] Modules linked in: livepatch_special_static(OEK)
[   81.252277] CPU: 0 UID: 0 PID: 95 Comm: bash Tainted: G
OE K    6.13.2-00321-g52d2813b4b07 #49
[   81.253003] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE, [K]=3DLIVE=
PATCH
[   81.253503] Hardware name: linux,dummy-virt (DT)
[   81.253856] pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=
=3D--)
[   81.254383] pc : refcount_warn_saturate+0x6c/0x140
[   81.254748] lr : refcount_warn_saturate+0x6c/0x140
[   81.255114] sp : ffff800085a6fc00
[   81.255371] x29: ffff800085a6fc00 x28: 0000000001200000 x27: ffff0000c29=
66180
[   81.255918] x26: 0000000000000000 x25: ffff8000829c0000 x24: ffff0000c2e=
9b608
[   81.256462] x23: ffff800083351000 x22: ffff0000c2e9af80 x21: ffff0000c06=
2e140
[   81.257006] x20: ffff0000c1c10c00 x19: ffff800085a6fd80 x18: fffffffffff=
fffff
[   81.257544] x17: 0000000000000001 x16: ffffffffffffffff x15: 00000000000=
00006
[   81.258083] x14: 0000000000000000 x13: 2e79726f6d656d20 x12: 676e696b616=
56c20
[   81.258625] x11: ffff8000829f7d70 x10: 0000000000000147 x9 : ffff8000801=
546b4
[   81.259165] x8 : 00000000fffeffff x7 : 00000000ffff0000 x6 : ffff800082f=
77d70
[   81.259709] x5 : 80000000ffff0000 x4 : 0000000000000000 x3 : 00000000000=
00001
[   81.260257] x2 : ffff8000829f7a88 x1 : ffff8000829f7a88 x0 : 00000000000=
00026
[   81.260824] Call trace:
[   81.261015]  refcount_warn_saturate+0x6c/0x140 (P)
[   81.261387]  __refcount_add.constprop.0+0x60/0x70
[   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_static]
[   81.262217]  kernel_clone+0x80/0x3e0
[   81.262499]  __do_sys_clone+0x5c/0x88
[   81.262786]  __arm64_sys_clone+0x24/0x38
[   81.263085]  invoke_syscall+0x4c/0x108
[   81.263378]  el0_svc_common.constprop.0+0x44/0xe8
[   81.263734]  do_el0_svc+0x20/0x30
[   81.263993]  el0_svc+0x34/0xf8
[   81.264231]  el0t_64_sync_handler+0x104/0x130
[   81.264561]  el0t_64_sync+0x184/0x188
[   81.264846] ---[ end trace 0000000000000000 ]---
[   82.335559] ------------[ cut here ]------------
[   82.335931] refcount_t: underflow; use-after-free.
[   82.336307] WARNING: CPU: 1 PID: 0 at lib/refcount.c:28
refcount_warn_saturate+0xec/0x140
[   82.336949] Modules linked in: livepatch_special_static(OEK)
[   82.337389] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G
W  OE K    6.13.2-00321-g52d2813b4b07 #49
[   82.338148] Tainted: [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE=
,
[K]=3DLIVEPATCH
[   82.338721] Hardware name: linux,dummy-virt (DT)
[   82.339083] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=
=3D--)
[   82.339617] pc : refcount_warn_saturate+0xec/0x140
[   82.340007] lr : refcount_warn_saturate+0xec/0x140
[   82.340378] sp : ffff80008370fe40
[   82.340637] x29: ffff80008370fe40 x28: 0000000000000000 x27: 00000000000=
00000
[   82.341188] x26: 000000000000000a x25: ffff0000fdaf7ab8 x24: 00000000000=
00014
[   82.341737] x23: ffff8000829c8d30 x22: ffff80008370ff28 x21: ffff0000fe0=
20000
[   82.342286] x20: ffff0000c062e140 x19: ffff0000c2e9af80 x18: fffffffffff=
fffff
[   82.342839] x17: ffff80007b7a0000 x16: ffff800083700000 x15: 00000000000=
00006
[   82.343389] x14: 0000000000000000 x13: 2e656572662d7265 x12: 7466612d657=
37520
[   82.343944] x11: ffff8000829f7d70 x10: 000000000000016a x9 : ffff8000801=
546b4
[   82.344499] x8 : 00000000fffeffff x7 : 00000000ffff0000 x6 : ffff800082f=
77d70
[   82.345051] x5 : 80000000ffff0000 x4 : 0000000000000000 x3 : 00000000000=
00001
[   82.345604] x2 : ffff8000829f7a88 x1 : ffff8000829f7a88 x0 : 00000000000=
00026
[   82.346163] Call trace:
[   82.346359]  refcount_warn_saturate+0xec/0x140 (P)
[   82.346736]  __put_task_struct+0x130/0x170
[   82.347063]  delayed_put_task_struct+0xbc/0xe8
[   82.347411]  rcu_core+0x20c/0x5f8
[   82.347680]  rcu_core_si+0x14/0x28
[   82.347952]  handle_softirqs+0x124/0x308
[   82.348260]  __do_softirq+0x18/0x20
[   82.348536]  ____do_softirq+0x14/0x28
[   82.348828]  call_on_irq_stack+0x24/0x30
[   82.349137]  do_softirq_own_stack+0x20/0x38
[   82.349465]  __irq_exit_rcu+0xcc/0x108
[   82.349764]  irq_exit_rcu+0x14/0x28
[   82.350038]  el1_interrupt+0x34/0x50
[   82.350321]  el1h_64_irq_handler+0x14/0x20
[   82.350642]  el1h_64_irq+0x6c/0x70
[   82.350911]  default_idle_call+0x30/0xd0 (P)
[   82.351248]  do_idle+0x1d0/0x200
[   82.351506]  cpu_startup_entry+0x38/0x48
[   82.351818]  secondary_start_kernel+0x124/0x150
[   82.352176]  __secondary_switched+0xac/0xb0
[   82.352505] ---[ end trace 0000000000000000 ]---



[1] SFRAME-less livepatch RFC
https://lore.kernel.org/live-patching/20250129232936.1795412-1-song@kernel.=
org/
[2] special-static test from kpatch
https://github.com/dynup/kpatch/blob/master/test/integration/linux-6.2.0/sp=
ecial-static.patch
[3] Puranjay's kpatch with arm64 support
https://github.com/puranjaymohan/kpatch/tree/arm64
[4] My version of kpatch with arm64 and LTO support
https://github.com/liu-song-6/kpatch/tree/fb-6.13-v2

On Mon, Jan 27, 2025 at 1:33=E2=80=AFPM Weinan Liu <wnliu@google.com> wrote=
:
>
> This patchset implements a generic kernel sframe-based [1] unwinder.
> The main goal is to support reliable stacktraces on arm64.
>
> On x86 orc unwinder provides reliable stacktraces. But arm64 misses the
> required support from objtool: it cannot generate orc unwind tables for
> arm64.
>
> Currently, there's already a sframe unwinder proposed for userspace: [2].
> Since the sframe unwind table algorithm is similar, these two proposal
> could integrate common functionality in the future.
>
> There are some incomplete features or challenges:
>   - The unwinder doesn't yet work with kernel modules. The `start_addr` o=
f
>     FRE from kernel modules doesn't appear correct, preventing us from
>     unwinding functions from kernel modules.
>   - Currently, only GCC supports sframe.
>
> Ref:
> [1]: https://sourceware.org/binutils/docs/sframe-spec.html
> [2]: https://lore.kernel.org/lkml/cover.1730150953.git.jpoimboe@kernel.or=
g/
>
> Madhavan T. Venkataraman (1):
>   arm64: Define TIF_PATCH_PENDING for livepatch
>
> Weinan Liu (7):
>   unwind: build kernel with sframe info
>   arm64: entry: add unwind info for various kernel entries
>   unwind: add sframe v2 header
>   unwind: Implement generic sframe unwinder library
>   unwind: arm64: Add sframe unwinder on arm64
>   unwind: arm64: add reliable stacktrace support for arm64
>   arm64: Enable livepatch for ARM64
>
>  Makefile                                   |   6 +
>  arch/Kconfig                               |   8 +
>  arch/arm64/Kconfig                         |   3 +
>  arch/arm64/Kconfig.debug                   |  10 +
>  arch/arm64/include/asm/stacktrace/common.h |   6 +
>  arch/arm64/include/asm/thread_info.h       |   4 +-
>  arch/arm64/kernel/entry-common.c           |   4 +
>  arch/arm64/kernel/entry.S                  |  10 +
>  arch/arm64/kernel/setup.c                  |   2 +
>  arch/arm64/kernel/stacktrace.c             | 102 ++++++++++
>  include/asm-generic/vmlinux.lds.h          |  12 ++
>  include/linux/sframe_lookup.h              |  43 +++++
>  kernel/Makefile                            |   1 +
>  kernel/sframe.h                            | 215 +++++++++++++++++++++
>  kernel/sframe_lookup.c                     | 196 +++++++++++++++++++
>  15 files changed, 621 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/sframe_lookup.h
>  create mode 100644 kernel/sframe.h
>  create mode 100644 kernel/sframe_lookup.c
>
> --
> 2.48.1.262.g85cc9f2d1e-goog
>
>

