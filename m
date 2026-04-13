Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226F6F34C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgGJZonHx4G5XRpuehuWe55RuRKfs7yfu3qS0jpqwJA=; b=r1GxV71usXibwzp6YfEVosWc3v
	qlCackMp7TzRjNDuKV/3Hbk9a+jCN2oGSysLzi2IYr2m3cDtzwUVn3Dz4dL8z96kzfSKGR3r/qswi
	ml9AvJQp/ZAoVFV41YxdWDqvRaRXnId23iDMwxPCaxb5grCZX9EyigiPzlJZZzSzosvnOupO3R2vW
	UD3ybE0ALa9XHw0Xgc2LCgcOHVnfGg6peaVRpOI5u+lEpA7sHCSW8BY65Mr09bA2lvMTyt8hCJpbP
	ByERWsHw8WPQB63Mk/Bk/kmAAYD4++a6Y8qGnofaatT1ky4RaDhIODgalJH9glsSK2ccDbXCQhVRo
	gQ7OqBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGTy-0000000FeSL-0oOv;
	Mon, 13 Apr 2026 12:33:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGTv-0000000FeRI-3IVp;
	Mon, 13 Apr 2026 12:33:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A179743F68;
	Mon, 13 Apr 2026 12:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C778C2BCAF;
	Mon, 13 Apr 2026 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776083614;
	bh=s2vi1gMOe/zR29r19y5FbZV0U3O5/J47TujbBaojO2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tyVdMkfK4Oedgp2gw/N++DpkgaKb8l8tqh6RNQQu+m78z4PZX76lWAkk7uCa7uTzw
	 WjO4QNoNAx8PaoFPUDio7r7lHUblHPTnjKE+CSKp2IFpaRCr2O7H7qA+Ov33NVq9/7
	 6oqMi2QvgGZ6rInIBaUEcu4wIsjD+tRbVYAmw6sIJvml1IF7ow6rvdRSr3DOLeIk1J
	 Gx72Cfs3ZAm26IK48vwf1zqZr1sSng05KRjk1fpTRty7IiznAstw4qSYj016I6PnKz
	 iggPuonwpdFCEul7W4eCW05XVHjsdAQq5jw6sisOiWjot2aosVsu/Oa7PqOLokO80m
	 TiydTUzKdzQkw==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 2/2] bpf, riscv: Remove redundant bpf_flush_icache() after pack allocator finalize
Date: Mon, 13 Apr 2026 05:32:55 -0700
Message-ID: <20260413123256.3296452-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413123256.3296452-1-puranjay@kernel.org>
References: <20260413123256.3296452-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_053335_867361_C6DE4369 
X-CRM114-Status: GOOD (  10.54  )
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
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/riscv/net/bpf_jit.h      | 5 -----
 arch/riscv/net/bpf_jit_core.c | 7 -------
 2 files changed, 12 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 632ced07bca4..549537cad86b 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -105,11 +105,6 @@ static inline void bpf_fill_ill_insns(void *area, unsigned int size)
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


