Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D0C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ByhfPFFYRyQOKzwOCdD7VT4FkrQ9JW/PGTIdcjTJE7E=; b=U5wHHwntbmdsif+3Cl2J61nS/W
	j4CuS9AACJcl1tdYP0bH7zucVjcJBwJT+5ArRTSge1Q9PR3b4NzYZmwISrk6tqZIqZoSmoTw2kPf6
	TuPHeZ+UU5d15MYtrBVdnkcqv5Zr/Rn/OWG1YWDt/DtYjBs+t++9VHJ/v3WrdtrGsaAcfJAujMQUu
	6dEJOewz6+ZxjWx/cEv+tZ/6q0MKiFgEH4PUqlqLdoaN7rt0fmrDQgeci4SWs9eMPxCiw1TSGNXkY
	CTbwEpkAxwGTXUDNNS8lm6Rs4ZYKCxOiouCqBoqholsTnGE4iOQM+RgnvDJ7FFcbnw7ipLTXFGNR9
	h3Gi6juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZ4-00000004u6U-2TXO;
	Thu, 27 Aug 2026 23:31:22 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZ1-00000004u5b-0j0c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:21 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2cce14a21faso4786125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873476; x=1788478276; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByhfPFFYRyQOKzwOCdD7VT4FkrQ9JW/PGTIdcjTJE7E=;
        b=W7D8m0vKm0hZzFDQocWp+8d8iPnhqOq2JDWaVWHkA3oHy9zC6o61Im3tUwDcc9o9Uh
         HojWp+9LFCU1MMZdvdpA1m0Gah8HtIZcXTKmUBAugyKQBoGI85Tabvn+qPsUY1rohZUm
         DsZRMRW1obMr4MfruNwaOUJQogCXdzL+ULsXR9scsgFOMMpQQRS/SJ/10tsmkrZ7E6S/
         eoulzavtPcFqxrMod6y4v8Nm6ft3VzHl5yXruR5aZ3Qv4NvrS65nBfwIsh1aUnh5vMXK
         L54p3W/hC0QtwzDh9fCRvEEXe1VC88YVoSTj8B+FV+mZ8CdBYENaF48aoOnsrF/j+z/u
         4klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873476; x=1788478276;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByhfPFFYRyQOKzwOCdD7VT4FkrQ9JW/PGTIdcjTJE7E=;
        b=l+mjsSV8jYgQ8TAGH4mRFqYGLjNyByk4ZxBQtgFzFVlyQejsqtka4L+dR8wfXhTbvi
         /C1anfy67EkIWhLuEkqSd+KCZ7uNI9H83d9l4hTYF2dCJkf2Q5q2hkmnXIE71TkuOlTD
         SkbMmkcQJ8NASSUTlOKx0z0PDDma7LUyHR9zTJkhmCSAZOyurRNtgtJ92t4Wk7L4Pzy1
         i1x8Tyxq9S0VVuNVPT9FWhDo8JnuyNJ04gn7N2PDcDEHAVNJ5f2IAm7cPt94v68d2HON
         DT1Dhze+zEopEAs9c2PWTHbkd2ODVZQ1mtsN+H9CCy4tsMMcWdUqnJNIOAAQqg7OhTGA
         2V5g==
X-Forwarded-Encrypted: i=1; AHgh+RrhSxK7kKOZVueBmp+lM5pe+LyRMX76dVfai2Vv3SCx0pzBTrab2anLocA4CtCxmqxxd7CxxIEs2j9otDZ/1Ais@lists.infradead.org
X-Gm-Message-State: AFuF++nOqYXu6uTpHbDT6wWOi7uEaG+anqI6HZym2/2iffvHgF21kUHl
	Z2XoqPxKbLvH179GlGPvjtwoYqehio9JmGrMdjbHfMC0Z9vXb9RUfCYoA+rEUtuKoV6KptN7rKo
	44o3JsAI3r1UdBw==
X-Received: from dybnj45.prod.google.com ([2002:a05:7300:d0ad:b0:322:61cd:851e])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebc4:b0:2d6:f80c:6ff1 with SMTP id d9443c01a7336-2d726784320mr120542355ad.9.1787873476188;
 Thu, 27 Aug 2026 16:31:16 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:38 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-1-stevensd@google.com>
Subject: [RFC 00/10] Reclaimable kernel stacks
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_163119_262312_F3C0D8DE 
X-CRM114-Status: GOOD (  24.20  )
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

This RFC is a different approach to reducing kernel stack usage from the
earlier dynamic kernel stack RFC [1]. This patch series aims to reduce
the cost of kernel stacks by partially reclaiming stacks of blocked
tasks when it is safe to do so.

