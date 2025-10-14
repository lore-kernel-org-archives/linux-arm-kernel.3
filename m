Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556DBCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXlU2MkvUQX1/3iyqxXB7dFdeRQ53Wq/EIkRPiFDjBw=; b=orgTTqceIZ+lzy8SU9cFvueQ5v
	Ii7WirVmXeIXyqsLGpwoMuwCME5AQH7oL52FSQju72lajdKEguqK6Camw/udoTPiLSU34qsKlZO93
	Z4Qz+SRYpxjnS9YRO500OEAR6L/4iK/Aw83vzejeb5/QiPUaAvORA3GoOtTVj4/n41mfhWJfRMCvc
	PjKVVvYOyJzUGZ1CvgEmAsv3jrsIQlOgtQYwGJ4mYhm8W59NoiXgyiN4tL5k6Vm7zRYWXbxP79gR/
	ft5CXGVEI40npXvQkuUkDa2yJqIg0k7ll3LYH0Bz6joeeiMCrAzQSzdjEbXYk1Z71PV5NaZFFyHyV
	jcxkZ45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iBs-0000000H1oS-3eqA;
	Tue, 14 Oct 2025 16:48:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iBr-0000000H1oH-3e7y;
	Tue, 14 Oct 2025 16:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC5D962366;
	Tue, 14 Oct 2025 16:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4FBC4CEF9;
	Tue, 14 Oct 2025 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760460478;
	bh=l8eLRFVMqE9fpiqrKqMylM/MEdNRiawD7W1mbhHYUUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGSA3pgaOhHGfOTcRgObQgFAXRmOW61i/dlmHQrwQtYq+xQu+Ft19yt6twH4meYJQ
	 pWh4Zv2yemKHxTklIE0SZgp3LMws95vKHPuayVyCrSzSO/TuzlIKgKlN/9AzmSYXI+
	 VDWj2WvV3uEOaZ0+mpeTKD3MLGvDFT3ttd2kKoAg8mFv263krvh8pHzQF2S8h0d4ww
	 mm+3rI11mjJHFue72xqUgh8qpTfrAldmagVOJzzCXqrhyFjsfIqCa5+MRQvPB9RG+W
	 jCXWH/AKVd0lxrKcHaX4aoIX3SXFgHU9WqNVNS2owUSOkfqBwuBB2vnN+AirnG+X8m
	 oq6U4gwpx/A1w==
Date: Tue, 14 Oct 2025 09:47:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
References: <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn>
 <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
 <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
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

On Mon, Oct 13, 2025 at 04:36:49PM +0200, Ard Biesheuvel wrote:
> On Mon, 13 Oct 2025 at 16:09, Huacai Chen <chenhuacai@kernel.org> wrote:
> > On Sat, Oct 11, 2025 at 11:59 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > It is an objtool issue in essence.
> > >
> > > The generated code looks like this
> > >
> > > 9000000001743080: ff b7 fe 57   bl      -332 <__efistub_kernel_entry_address>
> > > 9000000001743084: 26 03 c0 28   ld.d    $a2, $s2, 0
> > > 9000000001743088: 87 00 15 00   move    $a3, $a0
> > > 900000000174308c: 04 04 80 03   ori     $a0, $zero, 1
> > > 9000000001743090: c5 02 15 00   move    $a1, $fp
> > > 9000000001743094: e1 00 00 4c   jirl    $ra, $a3, 0
> > >
> > > 9000000001743098 <__efistub_exit_boot_func>:
> > > 9000000001743098: 63 c0 ff 02   addi.d  $sp, $sp, -16
> > >
> > > There is nothing wrong with this code, given that the indirect call is
> > > to a __noreturn function, and so the fact that it falls through into
> > > __efistub_exit_boot_func() is not a problem.
> > >
> > > Even though the compiler does nothing wrong here, it would be nice if
> > > it would emit some kind of UD or BRK instruction after such a call, if
> > > only to make the backtrace more reliable. But the code is fine, and
> > > objtool simply does not have the information it needs to determine
> > > that the indirect call is of a variety that never returns.
> > So the best way is to fix the objtool?
> >
> 
> I think the best solution is to fix the compiler, and ensure that call
> instructions are always followed by some undefined or debug/break
> opcode. This works around this problem, but it also ensures that the
> return address does not point to the wrong function, which may cause
> confusion in backtraces.

I think the compiler folks will say that's working as designed.  The
whole point of __noreturn is to eliminate unecessary code after the
call.

Unwinders are already designed to handle that case anyway.

If you don't want to optimize out the code after the call then just
remove the __noreturn annotation from the function pointer.

> > > So I don't mind fixing it in the code, but only for LoongArch, given
> > > that the problem does not exist on arm64 or RISC-V.
> > You believe this problem won't exist even if they add objtool support
> > (because their objtool will be sane)?
> >
> 
> It depends on the compiler.

I don't think so, all compilers do this...

My suggestion (which prompted this v2 patch) was to move the libstub
code out of vmlinux.o (but still keep it in vmlinux), to make it
consistent with what x86 already does.

The idea is that libstub code doesn't belong in vmlinux.o because it's
not a part of the kernel proper, and doesn't need to be validated or
modified by objtool for any reason.

-- 
Josh

