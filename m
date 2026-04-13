Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEDCF531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqzxBtWu0rXBw6kqi4n6BtCPo7650WKyl0eYqWallC4=; b=OolE+Wp7zBjbi/PuAmlZ5OlHRd
	rTiPV5AKQ/6+s3Edrw8Fjy+PEYRoXKhmsP+FyfbNkQb9wRvUwlV0YqcZhwIMCteOorGcpjeYyImPP
	Jg+XLDGIRg3ELYBtnWQHbbfkmHKABWMtscIS+EeG1EUl/SNBDgvBvD6EG1I/1LQUuyA7a3H3HgCDF
	VYKDuM+kAJwRqQQeA6JQvDGObXQ9rpjJxsz6RzjejSAAA1+P1VlxjSvwA6Eq+xdOBv5cyS19hq2zl
	Yyo9CeRPWbYdg+qtGwN1O8UoQOfx4SRgH5hNmUOJd+KOhz5wl5d9DD74J4PLf80N5b5LkjNv00aDS
	VOX1dtmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMh0-0000000GGzK-1315;
	Mon, 13 Apr 2026 19:11:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMgz-0000000GGyO-0dKp;
	Mon, 13 Apr 2026 19:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67BB961843;
	Mon, 13 Apr 2026 19:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6807C2BCB6;
	Mon, 13 Apr 2026 19:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776107488;
	bh=dVEd6XRC3YyZMNAa6XUNAlW4qEvGGYQcJPArlXG/IdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=in2P7yIM8V0H3sRjPbgW40CcnKPXe4oIBR/kTuZ5oL/ffScEB7YV6T7wTozq59kf9
	 Sk/FqfHP0wDOTHE1WVPcaUy4dAQo956s7NHMa3F//E2LDWrAzMPwMXWnekcIcQ1uVg
	 5pCsfgzNrgpctKjWIDIZ//0fIf8AYaQbKVmsu1OR39sMmHxh1uqDu8g/J0Xsdp1+DW
	 Ks8Iiqvzi62vHC4hrAJ1VPD4HBKxe0k3TUo9+BFM5Xaa5v++zn6b3U4NFfCUvSF4sQ
	 PY2GttWjb2uCFMeCm+4D+P7tjJz3eBQncGRq82ulJ01S+si+W8+biTlX4OgdsVlwEd
	 W6UABdFzEB8eQ==
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
Subject: [PATCH bpf-next v2 2/2] bpf, riscv: Remove redundant bpf_flush_icache() after pack allocator finalize
Date: Mon, 13 Apr 2026 12:11:09 -0700
Message-ID: <20260413191111.3426023-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413191111.3426023-1-puranjay@kernel.org>
References: <20260413191111.3426023-1-puranjay@kernel.org>
MIME-Version: 1.0
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

bpf_flush_icache() calls flush_icache_range() to clean the data cache
and invalidate the instruction cache for the JITed code region. However,
since commit 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the
BPF JIT"), this flush is redundant.

bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
region via bpf_arch_text_copy() -> patch_text_nosync(), and
patch_text_nosync() already calls flush_icache_range() on the written
range. The subsequent bpf_flush_icache() repeats the same cache
maintenance on an overlapping range.

Remove the redundant bpf_flush_icache() call and its now-unused
definition.

Fixes: 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the BPF JIT")
Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/riscv/net/bpf_jit.h      | 6 ------
 arch/riscv/net/bpf_jit_core.c | 7 -------
 2 files changed, 13 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 632ced07bca4..da0271790244 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -11,7 +11,6 @@
 
 #include <linux/bpf.h>
 #include <linux/filter.h>
-#include <asm/cacheflush.h>
 
 /* verify runtime detection extension status */
 #define rv_ext_enabled(ext) \
@@ -105,11 +104,6 @@ static inline void bpf_fill_ill_insns(void *area, unsigned int size)
 	memset(area, 0, size);
 }
 
-static inline void bpf_flush_icache(void *start, void *end)
-{
-	flush_icache_range((unsigned long)start, (unsigned long)end);
-}
-
 /* Emit a 4-byte riscv instruction. */
 static inline void emit(const u32 insn, struct rv_jit_context *ctx)
 {
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index b3581e926436..f7fd4afc3ca3 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -183,13 +183,6 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 			prog = orig_prog;
 			goto out_offset;
 		}
-		/*
-		 * The instructions have now been copied to the ROX region from
-		 * where they will execute.
-		 * Write any modified data cache blocks out to memory and
-		 * invalidate the corresponding blocks in the instruction cache.
-		 */
-		bpf_flush_icache(jit_data->ro_header, ctx->ro_insns + ctx->ninsns);
 		for (i = 0; i < prog->len; i++)
 			ctx->offset[i] = ninsns_rvoff(ctx->offset[i]);
 		bpf_prog_fill_jited_linfo(prog, ctx->offset);
-- 
2.52.0


