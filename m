Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB40BF531C7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKRDo5RMyMp1WQH2DRLCfwzvvhL+ti7+7E49Yqmv5EI=; b=0QaSFeWX3wJLMfELSJq9zCwsV+
	wgyyqRoXhkmTPVJwxy8vKY5TyeY1GD63A+PriB1QFlP+DQMefQEu8bYPO4Wctv+aRurzv6B0YTPXq
	LMMEoD0egOsW8pMiAKketyRaHCRPMvore9Cw/G4Ftn+J6zA4XQmMYpBr+fOCbhJ7C3kfP34+iBrMq
	z2popsYCDT5IuojOx05T/L6zlQ1zMu+XmBnYvKu+qvK7VSIQisL36XATnJtIhnR7JV1zNhvsrOczp
	SzsB4UsVImhGDfLcqDbot0NRypnYpmyel5hpewf1ErSiKmKIpyMUw2DNiuZrqyGrM7vQzxRvUuiFA
	1z0o5I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMgw-0000000GGx1-0VDI;
	Mon, 13 Apr 2026 19:11:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMgt-0000000GGw3-3C65;
	Mon, 13 Apr 2026 19:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E12E44569;
	Mon, 13 Apr 2026 19:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294B8C2BCAF;
	Mon, 13 Apr 2026 19:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776107483;
	bh=RaXnAWNff4duq1RNyPN0ZReQj1L/HbYwn3Mst5z7mDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LlCnP6RmxuAKB0gAI1nC7kPGEqeRRo2NXdlC9bNO65KDApEEdDpNeU4z90SabRxIB
	 EoHZGegIveSk6125qX30acurctIP7EWFM79fmbCGfHNpIDYKUUpCm/tqhIB2zsdRoV
	 wxBd9ehytg5O5ohrJvj3npz3Ld5au/mK1GznFKr1Gl97266oouDFBUbeWexk5VaZgn
	 y8k7DF2cJI4Pev+eCA3uKLdAlfeWA+Fz9KfLJeIm3Yijmo9pa+lbRtOkY2VX2YhMwp
	 e7+xMgK560SlBDGM9nmdlrK4Gbil0+C9vFPww1PnHuuvcWzvfqH6V0Ijw/3720apij
	 zkwL7tSaBL+cg==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	"Yonghong Song" <yonghong.song@linux.dev>,
	"Jiri Olsa" <jolsa@kernel.org>,
	"Xu Kuohai" <xukuohai@huaweicloud.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	"Luke Nelson" <luke.r.nels@gmail.com>,
	"Xi Wang" <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"Pu Lehui" <pulehui@huawei.com>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 1/2] bpf, arm64: Remove redundant bpf_flush_icache() after pack allocator finalize
Date: Mon, 13 Apr 2026 12:11:08 -0700
Message-ID: <20260413191111.3426023-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413191111.3426023-1-puranjay@kernel.org>
References: <20260413191111.3426023-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_121123_839031_C528C55F 
X-CRM114-Status: GOOD (  11.77  )
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

bpf_flush_icache() calls flush_icache_range() to clean the data cache
and invalidate the instruction cache for the JITed code region. However,
since commit 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory
management"), this flush is redundant.

bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
region via bpf_arch_text_copy() -> aarch64_insn_copy() -> __text_poke(),
and __text_poke() already calls flush_icache_range() on the written
range. The subsequent bpf_flush_icache() repeats the same cache
maintenance on an overlapping range, including an unnecessary second
synchronous IPI to all CPUs via kick_all_cpus_sync().

Remove the redundant bpf_flush_icache() call and its now-unused
definition.

Fixes: 1dad391daef1 ("bpf, arm64: use bpf_prog_pack for memory management")
Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index adf84962d579..7417d24a5b6f 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -18,7 +18,6 @@
 
 #include <asm/asm-extable.h>
 #include <asm/byteorder.h>
-#include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
@@ -1961,11 +1960,6 @@ static int validate_ctx(struct jit_ctx *ctx)
 	return 0;
 }
 
-static inline void bpf_flush_icache(void *start, void *end)
-{
-	flush_icache_range((unsigned long)start, (unsigned long)end);
-}
-
 static void priv_stack_init_guard(void __percpu *priv_stack_ptr, int alloc_size)
 {
 	int cpu, underflow_idx = (alloc_size - PRIV_STACK_GUARD_SZ) >> 3;
@@ -2204,12 +2198,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 			prog = orig_prog;
 			goto out_off;
 		}
-		/*
-		 * The instructions have now been copied to the ROX region from
-		 * where they will execute. Now the data cache has to be cleaned to
-		 * the PoU and the I-cache has to be invalidated for the VAs.
-		 */
-		bpf_flush_icache(ro_header, ctx.ro_image + ctx.idx);
 	} else {
 		jit_data->ctx = ctx;
 		jit_data->ro_image = ro_image_ptr;
-- 
2.52.0


