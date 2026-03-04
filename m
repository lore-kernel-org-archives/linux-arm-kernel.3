Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CF8EDEBFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 00:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEG5dpF1eRobUG0IdOHkwb/7s++So3SZ9aNl1MzutF8=; b=BWFljrH7lIxlY06SDPa1a11Hm5
	1JYQmfQRqbMJE/Vc02MkZc1xLCL7gWBe7tRXn9tuI6RFIMML5/6Ign0m3pZyxcUBx99TN+0un7BNS
	yLtRnOKY1Y7UUID52fpO6GHxqIncFCqAi2+gHe3GsmncsUtgo/E98rygblC9oJsMT7j2WHmNYVaUf
	pnzpTHff8mlUF/PwidLpIAwmd2xLfRN3AdCdwTh6K5j5BocV511Z9FDKIluxCTFx47sqXQkYTfgO2
	mc0SINm1Md6c7DIzTyq6+6j8qvxCnwIg09JoRKk60BXDDupNA+DmdKI18WzU6Ga9gHkh4eFoXr4rK
	YH7V2IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaH0-0000000GAh3-10Ic;
	Wed, 04 Mar 2026 00:39:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxaGy-0000000GAfz-2AtP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 00:39:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BE846057A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 00:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A6EC19422
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Mar 2026 00:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772584771;
	bh=T2A9wJKs59MrLQGleN+1xCvv/eKLPAOAaicX81EOd7c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uSxRViHS6MiVpBNGaXGiOQEO8urRfdmg9pVohWKyK/WZT2dktxESz+HGRMfYvfwR+
	 ZCBkA7rtQU55uZO/2MC3DjXd+ck8Ms7fbCuizl8cHgSO7bZDcMo6ztdGvVGhgzQ7ja
	 ehf6rAUpF6/QHiH6IeRAmOqijyTlryniMDVJmDypb30RMh0DyrkSi9/0woMgumXw3e
	 sYftiapQvhZnRtabDw+jVO1LjBdnvrQfifiT/vPhN5kpWPLPtZMPqb+LCun/QZRrmY
	 4ThJGHHreeky8OEnX97ekfA5XL+IGPcp3vYE2VkjjEhDRrvepw0ibXK1J/KAGrzq6a
	 cTyIhNbT46XOA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79881805788so60889887b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 16:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXXcVNfHAFt+TOv2RLr+Ibs57cPYt9z9X9mCTEC1ir2dF/MxDKfrZWSPK+5ddXJ+7qyeBMBa2ceWQN8fYLcQ+Kj@lists.infradead.org
X-Gm-Message-State: AOJu0YzWshXqOV5NUGKTpraM/UU9sbjtDzrKDwSInWPfaphEok2XHX/Z
	ErWrqMvUh9ORv3qNlDmWRDGwdF/iCXioAIFrwCcEoIgx64RsXN++Is6Tzw4CWv0QZezjbZtJcPk
	p+7KWoPTFYwmMiNrkPDSvFizECoWv+io=
X-Received: by 2002:a05:690c:6c06:b0:794:d3e6:a503 with SMTP id
 00721157ae682-798c6bdebe7mr2222457b3.24.1772584770663; Tue, 03 Mar 2026
 16:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20260303-aarch64-clear-pages-v1-1-ad0c3ee9a555@kernel.org> <aab0SvA0dU0R0pnl@willie-the-truck>
In-Reply-To: <aab0SvA0dU0R0pnl@willie-the-truck>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Mar 2026 01:39:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLnhe_k1-eU90KjOi_Aj57S53a9GJoCZ-LTE0fz-TVSqvg@mail.gmail.com>
X-Gm-Features: AaiRm51SPIg6uwJI8TiwfWI3bFu7gsbqG0yTxInpwVnNjmqUrCUushkqAuiNwSM
Message-ID: <CAD++jLnhe_k1-eU90KjOi_Aj57S53a9GJoCZ-LTE0fz-TVSqvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Implement clear_pages()
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, James Clark <james.clark2@arm.com>
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

On Tue, Mar 3, 2026 at 3:46=E2=80=AFPM Will Deacon <will@kernel.org> wrote:

> > +extern void clear_pages_asm(void *addr, unsigned int nbytes);
> > +
> > +static inline void clear_pages(void *addr, unsigned int npages)
> > +{
> > +     clear_pages_asm(addr, npages * PAGE_SIZE);
> > +}
> > +#define clear_pages clear_pages
>
> Hmm. From what I can tell, this just turns a branch in C code into a
> branch in assembly, so it's hard to correlate that meaningfully with
> the performance improvement you see.

I think what I see is the effect of #define clear_pages clear_pages.

Because without that <linux/mm.h> open codes:

#ifndef clear_pages
(...)
static inline void clear_pages(void *addr, unsigned int npages)
{
        do {
                clear_page(addr);
                addr +=3D PAGE_SIZE;
        } while (--npages);
}
#endif

So for clearing anything multi-page we get an outer loop
and an inner loop inside clear_page(), but with clear_pages()
implemented there is no outer loop, instead the total bytes is
computed first (not one page at a time) and then there is a
single loop.

> If we have CPUs that are this sensitive to branches, perhaps we'd be
> better off taking the opposite approach and moving more code into C
> so that the compiler can optimise the control flow for us?

Hm! That would be to create a default clear_page() in
<linux/mm.h> and simply delete the existing lib/clear_page.S
and let the default kick in.

Right now every arch is implementing it custom.
Maybe for no reason in some cases, I could try it!

I doubt the compiler would emit this part though:

#ifdef CONFIG_AS_HAS_MOPS
(...)
alternative_else_nop_endif
        setpn   [x0]!, x1!, xzr
        setmn   [x0]!, x1!, xzr
        seten   [x0]!, x1!, xzr
        ret

Three instructions to clear all pages. But maybe that is not good
if this is a gigabyte, and the per-page loop provides a good breather
preemption point in that case, and then we just shouldn't touch
anything.

Yours,
Linus Walleij

