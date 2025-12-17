Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7CAD68BC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPChDtl+CvFRT5yL007t3ww4+KXMjrZIFoTPkzNDgnI=; b=vbZ2gcK/E43LSMkX1u3jTC7EYv
	o8WfPUUqqJXhEMnwYjdMvY4xzHo3zKH7vlEJA1zz22je+8F+h4t8b03T/BbK7WLZ01fRhnS6KiR7d
	l1MORMnAT6/h6j+7RpAChjHYkJl5+oybHO8ZmbY0a4YqdDXEnbfGtiLQbI4ire8XThTADHxH4E5bY
	j8bXbHYFk0HdYgXqkEREJXFbdZ2tmXbHzuUYvqzPdgUdu9maoUK6irZwjRpuZThHnTEhZqRjf7iIu
	V/+GkcNqFsHlaJlnI68nDjhcp8onO8wIpAX8Fgolp8JKUM3gQYNXYPUSOXlPLjtBPLri44N07f7hn
	wMlVcnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW14I-00000007YE4-11EB;
	Wed, 17 Dec 2025 23:36:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW14G-00000007YDy-2kS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:36:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 743946000A;
	Wed, 17 Dec 2025 23:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D125CC4CEF5;
	Wed, 17 Dec 2025 23:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766014587;
	bh=SGIgG4Fzu5neo1DU3KtFJ8RmjhgyPOCK3g8RAmcJLdY=;
	h=From:To:Cc:Subject:Date:From;
	b=sy4N9mLhnipMZoq+ci8VC14qgdHpfnp6loKUGDMIhL3IEGASC0bl947yZsHabKmra
	 qf1peZdPw5vMhwfYK/xRmxf1A9At/z8C2wKR2X6hMtT1R+U6HzzhEGKGL8w3htWcBn
	 CqhksKvOCuYvxNqJdOrjvYx9cGtlPg2NaBVf5wyytdWKkkStvrnwYlqpAOGSp2ZrdX
	 nXMx9INOyZYHH64cDCSHStUPLQusmoSafyDwkYe313HNqKhdONI/LAsZp6nMo8OOmt
	 FBHF59fFOr7N8k4UxDG1vfbylSGh2ip1Uyqqh0dULoU82wHYQKlhQmObWK2wZ0ZYfy
	 iZLGevQ+oKHlA==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	kernel-team@meta.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next v2 0/2] bpf: Optimize recursion detection on arm64
Date: Wed, 17 Dec 2025 15:35:55 -0800
Message-ID: <20251217233608.2374187-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

V1: https://lore.kernel.org/all/20251217162830.2597286-1-puranjay@kernel.org/
Changes in V1->V2:
- Patch 2:
	- Put preempt_enable()/disable() around RMW accesses to mitigate
	  race conditions. Because on CONFIG_PREEMPT_RCU and sleepable
	  bpf programs, preemption can cause no prog to execute.

BPF programs detect recursion using a per-CPU 'active' flag in struct
bpf_prog. The trampoline currently sets/clears this flag with atomic
operations.

On some arm64 platforms (e.g., Neoverse V2 with LSE), per-CPU atomic
operations are relatively slow. Unlike x86_64 - where per-CPU updates
can avoid cross-core atomicity, arm64 LSE atomics are always atomic
across all cores, which is unnecessary overhead for strictly per-CPU
state.

This patch removes atomics from the recursion detection path on arm64.

It was discovered in [1] that per-CPU atomics that don't return a value
were extremely slow on some arm64 platforms, Catalin added a fix in
commit 535fdfc5a228 ("arm64: Use load LSE atomics for the non-return
per-CPU atomic operations") to solve this issue, but it seems to have
caused a regression on the fentry benchmark.

Using the fentry benchmark from the bpf selftests shows the following:

  ./tools/testing/selftests/bpf/bench trig-fentry

 +---------------------------------------------+------------------------+
 |               Configuration                 | Total Operations (M/s) |
 +---------------------------------------------+------------------------+
 | bpf-next/master with Catalin’s fix reverted |         51.862         |
 |---------------------------------------------|------------------------|
 | bpf-next/master                             |         43.067         |
 | bpf-next/master with this change            |         53.856         |
 +---------------------------------------------+------------------------+

All benchmarks were run on a KVM based vm with Neoverse-V2 and 8 cpus.

This patch yields a 25% improvement in this benchmark compared to
bpf-next. Notably, reverting Catalin's fix also results in a performance
gain for this benchmark, which is interesting but expected.

For completeness, this benchmark was also run with the change enabled on
x86-64, which resulted in a 30% regression in the fentry benchmark. So,
it is only enabled on arm64.

[1] https://lore.kernel.org/all/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop/

Puranjay Mohan (2):
  bpf: move recursion detection logic to helpers
  bpf: arm64: Optimize recursion detection by not using atomics

 include/linux/bpf.h      | 39 ++++++++++++++++++++++++++++++++++++++-
 kernel/bpf/core.c        |  3 ++-
 kernel/bpf/trampoline.c  |  8 ++++----
 kernel/trace/bpf_trace.c |  4 ++--
 4 files changed, 46 insertions(+), 8 deletions(-)


base-commit: ec439c38013550420aecc15988ae6acb670838c1
-- 
2.47.3


