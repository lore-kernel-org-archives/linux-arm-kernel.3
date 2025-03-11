Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C11C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d59sGJI+VLcObFpvaWc35UsNwmufPn81Jgd7DH2LSWc=; b=E9thdUMpMYvSZP4Eq7efYz8v+x
	aqp4WBjDfzrgaw/qDYxLzzG3lDFtWXEi+6GR24ekXUaDRqojsMi4MXgR4EXAsTEIKWwt62B+h70CH
	OioFVumvMxH/A9BJVf9tvjTLkUWV8gOe5nQv9+2md7cNNmTKLHIApuDOKnZIgIx6KFhc93Rf4+N4j
	Vlhi6cpc9/oSrMAC0onSfqZY7NWkM+fb9OVO/cdE1Q/Fr3fRu9drRyaMkro46QH/ihLwvYNPszYFG
	ccYAFO75np/7hNr+/GxDYS0pxRMpI1qCS65tqRfmwQJ2SjVOYMbwId/rzF9w6kERFxpeUnqN842xy
	VK8VtchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts11y-000000063CP-1l3F;
	Tue, 11 Mar 2025 14:56:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts10K-000000062vO-19jx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 14:54:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ff7255b8c6so1366984a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1741704887; x=1742309687; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d59sGJI+VLcObFpvaWc35UsNwmufPn81Jgd7DH2LSWc=;
        b=m6xpuOTlM3vL1RIJcG9tmpDfKZnsaOay9Vtk0bMx3Q3tEAsN8l/Ox3zxV1RbX3SU2j
         ySLR3pgRbnxkcXeI9kP/TQQVlZlug2i546C8BoI386VQsrEicW2anThS7A1M9kCRJJ/V
         713KLt+EDsyvsc7LK1OXQjiq6okZ5PLzbddZWuXuZ5mDxqCejN/dBlcpWrdJgSwf2z2v
         tG7fFIVZxjoeIzjLWx0Tg0LkX+Ho8KyUr4ydyCyNsB18XSVU4fFxca3PjiJ4WVycdqqy
         fZIBY7YYk97afC0cbYRQLuviI/fskNS/wdy9lk7iR3O3ljGK8vzhXqdvZGsiWcH3J5Uu
         xwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704887; x=1742309687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d59sGJI+VLcObFpvaWc35UsNwmufPn81Jgd7DH2LSWc=;
        b=DIihGlr+OqgT1vHrJvZQG4AC4321X1NiSfMwWwPyFc31aEuKYWJRxS972K2XBIT5AE
         vPOPJm8Ky04xZWWz/aLj43geHS54U1aMMjs5cEHVJqmDDh143bkaJMISsP37RS2Iqnw1
         aLGNpEiDV0seBgtr90s5ez1gBnCUvhLxH2sC+U3GMnNp+r4dUkLGpHvWC3iqhqGvX2Sv
         HGNwn4WnycG2/OzCRY6tUIQ2L5vxLjElVsbHLHyOvo89wzUAkEZm3KS0yGnTxCpaMQKf
         QkRIfg13t/mgZX7g8K0eG5v7ItAw9vpg9epdHKK2AqEbeOH7Agm2d/EgDHI42kWo6FR7
         aL+g==
X-Forwarded-Encrypted: i=1; AJvYcCXxiZPfTCSenRwXXYaghZ+hmgZhfOFiCk1GT7dDeLFvZXw0xTCSG4Si+ofHnYxJ4gIcBsevGIIxmEaY8ghM2Gn8@lists.infradead.org
X-Gm-Message-State: AOJu0YxTl9uM63NvRe9+zkYxk5I76vhc9MM8yV+cM27UtmqR7/gUDZnk
	7lJTGXOH2JiuIK35c0Z9EN8wko/GMoGFpqCMvJ1d39ivz+wCKSkah4/zAjyptNI=
X-Gm-Gg: ASbGncs3SCvVayMIbFAR0Spq90sXta2sBEuh1EVkx5m4vnipwvfnmJqnOkyQY/zizEc
	mJ5fSu4uCIuJ5KGuhYoiTfN2XkPx21f3lqwNBgXQ3puipu4O+OXn+Z4St7Ih5cdTGxIm+MCueOn
	1QPXIXW8Y7BnuywOl/I42JeNsagsKQKa9XDqEa4vMw9AdtC+VEQupJoW/RPLeBzHbK7wNRmA611
	+yy87ZbibiBMk0BbAWv08GHAtHMj+9cZXX8AmlPDsBo7uDRf8WhwBPvjqH8bbiduEbrpntcyE++
	0pmdXdwudr8v/CFjTDqEVhMG4AL9CAEuqojU9w==
