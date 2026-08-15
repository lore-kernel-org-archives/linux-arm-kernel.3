Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A53DC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8CZswJ9iXnJNKqTxpESc4GcbNZlXi0PD5X1QkefvI0=; b=1qTpvi267oCq7zVVu9BqRjXUhV
	DZROvUXFR9Z3kUgWRfst+uD43I01ylzLJ6FPFXIgQXvCPoO/YRavQ3h5FS2lFkW384GPnebYH35hl
	lRQExrliPIIq28jMCYJNPFTjQAy0gBIW9L1isYrM1iskHGOSvBfKuHz3snTGbNdIYbwzcm/R7NyPH
	qxgkg0eYZfN8dEL0ifvnOssH6ohsn5fuHUnLyE9ADFESD0GSSu+gyTgA2RxsKpLvjcWl8qIfL1j3J
	j3h5BO9rcn8mg8kgC7JVDqAaOv/a9pldA4tvUXsDmp7HgLvu+CxZPhCf0v7fl2IJTJRBz/b1wYGDC
	bgvokbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Wi-00000003WZX-47GG;
	Sat, 15 Aug 2026 05:01:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv6Wh-00000003WZF-177N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 05:01:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BA40434B7;
	Sat, 15 Aug 2026 05:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6D91F000E9;
	Sat, 15 Aug 2026 05:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786770106;
	bh=t8CZswJ9iXnJNKqTxpESc4GcbNZlXi0PD5X1QkefvI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YE9Vgfa2etwtRSJMpYpYiD2R/pRcpU1ZS1nDzlXKiXlynT2WWkD+3UL539xqw21tX
	 m4a23ilRPdNXAulU5YUlnWUzksFHwqBxwsmtdkOURjAjoqtoaJms/a88YTrWyoEWB7
	 r+zfiHqfo4ggVNRLFfXmBhm+pVxMDE0fN+NeIMRkErjJ2eFYABDboZYCN8TY6rIoSh
	 wXEDlNfsCAssYiIDKFCEQZ9x4PrLzn+YJMazoN8VfT84GyhONIgmG1ArvUeDt3PmC3
	 GgHI3oLIi2+/npRMDnRItP9D3iTvNu4lAc/z2SgGVKgVq+BdoCY02hYMsgUSwZeuFM
	 6guaZ5eWZN+qQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] arm64/bti: Add BTI landing pad to
 __sdei_asm_handler()
To: "Josh Poimboeuf" <jpoimboe@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, linux-toolchains@vger.kernel.org, "Song
 Liu" <song@kernel.org>, "Petr Mladek" <pmladek@suse.com>, "Ard Biesheuvel" <ardb@kernel.org>, live-patching@vger.kernel.org, "Joe
 Lawrence" <joe.lawrence@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Mark
 Rutland" <mark.rutland@arm.com>, "Kees Cook" <kees@kernel.org>, "Miroslav
 Benes" <mbenes@suse.cz>, "Nick Desaulniers" <ndesaulniers@google.com>
In-Reply-To: <99226432cc316215829655c787f71a70f06d1600.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <99226432cc316215829655c787f71a70f06d1600.1786768375.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 05:01:45 +0000
Message-Id: <20260815050146.1C6D91F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing BTI landing pads (`bti j`) on indirect branch targets in t=
he KPTI trampoline (`__sdei_asm_exit_trampoline` and `tramp_exit`).
- [High] The KPTI entry trampoline mapping at `TRAMP_VALIAS` lacks the BTI =
Guarded Page (`PTE_GP`) attribute, disabling hardware CFI checks.
--

--- Patch [1]: [PATCH 01/12] arm64/bti: Add BTI landing pad to __sdei_asm_h=
andler() ---
commit 59fadd16326c687a5994c4bec81d9484edcc08f9
Author: Josh Poimboeuf <jpoimboe@kernel.org>

arm64/bti: Add BTI landing pad to __sdei_asm_handler()

With CONFIG_UNMAP_KERNEL_AT_EL0, __sdei_asm_entry_trampoline() indirect
jumps to __sdei_asm_handler(). Add "bti j" to prevent a Branch Target
exception.

> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index e0db14e9c843a..16c21fcb41976 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -976,6 +976,7 @@ NOKPROBE(__sdei_asm_exit_trampoline)

[Severity: High]
This is a pre-existing issue, but do we also need bti j landing pads on the
indirect branch targets for the exit paths?

For example, __sdei_asm_exit_trampoline() is called via an indirect branch
(br x5):

arch/arm64/kernel/entry.S:__sdei_asm_exit_trampoline() {
    SYM_CODE_START(__sdei_asm_exit_trampoline)
        ldr x4, [x4, #(SDEI_EVENT_INTREGS + S_SDEI_TTBR1)]
        ...
}

Similarly, tramp_exit() in the same file lacks a landing pad despite being
called via an indirect branch (br x29) on the EL0 exit path:

arch/arm64/kernel/entry.S:tramp_exit() {
    SYM_CODE_START_LOCAL(tramp_exit)
        tramp_unmap_kernel x29
        ...
}

Would it be better to add bti j annotations to these functions as well to
prevent Branch Target exceptions?


[Severity: High]
This isn't a bug introduced by this patch, but does the KPTI trampoline map=
ping
need the BTI Guarded Page (PTE_GP) attribute?

Looking at map_entry_trampoline() in arch/arm64/mm/mmu.c, it uses
kernel_exec_prot() to map the trampoline text:

arch/arm64/mm/mmu.c:map_entry_trampoline() {
    pgprot_t prot =3D kernel_exec_prot();
    ...
    early_create_pgd_mapping(tramp_pg_dir, pa_start, TRAMP_VALIAS,
                             entry_tramp_text_size(), prot,
                             pgd_pgtable_alloc_init_mm, NO_BLOCK_MAPPINGS);
}

The prot variable is derived from PAGE_KERNEL_ROX, which does not appear to
contain the PTE_GP bit. Does this inadvertently disable hardware BTI enforc=
ement
for the trampoline pages? If so, could this architectural gap be masking the
missing bti j annotations on the trampoline exit paths mentioned above?

>   * want them.
>   */
>  SYM_CODE_START(__sdei_asm_handler)
> +	bti	j
>  	stp     x2, x3, [x1, #SDEI_EVENT_INTREGS + S_PC]
>  	stp     x4, x5, [x1, #SDEI_EVENT_INTREGS + 16 * 2]
>  	stp     x6, x7, [x1, #SDEI_EVENT_INTREGS + 16 * 3]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786768375.gi=
t.jpoimboe@kernel.org?part=3D1

