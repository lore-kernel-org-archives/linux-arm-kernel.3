Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A58E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcZNStxaQwlwL5TJsSaz04AWUJSEDre9QpIUeEFi61I=; b=z4tsADT0/N8+3d/8rIhoHSnTI+
	ZvGJn97p3jBr9qF3Its2wW7KKZh6XFseXk0MZcId7LtwW3NJkg19NMVdd0U6/a+rl0axYs/M1B1YU
	CPwOYVIi7/NOmYErqTeM5DkxhTDKThwRUEvMWnW79mZhJcvYtZUCk0872ytpf4+wgkng5GpDOD22p
	ceYaS0gFFvmrgI8ZUDVRMlQrjN9F1JbdbBCwcSmIPOahfix7YqXyRqpdxS/DjbXck5mCzOsfbghJD
	Ehar4Q5pykslHMWNxIljjrxLuJ9BkXQmPfek8lXuAk2w/cp3xdvAQTeMRVvw0RjZocWf3pedi0R4C
	a2q0kJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJFo-000000052mb-10HC;
	Mon, 13 Jan 2025 12:09:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJEZ-000000052Vw-0flh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 12:07:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 524C55C55BC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 12:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1CCC4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736770073;
	bh=3E/q/3mkR7SCVOIvr+DiffYhgV8d4s1CTvqnIlPfWZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rMX4D3fHgJ+/B5vM1PqVfSJ4eMSTkm4dUB0C8WUUOsDDzOJVPrXxyfRAP5sRbVv61
	 NMB1hIH303MrIRkGOnyP7ri88oYeXNZ9MYltFBuTjcis3oQuWv0DU6xgdwk7NIf0Z7
	 zT3GJf0Uz/Y8MDy3Df5bg+PF9FGtx5O0n9A3Xsr0AeT44yHmeiBa6WEztslA0Eh1sB
	 Et7oqfO+DNlT64GwKKaXsQFqVrbm9kIZ9Y4A5Y0qXetFdQ4Ky1cb8m8EIkrVVas+Fi
	 /nylzkkjflG3Va/6krow+zMKWKamwZJjehXVjdLdT+YS5x9AyF/frXZ4vLXUuEVfKw
	 BgqRXck0HB+eA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b229so35395061fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 04:07:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5BXDjxkfA0xWckgD7rvQRxaBrdmyAdTvL2sHcZLjGShPNy/Cj3UuSmYqQzEh4K3ETALuIMdGmpZ56XtDtWtaH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb8A4OA9BElDXHWDlmmUtV8btwxN81LvFf0qdK92LRNe3sSnwl
	VGQP5ttC3ekLn/1Xybj04ZmO6ItGvEh8bhBEyFOZE6ay14TTOiwoLhFntOcVwPpvzkV0KssOFQ1
	WhG+VeuYu8o4CC2mgmycqubnoJUk=
X-Google-Smtp-Source: AGHT+IGyQHGxkQSzw4xUYx6Ln2lvvv4077Kltat8FP//lSEIWo/+OlGHji7wGnOlST0oVlGsGBvMf4mQjHeHg+7rGis=
X-Received: by 2002:a05:651c:221a:b0:302:1e65:f2ab with SMTP id
 38308e7fff4ca-305f45dcb78mr71849291fa.20.1736770072235; Mon, 13 Jan 2025
 04:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20250110175145.785702-2-ardb+git@google.com> <2cf7c240-e8c2-4575-a98b-2f68f4dc592a@arm.com>
In-Reply-To: <2cf7c240-e8c2-4575-a98b-2f68f4dc592a@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 13 Jan 2025 13:07:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEO_hb0oYP4xREv+k6GF_JuagifP=P8gsee-Qn4h--WGQ@mail.gmail.com>
X-Gm-Features: AbW1kvY7vtbTFiWt-1991LgCkqfD10yXByDfa5kM1p5M-uuU5l_6GdpUHdHGtvA
Message-ID: <CAMj1kXEO_hb0oYP4xREv+k6GF_JuagifP=P8gsee-Qn4h--WGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: Fix 5-level paging support in kexec/hibernate trampoline
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	will@kernel.org, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_040755_284503_CEA1DB10 
X-CRM114-Status: GOOD (  22.89  )
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

On Mon, 13 Jan 2025 at 06:01, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
> On 1/10/25 23:21, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Add the missing code to allocate P4D level page tables when cloning the
> > the kernel page tables. This fixes a crash that may be observed when
> > attempting to resume from hibernation on an LPA2 capable system with 4k
> > pages, which therefore uses 5 levels of paging.
> >
> > Presumably, kexec is equally affected.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/mm/trans_pgd.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> > index 0f7b484cb2ff..84594f02f780 100644
> > --- a/arch/arm64/mm/trans_pgd.c
> > +++ b/arch/arm64/mm/trans_pgd.c
> > @@ -162,6 +162,13 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
> >       unsigned long next;
> >       unsigned long addr = start;
> >
> > +     if (pgd_none(READ_ONCE(*dst_pgdp))) {
> > +             dst_p4dp = trans_alloc(info);
> > +             if (!dst_p4dp)
> > +                     return -ENOMEM;
> > +             pgd_populate(NULL, dst_pgdp, dst_p4dp);
>
> Just wondering would not dst_p4dp goes unused (and probably leaked) when
> pgtable_l5_enabled() is not enabled ?

Would pgd_none() ever return TRUE in that case?

> Similar scenario might also exist
> in copy_pud() as well with respect to pgtable_l4_enabled().
>
> pgd_populate()
>         __pgd_populate()
>                 if (pgtable_l5_enabled())
>                         set_pgd()
>
> > +     }
> > +
> >       dst_p4dp = p4d_offset(dst_pgdp, start);
> >       src_p4dp = p4d_offset(src_pgdp, start);
> >       do {

