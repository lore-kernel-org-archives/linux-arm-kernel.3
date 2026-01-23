Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B46D6CFDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCy+LD3GaDu9//lyMgUiD8hpNN6eegCGc6SDN7aote4=; b=bzEERpS5FmbDXPG+77n1eWo7lz
	VtHoqIJv4LtVhF7F3BjIEE2iE54uRfZqH+0MScjFQLo3v1i1P2bY36r+ZAN7EUgaER8KpMLWmOhpf
	aSgG9g2+hfaY44TDEQdE0bJMdJ8n+7tYc8uzkiRo6rMXE9WttD01H2sVVJXKtxHZ4Oz7KOutPvtI3
	7qL50qM37sNBEaBOL1Mw3m6yFW7EKVTJlk877g8Xx9/YzNdOWzxnimi+PukZXIwH30HMS2QAmeEAu
	Rv58qRoAKOrfRvHuJs0oiNi1AWefsrOqoYMFUI/6bf7Y9yScZYVP8xokDQl/106NV106TI61gLNcf
	7KUFJEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAuP-00000008JiE-2RNv;
	Fri, 23 Jan 2026 06:44:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAuN-00000008Ji4-3wdC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B616E60054
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFB6C19422
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769150678;
	bh=G68OwHeMFSkFczDKRhFt13EuWCm6wYpmm34gZd/81AA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LyPxseOxWj+QOfdnqto+kE2kNc0aSNpS8o5GBPeP+13Dv8Gg9bMZgqA3cTflXzDw4
	 P76RsKv4lyp3TEtgvAKWWfSdtBnrjyylnR0wZ1N3lr9ZH0fML2pDi6jdtO6wr3+Rkd
	 yjcMc0kOuUbsABi0iswGbdTl7QCHHcIqLDV3R+rTdofY1wCwo7LcCMEoatGusTCyRT
	 j4UJlOWoWoB7NyQZC9/TTSgvahefLYo+jUPZ5t6VvQ9ISa4yXDruw4XXQCjiKOpUgZ
	 8C9w6wAImmdwFNFOTGoaH7Cu2Z72icXGG/LNUscMO5f6M1z74ZTZoKsqku1qaoFgoU
	 1Fei+9EI/Tnbg==
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29efd139227so13494815ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 22:44:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdXbh5llTk+nkE+6F9h2PiGbipwGEXoMNrRGLPHM0qBLsfwYQbleBVnCooxf1RX5KVA67WBKQmrpB4Qqqv06f8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv8CJzF4eL8FzMuOspOm9RI6I3ctvs1WauWlNcugrHw3JzE/uo
	6RSrMcc7HFLm3zqZjYMZYf46R9l7tRC7NFc+kH1cAkpRj+qkWAsNol2xm70T+T3Qt0SfNSpDtre
	6lWu5V+agTsomZNFYn2ZpjasuKeKuiJI=
X-Received: by 2002:a17:903:8c8:b0:295:560a:e499 with SMTP id
 d9443c01a7336-2a7fe43ed49mr17499125ad.5.1769150678062; Thu, 22 Jan 2026
 22:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com> <20260119164747.1402434-9-ardb+git@google.com>
 <ddb667ef-efd1-40f5-832d-9017f6bbbec5@arm.com>
In-Reply-To: <ddb667ef-efd1-40f5-832d-9017f6bbbec5@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jan 2026 07:44:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH7Ed6+uKWEDozu97tfiQUtXxuT5ocp7HoBpZ++T0tvuA@mail.gmail.com>
X-Gm-Features: AZwV_Qj0qFyZ-3lT_l7PUgDK3X-TjJKC_w4YzjPSMNrGxpn-wDUT_EpcLvxvdFU
Message-ID: <CAMj1kXH7Ed6+uKWEDozu97tfiQUtXxuT5ocp7HoBpZ++T0tvuA@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: Move the zero page to rodata
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ryan Roberts <ryan.roberts@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 23 Jan 2026 at 07:43, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 19/01/26 10:17 PM, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The zero page should contain only zero bytes, and so mapping it
> > read-write is unnecessary. Move it to __ro_after_init instead.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/mm/mmu.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 2a18637ecc15..d978b07ab7b8 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -68,7 +68,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
> >   * Empty_zero_page is a special page that is used for zero-initialized data
> >   * and COW.
> >   */
> > -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
> > +unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
> > +                                     __ro_after_init __aligned(PAGE_SIZE);
> >  EXPORT_SYMBOL(empty_zero_page);
> >
> >  static DEFINE_SPINLOCK(swapper_pgdir_lock);
>
> A small nit - could this be the first patch in the series here ? Becasue it is
> not related to other three patches.
>

It is related to the other three patches: the 4th patch requires it.

> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks!

