Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989A7C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mktbwwZKpKyEAs0u457WQbvPR8j8TvSInGAQojhS6ZM=; b=x9mo8C2ipohrx2ZceGHPBI6UL6
	V5ZmxORuLDoQ/spJQ867pNCk1gp34fJKbFraJG6DW6ucQh5aJZu1Kik9J6MTLhnCjNRAPmJOXqvMw
	RzBrChCO7LzDBv49NIfPqI8uWxDUO08Ypdx2QowIlouvB0Eh1RsdKiQTTKd3WtjLz+q51KlPR4wql
	Dy1RTger9S9Zo4gOVT8dITbvrhIV/b9xDwHvs5FJC3TWXrcd/9LgaS6bJC6blY5VFsdzXO2pb4IOS
	SPVY73ZIUswfOURQF3Xo8plLvD/nEUHurEpF6lKB3B2nBQ9OZDNLZbWQfc1/ohxllHkg38T+WDN3I
	r/Rao31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquzI-0000000Habi-0Uc9;
	Mon, 03 Aug 2026 15:54:00 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquzF-0000000Haah-1OB6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:53:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cab97c86bdso175295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772435; cv=none;
        d=google.com; s=arc-20260327;
        b=JovodmSC6VnXKmHE1UO7tlvlHPsADOkoiTMbyy0qFUXcyH9w/G8NmTXwPPer03hCAf
         6a3OVDn8Rd1cDh7FPXv+B1SJNaazsVepxa0ljYiLv2GkuENxdjzdx6Jx3MTZWZm5g46Q
         Jz11f1UBRzGts+QELvpnZ+il+GmJcYIs2y83igyCie17djjxygV5/zEeVV8wIKYHTvtu
         L2SEKOOQkLxymoHkHSGTGiNMH/rhyhkOMFBlMmhvUZI7dFiao6GowUz95ZOncxKkrdxh
         Y5lFOO6iI0oGXpHgvpmQdSWMlVJb4SA0qKkr43+cVbGffSK4s6ElaHLWjeSIn9k5O9Xx
         nJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mktbwwZKpKyEAs0u457WQbvPR8j8TvSInGAQojhS6ZM=;
        fh=0VsufwmZCRo7qUKU0zCKTkK1KBlaW+Bl68oPNXaUI9c=;
        b=kxr21xJxHgltRK5L4dWL2Rwg8pqF/urQuq3d/WBkRgn0m2CImRaChhntD7NtwP+8jE
         +M5nDco2Rff8r1S61Ufall/JmBbJ9y4ioeYjgfSMOOo9UPyFJ5FsufzmcsrzheCiyRvf
         SFPuz/DBr+lQfErrmRteZJ6mEmcAkKLYKcA4RtJ7KfrdViCKRPxDSxm9sQEhxevbl9x3
         eP25X3lgq07w48eIn67ro2710aXV6R5dueE9Ct9tG2Ri3CbCIjt5o0QKfYFfNV50C7Xs
         Yz3OP3Oj+1LaLNHCAsR5DqDP5SZV596nuWFrbPMpoB+LBx+erB77fDdD0qYAPcu+Dbd+
         FAsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785772435; x=1786377235; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mktbwwZKpKyEAs0u457WQbvPR8j8TvSInGAQojhS6ZM=;
        b=HxPvoblu64lTNwYvljrgT6eKkynjwoTMQ5fSYrh9sCg0cOsBe8wCbvzMzGZHPpqURF
         Qilw6ukbyHQUeF1/YMUKK5En1XGIerr4wcHeiBHTWwghqEscCqCYHniUP7PTsLs/9hgw
         lz0hGni+a6eL01UkgJ8WTyT/1xUVRrc7AlDO4wzO4lhkg7mi8lww9Rl3kqqBbN7wegF+
         8w0056NdqPLJsrTGkzGQyMr9U7LgPp0wSrso9Eig273vFme2VJN6J+AlsKIqKv9TAJsd
         TBn5uOFJJgj3CvhauTvPKTKrpMr2Ty7Hhy/op7aPBI2wPDWt6lfnr6zDJ5VqXHC3z6lb
         Qy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772435; x=1786377235;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mktbwwZKpKyEAs0u457WQbvPR8j8TvSInGAQojhS6ZM=;
        b=YndN8x9oD+kvNeXWL6ocnCf/ybn60HSywue0rmHztHeD7F6N9x3jyMoVWxoz8VD2uz
         Fh/aalySvb8ONAWTPiUBtSLzu2hYd9mbk/cuK4U3OexvN81pn//FcCzkidpjtrHq45Jh
         v3U8J0ZyxeCRD3Q3DPnZ/jsB4x/p7yptzvXHyq9HdktkJSI7pk8GhKBfKekeAqphQGUq
         v9aXAwcOmLLDrTlWVFgbUwquF529n/MLtuBoy3xKe2NirSX4Wok59+kudP2yvXXPjN6D
         2jzhFYF0NCmtVI/7kod4YBzfDgIAn48DlnfndM6TKqvn5JhDizI1Wx2ckCmlyfqg8P/3
         joNQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0ye7Myvw2veja2oXA+b9LqTPp5VJYy+YRcoxQbCHg8E3o7wlsUNYxnUQ4+qB+CR0wShvoGeBQ6zM1PffUELiT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7MCIUohWUm6UkOg+U0jrpDqaMCiznkR32U+FCn1+ENnQ1jrlz
	KfEohwetw791g80vTU6ES+MTdYCxzf7Vc45a1Fxyo96CWowjKCVcIQGI8QZz2UvpKjC9Cx4pBdy
	i45VyxGrlcBw69sswIIIYd9BJBMcL++j8o8bvDeHVn0VB8fD1OleSIQTf
