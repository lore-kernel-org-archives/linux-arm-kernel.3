Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E359F436B7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t14vhZSjmGxogVnlCT4l5sQln05+hcpZfQZufv0lCmU=; b=VFA4hqEsowuO+zbFm+wh44BfUr
	yYOlStIZ3Nt/MkJnWMVZvxWjdgqnPIPj5kxL/oHPsqfjVEEeIcxeiXE1WBptF1DLWCAov4z9LhvqA
	2MjrIq0z0jWdtI9YYeBOv1A3okdsrv9OuTxp4/7pE7dWGYkp2RtEgRwfufsLtib2Y99WH+KLUZFQK
	W90RzrMg7rvI+SjAczVCc/6AaXc9uCbODsUSBbUDoVbI+RHSC6d30AvdvpWZvAYg+0D2UzoRQlRVD
	jbBRmxzYzRW+Kq3VI3nTaGQxq1hWKIQlRuuDPoV6JvGt5P+HudKqtek9TX+Qoqw8Dq/F7Hf3IFE6y
	tmcP/mNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlQg-00000004ECW-3h9X;
	Fri, 17 Apr 2026 15:48:26 +0000
Received: from mail-dl1-x1243.google.com ([2607:f8b0:4864:20::1243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlQc-00000004EBm-2CRS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 15:48:25 +0000
Received: by mail-dl1-x1243.google.com with SMTP id a92af1059eb24-12c45281a06so1139222c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1776440901; x=1777045701; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t14vhZSjmGxogVnlCT4l5sQln05+hcpZfQZufv0lCmU=;
        b=XC26aH9p2Zm7cxJSF1clWQA46dqOjPNcaNlvd3vLotTswcnMlzjIEW3YaecWRK+Rl5
         A0DuUQrOMbGyoIfO1OwIk0Kwk+j/YPWnPnSQ+hZnrjhFiFkhJ0hsQMvyUrhWmA4h90UF
         n0m4Z+TiSws7OBvzdHMv/Qq+uNVJ4nDVsTBcBtGYhs/4PYvQ2yy9lsxJpT4gAX6moF4O
         G31nTOBa21cpIbdN+hHRFmRQawVNjZdkfaeEdk/mnsegyVyrwtzX78Nfs1VZeWmfjHTZ
         lzCwUMdioo+OC26jz5oTLtYNPZN0ZwTW8db0wSWgATDOewiiuXnr9l/NzC0o4DcSWrcJ
         VXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776440901; x=1777045701;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t14vhZSjmGxogVnlCT4l5sQln05+hcpZfQZufv0lCmU=;
        b=F2ypBxmsTd9WYf4RM7QoGd4ggKd0nGdC1diN/reG+uXy5luePHDi1FXFEVXCIEM8pM
         vXcUYDPHttjrosVo860C5om+NDx7J5BgXFgnZCWloNhWqvKpqTfdE/rkqzTFtQb3sjSk
         V2T8H35mfZ7Ho5snJEw02KagNqhTawpWpGmbzfO6R7IX8qQ/MzSFkxYb3B98DT7GnTuX
         MNuRALCZTZGLpLw8YLlzEHeFm8+Fe7RVeHr33b94v+fn+haOL6evIt3cwZZAwWNzsbit
         qP22PeGbV/uMwYl5wsHHn5saLZZf5GspP5BA+L0Yh1xaobpS+p9I8erMjJLmYYlIIpOj
         W7XA==
X-Forwarded-Encrypted: i=1; AFNElJ/Fh/qRBLYIU0oL4CMaHyt04z40+42X0tHvNLXfmsD0UATZA0GurzcAYwhY+Xn/T//mKq+qeflGoCgFrnpVKF5I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0H/dwW/RmTdzdVmZEbAPru33Q3BdcbLBhKqkKpXxL8g6LxAlh
	1UNhM0tFwpXOLlDcsqFWQ7K2rAC4q7jWPnu9Wry27E3MvtFb9wRNnGCwCHkZN7eQrsA=
X-Gm-Gg: AeBDiesdm9mwL07R/Ybv7orI38bjhEQGcldTIKSHJVPDn6or2A+cRMjsSTRSc+k3vrA
	fq1Y9+wU9yGZrpaP+vVxga5XUOqj2EqirO6qsSCoXbRzX2TbMBx3M8KoAVLJYf01JkjPP0TutxW
	bh/JwI3US9iGJb1m4PXsGgbzlLvHtvWS++fZoJWNtMrs/mRGBD18Sp9HiIwW2SqIOOUP3Dbbvis
	fnNG1T1OnWEKMczhYSDj1296ycrxCTFsI1s5qrrT8/fZUL3peaYrAaSchCZRVPmaeIgAAkH2cJQ
	3S1PS2xgrCobrkbPbk5ZPaCyB8gdsMqA/h11LYzslkMj2T49MUGml2FsMjp6VD+Trh2PpzwD132
	1+nfOmlYc1357N2T8/7pK2RsPvnSg/ErsGCuv+5qRvjMsj9NzuW433OuOoFHZsRFfwGhCTgVmrW
	CL7Uzmk7aJHJ37nrk=
X-Received: by 2002:a05:7022:6882:b0:11b:923d:7753 with SMTP id a92af1059eb24-12c73f6d69dmr1640615c88.3.1776440900906;
        Fri, 17 Apr 2026 08:48:20 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::5d38])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm3803928c88.10.2026.04.17.08.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:48:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 11:48:18 -0400
