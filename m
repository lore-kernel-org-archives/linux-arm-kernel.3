Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFCFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/iDrBzzYdL3wUdhDHt5agevBzDHJ4IgYfqYHGNXII8=; b=tH/F5EJ4YrnkEtpwd9O+RR3jDM
	zXFNUjapmoiaUpAO8emDPocN8ltIfpeERRS4b/ZRt+1ogKeoYBep/1QCGZRosuO9z9GdMGKoq/V0P
	GFaOC2xLZ2yXNAbJi916BbSgobSUVTr9VHklOYcNaM/1BpFE40gu3J7H7gPX5Z4Ww1rUgIdkL5rd4
	PllpMjnSrNGI+u1eLoLtbBTK7nnej/RwsPqcBkDWHjadTsljmLu8Zznz5HxfrR2/SsbI6TS4Lag1K
	kOgN4DqcQlnAd7JEFxAXo1a7AA3qgzAjMmhtzQy2RQpDZL8mrflrl5rR9LfJSiQvVd7D/lyDyS4zn
	6OM5Km3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYc5-0000000BJyf-3L68;
	Tue, 14 Jul 2026 08:35:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYc3-0000000BJxt-1WkA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:35:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso1737475f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 01:35:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784018133; cv=none;
        d=google.com; s=arc-20260327;
        b=kQ2DZhVUoc0rezP46azL98DEsKvGJs1IQAcotuhfCMAnqRAiIz76YDva8Zjqrka8cH
         HlL4lEr3oUTuZwIp3KDU9YMaUW2nkZGMFov775/Ze+7AxJ4IVExcBXO8uuYNMpb39ZRv
         H7i0Qc/0/32hSjs1X+CHauap5Jfa70mtiZf6L57W1rMjC0xEclb92mgAU+nLjmiBnAEu
         c7+HDSQrVyXIiNyT1n3+0vT89L7SUNsRBGnuV7vcsKfcH7Fsf5Wa49TPi9PZbIsIHS3p
         ECcsgNiqQKzAEvrsnDvhAZhPIDLa+g1WkZBpSTcz+pOcv0t9S61Qp9sO2CT0+IQR2WQQ
         zQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D/iDrBzzYdL3wUdhDHt5agevBzDHJ4IgYfqYHGNXII8=;
        fh=Sli0hXR8eT9M273f7QtlIFWzCbOBePEGKhmOvuTSY/Y=;
        b=UfUGj5ACA4H52GEom7ihhoQ3GPMcRBTDu6mRru37XxTbxVPkJ37biNQrGg/128cj+Q
         mMKPJuGY8TqXVXjrODsUYogpcpc7nx6VQRStmOM7k8GMtCqwGm6qI7dDstW/EbF/yIYx
         fbSTeC9fJqkBljSLjYEUzKKaYMulsbq6PBVertvzS55i4jl6t5G0+52gldIEbLMVtIG5
         6clq0RL9sxIgr+AaeexXOOUpNMLr8J0y2rLpN6foPcJqssFX+SbkRCMokvxf+wg9mUAK
         8u9qkO2q/qRx/1ymIP3HlJYnwKeAdnJXvYawNilQ6gSs3dU6LSng5hEhFk7hxIbSbMXx
         jHGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018133; x=1784622933; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/iDrBzzYdL3wUdhDHt5agevBzDHJ4IgYfqYHGNXII8=;
        b=m3hhJagZy4YYVJYHPAMFGpuiQcUweQTSEpJdYmXhEaDrCdHGgzqMK3fHJ8jLbJ1EjI
         w+y7FAfXC4RL4Wd7jec01j5c7CLu0ou1+67mW/ebf1AXciJPiHi0kjmeVMrllowiy9yV
         gXS8xmQkMb+o4elqYXPmEjgXl9bcBK7uVv2Rr8XnSmekQ9E2VwMOERzzayFnnUkV3lm1
         +NgChDaRJyx+JTYrUpBnLaRGfOBfSVRowYRxT0WXgaayEEsBN/GUoss1C7P8vS5MFIEu
         +dgDNjl5y1nntt8vzx5oV7g0c5Przh8t2XmZrHffPjFyCP27KqBsFX9xpZAyIMhJI9Nh
         A4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018133; x=1784622933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D/iDrBzzYdL3wUdhDHt5agevBzDHJ4IgYfqYHGNXII8=;
        b=EPUnJYl98giMpA0xYMGQohvXa6EaHfarq/LV+twG7vnIhWCjB41ibZTG5S/oMMEaMW
         s8MYM5JarpYP0paptzxWWmMp7FCw1WYV1ZPDAGCjtnysiJ5MxUlPzThfOasKnzABSDvt
         cKtvGeGI16fIBO84AmblEP3t9lWdj5eY3V3cVzg17W64lKpqV9JofO21QhbRA+y7B3GI
         HV8Tt25UkfKk7HWg6Ts0leFtr2adE78iJGDg1aL+jR+XhuckrOfh9TA5aDFH1LlsQoFJ
         hpM6OeMnkk9dC6GGxv/BqPP4KhszpvibVlMOza4CVZG2oMxonwmyOv9ThZjAEVAs5r0u
         8VIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1c+Fa1f2BtDY8BXA8CURhnczNP1xCm3YH4GaxQA7BakwV7Cq1iycbwSRCASCBiUfY1IynLFmt524Ztb8tnHw5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywip3MMZ8AYZlFVuxWEUMGJ4Ourxwt5a69XlF5Z73g1Thkhg0uO
	02HsBqFQENeIWNOBtYGsNmxpfe6IA/asvSgFsKDtfk2h203BMtvtAcxaXRIn4FXWQYEe+COaHTe
	W1U+IBx1g9bKknB+c+J76iGvNX+bZ3Mdt7IBW
