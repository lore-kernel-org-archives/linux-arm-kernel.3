Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8825ED65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WExEFEZds9rx4cQqlYFHzK/BQsYOxkR/4dw8JRTgy9U=; b=d5qJFQsX95T0ZPWGBHKbhSOxCw
	zXKlgG7ELmsbgLR0g6bLAO06wDbHy8QD8+C8BIqOjRixbxRZOqosQaLIZWcYW+bDaDrwQ0cTy2sqN
	6ajkI7M+DPl25wGzb6ye6VKEnXBa8Wyi0X18yhnd5ky+v5RNN5kptgNqwcvMnA3HyVEIri21UXLVD
	QPHxnVUPCeMT5qAj2JQNawy7p4FcwkoNv3atN8x2pC/48GJQaOPylZo32E2I3qmnnoFeA4rpL7BJz
	ENh0nFBsTVm/ende0fi2W4pZ1vRYkYFXuA0ahGr5hrLWZjbYKfMOIGMnJBoKJfqCtiDimrxRCnYMX
	nR0EzLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuOR-000000076pI-0CIf;
	Wed, 17 Dec 2025 16:28:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuOP-000000076p3-24IL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:28:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A6696055F;
	Wed, 17 Dec 2025 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19034C4CEF5;
	Wed, 17 Dec 2025 16:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765988928;
	bh=wW2WX9bXMy21iLr94pepHPoiTdQS77qviWjUVKa89d8=;
	h=From:To:Cc:Subject:Date:From;
	b=K0kIgPqP3Uguea91P1XJVdtjDsuNURZSx4kUgWYhCOsx5yF9X5+11isYQrmfx1PPg
	 Fh4llRDPvOxBUOyvkQut8q9WKOiSotqqAkW68/c9YbD6Wu8ujE+U6Vwjm5lhC19utL
	 iMnyBEOjSxOjkWY7aoUv933Qk1s58OnjkWpflPbXe8jkRgYavjWRNnw7efK62R+apD
	 udTOwURPmUN4EYDxbZ5I6lJwRqlmO62uRGKIcEdrnw+RuSWsJaCr/jG4sRIYhOh+2Q
	 kiZvmDwNlh35dYgBmvnHYIHB6qjjEr7YN6ewPRvQla5M2hSlvQgjrE8RQ4jQgA+uzC
	 /1V8G0MxndxvA==
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
Subject: [PATCH bpf-next 0/2] bpf: Optimize recursion detection on arm64
Date: Wed, 17 Dec 2025 08:28:25 -0800
Message-ID: <20251217162830.2597286-1-puranjay@kernel.org>
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
 | bpf-next/master with Catalin’s fix reverted |    40.033 ± 0.090      |
 |---------------------------------------------|------------------------|
 | bpf-next/master                             |    34.617 ± 0.018      |
 | bpf-next/master with this change            |    46.122 ± 0.020      |
 +---------------------------------------------+------------------------+

All benchmarks were run on a KVM based vm with Neoverse-V2 and 8 cpus.

This patch yields a 33% improvement in this benchmark compared to
bpf-next. Notably, reverting Catalin's fix also results in a performance
gain for this benchmark, which is interesting but expected.

For completeness, this benchmark was also run with the change enabled on
x86-64, which resulted in a 30% regression in the fentry benchmark. So,
it is only enabled on arm64.

[1] https://lore.kernel.org/all/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop/

Puranjay Mohan (2):
  bpf: move recursion detection logic to helpers
  bpf: arm64: Optimize recursion detection by not using atomics

 include/linux/bpf.h      | 35 ++++++++++++++++++++++++++++++++++-
 kernel/bpf/core.c        |  3 ++-
 kernel/bpf/trampoline.c  |  8 ++++----
 kernel/trace/bpf_trace.c |  4 ++--
 4 files changed, 42 insertions(+), 8 deletions(-)


base-commit: ec439c38013550420aecc15988ae6acb670838c1
-- 
2.47.3


