Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B46FD2D8D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMRbNvGgE0D/RtXN39MCutIH4fjIcLqQyLSPMnSPrcc=; b=N5vfFbL0DFETVw025sOGHQ5NQo
	uNUAXYewp2RnV9GnfeW//9pEL9SFLhTJqIKsIJtVe9YWo3EOH9hiOoBHLzhFUQm1v6FrL3KG1QOs1
	u3vaQuHpTXfeW+jhSP/kjVc2d77Gi8d2GIF2TwZ/vZC1NhDiaLanxSdtHv0GCUdisgkOUZ1JAA6lz
	wLvBcq0mgmbOx2+mo8LZmVWY+82O+1uF7kMdeTRT1l2qbjAE/BNH/+7vG68dQEUFBt8k8zR6pUraa
	LWbED1WAhXSWzlETfaOvy3p9EVRmVnpXcjiTk78f+PNPE8KEPZMeqbi6hxfbComnaHXjKiXjvdOMq
	mWFnJ+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfha-0000000Dzek-11pa;
	Tue, 27 Jan 2026 09:49:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfhY-0000000DzeO-1m3w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 735A743835
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5556AC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507375;
	bh=7ffJyHAC8J/GkSpmEQneS6c4rnD8WljExEpFryTMzaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LzqWxbJqFOchXJuo8YLJENnYCYFOPrgCtVbCV46w0GlcHrASlofAHnhSJ7DITkkut
	 Mmb4pBpElwoSbgNjdFGoWbdXY50Nf6kF5meKch2Xrp39YQcS1HFZDeVfp4Dp0B0Y9A
	 xXVYsckbaOR0bq9vv0ydHb3ExobRGgR3rL9idl9BewSsG/Y7OSvkRgWNb2dkvMkjaU
	 VocjzPRS1ZsjxZZLTM3h/egB00sUy+KrZZ7U7vaN5gumA8ftItQSjD4KgV+LFYHCrs
	 +gUlVuyWz1wofey7FvbUxbsahbDPYOSokHtnHnl3y1q0MKFhP3q6hXKT25KWKqvz/u
	 CrRDeIH6tm6Vg==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a77c1d5c3bso24025825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:49:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUm74vb5dKHArCAIb239wPchdmnOIpngmstXeR9+A2Saw1VxAEorunrs1oCPtQfM5a/Owt8Knh+brxIWkMskfA1@lists.infradead.org
X-Gm-Message-State: AOJu0YzK3CRfzvBVfugxeUF9vFGv7gxVXmaXbJlZFT+LAOQ/lynK9EMZ
	VGmpWJV52hvz9Vuh2tZhNDQGpX/ipmWoTpPb5zI1ikDLcKhCv8WBpH6mSmmEFeXIMDLrgxl6i7x
	8m8Wm+ybLkYKjcm+yo3/T/jegwN5/1fY=
X-Received: by 2002:a17:903:198d:b0:295:570d:116e with SMTP id
 d9443c01a7336-2a870dc8cd3mr12948505ad.41.1769507374856; Tue, 27 Jan 2026
 01:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-13-ardb+git@google.com> <3d59a8d9-a382-48d8-b79c-f5c23e86c1b7@arm.com>
In-Reply-To: <3d59a8d9-a382-48d8-b79c-f5c23e86c1b7@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 10:49:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF4k9EstLkxdNje_rwTehdu2MYvyh7n+4GoMWNcjcHYcA@mail.gmail.com>
X-Gm-Features: AZwV_QjbFJ48-GJAX5IbCu5heqXiBoewnTMcOOsWNGmC7SW2Fjs46gnJ_q-g0r0
Message-ID: <CAMj1kXF4k9EstLkxdNje_rwTehdu2MYvyh7n+4GoMWNcjcHYcA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] arm64: Move the zero page to rodata
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014936_510918_B7DA7122 
X-CRM114-Status: GOOD (  24.41  )
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

On Tue, 27 Jan 2026 at 10:34, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The zero page should contain only zero bytes, and so mapping it
> > read-write is unnecessary. Combine it with reserved_pg_dir, which lives
> > in the read-only region of the kernel, and already serves a similar
> > purpose.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/vmlinux.lds.S | 1 +
> >  arch/arm64/mm/mmu.c             | 3 +--
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> > index ad6133b89e7a..b2a093f5b3fc 100644
> > --- a/arch/arm64/kernel/vmlinux.lds.S
> > +++ b/arch/arm64/kernel/vmlinux.lds.S
> > @@ -229,6 +229,7 @@ SECTIONS
> >  #endif
> >
> >       reserved_pg_dir = .;
> > +     empty_zero_page = .;
> >       . += PAGE_SIZE;
> >
> >       swapper_pg_dir = .;
>
> Isn't there a magic macro for getting from swapper to reserved? That will need
> updating?
>

Why? This just adds an alias to refer to the same allocation.

> /*
>  *  Open-coded (swapper_pg_dir - reserved_pg_dir) as this cannot be calculated
>  *  until link time.
>  */
> #define RESERVED_SWAPPER_OFFSET (PAGE_SIZE)
>
>
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 9ae7ce00a7ef..c36422a3fae2 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
> >
> >  /*
> >   * Empty_zero_page is a special page that is used for zero-initialized data
> > - * and COW.
> > + * and COW. Defined in the linker script.
> >   */
> > -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
> >  EXPORT_SYMBOL(empty_zero_page);
>
> What's the benefit of giving it it's own place in the linker script vs just
> declaring it as const and having it placed in the rodata?
>

Because it collapses the two into one.