X-Gm-Gg: AfdE7cm6zVoFibJgAzgSIYh6VZwiLrVbDXVHoRGwAztjm5/Xl1+/7htD4OonKiXHNjN
	+BhaAFu6j+5+kgqK1eiiuEmBSKl+DAi0jLaxq7c6VvBdJKaOhHpap2skbid94Lk5MrjJ1i60uRK
	EBUmW1o8eZcrrJ5poGfrGXOjlku7E+ac+2F2qFo7nSHWr2G9zoJeH3ZGm4z1NNY9GBX03dftKso
	T8BtPUzos5qD830U5OgAat41zJIjN9S9pXIRXKnaG78mw0cQDRKqSjT0ta5jJlurSoybGumsBHp
	kLnY1NkOA7mSZNdSq88=
X-Received: by 2002:a05:6000:250c:b0:475:a4ae:e630 with SMTP id
 ffacd0b85a97d-47f48891d9dmr1757470f8f.37.1784018133298; Tue, 14 Jul 2026
 01:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260709073823.6643-1-jiangwen6@xiaomi.com> <20260709073823.6643-2-jiangwen6@xiaomi.com>
 <4b3c1d3f-853d-46dc-bb15-37273fb07f61@arm.com>
In-Reply-To: <4b3c1d3f-853d-46dc-bb15-37273fb07f61@arm.com>
From: Wen Jiang <jiangwenxiaomi@gmail.com>
Date: Tue, 14 Jul 2026 16:35:21 +0800
X-Gm-Features: AUfX_mws3EZK8Zkz_kXisjnQFFFt4F_ceV7hPDYpct8AJTxd5OPwxVMDfFEFO0Y
Message-ID: <CAHKocdHTzqdMnmjLnXLfc5GxhP1sPcGqZ64Wghr7xPtUqXGdgQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, david@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com, 
	dev.jain@arm.com, "Barry Song (Xiaomi)" <baohua@kernel.org>, Wen Jiang <jiangwen6@xiaomi.com>, 
	Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_013535_426394_A02C20C5 
X-CRM114-Status: GOOD (  19.60  )
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

On Tue, 14 Jul 2026 at 14:54, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 09/07/26 1:08 PM, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> > we can handle CONT_PTE_SIZE groups together.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  arch/arm64/mm/hugetlbpage.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index a42c05cf56408..0da746f729388 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -110,6 +110,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
> >               contig_ptes = CONT_PTES;
> >               break;
> >       default:
> > +             if (size > 0 && size < PMD_SIZE &&
>
> Is there a possibility for size <= 0 ? If not then
> the above conditional check might be redundant.

Hi Anshuman,

The "size > 0" check is to guard against size == 0.

> > +                             IS_ALIGNED(size, CONT_PTE_SIZE)) {
> > +                     *pgsize = PAGE_SIZE;
> > +                     contig_ptes = size >> PAGE_SHIFT;
> > +                     break;
> > +             }
> >               WARN_ON(!__hugetlb_valid_size(size));
>
> Would not these CONT_PTE_SIZE aligned sizes upto PMD_SIZE
> trigger warning here because __hugetlb_valid_size() still
> does not enumerate them ?

The intermediate CONT_PTE_SIZE-aligned sizes will not hit the WARN_ON(),
as they are handled by the new branch and break before the
__hugetlb_valid_size() check. They are accepted here for vmalloc's partial
contiguous-PTE mappings.

Thanks,
Wen
> >       }
> >
> > @@ -359,6 +365,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
> >       case CONT_PTE_SIZE:
> >               return pte_mkcont(entry);
> >       default:
> > +             if (pagesize > 0 && pagesize < PMD_SIZE &&
> > +                             IS_ALIGNED(pagesize, CONT_PTE_SIZE))
> > +                     return pte_mkcont(entry);
> > +
> >               break;
> >       }
> >       pr_warn("%s: unrecognized huge page size 0x%lx\n",
>

