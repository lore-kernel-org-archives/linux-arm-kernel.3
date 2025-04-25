Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A4FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yODlwEOL73CmWrG9zApxmu4TNAg1mJBoSCqCqvDx5Go=; b=eMoZ8jOCUXOSYsO+9Dz9LX2Sdq
	24io0ANZQW/7ZWIViPVt2A+KSSKWWCu9adZbsgln3H+HrCObCZrZxFZtcFS7P+L+TxdybhAEMqmfP
	fcpa1d9iPuKTpWr3e5BZGybFBU9PZssyKmn9ZZGAgUkCS2PSosBrdUJ5doGGCqI5WqCRcs7QxQCqV
	K7Rph68MRYDl69AEL8THaFFAL6TyYq73GVx/5SPaB4m7qrYwD+CSGJ4n6mqjN4sG86DpQSJLtvVdm
	2+JRlsntkpeoMJgd7yaxabYpVu7jiv0APA/NScx+VFug7kd/x43sxt6GoNUWVLrgV04wR4xaIDbIl
	TIKoAy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8PSD-00000000mH3-0YBh;
	Fri, 25 Apr 2025 20:15:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P9t-00000000jjk-1vhq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 290F661136;
	Fri, 25 Apr 2025 19:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4821BC4CEE9;
	Fri, 25 Apr 2025 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745610984;
	bh=3BFpzPNhGoEvlgWJA66CMPCNVCIyPcxU5w0nVetTTVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRS2/ztlUG0AIAC3y4OPWTTjG1HrkNkqEFroTJSVrgpw6FOWNjoTWr2niFagTwrIA
	 Bg5a4Po8oPmkMpKJLrUTJ3mh8giuvpQgLeIx4a79TyiDPUdlrXzPXcjXPS082UiXgD
	 SokBmtDgYkmcmjB3NZ8tiYb7v6HxqVti0fqViOAPKjMjt3KtE3fm5TqpQ8VN4XlQUp
	 jY1VLPu27QHpLdMpcfPSKacUu6TlHQzzGLDy6r+KPwRDC7NGmrJDI+Tzd6ojVkilyz
	 0PApMN5h2jRlwiDZAdeE7iVkymsJcThsPRNFBcionN9Ne06KpZgHtKCoFnetmsxMnq
	 3kaYGOa25YCsw==
Date: Fri, 25 Apr 2025 12:56:21 -0700
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG: vdso changes expose elf mapping issue
Message-ID: <202504251158.D3D342410@keescook>
References: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
 <aAvWchSUlnAfg42x@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAvWchSUlnAfg42x@arm.com>
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

On Fri, Apr 25, 2025 at 07:37:38PM +0100, Catalin Marinas wrote:
> On Fri, Apr 25, 2025 at 01:41:31PM +0100, Ryan Roberts wrote:
> > ldconfig is a statically linked, PIE executable. The kernel treats this as an 
> > interpreter and therefore does not map it into low memory but instead maps it 
> > into high memory using mmap() (mmap is top-down on arm64). Once it's mapped, 
> > vvar/vdso gets mapped and fills the hole right at the top that is left due to 
> > ldconfig's alignment requirements. Before the above change, there were 2 pages 
> > free between the end of the data segment and vvar; this was enough for ldconfig 
> > to get it's required memory with brk(). But after the change there is no space:
> > 
> > Before:
> > fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> > fffff7ffc000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> > fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> > fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]
> > 
> > After:
> > fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> > fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> > fffff7ffa000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> > fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> > fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]
> 
> It does look like we've just been lucky so far. An ELF file requiring a
> slightly larger brk (by two pages), it could fail. FWIW, briefly after
> commit 9630f0d60fec ("fs/binfmt_elf: use PT_LOAD p_align values for
> static PIE"), we got:
> 
>           Start Addr           End Addr       Size     Offset  Perms  objfile
>       0xaaaaaaaa0000     0xaaaaaab5d000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
>       0xaaaaaab6b000     0xaaaaaab73000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
>       0xaaaaaab73000     0xaaaaaab78000     0x5000        0x0  rw-p   [heap]
>       0xfffff7ffd000     0xfffff7fff000     0x2000        0x0  r--p   [vvar]
>       0xfffff7fff000     0xfffff8000000     0x1000        0x0  r-xp   [vdso]
>       0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]
> 
> This looks like a better layout to me when you load an ET_DYN file
> without !PT_INTERP.

