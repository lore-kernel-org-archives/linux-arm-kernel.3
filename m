Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AC4F436AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B40Tc7dJH4rg3YoXGiiHW5iAcwEOUPSqipLIG3uL0Bs=; b=OEt/IzX9Q7iGzF1l3SOXpvL+Oh
	DAZKT9OlFWWFBhp0r2vonY+ilXDeMAT5TLq8QbZ08xDcMW4teTreNejmabnERGzL8d/UWqpinh65Q
	hCBXCk06YI0D5NX7twHat+86QrxONwQqmGtwxP7VcHLqjADNqqfX6qME4bruesuqg+mxxZ/WKAkDL
	ppRjcZgj8bpLJ2ggOUR1lSzcerXWAwvig/I9u/8wDlMj7eeyp1J0on4eKFD9uQnzQ1V2qip7ECwu8
	lcQCxaFhFJUpk7gpjBAz/5+ByuDM9K/NuPnakhnTg7kYcxcvtPA9phS5rOAcN2pfAijyUiVeE5WSa
	u9D7c2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkGx-000000048nB-3wq6;
	Fri, 17 Apr 2026 14:34:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkGw-000000048n3-28cQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A3266013A;
	Fri, 17 Apr 2026 14:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF39FC19425;
	Fri, 17 Apr 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776436457;
	bh=6lFrV0Kxuw3w+OJK4u6i+vEPG0MGSRXRYCqYEaZOWXw=;
	h=From:To:Cc:Subject:Date:From;
	b=oYyIABYQePjYduahiiY3ku9Rbi3nROJIHbEQFvWciGFArMwJUrzs1dDcpk0vMwTyO
	 c/A/AEdkSFJBj24NC+vWvWsc2f93i0EVIwyKuShqf2A7cG8/3FySxctWfqvJ+R3Oqn
	 Ge+M0c5vO934VjQM57jfB/+H72ACagGdWOarOdTYXS3oCrZxrL+jdi4NRIr1LsoYmw
	 P4+x7yM13ImVlzzDH/WOWZ02HOC8hawaWA6wrWk4hqV5M6kcOesVvmgQJZ73jzOz6P
	 APsnt13y37N6yj2b4lnftDkh1ZzF0i+Yy/cL1FYikU3jh9fjUEoapny0aP/fPN4NNC
	 7YNb0gvQHnEzw==
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
Subject: [PATCH bpf-next v2] arm32, bpf: Reject BPF-to-BPF calls and callbacks in the JIT
Date: Fri, 17 Apr 2026 07:33:52 -0700
Message-ID: <20260417143353.838911-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
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

The ARM32 BPF JIT does not support BPF-to-BPF function calls
(BPF_PSEUDO_CALL) or callbacks (BPF_PSEUDO_FUNC), but it does
not reject them either.

When a program with subprograms is loaded (e.g. libxdp's XDP
dispatcher uses __noinline__ subprograms, or any program using
callbacks like bpf_loop or bpf_for_each_map_elem), the verifier
invokes bpf_jit_subprogs() which calls bpf_int_jit_compile()
for each subprogram.

For BPF_PSEUDO_CALL, since ARM32 does not reject it, the JIT
silently emits code using the wrong address computation:

    func = __bpf_call_base + imm

where imm is a pc-relative subprogram offset, producing a bogus
function pointer.

For BPF_PSEUDO_FUNC, the ldimm64 handler ignores src_reg and
loads the immediate as a normal 64-bit value without error.

In both cases, build_body() reports success and a JIT image is
allocated. ARM32 lacks the jit_data/extra_pass mechanism needed
for the second JIT pass in bpf_jit_subprogs(). On the second
pass, bpf_int_jit_compile() performs a full fresh compilation,
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

Fix this by rejecting both BPF_PSEUDO_CALL in the BPF_CALL
handler and BPF_PSEUDO_FUNC in the BPF_LD_IMM64 handler, falling
through to the existing 'notyet' path. This causes build_body()
to fail before any JIT binary is allocated, so
bpf_int_jit_compile() returns the original program unjitted.
bpf_jit_subprogs() then sees !prog->jited and cleanly falls
back to the interpreter with no leak.

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Fixes: 1c2a088a6626 ("bpf: x64: add JIT support for multi-function programs")
Reported-by: Jonas Rebmann <jre@pengutronix.de>
Closes: https://lore.kernel.org/bpf/b63e9174-7a3d-4e22-8294-16df07a4af89@pengutronix.de
Tested-by: Jonas Rebmann <jre@pengutronix.de>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---

Changelog:
v1: https://lore.kernel.org/all/20260417103004.3552500-1-puranjay@kernel.org/
Changes in v2:
- Add Acked-by: Daniel Borkmann <daniel@iogearbox.net>
- Reject BPF_PSEUDO_FUNC in the BPF_LD | BPF_IMM | BPF_DW handler
- Move code below declarations

---
 arch/arm/net/bpf_jit_32.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index deeb8f292454..a900aa973885 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1852,6 +1852,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	{
 		u64 val = (u32)imm | (u64)insn[1].imm << 32;
 
+		if (insn->src_reg == BPF_PSEUDO_FUNC)
+			goto notyet;
+
 		emit_a32_mov_i64(dst, val, ctx);
 
 		return 1;
@@ -2055,6 +2058,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx)
 		const s8 *r5 = bpf2a32[BPF_REG_5];
 		const u32 func = (u32)__bpf_call_base + (u32)imm;
 
+		if (insn->src_reg == BPF_PSEUDO_CALL)
+			goto notyet;
+
 		emit_a32_mov_r64(true, r0, r1, ctx);
 		emit_a32_mov_r64(true, r1, r2, ctx);
 		emit_push_r64(r5, ctx);

base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
-- 
2.52.0


