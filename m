Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3003C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uMo1mqds7+ytfGnAG4j5G/sObQBuQqDwF+7pp06uTM=; b=BeEtGNl66nTGFWr761bwfvuEeJ
	08HOde0v9CWa8yMmKOMjSGn9wxt0WCLOOrzXRxuzFEt+m1a4Nj/kTSJ7d46fEfsjuyzV73/XOYoZ/
	Q0qGpIS4FaB4tt4yc121LQ4/Dczd1I8+F45W6oN8I/DLAmWR6BUbsPq6ynlQSCw4ATDpI7JtG5lKp
	OwW861AhIflYMXGLgzMfjp5nHIHGXlG5LpuvkuIRSJsfYJq0xJz9OzA8CGhlod9KxTfh1oT8lv3U+
	C64FHeBy8W4YFi2zDkmEP1Ey24csrJqP96gnTlsYDxycvCdTuWn2NVochoZb/brHxL7QUhxvtHHXR
	VyKrcuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1I0-00000000cF6-2r0G;
	Mon, 03 Aug 2026 22:37:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1Hz-00000000cEw-3Uun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 22:37:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7719F43F63
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 22:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4441F00ACF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 22:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785796663;
	bh=+uMo1mqds7+ytfGnAG4j5G/sObQBuQqDwF+7pp06uTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=i1BtXtRv4xGPqlKGtwXrDU4q5r36CweAM1IiXE7Sp5iOJ3efGsRXBGZDn1Mbkjwh5
	 BUI4HdjrSKmaLqEdrLwZ3fe193A82tAdMHasMPvWknEzSgHR0CnBuxgeOR4CTnv778
	 Tals4QQoYMf5obfygtaAl4pPwyFqjtrMEhlycg4CP7eBzRgR6JdrRrfiPgVwsWM7nK
	 VxJ0xeDWhMgnLectVPMTCNqnvZTbK47DqxqeeVLIux6TiE4yD451jDxK4QJG33kUID
	 3tWT/wdHVNrKrg6TN8BztbjwGLT8IHQRDr/f3XzBCUVFk2VXQyh0yjdt6augvQKB6Q
	 SAvdE4o8Pm5jQ==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e602d2c0fso27656085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 15:37:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro6Yc3FV3PX9PF/uliecIPCAkquEtjePFJXDYLnGTo3jlDll9kw2Mae1TdxRkaFDmsX7DSLi+/LWjjv1EL1Q2FO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz67p+gqkr6cywAbjnKhnBeCt6OrgpR/0l3pecLg1QPHdc6KXqd
	pA/4/uAa5SVVu8V4qhyEo4vVtDfB2T6SyJwTbB1HoG4dD/mr0IW8yO6+ovEJ/ppQLwa7e4ftW8j
	+QpgHXucDby46jM5sP+iC0+0r2I84K9M=
X-Received: by 2002:a05:620a:11aa:b0:92e:d2d4:2d04 with SMTP id
 af79cd13be357-93631984d68mr248278285a.23.1785796662708; Mon, 03 Aug 2026
 15:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260802074018.73887-1-baohua@kernel.org> <20260802074018.73887-2-baohua@kernel.org>
 <anCu3DOrXDeMrwi5@lucifer>
In-Reply-To: <anCu3DOrXDeMrwi5@lucifer>
From: Barry Song <baohua@kernel.org>
Date: Tue, 4 Aug 2026 06:37:31 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xM7mmv_Xa3g2mB_0gW0_VtYhMtwz0idgYLyoAYiHFmfg@mail.gmail.com>
X-Gm-Features: AUfX_mxObWP2k3KVrcuv9diuYZ831nvuzQqkRHE7nkurJp-mPMd32XGLmVpvk58
Message-ID: <CAGsJ_4xM7mmv_Xa3g2mB_0gW0_VtYhMtwz0idgYLyoAYiHFmfg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, surenb@google.com, liam@infradead.org, 
	vbabka@kernel.org, shakeel.butt@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, zhanghongru@xiaomi.com, willy@infradead.org, 
	zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Aug 3, 2026 at 11:18=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Sun, Aug 02, 2026 at 03:40:17PM +0800, Barry Song (Xiaomi) wrote:
> > Use the VMA lock for kernel faults on user addresses. This also
> > makes the existing code below meaningful:
> >
> >   /* Quick path to respond to signals */
> >   if (fault_signal_pending(fault, regs)) {
> >           if (!user_mode(regs))
> >                   kernelmode_fixup_or_oops(regs, error_code, address,
> >                                            SIGBUS, BUS_ADRERR,
> >                                            ARCH_DEFAULT_PKEY);
> >           return;
> >   }
>
> Hmm yeah :)
>
> Bit weird it uses user_mode(regs) and the early exit uses the just-set
> 'flags & FAULT_FLAG_USER' too.
>
> Some horrible duplication here too... the user_mod_regs() etc. code is ju=
st
> duplicated in the mmap lock path.
>
> I think you mentioned it on Suren/Dave's series but vma_start_read_unlock=
ed()
> would avoid all this and could lead to a nicely red patch.

vma_start_read_unlocked() could completely avoid falling back to
mmap_lock for binder. For page faults, however, there are still
paths that must retry under mmap_lock, such as
__vmf_anon_prepare() and swapcache_is_device_private().
So we may not end up with something as clean as binder, but I
think we can still achieve a cleaner design than what we have
today.

>
> >
> > Right now, the code above is dead because !user_mode always
> > takes the mmap_lock path.
> >
> > Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
> > Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
> >  arch/x86/mm/fault.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> > index 45b99c3b1442..c22b74e0eeaf 100644
> > --- a/arch/x86/mm/fault.c
> > +++ b/arch/x86/mm/fault.c
> > @@ -1328,9 +1328,6 @@ void do_user_addr_fault(struct pt_regs *regs,
> >       }
> >  #endif
> >
> > -     if (!(flags & FAULT_FLAG_USER))
> > -             goto lock_mmap;
> > -
>
> I'm not sure why kernel faults of userland memory were excluded initially
> (Suren?)
>
> Given that it's OK to take the mmap lock here and we're necessarily in pr=
ocess
> context anyway surely it's OK to take the VMA lock?
>
> It looks fine to me but want Suren's input.
>
> Also given vma_start_read_unlocked() is coming maybe that's better for a
> cleanup.
>
> And finally - Willy is working on a grand clean up of this stuff _I think=
_ so
> you probably should coordinate with him also?

I have no problem waiting for Matthew's work. It is the right
thing to refactor the duplicated code across architectures for
the VMA lock page fault path.

Thanks
Barry