On Android, system processes typically have 2000-3000 threads. App
processes add 1000s more threads on top of this. The number of app
processes varies based on device RAM size, but the end result is that
1-2% of system RAM is consumed by kernel stacks. However, most of these
threads spend extended periods of time blocked. As such, reclaiming
blocked kernel stacks can reduce total kernel stack memory usage by
upwards of 50% in various multi-tasking test cases.

When a task is blocked, we know exactly where the top of its stack is
and can reclaim any pages past that point. Since any accesses to that
portion of the stack are bugs like use-after-return or buffer overflow,
turning those invalid accesses into hard crashes could even be
considered a positive.

Tracking blocked state and when it is safe to reclaim a stack is done
via a series of hooks in the scheduler. The actual reclaim of stacks is
done asynchronously in a shrinker.

Once a task's stack has been reclaimed, it cannot be rescheduled until
its stack is repopulated. Although there can be a repopulation fast path
within the scheduler, reliably allocating memory to repopulate the stack
requires a fallback path that defers the repopulation and wakeup to a
workqueue context that can use GFP_KERNEL.

The primary challenge is avoiding reclaim deadlocks. If a task blocks
while holding a lock used by direct reclaim and then has its stack
reclaimed, using GFP_KERNEL to reallocate its stack risks deadlock. To
avoid this, only tasks which are known not to hold any locks upon which
reclaim depends are considered eligible for stack reclaim. Automatically
inferring this property is not feasible, so instead a new
PF_RECLAIMABLE_STACK task flag is used to annotate blocking locations
that are known safe. While annotating all safe blocking locations is not
feasible, the vast majority of userspace threads block using a fairly
small number of syscalls - futex, epoll, nanosleep, etc. The 10
annotations added in this series cover >95% of userspace threads on
Android based on my testing. Since missing annotations are leaving an
optimization on the table rather than an actual bug, other annotations
can be added later as needed.

Although reclaimable stacks will not cause reclaim to deadlock, it does
introduce a dependency on needing to allocate memory before an OOM
victim can exit, as reclaimed stacks need to be repopulated before their
tasks can run. While the OOM reaper will still be able to immediately
free the victim's mm, the freeing of non-mm memory may be delayed. This
can lead to more OOM kills. While this is not a significant concern on
Android due to the reliance on lmkd over the kernel OOM killer, it may
be a concern on other systems.

This RFC was developed primarily on 6.18 and 7.1 based kernels. I have
done fairly heavy stress testing, but it has not yet been deployed to
any production systems. If initial feedback on the RFC is somewhat
positive, I will work on deploying it to production systems for further
stability and performance testing as well as resolving the handful of
TODOs left in the RFC.

[1] https://lore.kernel.org/linux-mm/20260424191456.2679717-1-stevensd@google.com/

David Stevens (10):
  Add !MEMCG memcg_list_lru_alloc implementation
  mm/vmalloc: Skip vmallocinfo NUMA stats for VM_SPARSE
  fork: refactor vmap stack alloc/free into helpers
  mm: vmalloc: support creating aligned vm areas
  fork: allocate reclaimable stacks with VM_SPARSE
  Reclaim memory from blocked kernel stacks
  Reclaim stacks via a shrinker
  Set PF_RECLAIMABLE_STACK in various places
  x86: Enable reclaimable stacks
  arm64: Enable reclaimable stacks

 arch/Kconfig                       |  18 +
 arch/arm64/Kconfig                 |   1 +
 arch/arm64/include/asm/processor.h |   5 +
 arch/x86/Kconfig                   |   1 +
 arch/x86/include/asm/processor.h   |   5 +
 drivers/android/binder/thread.rs   |  14 +
 fs/eventpoll.c                     |   3 +
 fs/pipe.c                          |  28 +-
 fs/select.c                        |   3 +
 include/linux/list_lru.h           |   7 +-
 include/linux/sched.h              |  44 +-
 include/linux/sched/task_stack.h   |  23 +
 include/linux/vmalloc.h            |   2 +
 kernel/Makefile                    |   2 +
 kernel/fork.c                      | 140 +++++-
 kernel/futex/waitwake.c            |   3 +
 kernel/sched/core.c                |  18 +-
 kernel/sched/sched.h               |   3 +
 kernel/signal.c                    |  36 +-
 kernel/stack_shrinker.c            | 760 +++++++++++++++++++++++++++++
 kernel/stack_shrinker.h            |  58 +++
 kernel/time/hrtimer.c              |   3 +
 mm/vmalloc.c                       |  27 +-
 rust/kernel/task.rs                |  16 +
 24 files changed, 1175 insertions(+), 45 deletions(-)
 create mode 100644 kernel/stack_shrinker.c
 create mode 100644 kernel/stack_shrinker.h


base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.55.0.897.gb25b4bd76c-goog