X-Gm-Gg: AR+sD116SCyggEl7pgnusE+4udbJ6y5DBssRI+v+qgb2pMsBotDCgHdBqYN1SYDeIS/
	YPcw1hmJy/7Bztho+LfSdYm4fLbamvTqZjnWD739wBqPz6z7hfzSsGj7hObcXyAbo5poIZLmpMC
	jKnwdUMWQtGgavc3FanW0bGuq9Q6lTiVh9wJdofATvP5EUBSD/QEHKY2aHgQRbNRId+y/EGa1R8
	MmFWfJxDHktUlk8y84S+15SrQ/9YpqDO2sTSS3EnYQ0ns/Q7hrFKsrPo9MAimvZZpnXHpYMaTdF
	dnnQwWEISOGBbmmt/0wBXgl0b991hfec4bT6/5Mmp5VemNWDhhyCu5s=
X-Received: by 2002:ac8:580e:0:b0:517:5d71:84e5 with SMTP id
 d75a77b69052e-52b5b0b0160mr34599361cf.5.1785772049129; Mon, 03 Aug 2026
 08:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260802074018.73887-1-baohua@kernel.org> <20260802074018.73887-2-baohua@kernel.org>
 <anCu3DOrXDeMrwi5@lucifer>
In-Reply-To: <anCu3DOrXDeMrwi5@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Aug 2026 08:47:18 -0700
X-Gm-Features: AUfX_mx8f-jBcOKi9pZdnfOnnZVSXkXmF-pD1Lo2stOVOrv2fQeb-q7PoBUMwCw
Message-ID: <CAJuCfpHLT+MLTY0B4bjQbCpt5VUD11+KF7KY9Y4u4OAfc=3jtA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] x86/mm: use VMA lock for kernel faults on user addresses
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, liam@infradead.org, 
	vbabka@kernel.org, shakeel.butt@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, zhanghongru@xiaomi.com, willy@infradead.org, 
	zhangbo56@xiaomi.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085357_372990_21877081 
X-CRM114-Status: GOOD (  28.18  )
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

On Mon, Aug 3, 2026 at 8:18=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
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

Yeah, I don't recall the specific reason it was excluded and there was
no discussion about it. Probably wanted to limit the initial series to
the most common cases and avoid any side-effects. But indeed, if it's
safe to take mmap_lock then it should be safe to take VMA lock.

>
> Also given vma_start_read_unlocked() is coming maybe that's better for a
> cleanup.
>
> And finally - Willy is working on a grand clean up of this stuff _I think=
_ so
> you probably should coordinate with him also?
>
> >       vma =3D lock_vma_under_rcu(mm, address);
> >       if (!vma)
> >               goto lock_mmap;
> > --
> > 2.39.3 (Apple Git-146)
> >
>
> --
> Cheers, Lorenzo

