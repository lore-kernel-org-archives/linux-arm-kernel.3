Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B7FCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i6dOIeR3pXAhPYZMt7PFHzXVozdl2RGhyvaCgErXxW0=; b=zPkVXpEIgFTU2/ChmgupmAEZ4v
	E7aY3cMtzzxA80V4xB4kyFyKSEdAL1tzaw2eQmicIBwMQHCmw3wriwjjEIlbmwf8EDsqb6DahEWct
	7uFLHKpw+CPgM5ajoBDfY/J2COLgIUIDSKhIta9lwEs6QKayX20ButreKuX6lrWmceZnsOmE2uZ8z
	RkucKRpZOPOTLw2F39HkCHhKmnuURt+WwfalszXi8xHE1fSd+x/jOPhHpMq4ryyythCQJTD8FmNCJ
	8Kum4ftla/uaT9yT8Ie/eGSHJm4YaUZhonEzxVJYuZeNTm3aArMm2trmYNzWqFl0SI888kKq514c7
	QGy8Hmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMO-00000001CWk-32Ev;
	Mon, 28 Sep 2026 17:41:52 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMM-00000001CUl-0De2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:51 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49fff093efcso25653625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617307; x=1791222107; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6dOIeR3pXAhPYZMt7PFHzXVozdl2RGhyvaCgErXxW0=;
        b=wlVixk8X34SRc5bp2w3ZR0TPFGUyPUyqAJYSaWFudrjjXylxlSQHUOeXpREz2kW7Te
         YHXvnCi1asIUg23S72jUJcwPKUlO46p4bv9Bz9OIqHJbXanK42+tN1G2Jk/9k4mKMhSJ
         nfF/y2QuYyI3eWhVo+V2IAJRMzdvvp7Idi9DvbSeiOKVh/CGQi92AqY1TukStmGdS1YF
         mWNw/KkBt7xCbCAnj0mA96tvt6r54dWXSpsej5KzUOsJ94sxIiH6/X0AG3opxcTjrqxA
         sbi2seKgLHZL5FTXvVNp2wHEiiDWuR9WzOvKtXP183aDcq6vd/hcDB3SplLgTaYQNtXg
         Avew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617307; x=1791222107;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6dOIeR3pXAhPYZMt7PFHzXVozdl2RGhyvaCgErXxW0=;
        b=tE7wCjnciS9RSyAdUjYpZhIS6TW61FRJgpyTglFVntw/G3ib/5zWJY3ckpPE9akVk8
         M8xD6QG9N60RTMEIYoWSCwdhNe/5S6fpjoOfQLIjPEyOBhPMUjtNVi9WXQs1wYPhNFTM
         Dkn5et2kU5cJQyggBirGQ9CKeb9X/zSn2Lg6NM5tfGfOCocY7PVSf+03SDetPwQBfQFZ
         aacyQP7DwOlDa5D6WiSq36ByfxOP0byAWjgK9uuM9e8GhpsC6WpI70sN7HDiRfC2feeT
         pDuI9+Tew7tsbPymEAPMxEpc7Lz1CbQAnwZ4T7aJvJl0alRCJyty81FtDO0gl/01/Ap0
         5WGw==
X-Forwarded-Encrypted: i=1; AKwUvBwVRN/gbW/wd5CMEwVCVzuuit881eJ/z0BSeIldWUG+5nwR1RviDT+awXTP75fYVKH5v7qR9qD4duxNi63VfgVu@lists.infradead.org
X-Gm-Message-State: AFuF++mg/vSBojckcmovxjExCQUU/ayhV3gL3IFydRfvoFiGcTYpg/6S
	lEMOzh8VDbQoN3Lln60C/bPZwmcloTPf4tccHwYcQS4BAXDYeeao62NxP3Mm0l6gPBdoO3hLjj9
	8qjbsM4/0kL/xlw==
