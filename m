Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97EFF8870
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ebg5+i/pOUuQx7xxuERTUppaj1qL6vIxTxgv86V/NC0=; b=q/Gu9Kr4THcLIEf/47p9kY3IBS
	POQm+2U89UvruLTaf8orcqiCADRddO243RLbYBXxvfto5RO3n7o+SvpBL9Rv9EHICCLzDHPu9SG4A
	Jt5cBLEO9kF3/AvtaqY41r3qkIo3JH0yA8L4MpCrCYhI9IGBsnw9CacxmCkAldL0wdTi/wgPCztRp
	ileO/8Mi5U3G+r4ZiLvuz/7P5cvln1vDSLejKstkfQeIcHgf6InKh1efwyKqeVS1rWf+ojK9+04MR
	iyftr0yFnc8/yuUiblFb0PqO5LRGAvEzgwt2F2tEnC5QlKix16RwF00LN1kvsUQIKGYfiwFi7C9Yw
	GhDy+Qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTW7-00000000Ayv-3G89;
	Mon, 27 Apr 2026 21:29:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTW4-00000000AxP-1o9m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 21:29:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d64313c39so8336494f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777325358; x=1777930158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ebg5+i/pOUuQx7xxuERTUppaj1qL6vIxTxgv86V/NC0=;
        b=IMLbRmYEXHk4kUnosshE5P5pf1HqFLf0l7XiDgwKvr7oE5MkpvdH0FTxH9LxckM35l
         Os4ccdgiiqlHRjRvL+RryGdn7oCPjsw6SLFUekQpynSRUqQHJnFXCP4HacqJvlh9iVis
         zGNZ4qYId5So/UVoGJsvJ2dwzmNYcRR49V1njggySedCiI895cCkL8pOoq75Ll5tg6UJ
         gs8U4RZrdEdp2ukJO+287TbmqmdaAnfgJD/SIT9nlPuRmKUl02/Bp4INCRNCNdvLwWsW
         ZotKCyVf/DPyX+Q0XgzSuhekf61ba0R2ykzyXafBvJJhNbQi7bDkg47gbRImxl3ioFqu
         McvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325358; x=1777930158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ebg5+i/pOUuQx7xxuERTUppaj1qL6vIxTxgv86V/NC0=;
        b=SqJnccWWt7Fas9Esdr3F/8aQpQc7JnVHjcS/dPldazPEOYOyWqJA98dmkZLvobbTwr
         97XIJpi6O2ZmCXWIrrawAA9sgD1U4pVVuEyt8F8u0i1enlB1RL/jJd6VAb82I/fypGrt
         1jgrDGnANCvIUqIfnZLHCkbnlVrO1SDSx/2kBrECxH8z2ADG5lP1Qi9FlT7ZvUYDc95+
         euxNUwtqjXf5fjYAPuy8Z0WPma5BN+sp0xuycmsikpJf7anX1Ls89sc7rMHA76QFzLMa
         6ENFLRB8JXJE1Bc5XFSCzG7bTyabPqosmgeYxnMD9Vg81Q5WnHvPrT0H6cskW6sDeAyG
         WrbA==
X-Forwarded-Encrypted: i=1; AFNElJ9GAzZkPDow9sfLzvezvgsjOjBAu+sh9a+N8FHGuYnwzNZTGrNRYVH16OzWQ4Cm8iE0UX1bRxSvwXxPZdRL4YtF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1wtje3N5nFELV/9koryuukAyf/tCf0t55SKTX8gKS3dIngA6u
	+A+3FLKgBDAw3Q6nuvx8NOy+Zq5snIUbHBr6uwDn1fZ3VqGg+tJr1ZeK
