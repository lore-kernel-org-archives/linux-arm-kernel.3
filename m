Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A3FA3729
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiRCJtw4ELvsXjmY6Q3y3Drgdzip5X30NSHjEWzRHx0=; b=GLl1N5Bvgpdilz2G+T9ogm9XHs
	1/5IXciAtUBe1VwrbQ0TDRn88Z3z399Xiffg7cnDRlnXzsEFlYZxmjBChik6VzB/j2q5quRvSM5c4
	W9bYhOq163oaF5mb4hStKBzxSQ/uutb/YxNVtCDxsk5IfGkbQKH7FgXWGpqk2DpTCWJSQGaaVf4We
	yPDLeT7DPJg3AFLNC9laQt5+GfPqI1yzwQXMpd4ZLNkxUR0vCpu/TvQ5gtqVxJQmvp2X7afQ6QoOq
	jDsGCSSPqJVobV74q0lgQNsUMd8Act91o8euNuOQxMl3J/owYKmKXkXamye4jGVQg3b3CPLAVLQvK
	aFruJrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgf9-00000008OjB-3Jqc;
	Fri, 02 Jan 2026 15:01:59 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgf6-00000008OhR-41Qv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:01:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767366101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BiRCJtw4ELvsXjmY6Q3y3Drgdzip5X30NSHjEWzRHx0=;
	b=DabqC3OWDAIBs9M6SPPDyL32w6/4Fhiq9+8+V0B+dkhXafrqj6RoOvDXCi0nKj/H2LekNl
	tlQzcLDVBn687MtMndiRNxC1ZzpwZClYqefHi4YPuV0sNwc+md5/3/c+HmKCGAB7DyFCJm
	69TpO5x1z1/hNGYzoQQSeSL8q63O0v8=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel-patches-bot@fb.com,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and bpf_func access at runtime
Date: Fri,  2 Jan 2026 23:00:28 +0800
Message-ID: <20260102150032.53106-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_070157_156485_AD9213C3 
X-CRM114-Status: UNSURE (   9.26  )
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

This patch series optimizes BPF tail calls on x86_64 and arm64 by
eliminating runtime memory accesses for max_entries and 'prog->bpf_func'
when the prog array map is known at verification time.

Currently, every tail call requires:
  1. Loading max_entries from the prog array map
  2. Dereferencing 'prog->bpf_func' to get the target address

This series introduces a mechanism to precompute and cache the tail call
target addresses (bpf_func + prologue_offset) in the prog array itself:
  array->ptrs[max_entries + index] = prog->bpf_func + prologue_offset

When a program is added to or removed from the prog array, the cached
target is atomically updated via xchg().

The verifier now encodes additional information in the tail call
instruction's imm field:
  - bits 0-7:   map index in used_maps[]
  - bits 8-15:  dynamic array flag (1 if map pointer is poisoned)
  - bits 16-31: poke table index + 1 for direct tail calls

For static tail calls (map known at verification time):
  - max_entries is embedded as an immediate in the comparison instruction
  - The cached target from array->ptrs[max_entries + index] is used
    directly, avoiding the 'prog->bpf_func' dereference

For dynamic tail calls (map pointer poisoned):
  - Fall back to runtime lookup of max_entries and prog->bpf_func

This reduces cache misses and improves tail call performance for the
common case where the prog array is statically known.

Leon Hwang (4):
  bpf: tailcall: Introduce bpf_arch_tail_call_prologue_offset
  bpf, x64: tailcall: Eliminate max_entries and bpf_func access at
    runtime
  bpf, arm64: tailcall: Eliminate max_entries and bpf_func access at
    runtime
  bpf, lib/test_bpf: Fix broken tailcall tests

 arch/arm64/net/bpf_jit_comp.c | 71 +++++++++++++++++++++++++----------
 arch/x86/net/bpf_jit_comp.c   | 51 ++++++++++++++++++-------
 include/linux/bpf.h           |  1 +
 kernel/bpf/arraymap.c         | 27 ++++++++++++-
 kernel/bpf/verifier.c         | 30 ++++++++++++++-
 lib/test_bpf.c                | 39 ++++++++++++++++---
 6 files changed, 178 insertions(+), 41 deletions(-)

--
2.52.0


