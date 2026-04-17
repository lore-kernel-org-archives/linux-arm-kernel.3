Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FCCF4368B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 10:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U5C1KSkyvOgFs4XnY7a0EvJjvZ6uYt8N8OOUk4JhUXE=; b=DrR6AZr308cJEGgLtcPXgRaYfX
	gDOcAhiCMG1Ug1lLVrsfOorJudCQXoFeVWZTxRfyUZH7u+k8Ia7RfWsr33a88k48csg+b0Fgqdm54
	ZL1/qndOSgDqKHv9lLuD+ilYzYWVXH54bmRg48rsQWRhjWHS39zv3D2mBdL6KSxk84LVnaN61+N1Y
	1ISbDu0D/RHZRnn2GOo1CO8sIYiFuZcyA4h5ja/KOm7ob18N9pmN2SQvxcBWzWxgJLx3dov7fIrLs
	K/eEr3Z1HW8KGWc/7lQ/nyIQWhvXKDWuxBTJMyKbiKTWBunkhnct5cGZ/CN9nfMg2+Jxrxictv0Sq
	68/cPvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgT5-00000003uOd-2NT8;
	Fri, 17 Apr 2026 10:30:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgT2-00000003uOD-3i1g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 10:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFFDE44242;
	Fri, 17 Apr 2026 10:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744DAC19425;
	Fri, 17 Apr 2026 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776421831;
	bh=2E4d1qouBPXWGfdzHg/+sJ/fKFP5VEVndh+tz3UYOQo=;
	h=From:To:Cc:Subject:Date:From;
	b=u7PT3mhbdOslKrKsXaF7exF4cOmFaso6kJ2h7mDwokYiJ+cHmAw18Ng0QQTieDaWN
	 4gIKZT87Y+D/+FdDPD1twGXHrktYfY70F3d0/6ES9a2pjTElF5qPIAa5Z5deyjfuY7
	 6esmP3oSM9XVTSiK8RhcVneHCjZlVyLVLv66edYnfVNzfDzHFvIjaZ/2ylY2xL5Thv
	 f2voW9UeaoAKgSGguTlTj56Gmu/U1XwFznGly4UmntVbBdS0+g0R3Oh/+jMLnh49bu
	 inAtGQ5GJ7ok+bN0lrmIs4urIQqLbT7IxhdMb3matqIu9QI0ArLiEtgEzZLuecSPIm
	 dSWE434p/2tKA==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Jonas Rebmann <jre@pengutronix.de>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	kernel@pengutronix.de
Subject: [PATCH bpf-next] bpf, arm32: Reject BPF_PSEUDO_CALL in the JIT
Date: Fri, 17 Apr 2026 03:30:02 -0700
Message-ID: <20260417103004.3552500-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_033033_501314_41267679 
X-CRM114-Status: GOOD (  14.06  )
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

The ARM32 BPF JIT does not support BPF-to-BPF function calls
(subprogram calls). When insn->src_reg == BPF_PSEUDO_CALL, the
imm field contains a pc-relative offset to another BPF function,
not a helper function index.

When a program containing BPF-to-BPF calls is loaded, the verifier
invokes bpf_jit_subprogs() which calls bpf_int_jit_compile() for each
subprogram. Since ARM32 does not reject BPF_PSEUDO_CALL, the JIT
silently emits code for the call using the wrong address computation:

    func = __bpf_call_base + imm

where imm is actually a pc-relative subprogram offset, producing
a bogus function pointer. Because build_body() reports success,
bpf_jit_binary_alloc() is reached and a JIT image is allocated.

ARM32 also lacks the jit_data/extra_pass mechanism needed for
the second JIT pass in bpf_jit_subprogs(). On the second pass,
bpf_int_jit_compile() performs a full fresh compilation,
allocating a new JIT binary and overwriting prog->bpf_func. The
first allocation is never freed. bpf_jit_subprogs() then detects
the function pointer changed and aborts with -ENOTSUPP, but the
original JIT binary has already been leaked. Each program
load/unload cycle leaks one JIT binary allocation, as reported
by kmemleak:

    unreferenced object 0xbf0a1000 (size 4096):
      backtrace:
        bpf_jit_binary_alloc+0x64/0xfc
        bpf_int_jit_compile+0x14c/0x348
        bpf_jit_subprogs+0x4fc/0xa60

Fix this by rejecting BPF_PSEUDO_CALL early in build_insn(),
falling through to the existing 'notyet' path. This causes
build_body() to fail before any JIT binary is allocated, so
bpf_int_jit_compile() returns the original program unjitted.
bpf_jit_subprogs() then sees !prog->jited and cleanly falls
back to the interpreter.

Fixes: 1c2a088a6626 ("bpf: x64: add JIT support for multi-function programs")
Reported-by: Jonas Rebmann <jre@pengutronix.de>
Closes: https://lore.kernel.org/bpf/b63e9174-7a3d-4e22-8294-16df07a4af89@pengutronix.de
Tested-by: Jonas Rebmann <jre@pengutronix.de>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/arm/net/bpf_jit_32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index deeb8f292454..91fef10e88bc 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -2047,6 +2047,8 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	/* function call */
 	case BPF_JMP | BPF_CALL:
 	{
+		if (insn->src_reg == BPF_PSEUDO_CALL)
+			goto notyet;
 		const s8 *r0 = bpf2a32[BPF_REG_0];
 		const s8 *r1 = bpf2a32[BPF_REG_1];
 		const s8 *r2 = bpf2a32[BPF_REG_2];

base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
-- 
2.52.0