X-Gm-Gg: AeBDieuC5fL0ZLZOBNy7JzRCDGyu/DscCtdny1AAfZMFM/vBH6P/Ar3hie90RQhJm05
	ZtdIlS16SOVoG8uSMd9fTN/cIM/0W0RJkmcKs3iJhiEDkMDa8ShxwSol25sf9NtELrGXkfVxjaW
	T7y6F/1sWQoH0dvvD7MTXqnQxkL2NNqpmVGpBonNaLWhJkxK5mbE4vtVierxClPDgj+rSdQNgoX
	zxtcqMMDjFP/vSnOpS5Wuqqrgvgpw+CsW724vgOyjF6B4rcSXN8nZF9PEszQOfwjEtfp3unI2GN
	HHLSm66oa2gllTC9OqIzdomehOHV6TRXAi19MP8Tp8Rb/kzir3JXwtDAYH4tcbzvUIOP/49mTNj
	3IIuVIc2PZuGj1MMf8aESvHAUO3q1uKHsP/m2fznErpW/mtqsFINZwvMoc76uKXshptfHroI2V5
	r9r59qc7FUK2QI7z57NiEjqDYYHj6WgbOl05XMtPFh4CdrlW5QEOOwkLRMRYx46w+KX50yVsTEV
	LkVSFjPJCepOg==
X-Received: by 2002:a05:6000:3109:b0:43d:7d6f:f531 with SMTP id ffacd0b85a97d-44649ba1f4amr816127f8f.30.1777325358072;
        Mon, 27 Apr 2026 14:29:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f270sm1120515f8f.9.2026.04.27.14.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 14:29:17 -0700 (PDT)
Date: Mon, 27 Apr 2026 22:29:14 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov
 <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-wpan@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-x25@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to
 copy_{to/from}_user_partial() when relevant
Message-ID: <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
References: <cover.1777306795.git.chleroy@kernel.org>
	<289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
	<CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_142920_530103_0F576796 
X-CRM114-Status: GOOD (  52.59  )
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

On Mon, 27 Apr 2026 12:01:23 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 27 Apr 2026 at 10:18, Christophe Leroy (CS GROUP)
> <chleroy@kernel.org> wrote:
> >
> > In a subsequent patch, copy_{to/from}_user() will be modified to
> > return -EFAULT when copy fails.  
> 
> Please don't do this.
> 
> This is a maintenance nightmare, and changes pretty much three decades
> of semantics, and will cause *very* subtle backporting issues if
> somebody happens to rely on the old / new behavior.
> 
> I understand the reasoning for the change, but I really don't think
> the pain of creating yet another user copy interface is worth it.
> 
> We already have a lot of different versions of user copies for
> different reasons, and while they all tend to have a good reason (and
> some not-so-good, but historical reasons) for existing, this one
> doesn't seem worth it.
> 
> The main - perhaps only - reason for this "partial" version is that
> you want to do that "automatically inlined and optimized fixed-sized
> case".
> 
> But here's the thing: I think you can already do that. Yes, it
> requires some improvements to unsafe_copy_from_user(), but *that*
> interface doesn't have three decades of history associated with it,
> _and_ you're extending on that one anyway in this series.
> 
> "unsafe_copy_from_user()" is very odd, is meant only for small simple
> copies that can be inlined and it's special-cased for 'objtool' anyway
> (because objtool would have complained about an out-of-line call,
> although it could have been special-cased other ways).
> 
> In other words: unsafe_copy_from_user() is *very* close to what you
> want for that "Oh, I noticed that it's a small fixed-size copy, so I
> want to special-case copy-from-user for that".
> 
> The _only_ issue with unsafe_copy_from_user() is that you can't see
> that there were partial successes. But if *that* was fixed, then this
> whole "create a new copy_from_user interface" issue would just go
> away.
> 
> So please - let's just change unsafe_copy_from_user() to be usable for
> the partial case.
> 
> And the thing is, all the existing unsafe_copy_from_user()
> implementations already effectively *have* the "how much did I not
> copy" internally, and they actually do extra work to hide it, ie they
> have things like that
> 
>         int _i;
> 
> that is "how many bytes have I copied" in the powerpc implementation,
> or the x86 code does
> 
>         size_t __ucu_len = (_len);
> 
> where that "ucu_len" is updated as you go along and is literally the
> "how many bytes are left to copy" return value that is missing from
> this interface.
> 
> So what I would suggest is
> 
>  - introduce a new user accessor helper that is used for *both*
> unsafe_copy_to/from_user() *and* the "inline small constant-sized
> normal copy_to/from_user()" calls
> 
>  - it's the same thing as the existing  unsafe_copy_to/from_user()
> implementation, except it exposes how many bytes are left to be copied
> to the exception label.

I think there is a slight difference in that the normal copy_to_user()
will determine the exact offset of the error by retrying with byte copies.

