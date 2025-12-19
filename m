Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70196E66882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 19:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pi+ELp89npJysbUybDtR5XaNg3DlUcEmwMc8Cq1pXBQ=; b=wjoF32yiWqdHbb2VjCuqLIYKuj
	wVoDtR+IShJ6IcVgk2NpUr404qJjCprAD8vUDRd1LxVHQPGwpOm5Bm5VurBBMX09gujTvXDJ1fyVK
	mcoujHTuAJB3IhxVBnR9qEPFqmrSuK/8BeTdy/97590T8dP6ToLXi0JRso7JmTE/kXRHnLwayKUkB
	U+sf8ur90pFBHGTkE1MeM1s6DNqIPXNM5t2Ut8UrD+pu5Nk5vK6lp7AS8vhPsXb+llB73eHtTy/ZO
	e4cUj2lzZQ0lK3+6RY2MaRaupj3tEDuIHrNbiO3dKeewYSXH+B691ssP5qX6apec2F19j8YwWGymZ
	RdCPPQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWful-0000000AsJj-0hPl;
	Fri, 19 Dec 2025 19:13:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfui-0000000AsJN-1BW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 19:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98C1940E30;
	Fri, 19 Dec 2025 19:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E50C4CEF1;
	Fri, 19 Dec 2025 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766171599;
	bh=bNjCGaEWJYJ9D3C/P+SCnczJupzEw0pdhQAN2wkW+FQ=;
	h=From:To:Cc:Subject:Date:From;
	b=KDgyx7yvvBl7t6cWEy5UX965mT27TE6ZyhMo7X2huTva91K6g4pUPHG/nAy7PdEXU
	 6V04AAF2ogpTiCZ28pIsXv0nmqUagijrRI4NexZJZssL4fhHCgWgVcYsiZWCVr+fGf
	 4yfK5IbRiTpVTpX3FI5WwrnAGV2PDPt2nE55xZa/uWNn8n6bkhqtzoJdQF+bwvMkvd
	 dSsTquVb90K4NBQcrYkYNHYmuJILDuYDetNkGqovg6/rWWo1TZupCWHnbXORrMqWlz
	 rtovLyhNMj99Wjbgrq3IGxjNredqAs22YX223sNW51OMXZb36vJr5ZQnUk4AGgk/XS
	 3QGo47LsKqerA==
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
	linux-arm-kernel@lists.infradead.org,
	Yonghong Song <yonghong.song@linux.dev>
Subject: [PATCH bpf-next] bpf: arm64: fix sparse warnings
Date: Fri, 19 Dec 2025 11:13:08 -0800
Message-ID: <20251219191310.3204425-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_111320_343582_276AA141 
X-CRM114-Status: GOOD (  10.99  )
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

ctx->image is declared as __le32 because arm64 instructions are LE
regardless of CPU's runtime endianness. emit_u32_data() emits raw data
and not instructions so cast the value to __le32 to fix the sparse
warning.

Cast function pointer to void * before doing arithmetic.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index b6eb7a465ad2..0c4d44bcfbf4 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -118,7 +118,7 @@ static inline void emit(const u32 insn, struct jit_ctx *ctx)
 static inline void emit_u32_data(const u32 data, struct jit_ctx *ctx)
 {
 	if (ctx->image != NULL && ctx->write)
-		ctx->image[ctx->idx] = data;
+		ctx->image[ctx->idx] = (__force __le32)data;
 
 	ctx->idx++;
 }
@@ -3139,7 +3139,7 @@ void bpf_jit_free(struct bpf_prog *prog)
 			bpf_jit_binary_pack_finalize(jit_data->ro_header, jit_data->header);
 			kfree(jit_data);
 		}
-		prog->bpf_func -= cfi_get_offset();
+		prog->bpf_func = (void *)prog->bpf_func - cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
 		priv_stack_ptr = prog->aux->priv_stack_ptr;

base-commit: ec439c38013550420aecc15988ae6acb670838c1
-- 
2.47.3


