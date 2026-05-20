Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF10CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc/vvTgzveMBCa1VNMjtznDysK0tqOG3obOVDsPoPMo=; b=Znyp1ja2q2cF2Yvjb1XFbhgxHD
	rN9MCNv4lsXP7CpMPEiw+vwAg+4gaOCA4fAH81vOmkICtVYmSl97BAnYUJLuRlRTIikcfQnrrHS+V
	rjWqEnl/SUjX1NvpJcb8klia3TpWuJ7C9YR69h0VzvRnboa0JqXZ8gkUKYB2gtdUeooGIO7n2FeJp
	v2XM9YHuJaTgMiIgcZeN75UEPsgfGiyiV8Tn6u6/Ur2fs6633QaZWfGXoAOib0TxQ89C1hoqDZ2tC
	1QYRlGai0oZx2pW6Vobqw4Wz8aj/ajXAamubxP2BDG4IwmhfDg4CFoJ/g2CDelcENS+e6SdKTat2m
	07p9uKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbls-00000003rqG-41lp;
	Wed, 20 May 2026 07:55:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPblr-00000003rpl-2BKi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:55:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98956600CB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51EB21F00898
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263714;
	bh=wc/vvTgzveMBCa1VNMjtznDysK0tqOG3obOVDsPoPMo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zz1pFE3yLvx+kSeccOx00pKqBwSlpeal3D40KlqrSOuG07+i0w96ySbZ5bmuy6ij5
	 mT+GiADAQbvYZuNKIOB1eJDkKg+d6plaP83L80DwpH3JzaZ125mHkX6gRBITMUBBiV
	 DaTJRJNU5WJ0u/E6xT0bGashamig92usYxrkSBLubyXqr05Ptq1oyx8lAk3BL6GsM0
	 dx7OqDVwjOSGLqsopIHRLpVd9uSquojyudZMA+pnXhocnmQyn+ZL1kkhTwEGlMHqhO
	 QZ3ALhNICESebGXehlyX637Ce3rO18rdDwjAScUAW5nmLQv5mVxrKmISZJXPw6WW7d
	 pvQBP2Fomuz8g==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8b4eb1fd5d0so58891256d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+f9Apswf9USo3MAr1X4xPhAv38ZCy/QQDwm4bIARGmGVz5OyX7GDt4Soky68eCAJPdtUxbJAngSipbU6nX++bm@lists.infradead.org
X-Gm-Message-State: AOJu0YwkiJtkTAKUnzAeMPJw380JtD03S79/PmpsIpWPwgLl8SFYufXd
	9F0dPjZ5qFaMdET3YXnLOxmYwDUWMXhx95cHejr5SdQ85mCB2e4b4WSuRg00314pgpwUDj1MZvg
	LzL8ZUjM5Xp7IZJjfDuwK68+14UvCgD8=
X-Received: by 2002:ad4:528a:0:b0:8bd:b850:6cf2 with SMTP id
 6a1803df08f44-8ca0f5c30a9mr269197456d6.1.1779263713639; Wed, 20 May 2026
 00:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-7-jiangwen6@xiaomi.com> <ag1jhrWivbasi8Jq@milan>
In-Reply-To: <ag1jhrWivbasi8Jq@milan>
From: Barry Song <baohua@kernel.org>
Date: Wed, 20 May 2026 15:55:02 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zjQDOXToau0xoWOTnoP9kODxRdzSeNX6n_b3wxguC4mw@mail.gmail.com>
X-Gm-Features: AVHnY4KqBVtojg2o196NOt2aq-W7HkKHoLZxSEfiF5jAr2g0RL7Axc0xtO1xgj4
Message-ID: <CAGsJ_4zjQDOXToau0xoWOTnoP9kODxRdzSeNX6n_b3wxguC4mw@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] mm/vmalloc: align vm_area so vmap() can batch mappings
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, 
	will@kernel.org, akpm@linux-foundation.org, Xueyuan.chen21@gmail.com, 
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org, ryan.roberts@arm.com, 
	anshuman.khandual@arm.com, ajd@linux.ibm.com, linux-kernel@vger.kernel.org, 
	Wen Jiang <jiangwen6@xiaomi.com>
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

On Wed, May 20, 2026 at 3:37=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
>
> On Thu, May 14, 2026 at 05:41:07PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > Try to align the vmap virtual address to PMD_SHIFT or a
> > larger PTE mapping size hinted by the architecture, so
> > contiguous pages can be batch-mapped when setting PMD or
> > PTE entries.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  mm/vmalloc.c | 31 ++++++++++++++++++++++++++++++-
> >  1 file changed, 30 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index c30a7673e..b3389c8f1 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3591,6 +3591,35 @@ static int __vmap_huge(unsigned long addr, unsig=
ned long end,
> >       return err;
> >  }
> >
> > +static struct vm_struct *get_aligned_vm_area(unsigned long size, unsig=
ned long flags)
> > +{
> > +     unsigned int shift =3D (size >=3D PMD_SIZE) ? PMD_SHIFT :
> > +                             arch_vmap_pte_supported_shift(size);
> > +     struct vm_struct *vm_area =3D NULL;
> > +
> > +     /*
> > +      * Try to allocate an aligned vm_area so contiguous pages can be
> > +      * mapped in batches.
> > +      */
> > +     while (1) {
> > +             unsigned long align =3D 1UL << shift;
> > +
> > +             vm_area =3D __get_vm_area_node(size, align, PAGE_SHIFT, f=
lags,
> > +                             VMALLOC_START, VMALLOC_END,
> > +                             NUMA_NO_NODE, GFP_KERNEL,
> > +                             __builtin_return_address(0));
> > +             if (vm_area || shift <=3D PAGE_SHIFT)
> > +                     goto out;
> > +             if (shift =3D=3D PMD_SHIFT)
> > +                     shift =3D arch_vmap_pte_supported_shift(size);
> > +             else if (shift > PAGE_SHIFT)
> > +                     shift =3D PAGE_SHIFT;
> > +     }
> > +
> > +out:
> > +     return vm_area;
> > +}
> > +
> IMO, we should get rid of this while(1) loop. It looks like you need to
> handle just few cases. 3?

Hi Uladzislau,

I don=E2=80=99t quite understand what you mean =E2=80=94 are you suggesting
calling __get_vm_area_node() three times? We try 2MB first,
then 64KB, and finally 4KB. If 2MB succeeds, there is no
reason to try 64KB. Likewise, if 64KB succeeds, there is no
need to fall back to 4KB.

>
>
> shift min value is PAGE_SHIFT, could you please clarify when it can be le=
ss?

I guess this should be changed to "=3D=3D" ?

Thanks
Barry

