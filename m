Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9766FE66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4V9VA1XDbpFtZVVIdaF/WY/aHFHW45SUH5maTsaC+fk=; b=ZZ9o3zN1elnwQA1/uu0pmrQkDm
	6zLY54QdgjUKdMh7XkU/pVCkeKN1d3ZC/lyMvjVrFJwFk3Q6CgwCTMIgor0h05k3mfX6+Sl25Ky1b
	whF2LCjOVb+Ofort0Eu+/GkNCu3i8IEgs4L7sFlHYUQxj8FHWeNyv20rdOfDKCXWcQOiwObxeyNS8
	ycvGfqY6c4knBZOx4U7fKMUY0tsiP05lC3OHJMcLh+pStd6ux4S4NaDRghhKD86kSneAzmuuFMA6Q
	2uc7TOIALRb+3yu8g6x1IJqj9vLkb+7hCuSXXs2mzbYU3i1h7Hu2wgGFdRn6tVJHIhcHGq3ctH5jn
	MwKK7wjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfTX-0000000AqS5-3FdQ;
	Fri, 19 Dec 2025 18:45:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfTV-0000000AqRy-3o62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 18:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F1CA360008;
	Fri, 19 Dec 2025 18:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817A3C4CEF1;
	Fri, 19 Dec 2025 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766169912;
	bh=fdA4SOinV6miSZMqEmQwwi0gHc728+lALNs8BrpnCfU=;
	h=From:To:Cc:Subject:Date:From;
	b=s07KTV3/t/3VWmRiphv+Bn5MBtMCTbr8s6G6GAMkPXiuQSfuDQqKfqutVHPs1HA4B
	 /HRuExZNbYLsnH+fCr3CuEHnaCPMK1TWHo6dmUvTzV+OsMEPacltUQz/GCRDFev+FN
	 cPITfAkVQw1Z18rvAPOYfwu/v7cdbRf4XnslIwcLkC3SQVS9pPhkwF6lpFGim5VWKP
	 WUXHF710AUTVV9za5TcX/lKaut0YOL6fkmlsrTgq2Y0f1M8pRf9EGIOTKvqu0gktVm
	 uoOBDGt/AYfE0uplvQLEWKX86wK9dhOcjg1nfpVvfzkiKvGzYc2qFp7D2K4kNNRVx0
	 e7zKdqCeTguNA==
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
Subject: [PATCH bpf-next v3 0/2] bpf: Optimize recursion detection on arm64
Date: Fri, 19 Dec 2025 10:44:16 -0800
Message-ID: <20251219184422.2899902-1-puranjay@kernel.org>
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

V2: https://lore.kernel.org/all/20251217233608.2374187-1-puranjay@kernel.org/
Changes in v2->v3:
- Added acked by Yonghong
- Patch 2:
        - Change alignment of active from 8 to 4
        - Use le32_to_cpu in place of get_unaligned_le32()

V1: https://lore.kernel.org/all/20251217162830.2597286-1-puranjay@kernel.org/
Changes in V1->V2:
- Patch 2:
        - Put preempt_enable()/disable() around RMW accesses to mitigate
          race conditions. Because on CONFIG_PREEMPT_RCU and sleepable
	  bpf programs, preemption can cause no bpf prog to execute in
	  case of recursion.

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
 | bpf-next/master with Catalin’s fix reverted |         51.770         |
 |---------------------------------------------|------------------------|
 | bpf-next/master                             |         43.271         |
 | bpf-next/master with this change            |         43.271         |
 +---------------------------------------------+------------------------+

All benchmarks were run on a KVM based vm with Neoverse-V2 and 8 cpus.

This patch yields a 25% improvement in this benchmark compared to
bpf-next. Notably, reverting Catalin's fix also results in a performance
gain for this benchmark, which is interesting but expected.

For completeness, this benchmark was also run with the change enabled on
x86-64, which resulted in a 30% regression in the fentry benchmark. So,
it is only enabled on arm64.

P.S. - Here is more data with other program types:

 +-----------------+-----------+-----------+----------+
 |     Metric      |  Before   |   After   | % Diff   |
 +-----------------+-----------+-----------+----------+
 | fentry          |   43.149  |   53.948  | +25.03%  |
 | fentry.s        |   41.831  |   50.937  | +21.76%  |
 | rawtp           |   50.834  |   58.731  | +15.53%  |
 | fexit           |   31.118  |   34.360  | +10.42%  |
 | tp              |   39.536  |   41.632  |  +5.30%  |
 | syscall-count   |    8.053  |    8.305  |  +3.13%  |
 | fmodret         |   33.940  |   34.769  |  +2.44%  |
 | kprobe          |    9.970  |    9.998  |  +0.28%  |
 | usermode-count  |  224.886  |  224.839  |  -0.02%  |
 | kernel-count    |  154.229  |  153.043  |  -0.77%  |
 +-----------------+-----------+-----------+----------+

[1] https://lore.kernel.org/all/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop/

Puranjay Mohan (2):
  bpf: move recursion detection logic to helpers
  bpf: arm64: Optimize recursion detection by not using atomics

 include/linux/bpf.h      | 38 +++++++++++++++++++++++++++++++++++++-
 kernel/bpf/core.c        |  3 ++-
 kernel/bpf/trampoline.c  |  8 ++++----
 kernel/trace/bpf_trace.c |  4 ++--
 4 files changed, 45 insertions(+), 8 deletions(-)


base-commit: ec439c38013550420aecc15988ae6acb670838c1
-- 
2.47.3