X-Google-Smtp-Source: AGHT+IHZkUQxuczn7uLgu1nRcj0qqV2jBdIhQhmcmuYHxfiKRdGEtqN0h05FBwTHzHXAqILvvPMfAQ==
X-Received: by 2002:a05:6a20:1586:b0:1ee:b8d7:7b56 with SMTP id adf61e73a8af0-1f58cbf5f4emr2486613637.6.1741704887342;
        Tue, 11 Mar 2025 07:54:47 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::24c4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281075eaesm9656245a12.3.2025.03.11.07.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:54:46 -0700 (PDT)
Date: Tue, 11 Mar 2025 07:54:46 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-debuggers@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] arm64: reserve [_text, _stext) virtual address range
Message-ID: <Z9BOttC9HTIDx62P@telecaster>
References: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
 <20250311125414.GA4601@willie-the-truck>
 <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
 <20250311141717.GA4931@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311141717.GA4931@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075448_314217_C4442E13 
X-CRM114-Status: GOOD (  33.98  )
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

On Tue, Mar 11, 2025 at 02:17:18PM +0000, Will Deacon wrote:
> On Tue, Mar 11, 2025 at 02:32:47PM +0100, Ard Biesheuvel wrote:
> > On Tue, 11 Mar 2025 at 13:54, Will Deacon <will@kernel.org> wrote:
> > >
> > > [+Ard]
> > >
> > > On Mon, Mar 10, 2025 at 01:05:04PM -0700, Omar Sandoval wrote:
> > > > From: Omar Sandoval <osandov@fb.com>
> > > >
> > > > Since the referenced fixes commit, the kernel's .text section is only
> > > > mapped starting from _stext; the region [_text, _stext) is omitted. As a
> > > > result, other vmalloc/vmap allocations may use the virtual addresses
> > > > nominally in the range [_text, _stext). This address reuse confuses
> > > > multiple things:
> > > >
> > > > 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
> > > >    mapping the entire range [_text, _end) to
> > > >    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
> > > >    [_text, _stext) from /proc/vmcore therefore gives the incorrect
> > > >    result.
> 
> [...]
> 
> > > > @@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
> > > >   */
> > > >  static void __init declare_kernel_vmas(void)
> > > >  {
> > > > -     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
> > > > +     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
> > > >
> > > > -     declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[4], _data, _end, 0);
> > > > +     declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
> > >
> > > Should we also put the memblock reservation back as it was, so that this
> > > region can't be allocated there?
> > >
> > 
> > The issue is about the virtual address space, not the physical memory
> > behind it, right? So the VA range should be protected from reuse, but
> > nothing needs to be mapped there.
> 
> You're absolutely right, but now I'm more confused about the reference
> to crash_prepare_elf64_headers() in the commit message. That sets both
> the virtual (_text) and the physical (__pa_symbol(_text)) addresses in
> the header, so it feels like we really need to keep that memory around
> because it's accessible via /proc/vmcore.
> 
> > 
> > > In fact, if we're not allocating from here, why don't we just map it
> > > anyway but without execute permissions?
> > >
> > 
> > It's just 64k so if this is the simplest approach, I won't object.
> > 
> > I wonder if this needs to be so intrusive, though - there is already a
> > precedent of VMAs not actually mapping the entire region they describe
> > (with guard pages), and so we might just declare the first VMA as
> > [_text, _etext), even though the first 64k of that region is not not
> > actually mapped.
> > 
> > However, if that confuses the bookkeeping or creates other problems,
> > declaring a separate VMA to reserve the VA range seems fine, although
> > the patch seems a bit intrusive (and I don't even see the whole
> > thing).
> 
> As above, I think we'll have to give /proc/vmcore the physical address
> of _something_.

I figured since there's nothing actually at that virtual address
anymore, it doesn't matter what physical address /proc/vmcore gives. But
that doesn't sound great now that you point it out. I'll rework this to
map the range non-executable.

Thanks,
Omar