The trouble is that !PT_INTERP must be loaded out of the way of the
binary it may load, so it cannot be loaded low.

> When the commit was reverted by aeb7923733d1 ("revert "fs/binfmt_elf:
> use PT_LOAD p_align values for static PIE""), we went back to:
> 
>           Start Addr           End Addr       Size     Offset  Perms  objfile
>       0xfffff7f28000     0xfffff7fe5000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
>       0xfffff7ff0000     0xfffff7ff2000     0x2000        0x0  r--p   [vvar]
>       0xfffff7ff2000     0xfffff7ff3000     0x1000        0x0  r-xp   [vdso]
>       0xfffff7ff3000     0xfffff7ffb000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
>       0xfffff7ffb000     0xfffff8000000     0x5000        0x0  rw-p   [heap]
>       0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

The revert was because, among various additional problems, that this low
load would collide with things. The static PIE alignment was finally
fixed with commit 3545deff0ec7 ("binfmt_elf: Honor PT_LOAD alignment
for static PIE")

The ultimate brk location is determined near the end of load_elf_binary()
(see the code surrounding the comment "Otherwise leave a gap").

> With 6.15-rc3 my layout looks like Ryan's but in 5.18 above, the vdso is
> small enough and it's squeezed between the two ldconfig sections.

I think there are two surprises:

- For loaders (ET_DYN without PT_INTERP, which is also "static PIE") the
  brk location is being moved to ELF_ET_DYN_BASE ... *but only when ASLR
  is enabled*. I think exclusion is the primary bug, with its origin
  in commit bbdc6076d2e5 ("binfmt_elf: move brk out of mmap when doing
  direct loader exec"). I failed to explain my rationale at the time
  to have it only happen under ASLR, but I think I was trying to be
  conservative and not change things too much.

- vdso can get loaded into _gaps_ in the ELF. I think this is asking for
  trouble, but technically should be okay since neither can grow. But I
  never like seeing immediately adjacent unrelated mappings, since we
  always end up with bugs (see things like commit 2a5eb9995528
  ("binfmt_elf: Leave a gap between .bss and brk").

For fixing the former, the below change might work (totally untested yet,
I just wanted to reply with my thoughts as I start testing this). Pardon
the goofy code style, I wanted a minimal diff here:

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 7e2afe3220f7..9290a29ede28 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1284,7 +1284,7 @@ static int load_elf_binary(struct linux_binprm *bprm)
 	mm->end_data = end_data;
 	mm->start_stack = bprm->p;
 
-	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
+	{
 		/*
 		 * For architectures with ELF randomization, when executing
 		 * a loader directly (i.e. no interpreter listed in ELF
@@ -1299,7 +1299,9 @@ static int load_elf_binary(struct linux_binprm *bprm)
 			/* Otherwise leave a gap between .bss and brk. */
 			mm->brk = mm->start_brk = mm->brk + PAGE_SIZE;
 		}
+	}
 
+	if ((current->flags & PF_RANDOMIZE) && (snapshot_randomize_va_space > 1)) {
 		mm->brk = mm->start_brk = arch_randomize_brk(mm);
 #ifdef compat_brk_randomized
 		current->brk_randomized = 1;

> > Note that this issue only occurs with ASLR disabled. When ASLR is enabled, the 
> > brk region is setup in the low memory region that would normally be used by 
> > primary executable.

Out of curiosity, why are you running without ASLR?

Thanks for the report! I'll continue testing the above fix. Just for
making sure I am able to exactly reproduce your issue, this is on
a regular arm64 install of Ubuntu 22.04?

-Kees

-- 
Kees Cook

