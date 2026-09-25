Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A779C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3AlsvctrhHH+vGo7fgxplGI5ZSMqaM0JSHcNGR5NDb4=; b=DkMgW5Ma0pyOKM5SW2VgtYXgBX
	mbHBGuAyuUCvhd2pQWQP9xT7klfo4d/N+fzJpid5v0qiiioG/SwMaaLoQ4fiGxXCOdoGf6x3Xlunz
	KnOivsHzNkSxNnwOSoSFrx3OkocPmoJ212ClT7OXlmXeRY2r2o0wB70SECblm1xj37nIwIIG4RqMM
	c77sV7UBVwvTV/oiYwZZTMpmoWs5L4joZv2ajWNWtPGVeaPnO3kLsFf2fPy6da8sJhZuoDLUdKNi6
	aHGQVTgqdDLbhvUGTDmkj0pmMBKxhYtbit5c6m9/a6VHFOBxrGGT4fBns1jmJWtdbY7yWnvbiwMOk
	9rAs0Bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAA7g-0000000E6g4-2MUd;
	Fri, 25 Sep 2026 17:54:12 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAA7d-0000000E6fK-03WT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:54:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=p67gamRmEwkUu95LFXAoYMitz/njw63lJRtWJbeZLy4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790358846; v=1; x=1790963646;
 b=QRcboaozLKaoxFUSBaCGy4b55IgVhMVaDeRoLzRLhmMlTQCQug7GTvIT4+z9mSLEqs8OWMG0
 b7UxkZBt47DeevV1W8PhHXtOJjSnJ7ZzdxmxC6RaoVn531n9GqYHqKTGUcGNWDcXcfB89QTaqt3
 pN9c9bPZ0ArbNzZxeTkxoG8U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c0aea6dd7cc8ad8e;
	Fri, 25 Sep 2026 17:54:06 +0000
X-Mizu-Trace-ID: c0aea6dd7cc8ad8e
X-Migadu-Flow: FLOW_OUT
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Date: Fri, 25 Sep 2026 17:53:21 +0000
Subject: [PATCH bpf] bpf, arm64: Fix jited line info off by kCFI hash
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-b4-arm64-bpf-linfo-cfi-v1-1-e930ab335170@linux.dev>
X-B4-Tracking: v=1; b=H4sIABC1tmoC/22NzQ6CMBCEX4Xs2Q2IgOCrGA/tupVVbMnWv4Tw7
 ha8epyZb2YmiKzCEQ7ZBMoviRJ8EttNBtQbf2GUc9JQFmVTdGWNtkKj96ZCOzocxLuA5ARdTbu
 223NVtASpPCo7+azDR0gonH5mfNor02OZXDBrIqNV46lfrGHMKbyD3ljzNfpzBfP8BektMb+2A
 AAA
X-Change-ID: 20260925-b4-arm64-bpf-linfo-cfi-f5c3897e408c
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Maxwell Bland <mbland@motorola.com>, 
 Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_105409_359137_67566997 
X-CRM114-Status: GOOD (  13.18  )
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

With CONFIG_CFI=y, the jited line info of every arm64 BPF program is
off by one instruction, so tools that use it show the wrong source line.

The JIT counts ctx.offset[] from ctx.ro_image. Since commit
710618c760c0 ("arm64/cfi,bpf: Support kCFI + BPF on arm64"),
prog->bpf_func starts past the 4-byte kCFI hash, and
bpf_prog_fill_jited_linfo() adds the offsets to prog->bpf_func.

Subtract cfi_get_offset() from the offsets before the fill, and move
the fill after bpf_prog_update_insn_ptrs(), which needs the offsets
relative to ctx.ro_image.

Fixes: 710618c760c0 ("arm64/cfi,bpf: Support kCFI + BPF on arm64")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260904014748.C04AA1F000E9@smtp.kernel.org/
Reported-by: Alexei Starovoitov <ast@kernel.org>
Closes: https://lore.kernel.org/all/DLNXZ2WK7TPD.2RZBUNRS4FA4L@gmail.com/
Assisted-by: LLM
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
Tested in an arm64 KVM guest with CONFIG_CFI=y. Without this patch
every line info entry after a function's first was off by one
instruction, and with it every entry was correct.
---
 arch/arm64/net/bpf_jit_comp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c5f55d6161fee..cdc98efc1acf0 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2345,14 +2345,21 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		/* offset[prog->len] is the size of program */
 		for (i = 0; i <= prog->len; i++)
 			ctx.offset[i] *= AARCH64_INSN_SIZE;
-		bpf_prog_fill_jited_linfo(prog, ctx.offset + 1);
 		/*
 		 * The bpf_prog_update_insn_ptrs function expects offsets to
 		 * point to the first byte of the jitted instruction (unlike
-		 * the bpf_prog_fill_jited_linfo above, which, for historical
+		 * the bpf_prog_fill_jited_linfo below, which, for historical
 		 * reasons, expects to point to the next instruction)
 		 */
 		bpf_prog_update_insn_ptrs(prog, ctx.offset, ctx.ro_image);
+		/*
+		 * Line info is relative to prog->bpf_func, which starts
+		 * cfi_get_offset() bytes into ro_image. Shift the offsets here,
+		 * after bpf_prog_update_insn_ptrs(), which needs them unshifted.
+		 */
+		for (i = 0; i <= prog->len; i++)
+			ctx.offset[i] -= cfi_get_offset();
+		bpf_prog_fill_jited_linfo(prog, ctx.offset + 1);
 out_off:
 		if (!ro_header && priv_stack_ptr) {
 			free_percpu(priv_stack_ptr);

---
base-commit: ad139384ecddb6f3e7e3c3c12765aafae0e39670
change-id: 20260925-b4-arm64-bpf-linfo-cfi-f5c3897e408c

Best regards,
--  
Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>