X-Received: from wmdv19.prod.google.com ([2002:a05:600c:12d3:b0:49f:f099:7fc3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c494:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49fe7bab979mr230718305e9.22.1790617307210;
 Mon, 28 Sep 2026 10:41:47 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-1-smostafa@google.com>
Subject: [RFC PATCH 00/15] arm64: Set kernel stack size from cmdline
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104150_124605_C45B78C6 
X-CRM114-Status: GOOD (  22.96  )
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

Summary
=======
This patch series adds the ability to configure the kernel stack size
for arm64 from the kernel command line.

On some systems (specifically, Android), this provides a mechanism to
reduce the kernel memory consumption, as the default kernel stack size
of 16kB (with 4kB pages) can result in ~100MB of allocated memory,
despite the fact that most threads do not come close to exhausting
their allocation [1].

There have been multiple alternative attempts to improve this
situation, including for x86 and cloud workloads. However, these
have typically focussed on more dynamic behaviours such as allocating
kernel stack pages lazily (based on faults) [2] or reclaiming unused
stack pages from blocked tasks [1], whereas this series focusses on
making the kernel stack size configurable without changing the way in
which it is allocated.
It also permits a 12kB stack size, which is currently not supported
by arm64's stack overflow checking logic.

This series re-uses the first part of the dynamic stack patches which
makes it possible to partially back the VA space of the stack
(THREAD_SIZE) with memory, but never attempts to dynamically grow the
stack.

The size of the stack (<= THREAD_SIZE) is determined from the kernel
command line and is not further configurable at runtime, all threads
on the system (except the init_task, see below) will use the size set
from the command line.

Patches
=======
The patches have dependency on the ongoing arm re-work[3] to move the
overflow stack to sp_el1 allowing the early kernel exception to use it
without clobbering any registers.

- Patches 01-09: have no functional change, they abstract the code
  dealing with the stack to avoid hardcoding the stack size
- Patches 10-13: Introduce the new ARCH_HAS_VARIABLE_STACK_SIZE and
  make the kernel deal with stack sizes set in the run time.
- Patches 14-15: arm64 selecting ARCH_HAS_VARIABLE_STACK_SIZE and
  setting the kernel stack size from the command line.

KASAN
======
The KASAN stack helpers keep unpoisoning the whole THREAD_SIZE area.
As they only write shadow memory which is populated for the whole vmap
area.

init_task
=========
init_task is the only kernel thread that has a full stack allocation
as it is allocated statically. However, the additional stack pages are
not usable because the overflow check on exception entry will continue
to check against the configured stack size.

Future work
===========
There are multiple paths that can build on this
- Per task stack size (either via an in-kernel API for kthreads or
  potentially a prctl() for userspace to configure)
- It is still possible to build on top of this on the fault path to
  add dynamic stacks if the challenges raised in [2] can be solved.

Will Deacon will host a discussion at LPC next week [4]

Testing
=======
I tested on Lenovo Mini-x gen 10 (Qualcomm X1 CPU).

With configs KMEMLEAK, DEBUG_STACK_USAGE, SCHED_STACK_END_CHECK.

1) 4kB kernel - 16kB stack (default)
2) 4kB kernel - 8kB stack
3) 4kB kernel - 12kB stack
4) 64kB kernel - 64kB stack

With running VMs with KVM, stress-ng and LKDTM.

16kB tests done on Qemu.

[1] https://lore.kernel.org/all/20260827232948.2520558-1-stevensd@google.com/
[2] https://lore.kernel.org/all/20260424191456.2679717-1-stevensd@google.com/
[3] https://lore.kernel.org/all/20260918161407.2300-1-will@kernel.org/
[4] https://lpc.events/event/20/contributions/2419/

David Stevens (3):
  fork: Don't assume fully populated stack during reuse
  fork: Move vm_stack to the beginning of the stack
  fork: Move vmap stack freeing to work queue

Mostafa Saleh (9):
  sched/task_stack: Add helpers for stack high/low
  exit: Don't assume the kernel stack size
  usercopy: Don't assume the kernel stack size
  mm: kmemleak: Don't assume the kernel stack size
  arm64: Don't assume the kernel stack size
  sched/task_stack: Introduce ARCH_HAS_VARIABLE_STACK_SIZE
  fork: Implement partial VMAP stack allocation
  arm64: mm: Relax kernel stack alignment
  arm64: mm: Set stack size from the kernel command line

Pasha Tatashin (3):
  fork: Remove assumption that vm_area->nr_pages equals to THREAD_SIZE
  fork: Separate vmap stack allocation and free calls
  mm/vmalloc: Add a get_vm_area_node()

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/Kconfig                                  |  10 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/memory.h               |  19 ++-
 arch/arm64/include/asm/stacktrace.h           |   4 +-
 arch/arm64/kernel/entry.S                     |  91 ++++++++++--
 arch/arm64/kernel/setup.c                     |  24 ++++
 arch/arm64/kernel/traps.c                     |   5 +-
 include/linux/sched/task_stack.h              |  61 +++++++-
 include/linux/thread_info.h                   |   8 ++
 include/linux/vmalloc.h                       |   3 +
 kernel/exit.c                                 |   2 +-
 kernel/fork.c                                 | 134 +++++++++++++++---
 mm/kmemleak.c                                 |   2 +-
 mm/usercopy.c                                 |   4 +-
 mm/vmalloc.c                                  |  24 ++++
 16 files changed, 348 insertions(+), 51 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog


