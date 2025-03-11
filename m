Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B120C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59zHB+kiAYmHaMRMwtjjI4EE02mRzgoxVzP+VqVwd00=; b=b3QnOUUyuRRTG19A3W6wfxpSV0
	dKDYIdTFaZwPKTNP2bkXVqc6hht1CfMz7oyGkfFtDbDVoL5QfEQTH2R9YP28MoEHEDyOsK+3leq5D
	Ic1jypexMD6Id4zdOLtdW7OnGVoZNLnhUFmfc8bOYIFU4Q6yjNe0iW1qeGt3AOOOpzS+CIvsTMjVF
	zBAC9Gqltuxs2S68s9llpP3WpeMdIfFc6atf9ItVo6+BoZlND+yZsTrTB3MPyyianNTUFLIjScqbu
	VzhsVNx9IiHXfIrXW9W/u/zXYmrZb+Bjrq4EELshSnOm26o1nOndvv/i3ENfKzDpGygHCz4ZyzHRs
	Y25E8wnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0SV-00000005xW9-3KeI;
	Tue, 11 Mar 2025 14:19:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0Q8-00000005x9c-01ZX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A65B25C6241;
	Tue, 11 Mar 2025 14:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5862C4CEE9;
	Tue, 11 Mar 2025 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741702643;
	bh=oUPWS1iGHrlNCRNqq8+iKfTYYMlSqwNoeg2uveVkUDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2M9keKmX+3gG8SWDcs3CbAorRkyS412/jjbyrKIs6+DRCPW00delPh5fiiQJHBgN
	 TUEMGp3mnvTvhQ5Ya2DWTURdr8TnFQmRKhBXLZRldXZWH+7x1asriO/sM9kH49d9xN
	 j34oUxssa6j1Ql6LLXxWqiGbTXqdN3tFBvDmSd/m8mds4+znIjgWIHvqfyYq8plhRB
	 BNI9iD+AyBxYmcnIfdASfZ5OaWY0md4/dRiABNt6UlohHUUibJuq1s2aCHvpZOiE/g
	 CBWUwlIoqYEb2Jj4lgfgVew6tPXJcfH30zaSOd0wjHOxQaUyxhZbgkI8P8+pYatEGy
	 ALtyiDGL418Ig==
Date: Tue, 11 Mar 2025 14:17:18 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Omar Sandoval <osandov@osandov.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-debuggers@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] arm64: reserve [_text, _stext) virtual address range
Message-ID: <20250311141717.GA4931@willie-the-truck>
References: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
 <20250311125414.GA4601@willie-the-truck>
 <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_071724_130559_EA2345CA 
X-CRM114-Status: GOOD (  29.18  )
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

On Tue, Mar 11, 2025 at 02:32:47PM +0100, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 13:54, Will Deacon <will@kernel.org> wrote:
> >
> > [+Ard]
> >
> > On Mon, Mar 10, 2025 at 01:05:04PM -0700, Omar Sandoval wrote:
> > > From: Omar Sandoval <osandov@fb.com>
> > >
> > > Since the referenced fixes commit, the kernel's .text section is only
> > > mapped starting from _stext; the region [_text, _stext) is omitted. As a
> > > result, other vmalloc/vmap allocations may use the virtual addresses
> > > nominally in the range [_text, _stext). This address reuse confuses
> > > multiple things:
> > >
> > > 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
> > >    mapping the entire range [_text, _end) to
> > >    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
> > >    [_text, _stext) from /proc/vmcore therefore gives the incorrect
> > >    result.

[...]

> > > @@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
> > >   */
> > >  static void __init declare_kernel_vmas(void)
> > >  {
> > > -     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
> > > +     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
> > >
> > > -     declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[4], _data, _end, 0);
> > > +     declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
> >
> > Should we also put the memblock reservation back as it was, so that this
> > region can't be allocated there?
> >
> 
> The issue is about the virtual address space, not the physical memory
> behind it, right? So the VA range should be protected from reuse, but
> nothing needs to be mapped there.

You're absolutely right, but now I'm more confused about the reference
to crash_prepare_elf64_headers() in the commit message. That sets both
the virtual (_text) and the physical (__pa_symbol(_text)) addresses in
the header, so it feels like we really need to keep that memory around
because it's accessible via /proc/vmcore.

> 
> > In fact, if we're not allocating from here, why don't we just map it
> > anyway but without execute permissions?
> >
> 
> It's just 64k so if this is the simplest approach, I won't object.
> 
> I wonder if this needs to be so intrusive, though - there is already a
> precedent of VMAs not actually mapping the entire region they describe
> (with guard pages), and so we might just declare the first VMA as
> [_text, _etext), even though the first 64k of that region is not not
> actually mapped.
> 
> However, if that confuses the bookkeeping or creates other problems,
> declaring a separate VMA to reserve the VA range seems fine, although
> the patch seems a bit intrusive (and I don't even see the whole
> thing).

As above, I think we'll have to give /proc/vmcore the physical address
of _something_.

Will

