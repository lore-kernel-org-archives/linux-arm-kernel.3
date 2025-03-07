Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25251C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRU/TFaL4e6XK0tcZjzvJPjDs61j/v0SE/FCbM4Kz8A=; b=yY7bneY85zr1P2CV+9CCPU+p4U
	2/vA2YUnRrx//iBDfYoTIAnAvfmr5daSAO5M2+OGfcpAh61iIOZvT+X4mJyKFa7mijHiMS2QhtgAv
	zE5/6CuzeW5dVjz+86wp7pqEBgTHpJmq8+2lu96iSACLm3wuUNaJ45MyITnECV1ZRnG8Px0SelAE9
	01PfswZo6GfeNKfY/OSBjn/GbjiXDktXU1qzEZYF9abzUJlQQq7EaZzk2xrtHX2/jEn9kHCeayQ5b
	pBaZ5HPeaxee7nrqbVAYUEFF156HqKBF8l5DhuO0zVaPwyY2yDsMP/Locm8p6nwWuphBnG+WwvicA
	YGZg/kLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWfS-0000000EAMb-2fzB;
	Fri, 07 Mar 2025 12:19:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVhA-0000000E0oY-3PUm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 08BA6A455EE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Mar 2025 11:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C295C4CEE5
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Mar 2025 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741346207;
	bh=mRU/TFaL4e6XK0tcZjzvJPjDs61j/v0SE/FCbM4Kz8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YEcRD0nP86wgTrcTAoZ5NJBYNIXEbIf5gZSI4aPMS1M2+1DGvDloemA6dTcXiaT1j
	 FUidEODiOpN4j9L2vMAHoXOTl2GKZFLA4KwNJ94YwQCk65vDz0PoyBizVzxNzziVjp
	 1nkyr4pyrYhJgL4GWzBkRqJgq/TNwb1za1xr0xXfuqTLDleBZZ+/nJc5LpG1P/8eau
	 5fQz7Kwvrd6wpeozWQj23LYWDuyaTqqamTVH6zwnqMyrEm5uhsPz1ze1xVU2dpOBUt
	 WAOulJBZOyF7kMHcl6WfMctXZQZ59FMQiOTShBONJiwmJdlk0o4KGZgEYj946NAqRt
	 i+K4XFhINT+tw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5452c29bacfso1880601e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 03:16:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPq+STHEBPazK9WWppCOvhwXqJZX2sJJVMtP5dTihGN68GMhst5suu27ICDjQvw97w2w4erx8dBvsHEU4uZWDz@lists.infradead.org
X-Gm-Message-State: AOJu0YxpuMDcbr5IoE+/aEoyCdiFaDTR02upBGYzOaerQnjFtXW9ROdj
	t+vShrpsV3DBnCAElgy2Z4csw0+HphXMXVj2sIKcw/4BPhB5fc73ijcxAkFD1XBuUdtwjVboAJq
	zTvifurDZissN435r9djRSYnrV+Y=
X-Google-Smtp-Source: AGHT+IEd8LNwJeFbdQ3uj2O6NksToZNoHhmgCNCRphkDy84JxoDFKdZ7tPd6rGQNzVWWtVSbV4qDBVVujGNfC0cWrYs=
X-Received: by 2002:a05:6512:1242:b0:549:66d8:a1f1 with SMTP id
 2adb3069b0e04-54990ec56b5mr1217665e87.45.1741346205601; Fri, 07 Mar 2025
 03:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20250307050851.4034393-1-anshuman.khandual@arm.com>
 <17931f83-7142-4ca6-8bfe-466ec53b6e2c@arm.com> <c3dddb6f-dce1-45a6-b5f1-1fd247c510ab@arm.com>
In-Reply-To: <c3dddb6f-dce1-45a6-b5f1-1fd247c510ab@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 7 Mar 2025 12:16:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE0mCPSKLyNUkLZXLntX-=aCGKdn5b3Zgme3PbyYFgFdg@mail.gmail.com>
X-Gm-Features: AQ5f1JoPPqfSFsuuGLR7flaiIcakquC0OyiZXiqRSi8scsvaTC-cqIRH-u_m12o
Message-ID: <CAMj1kXE0mCPSKLyNUkLZXLntX-=aCGKdn5b3Zgme3PbyYFgFdg@mail.gmail.com>
Subject: Re: [PATCH] arm64/mm: Define PTE_SHIFT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_031649_017929_CB824C9D 
X-CRM114-Status: GOOD (  14.20  )
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

On Fri, 7 Mar 2025 at 10:21, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 3/7/25 14:37, Ryan Roberts wrote:
> > On 07/03/2025 05:08, Anshuman Khandual wrote:
> >> Address bytes shifted with a single 64 bit page table entry (any page table
> >> level) has been always hard coded as 3 (aka 2^3 = 8). Although intuitive it
> >> is not very readable or easy to reason about. Besides it is going to change
> >> with D128, where each 128 bit page table entry will shift address bytes by
> >> 4 (aka 2^4 = 16) instead.
> >>
> >> Let's just formalise this address bytes shift value into a new macro called
> >> PTE_SHIFT establishing a logical abstraction, thus improving readability as
> >> well. This does not cause any functional change.
> >>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> >> Cc: Alexander Potapenko <glider@google.com>
> >> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> >> Cc: Dmitry Vyukov <dvyukov@google.com>
> >> Cc: Ard Biesheuvel <ardb@kernel.org>
> >> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: kasan-dev@googlegroups.com
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >
> >
> > +1 for PTDESC_ORDER
>
> Alright.
>

Agreed.

> >
> > Implementation looks good to me so:
> >
> > Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>

With PTDESC_ORDER used throughout,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