Message-Id: <DHVJQQK6L83L.13DDK8BJXQFXG@etsalapatis.com>
Cc: "Jonas Rebmann" <jre@pengutronix.de>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, <kernel@pengutronix.de>
Subject: Re: [PATCH bpf-next v2] arm32, bpf: Reject BPF-to-BPF calls and
 callbacks in the JIT
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Puranjay Mohan" <puranjay@kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260417143353.838911-1-puranjay@kernel.org>
In-Reply-To: <20260417143353.838911-1-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_084822_567835_109100D8 
X-CRM114-Status: GOOD (  25.24  )
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

On Fri Apr 17, 2026 at 10:33 AM EDT, Puranjay Mohan wrote:
> The ARM32 BPF JIT does not support BPF-to-BPF function calls
> (BPF_PSEUDO_CALL) or callbacks (BPF_PSEUDO_FUNC), but it does
> not reject them either.
>
> When a program with subprograms is loaded (e.g. libxdp's XDP
> dispatcher uses __noinline__ subprograms, or any program using
> callbacks like bpf_loop or bpf_for_each_map_elem), the verifier
> invokes bpf_jit_subprogs() which calls bpf_int_jit_compile()
> for each subprogram.
>
> For BPF_PSEUDO_CALL, since ARM32 does not reject it, the JIT
> silently emits code using the wrong address computation:
>
>     func =3D __bpf_call_base + imm
>
> where imm is a pc-relative subprogram offset, producing a bogus
> function pointer.
>
> For BPF_PSEUDO_FUNC, the ldimm64 handler ignores src_reg and
> loads the immediate as a normal 64-bit value without error.
>
> In both cases, build_body() reports success and a JIT image is
> allocated. ARM32 lacks the jit_data/extra_pass mechanism needed
> for the second JIT pass in bpf_jit_subprogs(). On the second
> pass, bpf_int_jit_compile() performs a full fresh compilation,
> allocating a new JIT binary and overwriting prog->bpf_func. The
> first allocation is never freed. bpf_jit_subprogs() then detects
> the function pointer changed and aborts with -ENOTSUPP, but the
> original JIT binary has already been leaked. Each program
> load/unload cycle leaks one JIT binary allocation, as reported
> by kmemleak:
>
>     unreferenced object 0xbf0a1000 (size 4096):
>       backtrace:
>         bpf_jit_binary_alloc+0x64/0xfc
>         bpf_int_jit_compile+0x14c/0x348
>         bpf_jit_subprogs+0x4fc/0xa60
>
> Fix this by rejecting both BPF_PSEUDO_CALL in the BPF_CALL
> handler and BPF_PSEUDO_FUNC in the BPF_LD_IMM64 handler, falling
> through to the existing 'notyet' path. This causes build_body()
> to fail before any JIT binary is allocated, so
> bpf_int_jit_compile() returns the original program unjitted.
> bpf_jit_subprogs() then sees !prog->jited and cleanly falls
> back to the interpreter with no leak.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

The Fixes tag is a bit unrelated since it's for x64 but the original
commit that adds the file (ddecdfcea0ae8 ?) is so far back it probably
doesn't matter.

>
> Acked-by: Daniel Borkmann <daniel@iogearbox.net>
> Fixes: 1c2a088a6626 ("bpf: x64: add JIT support for multi-function progra=
ms")
> Reported-by: Jonas Rebmann <jre@pengutronix.de>
> Closes: https://lore.kernel.org/bpf/b63e9174-7a3d-4e22-8294-16df07a4af89@=
pengutronix.de
> Tested-by: Jonas Rebmann <jre@pengutronix.de>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>
> Changelog:
> v1: https://lore.kernel.org/all/20260417103004.3552500-1-puranjay@kernel.=
org/
> Changes in v2:
> - Add Acked-by: Daniel Borkmann <daniel@iogearbox.net>
> - Reject BPF_PSEUDO_FUNC in the BPF_LD | BPF_IMM | BPF_DW handler
> - Move code below declarations
>
> ---
>  arch/arm/net/bpf_jit_32.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index deeb8f292454..a900aa973885 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -1852,6 +1852,9 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx)
>  	{
>  		u64 val =3D (u32)imm | (u64)insn[1].imm << 32;
> =20
> +		if (insn->src_reg =3D=3D BPF_PSEUDO_FUNC)
> +			goto notyet;
> +
>  		emit_a32_mov_i64(dst, val, ctx);
> =20
>  		return 1;
> @@ -2055,6 +2058,9 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx)
>  		const s8 *r5 =3D bpf2a32[BPF_REG_5];
>  		const u32 func =3D (u32)__bpf_call_base + (u32)imm;
> =20
> +		if (insn->src_reg =3D=3D BPF_PSEUDO_CALL)
> +			goto notyet;
> +
>  		emit_a32_mov_r64(true, r0, r1, ctx);
>  		emit_a32_mov_r64(true, r1, r2, ctx);
>  		emit_push_r64(r5, ctx);
>
> base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3