There is also the issue of misaligned copies.

Then there is the 'bugbear' of hardened user copies.
Chasing down the stack to find whether the kernel buffer crosses
a stack frame is probably more expensive than the copy for the typically
small copies that will use on-stack buffers.

	David

> 
> IOW, it would look something like
> 
>      #define unsafe_copy_to_user_outlen(_dst,_src,_len,label)...
> 
> which is exactly the same as the current unsafe_copy_to_user(),
> *except* it changes "_len" as it does along.
> 
> And then you use that for both the "real" unsafe_copy_user and for the
> "small constant values" case.
> 
> Just as an example, attached is a completely stupid rough draft of a
> patch that does this for x86 and only for unsafe_copy_to_user().
> 
> And I made a very very hacky change to kernel/sys.c to see what the
> code generation looks like.
> 
> This is what it results in on x86 with clang (with all the magic
> .section data edited out):
> 
>         ... edited out the code to generate the times
>         ... this is the actual user copy:
>         # HERE!
>         movabsq $81985529216486895, %rcx        # imm = 0x123456789ABCDEF
>         cmpq    %rcx, %rbx
>         cmovaq  %rcx, %rbx
>         stac
>         movq    %r13, (%rbx)                    # exception to .LBB45_8
>         movq    %r14, 8(%rbx)                   # exception to .LBB45_8
>         movq    %r15, 16(%rbx)                  # exception to .LBB45_8
>         movq    %rax, 24(%rbx)                  # exception to .LBB45_8
>         clac
> .LBB45_6:
>         movq    jiffies(%rip), %rdi
>         callq   jiffies_64_to_clock_t
> .LBB45_7:
>         addq    $16, %rsp
>         popq    %rbx
>         popq    %r12
>         popq    %r13
>         popq    %r14
>         popq    %r15
>         retq
> .LBB45_8:
>         clac
>         movq    $-14, %rax
>         jmp     .LBB45_7
> 
> and notice how the compiler noticed that the 'outlen' isn't actually
> used, and turned the exception label into just a "return -EFAULT" and
> never actually generated any code for updating remaining lengths?
> 
> That actually looks pretty much optimal for a 32-byte user copy.
> 
> And it didn't involve changing the semantics at all.
> 
> Just to check, I changed that "times()" system call to return the
> number of bytes uncopied instead (to emulate the "I actually want to
> know what's left" case), and it generated this:
> 
>         # HERE!
>         movabsq $81985529216486895, %rcx        # imm = 0x123456789ABCDEF
>         cmpq    %rcx, %rbx
>         cmovaq  %rcx, %rbx
>         stac
>         movl    $32, %ecx
>         movq    %r13, (%rbx)                    # exception to .LBB45_7
>         movl    $24, %ecx
>         movq    %r15, 8(%rbx)                   # exception to .LBB45_7
>         movl    $16, %ecx
>         movq    %r14, 16(%rbx)                  # exception to .LBB45_7
>         movl    $8, %ecx
>         movq    %rax, 24(%rbx)                  # exception to .LBB45_7
>         clac
>         xorl    %ecx, %ecx
> .LBB45_8:
>         movq    %rcx, %rax
>         addq    $16, %rsp
>         popq    %rbx
>         popq    %r12
>         popq    %r13
>         popq    %r14
>         popq    %r15
>         retq
> .LBB45_6:
>         movq    jiffies(%rip), %rdi
>         jmp     jiffies_64_to_clock_t           # TAILCALL
> .LBB45_7:
>         clac
>         jmp     .LBB45_8
> 
> so it all seems to work - although obviously the above is *not* the normal case.
> 
> NOTE NOTE NOTE! The attached patch is entirely untested. I obviously
> did some "test code generation" with it, but I only *looked* at the
> result, and maybe it has some fundamental problem that I just didn't
> notice. So treat this as a "how about this approach" patch, not as
> anything more serious than that.
> 
> And the kerrnel/sys.c hack is very obviously just that: a complate
> hack for testing.
> 
> A real patch would do that "for small constant-sized copies, turn
> copy_to_user() automatically into "_small_copy_to_user()".
> 
> The attached is *not* a real patch. Treat it with the contempt it deserves.
> 
>              Linus


