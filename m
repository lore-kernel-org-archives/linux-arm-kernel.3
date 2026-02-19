Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DD7E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LRtR7BaGNupDWJtUJ58LFj4w6zAqDSzxcIixhPEboME=; b=heigCfx4koEi3137a4QEA/3iMt
	9mjRgKaE3qbmj1vwiBsGAuhSZYUJ3uE/Qu5Aq1szLfrN6z02Y+PFnj2lmBXZgDO2pYtR40bXR+q6B
	sRWADieonh2y3kCUKO0PU4fLj2aa3ANFez8yIK+oTd+r3ezOovALKoNBpWEcEkq8spoe4KGdkwFjN
	ZonJmlzgFWXPgfeOTf/tIhIQ9vr/EMa5aUNA2Gmw0I6lwm1okNzcOu3wryZ1mGiRNGZ9Il9sH21DM
	ftZb/9MAxLJBXEbraj4Va8RIFM3jWIxeGBKGyropGllm3SuDXmcXriM808WTSd/4OzOfOvEeqTuXJ
	OCzgE7YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt536-0000000BRwy-3zNe;
	Thu, 19 Feb 2026 14:30:36 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt533-0000000BRvq-0h7E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:30:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771511415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LRtR7BaGNupDWJtUJ58LFj4w6zAqDSzxcIixhPEboME=;
	b=lR2culyrTuf+k/z/wvJ7a4TUVJtUKioslDuE04IeFiNfDyawkkQoEMJkVNpSWGmNExEPFF
	Zzz9Cu/xfdoAwYIVGaS/KJNhqdaV5GF/Ud+dTmgeV5uAC/UIabDJL1FUIHTlOxvi0sV8O9
	J8IYCsIie3aBLLg+bK95zRLvhIVzVaM=
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
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v2 0/6] bpf: Introduce 64-bit bitops kfuncs
Date: Thu, 19 Feb 2026 22:29:22 +0800
Message-ID: <20260219142933.13904-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_063033_361368_E2637CFE 
X-CRM114-Status: UNSURE (   9.84  )
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

This series adds generic 64-bit bitops kfuncs and JIT inlining support
on x86_64 and arm64.

The new kfuncs are:

* bpf_clz64(): Count leading zeros.
* bpf_ctz64(): Count trailing zeros.
* bpf_ffs64(): Find first set bit, 1-based index, returns 0 when input is 0.
* bpf_fls64(): Find last set bit, 1-based index.
* bpf_bitrev64(): Reverse bits.
* bpf_popcnt64(): Population count.
* bpf_rol64(): Rotate left.
* bpf_ror64(): Rotate right.

Defined zero-input behavior:

* bpf_clz64(0) = 64
* bpf_ctz64(0) = 64
* bpf_ffs64(0) = 0
* bpf_fls64(0) = 0

bpf_ffs64() was previously discussed in
"bpf: Add generic kfunc bpf_ffs64()" [1].

The main concern in that discussion was ABI overhead: a regular kfunc call
follows the BPF calling convention and can introduce extra spill/fill compared
to dedicated instructions.

This series keeps the user-facing API as kfuncs while avoiding that overhead
on hot paths. When the JIT/backend and CPU support it, calls are inlined into
native instructions; otherwise they fall back to regular function calls.

Links:
[1] https://lore.kernel.org/bpf/20240131155607.51157-1-hffilwlqm@gmail.com/

Changes:
v1 -> v2:
* Drop RFC.
* Add __cpu_feature annotation for CPU-feature-gated tests.
* Add JIT disassembly tests for 64-bit bitops kfuncs
* Address comments from Alexei:
  * Drop KF_MUST_INLINE.
  * Drop internal BPF_ALU64 opcode BPF_BITOPS.
  * Mark all of the kfuncs as fastcall and do push/pop in JIT when necessary.
* v1: https://lore.kernel.org/bpf/20260209155919.19015-1-leon.hwang@linux.dev/

Leon Hwang (6):
  bpf: Introduce 64-bit bitops kfuncs
  bpf, x86: Add 64-bit bitops kfuncs support for x86_64
  bpf, arm64: Add 64-bit bitops kfuncs support
  selftests/bpf: Add tests for 64-bit bitops kfuncs
  selftests/bpf: Add __cpu_feature annotation for CPU-feature-gated
    tests
  selftests/bpf: Add JIT disassembly tests for 64-bit bitops kfuncs

 arch/arm64/net/bpf_jit_comp.c                 | 123 ++++++++++++
 arch/x86/net/bpf_jit_comp.c                   | 141 +++++++++++++
 include/linux/filter.h                        |  10 +
 kernel/bpf/core.c                             |   6 +
 kernel/bpf/helpers.c                          |  50 +++++
 kernel/bpf/verifier.c                         |  53 ++++-
 .../testing/selftests/bpf/bpf_experimental.h  |   9 +
 .../testing/selftests/bpf/prog_tests/bitops.c | 188 ++++++++++++++++++
 tools/testing/selftests/bpf/progs/bitops.c    |  68 +++++++
 .../testing/selftests/bpf/progs/bitops_jit.c  | 153 ++++++++++++++
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   7 +
 tools/testing/selftests/bpf/test_loader.c     | 150 ++++++++++++++
 12 files changed, 957 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bitops.c
 create mode 100644 tools/testing/selftests/bpf/progs/bitops.c
 create mode 100644 tools/testing/selftests/bpf/progs/bitops_jit.c

-- 
2.52.0


